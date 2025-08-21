Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B9CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:54:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0z6-0001MC-Kh; Thu, 21 Aug 2025 04:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0xm-0006UN-SX
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0xc-0001ZL-Bk
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FO14PH4lLpI5ovEyIqsx9TNW7UAeWhvxdRm5KT2O9k=;
 b=WuJYSNVvtn+w/zQxj8YPALJQfKJnmWizCWV3tq4shc80IHVNssyXv1nTaQ0fGAmmIDnZ3V
 C+saIMNFi/+nHmm1pE6FnvVGyIrtY3PrRHGQP3epcU4pgQfiTOZOud64pkYjG9s/s3wS29
 mttFmg4hthTpZo0+AYwB5KTh0RfR7m0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-Ct-n4J-pNYOaCX5nuubT0w-1; Thu, 21 Aug 2025 04:47:46 -0400
X-MC-Unique: Ct-n4J-pNYOaCX5nuubT0w-1
X-Mimecast-MFC-AGG-ID: Ct-n4J-pNYOaCX5nuubT0w_1755766065
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581c62faso10765415ad.2
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766065; x=1756370865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FO14PH4lLpI5ovEyIqsx9TNW7UAeWhvxdRm5KT2O9k=;
 b=Md58mgjhnOjZAjHB5P+oPfcf8f/HgJlbaHvSjfipx+1uWVutzw2Yw/Xf8qM/15r3wr
 L9yvRD87jWjTb+Pc4jDThcYBY7tloLNq5hy1I3Oi6sHcMsfa6EVed9J5vo4wmYWzlfwx
 9+Px2v2ERIFm/8aXzGowfqaZlc8BdhRE0NMneuSEFDYWQNXmsISqv9qQcKyYREhmNjR6
 C1HyXLWH5y38UY1gQpb7dY7bNRId8fjXDnr+QIzxzEuZtStzfW7T7XA0wxiKTM3AbblZ
 fMfebEiJdHheyo2w7iNodzzJY3r5hzOY8RzN75t63vUOj8aoomWJOusGkxL1cFQHcYfr
 uHDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPh134jQDsfFmcoGmdc1YzXabboOlH3yNJg4LIZCrgMqWfnGAA/QAalQxoq+ISZ9D6Bhq2trhFvA==@nongnu.org
X-Gm-Message-State: AOJu0Yxn/m60Za5Fmtxl75p1hdUjGnkmy6iyV1q8ulth2raxrHvdc3CT
 iNHzOIZ9B1D/t66OP041hCYuXzLijbQIGAhJ7qnEwdw9T4zIcLG00gOOs5Jfn5wSQaLfas+r8BU
 vad0FxtkqDaEvvIoZcGi/ZqqAKuVQ2I8uVsPXXsLWackXfnGChynuYw==
X-Gm-Gg: ASbGncuKeW4GqrhVKrrKFJUHcdCmyQ6YttKdYyMsjYXn7J81BJLWQYWTatAyVM3Jk2i
 cFrhXNnAVHsDZcJNMwA7GiLS9XNWP8AdQ8+5FxkWiADiLUNXxzNJwUsuG9sEOTHAeV0552s+hqp
 FnrXkXmkrBAUDiNMXvVuM5lWBdIgkntZsj+0W0Wf49Wy0uoOtzRWcoHjZcMK3uZo+9gjLPYYvuS
 OK25890Rfremudqcrr6I37TR55nYL8kY00Sy2MupeiAjOVvtte8df+RT/0wCFfrNXr7abtqvN7i
 O4dh5zb3f9SAxkppzCiiuBTQtmdDvAiC49BTJiezoaLwz5lfTeqw
X-Received: by 2002:a17:903:440f:b0:244:5ef0:d258 with SMTP id
 d9443c01a7336-245ff874e99mr22750135ad.48.1755766064714; 
 Thu, 21 Aug 2025 01:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWcGaG7mkLl01PAlHDjQwKo8yhM5cKQHqs5L2UKo3pHfPKllF4MLcn53VgMP72zfhiVQznUw==
X-Received: by 2002:a17:903:440f:b0:244:5ef0:d258 with SMTP id
 d9443c01a7336-245ff874e99mr22749625ad.48.1755766064291; 
 Thu, 21 Aug 2025 01:47:44 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:47:43 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:12 +0530
Subject: [PATCH v12 18/27] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-18-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4329; i=armenon@redhat.com;
 h=from:subject:message-id; bh=9iknsY3BCg26MtH4QZ0BkNi4PlMcFCHBWM7DD/Lc7j0=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayOyldi8XMH+s+SFIwmRZX5clVMvfpJEHtnqWv+H0yd
 DY4Z8t2lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmMhZc0aGT8J+6g3xl9etyPA3
 d13QMluaMTJl63NeJ0NXE49WKyVjRob5mcy7biz29yz4FbfpUsfj+etj1U+olJ3uOPxX+mbPL01
 mAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YAlVO2C4nCJ9eFy5LPFmtoVHPPlpc3riDtf2I-IfZlU_1755766065
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 348ea9d7e57927c57131e8e747b446c232a9cdf3..c38646d5c3d75c64712561984f6b1df92ad55feb 100644
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
2.50.1


