Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF5FCA0EFA
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:52:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0yI-0008Ix-RG; Thu, 21 Aug 2025 04:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0x2-0004cN-SX
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wv-0001MH-DW
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlMHYTzuC0OJNbmajsR6kql8v59Nbj5zk+o2AatFeoc=;
 b=OfaulDsn+bAHSiMqnrUJgjmMWFq+MG7PkABdnvoay+9Cvjl4euVa1q3L47CtMcjvDLAlr5
 JLeSDLTbq4PCCZaySpAeB9ylF5UrpjpQkmA1UkQ0tNFcSdrHsldPQDQrzd1KXjibuWdIV4
 bMxcj35Zj9r7gFPy7EohvRZVLzL7SP4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-G3teQ_3aP1SJrfZ07V_ADw-1; Thu, 21 Aug 2025 04:47:05 -0400
X-MC-Unique: G3teQ_3aP1SJrfZ07V_ADw-1
X-Mimecast-MFC-AGG-ID: G3teQ_3aP1SJrfZ07V_ADw_1755766024
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457efb475so9852875ad.0
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766024; x=1756370824;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nlMHYTzuC0OJNbmajsR6kql8v59Nbj5zk+o2AatFeoc=;
 b=pKxnHIgCePdh6BJMCwt8bVzQZBaWAicoF+SFnE/rhU7h5QSTr5KWq3k0nxHvn/29fD
 742WcgGOEkZvTRRPRwC8l1piDoZ+KX/Ng21T0Mes0yTbllRYCoDZxGCXgt0T++6Etwmu
 5nRtCiWHYW3Z3Bm35ZaD0aWu/ImhFuUiwrc8rbcHFX/3dSZm858RJNzlm2cPXG2NkSi8
 FjqZ7icjyne1LA9hDhSMp2gX5BnbxgKyG55IKNaf7cpbzCUqx9uHUPoimsIzfPIwmgQd
 1o+rnzC1lIYnGXPDwky2/cZKH7xcVbZ17xoW9Zk7DyNDefk4JNs56L1PqsN1tZ2FhEwr
 Ec4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULX8zH6GNrOv7MK/bSL8Svv/HfD90Ph1bC3nBPiNakVtfGRdafAGObdPngGxpU+D2GESJmBDKWZw==@nongnu.org
X-Gm-Message-State: AOJu0YyrAe3ITSQne4OPxB9Jnjj1A5rXfCJHq8D3ZUBKJO3Y37CQU2Zc
 De0wlpFmjae4KKpHXUrTrHlmB5RwAN0tyEFnkKCS4RRvo52SqH0XapRJhYoT25do9Pbq15VdQP/
 UuROTHXSg6PFHs0+jxU/nXGBeoAsSV8n0OVLtS7inp3FWZg98AGxlCA==
X-Gm-Gg: ASbGncsmQ29H2nOAqGFF1lcU/b5m68WA4EFFMBK2vUxYDPEbq3sSf6RBB9ZAzal+xX/
 6YoQ6V5O4cjNXlcQdCK7Bm/xJJ2al9FksfApRpkFZffJiCqoSYDvfpbyqRdVjS/K1ogV/k4MyUp
 Vun8balYV+Jti2QtjU6Tl+BxGrwQM4sgXLG0TCvYgvTbFX06G2x/a/DPY6yIQnJiVThhuz/aMkH
 EtuKCZHoryjGURdKAUkF9b5Ec1XjvxchGQSBAj7JbcS5w8X0OUhvengRghFl6eTBNympA+gKeMv
 AiEbdzU+c9tj+ka/wLrjNJc3Tx0VECe+XhMRhuVv6t8ySr/OqrmG
X-Received: by 2002:a17:902:c942:b0:234:ba37:87ae with SMTP id
 d9443c01a7336-245febefa70mr23076825ad.4.1755766024416; 
 Thu, 21 Aug 2025 01:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzUglKEWC2d7VXmkQ+cuWP6XoL5D9VThNiuRuRV62zSz5khkWbAMy17K7BLi+RGwEoVzddUQ==
X-Received: by 2002:a17:902:c942:b0:234:ba37:87ae with SMTP id
 d9443c01a7336-245febefa70mr23076465ad.4.1755766024008; 
 Thu, 21 Aug 2025 01:47:04 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:47:03 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:08 +0530
Subject: [PATCH v12 14/27] migration: push Error **errp into
 ram_postcopy_incoming_init()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-14-72b803e707dc@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4806; i=armenon@redhat.com;
 h=from:subject:message-id; bh=EabNSGRQLm6cwS6/ht6Yf7DNHZhUD2jPEfZ+gH5fQEk=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOylbqy+8/JUicMno1ydpAX7fFNWqsN/qci91mBdmc
 26uMLzXUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCIXRBn+JxYs0LFe+bCOe1ns
 jizHxgfuZ9a0f6vcHrcyVZRBa4dDMyPDnyRtgVjfWWpbn82P5F7y5t87pcLF32TY+cVmblvGqSr
 IDAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O9SESooQNjoXqZQIlWGIj6WnGCn_Cr6cD6sabut1EIg_1755766024
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
It is ensured that ram_postcopy_incoming_init() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/postcopy-ram.c | 9 ++++++---
 migration/postcopy-ram.h | 2 +-
 migration/ram.c          | 4 ++--
 migration/ram.h          | 2 +-
 migration/savevm.c       | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 45af9a361e8eacaad0fb217a5da2c5004416c1da..05617e5fbcad62226a54fe17d9f7d9a316baf1e4 100644
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
index f13fecb5cc4778974c883fbbc007b0cd18d90e64..e65b9b57a7458d29956604da034f4c80b3bec3d3 100644
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
2.50.1


