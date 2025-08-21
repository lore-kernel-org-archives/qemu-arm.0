Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38B9CA0FE0
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:48:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0xU-0005wV-P1; Thu, 21 Aug 2025 04:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wC-0003g1-6l
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0w5-000184-Oc
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755765975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvGqbnJX7rqX4eWZeXjnwlaKL6UBCsUGn2+S5tLqjys=;
 b=gSfPRyDOzt9+zpxQD2c/W8rTvlM9GS2uJfyWpyWNepGCEuRxTNIVjhzRV2IFPb4qF+Eomj
 SwL+1S4l8ZN6gR7LhYqlWo+ASsLMiCllv96fTgq2lbjltbnI5WroQabXuvQqc1QW/8g5ZL
 bVFZa2vSbTm9azS7Zg4O39O9d3Z8JGc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-S-xkRtboP2-3Nx7ByBQErg-1; Thu, 21 Aug 2025 04:46:13 -0400
X-MC-Unique: S-xkRtboP2-3Nx7ByBQErg-1
X-Mimecast-MFC-AGG-ID: S-xkRtboP2-3Nx7ByBQErg_1755765973
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4716f9dad2so1280992a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755765972; x=1756370772;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvGqbnJX7rqX4eWZeXjnwlaKL6UBCsUGn2+S5tLqjys=;
 b=nOyeO6exjqDn3euhXhVrwR9cpl40/Z7+o7VtjBZcqJGmyUv/Z+tSfqn7nz+lMm2V6w
 rZwsMPBHO0eP7WwjZWSTj99Ky4DjMy0OovX6B8XJCD9K3I2wSn0yPXHcTVB5JmQvzfsc
 ZAh1nXqKfASQr1KO5FFkZwwJ6OegS85D85aA6KKkoJAnHeEvKG5K/oQ6zGMfAJgxwMeu
 E0TFQoAVELUxdH27q91LrTrjqUiVfnk0dle2jnCLHqaHgpFGBhIZxJyHxL68Uorfq9rB
 giNtBcgDppMe6qItqmh58A67o0emEfXjdLeAimDLm95Gm32p/r4D/9w9Wj+kVchmZ4Rj
 9m1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDL8FjUgrymyTI7EEFaInwmAvye8om4T78K2gQcpX/yyhy1DxNL3JZiaQNHbHhvgUmlzbjS90QvA==@nongnu.org
X-Gm-Message-State: AOJu0YzZJkSwb2IMMayvF2LNixHv1j2okNelyI7lcmWS0OkWXHr81dM1
 +cSKIqGBKhpvdqEVKOatB/E+krvC8C3t3wg/BstuExbaEzYqgxS4oon0S0E2vpFuiw7dbDcfzCd
 YxiNE6erW+o79Cwr/dpIwSSvt0MH2QOL1ikZEUlZgGQKjznPCqiqEMw==
X-Gm-Gg: ASbGnctFTDabTfPDgqnNKDu4CeNsRlfJNY4+q+dPeF3DQCuikexP9157gGdWnLSkdeT
 Am6pqXz9bMr5rB9ES3PZpgnMRcquu2MFQnVVeelRAUdLa9HWLFFjLWfxQgwHMQyjg25Ql7/ib1F
 qNaXKD9UGi6H0iXyBIGEeIiICrwv3VSB6BBMqq4GgJrnHB2wJCBOwsK9nRYY0op5B48UShf01Vr
 KnI8ePzUt1mCvcLgyrXMeKc/eYtMAm+lhJCOQKOW2cKCUilRf6C3zbvZba++EvbGqlROsgB+PmZ
 zm7tLuHBHXQh9A9gEUS6AIQUssT2GXS1uZKaGG0SsQsFkIjjfi7N
X-Received: by 2002:a17:903:2f10:b0:245:f002:d67c with SMTP id
 d9443c01a7336-245fedb0aa1mr21998995ad.30.1755765972470; 
 Thu, 21 Aug 2025 01:46:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXCuuC5pq+CEC/b4f9yLBVaSZLF8vNHn26Ikk4zOEqoNVSfLYExE1xySgNJHBc3JAAhlV9Eg==
X-Received: by 2002:a17:903:2f10:b0:245:f002:d67c with SMTP id
 d9443c01a7336-245fedb0aa1mr21998555ad.30.1755765972059; 
 Thu, 21 Aug 2025 01:46:12 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:46:11 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:03 +0530
Subject: [PATCH v12 09/27] migration: push Error **errp into
 qemu_loadvm_state_main()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-9-72b803e707dc@redhat.com>
References: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
In-Reply-To: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6279; i=armenon@redhat.com;
 h=from:subject:message-id; bh=Ko1zbLmZ1uvG5ie4sSUsKKEoJfQSRT9lJs4gvuHhZvQ=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO8kuTu4qH8oF/RSdlC4Yrli5ZkpjjwqzUZXA7W27S
 lYoyOl1lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmEjYKkaG3U/T47sO/+bibu/4
 XbGFrdTi3M4u69ZlTD+mWT49xGV7kuG/v2LR90Pmi+/pPPu7LnLd6w+rqkW2XHPMvBaW1ffcMuE
 ANwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G6aDOJnq6kxWJ9Vl2d7Yz4rbqViAjoS8jI62d83EMXk_1755765973
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
It is ensured that qemu_loadvm_state_main() must report an error
in errp, in case of failure.

