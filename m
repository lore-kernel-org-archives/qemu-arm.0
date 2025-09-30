Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C6CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:25:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RtN-000775-SG; Tue, 30 Sep 2025 00:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rs4-0005ii-CH
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rrt-00036r-Fm
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xqxaePZFX7JBR5oQdbULc+FFYr1GnftgQIu74pDpp8=;
 b=bsECsgkvEEjETkMUggCJcTXIKPt6tWp/o89sSgBFy+8YYsrWkN3wEADliz5sjextfyL6fB
 CQODfjKMBVVOqjeWBqWWbFhMkUU56hAH6+LuyKWwsfRJ/QEmbIf9O2lgeqpT/2ASij84Lp
 07N4bXR4Y29qLjClb6JrntTAc0tZmY0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-I0nUIpgdMrWRunP5x6KGcQ-1; Tue, 30 Sep 2025 00:21:33 -0400
X-MC-Unique: I0nUIpgdMrWRunP5x6KGcQ-1
X-Mimecast-MFC-AGG-ID: I0nUIpgdMrWRunP5x6KGcQ_1759206092
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4f8e079bc1so3408980a12.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206092; x=1759810892;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4xqxaePZFX7JBR5oQdbULc+FFYr1GnftgQIu74pDpp8=;
 b=F4XSvId6DK5Xt+1gbVYnI5HUS5njL0qWHuP8xpAMIi/QLK6Rt/JorAMuMa+ItR6qWl
 ++rZ9I61lI18qeR9Z0JVKiWP93+VUaumNWWOLGjC5roD5wxy3iX9gYZWSpx4djrVhRhY
 PDmEZ+XX4FjwrxGw8oyepLk3iD34MWLVXVa60mk8O8TCzdU6WQ3qwdE+ewTqSXopBby0
 E2l2w9DbYKUti+jvZwkkJOMyk98c7gxV9nAt0Pm2sGpe4Po7XikMMPs4M7Tb+rkKuEdy
 w9tNBxJccnF9w7mAM+iZ7IzvsGxplFAn6Z4q6DwmqYm96sfvyHtOJpu2qVEVUYQMvPmd
 bD0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1F/fGQxqzRnn6bH/+/qkGyhM4nMLpIBpWisVZhBdzv0Qikl36gqQBAhuLkPtDiEQ5z+Akx6oTuA==@nongnu.org
X-Gm-Message-State: AOJu0Yy/eIXUNQgeEF6MdKN9ufq5+sPgzeWQuqcgOhBSpnnzak9VljOa
 RRJeum3iZyVW1FKXx0ZDEpBviKXzs3zRxn1deUj27B0OdAiVb8oOkJlyzBJ+rC5qRwqPFL5cpG/
 2SK0QNs7RzFfeij9xW0KRY7qIMfz9NZ9UT+k861Y9so62rvlla+n2yuP3QsH9Ubkw
X-Gm-Gg: ASbGncv6ajkMBljRUqZ+2NjbwvNxVBPEPR/VWRXp7/eEtctEGlw9xNKEggDzg8YK4T3
 vFjHwLo3nd/f3kcvkAI3n/A+/ITEN0kTGLXCWRu5Co9End+jh280RtAIduVk1z76TAmsa3OXp2C
 C0cKuP4CZMFQSdvxsqx9eB9SGtHgq8S+bc5ke6gM0IIfvYZEmjyChykhGgU1RVMTMjEHjDqZofW
 YHrALNKjdkKMZgfzj7SOW94sg8AT3l88bsvN6mzX9iuGsbfPlWft/xA5RHhm4if2di7t+GB0C/0
 577/FRplZH3dmkxksPwlYqIvYVG7OgRnagysmx6zab8uxrOdBuU1d2PsXw==
X-Received: by 2002:a05:6a20:7f90:b0:263:3b40:46d4 with SMTP id
 adf61e73a8af0-2e7da45fb33mr24019439637.56.1759206092244; 
 Mon, 29 Sep 2025 21:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx560X+M9YrME/Z0Tz5cdZofYwihPyv09u2PRvoW9m2bU2A7m5dsWlm4DAGq94Sy2DFTIFhw==
X-Received: by 2002:a05:6a20:7f90:b0:263:3b40:46d4 with SMTP id
 adf61e73a8af0-2e7da45fb33mr24019397637.56.1759206091784; 
 Mon, 29 Sep 2025 21:21:31 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:21:31 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:27 +0530
Subject: [PATCH v15 18/26] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-18-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4432; i=armenon@redhat.com;
 h=from:subject:message-id; bh=h5tW37GzpnqCtqAOXaHs7SIfLXHIjIq7utdpfmqZYuI=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKEE2p2M/dJYGbm48bPfpz9d3RezW5i3t3xn+R3Ps6
 VpTKJ7VUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCLhmYwMB/++idh21ZIrtUx4
 Z7lg8ZG2J4qno57Pf6OlHrn2YZpfPyPD98XPD853/+pz4tK03vT3emunT3HkOP5girD79OoJH69
 +ZAQA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PhIosUE_55C6sn-DEqqLcmRst4BTc8desvQqihtahQo_1759206092
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
It is ensured that loadvm_postcopy_ram_handle_discard() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index f7947160fd5af351a09c0ae75879e80710df4c7e..b80da04b47ff08b4cb6aed1a57c703acaf3eb9ac 100644
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


