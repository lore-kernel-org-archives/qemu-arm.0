Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B661CA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGXQ-0001oC-F1; Thu, 18 Sep 2025 11:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXI-0001Ry-Qn
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGXG-0003IE-KS
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRbqiAPNISkqVRppZsP2Vwbcn9nh/EQ6BOnJNHC9Ojs=;
 b=N5EV4ubMnOHMwBsgYIgo8adceMxUhNS926SHz+h64XGPV8PJVL2SaHf46uFSTJsJUI+Ca8
 lnF61pDQP9IpBlwjLWqzgz0dvsK98KBPalhrAEiuP93PfGW0J+iEthss7TOLv/ibhiWMre
 5qc4VIAZDP/VxpP/y+vG5T1EUlPUPhI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-vjrS_50POj-3Geqp_SizOA-1; Thu, 18 Sep 2025 11:26:57 -0400
X-MC-Unique: vjrS_50POj-3Geqp_SizOA-1
X-Mimecast-MFC-AGG-ID: vjrS_50POj-3Geqp_SizOA_1758209217
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77e12c8feb9so147768b3a.0
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209216; x=1758814016;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRbqiAPNISkqVRppZsP2Vwbcn9nh/EQ6BOnJNHC9Ojs=;
 b=e9aKkBsbJVZNPIE/y6SDpsmHSxMjTjr75hp8cT1/yBcLfpD72FVmN83pD9NJz+5Tx8
 4eqZOL/N+2D1SSB+MF2g2n1N5d7V7eCmzX8W7+bo5efCZ2MlE/CfpPPPpyvGCMK8j1KB
 kdXpDA7nQjoBxjoEQRfmD0mTmKyZeGWRb9ZVpXcZuI5mfWS/iZZuZjQmuqlPETKf/mRX
 4E6MgJmrhAHPbKKn29oe89h3yKxiH6/LFo4USkunl5rZ+G+LUW/rPTe0szKhJnZsZJ/v
 6QuL7ecJXfsznpKdDC1LQfuJAdWQD5z4k1UEZ3pQ/DlapLVYAUoK56pzaK1SVXoMvsU1
 bckA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkbfANh3vfUq4iOA/3XBOh25zc4XFhflWF5HFhJBdMvaU66UYSWf4a7U6FBgI5xDBYeRhGSLjGlA==@nongnu.org
X-Gm-Message-State: AOJu0YxBN5wSnKnSRr2GWPaRxQjoGm417kPMAv+vzJCD66gwNuZNoN5m
 KNIpEwTR/z2ilxFTmQkcV7Nt0RoVlXTZYrbiD97l8VwssGyEmWNJwSVe1uB5pVq7RPG2mjndg2d
 qL1N6N58TL19xtiP/gLpxujFBgR6Z8fUWuQhCGcN55ixls/5m+1E66w==
X-Gm-Gg: ASbGnctDnlkJwQe+IREMknTlPf07qW049MZ3tOQuc9pY+H8rpSB3sdCxRGR2IvUbwEB
 CXdTT/yeiMACl8McV8dP6t+20QNXAlptm501Ji4W2V7ONUTBiLHkXwaBF7BZQVjDgeWt05rl5as
 skPMx0Vjge1yUH+/a8xvKzs9dNtamocN7fA+uChFuzQjK4W52XxqsyqN8vvkUd4ekpCvbahcblU
 xihLTCoY0w7CeDQT6onMKDxYwp+PXZ0cVZInhmHQVal0Mdjrf4IlaJmfX3QiMRNNjfYybecquLh
 Zb7iOYnU9GsMtOvY0DWezuhN2SLlDI2Fn2w9DjphUddzdOlB12VoBw==
X-Received: by 2002:a05:6a00:4a07:b0:772:6bee:9ff4 with SMTP id
 d2e1a72fcca58-77ce050d597mr3208397b3a.5.1758209216586; 
 Thu, 18 Sep 2025 08:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGr6LusWLuwq56qkztQyHByRvQKkTaC4b2GsSVfCnPWR844zG4OWuIeFom70xJ6zhMmcOYDQ==
X-Received: by 2002:a05:6a00:4a07:b0:772:6bee:9ff4 with SMTP id
 d2e1a72fcca58-77ce050d597mr3208366b3a.5.1758209216201; 
 Thu, 18 Sep 2025 08:26:56 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:26:55 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:39 +0530
Subject: [PATCH v14 22/27] migration: push Error **errp into
 loadvm_postcopy_handle_switchover_start()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-22-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=armenon@redhat.com;
 h=from:subject:message-id; bh=x/yKec8YqQYPuuXzcHNbQkCBg0poQ6E8l/qo+33kxFQ=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5R+9DVsYDwv83SW99QGn/x9H5rUSensNNm8+6+azl
 2npU6b5HaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACayQIDhv49xHq/2s0vbt0xL
 knfflBbaml+te/7zKRuP9XuPnmMubGT4zVan9vyhxJtH39rk90k9nXdPT8flvd2Rjt2N3gvlngf
 u4wQA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dz-_XNdlUoCi6eGP866GRbBKYQdF5x6UMYZkenOUm4E_1758209217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This is an incremental step in converting vmstate loading code to report
error via Error objects instead of directly printing it to console/monitor.
It is ensured that loadvm_postcopy_handle_switchover_start() must report
an error in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 8e891243dc1e7f5d3bc3a4326c6c4a2f5c32e1a2..b0fd51d0f142c30ce21bdc02204ce947283fea49 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2534,7 +2534,7 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis,
     return ret;
 }
 
-static int loadvm_postcopy_handle_switchover_start(void)
+static int loadvm_postcopy_handle_switchover_start(Error **errp)
 {
     SaveStateEntry *se;
 
@@ -2547,6 +2547,7 @@ static int loadvm_postcopy_handle_switchover_start(void)
 
         ret = se->ops->switchover_start(se->opaque);
         if (ret < 0) {
+            error_setg(errp, "Switchover start failed: %d", ret);
             return ret;
         }
     }
@@ -2655,11 +2656,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         return loadvm_process_enable_colo(mis, errp);
 
     case MIG_CMD_SWITCHOVER_START:
-        ret = loadvm_postcopy_handle_switchover_start();
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_postcopy_handle_switchover_start(errp);
     }
 
     return 0;

-- 
2.51.0