Set errp explicitly if it is NULL in case of failure in the out
section. This will be removed in the subsequent patch when all of
the calls are converted to passing errp.

The error message in the default case of qemu_loadvm_state_main()
has the word "savevm". This is removed because it can confuse the
user while reading destination side error logs.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/colo.c   |  3 +--
 migration/savevm.c | 36 +++++++++++++++++-------------------
 migration/savevm.h |  3 ++-
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 2f524b19e6a79dcfe3861f1dfb768222f65a718a..642d17487d92c0a9508e599ca3bf524e80b6fd46 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -686,11 +686,10 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     bql_lock();
     cpu_synchronize_all_states();
-    ret = qemu_loadvm_state_main(mis->from_src_file, mis);
+    ret = qemu_loadvm_state_main(mis->from_src_file, mis, errp);
     bql_unlock();
 
     if (ret < 0) {
-        error_setg(errp, "Load VM's live state (ram) error");
         return;
     }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index b46658b62ae5c27dbe9c02f6adde2d4900b182b7..69222339e17a5320b64de2709504b2ad2cd584ba 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2105,7 +2105,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     qemu_file_set_blocking(f, true);
 
     /* TODO: sanity check that only postcopiable data will be loaded here */
-    load_res = qemu_loadvm_state_main(f, mis);
+    load_res = qemu_loadvm_state_main(f, mis, &error_fatal);
 
     /*
      * This is tricky, but, mis->from_src_file can change after it
@@ -2456,10 +2456,7 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
         qemu_coroutine_yield();
     } while (1);
 
-    ret = qemu_loadvm_state_main(packf, mis);
-    if (ret < 0) {
-        error_setg(errp, "VM state load failed: %d", ret);
-    }
+    ret = qemu_loadvm_state_main(packf, mis, errp);
     trace_loadvm_handle_cmd_packaged_main(ret);
     qemu_fclose(packf);
     object_unref(OBJECT(bioc));
@@ -3082,18 +3079,22 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     return true;
 }
 
-int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
+int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis,
+                           Error **errp)
 {
+    ERRP_GUARD();
     uint8_t section_type;
     int ret = 0;
-    Error *local_err = NULL;
 
 retry:
     while (true) {
         section_type = qemu_get_byte(f);
 
-        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, NULL);
+        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, errp);
         if (ret) {
+            error_prepend(errp,
+                          "Failed to load section ID: stream error: %d: ",
+                          ret);
             break;
         }
 
@@ -3114,10 +3115,7 @@ retry:
             }
             break;
         case QEMU_VM_COMMAND:
-            ret = loadvm_process_command(f, &local_err);
-            if (ret < 0) {
-                warn_report_err(local_err);
-            }
+            ret = loadvm_process_command(f, errp);
             trace_qemu_loadvm_state_section_command(ret);
             if ((ret < 0) || (ret == LOADVM_QUIT)) {
                 goto out;
@@ -3127,7 +3125,7 @@ retry:
             /* This is the end of migration */
             goto out;
         default:
-            error_report("Unknown savevm section type %d", section_type);
+            error_setg(errp, "Unknown section type %d", section_type);
             ret = -EINVAL;
             goto out;
         }
@@ -3135,6 +3133,9 @@ retry:
 
 out:
     if (ret < 0) {
+        if (*errp == NULL) {
+            error_setg(errp, "Loading VM state failed: %d", ret);
+        }
         qemu_file_set_error(f, ret);
 
         /* Cancel bitmaps incoming regardless of recovery */
@@ -3155,6 +3156,7 @@ out:
             migrate_postcopy_ram() && postcopy_pause_incoming(mis)) {
             /* Reset f to point to the newly created channel */
             f = mis->from_src_file;
+            error_free_or_abort(errp);
             goto retry;
         }
     }
@@ -3188,10 +3190,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
 
     cpu_synchronize_all_pre_loadvm();
 
-    ret = qemu_loadvm_state_main(f, mis);
-    if (ret < 0) {
-        error_setg(errp, "Load VM state failed: %d", ret);
-    }
+    ret = qemu_loadvm_state_main(f, mis, errp);
     qemu_event_set(&mis->main_thread_load_event);
 
     trace_qemu_loadvm_state_post_main(ret);
@@ -3272,9 +3271,8 @@ int qemu_load_device_state(QEMUFile *f, Error **errp)
     int ret;
 
     /* Load QEMU_VM_SECTION_FULL section */
-    ret = qemu_loadvm_state_main(f, mis);
+    ret = qemu_loadvm_state_main(f, mis, errp);
     if (ret < 0) {
-        error_setg(errp, "Failed to load device state: %d", ret);
         return ret;
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index b12681839f0b1afa3255e45215d99c13a224b19f..c337e3e3d111a7f28a57b90f61e8f70b71803d4e 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -66,7 +66,8 @@ int qemu_save_device_state(QEMUFile *f);
 
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(MigrationIncomingState *mis);
-int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
+int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis,
+                           Error **errp);
 int qemu_load_device_state(QEMUFile *f, Error **errp);
 int qemu_loadvm_approve_switchover(void);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,

-- 
2.50.1


