Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7290C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuP-0001Cq-6H; Fri, 08 Aug 2025 09:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHJr-00065C-85
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHJo-00079w-Gr
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v0Wy0NSbA5uZ0B0ojmXFDTE3N7jK7tm2qCkdD6UUW0=;
 b=iDVzkF37IGREtgKF23m77bijX6SBeCh+TGjaHum+DrHrCiIcxNnLB4yiuPk0Q+hqBz77VT
 gxE7ZFiPUD3g4WBDU0iQ5ibi3fTrFYiFW0oqypr9UEMqBss4lwTZWxdF84aqjyo8HI7SX6
 aQT7qTYXKCkKM3eOcrChXxwygEpYHl4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-gohZB6dmOqa_KKRrnu7vmg-1; Fri, 08 Aug 2025 03:15:08 -0400
X-MC-Unique: gohZB6dmOqa_KKRrnu7vmg-1
X-Mimecast-MFC-AGG-ID: gohZB6dmOqa_KKRrnu7vmg_1754637307
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2407248a180so16360145ad.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637307; x=1755242107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1v0Wy0NSbA5uZ0B0ojmXFDTE3N7jK7tm2qCkdD6UUW0=;
 b=Dlq+PMYc0laH1ZOZ4aF6Zq1mTHZ6PMcUUtBgLmUzEAMgeK6BCuc6vScj3gS5d7MjUm
 CuDB0IERt2yjeE6aOnRaxahXYP9dCqWNC7ZNCtJ1dBp+C+K8RGWTO1PaNaDo5eTXDfek
 Lx8lTAjh32JxcRJdzAlIy6sVy/YKuGCyE95xEhRjMGra7gS923a9U/EZB5m5qbYrwpuf
 OS1l2sPMGaQED1joK/k9SFJZV/p9hHQxo96YIKUz3jYr7q+KPC9Z0rYa+EDgOZgS9F8f
 LbtsCNcY4snA6wZlf0A43hQpOlDMmh7pqRFF0KA/iTqaLNNv4/uvCpNw1Hk93X0KpJU/
 CXmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWynAUb+XRQcEAWYgtfOSCo14ae5tKy0VMAdTM6o0HklFjeeUOxNC5wEdsE7NubvKaE4ASdx/VdKA==@nongnu.org
X-Gm-Message-State: AOJu0YwBZQMoXqqLuxYE0j2G+dA2ZWSDG2bEivf8B1FfaleY9phLEDKo
 T4jRBu5HjuqvhiBKj2Q+OEMZnH2Nz9bY5p8sg99FRvE9C6ksVgK62zt4GH2hSaYv8knm9NH3m+C
 aVAy7cpnJeI4eu8MyMvTPv+oZb0v5insRCvFUQVPZIuFKrNfjiUaCLA==
X-Gm-Gg: ASbGncs3RWU9LBTJSbGMrEIAkGf6EKK+3t53w1+D2ZkXBON80zvV6kc+DVHULVClxVQ
 LwfTK/CcXbfvwt3T9hPuG4+twd+tsAwlHxFwm8/QfvXcyFamOWwUO6KDUfasMNJERz2i4m3naFz
 AWCQPFJzuFTNPNmHDOgcL6Q3W3nJV5DT442z/GLHaW85zF5j1wRuLTUUg/ZKaYXw3/gMRTr0Qvx
 lCSdKLCbAWK63YKS/3YF+Qrvidvqgg4G5iCU+jf035AFNGn2jAluqMq5NPt3ZmYsw/iGdLMRkvD
 aVhqtdKynL5DrOB4w6PnA2I9aMNlWY+oel+zD3N7H+6A3FvYKlhoxA==
X-Received: by 2002:a17:902:ce91:b0:23f:f96d:7579 with SMTP id
 d9443c01a7336-242c2206d64mr28071605ad.37.1754637307236; 
 Fri, 08 Aug 2025 00:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOrxdLHP2yGX/57eRXuIbDA3aYDyk6HNZU1XdUSFFgn2r4riszeKnry5WgeKlhONdXY8A2Ew==
X-Received: by 2002:a17:902:ce91:b0:23f:f96d:7579 with SMTP id
 d9443c01a7336-242c2206d64mr28071205ad.37.1754637306855; 
 Fri, 08 Aug 2025 00:15:06 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:15:06 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:29 +0530
Subject: [PATCH v10 03/27] migration: push Error **errp into
 qemu_loadvm_state_header()
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-3-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=armenon@redhat.com;
 h=from:subject:message-id; bh=LUfuSVtS+gUS8beBElvFDj3Y5B57FjuN8HAr4S+wfhA=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxVdEFVb//P4wyOZjY0iPuF+y9h2vekNDjbcLeTurb
 6S4fr3UUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCL/XzAyzFM/IbRP+Rnv1Zm7
 Qy5uP3K06prwvM5X/EIhFVfWq2Xl9jL8Ff7JKyHeJHj0V9HtlR0em51NXmao7+Vv+fLQf4Hvsjl
 iHAA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCOQfKXQWeYpJvkvLK3AzPE4OR9zcDrRLTq1ZJhs328_1754637307
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
It is ensured that qemu_loadvm_state_header() must report an error
in errp, in case of failure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index cb64f2855d46aaa7c617b3e4079a2c9e566079b2..0c445a957fc99f826e6753ed3795bcdd51f1e3f5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2814,35 +2814,42 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     return 0;
 }
 
-static int qemu_loadvm_state_header(QEMUFile *f)
+static int qemu_loadvm_state_header(QEMUFile *f, Error **errp)
 {
     unsigned int v;
     int ret;
 
     v = qemu_get_be32(f);
     if (v != QEMU_VM_FILE_MAGIC) {
-        error_report("Not a migration stream");
+        error_setg(errp, "Not a migration stream, magic: %x != %x",
+                   v, QEMU_VM_FILE_MAGIC);
         return -EINVAL;
     }
 
     v = qemu_get_be32(f);
     if (v == QEMU_VM_FILE_VERSION_COMPAT) {
-        error_report("SaveVM v2 format is obsolete and don't work anymore");
+        error_setg(errp,
+                   "SaveVM v2 format is obsolete and no longer supported");
+
         return -ENOTSUP;
     }
     if (v != QEMU_VM_FILE_VERSION) {
-        error_report("Unsupported migration stream version");
+        error_setg(errp, "Unsupported migration stream version, "
+                   "file version %x != %x",
+                   v, QEMU_VM_FILE_VERSION);
         return -ENOTSUP;
     }
 
     if (migrate_get_current()->send_configuration) {
-        if (qemu_get_byte(f) != QEMU_VM_CONFIGURATION) {
-            error_report("Configuration section missing");
+        v = qemu_get_byte(f);
+        if (v != QEMU_VM_CONFIGURATION) {
+            error_setg(errp, "Configuration section missing, %x != %x",
+                       v, QEMU_VM_CONFIGURATION);
             return -EINVAL;
         }
-        ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0,
-                                 &error_fatal);
 
+        ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0,
+                                 errp);
         if (ret) {
             return ret;
         }
@@ -3119,8 +3126,9 @@ int qemu_loadvm_state(QEMUFile *f)
 
     qemu_loadvm_thread_pool_create(mis);
 
-    ret = qemu_loadvm_state_header(f);
+    ret = qemu_loadvm_state_header(f, &local_err);
     if (ret) {
+        error_report_err(local_err);
         return ret;
     }
 

-- 
2.50.1


