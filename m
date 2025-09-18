Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFFCA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:27:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWq-0000BJ-L7; Thu, 18 Sep 2025 11:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWo-0008Tc-B7
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWk-0003BR-K9
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj+j75kbzZRr8WyC+CT6yCwQ+uVU6b0xjRbHU07xHqI=;
 b=Qc34OdKoelOUL2pmiI42F2XKedsnj4wMumrYf+xIMTNBKD2Qm66BEiiIB2wvT2khRVTnRp
 X2t9pZGnyYahxbg39mNwzRNOCYJ/P3qCoSdZyLvCGIOSeIXz9Ze4SQR9nUEqFmT7D3zunl
 lwiIZsZWrsSag7YhpbXDZtaR+V9iW7o=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-BR9seM66OI65GXpswj_WUQ-1; Thu, 18 Sep 2025 11:26:23 -0400
X-MC-Unique: BR9seM66OI65GXpswj_WUQ-1
X-Mimecast-MFC-AGG-ID: BR9seM66OI65GXpswj_WUQ_1758209182
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-77daad52913so458126b3a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209182; x=1758813982;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gj+j75kbzZRr8WyC+CT6yCwQ+uVU6b0xjRbHU07xHqI=;
 b=wB/UKoirMGqOeGS7B8dIJVXJdU1+98tHYb4kj5CrRDi1LUTK7HsnPH1rK1lp90CMNa
 4vwRtOVFzqb4lBmvkmdWUmaM//8mtsrJPbscPCr3wiagIdDmvBYuMlenubhkGGLzPWTb
 fLDifIxGnGdCWrwO84Juz3do1dMWkH+cH4YdyZi1ElLyNur2xBtMM2e8mZ3fDDqyNuSD
 /FiELX9PoU6y/28YB3vYa0GVHiTNoNg3zpHNGt2mlrlELg4UkI9+Y914akQGzr+akXRV
 lAQIBgjFH0ZiVRLU6/Pat6vcTZ+5ubSzoJPS4rADhXMdGPck4vboQYFHRTKmsGSpcjTD
 P3hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqg2h/vm7B0tqKY/f5hglmSwzOxzz/ZILDSfF5iza3LNICR3Ly0DxLw8zVPS21ay/ZjqSac+/R5w==@nongnu.org
X-Gm-Message-State: AOJu0YyvpYeghuH/Xvp4puYHPA+LiiXvvpJ+M0b37jmFEUZOIz2D1oaA
 azfMaT9H8XwE2dcT1fFn8jw/6Mhwe4QCibwv3TczRIMY+2RlIDtnYLYePZGac/HWit2+lwOfpTH
 4r5k9pG3wam7w8Kn4aJ4mt5jIDp0qjB2ivCvdwFLT2P9MKU+nVUeO5A==
X-Gm-Gg: ASbGncsFLCk5TqPckLeeNUrF5watfxL8UT4SQG410K1ZFlhobue8b7L9pO5NRZtuOrR
 OXXtTtfzvfBisNJ0yYXAhTVZEZwMVTiGtvZ/lUv7m09UzudqUoTsmfor8893xfSkAhNqvBtguIa
 X1rbSSnBa0fWo1zaiabssO95E7YaCnXZpvOHi4JWpngaTSOnvU0bLcnqrONOBo7fCZMKVEPYJy7
 atmEjts4Dc2yvr1AO0M9wPs9eVue/aR8WLAGdzfwbd1tza6yiKCahQHMCSz75xI+bvfuVGarpqQ
 tMTAj49zgHBIVUoFcpRDgRRQph3WZ5peFo5FXUMKtsgdilL9GyzVDw==
X-Received: by 2002:a05:6a00:2181:b0:777:8ba9:d200 with SMTP id
 d2e1a72fcca58-77bf71cdfaamr6553685b3a.10.1758209181905; 
 Thu, 18 Sep 2025 08:26:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp6KYCd4/SsPpOcdd6m93nKWZidNLfzi0DkYN1cS7xdWQLNqWPx2fjecphigKMQ3NqTG0v+Q==
