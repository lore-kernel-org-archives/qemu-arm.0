Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA9C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:59:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFIc-0005Ur-Pa; Tue, 08 Jul 2025 16:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEM4-0004ix-6h
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:51:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZEM2-0008Hc-0x
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:51:51 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so491214a12.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752004308; x=1752609108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VK+7t2j2kymFsc3IeGpMe2sULS+2lCNmhWxaVyDzmrY=;
 b=aNq4kNJ2PqZHXQNUijqnrDnBhuJ34416TYnjUFrqk3r6v7/Y8zogYmzbiZUTV7anif
 WqUaxirIvPJ2EvzNFQLbk3tGXDNbROlyjEnpnuh4yVjlvv+XdyoEkX2UlxEB4elHvW3p
 QCGR6H1MWomw/Ajt5GFDF1EiatUzHirzhOI0eCKlMj9YduPmhr62IA94NXLkXbAAfEwG
 jH/86UCMdN3yPJcRuQQEjsD4gI1my7xWVdstGm4ZOSZLkUixckX7dLeD+IUxVI8hilUs
 fVuw3Cc4tfe6qPrsYxXwatflq3ZaflRyvilW5IuielPkr3JPvVwT8PLOhkNAy0f7m0lQ
 qXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752004308; x=1752609108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VK+7t2j2kymFsc3IeGpMe2sULS+2lCNmhWxaVyDzmrY=;
 b=FdAq2E63O4dohgRSRlRJO3J+NGBknhr4B+gNoVqKfwy7z9Zb2po1iJvXEwxzqZlt9f
 4WZVSWjC2UqsCh28+HE4IClMEc+5vy4MrRpdpVvHlIp3iKwLbwXkUW0kdTZsDDvYmDCw
 gNLPOLB3Bb0uYkf6//N2u1K6njQxyC0VW9J16+bNBZAlIHnvwEcbgVV2TVzt5YEx29mB
 Am+Imq1nhLRo9VFxxfZ2CX7yoDmLHhneL9jCbbBSEHrj8wuXRccEGWWPwX33JQYNh/4C
 ut6HRyRSUC4y5om9k2lDfnWkumrQRGRL5+E5NQQhSd8+AtWzrTXfgSwrJCYuVageGBhg
 kx+g==
X-Gm-Message-State: AOJu0YwxXI4YI6SGXz16TXFkvJLlOOWf259oqwH8ncg0L+6+S0lcKyUN
 XPekCNvPk7wKEOhzBiEZ16SXBtrDxxErsCI3vfx4k3CDrjkc01t4JddFfipRucbvTWpcBdx2eWu
 GQt7a
X-Gm-Gg: ASbGncvDM9GYyZQGHjJbCc1KXh7PvWFJkI41gH1TwXQZ79fl8vafilUQdRLlffNWpGV
 1dmqoIQimYKF2ZPsnMbOLvBytCz1hqyTzdD/fij3BYRp13K2m54LFFBmIcNrG3HiZN+F7cynjLd
 e0Ez5OmSMsbmvYb9y+ms/eWeGyhfOMSQ7Qw0a7IbSpbOVb4YMF6XZQrpZOekkkYXQrj5E+4aEcJ
 dXnJ1OgKQx/bV0wM8boTB9L/5S2mNJQC+mcxjO94/M1p81LAGKDSAdMbOrkUqkW6YzAqIn9OyTB
 pgT0odmitbjoqM5aXMqi1zSlm5nBsxI/NudxEupSIw3vmpWgdMWZ8CNnx3x/yHt5pVlB
X-Google-Smtp-Source: AGHT+IGALo4sVNBgG4JPDbkGK0xlAvZZ58lvqIhuwe9o8VqKKyz/RfIsQzbeyBd1YX8sRyHbJdn8Wg==
X-Received: by 2002:a05:6000:250d:b0:3a5:5136:bd25 with SMTP id
 ffacd0b85a97d-3b5ddfb8b30mr2465893f8f.1.1751975565039; 
 Tue, 08 Jul 2025 04:52:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4a68ebsm19731255e9.39.2025.07.08.04.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 04:52:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 3/3] hw/intc/arm_gicv3_kvm: Drop DPRINTF macro
Date: Tue,  8 Jul 2025 12:52:38 +0100
Message-ID: <20250708115238.667050-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708115238.667050-1-peter.maydell@linaro.org>
References: <20250708115238.667050-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We don't generally like DPRINTF debug macros, preferring tracepoints.
In this case the macro is used in only three places (reset, realize,
and in the unlikely event the host kernel doesn't have GICv3 register
access support). These don't seem worth converting to tracepoints,
so simply delete the macro and its uses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
If anybody needs to debug this code they can add useful tracepoints
at that point. I don't think these DPRINTFs will help at all.
---
 hw/intc/arm_gicv3_kvm.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 8e34d08b415..e118c1b1f04 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -34,14 +34,6 @@
 #include "target/arm/cpregs.h"
 
 
-#ifdef DEBUG_GICV3_KVM
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "kvm_gicv3: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 #define TYPE_KVM_ARM_GICV3 "kvm-arm-gicv3"
 typedef struct KVMARMGICv3Class KVMARMGICv3Class;
 /* This is reusing the GICv3State typedef from ARM_GICV3_ITS_COMMON */
@@ -721,14 +713,11 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
     uint32_t reg;
 
-    DPRINTF("Reset\n");
-
     if (kgc->parent_phases.hold) {
         kgc->parent_phases.hold(obj, type);
     }
 
     if (s->migration_blocker) {
-        DPRINTF("Cannot put kernel gic state, no kernel interface\n");
         return;
     }
 
@@ -807,8 +796,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     int i;
 
-    DPRINTF("kvm_arm_gicv3_realize\n");
-
     kgc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.43.0


