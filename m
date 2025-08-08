Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0A6C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMue-0001aC-T9; Fri, 08 Aug 2025 09:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHMm-00046M-7U
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHMg-0007bt-AB
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbMZj+sBG4f9RIqMEyWNKSRMh91cMhuYSoiYPz9zI4U=;
 b=ggDXAMTMfLj0LW0A10On66c5WPGo/iQOZqt00TS0ES6iVWsY1kEZ5xVQ9V7xPxs0dy7xq9
 81Q+N5K9X9ZLFzfmxVMxI3IdH7RrHFst/l2oubaJw4jHaiLyyjTUhLEtKtOdgcuH5NMd5T
 3i5A+VfP1l1aNjYORWcPRrHTpFPoL3c=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-xfzIhfVvNISfpfMQuXmMkA-1; Fri, 08 Aug 2025 03:18:06 -0400
X-MC-Unique: xfzIhfVvNISfpfMQuXmMkA-1
X-Mimecast-MFC-AGG-ID: xfzIhfVvNISfpfMQuXmMkA_1754637486
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-240607653f4so16424625ad.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637486; x=1755242286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbMZj+sBG4f9RIqMEyWNKSRMh91cMhuYSoiYPz9zI4U=;
 b=dV5NUNzPyocWLuuQ7zPbfZKrqMMmvwdVVaFBV5SA2YQdjSFEjZnVP7kzntPEycpSJe
 SAoXaYeWGw7SUUksDLn5z9qMAguZmVYXwcdpYymRURsWR9FSo5UuLxw9W6cgGTf90HG1
 c51jNxCsm92vnFDJ5wpZA8QZ0wR/DxLqG1xk9DxdRlDT2Q0ijMCsDEcTGJ8sCFby8+Qq
 6LvdUtiTJGYeyfY0+zx/a1oHeE0hkFKYeP78sMVROyYhOe0mmMYQd1nmz1WmyVTn8Ip0
 jYoya6GGZdkIR2Xu4FnMpdwK594CGJfBqb+o2FCQy+GW2gT97c2wlzJCWaIYbAaR8IrW
 6+0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhVI//HOJfklGGrZ5yN88iNZN0BJM7F7mOHCV8uRJw47gQw8bDJQbFZsG6BggOHTDb3BlCpMoocQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEJlrCzMWQmp0UQIFwfc0GDjMx05nQShla4nRgw/W5Qaw/nDfb
 zOk3LV3oX5GVO4OoatGd9Ke3ANJf771fGlp0SzE+lCJlB5aK0T6c4lUW5vTUvJ4+rfvDc/F5x3B
 q+sM3FujQDZESNxDcp8iyd2jrl0myemIr+XkMPGhtpTulNfmiru4jqg==
X-Gm-Gg: ASbGncsb6AcCyPmCVc0jgg1Zqh44aXUUoGYeq5w/puH0D4gVZb9VTUG/Pc+NkNPkylq
 1ExPjr8H8qw9QqU4vpesISvfWAjETe2fA7LIm0jmeqQZg4OPH3gjjI9RD7lqNMB+ZF9b4bAtFUa
 Q25TVcXm5dhQVEQRGcREDbsvs3vUZ9nTxf1rVmGbWSTR65giPeUCKa+G3R64//t1sAvh5O3UwdE
 15f6nA9BCqNP57oMn8HiJ0MdSx58lb+olpKpXST5oJBsWajq9ik1wqiCOF0kotsnKAl6bsHqml+
 qTV4hpZo73pL8G2KNUyV4082prWpGAzPLEF7fbOCVYB2kYHyeUQydA==
X-Received: by 2002:a17:903:2345:b0:240:58a7:8938 with SMTP id
 d9443c01a7336-242c1ec9e7cmr33543655ad.7.1754637485828; 
 Fri, 08 Aug 2025 00:18:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGhebWRhTxzJ61E3LzQpVxhx97OwHa4NdAGxpl8PL0ki8SKqV/cZCGTMYY0EwFJHTElZINOw==
X-Received: by 2002:a17:903:2345:b0:240:58a7:8938 with SMTP id
 d9443c01a7336-242c1ec9e7cmr33543155ad.7.1754637485410; 
 Fri, 08 Aug 2025 00:18:05 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:18:05 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:49 +0530
Subject: [PATCH v10 23/27] migration: Capture error in
 postcopy_ram_listen_thread()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-23-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111; i=armenon@redhat.com;
 h=from:subject:message-id; bh=t7X0faJK5S0/xZxPw69RJ1/qcJmmzgO/i/W5ZA7JsoM=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxdemd8xRZYu2n6LCF/zq8f93a/dP4dNpUTDf78x2l
 6vwUYBBRykLgxgXg6yYIkvD1wDZpoDCiEjbl9dh5rAygQxh4OIUgIkITWdkWDPrZ4XOFNeHIUYO
 dy/GeKj6BmoKR/8sjb7cxNkTlrJDgJHhqv7eLb3pBuGdN1OYPAOmyNVOuH2xf9mqHw+EGBsdPvZ
 yAwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cPb7rxuYPs9dsJH5Sv5LulLEC6EXrcplCkPOlG68l8g_1754637486
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
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Aug 2025 09:13:20 -0400
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
postcopy_ram_listen_thread() calls qemu_loadvm_state_main()
to load the vm, and in case of a failure, it should set the error
in the migration object.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index de2bce276faa863a0f25deedafb0b784f10559d7..c3187ca9ae8534870d47056fff0511426ed08fb6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2095,6 +2095,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     QEMUFile *f = mis->from_src_file;
     int load_res;
     MigrationState *migr = migrate_get_current();
+    Error *local_err = NULL;
 
     object_ref(OBJECT(migr));
 
@@ -2111,7 +2112,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
     qemu_file_set_blocking(f, true);
 
     /* TODO: sanity check that only postcopiable data will be loaded here */
-    load_res = qemu_loadvm_state_main(f, mis, &error_fatal);
+    load_res = qemu_loadvm_state_main(f, mis, &local_err);
 
     /*
      * This is tricky, but, mis->from_src_file can change after it
@@ -2137,7 +2138,12 @@ static void *postcopy_ram_listen_thread(void *opaque)
                          __func__, load_res);
             load_res = 0; /* prevent further exit() */
         } else {
-            error_report("%s: loadvm failed: %d", __func__, load_res);
+            if (local_err != NULL) {
+                error_prepend(&local_err,
+                              "loadvm failed during postcopy: %d: ", load_res);
+                migrate_set_error(migr, local_err);
+                error_report_err(local_err);
+            }
             migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                                            MIGRATION_STATUS_FAILED);
         }

-- 
2.50.1


