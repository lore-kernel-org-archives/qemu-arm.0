Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707BDCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:22:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNdv-0002F1-9Y; Sat, 30 Aug 2025 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5MG-0005wC-LM
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5MB-00053F-Em
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9sqDXkDqoF2sK/YqGONtbwmKp3jZKoCMKUxLstVdcU=;
 b=fEzhATkzHA2aImkYLG3UnsQun+U1pO3hCOVMLUhSb4EauSz2FRtvIiQwMkyZuhKsvo1/r2
 4/rJV+Bp4ADxOLE7VsJMScX6rsq12ujMxhOQDo+tl6g74UtGmuREJgxqVMC8uG8u+S9JX8
 zwUGF2gLcgoN5gbd/7TuMxH5+6lWfug=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-GU01llvoP3umu1if3oRKwA-1; Fri, 29 Aug 2025 16:05:52 -0400
X-MC-Unique: GU01llvoP3umu1if3oRKwA-1
X-Mimecast-MFC-AGG-ID: GU01llvoP3umu1if3oRKwA_1756497952
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3276575ae5bso2542654a91.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497951; x=1757102751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9sqDXkDqoF2sK/YqGONtbwmKp3jZKoCMKUxLstVdcU=;
 b=h5opSkj89wxAO/P8aw+InpBNikIujsjvCbBJSDZ1BMvYe4OdDOWY1OYyW7ieD+/ug+
 1QlvV/ffCiE5fHTV/pliR1VelZfOOR0onTtrzo+s0IGyQEeZLeT04xnbiBXxpnLDVVCW
 wkxttV5PIHixtbh7nWdiZbKfB3w+kuZZtRCZ77Xc4akwlVAyK+q5heh5+FItUtJpEMFv
 hm2ltis9G9jhp5d/js8jVw1CEhb9o50FjCfinQLZENckXdLiMM4S2e+wg5fcCIRvpP3V
 kLfxi4T8wlgpLx7v8yze50JQ2g0UPRffIhUIC2bnpqyic9lDk0FH86EBHFHJ8FBBmAXj
 XzIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWia4vtrflloBISA9aqFk8BjqDULIHizJdiUvNeya1JU0VN7rzLPtSGPmdZ/oisKkU29YYUGevRSA==@nongnu.org
X-Gm-Message-State: AOJu0YyYaSmseeVMXP1FyF6pu6AAD8X/Ji5AR4xFwMygXzAijWjWYuMx
 ECEHdZ+KGC1mR1R+8eoHhzoCuObGD9cVnEGl48VOaZ8c4Hy+RUnwvbhdYUXoiCdE2lnQ30S32m6
 OGKxZNfDKmuXFYXbwyLS5S+/piepAhgRdxVFMkvKA/rhqL2eHvU6oRw==
X-Gm-Gg: ASbGncu9shX1Zkg+wKpScYE/SLdFAZR5lNU/I2YcNyuBMWRORfTW9z0uGzyQsYCWd4u
 WwzfRohxGNT6tt53q+QMNsJLbixOJShqvVRjYHB4tFtiXf+yRuxckYmcSGPG9LsBjzepKdzq3ke
 vQ/7kj+AX1PXKwjxS8yO+RbZRI0xoaHnV/8UCeKKrA/wEaxiTGKP6yMs4Z2Eu/V9bT/EvngZrG7
 +y8z/28IiSMMaBVV309NelUU5AWXpcwW6yJg4lyX5QY5CKDMVo1Qu6qvIua1Y2Q7xEX2GYMMVDH
 QJ2WX5FvPg2vOCExN1Dft22ngNSHfQ38caFAoF2rx88h2/hWIBtiZg==
X-Received: by 2002:a17:90b:17c6:b0:31e:beae:2934 with SMTP id
 98e67ed59e1d1-32517749976mr35533647a91.18.1756497951408; 
 Fri, 29 Aug 2025 13:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUTgyfBkFNBqM9oui5JhhrtQilsuvW2FzY8uWg+vJjyy/8WGXhyhbm8a3EJVw0hiLu5ccUDg==
X-Received: by 2002:a17:90b:17c6:b0:31e:beae:2934 with SMTP id
 98e67ed59e1d1-32517749976mr35533589a91.18.1756497950920; 
 Fri, 29 Aug 2025 13:05:50 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:05:50 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:55 +0530
