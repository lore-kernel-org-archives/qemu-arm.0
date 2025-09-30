Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CFACAC5B8
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:27:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3RsR-0006A2-36; Tue, 30 Sep 2025 00:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rs4-0005jF-De
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rrk-00031K-HD
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8CmClTn767fzlgK7mesvRUnHIcyXILRz6KYIi0pcA8=;
 b=iejP4M3fHOT8k3UefVHOAeTyWJ8OOSJg/uGJeTR579ktybs2hDv5x/I4vxpuH350KFMiue
 BzD+8ZT3aXBT7aok4wNnW00Vmu3VltdBQBLIZNBL27c/E9647dIyhK1BlY/kNmX2Dc4YFb
 5ri8Y8QPra0+BXk4ziYXf25t10QvpH8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-3aXCLTo_NRGwLTAheIS0kQ-1; Tue, 30 Sep 2025 00:21:12 -0400
X-MC-Unique: 3aXCLTo_NRGwLTAheIS0kQ-1
X-Mimecast-MFC-AGG-ID: 3aXCLTo_NRGwLTAheIS0kQ_1759206072
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b55118e2d01so3756646a12.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206071; x=1759810871;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l8CmClTn767fzlgK7mesvRUnHIcyXILRz6KYIi0pcA8=;
 b=TDlO5EV1+evInTzqZBO9BN9DoIvcIorNVSi+Csm7lPJ4GhGht5UTV0PTmIVtOECC1m
 UJzTDZ7y9NIGv2fQBUAZsJ6dmWhOQi/qFhz7h12xKhDJ8jvYAOf09Wi3KD7PPWmgvGWV
 oZ1Jwa8hf4sH/EHBWDPNrXp1QqLMEzxGJHvzIhIPWlFTBjc65vm23Yikkgb1Z63mJUIs
 uMCs8Qijt0T3JmijynUkFJL6L7MdqIjwZfTg6zaxBJZPfDO3/Fx4spKmzvr3Ghspb2Bq
 JyWvLuVJTDseA3NUzowVKHbx5UOtjcroDUIwNfUg71ttpudrG2qAJwZo3EbCF1vkz5sH
 x2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKyIMpG+6Ww3pyH9pTwd66EV4ScMclnx6YUraSLzhl89QDJpXDokJUZHbICKKYPWJHqQ+EEqnkoQ==@nongnu.org
X-Gm-Message-State: AOJu0YydWqBl5dveEHAvoxjIxu0HkSjwHHG+sJ80OuU53DL0MPkER7tA
 mGXzw982yqDHNifiXoZYJkLhCOV9L7r+Inu3Oh2UcUkAwLkel4NbXZ4ln5hv+L+Vr3DM4CxOhcA
 RnkA9lffLmqQ2pMYFqXp774AGgDB2mZBIQXBkwuOnN8fiPsxv0yb+lA==
X-Gm-Gg: ASbGncsRPmEy1mZu+8LB7QJbtQGtKXfwjez7GtSzFZ6zC+eR3P28vEEZPV7V5rdaol3
 3CR8zd5ZarOV2jnusiwHFrESc/Xij4SUmayVzYKbF4vvqkkATK1GhxRzpODIs3XNFJ/5YMFqWgg
 rjCilIWquo8GFIa7OEReIbwOntvPGQmu6L2H9frdEGUf6ZdlFmbKpTOIYr3l9kZ/+QLCzB+06Kq
 snOaRPi0lpX1TneG5FAq2O9eH3knCDpkyofWFhHYYLqqtrDkYXtmWeP4bLqIZAGxXW+XRLK6Pbc
 uGiTaYOuguz0xeIfQe04bjHSf68dOhgXNMnhyEJm4jSkMCckjgM4Otl2Aw==
X-Received: by 2002:a05:6a20:e212:b0:2bb:b5b0:b3a with SMTP id
 adf61e73a8af0-2e7a83b97f1mr23602540637.0.1759206071633; 
 Mon, 29 Sep 2025 21:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH56+scKBAdReYX5auuKn2Ie/e0jDOBK1krWRIp4OK+rihfkBYWaVqsF9c/EKe2OefBPUB/+Q==
X-Received: by 2002:a05:6a20:e212:b0:2bb:b5b0:b3a with SMTP id
 adf61e73a8af0-2e7a83b97f1mr23602488637.0.1759206071186; 
 Mon, 29 Sep 2025 21:21:11 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:21:10 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:25 +0530
Subject: [PATCH v15 16/26] migration: push Error **errp into
 loadvm_postcopy_handle_listen()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-16-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854; i=armenon@redhat.com;
 h=from:subject:message-id; bh=nAA8BsGaDR3a6jQpR4FRIy0fuoBBaKYvTfUGeBLbc8I=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKEGBN9kX1szVbehffnHylL/lG2Os4zeauk5ebvpUY
 1WD9qKAjlIWBjEuBlkxRZaGrwGyTQGFEZG2L6/DzGFlAhnCwMUpABNJb2JkuLMoTaBCY1v/hubn
 Ve6LH0T3LZl+3Yx55bf/P9N+q/XMvcvI0LSoRCS2+PWWpKLoiy+Vrf8d0zqmUeE7VfuijZlg/ZQ
 8dgA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fnhIGq0UtGDUtcc_TbjcdSv7eJL7USx1VjYCZAEAIUc_1759206072
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
It is ensured that loadvm_postcopy_handle_listen() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 38e22b435b6b486982e75aed592f54dbf7b313b6..ce88f56498cf88a30de4f0d50c2b5068e4e3939b 100644
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


