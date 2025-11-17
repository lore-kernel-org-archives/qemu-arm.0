Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00BCE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 09:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKvIL-0001TU-QL; Mon, 17 Nov 2025 04:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vKvIC-0001LT-Do
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:13:02 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vKvIA-00023s-WD
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:13:00 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso2103959f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763370776; x=1763975576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YaslrgNJ0Xbphvgs70Z+LWSuJdCpZiYoMztNS2RNrBI=;
 b=eLsDLtmFpkz7gxQMaD84WvFhKYjz4v/qlYEfJr8XeuCs1b4j1NKrbFeN7zn4jlTMr4
 7hNmvh6IP2L4oPDcGLbbs8d6Qi8hajqM600+C2FlH2BJSfAOXBWmsDhA/2vO9ri0A6wm
 8+63EMIsWGGRCYq13+xZdNS4eOZDg1Vqxlb4kHoS8KOVERonIZjVc0AEZylbxqAnQKXm
 Hs+x5HW5aAQmXvRSnUuOMP+HZya0okX8RrueAeQXKACNKsZrIJNcgn4OtNDDDhC4h+AI
 F+nzWxatDUY11rakGxOdUdCcNPkow+weIN2Djvo9bI+opk7h/6c9jO221kPfgY0IEysL
 gZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370776; x=1763975576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YaslrgNJ0Xbphvgs70Z+LWSuJdCpZiYoMztNS2RNrBI=;
 b=i2W+22XUpdjAwuV/ytBZKgh+l3W3wWEssSfLuJMVaWkAk+xE5U/EsVKsZZbU+yxAHB
 XqckaZJ535Hjb1eJqueplmRo15hzQdH4NXr7IaQuRilU7Tw16XOv2BpZGSSDRZWkCmlq
 H+QjwQlbewQpyMyRM1OR3amXtopS3ym2ImURqxhlmEAORhDzfaVAB116xtnewA2o9Q6J
 uO74SSRx/mWsT7V1mkrQq2k0u5yl+B8zp3T4tdl2pMycFxY38vpShDVbk3jZKBbzNjII
 rfmlfROXqKt2J33FK+4UIITCCsWqUdCOO7e6dX0IjS1IvhYFWLlGJABipEZJTuoSrr11
 BePg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxV8Em+voo4v4FGlAkjO1IUKwiFR2KdRkBaoCUjCfmJ6H6aLXFvU7JeYB4jkbJWIpzL5FFkHawGg==@nongnu.org
X-Gm-Message-State: AOJu0YxD0lXjhhFKtvTV/8sbjNt4kxZKONYfOuwMGfOmyn277T3nU1LV
 IK/BSwH8I0vAb35mFrh6+u1RChaTiU+GLKe5JmFGyqUqCZ2NrGEyKNePtNIHQLtAq6A=
X-Gm-Gg: ASbGncukWFGwFCR3zqCVz0Zclt3R+zD/weh2EMBjN1j2ejtKuOPKQAclEPOCgvxS9Au
 e0hCVV+H/w3RULBUNMNoXm9awSNPDVTlkApn/GY0xXu+/BHWxXGv+DM1QfAj38z2ddzud66pDVW
 XYY54lf4OcOzvGkg0ok1ClAZN0QezAn3tKb5gO3znTENTFkm2sSI3kEjERWgquL8Y5qHIrgh8Bp
 XdlI2EN9reLXnsEPZVOSjRNAkg4uoVzOyztUxVlfAAPOaTSJiHksexkVfZKjJtTjDUpY1rMgnRk
 +maFV/rDH2FMs18oNnMNKL8VaA9bsJwN9r8Lg+gEoO/9x8o9aUIdVHK4LR/zKSqf43ttmJ5QnMb
 +wuE9ryg9vkm0ZF3AV4cPrHZhTQLrSmRay1v6QvqRkwHkmn/LLhIzIdF85EF1nAAiVEsqgnpjYX
 RdcRo3GVcfaHCUigOEJVKzXzf74oqBeIFsPwMop9qXL+gLqZlDQw==
X-Google-Smtp-Source: AGHT+IFrur2NHsFQpSKkjps7ni82M0I5Z8AAq9XPEnWfO8qL4GAYRpKSJZ8x7qXLWNccB9PwQBufnA==
X-Received: by 2002:a05:6000:1449:b0:429:c4bb:fbc4 with SMTP id
 ffacd0b85a97d-42b59367894mr11291521f8f.25.1763370776295; 
 Mon, 17 Nov 2025 01:12:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7b14bsm24846817f8f.9.2025.11.17.01.12.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 01:12:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH-for-10.2] hw/arm: Re-enable xenpvh machine in
 qemu-system-arm/aarch64 binaries
Date: Mon, 17 Nov 2025 10:12:53 +0100
Message-ID: <20251117091253.56009-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

While registering the ARM/Aarch64 machine interfaces
in commit 38c5ab40031 ("hw/arm: Filter machine types
for qemu-system-arm/aarch64 binaries"), we missed the
XenPV machine. Correct that.

Reported-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
1/ Review got likely unnoticed by Xen folks because no
   Xen-specific entry in MAINTAINERS:

   $ ./scripts/get_maintainer.pl -f hw/arm/xen-pvh.c
   Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM TCG CPUs)
   qemu-arm@nongnu.org (open list:ARM TCG CPUs)
   qemu-devel@nongnu.org (open list:All patches CC here)

2/ Should we restrict it to aa64 only?
---
 hw/arm/xen-pvh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 1a9eeb01c8e..86a02966161 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -10,6 +10,7 @@
 #include "hw/boards.h"
 #include "system/system.h"
 #include "hw/xen/xen-pvh-common.h"
+#include "hw/arm/machines-qom.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 
@@ -95,6 +96,7 @@ static const TypeInfo xen_arm_machine_type = {
     .class_init = xen_arm_machine_class_init,
     .instance_size = sizeof(XenPVHMachineState),
     .instance_init = xen_arm_instance_init,
+    .interfaces = arm_aarch64_machine_interfaces,
 };
 
 static void xen_arm_machine_register_types(void)
-- 
2.51.0


