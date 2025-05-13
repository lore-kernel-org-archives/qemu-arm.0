Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688653njb;
        Tue, 13 May 2025 10:48:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdt0fymgqXJLxO7yh/en+LKPSuuxfqpTbgiJ4hktvonaYbWYuIcAk7X372KClJLiHrw6cmPLDl9Ua1Yg==@linaro.org
X-Google-Smtp-Source: AGHT+IELjixu+KpPXN+AYLvCX42EhlIDuppR/p4R7yTiHSzFy3ZSXVubWtTZafrhlhCPB4+fYVcM
X-Received: by 2002:a05:6214:c6c:b0:6f5:3811:cc67 with SMTP id 6a1803df08f44-6f896e0d8ebmr4575616d6.12.1747158521219;
        Tue, 13 May 2025 10:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158521; cv=none;
        d=google.com; s=arc-20240605;
        b=dvuNW0rx04fFmR3sPPpXzfR1vYr3hFbbYbH70wtw/sh8H/Oghe3cd6/X2lOyslsvln
         E7pZ3WaurGgdE5fNK8qHfc/B9hSU5Jdtv2moe8CT4uyQj4GyMAEaDX7FcxmFIXz/UNG9
         YCByvkRowRJAJF+z+MPbOcJl7QMppTPYMpaExq2r29RX56lVVKZ4g7lGj8/F5j8P0n5f
         xrn2sIRZXwZVt5uF3csoAXz9ZFCsQhBEgXzkW00hcneNULk+jRRy+iloMDSt++mux5Zf
         cw0j2VZGhFXChBOThfpS+TFJgb8fwGdU3j/s9ktrptPuzHf2w+LO0TkAhpLOQynagVhr
         zeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rbZkU9N2W70mmJR5tu1c9TOXd68jr3evYSE4eI0rwy4=;
        fh=uzIrju9aZavJQS0oJGDYEQxuapV7hk84/9IjNECi+qo=;
        b=jyXy006jU4bfoX5T7YHQhyxEHHmrh2V5wHvKYWV6wZaKLNw+N2S67B6uyxZ78jSpIC
         lnnf/CvxbZFVMHE7JVAioPmhlHaptjuenPcHdPYoiWfESR3M7IZwfDsNjGuNoFFMiHcm
         vt54pHTOQRaoSgQbeowQmbeUeFkC15lPt/+MAbF+YkbnZZp1ivadRap0VOC5IAYa9jKt
         AjNwN5QNRZHSyxL1dn69TFVaodx21T1fk5YxpwD2iFpgqv2htk+6HLIqYOw12RBpf0MB
         wbAPOfFXcqykiiVQmOph9fHrsVINYikiqyNF6dp1NF/mm1ISa5V4UULMfaRaOWtKbd04
         2O8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYEDzG5B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f73dfsi117210906d6.114.2025.05.13.10.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYEDzG5B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtk6-00013X-JJ; Tue, 13 May 2025 13:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcM-0000Uf-RZ
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcK-0003Ps-Uc
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso7598045e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158035; x=1747762835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbZkU9N2W70mmJR5tu1c9TOXd68jr3evYSE4eI0rwy4=;
 b=KYEDzG5B79szxCqqIK1YlbABlWYoXX5ubDAmC7T50qmDSYaJhg3qRAa7T5eXtgrfl+
 i6a9m+s+cmlngSYMhSWExJXr819QJc48jJuqp/91NyjOwTYDK0OkwKVxt5cbtHc2nvgD
 r4QIv1U5DG+y16Kh68n3AE2MmiSPr/97Sa1ScQCJTR6Rwy8U+VqeH+XJ/iao/ctUTCaU
 adKxvFBiaUIa4aTASDGHknjvEroVJybS45EzZz3XC9oxL1pLHqI59gZNZ/EP5xwyzgKQ
 9yIBBACNfx/j9xEWxwTbS5wjbF1JGBMnfwIQDgS7IZcz5/Wr7EIOpjlfWvB/G5l17K11
 Z1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158035; x=1747762835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbZkU9N2W70mmJR5tu1c9TOXd68jr3evYSE4eI0rwy4=;
 b=KHbYVcffgBPhrIi1QtPQ1HcCFTVI282yZabLYcDM4BWNEPA5dCek4DtXSH2bSNoVev
 174moBXph/TTWvQc33ZqwW8hQbbQ0V/qNCoaOVET3jT+CIzyOtAPurPNvWIuGEKbpeW0
 p+5wXXu9F5VtRl/VkH8vZeRFMUiEbx2nox1u3B3uiy9uyo51LFkVJTzc4fS/nJZeUGGZ
 u8NYdHSf3uHbhaK5fWTJ/vToXG7moHWZXLzOZMg+SErQXXaPZ7vRrfkk/JvHGHUoZJ5G
 oIKWtWh6sqvZxc7/DhLjMn2CSb+SM++EDQVvrylsVglI1FVYW4VFMXDEGEGKzkxuPJ6c
 h1GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIxJoJjcFgX+aNRVPgq98+JjiugZspe0QHmmCx+xkbitBmEn98V3ToOo+PsDiVS6zQ0J6z1La7BA==@nongnu.org
