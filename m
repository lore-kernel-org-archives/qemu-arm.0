Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0FFCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:22:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNea-0004Wx-Uo; Sat, 30 Aug 2025 11:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5L3-0005Ow-V1
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5L2-0004jg-3v
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsBBzucx8y5i9VHunk1XF83aX/5bi21WNzwEAMu8Vec=;
 b=NGSinLqOpIumPS72NpwdirUr/G/IcKCiU+odqG7dW2cMwbxFl7LEiyxLpflK9XXW+Szb5j
 LV5UypliaSuBVTdZybtwSWuR7siyO0zmY5tTtnrRkw18zqSOQMmNr0lCGFQn/6fIlDuCDR
 XKnxr2S7kuwrZYr6FYZk7OrW6zlY2dw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-lLD73PMpN_KPUU4LrUc-Gw-1; Fri, 29 Aug 2025 16:04:41 -0400
X-MC-Unique: lLD73PMpN_KPUU4LrUc-Gw-1
X-Mimecast-MFC-AGG-ID: lLD73PMpN_KPUU4LrUc-Gw_1756497881
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-325ce108e45so2445719a91.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497880; x=1757102680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsBBzucx8y5i9VHunk1XF83aX/5bi21WNzwEAMu8Vec=;
 b=qCCei6ZiXuk/y0qT05bAcil9JrFYKGbnwnrZn2D56KSPXB2WvXg+sk/PCE4ifgHMmS
 oZSxbAxg415z22Y46pPV7XipSTInm4pZLdBjJpVN9eHRxhLIOIVK2BpVEV5vhRYxFZ2i
 9FwLqwbwmI4Mhvz89jDCxn4d5S+4V/KAGQUQmaiqOokf2go4gCKXMR99BeoPTGFYfTAx
 maC+zP8Tu/pnm8JavvUVqG+T2/4vRZdV46AK6Bk4grW5+78o+RwFpW9T0VcQZydGGJJa
 uL1Fg98ZdHxyB/43i2azpSfwQGUkwcX0zkzvlPpCnPwIvvqGSxX6dByXOs9pF2I6gmdF
 oNzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Zu4wfBQp8h1WBjzo1tTTSjj3YgC2idSp0Ja78TPzhT0jaEKTARCFYzv08hUxTZPe/nYBBcB9XA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+qBLcnfXApDEPU9gewW7Et2A5uqiXh97lZtsfBUO+UI66kxM2
 uIzEtT81jtcxTvzYdOG9ffJI06TrDtyrMCDc3Mi8vNHLCMbSOZ+CT0Gaxs/eY3BmKAfGkfXiAzJ
 DPFTgm47cwnDNjUTAX/P9okiyQffztr7yK8MKt6RVLUqgckBCm6Yl5g==
X-Gm-Gg: ASbGncvv5K9wFm/lPxYwj6asDPC9PkT5zXoXfDvoQ4S7rHNGwG5dN6hgogJKE8qmG0i
 GpLZ2KbsBQipxecRv2zo8rm51lpdDlmSidmLo98SezY19X94FSTyUhzNOEJV41vfszw7UDvTkCH
 aWd/qPF5HpFrZcuVu8PphOQEz00IHiNflizno5FH1NyK71cj0uhlj509zwqN2da0ZID7KaOE2Mp
 8ERjtiksNZE+NqD6dxaaMEHGUox92pTV7yahKxU4wOhZyTKRPrmk7G2gco7Lzz4UpyRpVGPAD1r
 7zT6M2tzH9fiUMOdWGYL5ctQylUPb8odlSaVToNVZm0D9I6wPtthmQ==
X-Received: by 2002:a17:90a:fc4f:b0:325:8fba:708d with SMTP id
 98e67ed59e1d1-3275085db6cmr19128331a91.18.1756497880433; 
 Fri, 29 Aug 2025 13:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgxvP8ns5R0YWDPu/saa6ZtVs08PC4P1eKJfga9WhW3stQRNH6XdbyEcYVMqRcKMICqey6pw==
X-Received: by 2002:a17:90a:fc4f:b0:325:8fba:708d with SMTP id
 98e67ed59e1d1-3275085db6cmr19128298a91.18.1756497879866; 
 Fri, 29 Aug 2025 13:04:39 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:04:39 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:50 +0530
