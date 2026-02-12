# Get rust and solana toolchain
FROM ellipsislabs/solana:latest
# Download the phoenix-v1 source code
RUN git clone https://github.com/Ellipsis-Labs/phoenix-v1.git /build
# Checkout the commit that was used to build the binary
RUN git checkout e879f1c2b455a98f3cb72f9757ea73c836b3978c
# Run the build script
RUN cargo build-sbf --
diff --git a/.github/workflows/weekly-email.yml b/.github/workflows/weekly-email.yml
index cf682a79ad72b855842744af87fd5bd126236e4b..155bd7a80e8149d12ba69b03620b90d976dd615c 100644
--- a/.github/workflows/weekly-email.yml
+++ b/.github/workflows/weekly-email.yml
@@ -1,50 +1,72 @@
 name: Weekly status email
 
 on:
   schedule:
-    # Runs at 12:00 UTC every Monday
+    # Runs once weekly at 12:00 UTC every Monday
     - cron: "0 12 * * 1"
   workflow_dispatch:
     inputs:
       dry_run:
         description: "Preview the email content without sending"
         required: false
         default: "false"
+      pdf_path_template:
+        description: "Optional PDF path template (supports {timestamp})"
+        required: false
+        default: "/mnt/data/AuraCore_Signal_Faith_Protocol_{timestamp}.pdf"
 
 jobs:
   send-weekly-email:
     runs-on: ubuntu-latest
     concurrency:
       group: weekly-email
       cancel-in-progress: false
     steps:
       - name: Log workflow context
         run: |
           echo "Event name: ${{ github.event_name }}"
           echo "Dry run input: ${{ github.event.inputs.dry_run }}"
+          echo "PDF path template: ${{ github.event.inputs.pdf_path_template || '/mnt/data/AuraCore_Signal_Faith_Protocol_{timestamp}.pdf' }}"
           echo "Schedule expression: 0 12 * * 1"
           echo "Repository: ${{ github.repository }}"
           echo "Run URL: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}"
 
+      - name: Resolve optional PDF attachment path
+        id: attachment
+        run: |
+          timestamp="$(date -u +%Y%m%d%H%M%S)"
+          template="${{ github.event.inputs.pdf_path_template || '/mnt/data/AuraCore_Signal_Faith_Protocol_{timestamp}.pdf' }}"
+          resolved_path="${template//\{timestamp\}/$timestamp}"
+          echo "resolved_path=$resolved_path" >> "$GITHUB_OUTPUT"
+
+          if [ -f "$resolved_path" ]; then
+            echo "attachments=$resolved_path" >> "$GITHUB_OUTPUT"
+            echo "Found PDF attachment: $resolved_path"
+          else
+            echo "attachments=" >> "$GITHUB_OUTPUT"
+            echo "No PDF found at $resolved_path; email will be sent without attachment."
+          fi
+
       - name: Send weekly status email
         if: ${{ github.event.inputs.dry_run != 'true' }}
         uses: dawidd6/action-send-mail@v3
         with:
           server_address: ${{ secrets.EMAIL_SERVER_ADDRESS }}
           server_port: ${{ secrets.EMAIL_SERVER_PORT }}
           username: ${{ secrets.EMAIL_USERNAME }}
           password: ${{ secrets.EMAIL_PASSWORD }}
           subject: "Aura Wallet Core weekly status"
           to: ${{ secrets.EMAIL_TO_RECIPIENTS }}
           from: ${{ secrets.EMAIL_FROM_ADDRESS }}
           secure: true
           priority: normal
           body: |
             This is an automated weekly email from the Aura Wallet Core repository.
 
             Repository: ${{ github.repository }}
             Workflow: ${{ github.workflow }}
             Run URL: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
             Commit: ${{ github.sha }}
 
             Update the body and recipients in .github/workflows/weekly-email.yml if you need a different message.
+          attachments: ${{ steps.attachment.outputs.attachments }}

