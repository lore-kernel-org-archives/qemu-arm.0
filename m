Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp669911ejb;
        Wed, 22 May 2024 13:41:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA6JYSmfXAYhYohtRp25xLYbzVPn2ChOn/LcVeMB2C8ozLQD/GTaaAdUzbc88obyf2kb+JT23eP7Y83K12VUDsoN1IOKfU
X-Google-Smtp-Source: AGHT+IGx00bFTQCsJ774/HPGpKCFkSSegxJw4L3PA/F89Mc+u05TRRkNMbbDUdqDzmECG2P9OOJn
X-Received: by 2002:a05:6122:168b:b0:4d4:3ec6:421e with SMTP id 71dfb90a1353d-4e2184e3151mr3201991e0c.4.1716410495637;
        Wed, 22 May 2024 13:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716410495; cv=none;
        d=google.com; s=arc-20160816;
        b=HmsB90gDnHpWVhTOCaRnpZ/Ad4BCFIfroHmW96KJOnkfiIIJyHh8e3oOlstRAVXgrg
         Rs5G7pC89ymw6T0KYqaCiN0Kafv/gWsmEhUr/tb1XNVivlMYKGjENIJtP9iU2LFpAReA
         wIXV9G7iHR1Z2N1h7UBFHFWbNjQSosAOhorQl5NLXq5eLHO0OZu4yiq4a5v8/EZwJl6t
         0FWqyReQwuVjjU75sEZm7AjvuaJcZzsFiDyrS+zSKNuGWGxxZXitY3T0bogrd+p82Nyt
         2M9QmIcaNMuqNoIDz6pSNTdXkljLS0yUSk5s3iAcdtvZ/92Qi8sWEbnfZn3UAtOdBR8b
         AUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=Hf+j5l5Um/1eDJkNGHCyRdqMWpG6lfb1t4t+e09R38g=;
        fh=kGxdJi6DeIwP9PP6xgyAD+wtRjVPVIjGsUP7vGLhsIM=;
        b=ci7zYGtgKRd4zeBLmMS27JA/wFVXIyVmwO6wM7BEIASjCAP0MKsZorm5i/aU3V/6qR
         MJ6BpNRII7aFfq0xVcLlufp195aLnUSBLM+eJIcjlxgJzGZC7XQb2IzpWu7iU8fDaaFt
         GMIGHW8XhJYnwQrUvYoRgrUnI+naBJ6p9+MHlxERRRjUdf1l6inVu2AXAmqUplKM2kFS
         PM3XWjSeiPJrjmL6cs9NNbLUKBok7pQQ+Kt7Y4X7faKavJJpAeAwakR4KI3ZoN05Lbvw
         W5MHbV5qxD1dQ6R2qVch1rp/Vln8BTFoVe6/42hkQmbSEdp6uCYP/vk0vApJoK8fWuNS
         lnJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=4vxD+AiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf340160si3075052885a.529.2024.05.22.13.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2024 13:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=4vxD+AiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9slL-0005Fd-2R; Wed, 22 May 2024 16:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s9slI-0005DE-RO; Wed, 22 May 2024 16:40:37 -0400
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s9slG-0003CK-OT; Wed, 22 May 2024 16:40:36 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 69C1420636;
 Wed, 22 May 2024 22:40:30 +0200 (CEST)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id 8C8cAXd4xaTx; Wed, 22 May 2024 22:40:29 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id D662B2051F;
 Wed, 22 May 2024 22:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr D662B2051F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1716410429;
 bh=Hf+j5l5Um/1eDJkNGHCyRdqMWpG6lfb1t4t+e09R38g=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=4vxD+AiSuYEQvBRu0CY6MH6oWKGiGxTJb2cNEfowCtKDcj2jhtUAQ63BfJwX4Jre4
 1tiXTXfDajzpllfFROqek0DsWHOuESpBsDkGEoiPNMjRslu2et+tVuROO21mE6z0vn
 mNS/gs1LWUtbSx5Q2KRhYIBlWOGd/GSgqNvsfw18=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id td9S-ob-MxTV; Wed, 22 May 2024 22:40:29 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id CF6F420553;
 Wed, 22 May 2024 22:40:28 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/3] hw/misc: In STM32L4x5 EXTI, consolidate 2 constants