Subject: [PATCH v13 10/27] migration: push Error **errp into
 qemu_loadvm_section_start_full()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-10-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4798; i=armenon@redhat.com;
 h=from:subject:message-id; bh=mjhvRtOfCNflzXKsd7LfnW6aMa0TrUuxLNhD6rtfZNc=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdt8CjnwHG1NThjs8yZ2fEo5KGJmrXykIr5+kpblM4
 fSVOY86SlkYxLgYZMUUWRq+Bsg2BRRGRNq+vA4zh5UJZAgDF6cATOR4IsM/1SUTyjzeTl3I2SoQ
 +zVm4tb3qvG9MZZVGqcnnWmcX7asnuE3m5vSn9Xqny0drOPWcb+1uB99uTZ6zTUF4d2OsdKJe3e
 wAAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4sASH3z1MkDmSWGC08N2vjWUQ3iN8jN5b1O30IESTb4_1756497881
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
It is ensured that qemu_loadvm_section_start_full() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index eccb3f63f8dfc070263a1d19ec3415684e8fa60e..01e1a9739aa784d90f80bf2b561fd62f5e4678f8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2722,21 +2722,21 @@ static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
 }
 
 static int
-qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 {
+    ERRP_GUARD();
     bool trace_downtime = (type == QEMU_VM_SECTION_FULL);
     uint32_t instance_id, version_id, section_id;
     int64_t start_ts, end_ts;
     SaveStateEntry *se;
     char idstr[256];
     int ret;
-    Error *local_err = NULL;
 
     /* Read section start */
     section_id = qemu_get_be32(f);
     if (!qemu_get_counted_string(f, idstr)) {
-        error_report("Unable to read ID string for section %u",
-                     section_id);
+        error_setg(errp, "Unable to read ID string for section %u",
+                   section_id);
         return -EINVAL;
     }
     instance_id = qemu_get_be32(f);
@@ -2744,8 +2744,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read instance/version ID: %d",
-                     __func__, ret);
+        error_setg(errp, "Failed to read instance/version ID: %d", ret);
         return ret;
     }
 
@@ -2754,17 +2753,17 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     /* Find savevm section */
     se = find_se(idstr, instance_id);
     if (se == NULL) {
-        error_report("Unknown savevm section or instance '%s' %"PRIu32". "
-                     "Make sure that your current VM setup matches your "
-                     "saved VM setup, including any hotplugged devices",
-                     idstr, instance_id);
+        error_setg(errp, "Unknown section or instance '%s' %"PRIu32". "
+                   "Make sure that your current VM setup matches your "
+                   "saved VM setup, including any hotplugged devices",
+                   idstr, instance_id);
         return -EINVAL;
     }
 
     /* Validate version */
     if (version_id > se->version_id) {
-        error_report("savevm: unsupported version %d for '%s' v%d",
-                     version_id, idstr, se->version_id);
+        error_setg(errp, "unsupported version %d for '%s' v%d",
+                   version_id, idstr, se->version_id);
         return -EINVAL;
     }
     se->load_version_id = version_id;
@@ -2772,7 +2771,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
 
     /* Validate if it is a device's state */
     if (xen_enabled() && se->is_ram) {
-        error_report("loadvm: %s RAM loading not allowed on Xen", idstr);
+        error_setg(errp, "loadvm: %s RAM loading not allowed on Xen", idstr);
         return -EINVAL;
     }
 
@@ -2780,11 +2779,11 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &local_err);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report("error while loading state for instance 0x%"PRIx32" of"
-                     " device '%s'", instance_id, idstr);
-        error_report_err(local_err);
+        error_prepend(errp,
+                      "error while loading state for instance 0x%"PRIx32" of"
+                      " device '%s': ", instance_id, idstr);
         return ret;
     }
 
@@ -2795,6 +2794,8 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Section footer error, section_id: %d",
+                   section_id);
         return -EINVAL;
     }
 
@@ -3100,7 +3101,7 @@ retry:
         switch (section_type) {
         case QEMU_VM_SECTION_START:
         case QEMU_VM_SECTION_FULL:
-            ret = qemu_loadvm_section_start_full(f, section_type);
+            ret = qemu_loadvm_section_start_full(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }

-- 
2.51.0