X-Received: by 2002:a05:6a00:2181:b0:777:8ba9:d200 with SMTP id
 d2e1a72fcca58-77bf71cdfaamr6553640b3a.10.1758209181420; 
 Thu, 18 Sep 2025 08:26:21 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:26:21 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:35 +0530
Subject: [PATCH v14 18/27] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-18-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4329; i=armenon@redhat.com;
 h=from:subject:message-id; bh=r7TvIL4ZIDOkRB8HrM5BHB1nfGTyTk+rEFu7cLDvTA4=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R8FQQ8LDYw+nOIXUKvmm3pi/fLH7MsWX/xTvPLwR
 c3Azpg1HaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACbipMPwh/f05nmb/v10n/ZK
 +mkBs+3KQNeDqhyL71+avvbWnPCOJw8Y/so4x10WXu/VNf/UtaKM95MeFn9ePDVufi73tAv596d
 e62AFAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 48Tkjg7q8Mr0EnE7izsRFG8kJjSYbjk6BwCe6Q_zljY_1758209182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
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
It is ensured that loadvm_postcopy_ram_handle_discard() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3ab20bd3de980ecfd79ab29697e3e1527ab3e73c..01cc186b9e0324053e804c4fedebee02d8df4052 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2004,7 +2004,7 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
  * There can be 0..many of these messages, each encoding multiple pages.
  */
 static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
-                                              uint16_t len)
+                                              uint16_t len, Error **errp)
 {
     int tmp;
     char ramid[256];
@@ -2017,6 +2017,7 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         /* 1st discard */
         tmp = postcopy_ram_prepare_discard(mis);
         if (tmp) {
+            error_setg(errp, "Failed to prepare for RAM discard: %d", tmp);
             return tmp;
         }
         break;
@@ -2026,8 +2027,9 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         break;
 
     default:
-        error_report("CMD_POSTCOPY_RAM_DISCARD in wrong postcopy state (%d)",
-                     ps);
+        error_setg(errp,
+                   "CMD_POSTCOPY_RAM_DISCARD in wrong postcopy state (%d)",
+                   ps);
         return -1;
     }
     /* We're expecting a
@@ -2036,29 +2038,30 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
      *    then at least 1 16 byte chunk
     */
     if (len < (1 + 1 + 1 + 1 + 2 * 8)) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
         return -1;
     }
 
     tmp = qemu_get_byte(mis->from_src_file);
     if (tmp != postcopy_ram_discard_version) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid version (%d)", tmp);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid version (%d)", tmp);
         return -1;
     }
 
     if (!qemu_get_counted_string(mis->from_src_file, ramid)) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD Failed to read RAMBlock ID");
+        error_setg(errp,
+                   "CMD_POSTCOPY_RAM_DISCARD Failed to read RAMBlock ID");
         return -1;
     }
     tmp = qemu_get_byte(mis->from_src_file);
     if (tmp != 0) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD missing nil (%d)", tmp);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD missing nil (%d)", tmp);
         return -1;
     }
 
     len -= 3 + strlen(ramid);
     if (len % 16) {
-        error_report("CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_RAM_DISCARD invalid length (%d)", len);
         return -1;
     }
     trace_loadvm_postcopy_ram_handle_discard_header(ramid, len);
@@ -2070,6 +2073,7 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
         len -= 16;
         int ret = ram_discard_range(ramid, start_addr, block_length);
         if (ret) {
+            error_setg(errp, "Failed to discard RAM range %s: %d", ramid, ret);
             return ret;
         }
     }
@@ -2629,11 +2633,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_postcopy_handle_run(mis, errp);
 
     case MIG_CMD_POSTCOPY_RAM_DISCARD:
-        ret = loadvm_postcopy_ram_handle_discard(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_ram_handle_discard(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_RESUME:
         loadvm_postcopy_handle_resume(mis);

-- 
2.51.0


