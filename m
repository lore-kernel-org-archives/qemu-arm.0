Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51606CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RrT-00051n-Sa; Tue, 30 Sep 2025 00:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RrP-0004yT-3Q
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RrH-0002wj-QO
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sWMcebPJELAlAAoxkMwEbCrmASRccS7MWf2yvwqa0o=;
 b=GhGF+Y6v2Tl5YS/kOgiuTuo/zvVNUzpR6tukc2OcT/cI85r3TYHaiOL5LfCW8uTNb5FkM+
 RxpRLnMch1IB03/AT88orhKjaCGfvNQjYctApbRXKV0cgHxuaIZzjN51vnYgvxgxSgeubo
 ILDbJziGyRviTmnQs3l1I1XzFH0YUhM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-UjDxEjpMPpuv8_BTIbKQeg-1; Tue, 30 Sep 2025 00:20:52 -0400
X-MC-Unique: UjDxEjpMPpuv8_BTIbKQeg-1
X-Mimecast-MFC-AGG-ID: UjDxEjpMPpuv8_BTIbKQeg_1759206051
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b55397041dbso7279169a12.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206051; x=1759810851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8sWMcebPJELAlAAoxkMwEbCrmASRccS7MWf2yvwqa0o=;
 b=p/6G/7fmTLagKnbhU6vG900lYPumisopSKrxjhtgBTaCpQqH+noAqyEysFVwsoxeHu
 sBjMAPYLqh1Q+Lis6fKEQr2mwGNRRf2Pag3r6Qe16DsLunAYKPc2WMhsDNngpr9OunCO
 3yw4QeN+smHRmR8Hj+hDF+v7WbnZCUlq6s2gSbEfEY4VGqF8qxO9NSdvhcr/ueWjVQik
 nmwyPKrUV/vO8i03z+H76aMryEHaifLgs5A9C2xtsjb0rR3Kaj8izXCZfkHizliyLfxf
 K/eK9f9sVJrPd1ZLTA1K0ubXD9b1jO2KO19BMGWLhRbyeZAlrMZ9zB+kJUfvXdWCpVYp
 9s5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWON4SxD14inDnLqDwBTOTZtJAl2iUpQUvr1VHLqwqtLkO49zf/4xUEhPwD2dNMu/+gICX4p8x7EQ==@nongnu.org
X-Gm-Message-State: AOJu0YyzbU5+vcMEMKtkViOZMkLD2+mRFk7v365ogtUukSpaD2InVjcl
 Y7eOAkRDwCF1vts2s9d+EEw7C1jmZqeM36hIghkZ4SxF4FRDLNxnfa03XWEvnsncf5y4FjZ1D7n
 X4vwDoVzASEXvr5po4ucYokfqJiWgsY9Udmbz5cFgmmBaO3QmoMNeig==
X-Gm-Gg: ASbGnctjLwV2G7azQXnsJmt3tF2dI+MyVI8xSdENEufof81cbognXLWcMJGwT0td34z
 TpYLVCkECrykfipbqJWieoK+N73NCzOx1PziFsoIaMisKMM4GfOW9410qf+oc7R6sEcTMtO9ZeV
 63OAb9pTyAkWK68RPgeiDL8SBaUB/0Vh+O0MQWu5PMk3Ce+GvSU5e5g/hIQlLTreNPVQXqXcAOO
 +jnLuzuJAEkKdsFay5Z8kIHcDZHbCoo1f/5cp3tBrQDFDnSviFsOf3ZlnuFbB3QERrfkk79rJjS
 SV95C/z0lpEuPlWPx5VmjGhFyVlufZOlLpoVra9a+yLUPOWCkrhwvznnrg==
X-Received: by 2002:a05:6a20:a11c:b0:2f9:dc8d:d2a2 with SMTP id
 adf61e73a8af0-2f9dc8dd60emr17132449637.2.1759206051193; 
 Mon, 29 Sep 2025 21:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG99ort9d0mYRhWnvmY06q9sN2iau68DXEhhR0gFxsGwB/RPVRnjR5M7zh+0Io8poted7kArw==
X-Received: by 2002:a05:6a20:a11c:b0:2f9:dc8d:d2a2 with SMTP id
 adf61e73a8af0-2f9dc8dd60emr17132421637.2.1759206050771; 
 Mon, 29 Sep 2025 21:20:50 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:20:50 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:23 +0530
