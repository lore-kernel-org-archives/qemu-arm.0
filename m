Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B27C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:14:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuv-0002AH-Kj; Fri, 08 Aug 2025 09:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHLk-0007Zz-Kd
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHLh-0007R9-Je
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGz+pEiXmUMAsQVHsZAatBKd/T5a110fAjdAVhA6b0c=;
 b=IEmOYW3kr+DwZkb0Kl9b/Wrbpo3Q8IDWXTqH4eBcLON+1E8oDBfuwV6xHBCizAbN5ar5Sc
 FRwajHgqo5FW8735RrdEwvj1FfIvLGexZ7HCgElFwIvVL2Fn2Sv45ikediQjAyCJ4G1PRF
 kYcTjH51/yaX6ChaULl0tEH93st1J2A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-0LiS54CoM5uel6YJ9YG_Xw-1; Fri, 08 Aug 2025 03:17:04 -0400
X-MC-Unique: 0LiS54CoM5uel6YJ9YG_Xw-1
X-Mimecast-MFC-AGG-ID: 0LiS54CoM5uel6YJ9YG_Xw_1754637423
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31f030b1cb9so3350105a91.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637423; x=1755242223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGz+pEiXmUMAsQVHsZAatBKd/T5a110fAjdAVhA6b0c=;
 b=GIlMj/Dnqhk/OoGYf+qRV7dmHwTCsAO3XSuuQnSQGqHZo2wpd1wbO/jbN2eh1b6Abf
 d5kXzXHlfYRcWfV7JR4q8D5Ep+Lic/QB7ZkdhqEKNKP1KeR8Ia6UA10d40Ro7O3LHqhl
 ZspCB/Q0aHZo902ISUC8JkcTbOvqu+ajQOKo2DUkgQEjYFCXSSOFWyMd9IkoLhZTCqbE
 AE/pR4zt682v5GrKrd77U35bdlaWcwB+YJUe73/JZFcLSvqr3ZVNal2U789xhvQY5yJ6
 68pVe36x9MOqZTkYPIjwUZCTAf1C9+TbskuRhJ7rv2yRLyKgVrDngP+zt1KhWzjLhZkn
 Jpdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Dj5si/K7ew/Ycpt/nsmkcG9UBKxg5rAcWeCQEIGyJNJ3S48FTAbZSHNbk4IJXPRp++bn74s1dw==@nongnu.org
X-Gm-Message-State: AOJu0YynpEu9fZKR9Www53CH8ZbJFG8qFDEXkq9K48lEkd98BOQLhbd/
 JTkTnmbcV+ABSNW22IYWXgJb/UTeV1dyoQZ3K/eH6/kH2EBMMTt31HsEPY13jyHzaokLhuHK7E/
 On5Tx2gzb0ew2dUxCpIzyWYFz0XuS9Zx5YAXULiYUp3iIr3Dn+SOqug==
X-Gm-Gg: ASbGncthpxeeChrb7hY4JUgVUIiuA1J0u5Hfgo8yjne0ua5jDuJGALsMqrajZSWeq8L
 By4JtwcjivBNQYhbh/70nIQngqbvUQMnzMChOVJLwZMaeFI1vPZgxCEo5aqdMtMLg13bZrFR++Z
 r7/VljyQ+NS3N7x0IuasmjWn8KqkiRD4FEXwqfFi0kBPGk9S8ftanBKUi1bdbKtIPRwtQM3hOf0
 Elif5KbFMG8MaG75dNQRd/t/axHiEHq0UjPOIud2ggO0A8knmBqDSYJA9Uzka9Zh1wWcptcChPo
 735Tcok200KyqLNhV+0ClmY7euj/2Su90f9Gzb0WaDmFVCs/5cKZaQ==
X-Received: by 2002:a17:903:1a44:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-242c19aaf6dmr26443385ad.0.1754637423440; 
 Fri, 08 Aug 2025 00:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqNBLtNYG5TbfwSVJqO+yyHBT8LSNhXqnEktVEw9A8ooWaxYEORAIWhZJeOMlayjJ36TpS8A==
X-Received: by 2002:a17:903:1a44:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-242c19aaf6dmr26443125ad.0.1754637423088; 
 Fri, 08 Aug 2025 00:17:03 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:17:02 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:42 +0530
Subject: [PATCH v10 16/27] migration: push Error **errp into
 loadvm_postcopy_handle_listen()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-16-3e81a1d419b2@redhat.com>
References: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
In-Reply-To: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=armenon@redhat.com;
 h=from:subject:message-id; bh=vBw3qJ6drqDLoD5OBi9CYCpF6NZ6n0rBrGUXpYaRnMA=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVcnsvtHuG/QVt2jcbpgwpedZ999rz3CfNZow8I1v
 oITXh9S6ihlYRDjYpAVU2Rp+Bog2xRQGBFp+/I6zBxWJpAhDFycAjARzQKGf2YLZ0/4vnhehZCH
 dYIA6ztlq/R45kYvFyNdbvuwGXcSGBj+u1YfjU6qMzuwPrN+/pKZ3vMeHH5cs9w5a2n+c5vTYZN
 P8gAA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOle64OMkthJVXQh-qVZmjHD_hl1kGynHpzl4718ic8_1754637423
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Aug 2025 09:13:19 -0400
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
It is ensured that loadvm_postcopy_handle_listen() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 69c482b6fef5afca9ca02f9ac86339ffe1524e2a..d5082ee1cbce6a870871aaf78ed47707787ffaed 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2181,15 +2181,16 @@ static void *postcopy_ram_listen_thread(void *opaque)
 }
 
 /* After this message we must be able to immediately receive postcopy data */
-static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
+static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis,
+                                         Error **errp)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
-    Error *local_err = NULL;
 
     trace_loadvm_postcopy_handle_listen("enter");
 
     if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
-        error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
+        error_setg(errp,
+                   "CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
         return -1;
     }
     if (ps == POSTCOPY_INCOMING_ADVISE) {
@@ -2212,14 +2213,14 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     if (migrate_postcopy_ram()) {
         if (postcopy_ram_incoming_setup(mis)) {
             postcopy_ram_incoming_cleanup(mis);
+            error_setg(errp, "Failed to setup incoming postcopy RAM blocks");
             return -1;
         }
     }
 
     trace_loadvm_postcopy_handle_listen("after uffd");
 
-    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
-        error_report_err(local_err);
+    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, errp)) {
         return -1;
     }
 
@@ -2624,11 +2625,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_postcopy_handle_advise(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_LISTEN:
-        ret = loadvm_postcopy_handle_listen(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_listen(mis, errp);
 
     case MIG_CMD_POSTCOPY_RUN:
         ret = loadvm_postcopy_handle_run(mis);

-- 
2.50.1


