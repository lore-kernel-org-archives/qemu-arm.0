Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E61CA0FE1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:48:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0xG-00051o-0p; Thu, 21 Aug 2025 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0vO-0002Y2-8F
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0v1-0000yv-0k
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755765906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kk3+NIQtXaA5i+x7tx8agPDX605CM/z42iyH0dQieuI=;
 b=K/TnVL1UZD/VVpUSb78u8zKb+QZAs+zNXGVmLvPMoDGEgL+sjddIIAqhp8NkTaIFbgioEl
 w1uxRcCcMdqX7SKiKOyAUr+VIPzWjWgvHP6zMLUva42ZMQJMszODMQN72JJy/wklHOe3FY
 KlKgHRoRJu3t8X1gATqTIbExQiCj1Kk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-FNfuPRMbMkulJXluuktY5w-1; Thu, 21 Aug 2025 04:45:05 -0400
X-MC-Unique: FNfuPRMbMkulJXluuktY5w-1
X-Mimecast-MFC-AGG-ID: FNfuPRMbMkulJXluuktY5w_1755765904
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2445820337cso8858215ad.3
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755765904; x=1756370704;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kk3+NIQtXaA5i+x7tx8agPDX605CM/z42iyH0dQieuI=;
 b=Dc+G282HBWmJhEMH+jqUZ3Mo12n8pxE+yPap0gaDSFHoIWqj2P8HcRjaCbM9je9+PQ
 gX/8KInLSdQcKPTk2jcpleer0oBskqmsccKv627iE01tYd6iMqSQA3dYdA6iq+6mPN7S
 SGStuCX1yEvhqBo/4qK5/LuGiwf09WozToIlSYuoKgfea0Gykma6IDiBpxm0DVYro4cd
 WET4PHIWbxZwFDedgjJps2nIa/9HbTwaiOHR4ZxMSvTcKqq7By1BYYlGu/VFbTKz4DYu
 AK+qRPKwgWY8b++t83DTvbln5WFMAQfJiVJTGbQII4apftl6DTLDckEh+oMPCMKCD97j
 b3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQJvU7iTDFz+ThHIRFYNcyYVjubTZzuuU3gF5FhtcffpqEx0wp9sxW/acN8P9ACW/o3GSto+BgSA==@nongnu.org
X-Gm-Message-State: AOJu0YzE3deCSzhy32tbI2lC0B+FoEQGA1iJcOhvvXhNR8845a0tAgPq
 kW4G4lLjucOvlQmgQdTbIly+W5ZW33hVIWXfuOE0YcloDwhe8zZXYy3qqQCa/oGAI/1iFienacw
 mB+CYYxv/CQ302+Ll+Toan6sHJ4k/B+aDu2XiGXYDRhcjKBbENLSpbA==
X-Gm-Gg: ASbGncsxNdQrYq/mvTEhdUXwwEbM3PY/TbmZR36KyQ1ORhPwuVEmP0vXLt5+Kb13ZKV
 sNNpamsXe3Z4S9xck0h1LR5JqBqLj5wlxd9TX9IxxzrAn2SoE+D+WD6bm/dRRVPrKeFK582WILQ
 7ZjTv6SlhyVUG5cXlkDNbOrvP6+cbN/CgqyWu7j5q9vm8hFR0sV+EbbYsT0+RbKWnXGI3kW7IIz
 y4XZ7it0lOYNR0k4is1xlgAFVIZWG8cZ455z04LeUBeA25OaxUN3Cd1aRO1dlDtqSTNMH1Tj4gB
 K3ycgYz3B6IMsPx6HJOfbej13ja4ODw+aKDwGLDKQalfPyrb6i4Y
X-Received: by 2002:a17:903:1b47:b0:242:b315:dda7 with SMTP id
 d9443c01a7336-245febef6famr21949595ad.3.1755765904408; 
 Thu, 21 Aug 2025 01:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErWudDrfu/11rJtG6vyCSxTFO235r8JrfhYj7BXT9JKMACBaOn9fzjFxvZdNyWvoCPSjnLdg==
X-Received: by 2002:a17:903:1b47:b0:242:b315:dda7 with SMTP id
 d9443c01a7336-245febef6famr21949305ad.3.1755765904037; 
 Thu, 21 Aug 2025 01:45:04 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:45:03 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:13:57 +0530
Subject: [PATCH v12 03/27] migration: push Error **errp into
 qemu_loadvm_state_header()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-3-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972; i=armenon@redhat.com;
 h=from:subject:message-id; bh=R7CNvPEGSj+XRsy4a7OPYyRxze4h7ZRH+EvjhrcS4IE=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO8nC1ldvqh5UNxCJZAnNclxzJiWvPr94oVzg31/ru
 GernFHvKGVhEONikBVTZGn4GiDbFFAYEWn78jrMHFYmkCEMXJwCMBHeJQz/TO9tm7tj7c+gsgP7
 3lfer05w/t004ceiTXd+bLoa5MsvEcDwV+CO+ZsFzaedt/9PWhq1cPX1bvEvk9S8J9mlbslvVX4
 aywYA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CnGC_oNYQiocXpeINbLJrncdd4d8Ve9v31ok8j11Rrg_1755765904
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
It is ensured that qemu_loadvm_state_header() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 464e8b778404a642bf60f368205f5e6fa59118ba..0c445a957fc99f826e6753ed3795bcdd51f1e3f5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2814,38 +2814,43 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     return 0;
 }
 
-static int qemu_loadvm_state_header(QEMUFile *f)
+static int qemu_loadvm_state_header(QEMUFile *f, Error **errp)
 {
     unsigned int v;
     int ret;
-    Error *local_err = NULL;
 
     v = qemu_get_be32(f);
     if (v != QEMU_VM_FILE_MAGIC) {
-        error_report("Not a migration stream");
+        error_setg(errp, "Not a migration stream, magic: %x != %x",
+                   v, QEMU_VM_FILE_MAGIC);
         return -EINVAL;
     }
 
     v = qemu_get_be32(f);
     if (v == QEMU_VM_FILE_VERSION_COMPAT) {
-        error_report("SaveVM v2 format is obsolete and don't work anymore");
+        error_setg(errp,
+                   "SaveVM v2 format is obsolete and no longer supported");
+
         return -ENOTSUP;
     }
     if (v != QEMU_VM_FILE_VERSION) {
-        error_report("Unsupported migration stream version");
+        error_setg(errp, "Unsupported migration stream version, "
+                   "file version %x != %x",
+                   v, QEMU_VM_FILE_VERSION);
         return -ENOTSUP;
     }
 
     if (migrate_get_current()->send_configuration) {
-        if (qemu_get_byte(f) != QEMU_VM_CONFIGURATION) {
-            error_report("Configuration section missing");
+        v = qemu_get_byte(f);
+        if (v != QEMU_VM_CONFIGURATION) {
+            error_setg(errp, "Configuration section missing, %x != %x",
+                       v, QEMU_VM_CONFIGURATION);
             return -EINVAL;
         }
-        ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0,
-                                 &local_err);
 
+        ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0,
+                                 errp);
         if (ret) {
-            warn_report_err(local_err);
             return ret;
         }
     }
@@ -3121,8 +3126,9 @@ int qemu_loadvm_state(QEMUFile *f)
 
     qemu_loadvm_thread_pool_create(mis);
 
-    ret = qemu_loadvm_state_header(f);
+    ret = qemu_loadvm_state_header(f, &local_err);
     if (ret) {
+        error_report_err(local_err);
         return ret;
     }
 

-- 
2.50.1


