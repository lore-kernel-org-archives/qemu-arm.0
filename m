Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62DCAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:31:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGXL-0001V9-RW; Thu, 18 Sep 2025 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXE-0001KE-Hj
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXC-0003GH-NY
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJPSGag0Qjlv9+IbFHR1Wh7Da0AbXrIq0eHPPw0rJ78=;
 b=E0w6OuOUoo0NLGEGSM0D2OUObURtysPeUmzdSqXX2Yy6X7TsYnlLy/7Vbl+aCDyNoD2Gef
 PqIVth2S1otyR28n9eFaoqZa/Z2iehS7T/TEfjiBQcdp2AZq2uE3UJkEMe3HZxxQrOZN/R
 JghMK1lMEn6JlJ6wud2XXwuhXOuhLkg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-uDFPC-HdOouGQ5XUe4-1WQ-1; Thu, 18 Sep 2025 11:26:49 -0400
X-MC-Unique: uDFPC-HdOouGQ5XUe4-1WQ-1
X-Mimecast-MFC-AGG-ID: uDFPC-HdOouGQ5XUe4-1WQ_1758209208
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77243618babso1175179b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209208; x=1758814008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJPSGag0Qjlv9+IbFHR1Wh7Da0AbXrIq0eHPPw0rJ78=;
 b=tVfGg/jmWSouHqVAx/HDfYjSXuserGqC5io3IhUUii5gUZ4IwVahD/VAc17MTgJHZF
 InGJcwkPYXOMGErlNa7UDOP0LxYqa69Wg2KdFx+Y/Zt2iZt2UGVqLw8BzRAhgY5yVl8X
 dX9ItWTwgf4jiAqVXGDhBIcVuOBFIZnVgO2fdlZ/JubrUJp+HC+LouDoHgEUL/jb1Tfn
 N3bBKkSL7sZM1+Uin6H8sJzo+k5gwg1fDSuTed2VKBmjbXPKRS3gcj3dgEAfVpSGVjcN
 GJhFRItwkPIQ/HwftKz1XpKulpa78kr/th/Mjm88zFZ3+dP+OP3rkzySisEBRN+KEaBn
 dREA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq7SGjJ8vm6V1cELW/d5PAGvU7I4GeLKagSu6buwRTDTmVCbdVqSZng/w6QX2TjHZTGsPJ002kNw==@nongnu.org
X-Gm-Message-State: AOJu0YzK0zUGgab/ZuHUGqCZCwNUpIQ2JgmVdtdgyrhUJC0FCXc2kYX3
 Xc2omoYinys3i+6yC5i4VaumX465rb2ZVNQluXuvLz7Et5lOKX53Vquy1z30XiQ/W8N9jNSSQsJ
 L0MLFEZBDLP45tg0vT13rPU9aM+KzMnnuLJNAmOncsQ25RCTMRH5y5g==
X-Gm-Gg: ASbGncvBCLj5ByPjZzV1QFgUaZDw4O6hOqBqanGuJGoH4qoqa80eiz+ZzQL7PXT13Z1
 iPFnzgO98tkBEoYYweH2tRIgjvRjC2NIQDEJqMOJeM/TNvvDLNO9fhtw6z0yn19Pv5pHsvXHj10
 WytWtK41JwLyFuJQhOvRbiH2gu+JPSgE43Ygv9zrdtEtSSegLU7kvy+YVSWJlWk1YM82WW8Mcai
 to3QsWXeVtWZItN/6alZB5aBKi8ZzL4njr7gFG0fsHa1AuJW7nOXCA7VdH9NZuTLPc/dXcPgzLy
 kql67aa8DX8iPi1Ju0yIWVM+rj1+bYAj/YfAsKRix5d18HkAdQU+Ow==
X-Received: by 2002:a05:6a20:2443:b0:253:2fae:5291 with SMTP id
 adf61e73a8af0-27aa1e62df2mr9640053637.29.1758209207750; 
 Thu, 18 Sep 2025 08:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEil1nSM7Za4+Dq1ZKXMd7wBNWkzFLqwXQm4kJozI1bjGEi4sykjWy4izr3AN/N8ZZmoyKi1A==
X-Received: by 2002:a05:6a20:2443:b0:253:2fae:5291 with SMTP id
 adf61e73a8af0-27aa1e62df2mr9640000637.29.1758209207337; 
 Thu, 18 Sep 2025 08:26:47 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:26:46 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:38 +0530
Subject: [PATCH v14 21/27] migration: push Error **errp into
 loadvm_process_enable_colo()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-21-36f11a6fb9d3@redhat.com>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
In-Reply-To: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6000; i=armenon@redhat.com;
 h=from:subject:message-id; bh=+LtLa1s3KBCwKzISTFaaE+ziTA/jwk32Bx4Oc//mt74=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R/pLEHsZ8LTO39u5LMOZznwut7uzdawVJ6yKZeFP
 YwU+Js6SlkYxLgYZMUUWRq+Bsg2BRRGRNq+vA4zh5UJZAgDF6cATKTuOSPD1kz7vQ8lzT9+7+L9
 yFVxO+at5Zy76zeLcLTF2Mzb8sO4neG/T3X94QsZy9+cnPVONPVXfNI3vxlSlRMrj6XplW0RnFT
 KCQA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J7GsHfZkgZMqQuhL3_claOYGmuJXwJHOSiO0By7nYTM_1758209208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
