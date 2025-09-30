Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA909CAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Rqw-0004Sz-BW; Tue, 30 Sep 2025 00:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rqr-0004Of-CG
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rqm-0002jV-Hi
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6G3SrN0pZ8UoHUDlqNVP5h6JRKIWOY94Cyi09HxXC+w=;
 b=UZ79jCSS3x7BzD4I0RqCHGRNtu0Yi7qT2JaCdRbtpFaUQOL3R25413mf/WYbWmAOPsd5lX
 96xM9qsHW9gjzmQ3/pILMWRmqawrqistWp3TH2DNvB4iEzOKZG/xklwbeJRNS5uozs6IuA
 o+RT7bgaD1aGAsxEwwQJg7C4O4JB1jI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-2XsoWJtpMr2BJ1hciG-X2g-1; Tue, 30 Sep 2025 00:19:54 -0400
X-MC-Unique: 2XsoWJtpMr2BJ1hciG-X2g-1
X-Mimecast-MFC-AGG-ID: 2XsoWJtpMr2BJ1hciG-X2g_1759205993
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b5a013bc46dso2053052a12.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759205993; x=1759810793;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6G3SrN0pZ8UoHUDlqNVP5h6JRKIWOY94Cyi09HxXC+w=;
 b=A4ySjsUFx0R27dlysth4xxhoha8Feab7Sy3aQ3GrRKHAhd+4Ze3autzJJB+ydEPPXN
 rQ7jAo1tS5grJstEuTbIKmfA+Hr7iZAbQxPUZBxMtnDozVV+QigufbLTDiHTji3Dwrgd
 lKSwlNsv5k+RP+TqI41dmJoW7/jzUloTaw1bVvJtmZifi5VUzpr+PPl+7dC+QAZau9UC
 Vp3nATfL8jFQE/OtIm8SA48mX6AqXtUeV66dHcIJ6xk2WHaqk3rW38XnvelaiBci4YN8
 Kio2LXRJxduENooEYTdgf2gKsFnBS0vj4r3XRZ0whYOqfNA9z5qgM8EPnl3H9HGP23lZ
 Ha2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM0hpAQTSEABP+5xoqSQRldPtqEEY00vPoUJiSYqy1IlNUi00RElw0g+EO0VLQvkvHexeNFo+IYw==@nongnu.org
X-Gm-Message-State: AOJu0YzRxUb2ZYrEjKetOtu+2a9APLw1XCqr88S2+52oO/uyzgnAiaCg
 rir3uiHrS2D8d3cKAuqKIHpv5wS+DPpMUnBL+yKLGYKDmMB4Eg5S1a+vQDKao7Nc29jt6RD7kw5
 OfBhie+jO6fC18sYzzh0vqu2yU/vR1nu1n60hR9H3mwq9TFh3v09i0Q==
X-Gm-Gg: ASbGncvpWq9timluPEr3kBiPo/1RUteBUeHcZ7RUrov1k81Ym0hLuUBkoyTHRnLi2Q8
 tf0t9tGPruI+UGLZYYJwb5SGzoEHd2cMN47Q1zMquu3M+sj1mwzXrZmmNl8F6O1UQMXH3xNDG9j
 a1LL+SJpfs0D1qJXZrDMRIS2IQ3F0Hh0Ye+9HdJP4VmjUYRxQX2J5zvpCMiEXsbSYoC8vaVqb1y
 H6T47W2Z++ZaPPmpvxq5lcQn519C03SIgM6FDCoKAwma9ihMPCOLN3Rc5Wl+9Ba6Jmlp3+3FGxu
 ZOtbeheca7ZUTtkqe45OL9W05UgGVEQ0Whbu9DrdfdF/vcKEBqv43kbEFA==
X-Received: by 2002:a17:90b:4983:b0:334:3286:8fe2 with SMTP id
 98e67ed59e1d1-33432869004mr21836648a91.10.1759205992976; 
 Mon, 29 Sep 2025 21:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgPQDcueHEM9p7em4E4pJ2Dm0YxC0nvEZK0tyFvPh0FIJycBmc38GWmSPqQusbQDMhR5DVA==
X-Received: by 2002:a17:90b:4983:b0:334:3286:8fe2 with SMTP id
 98e67ed59e1d1-33432869004mr21836623a91.10.1759205992551; 
 Mon, 29 Sep 2025 21:19:52 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:19:52 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:17 +0530
Subject: [PATCH v15 08/26] migration: push Error **errp into
 qemu_load_device_state()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-8-84afd3af1e47@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2800; i=armenon@redhat.com;
 h=from:subject:message-id; bh=aAtWgri0JtZvm7ozV9PyXTNhz41wAlyIboBcEWP5JG8=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKMGzDkpa90wM+pf7rb+qIjD/QfDZ7LvfC+XuHTafw
 bKMQfhERykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgIkcnMbIsKJks8hpg713L96L
 k2s4YCT9ZXP41F8cxVwvt69Z5TYh9RvDL+atl3pDustTT10J+N6RuvYZ51J5MZbfC6uFlL+5LV+
 pwwMA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BpkCpgfZUrupALJxXga5TmUjWStRVyOm3y3Q6CFUb6g_1759205993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
It is ensured that qemu_load_device_state() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/colo.c   | 3 +--
 migration/savevm.c | 4 ++--
 migration/savevm.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index cf4d71d9edfa2a8a30e30e23ccbb3f72f402b6ae..a426ec5b60b8e929afe281c89be4e934fef40143 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -729,9 +729,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
     bql_lock();
     vmstate_loading = true;
     colo_flush_ram_cache();
-    ret = qemu_load_device_state(fb);
+    ret = qemu_load_device_state(fb, errp);
     if (ret < 0) {
-        error_setg(errp, "COLO: load device state failed");
         vmstate_loading = false;
         bql_unlock();
         return;
diff --git a/migration/savevm.c b/migration/savevm.c
index 88116ed278ae0e5c9b0dd055828ede69b0b876c9..9e30718995ec9a6dddcfb3dd9e9e1dc2d9d17aed 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3264,7 +3264,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
-int qemu_load_device_state(QEMUFile *f)
+int qemu_load_device_state(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     int ret;
@@ -3272,7 +3272,7 @@ int qemu_load_device_state(QEMUFile *f)
     /* Load QEMU_VM_SECTION_FULL section */
     ret = qemu_loadvm_state_main(f, mis);
     if (ret < 0) {
-        error_report("Failed to load device state: %d", ret);
+        error_setg(errp, "Failed to load device state: %d", ret);
         return ret;
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index b80770b7461a60e2ad6ba5e24a7baeae73d90955..b12681839f0b1afa3255e45215d99c13a224b19f 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,7 +67,7 @@ int qemu_save_device_state(QEMUFile *f);
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(MigrationIncomingState *mis);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
-int qemu_load_device_state(QEMUFile *f);
+int qemu_load_device_state(QEMUFile *f, Error **errp);
 int qemu_loadvm_approve_switchover(void);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy);

-- 
2.51.0


