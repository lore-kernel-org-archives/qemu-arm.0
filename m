Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59713C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMus-00022z-2n; Fri, 08 Aug 2025 09:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKu-0006p4-U2
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKp-0007IX-Kl
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/xJsGYLQ3l/15ghT8JrI6NoUQ8PtivMeVPGYf0S0Yc=;
 b=GvYSuv5cPhgm9i3Mf9xC5No1CcazgONQsyl+0ce2DKLlXeR5ACnhMcotAcDPYLIq9SmSVN
 5g6II0/uCuzN+OWJ/z7x09pLLoLTarc2TWGYi78AKzmBnEJ8+xGPPWyuQiYKRSgY4Fbypd
 hIioUv6H6hyeXw1IaW1OpvQR5QQDzUg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-8JONAYM6OSekcQCZ9e8I1A-1; Fri, 08 Aug 2025 03:16:10 -0400
X-MC-Unique: 8JONAYM6OSekcQCZ9e8I1A-1
X-Mimecast-MFC-AGG-ID: 8JONAYM6OSekcQCZ9e8I1A_1754637369
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b421b03d498so1493516a12.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637369; x=1755242169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/xJsGYLQ3l/15ghT8JrI6NoUQ8PtivMeVPGYf0S0Yc=;
 b=flXsSXIsnofrwRpTbJNvjXRnp36jyOc4keEh1hOGLFbBR5ayWh9To3lxAXg1ISBRVR
 FV5v0XXaDUeBczyX05Yen4ZPKuY9jSu0mggSFfRWQaJz9wpy8xYNJdHV28agdSfhC2WH
 oKTFl6drgJvt1AH5gGIRhrOo8QCN2u2VNb/x6dkxOwnjIfNxG69oX4VVi7M3n/lDi+4J
 XKlC9YlgKtSegriBfAIaBNKBUIbwPxgk9VnCVOQCYkUxzER/hgYjdRWZAU8STtoVxxiy
 yE2stfp9i54K3rlZmO4SI18AocU/LUx/YuZKo2o9ZY3iafw5rLzh7NzVjeFmy1NWykkK
 5sLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMjLLRacTUgz8dmLLAQb2sMBKZ4EBg3TuGTMfNwoYoiZIni+PDo+AVwED89kGrGNwaUOtJZ9TN0g==@nongnu.org
X-Gm-Message-State: AOJu0YzlrhwLWAalfZiF4qY3Gu8JtCVmeM8GZnkvH9Xo9foG8IGTcxXF
 frK/NkyKaBKRTtq3eLHHNAAejGY50GLTtD6dgLf4v+t7JqL9+ENdh9UaieSattOe9/beVHlDQ+N
 kNLvgibzUP8zFYv019wxFpuuvvnVY3FzsA8GpS8rg6x1aCDbhbsbW0A==
X-Gm-Gg: ASbGncu9KCzJcpFa89VYwYvECELyiSoz14G1aCyFvtSjtlhCaCTLR+qa7624jDHRuwq
 tWytKEpS1bV5SMdD7Pa/JLwVjZDGmVknA2OYu+sgAPFy5Y+ywLUbiEeEUiYX7SlWCFQj7JtlmyA
 wY0pOSZTSLGicDAnAxdBZ8nlyVmNxl+CY/XrQ/6O0nABBpBeOpEtABCGQg/oCszq3cRj5spUPl+
 Vu4uqwXF2KaemKZy0aaLc2mU3kJzCzLwlkz7CGPcH+PAx/QD0pTOQO3D5vTpmtmAYAPWvWcSB82
 HvZEgXYrNgmR8ViJM+O6pxzrV5rkeGma4QKzOxyJGGFcTcwhoe37yg==
X-Received: by 2002:a17:903:b0e:b0:234:f4da:7ecf with SMTP id
 d9443c01a7336-242c1ecca84mr24763705ad.8.1754637369008; 
 Fri, 08 Aug 2025 00:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEpAfjTjMF9F4ttdpU7tnnc13zZz12zoO1NeEej25IhophgyPPW89tiAGnjQEGWrdARrFsg==