Subject: [PATCH v15 14/26] migration: push Error **errp into
 ram_postcopy_incoming_init()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-14-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4909; i=armenon@redhat.com;
 h=from:subject:message-id; bh=+86rb+2n+UvHqo2/Gvfyw5xqR64fl6H2vw4i4a2ZU7g=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMH5PytOX5mv2Jic9qpevfD3o/dfGf9NSrF+8+h5m
 RD/6pnCHaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACbiL8/IsM+yZLnoShHXpfuv
 yenfP+OUEvZEl93n2t8k3wTz0+e4Khj+it79aJwXfuQb420O7bc+Wz0ZVfbP+JQQOklGpnuOY6M
 tMwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M8U0IAJCFFlyd88MX1WK0vJru15Rk49BOZKFZO6nVKk_1759206051
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
It is ensured that ram_postcopy_incoming_init() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/postcopy-ram.c | 9 ++++++---
 migration/postcopy-ram.h | 2 +-
 migration/ram.c          | 4 ++--
 migration/ram.h          | 2 +-
 migration/savevm.c       | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 01721723434d5605fe7a5e400a4c7a709e6e8b2b..5471efb4f01355b7e400aec70d9acccda879e0ec 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -681,6 +681,7 @@ out:
  */
 static int init_range(RAMBlock *rb, void *opaque)
 {
+    Error **errp = opaque;
     const char *block_name = qemu_ram_get_idstr(rb);
     void *host_addr = qemu_ram_get_host_addr(rb);
     ram_addr_t offset = qemu_ram_get_offset(rb);
@@ -701,6 +702,8 @@ static int init_range(RAMBlock *rb, void *opaque)
      * (Precopy will just overwrite this data, so doesn't need the discard)
      */
     if (ram_discard_range(block_name, 0, length)) {
+        error_setg(errp, "failed to discard RAM block %s len=%zu",
+                   block_name, length);
         return -1;
     }
 
@@ -749,9 +752,9 @@ static int cleanup_range(RAMBlock *rb, void *opaque)
  * postcopy later; must be called prior to any precopy.
  * called from arch_init's similarly named ram_postcopy_incoming_init
  */
-int postcopy_ram_incoming_init(MigrationIncomingState *mis)
+int postcopy_ram_incoming_init(MigrationIncomingState *mis, Error **errp)
 {
-    if (foreach_not_ignored_block(init_range, NULL)) {
+    if (foreach_not_ignored_block(init_range, errp)) {
         return -1;
     }
 
@@ -1703,7 +1706,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis, Error **errp)
     return false;
 }
 
-int postcopy_ram_incoming_init(MigrationIncomingState *mis)
+int postcopy_ram_incoming_init(MigrationIncomingState *mis, Error **errp)
 {
     error_report("postcopy_ram_incoming_init: No OS support");
     return -1;
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 3852141d7e37ab18bada4b46c137fef0969d0070..ca19433b246893fa5105bcebffb442c58a9a4f48 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -30,7 +30,7 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis);
  * postcopy later; must be called prior to any precopy.
  * called from ram.c's similarly named ram_postcopy_incoming_init
  */
-int postcopy_ram_incoming_init(MigrationIncomingState *mis);
+int postcopy_ram_incoming_init(MigrationIncomingState *mis, Error **errp);
 
 /*
  * At the end of a migration where postcopy_ram_incoming_init was called.
diff --git a/migration/ram.c b/migration/ram.c
index 7208bc114fb5c366740db380ee6956a91b3871a0..6a0dcc04f436524a37672c41c38f201f06773374 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3716,9 +3716,9 @@ static int ram_load_cleanup(void *opaque)
  * postcopy-ram. postcopy-ram's similarly names
  * postcopy_ram_incoming_init does the work.
  */
-int ram_postcopy_incoming_init(MigrationIncomingState *mis)
+int ram_postcopy_incoming_init(MigrationIncomingState *mis, Error **errp)
 {
-    return postcopy_ram_incoming_init(mis);
+    return postcopy_ram_incoming_init(mis, errp);
 }
 
 /**
diff --git a/migration/ram.h b/migration/ram.h
index 921c39a2c5c45bc2344be80854c46e4c10c09aeb..275709a99187f9429ccb4111e05281ec268ba0db 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -86,7 +86,7 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms);
 void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
-int ram_postcopy_incoming_init(MigrationIncomingState *mis);
+int ram_postcopy_incoming_init(MigrationIncomingState *mis, Error **errp);
 int ram_load_postcopy(QEMUFile *f, int channel);
 
 void ram_handle_zero(void *host, uint64_t size);
diff --git a/migration/savevm.c b/migration/savevm.c
index d145e7b1e55942fbcca57cc309327958526a6514..338d1a9756a991ace0a54f80b1003df33f141264 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1989,7 +1989,7 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
         return -1;
     }
 
-    if (ram_postcopy_incoming_init(mis)) {
+    if (ram_postcopy_incoming_init(mis, NULL) < 0) {
         return -1;
     }
 

-- 
2.51.0