Subject: [PATCH v13 15/27] migration: push Error **errp into
 loadvm_postcopy_handle_advise()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-15-a4e777b7eb2c@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4838; i=armenon@redhat.com;
 h=from:subject:message-id; bh=YIrBpYmjnNrlQEW0CrE8o05ulfKM6YeYARhM3eBobvY=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdt9lh13S1bgOB+kGm9wQid21NGyf/g57jZTdgf9yy
 kRs3O52lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmMjzuYwMD1RVnvD+Eb0X/I3Z
 +tCTMI5Cq2frtyiefTFT7Vj7u4tyTowMvYp3H/OpSd2c9PtQ3o3Hgc6KgZHfU7/HfVlfUTc9bCo
 rIwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vtTwC_r37vRKgXJBoZeXD3gSx3NGaLWTYchzMJzNXl8_1756497952
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
It is ensured that loadvm_postcopy_handle_advise() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index a1b606318f2ae8feff42b759ad308ebbd07318b7..680f6e1c4bbc979f779d9fde28ab71ae234b5891 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1912,39 +1912,39 @@ enum LoadVMExitCodes {
  * quickly.
  */
 static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
-                                         uint16_t len)
+                                         uint16_t len, Error **errp)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
     uint64_t remote_pagesize_summary, local_pagesize_summary, remote_tps;
     size_t page_size = qemu_target_page_size();
-    Error *local_err = NULL;
 
     trace_loadvm_postcopy_handle_advise();
     if (ps != POSTCOPY_INCOMING_NONE) {
-        error_report("CMD_POSTCOPY_ADVISE in wrong postcopy state (%d)", ps);
+        error_setg(errp, "CMD_POSTCOPY_ADVISE in wrong postcopy state (%d)",
+                   ps);
         return -1;
     }
 
     switch (len) {
     case 0:
         if (migrate_postcopy_ram()) {
-            error_report("RAM postcopy is enabled but have 0 byte advise");
+            error_setg(errp, "RAM postcopy is enabled but have 0 byte advise");
             return -EINVAL;
         }
         return 0;
     case 8 + 8:
         if (!migrate_postcopy_ram()) {
-            error_report("RAM postcopy is disabled but have 16 byte advise");
+            error_setg(errp,
+                       "RAM postcopy is disabled but have 16 byte advise");
             return -EINVAL;
         }
         break;
     default:
-        error_report("CMD_POSTCOPY_ADVISE invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_ADVISE invalid length (%d)", len);
         return -EINVAL;
     }
 
-    if (!postcopy_ram_supported_by_host(mis, &local_err)) {
-        error_report_err(local_err);
+    if (!postcopy_ram_supported_by_host(mis, errp)) {
         postcopy_state_set(POSTCOPY_INCOMING_NONE);
         return -1;
     }
@@ -1967,9 +1967,10 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
          *      also fails when passed to an older qemu that doesn't
          *      do huge pages.
          */
-        error_report("Postcopy needs matching RAM page sizes (s=%" PRIx64
-                                                             " d=%" PRIx64 ")",
-                     remote_pagesize_summary, local_pagesize_summary);
+        error_setg(errp,
+                   "Postcopy needs matching RAM page sizes "
+                   "(s=%" PRIx64 " d=%" PRIx64 ")",
+                   remote_pagesize_summary, local_pagesize_summary);
         return -1;
     }
 
@@ -1979,17 +1980,18 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
          * Again, some differences could be dealt with, but for now keep it
          * simple.
          */
-        error_report("Postcopy needs matching target page sizes (s=%d d=%zd)",
-                     (int)remote_tps, page_size);
+        error_setg(errp,
+                   "Postcopy needs matching target page sizes (s=%d d=%zd)",
+                   (int)remote_tps, page_size);
         return -1;
     }
 
-    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_ADVISE, &local_err)) {
-        error_report_err(local_err);
+    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_ADVISE, errp)) {
         return -1;
     }
 
-    if (ram_postcopy_incoming_init(mis, NULL) < 0) {
+    if (ram_postcopy_incoming_init(mis, errp) < 0) {
+        error_prepend(errp, "Postcopy RAM incoming init failed: ");
         return -1;
     }
 
@@ -2617,11 +2619,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_handle_cmd_packaged(mis, errp);
 
     case MIG_CMD_POSTCOPY_ADVISE:
-        ret = loadvm_postcopy_handle_advise(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_advise(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_LISTEN:
         ret = loadvm_postcopy_handle_listen(mis);

-- 
2.51.0