X-Received: by 2002:a17:903:b0e:b0:234:f4da:7ecf with SMTP id
 d9443c01a7336-242c1ecca84mr24763165ad.8.1754637368569; 
 Fri, 08 Aug 2025 00:16:08 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:16:08 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:36 +0530
Subject: [PATCH v10 10/27] migration: push Error **errp into
 qemu_loadvm_section_start_full()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-10-3e81a1d419b2@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804; i=armenon@redhat.com;
 h=from:subject:message-id; bh=jyiyBRDRCbEkSoT/i0OBlFzhgE/vTIugorgDNobXEvg=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVcNJXi3b7zA8/vjcZEFV7hCo1bNeD5zRUxazlZXw
 xtfmraEdpSyMIhxMciKKbI0fA2QbQoojIi0fXkdZg4rE8gQBi5OAZjIHhOGvzKv/x+LCriyT8pt
 8iLHpmV+qfxXCk+4pzDsuePovmFSWTgjwzKGvCX23Zn/hLnnpZmFTP2nuOOzqcLt/F2CW3PuHXj
 HyggA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yfz5mk2Bci_7BO0JPRs3KJND3UKiUaNJEsbRb04vt6M_1754637369
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
It is ensured that qemu_loadvm_section_start_full() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3df78ac0026c4c098d3fd13f765b54db0eafdc61..6302e1cdc3bca0c16f64dc0f35a17e4d9b7705ea 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2724,8 +2724,9 @@ static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
 }
 
 static int
-qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 {
+    ERRP_GUARD();
     bool trace_downtime = (type == QEMU_VM_SECTION_FULL);
     uint32_t instance_id, version_id, section_id;
     int64_t start_ts, end_ts;
@@ -2736,8 +2737,8 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
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
@@ -2745,8 +2746,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read instance/version ID: %d",
-                     __func__, ret);
+        error_setg(errp, "Failed to read instance/version ID: %d", ret);
         return ret;
     }
 
@@ -2755,17 +2755,17 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     /* Find savevm section */
     se = find_se(idstr, instance_id);
     if (se == NULL) {
-        error_report("Unknown savevm section or instance '%s' %"PRIu32". "
-                     "Make sure that your current VM setup matches your "
-                     "saved VM setup, including any hotplugged devices",
-                     idstr, instance_id);
+        error_setg(errp, "Unknown savevm section or instance '%s' %"PRIu32". "
+                   "Make sure that your current VM setup matches your "
+                   "saved VM setup, including any hotplugged devices",
+                   idstr, instance_id);
         return -EINVAL;
     }
 
     /* Validate version */
     if (version_id > se->version_id) {
-        error_report("savevm: unsupported version %d for '%s' v%d",
-                     version_id, idstr, se->version_id);
+        error_setg(errp, "savevm: unsupported version %d for '%s' v%d",
+                   version_id, idstr, se->version_id);
         return -EINVAL;
     }
     se->load_version_id = version_id;
@@ -2773,7 +2773,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
 
     /* Validate if it is a device's state */
     if (xen_enabled() && se->is_ram) {
-        error_report("loadvm: %s RAM loading not allowed on Xen", idstr);
+        error_setg(errp, "loadvm: %s RAM loading not allowed on Xen", idstr);
         return -EINVAL;
     }
 
@@ -2781,10 +2781,11 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &error_warn);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report("error while loading state for instance 0x%"PRIx32" of"
-                     " device '%s'", instance_id, idstr);
+        error_prepend(errp,
+                      "error while loading state for instance 0x%"PRIx32" of"
+                      " device '%s': ", instance_id, idstr);
         return ret;
     }
 
@@ -2795,6 +2796,9 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Reading footer section of instance "
+                   "0x%"PRIx32" of device '%s' for version_id: %d failed",
+                   instance_id, idstr, version_id);
         return -EINVAL;
     }
 
@@ -3099,7 +3103,7 @@ retry:
         switch (section_type) {
         case QEMU_VM_SECTION_START:
         case QEMU_VM_SECTION_FULL:
-            ret = qemu_loadvm_section_start_full(f, section_type);
+            ret = qemu_loadvm_section_start_full(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }

-- 
2.50.1


