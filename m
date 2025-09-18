Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE250CAC59A
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:26:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGWR-0006e9-Iz; Thu, 18 Sep 2025 11:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWP-0006TE-89
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGWN-000377-ES
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Za1NNvSl7uFr3wDIymXqGWcBuLkcyiqwtqIRxvI2IEk=;
 b=UnB2OPmdDjj7DaoeUY+ARQAnAQ4M0FttmqceDzkk6zM7mjEra5N86+U59tstDbGWm6LJRD
 MBVVBx8i5dbl7Ht4b/QZ8/PH9JCYBvwFwjcbl2pqVk/1IkPZyL/OGRmZhvBxa7vuo+TPHP
 nGTe/1mH6uCdfqeLMqL10m0HPxGzHMM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-E4mJGT6mOCe68boAk0EIHA-1; Thu, 18 Sep 2025 11:26:05 -0400
X-MC-Unique: E4mJGT6mOCe68boAk0EIHA-1
X-Mimecast-MFC-AGG-ID: E4mJGT6mOCe68boAk0EIHA_1758209165
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7779219ccc2so1334820b3a.1
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209164; x=1758813964;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Za1NNvSl7uFr3wDIymXqGWcBuLkcyiqwtqIRxvI2IEk=;
 b=l4S6FzHSSPHQjrMeBeBAXK0UG64Zcrf5M0wbCf1NfJF1iEbKFLvIgvvt230TTYQfZn
 o1Whf9cwiEMcbus/SBhxEj0H68dHk7+MLOj81Ydn469+1nNZ28bCEqsljV+qR3KGhdPz
 SqfUeLvrpwW2CR/h+NXJEa1pdeLEmhiBb7hJ0R3djbngsdynJAz9lD5dlIuekMN2xsUf
 vWagQf2muJJQHg1suJyPm3n0m5KAurC9kqHI3VNs1O1EXFdRknOglFuxe2shYs+euZOi
 StpiPZZfNSc19Lo+nX8rnb1VGdrgzq7xh4yXDHyku+R77YGgKPYAJPRJtird8QW5kfT0
 DdZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXH4ndcV/MV48w1NU24z2pEGs85QgzjvWvqlEd0asPlFMoEMBkxRVG2+vc1aznHS7uzpf+Xg2clQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx0/0OuVTBvDF/cBMbeEqagi/JW0w8vLzMCXCdsBR03My/PBXir
 eEzKfGNpKMHth5EWhPqFYcZal6dGJsqZUacMKw2ason3+wcv8H91x81iwb7UVQZFwo6itacyV5C
 vFwlgq83gySqJ0uSwTmXW7JXokIq0R3Vw7zTpB0b5iIMo7OuXUZz4Ww==
X-Gm-Gg: ASbGncstKfFOnXhUdqLMqRFfB/smZIcw4sZJzk6VpZFNRi6Y3xdSSvXuvAVXMI/J+vx
 LOhQ1S98DOP6HjE1pWFy0DfF0MaBIePhp+aMyoCaY9HnaKuKL97R/mPtEafD2Nm6o1e84rIVtqq
 6IvvG6PVBkI7dunxNvyETtvaH2QTXhheiaSzQ/Z+xygr77dQlj642c2WjiZP7UeLuNfAbOLrKKu
 fcv9bVVIa4IeojPyt6odpjfZMfpE5WDwKmB+JuPro3cN1sHDwNEnNAdwWrLw2H2ScumC/lSC9ou
 uhoY6rFlJGWTMCno2RsLEtIBHuZfkbaWC1B3gaHUf5irI0C8rlT9Vw==
X-Received: by 2002:a05:6a00:3c95:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-77bf926836cmr6875658b3a.16.1758209164510; 
 Thu, 18 Sep 2025 08:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8ncZ9So2Y7vmCD4CO66kVw3lIrVIcv5pjax3rehicl/SDmqaYvXAE21WslU6uduuZjTgAbA==
X-Received: by 2002:a05:6a00:3c95:b0:770:343b:5457 with SMTP id
 d2e1a72fcca58-77bf926836cmr6875608b3a.16.1758209164127; 
 Thu, 18 Sep 2025 08:26:04 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:26:03 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:33 +0530
Subject: [PATCH v14 16/27] migration: push Error **errp into
 loadvm_postcopy_handle_listen()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-16-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751; i=armenon@redhat.com;
 h=from:subject:message-id; bh=BsaDnW57QysoXysSxJ9DH2reNuwbEbmWWZabpe2MJIE=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R8PFbfyPLfkW1HwJv+mqcrXiXcCfSSXr2s39nTeX
 zvT88yijlIWBjEuBlkxRZaGrwGyTQGFEZG2L6/DzGFlAhnCwMUpABP59YzhD89n9Qs2sgszLy7+
 9kVw+eF85dypCTsy5C+JPFWaU3C1wpiRYUvMY4uyhNePD219/aD43zqzCKGq04/OzL96pUVbrXh
 1DxsA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zzvZcYM_x78CWJeCMWRB2XI9NGTTZ27NLQsSF57ymWY_1758209165
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
It is ensured that loadvm_postcopy_handle_listen() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 680f6e1c4bbc979f779d9fde28ab71ae234b5891..c681d6d21af356a97645f2a0d36e7440e3bd95c6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2181,15 +2181,16 @@ static void *postcopy_ram_listen_thread(void *opaque)
 }
 
 /* After this message we must be able to immediately receive postcopy data */
-static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
+static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis,
+                                         Error **errp)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
-    Error *local_err = NULL;
 
     trace_loadvm_postcopy_handle_listen("enter");
 
     if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
-        error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
+        error_setg(errp,
+                   "CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
         return -1;
     }
     if (ps == POSTCOPY_INCOMING_ADVISE) {
@@ -2212,14 +2213,14 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     if (migrate_postcopy_ram()) {
         if (postcopy_ram_incoming_setup(mis)) {
             postcopy_ram_incoming_cleanup(mis);
+            error_setg(errp, "Failed to setup incoming postcopy RAM blocks");
             return -1;
         }
     }
 
     trace_loadvm_postcopy_handle_listen("after uffd");
 
-    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
-        error_report_err(local_err);
+    if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, errp)) {
         return -1;
     }
 
@@ -2622,11 +2623,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_postcopy_handle_advise(mis, len, errp);
 
     case MIG_CMD_POSTCOPY_LISTEN:
-        ret = loadvm_postcopy_handle_listen(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_listen(mis, errp);
 
     case MIG_CMD_POSTCOPY_RUN:
         ret = loadvm_postcopy_handle_run(mis);

-- 
2.51.0


