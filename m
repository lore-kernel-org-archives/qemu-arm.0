Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58542CAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWK-0006AO-GG; Thu, 18 Sep 2025 11:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWI-0005th-K1
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWF-000358-VA
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9sqDXkDqoF2sK/YqGONtbwmKp3jZKoCMKUxLstVdcU=;
 b=h4sHqnOGKMSz7iP4PoRfbgsjBqgv+yEd3K7WW4Ml8BZchP/wKjLI6bAsSXSD8eq7Wnv4DM
 dEBrDCIccN+LvaabL7xUuSue/yfxJKw4bl2sso3pek4UrqHEdNVsWS0rvI70XnvRKo7pKB
 oUK+lokentxKitSTrVdoEbZ+W92Dbvg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-5xvl5cA0O9mJR1apdzQqUw-1; Thu, 18 Sep 2025 11:25:57 -0400
X-MC-Unique: 5xvl5cA0O9mJR1apdzQqUw-1
X-Mimecast-MFC-AGG-ID: 5xvl5cA0O9mJR1apdzQqUw_1758209156
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77e13772b37so128726b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209156; x=1758813956;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9sqDXkDqoF2sK/YqGONtbwmKp3jZKoCMKUxLstVdcU=;
 b=CLKpS1qcJCGf4rubxsHQ2biKmTFx0pnIqbrn8hVWaVny26JsNcVMQuYp4YeJPYd7vN
 sQ4omiirfD4cbvADvZdkm6k/q0SRJopbqn+4OIl4yaVVXM0c+JcD4d4oZEj9OSvvtL14
 bd5dUdNg34NiJudqRdg1kFh0CuEWIa8SW8DrS7fA4+9wz+HqFU1vbsWeK5fyxKCcmS8L
 ophBVMMLgGIyWvkP5bSCYxZN165PlEWMmzc37Gfaa7E/rsjjVHSXR32IPL86YaKdUIXK
 hXt5uqWBbGVmrb6PHk7kdKUimecCGxC+gFi3plEkE7nYjpNRwxHWo+Sa4XnT9sOR4ykM
 RK1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA6a/8M3KfdBcuOg38DcNGsQi2XM0jORH6xmyjFfGyig5XFnLiIKnGeS8/iy3WbzsYt4D+0zZz7A==@nongnu.org
X-Gm-Message-State: AOJu0YxXEca5nGtUiv4euWZv67etfj/7fIg5CBx9RrOkBm1hjMk7MUp5
 0CMp4MdhJMjK89ZhHXcb62PySjboXCH3hGVLt8zZ9NNrEDJCDF1F52dvIROE117p+ZBZIewSoU9
 VSwWkBt85OjC56s+dlIwVof7ffJnVJbv+w0Fxk8+tYUaB5SwJs8x7xw==
X-Gm-Gg: ASbGncsNuLew/Drsk2ZfV9UWBkEeFmGy8xqj4Pbvm7GFwqv6Xl1PfV+l1DgbcFZr9Up
 OR8epUS8j42eToMJd27mRyYWntlI0y/cUn+C/Y8z+vkjTZ5WFvns4fxOPOhxJuAwvXWeeadbWOI
 pbZVwGub3nasXRRz04LCxShfXwFwrYqcNRoq7HTpB7Rkj3uAB7MMye9EZ1EaWyHHbXriHDrbwvN
 Ze+hbS8V6VeUbuH0HxQT5gz/Uh6BDEAj+pnxHRAFFYw7koO9v6RERVza2LOsUTv9VYdDJbZFrpz
 3yr53Ap8PQRyPvjs3ZoPdnEOEqino0eYJwnv0mbSfT7FhRIp35tOLQ==
X-Received: by 2002:a05:6a20:6a05:b0:262:9461:2e59 with SMTP id
 adf61e73a8af0-27aa204bb20mr9286627637.39.1758209155863; 
 Thu, 18 Sep 2025 08:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhv6M3IrcIKXM2Am4q5WhZRUeSLMKitZDLZxZNZ5Tix0Sw25p8Oqs6t7AoMpW6BRpCeY7FIQ==
X-Received: by 2002:a05:6a20:6a05:b0:262:9461:2e59 with SMTP id
 adf61e73a8af0-27aa204bb20mr9286574637.39.1758209155423; 
 Thu, 18 Sep 2025 08:25:55 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:25:55 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:32 +0530
