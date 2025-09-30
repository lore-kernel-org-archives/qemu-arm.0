Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD16CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:24:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RrR-00051U-T6; Tue, 30 Sep 2025 00:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RrH-0004nI-KD
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rr8-0002ty-Qi
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrUD5lf6tAHm8WITk9QYY+K3/gMUJ0Fyx6x74O1qOwI=;
 b=IvK1gK+N229d6VeByxmkvDcMlR7iL/Ku5CIgiYi6f+JIJ0XnIZ/FBYb6B59xAS6/3vV9Qy
 jC7/MSUGsGzGzg9ofaSR5EhP2bTc+XvIBzIBLkRvBttJKWFtXEXnvBw0vjXCRM49bXv2Yj
 5cSIoHYfF5O/JBwT+At+zdmV2biRr/w=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-6ihpcc4oPQKQRZl1V4KeSA-1; Tue, 30 Sep 2025 00:20:43 -0400
X-MC-Unique: 6ihpcc4oPQKQRZl1V4KeSA-1
X-Mimecast-MFC-AGG-ID: 6ihpcc4oPQKQRZl1V4KeSA_1759206042
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b54ad69f143so7587316a12.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206042; x=1759810842;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrUD5lf6tAHm8WITk9QYY+K3/gMUJ0Fyx6x74O1qOwI=;
 b=i4RF8+RIFtjr79WadAsMIKFbwqsbfIFnetVxpugwCM7oRsf5m2JZ1Gh9EkLRqS30bQ
 sxI4GeYAIcpkZ+kwrAHdt4fwMhjqpM9Her3v9rPVtW4V0sr8dKf7U1HXX5SR2EyX5+rW
 hH39skazyB2+9KokRHwdWGOpgxWajuN6wkcKWFC2fEGk7mOqrzhBF8tsCBM+nMK9TwT5
 bjx+8NrcCHdx/F86xAW5H6q91U565cGHyO0zevnEgiePtSoq96Vcc5p94DiwT2ppNh9v
 Xz69zegBygWz2/VIljOUMYaJr0oxVGrJGS/bG9ftLgonChhfN5heong+EbOyOJGH9d5E
 Uwzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXApNynE3TFtDqDfR3pUgb76+MT0plX7sqgLSp8LW/xyLS4he+pgfIrYvDfkthMwibm/n5dOdNgTQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSg5WSNjrm65dGt5F/E3iRYcxjW9o+4TemrJ8rDPB/J3p5nG6z
 LK3bokEbzDi5Ia+0E8S4JjBNwdNnLOM1nDLh0hdKpti8+sYGwSzr4uE0XF/mqTq87BOpjF0R4Ya
 sj60Ud3cP5BzwOe5jiLMoUMRSI6KVpo1ahXwbGjCIO3FPWPwzu3OGJw==
X-Gm-Gg: ASbGncuLyCC35zd0RXaG56qPiyoK9uPCFoGKVRlPOBxPGJ9cltN8CWg3fkAn90B3wiM
 cPp7Zs1oWvPPMS4/mwjxi+X8RicVRSc6SeKSaGzDTHBkxtCJ+8Tp/kp7LnhUL9WOFisiXOKkCZx
 dsAUCY/j/Bj+Wx0U/Zu9I1pASgCIoLjU87fkJa2pC+CL1DigOyeyvZiTkx793YGaMOhQ3OrvSHo
 YbdXCfVGtmpRwsGfp6/JE7OO9rWZm5axKsTEVBhWwoBjj51FQZglmBOF4RSB9vuKhovHXlJsnkZ
 yTaqbYqRiBr1R71xs2D/rxhd+nh7q7VGb/VqS2MTsdmOdL1P5xZDVMXZHw==
X-Received: by 2002:a05:6a20:3d08:b0:2df:37cb:6b7d with SMTP id
 adf61e73a8af0-2e7c1bd0cbcmr23349149637.8.1759206041998; 
 Mon, 29 Sep 2025 21:20:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFku6zSDp9+LO2Obuu12aHqDuJXSKIl/YwVmwKh+cD+/P45ohePuS8dA6jxCOgLYvNlsE+h8Q==
X-Received: by 2002:a05:6a20:3d08:b0:2df:37cb:6b7d with SMTP id
 adf61e73a8af0-2e7c1bd0cbcmr23349129637.8.1759206041644; 
 Mon, 29 Sep 2025 21:20:41 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:20:41 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:22 +0530
Subject: [PATCH v15 13/26] migration: make loadvm_postcopy_handle_resume() void
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-13-84afd3af1e47@redhat.com>
References: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
In-Reply-To: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=armenon@redhat.com;
 h=from:subject:message-id; bh=CsLuncBihtMLZA9HzPd6iFxu43uveu3nBLMn7jx6xmo=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMGGC8L/yy3XPtE/sPr9j+DqL90sWYIaC1y3GmQH2
 iXInGntKGVhEONikBVTZGn4GiDbFFAYEWn78jrMHFYmkCEMXJwCMJEgeYb/wcef7qjQinUImThl
 UhHvuh1+R6cZv/x62dO19XnFuSrhGkaGExKFdsHKZ4/WlRoJnmhN+BGxfXWBpxHnUfekoDn7HjG
 xAgA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -jXoIMjvfRUe-0Gg0nsFH8iET7zmu5lQveenGoUQiHU_1759206042
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Use warn_report() instead of error_report(); it ensures that
a resume command received while the migration is not
in postcopy recover state is not fatal. It only informs that
the command received is unusual, and therefore we should not set
errp with the error string.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index eb2a905f32eabccf56f3444d0705409c7d765a0b..d145e7b1e55942fbcca57cc309327958526a6514 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2334,12 +2334,12 @@ static void migrate_send_rp_req_pages_pending(MigrationIncomingState *mis)
     }
 }
 
-static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
+static void loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
 {
     if (mis->state != MIGRATION_STATUS_POSTCOPY_RECOVER) {
-        error_report("%s: illegal resume received", __func__);
+        warn_report("%s: illegal resume received", __func__);
         /* Don't fail the load, only for this. */
-        return 0;
+        return;
     }
 
     /*
@@ -2391,8 +2391,6 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
         /* Kick the fast ram load thread too */
         qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
     }
-
-    return 0;
 }
 
 /**
@@ -2647,7 +2645,8 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return ret;
 
     case MIG_CMD_POSTCOPY_RESUME:
-        return loadvm_postcopy_handle_resume(mis);
+        loadvm_postcopy_handle_resume(mis);
+        return 0;
 
     case MIG_CMD_RECV_BITMAP:
         ret = loadvm_handle_recv_bitmap(mis, len);

-- 
2.51.0


