Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5689CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:27:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Rtd-00087c-N7; Tue, 30 Sep 2025 00:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rsd-0006HJ-Cf
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RsQ-0003Iz-P9
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZFgIyu58WfEQqW2h42CjJC1Xq1s41kauJH5QgHpv0Q=;
 b=LqDPq9KDmPEivq2IrowZB0Kpmr+e9mC14EErKNYvdyp+aK2FZNF1dahY60JIlGZKs/PEUg
 3KJFK2qYJ7F25Et5AV9IMaSmanyQMATfKcrS4K2AiFwoO2ccHvzR3biSZK2yoKvzM8aQo7
 +kirMUhGNAFMl9PnTXz28wFUdWJvAxE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-fUAJEw1HOA--X9w8s6KZ-g-1; Tue, 30 Sep 2025 00:22:04 -0400
X-MC-Unique: fUAJEw1HOA--X9w8s6KZ-g-1
X-Mimecast-MFC-AGG-ID: fUAJEw1HOA--X9w8s6KZ-g_1759206124
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4f93fe3831so7416459a12.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206121; x=1759810921;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RZFgIyu58WfEQqW2h42CjJC1Xq1s41kauJH5QgHpv0Q=;
 b=VhPujVEiD1BKmMGl2mXFp5luUTEaSoD7zt6vX2fAJwliqYBAjkpjMno+mAMI69/7tn
 AFjoCKywvL6cCBM8AqluhVwFZPalkQvtH0JgqixEcdOUSuaVy0+h/zGB0ZnnRnncrE6Y
 uSSGDkKsj6gICh8MF4JAqjWk4EdkZN7ClSN5B8/DDUGMJiOw9ZJPlH0RktSXlQkUFypY
 ylQua6atvD1js3hJWNlVoD9jlh5Ji+l8mu9YrwRumIqeEPU4WKCbe8VjOygUzKWYZpWs
 4aI8gsK9HR5LaZBq9OUhQAPegxava3Nm6AwG+Mb7kaz2rpCdkxWyuGx6ULJD7+nnqAku
 2pfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVluqxhfkhPldglCxkRf6Fyt2ht6eujZq08R1afHM5jVQTmWg844Z7wiQVqKgVEdblxYE/nrHbJJA==@nongnu.org
X-Gm-Message-State: AOJu0YxhoKxey5rJCxn7O6Ftxqj6uYRj6jBtC0sankse+AIn6gWjoXGh
 oxZmk93IQspCwLRWxMHNfUoCJDl2QZfeDpyN3A4PU7EiC0fgwWCGb1SbhUMQZen8DmoHOm2T9xE
 SwJ+MbDP1F2IcNaNWRxwmD/hTubF3QoMO5+LCrEroKc+MdbwniWmrMg==
X-Gm-Gg: ASbGncvi2zrgVQPspYJ+2f92H6/UKz9rS3Pht+dvNSacXHffcuwm+Hp5TFk1J0Fd43r
 hA2l2MERTgWtdDCguBdqXGlWTgBkWiaRQLtgJwliwrgmwjRXsCEaSlM4XzgjmuyGEXPlWVtIXRH
 6i5Ism0DD88BIo/uNjtoTlv+0TMCHPidXYlkdn/kfJNKAruwEA3LfHY2MWQYJpki6cWw8rBW0O+
 7OSQjwJq5PcHsNzeL94DYFg8HbEixE9rkSDKuDeChiIF3T95YRD3FU0bblKh07zOt78lDNQkEic
 SJR4cGYy6jD89VRgJkjReaNpBL6iDIcABAEsojztWwhtH3rIN0gQLpN7pg==
X-Received: by 2002:a05:6a20:7f99:b0:2d3:8d14:7fc5 with SMTP id
 adf61e73a8af0-2e7c508ae74mr21676368637.18.1759206121100; 
 Mon, 29 Sep 2025 21:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgJMn/39BgbCYxF3yX8QyqA1aiaDtENLzgxUs4oXNmt23AM87zrc8u96jY1jbfPwwVYc6sLQ==
X-Received: by 2002:a05:6a20:7f99:b0:2d3:8d14:7fc5 with SMTP id
 adf61e73a8af0-2e7c508ae74mr21676331637.18.1759206120693; 
 Mon, 29 Sep 2025 21:22:00 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:22:00 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:30 +0530
Subject: [PATCH v15 21/26] migration: push Error **errp into
 loadvm_process_enable_colo()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-21-84afd3af1e47@redhat.com>
References: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
In-Reply-To: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6103; i=armenon@redhat.com;
 h=from:subject:message-id; bh=zte8ixeDasOZfSQPpJa8vSpfgjHFiiT4vMZ76A6Wkqc=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKCGN9boNG95P2LQ6eqHxwqpdnBu+8trxazNf4CsLV
 LsmklndUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCKRrowMT6bptpxUXh2wwzbX
 JDRaRb4nonSJlfnaMxvntbWls98MYviftn/zz6jftV9DXjqH1K3vTt1YxZlqZJmuEqfBpZnr/Ik
 fAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hPJDN2czxEVcDaoXEQXlb459ZRiBiP0wcrOX3VVGKtI_1759206124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_PASS=-0.001,
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
It is ensured that loadvm_process_enable_colo() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
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
index ce17dcc1c0ab46a851cc841d9f397c87f5d43d16..2f55f2784b49c4f36e83c380cf9c3b428016739c 100644
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
index 2e8776768fcc7d139b9f06fff9285673166a8951..8937496d9f667f8f524f73bab80dd7e711973a1c 100644
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