Date: Wed, 22 May 2024 22:39:38 +0200
Message-ID: <20240522204020.203905-2-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240522204020.203905-1-ines.varhol@telecom-paris.fr>
References: <20240522204020.203905-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.223;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: bjvBZKAiKFpK

Up until now, the EXTI implementation had 16 inbound GPIOs connected to
the 16 outbound GPIOs of STM32L4x5 SYSCFG.
The EXTI actually handles 40 lines (namely 5 from STM32L4x5 USART
devices which are already implemented in QEMU).
In order to connect USART devices to EXTI, this commit consolidates
constants `EXTI_NUM_INTERRUPT_OUT_LINES` (40) and
`EXTI_NUM_GPIO_EVENT_IN_LINES` (16) into `EXTI_NUM_LINES` (40).

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/stm32l4x5_exti.h | 4 ++--
 hw/misc/stm32l4x5_exti.c         | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/stm32l4x5_exti.h b/include/hw/misc/stm32l4x5=
_exti.h
index be961d2f01..82f75a2417 100644
--- a/include/hw/misc/stm32l4x5_exti.h
+++ b/include/hw/misc/stm32l4x5_exti.h
@@ -30,7 +30,7 @@
 #define TYPE_STM32L4X5_EXTI "stm32l4x5-exti"
 OBJECT_DECLARE_SIMPLE_TYPE(Stm32l4x5ExtiState, STM32L4X5_EXTI)
=20
-#define EXTI_NUM_INTERRUPT_OUT_LINES 40
+#define EXTI_NUM_LINES 40
 #define EXTI_NUM_REGISTER 2
=20
 struct Stm32l4x5ExtiState {
@@ -45,7 +45,7 @@ struct Stm32l4x5ExtiState {
     uint32_t swier[EXTI_NUM_REGISTER];
     uint32_t pr[EXTI_NUM_REGISTER];
=20
-    qemu_irq irq[EXTI_NUM_INTERRUPT_OUT_LINES];
+    qemu_irq irq[EXTI_NUM_LINES];
 };
=20
 #endif
diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
index 495a0004ab..eebefc6cd3 100644
--- a/hw/misc/stm32l4x5_exti.c
+++ b/hw/misc/stm32l4x5_exti.c
@@ -42,7 +42,6 @@
 #define EXTI_SWIER2 0x30
 #define EXTI_PR2    0x34
=20
-#define EXTI_NUM_GPIO_EVENT_IN_LINES 16
 #define EXTI_MAX_IRQ_PER_BANK 32
 #define EXTI_IRQS_BANK0  32
 #define EXTI_IRQS_BANK1  8
@@ -241,7 +240,7 @@ static void stm32l4x5_exti_init(Object *obj)
 {
     Stm32l4x5ExtiState *s =3D STM32L4X5_EXTI(obj);
=20
-    for (size_t i =3D 0; i < EXTI_NUM_INTERRUPT_OUT_LINES; i++) {
+    for (size_t i =3D 0; i < EXTI_NUM_LINES; i++) {
         sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[i]);
     }
=20
@@ -249,8 +248,7 @@ static void stm32l4x5_exti_init(Object *obj)
                           TYPE_STM32L4X5_EXTI, 0x400);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
=20
-    qdev_init_gpio_in(DEVICE(obj), stm32l4x5_exti_set_irq,
-                      EXTI_NUM_GPIO_EVENT_IN_LINES);
+    qdev_init_gpio_in(DEVICE(obj), stm32l4x5_exti_set_irq, EXTI_NUM_LINE=
S);
 }
=20
 static const VMStateDescription vmstate_stm32l4x5_exti =3D {
--=20
2.43.2

