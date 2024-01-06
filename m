Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp1411249ejo;
        Sat, 6 Jan 2024 10:16:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHempZ1CEUw/n1U0w0HA3xRnx6zlR4K27lKfvQAZVMJYCmwzjuZgjBpvf7OByfu5RkfEWXv
X-Received: by 2002:ac8:7d41:0:b0:429:8005:5236 with SMTP id h1-20020ac87d41000000b0042980055236mr2119765qtb.14.1704564960952;
        Sat, 06 Jan 2024 10:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704564960; cv=none;
        d=google.com; s=arc-20160816;
        b=VqEqj15F5oqoeMw1xh3CcP4H1aAoSI8l9x7osP9H60RpbIO7B7VS2E0w36qD509ghY
         IsfLcLZdRXYf0mu2y+wJ2/Zlxz/azBEUP9MnL2MgH2d6Z9ygKuFr89X3Uz0Wjlrebojv
         3vZLDKI+7+PnKlJWlb+NiFf307PfX5s3SsydNKNZJlXnUf+boRYlJiQstEch0H2/SX9J
         q2nTKv9rg9UC4+Z9TJUMlkkgZJ42AWFhwUNrTbJzgmEaI32QcYXlK8g35nd867Tpptv6
         43lZAa3YK1TPMVK5ANvJUI1axH2td8L/7sDqgKo43P/v/LdYYuaJNQQO6gxR+QdC+r2q
         rhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pdCuOTWebVr2BHVGM6RBWWIekbx4EMCOFpe8MOyRVbo=;
        fh=R87mPwhYHu0gF5afZtbOsfEVx9y6lHOQHbd5WAm8bKQ=;
        b=rvitJDlybXJt/iMe60qN4PilWuKySLQkF8jjM1QOwBdMhceAzCrWTqxwAK931eLyT6
         75iIzuu7v6cpF4kpXKIizUyNN+n3+UiMx+kqJrTBotxDVHKnAT0IcxwKmzpMf4EHbSjO
         hn/dW0QXGGdEwkgzayPuV7EOnoskIz8NDg9RJlhhHuO/GISpJcaIlLTaA2+q64GkfcSX
         kmhCpAAKANFhOlRWbfkwlBHzAw+A3Ir37RDymHF5VEhlNjnklBZXrEOrIFf7E5Q5F2I/
         +d8orrYxyogmqnipnKS5vD01uOXCCvH+Mhc15swIgEZFs7qBqO8XNQavdcE9jz5aMa2t
         A+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=NF0BJAQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac87f4c000000b004280ad3e110si4158302qtk.307.2024.01.06.10.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jan 2024 10:16:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=NF0BJAQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMBCU-0006Py-UB; Sat, 06 Jan 2024 13:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rMBCS-0006MU-4S; Sat, 06 Jan 2024 13:15:12 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rMBCP-0001vy-RT; Sat, 06 Jan 2024 13:15:11 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 4215080026;
 Sat,  6 Jan 2024 19:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1704564904; bh=kNhppvo/CRU4H84/steItY4yhrW3Ab/UuhFo++kdr+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NF0BJAQQOwugLGE5o+IyBIcpSK1ehpS2hnwlLnDAmcXxB79+PacfTCZugGJRcMpby
 Lx6ze1evzOLT9JB5B57jQrr8uTF+EiibkeJI+QeEC8b4du+mCAyDd6NY+1V3wHaBZq
 wg5UWKZ2CDjJ1q/z+eVMwGq4aWS1Cn+0Q/+hZcNVBSPVO4AVN0hjnl/lA8WQ16mWGa
 WhFDc9VmrEZH9fQ4UvfBLMDE5RTsawON8y1aBXhbGMYCmVSP9NA3XPijpLsz3k0By+
 KWJDDcsWqsfY70EBOtV629RHX3RHv/pQ2EwZtY3UKiaFXDkCnF02WWGXn6u3OvKD7H
 GFrYRToMMIuHg==
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v3 1/3] hw/intc/armv7m_nvic: add "num-prio-bits" property
Date: Sat,  6 Jan 2024 19:15:01 +0100
Message-ID: <20240106181503.1746200-2-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240106181503.1746200-1-sam@rfc1149.net>
References: <20240106181503.1746200-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4zDUKkhgAmk6

Cortex-M NVIC can have a different number of priority bits.
Cortex-M0/M0+/M1 devices must use 2 or more bits, while devices based
on ARMv7m and up must use 3 or more bits.

This adds a "num-prio-bits" property which will get sensible default
values if unset (2 or 8 depending on the device). Unless a SOC
specifies the number of bits to use, the previous behavior is
maintained for backward compatibility.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Suggested-by: Anton Kochkov <anton.kochkov@proton.me>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1122
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 50f9a973a2..404a445138 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2572,6 +2572,11 @@ static const VMStateDescription vmstate_nvic = {
 static Property props_nvic[] = {
     /* Number of external IRQ lines (so excluding the 16 internal exceptions) */
     DEFINE_PROP_UINT32("num-irq", NVICState, num_irq, 64),
+    /*
+     * Number of the maximum priority bits that can be used. 0 means
+     * to use a reasonable default.
+     */
+    DEFINE_PROP_UINT8("num-prio-bits", NVICState, num_prio_bits, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -2685,7 +2690,23 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     /* include space for internal exception vectors */
     s->num_irq += NVIC_FIRST_IRQ;
 
-    s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
+    if (s->num_prio_bits == 0) {
+        /*
+         * If left unspecified, use 2 bits by default on Cortex-M0/M0+/M1
+         * and 8 bits otherwise.
+         */
+        s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
+    } else {
+        uint8_t min_prio_bits =
+            arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 3 : 2;
+        if (s->num_prio_bits < min_prio_bits || s->num_prio_bits > 8) {
+            error_setg(errp,
+                       "num-prio-bits %d is outside "
+                       "NVIC acceptable range [%d-8]",
+                       s->num_prio_bits, min_prio_bits);
+            return;
+        }
+    }
 
     /*
      * This device provides a single memory region which covers the
-- 
2.42.0