X-Gm-Message-State: AOJu0YzI3HBpPUzsFuE0tWbczUfHs6yOmNF+3Lv0DUuhRi0z8nw6Z4im
 ItcSsPHDbJTg9VCaAYC8X1HaKbnWEc5auPWWLOQsM0znsmGrUw9UH6a6pmi59HI=
X-Gm-Gg: ASbGnct9+AfNYxpK2ntUaGPK5JdP1KsGzkDW8iQ2xbxvE4JWugVBJ35zIQmGUzgVrj4
 dO5JJJdHzRO/GYGG6dC62tBzjDuy7gzEP6uAi0dSy14xFKPEKTg2QuMxZcKCmPZ3vJDDcTuQhP5
 DYG3IKVr1dPpVWU2EKvi1TMdzBe6R4kdNCBrVPPuzg8IE6qP9jcFHCfP7R+Vhqxlvscfd5lKBdX
 uVInQvNgX5PHrxz0vailPVEM4f40pRcm66rxNS5VLQATSDyf5LcuYzY1OJ3uOOxO1yntzJIYJhf
 NCTzmyCjVq9sqRIqI1Ms8q3XyYzNJzBw10e4MrVpq72t6oPfFpAxauEow0wXhk6aw3uDQgX1Mw9
 M5FBGbuB3qH2Yffg5vkEHik7C/Fgs
X-Received: by 2002:a05:600c:358b:b0:442:e9ec:4654 with SMTP id
 5b1f17b1804b1-442f20e1ad3mr2562725e9.8.1747158035045; 
 Tue, 13 May 2025 10:40:35 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d14e6d74sm206848455e9.21.2025.05.13.10.40.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/19] hw/arm: Include missing 'target/arm/gtimer.h' header
Date: Tue, 13 May 2025 18:39:22 +0100
Message-ID: <20250513173928.77376-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TBOR1U4HCdUg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/aspeed_ast27x0.c    | 1 +
 hw/arm/bcm2838.c           | 1 +
 hw/arm/exynos4210.c        | 1 +
 hw/arm/fsl-imx8mp.c        | 1 +
 hw/arm/mps3r.c             | 1 +
 hw/arm/npcm8xx.c           | 1 +
 hw/vmapple/vmapple.c       | 1 +
 target/arm/tcg/op_helper.c | 1 +
 8 files changed, 8 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a38c2a19751..ad017237f3f 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gicv3.h"
 #include "qobject/qlist.h"
 #include "qemu/log.h"
+#include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
 #define AST2700_SOC_IO_SIZE          0x01000000
diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 22aa754613c..20709bf19e8 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -12,6 +12,7 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 #include "hw/arm/bcm2838.h"
+#include "target/arm/gtimer.h"
 #include "trace.h"
 
 #define GIC400_MAINTENANCE_IRQ      9
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e83a88d3369..24b3c0b5d29 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -36,6 +36,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
 #define EXYNOS4210_CHIPID_ADDR         0x10000000
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 23e662c16ca..3528adb90f1 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -17,6 +17,7 @@
 #include "hw/boards.h"
 #include "system/system.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/gtimer.h"
 #include "qapi/error.h"
 #include "qobject/qlist.h"
 
diff --git a/hw/arm/mps3r.c b/hw/arm/mps3r.c
index 889d291401e..8c743be3cb5 100644
--- a/hw/arm/mps3r.c
+++ b/hw/arm/mps3r.c
@@ -47,6 +47,7 @@
 #include "hw/ssi/pl022.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
+#include "target/arm/gtimer.h"
 
 /* Define the layout of RAM and ROM in a board */
 typedef struct RAMInfo {
diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
index e6c16537eef..7802768c384 100644
--- a/hw/arm/npcm8xx.c
+++ b/hw/arm/npcm8xx.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "system/system.h"
+#include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
 /*
diff --git a/hw/vmapple/vmapple.c b/hw/vmapple/vmapple.c
index 47f23b6e2c0..2dc5e15e791 100644
--- a/hw/vmapple/vmapple.c
+++ b/hw/vmapple/vmapple.c
@@ -51,6 +51,7 @@
 #include "system/reset.h"
 #include "system/runstate.h"
 #include "system/system.h"
+#include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
 struct VMAppleMachineState {
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 575e566280b..073a8319fa5 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -25,6 +25,7 @@
 #include "cpu-features.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/probe.h"
+#include "target/arm/gtimer.h"
 #include "cpregs.h"
 
 #define SIGNBIT (uint32_t)0x80000000
-- 
2.47.1

