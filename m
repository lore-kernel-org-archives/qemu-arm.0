Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C50CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNbc-00062q-Ea; Sat, 30 Aug 2025 11:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5K0-00051p-R8
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Jx-0004cW-TN
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uj4H8KnUuiQwP+qdZY3377j43+Z3u9M3mu/jrKpfZ4I=;
 b=QQhw3fk5uy+C3IFulVwpEkzE+sLQDXZxSoDKwF4CefWYxto82GPWPmMai4dpcgiNplvmLP
 qhlBSqlfOxUyHsdLu25Nqsagd/ukewDk89OAhYa9RiZ4i8y85jk43iCk/+vcMn3znM/5Qv
 vjEHvtAk+rzzvOPRm6ZQV0JEJNhc8HY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-X1km0DLTPwqVkWY6U3KMLQ-1; Fri, 29 Aug 2025 16:03:35 -0400
X-MC-Unique: X1km0DLTPwqVkWY6U3KMLQ-1
X-Mimecast-MFC-AGG-ID: X1km0DLTPwqVkWY6U3KMLQ_1756497814
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-327b289e8easo2184038a91.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497813; x=1757102613;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uj4H8KnUuiQwP+qdZY3377j43+Z3u9M3mu/jrKpfZ4I=;
 b=AmpbO5lGpvH92izIENVYCMkNChuOyBoewYZt8Y/u7owGwDmpzDL3q2PVLb8FTZpR1O
 ri8/EWkrWeJmAiFnvMg+MaEFik80zdTtDwo1G8kPThlWFR4LGVMKRD7r41C7h5Z3DR/e
 igIqY24ghsfkYqMtt1ig2tIuSjR+y8ZRbu0PKpx6Bp6VsQEVi4Z6pZbtm+LU6btNJCS9
 WJQEoGmpPMkEBNKl1qB+52e7B13MjTVXpIEqcsDfVjyVlXWzbERcCZ3rU3hCDdx9kSkC
 cEcXgXoe7iP1bAxVrF3u6FMJNVMaawblGESi00L+IM+4BjXJeJHtB1U1RyEInpA0ZSa9
 WUmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrhfPAnoWgyLX3+C+JFefQJaTL3ED4A8Vbm2QXxqQ8HnmGIAXeffwIRfhiIlAJ+OE8JLmIQYITpQ==@nongnu.org
X-Gm-Message-State: AOJu0YxodFy11zKFpxwN6A88K/g95v6/KOoVTOO5hsE3iy2LuT1T7An3
 GVQXatFTC7OgBzQpfBevL4DrxiWRjl/FJXWgOxQNf5hIDcOZvYQg5ghrw5j9UIZkMo/ccju3zHp
 LAN2LLfKZsaU5bs07u62bschlTyAfz1mZNWjTWPaRG60FM374XZI1cg==
X-Gm-Gg: ASbGncvxW3z3oOp4UpTrDhcEtgj+8g4ioGOp8DQk1K9HVz3IhVsM4ughB8II4+0Wb25
 zyAczShGPBZNCY3C1H1/L5GxzNs44p6mq+WLPAeayfTjm9X3gK+C12FeWGECk5qpuIngbNFVhDo
 MphEPrhlDgxrLFm4txjs7aVNRm/bOSeoJoNi5lVp/T/BbtaTsVypP8C7UwirR9Kr52VeuarwXQw
 oQR5Nido2P+g3/EqenBJB0uH7bnWTO+yBDPyrp4htV4c89Yqv7XUdZMkbEJZM81SOcv20sOnlW/
 gGEakvXcbrFfIuKQCDKdb+8ekP3UtPvcJZaC7zKY49RwCMcG/fP4XQ==
X-Received: by 2002:a17:90b:1a8b:b0:328:650:4e7a with SMTP id
 98e67ed59e1d1-32806505120mr2267110a91.3.1756497813410; 
 Fri, 29 Aug 2025 13:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX7ppUrs4hGuz8FCUbJeORE/9NWU0IKJpRa3jaWUfsdfptBH+7rj1loqt6iVIjqHiVLY3Xyg==
X-Received: by 2002:a17:90b:1a8b:b0:328:650:4e7a with SMTP id
 98e67ed59e1d1-32806505120mr2267079a91.3.1756497812975; 
 Fri, 29 Aug 2025 13:03:32 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:03:32 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:45 +0530
Subject: [PATCH v13 05/27] migration: push Error **errp into
 loadvm_process_command()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-5-a4e777b7eb2c@redhat.com>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
In-Reply-To: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Steve Sistare <steven.sistare@oracle.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7155; i=armenon@redhat.com;
 h=from:subject:message-id; bh=qSL0t7f4wG7F7+1wOstaO87epuFS+Gl9p/u+kXVLec8=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdh+1fz+LtVZ9W/q4483C2E169w7lnHkZ+itJgHX5S
 r3KjQsndJSyMIhxMciKKbI0fA2QbQoojIi0fXkdZg4rE8gQBi5OAZiImgUjw7X5G9gPvFssNvlO
 +8p0DS6OY29OxkZHrypI1KisZeU+Nofhv6tT8eSTwnKOT1rCg9fwsivLBUU/Oivw9XTb2yWKjRX
 NrAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wGciXXO7LEOEtQaDs8dLPoYzqImMEDc-jBNZwdIb6R8_1756497814
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that loadvm_process_command() must report an error
in errp, in case of failure.

