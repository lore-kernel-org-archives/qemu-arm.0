Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97DC87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:15:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuX-0001Nt-G2; Fri, 08 Aug 2025 09:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHLa-0007Go-2t
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHLX-0007PT-4E
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeeC3t4cXCVe4GY2cImcQMLvhFUnSsPhLhudMTgdDFY=;
 b=gY0N5Mh0HdhtfWLWdG50BZlX9CeYDr1/8QtN6n6t8115uUEmEd9N0dGflrg+51nUduQQEF
 69BC1BRe1n148tpoTuq+kQSt1DV+NddLJbimcseAnIrmEX0QZNnhGnSymSE8OtD6yCfirJ
 GHPsB0Q5A+2dt3ZFr4tqSUBrxWf5H4w=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-fYfpbofIMFmYItluk_BYBA-1; Fri, 08 Aug 2025 03:16:56 -0400
X-MC-Unique: fYfpbofIMFmYItluk_BYBA-1
X-Mimecast-MFC-AGG-ID: fYfpbofIMFmYItluk_BYBA_1754637415
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23ff6e5c131so15396835ad.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637415; x=1755242215;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GeeC3t4cXCVe4GY2cImcQMLvhFUnSsPhLhudMTgdDFY=;
 b=ECZPDeLhRBi+dUw77rFFiggoKRglBbXDZ5ZfphXhYKMXZMLJ4JaoGS6QPHgPaAWnZl
 t9ieG3Zgh2TppDig77vZJ4DfYZWI+eAaQ3vOc8dZBKld/aHUWdXDG6UHPaDkzR5s21+h
 aLmCPUcMxTlcr+eeKQS+EfOjKQfCXbT4wtDzvKfa+j/xwjwU9PVm1KVzGAy/Go6WdEbE
 SsyqEp2Yjg2evOKMAR+A8F9QY0Yig+LTTpWrk3C5sDMiIhZnjN37wCzlQpu46reAq2EA
 fhdfw9G+/Y86ydvmiD4UNvwtwrkA6eGzog18U7UwrVbwzKQG03X/OK9utiu/HTWllZ8X
 ZFTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnUFPWnvT77NjOzGHbwc4XNyaICLWv+jISXgCAuJ8s9C5pLOFO6kgZ7YbEtUZylSuMzL8daiab3w==@nongnu.org
X-Gm-Message-State: AOJu0YxYj+cCANwyZ3ECsBBTw7bue3ksGxb9jUB2FQI5E4KE1kRXrMSJ
 NkJCQXTqTZKCRqMEcML7xtAXtLUBK5a58gt5UOX65YEvkUtTqZoixQlSMar8VPylYcIXxtkd4Zx
 sls9VP7TTQf78nrdBNadhe6el5H9wEwXHtAPCpPXiUeyJk1qBSarAqA==
X-Gm-Gg: ASbGnct9YEW1SgS+mRxArGXARZTv3lHYe1cSmYb5oTnTS6fKlA7hqmPKzQC/Ob03Gq5
 u0K3cPN9ErtuuPnh/ZVNQHnppfs2LvbbVnBqdHPyv7ph/P1e/KM5S6wY5jWFLe8PY8yLw2vof6N
 QGsELG++Z5z6HNFk4OR4qCfcabb6NUBdKl0hyBTH3wXVIK/dPiJPf0zjbQSIKl1lNbrc80Xz9Xk
 rB/zJIVsDQlDl6m92Pfcyf5a2Lxd7X8JXJ6mHAdA3xHSXzRYiYM2H8iKY4O6sWWbNNgCTKlaaVa
 Q30UkWIVYzzkfK5gSV3jjRohq3HsjrrNZgN8Yq54GXnzaGJPMAhTgQ==
X-Received: by 2002:a17:903:41c7:b0:242:b315:ddaf with SMTP id
 d9443c01a7336-242c1fdc0a3mr34539125ad.7.1754637414827; 
 Fri, 08 Aug 2025 00:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxtBkDZ69Svpemiyv8oORXgonpZzt8jubH4urFiqXxL+xMTvKKYpvMbbPR8oBxUkGRzFIFrg==
X-Received: by 2002:a17:903:41c7:b0:242:b315:ddaf with SMTP id
 d9443c01a7336-242c1fdc0a3mr34538705ad.7.1754637414389; 
 Fri, 08 Aug 2025 00:16:54 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:16:54 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:41 +0530
Subject: [PATCH v10 15/27] migration: push Error **errp into
 loadvm_postcopy_handle_advise()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-15-3e81a1d419b2@redhat.com>
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
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4792; i=armenon@redhat.com;
 h=from:subject:message-id; bh=Mtu+Ybq+gxv/VQ3achH/Q1vShwUDXfGo7Wkn116W0K0=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVe/CKarbs/KLPzvcTegKDWt28PgX8G/+B1zb7BE/
 n+Yv7e7o5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwEQmvGH4Xzox7WWW3KRkEyHB
 frfrXOF2bz3F2CMfZ9XdUXxZ9iiGjeF/5Ny3baskTCYznWR5YD5LWnXdqtbEZU7i9aLXOBesC1v
 EDwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MT2_xaljJofy_dUvvIy3AbNWeq6eln3Y1N4QQ7nzWCk_1754637415
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
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
It is ensured that loadvm_postcopy_handle_advise() must report an error
in errp, in case of failure.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1f502f1cb15c951a0845dd27a4dee34fcea3f753..69c482b6fef5afca9ca02f9ac86339ffe1524e2a 100644
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
 
@@ -2619,11 +2621,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
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
2.50.1