It is ensured that loadvm_process_enable_colo() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 include/migration/colo.h |  2 +-
 migration/migration.c    | 12 ++++++------
 migration/ram.c          |  8 ++++----
 migration/ram.h          |  2 +-
 migration/savevm.c       | 26 ++++++++++++++------------
 5 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 43222ef5ae6adc3f7d8aa6a48bef79af33d09208..d4fe422e4d335d3bef4f860f56400fcd73287a0e 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -25,7 +25,7 @@ void migrate_start_colo_process(MigrationState *s);
 bool migration_in_colo_state(void);
 
 /* loadvm */
-int migration_incoming_enable_colo(void);
+int migration_incoming_enable_colo(Error **errp);
 void migration_incoming_disable_colo(void);
 bool migration_incoming_colo_enabled(void);
 bool migration_incoming_in_colo_state(void);
diff --git a/migration/migration.c b/migration/migration.c
index 16250faed91781843a572fe1ad4d71a37a2847a4..5d17e65bbf4c044ad9aac0f5f3fc9f5fefd71230 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -623,22 +623,22 @@ void migration_incoming_disable_colo(void)
     migration_colo_enabled = false;
 }
 
-int migration_incoming_enable_colo(void)
+int migration_incoming_enable_colo(Error **errp)
 {
 #ifndef CONFIG_REPLICATION
-    error_report("ENABLE_COLO command come in migration stream, but the "
-                 "replication module is not built in");
+    error_setg(errp, "ENABLE_COLO command come in migration stream, but the "
+               "replication module is not built in");
     return -ENOTSUP;
 #endif
 
     if (!migrate_colo()) {
-        error_report("ENABLE_COLO command come in migration stream, but x-colo "
-                     "capability is not set");
+        error_setg(errp, "ENABLE_COLO command come in migration stream"
+                   ", but x-colo capability is not set");
         return -EINVAL;
     }
 
     if (ram_block_discard_disable(true)) {
-        error_report("COLO: cannot disable RAM discard");
+        error_setg(errp, "COLO: cannot disable RAM discard");
         return -EBUSY;
     }
     migration_colo_enabled = true;
diff --git a/migration/ram.c b/migration/ram.c
index 163265a57f26fb1dc88d9797629d58c278e9afb7..a8e8d2cc6790336625de626fee070ecc51327200 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3578,7 +3578,7 @@ static void colo_init_ram_state(void)
  *
  * Returns zero to indicate success or -1 on error.
  */
-int colo_init_ram_cache(void)
+int colo_init_ram_cache(Error **errp)
 {
     RAMBlock *block;
 
@@ -3587,9 +3587,9 @@ int colo_init_ram_cache(void)
             block->colo_cache = qemu_anon_ram_alloc(block->used_length,
                                                     NULL, false, false);
             if (!block->colo_cache) {
-                error_report("%s: Can't alloc memory for COLO cache of block %s,"
-                             "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
-                             block->used_length);
+                error_setg(errp, "Can't alloc memory for COLO cache of "
+                           "block %s, size 0x" RAM_ADDR_FMT,
+                           block->idstr, block->used_length);
                 RAMBLOCK_FOREACH_NOT_IGNORED(block) {
                     if (block->colo_cache) {
                         qemu_anon_ram_free(block->colo_cache, block->used_length);
diff --git a/migration/ram.h b/migration/ram.h
index 275709a99187f9429ccb4111e05281ec268ba0db..24cd0bf585762cfa1e86834dc03c6baeea2f0627 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -109,7 +109,7 @@ void ramblock_set_file_bmap_atomic(RAMBlock *block, ram_addr_t offset,
                                    bool set);
 
 /* ram cache */
-int colo_init_ram_cache(void);
+int colo_init_ram_cache(Error **errp);
 void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index 13a809564aebf6346228f46fd60f611ba6104bea..8e891243dc1e7f5d3bc3a4326c6c4a2f5c32e1a2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2515,15 +2515,21 @@ static int loadvm_handle_recv_bitmap(MigrationIncomingState *mis,
     return 0;
 }
 
-static int loadvm_process_enable_colo(MigrationIncomingState *mis)
+static int loadvm_process_enable_colo(MigrationIncomingState *mis,
+                                      Error **errp)
 {
-    int ret = migration_incoming_enable_colo();
+    ERRP_GUARD();
+    int ret;
 
-    if (!ret) {
-        ret = colo_init_ram_cache();
-        if (ret) {
-            migration_incoming_disable_colo();
-        }
+    ret = migration_incoming_enable_colo(errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = colo_init_ram_cache(errp);
+    if (ret) {
+        error_prepend(errp, "failed to init colo RAM cache: %d: ", ret);
+        migration_incoming_disable_colo();
     }
     return ret;
 }
@@ -2646,11 +2652,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_handle_recv_bitmap(mis, len, errp);
 
     case MIG_CMD_ENABLE_COLO:
-        ret = loadvm_process_enable_colo(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_process_enable_colo(mis, errp);
 
     case MIG_CMD_SWITCHOVER_START:
         ret = loadvm_postcopy_handle_switchover_start();

-- 
2.51.0


