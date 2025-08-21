Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E40CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:50:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0yD-000814-T7; Thu, 21 Aug 2025 04:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wW-0003wq-2W
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wK-0001At-Py
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755765987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OM/kWFiWAteN4H2dnQA9jukvzVu2v/XF/Qvft6AxrV4=;
 b=Gb7bV/7mUZ1UTQzyY36/nqHA34mLFGHt1g0w80SzXDLrPFhLX2JaSUU2UgogGHlSSpi41v
 3ZoqnWqd2lg4Q9VNI8djHYpvdJ/jUG11dl98O9Gvxu/B1xSxz5RME512ZJNRDzo0k72OL4
 xQQFdsTvGg5krMab5owzT+e67HNjbCA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-3VDKpacXP_m9-WalT6j1dg-1; Thu, 21 Aug 2025 04:46:25 -0400
X-MC-Unique: 3VDKpacXP_m9-WalT6j1dg-1
X-Mimecast-MFC-AGG-ID: 3VDKpacXP_m9-WalT6j1dg_1755765984
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445806b2beso23838585ad.1
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755765984; x=1756370784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OM/kWFiWAteN4H2dnQA9jukvzVu2v/XF/Qvft6AxrV4=;
 b=vIWXoo0yd7WBty0DRXFSbuZaiADNbU/uKWxN3ER6p2DO/UYqnyP+H7RKUJs2jPQzgv
 mJHIwsviqfgNKUAVJwchKy3ysYjVLpY5ZF2bKjnQ17KMLNpCToAPAbTLo61+hOy2KxpM
 LL2v0doXR4xiimPHTAGY2J2sT1SYqDhCUq44Y44Sp3xslqaZf8laxi4jG3Vv/ORCYHHQ
 eY0Gq9sA5Zk1//sGHvafLo1RatCk0kkpW7F0ajZU+vMPCaGcmlOOG+2RRjK+Lg/gDrv3
 kNKfoCGAALYVZj7No2ZODpLv0UPLd03NUTmI5ds0IUNwkK8L6812eo4ZNdQ6BtuUTamS
 mPUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4reu9V71gklIecg8Q7iHbMoqXANR78FD3XImVhX6SHw83jGxgauJdeeVYgckmIsP8qRY9pxxw2w==@nongnu.org
X-Gm-Message-State: AOJu0YyHrwtUoq7st4l4sUC3vmIZUjgt8eftwUb2WVoxj1PgOAifAlzA
 XW5G0nroxrJFb5odnQR9Fz5+1e299zDNUkGjsXykIITzFyEez2Ay8rz0Wlvz5hGDGZE7SY8PO8E
 p8SCdh7UJx5748atMNKM0wdXpZUZZqGy2A7w2c3vdrPLUJNulRgWFNA==
X-Gm-Gg: ASbGncs4PW6nHFCAmWg1+XwuYjiC6iKJuHxxVBtYLNwZBrmRyD3tPJ53Bbc+f1kPRoU
 DoCkzMji/nOrQ2UEhnlOTIN88deSQ70MM3epJdWVDfqGjFm90EbiAYp7z3Tsc/Nc4FEBWgyCZdP
 T/2xqPDcntsB40D+Yzc2rhXZZwOvbRCV4wHa93q2a6UbCMBHbASz6+8OOYZWkDbrTiHpoQREPjo
 0r/oruy+bBWs2e2/MzhAzL0G+7qSDZIrLSBw5naaRTwEhJCPNuRz5DEDAz1YrF2lYUiiXYEYxJx
 zyxyOYVx4y96DAGmRqp5zIgl3uaq/UvrVvdSO/QTuN3GKy+lzidy
X-Received: by 2002:a17:902:c946:b0:244:9bcf:a8ef with SMTP id
 d9443c01a7336-245febecc4fmr21331825ad.18.1755765983929; 
 Thu, 21 Aug 2025 01:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyVoFhqFxrrqH4kAGaA4aG0dKVMCBrPwT+mWjIvE3tB1CKUbYkrrcGXuuH1rq4bG/X7WOGhQ==
X-Received: by 2002:a17:902:c946:b0:244:9bcf:a8ef with SMTP id
 d9443c01a7336-245febecc4fmr21331545ad.18.1755765983532; 
 Thu, 21 Aug 2025 01:46:23 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:46:23 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:04 +0530
Subject: [PATCH v12 10/27] migration: push Error **errp into
 qemu_loadvm_section_start_full()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-10-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751; i=armenon@redhat.com;
 h=from:subject:message-id; bh=B27j4MbJiuGOwzuroJ8FiCe/MPorYG30oeFl9vBiziU=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO8kn383ibrunn/J0e/zJE2XKzME571SmzWpM5/x0g
 y3R87FqRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgImcKmH47/P2F8+9h8lb0i8e
 Yjx9Y/7JrqOVXnHr9qdNszQUOT1xdzcjw65DQhG1LRETtY1V7zcc29Gi8/ppo9mUeepJ5qb5Dx0
 WsAAA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5pPdTjX2raTlgaQSBexFGbwDFRH7unaRJMkRUbOGyDg_1755765984
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 69222339e17a5320b64de2709504b2ad2cd584ba..b55adb7468e5356ecb636734241f1a356a42a284 100644
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
-        warn_report_err(local_err);
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
 
@@ -3102,7 +3103,7 @@ retry:
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