Subject: [PATCH v14 15/27] migration: push Error **errp into
 loadvm_postcopy_handle_advise()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-15-36f11a6fb9d3@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4838; i=armenon@redhat.com;
 h=from:subject:message-id; bh=YIrBpYmjnNrlQEW0CrE8o05ulfKM6YeYARhM3eBobvY=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R8+kwQSmS2rd/+PjT176b9UxRHlvWIrTEQV+x2d9
 CqaG552lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmEhKECPDjOatZ1z+KWrtzTrE
 wsi5/pnOs9oPHfkqe7WSpS5GtyjzM/x3nnH8EIdzyOHbUZuljR8ttC18Z/Dz+VLfHJmtAj2cmkX
 MAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UdTLq0V37RQW6UqvbwWPEpQf1KurQhd57AvbDf5s0pY_1758209156
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
It is ensured that loadvm_postcopy_handle_advise() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index a1b606318f2ae8feff42b759ad308ebbd07318b7..680f6e1c4bbc979f779d9fde28ab71ae234b5891 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1912,39 +1912,39 @@ enum LoadVMExitCodes {
  * quickly.
  */
 static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
-                                         uint16_t len)
+                                         uint16_t len, Error **errp)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
     uint64_t remote_pagesize_summary, local_pagesize_summary, remote_tps;
     size_t page_size = qemu_target_page_size();
-    Error *local_err = NULL;
 
     trace_loadvm_postcopy_handle_advise();
     if (ps != POSTCOPY_INCOMING_NONE) {
-        error_report("CMD_POSTCOPY_ADVISE in wrong postcopy state (%d)", ps);
+        error_setg(errp, "CMD_POSTCOPY_ADVISE in wrong postcopy state (%d)",
+                   ps);
         return -1;
     }
 
     switch (len) {
     case 0:
         if (migrate_postcopy_ram()) {
-            error_report("RAM postcopy is enabled but have 0 byte advise");
+            error_setg(errp, "RAM postcopy is enabled but have 0 byte advise");
             return -EINVAL;
         }
         return 0;
     case 8 + 8:
         if (!migrate_postcopy_ram()) {
-            error_report("RAM postcopy is disabled but have 16 byte advise");
+            error_setg(errp,
+                       "RAM postcopy is disabled but have 16 byte advise");
             return -EINVAL;
         }
         break;
     default:
-        error_report("CMD_POSTCOPY_ADVISE invalid length (%d)", len);
+        error_setg(errp, "CMD_POSTCOPY_ADVISE invalid length (%d)", len);
         return -EINVAL;
     }
 
-    if (!postcopy_ram_supported_by_host(mis, &local_err)) {
-        error_report_err(local_err);
+    if (!postcopy_ram_supported_by_host(mis, errp)) {
         postcopy_state_set(POSTCOPY_INCOMING_NONE);
         return -1;
     }
@@ -1967,9 +1967,10 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
          *      also fails when passed to an older qemu that doesn't
          *      do huge pages.
          */
-        error_report("Postcopy needs matching RAM page sizes (s=%" PRIx64
-                                                             " d=%" PRIx64 ")",
-                     remote_pagesize_summary, local_pagesize_summary);
+        error_setg(errp,
+                   "Postcopy needs matching RAM page sizes "
+                   "(s=%" PRIx64 " d=%" PRIx64 ")",
+                   remote_pagesize_summary, local_pagesize_summary);
         return -1;
     }
 
@@ -1979,17 +1980,18 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
          * Again, some differences could be dealt with, but for now keep it
          * simple.
          */
-        error_report("Postcopy needs matching target page sizes (s=%d d=%zd)",
-                     (int)remote_tps, page_size);
+        error_setg(errp,
+                   "Postcopy needs matching target page sizes (s=%d d=%zd)",
+                   (int)remote_tps, page_size);
         return -1;
     }
 
-    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_ADVISE, &local_err)) {
-        error_report_err(local_err);
+    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_ADVISE, errp)) {
         return -1;
     }
 
-    if (ram_postcopy_incoming_init(mis, NULL) < 0) {
+    if (ram_postcopy_incoming_init(mis, errp) < 0) {
+        error_prepend(errp, "Postcopy RAM incoming init failed: ");
         return -1;
     }
 
@@ -2617,11 +2619,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_handle_cmd_packaged(mis, errp);
 
     case MIG_CMD_POSTCOPY_ADVISE:
-        ret = loadvm_postcopy_handle_advise(mis, len);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_advise(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_LISTEN:
         ret = loadvm_postcopy_handle_listen(mis);

-- 
2.51.0


