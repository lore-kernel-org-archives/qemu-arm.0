Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905CCC87FDA
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:14:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuR-0001EG-Ql; Fri, 08 Aug 2025 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHL3-0006zf-8a
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHKz-0007Kp-DH
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qg0W39r2mo/rnzZlazUt1rPQcD3Ep4F8/ignnOJ6J8Q=;
 b=EA+PHlj4XmgADW+7qUnKsCf5XsCn/nMwuE+Y3C7MqvBe3ICK3YA9Wr6ssGzuzGEb89e78b
 6S2btuxj2O/SpJ71KJZgflRusTaYorEg4FQafZt4YiXIP2hCsCVuIa0I2F4ZFoHZLcqwSw
 0Nd0YDYCHm85KY33LzlDw0k8K1XT7WQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-tTRaY_plMWi5VzxtF2XuHw-1; Fri, 08 Aug 2025 03:16:18 -0400
X-MC-Unique: tTRaY_plMWi5VzxtF2XuHw-1
X-Mimecast-MFC-AGG-ID: tTRaY_plMWi5VzxtF2XuHw_1754637378
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b31f112c90aso1676781a12.0
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637377; x=1755242177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qg0W39r2mo/rnzZlazUt1rPQcD3Ep4F8/ignnOJ6J8Q=;
 b=Wpm53p8xh/Vb/p/x/dpo0NRiIaP5rxELOPflOXSRBKA732HCT0HfdyBkLXBSoAKuUp
 yQ1VFr0/ikPsPiPsnXZxWILQEeuKj056nkjotz+tmOP5a/TLBIbZcAq3rZjfCUJZd0EE
 GeCpSyCeHJWvc1swLth1XttOBzDP552RzZl3kzi6L/OrZ08CjzhBHQPj2//SfiSRij7y
 8lqbGKftGZFt7ByDR9FNAKAELQZwDFfgvBhSvqLL6LPn8VkRmLDOa1yvp0SpV92hZcSy
 ievLVYuLS/KjJzcCA6SuraJ07nL58VtkAa2MQGA0/xN6zE+qJIP7mQzgFThEHL5f05lR
 X8lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvOi2CpMGsNwRLUaU3VZSErROn3+OGg0q3LfD1RkLfFuigagqBf+zaIhmYTzPAmuSS3nw2P/8veg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2tDM+rAfhKR0ocUSmNpuaOTJmaXfyn0KMiqx6erJh+zsT6JSt
 ovFfDUwRpnfRdCBF/sU6S49ajecg5Wj2eefuc2Kx1d3PTi9+LSQkheTuW6wRovZEXsB9VAlaQSK
 o4gb3QJdDMk1qgXYwcxqo1VnlKXeyX1dIqbDlfs2FNFA1c79vIbn46Q==
X-Gm-Gg: ASbGncsJlWJT1LgRp7EFqmlXOJ+cDBSPF15f9BuaowTt0msn/zTKBAfb3dpWFPxazee
 kISSjuQEo0xf0VgjqA24otOqCV5tDaIb+VcBAGxrzfofUoNnBHsiinuhNWThexHB/vUE6Pb4uFT
 iwWSuPtVUAvqjjHVJ+U1CCNG1dFMjR1hLgbdoW99MfNPdgk+/P+6zEl1oCWRJnqGdp8lsAlbEEJ
 fu6NoOR9vXSKfOn98zXU3MavrNKPYCVGgPB44giL9wSQpmxKVPxoDl+d4FNloqDP4I556I7AuqU
 /55zassjpSaV5och4c+b09IMipItrWp3FMzt/Vf+OXAMDzV+uzL1HQ==
X-Received: by 2002:a17:902:e84c:b0:23f:ed0f:8dd4 with SMTP id
 d9443c01a7336-242b07940a6mr87643265ad.23.1754637377534; 
 Fri, 08 Aug 2025 00:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv2pd04n/jOnPh3Y7E/cm6lrPwEcyLp+TiuS54f19hvUK9BinNDLuu1SeGGE0CA7JleG2COw==
X-Received: by 2002:a17:902:e84c:b0:23f:ed0f:8dd4 with SMTP id
 d9443c01a7336-242b07940a6mr87642755ad.23.1754637377118; 
 Fri, 08 Aug 2025 00:16:17 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:16:16 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:37 +0530
Subject: [PATCH v10 11/27] migration: push Error **errp into
 qemu_loadvm_section_part_end()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-11-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3132; i=armenon@redhat.com;
 h=from:subject:message-id; bh=D1WGxvbr0zI07Zh7yOUn/XDO1OJxdzpwKqlFCxErDts=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVdD95vcCZmy9nvH6tarPryqLK0lZ++8nK9auOXYN
 s/pm2bc6ihlYRDjYpAVU2Rp+Bog2xRQGBFp+/I6zBxWJpAhDFycAjCR8z6MDJc3bOD/9ftOdZXy
 xc/rPmT1d/Fm/la6KPfeWzt5vrXv/MWMDCu/5KS/+9H8eeUOKzeDy9fVq09smJI28dzCApOfX/5
 kl7MCAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ODiE30thhRCFZViCx3XBvZcEDcwcNbUvFf7aaBEeCR4_1754637378
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
It is ensured that qemu_loadvm_section_part_end() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 6302e1cdc3bca0c16f64dc0f35a17e4d9b7705ea..ff2e4f75e070d0f452414f28435905928b1480a7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2806,8 +2806,9 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 }
 
 static int
-qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type, Error **errp)
 {
+    ERRP_GUARD();
     bool trace_downtime = (type == QEMU_VM_SECTION_END);
     int64_t start_ts, end_ts;
     uint32_t section_id;
@@ -2818,8 +2819,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read section ID: %d",
-                     __func__, ret);
+        error_setg(errp, "Failed to read section ID: %d", ret);
         return ret;
     }
 
@@ -2830,7 +2830,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         }
     }
     if (se == NULL) {
-        error_report("Unknown savevm section %d", section_id);
+        error_setg(errp, "Unknown savevm section %d", section_id);
         return -EINVAL;
     }
 
@@ -2838,10 +2838,10 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &error_warn);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report("error while loading state section id %d(%s)",
-                     section_id, se->idstr);
+        error_prepend(errp, "error while loading state section id %d(%s): ",
+                      section_id, se->idstr);
         return ret;
     }
 
@@ -2852,6 +2852,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Check section footer error, section_id: %d",
+                   section_id);
         return -EINVAL;
     }
 
@@ -3110,7 +3112,7 @@ retry:
             break;
         case QEMU_VM_SECTION_PART:
         case QEMU_VM_SECTION_END:
-            ret = qemu_loadvm_section_part_end(f, section_type);
+            ret = qemu_loadvm_section_part_end(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }
@@ -3134,9 +3136,6 @@ retry:
 
 out:
     if (ret < 0) {
-        if (*errp == NULL) {
-            error_setg(errp, "Loading VM state failed: %d", ret);
-        }
         qemu_file_set_error(f, ret);
 
         /* Cancel bitmaps incoming regardless of recovery */

-- 
2.50.1


