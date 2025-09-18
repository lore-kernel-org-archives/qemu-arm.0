Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFC1CA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWJ-0005xG-1t; Thu, 18 Sep 2025 11:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWC-0005kM-9k
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGW8-00033V-6D
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTWUNM+v16RdqicPQUSVUg/HZymrt0SY9y6hBqA0bZE=;
 b=Mak4pHFms+zVwy9a+1psRsY42ZRQ8J2IYCbEL2WCr0mt+DGVY+dnzxKER+yYc5b+NT54AS
 tw8PryG0uoAJwOtJNpOGu1sGMZBBUyWZdg3EU6a1gR4znEQjaOK6ahHXKaqtMLSSpogKz5
 SeZvJUMSqjES3opZ4FNyyR4pm5dBTxo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-7b3A45A0OHSNKw94X9RAUA-1; Thu, 18 Sep 2025 11:25:48 -0400
X-MC-Unique: 7b3A45A0OHSNKw94X9RAUA-1
X-Mimecast-MFC-AGG-ID: 7b3A45A0OHSNKw94X9RAUA_1758209147
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77615793f06so1170687b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209147; x=1758813947;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTWUNM+v16RdqicPQUSVUg/HZymrt0SY9y6hBqA0bZE=;
 b=U22wtOrUFAqH0XbKRzdm3hgBy09oVPkaGmVdQqqcbUrDSE2hUU1/HCUW6/IAiy3Ga6
 aKjyBmLDj5B8wISu+ruX25WoniMiZiqeGVp+i15++DRh0Arok7rOO6kxJUmFGjjSDGXU
 MYk/6HiZ6JCpgQf8+1cXMuhBkzUDQd823JOnThlIWA76FN2WJyRdvcxJk+SNxiSDRhuH
 3IH1BN0yoDqfMDVBNJMOms49QQGfDP2szwwOgeNvSh5f2ikArx7+r2PL5sfRRh41u0tT
 M8bAJZ7m4eG8irq2QCjT3u/gc526hm4r38VG7MHwFzRMjL/V+iO40NnF8SBWrDbvvCz4
 EgsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzRMIFVvwfEzqU37ArQVadrrqh3L5QZVO9+tetUN4OtPgXYNY2E0PTt18kvV424VnboiiV2qjH2A==@nongnu.org
X-Gm-Message-State: AOJu0YzMw7lmZUSGBbFVRQXo0ptaH+PFg2tVT3vDKDHzWCp4WfmduRJA
 j4bSmVgVnmSVlG+FydKgK5gMKrZroMnx1CXEgpcNSJnkKoY5Hktf7q2sGCQHz8TrRu1MsOX5hts
 V/ME0JvefDeYCphFd948IqI07+Hiy5+rLg5JSkpP1D3caR2vv5nRUKw==
X-Gm-Gg: ASbGncsMzkmZ37YpsvucXgc9q1FNIYxR3x6Pva36IBVFvvf3U+VlQNVTfh/DOVxEKcb
 Q3+8UtqCv3TEi3EqNHzEf3hZFepLctC9445zPTU769TXU4yJin3VkuVxMHbfpSdCS06rObBLcxI
 XoHmWYkKnLIS1a8VqtkrLSey6in1l9Ms7Kixza03jA7dwSef6sQUpl4T2qgsdxZ8in90cq12UJL
 96PqW30/x9HGuquk7NOHf92fpmMpbIvAREeCbmizK5u3qU0sdJ6aoW0zn9nucRfXvxbSlgZWKWA
 aGLLqeZQPJJS80R/8+XdZOOHNDFK++BwmEnH5RDSQA5EllOKe0oSQg==
X-Received: by 2002:a05:6a00:2e94:b0:772:86aa:ed0a with SMTP id
 d2e1a72fcca58-77bf9074a10mr7866386b3a.25.1758209147135; 
 Thu, 18 Sep 2025 08:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL3TrqGnADVsga37YrtTY8aAsF5vQqest3wrqepncC63N9W8kxEjr8izw20zTt3Sy8FTA0hg==
X-Received: by 2002:a05:6a00:2e94:b0:772:86aa:ed0a with SMTP id
 d2e1a72fcca58-77bf9074a10mr7866343b3a.25.1758209146747; 
 Thu, 18 Sep 2025 08:25:46 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:25:46 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:31 +0530
Subject: [PATCH v14 14/27] migration: push Error **errp into
 ram_postcopy_incoming_init()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-14-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4806; i=armenon@redhat.com;
 h=from:subject:message-id; bh=NxHIEIcsn6ki3pjI+1SDVs7doJTeFpfWjxBGpIKPSXQ=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R+NcxU3blCK7/XnCb/Vt3dbtUzH1pAnilctjikKK
 2SHp2zqKGVhEONikBVTZGn4GiDbFFAYEWn78jrMHFYmkCEMXJwCMJEqb0aGi8tuXeBqVmTVsfps
 qaql+OFkyWGrJyLz75+0Zp5/Lzkmh+GvxL+FinP7ynkcGGa42H2+8ufpe1O1brdJD7XCpp74uEy
 DGwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x-Sdsbg_fq8zViDwcM_lWCh6hJ9vnnM1hny3yeAJjCw_1758209147
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index c079942b7ecb959b3b668b977174d906f73c2777..a1b606318f2ae8feff42b759ad308ebbd07318b7 100644
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