The errors are temporarily reported using error_report_err().
This is removed in the subsequent patches in this series
when we are actually able to propagate the error to the calling
function.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 86 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 23 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 40dae406db22dc9ddbff2f5ada92a32626b58e3b..0e9935aea3e1a214cfa0ddd0e30fa5cf925373e3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2546,32 +2546,37 @@ static int loadvm_postcopy_handle_switchover_start(void)
  * LOADVM_QUIT All good, but exit the loop
  * <0          Error
  */
-static int loadvm_process_command(QEMUFile *f)
+static int loadvm_process_command(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     uint16_t cmd;
     uint16_t len;
     uint32_t tmp32;
+    int ret;
 
     cmd = qemu_get_be16(f);
     len = qemu_get_be16(f);
 
     /* Check validity before continue processing of cmds */
-    if (qemu_file_get_error(f)) {
-        return qemu_file_get_error(f);
+    ret = qemu_file_get_error(f);
+    if (ret) {
+        error_setg(errp,
+                   "Failed to load VM process command: stream error: %d",
+                   ret);
+        return ret;
     }
 
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
-        error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
+        error_setg(errp, "MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
     }
 
     trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
 
     if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
-        error_report("%s received with bad length - expecting %zu, got %d",
-                     mig_cmd_args[cmd].name,
-                     (size_t)mig_cmd_args[cmd].len, len);
+        error_setg(errp, "%s received with bad length - expecting %zu, got %d",
+                   mig_cmd_args[cmd].name,
+                   (size_t)mig_cmd_args[cmd].len, len);
         return -ERANGE;
     }
 
@@ -2584,7 +2589,7 @@ static int loadvm_process_command(QEMUFile *f)
         }
         mis->to_src_file = qemu_file_get_return_path(f);
         if (!mis->to_src_file) {
-            error_report("CMD_OPEN_RETURN_PATH failed");
+            error_setg(errp, "CMD_OPEN_RETURN_PATH failed");
             return -1;
         }
 
@@ -2594,11 +2599,10 @@ static int loadvm_process_command(QEMUFile *f)
          * been created.
          */
         if (migrate_switchover_ack() && !mis->switchover_ack_pending_num) {
-            int ret = migrate_send_rp_switchover_ack(mis);
+            ret = migrate_send_rp_switchover_ack(mis);
             if (ret) {
-                error_report(
-                    "Could not send switchover ack RP MSG, err %d (%s)", ret,
-                    strerror(-ret));
+                error_setg_errno(errp, -ret,
+                                 "Could not send switchover ack RP MSG");
                 return ret;
             }
         }
@@ -2608,39 +2612,71 @@ static int loadvm_process_command(QEMUFile *f)
         tmp32 = qemu_get_be32(f);
         trace_loadvm_process_command_ping(tmp32);
         if (!mis->to_src_file) {
-            error_report("CMD_PING (0x%x) received with no return path",
-                         tmp32);
+            error_setg(errp, "CMD_PING (0x%x) received with no return path",
+                       tmp32);
             return -1;
         }
         migrate_send_rp_pong(mis, tmp32);
         break;
 
     case MIG_CMD_PACKAGED:
-        return loadvm_handle_cmd_packaged(mis);
+        ret = loadvm_handle_cmd_packaged(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_ADVISE:
-        return loadvm_postcopy_handle_advise(mis, len);
+        ret = loadvm_postcopy_handle_advise(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_LISTEN:
-        return loadvm_postcopy_handle_listen(mis);
+        ret = loadvm_postcopy_handle_listen(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RUN:
-        return loadvm_postcopy_handle_run(mis);
+        ret = loadvm_postcopy_handle_run(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RAM_DISCARD:
-        return loadvm_postcopy_ram_handle_discard(mis, len);
+        ret = loadvm_postcopy_ram_handle_discard(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_POSTCOPY_RESUME:
         return loadvm_postcopy_handle_resume(mis);
 
     case MIG_CMD_RECV_BITMAP:
-        return loadvm_handle_recv_bitmap(mis, len);
+        ret = loadvm_handle_recv_bitmap(mis, len);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_ENABLE_COLO:
-        return loadvm_process_enable_colo(mis);
+        ret = loadvm_process_enable_colo(mis);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
 
     case MIG_CMD_SWITCHOVER_START:
-        return loadvm_postcopy_handle_switchover_start();
+        ret = loadvm_postcopy_handle_switchover_start();
+        if (ret < 0) {
+            error_setg(errp, "Failed to load device state command: %d", ret);
+        }
+        return ret;
     }
 
     return 0;
@@ -3049,6 +3085,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
 {
     uint8_t section_type;
     int ret = 0;
+    Error *local_err = NULL;
 
 retry:
     while (true) {
@@ -3076,7 +3113,10 @@ retry:
             }
             break;
         case QEMU_VM_COMMAND:
-            ret = loadvm_process_command(f);
+            ret = loadvm_process_command(f, &local_err);
+            if (ret < 0) {
+                error_report_err(local_err);
+            }
             trace_qemu_loadvm_state_section_command(ret);
             if ((ret < 0) || (ret == LOADVM_QUIT)) {
                 goto out;

-- 
2.51.0


