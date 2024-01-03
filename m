Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp561616ejh;
        Wed, 3 Jan 2024 07:54:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI1+NXHu4KByV+m3xtVXLHQwpwwTRpXq2MxD/fWGYEnxRObjzXZeRc4Uf5Y/wg1cwlB5h2
X-Received: by 2002:ac8:7d8d:0:b0:428:3d71:463d with SMTP id c13-20020ac87d8d000000b004283d71463dmr213935qtd.85.1704297296677;
        Wed, 03 Jan 2024 07:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704297296; cv=none;
        d=google.com; s=arc-20160816;
        b=Iwhpz9+VLWyf0RYFbLv6fWxYe+0VChQRV4mGhh3hJZTS/wUMCkoj10M1FCY8HtNeeB
         q1rJVGgU+cek+JCiX6LAIQ0KOXxxdxik5OSodjxTwJUs14MsBm7mozyWZtt8z5RkOi49
         QT0jfa2olIFuJ4ukx7fQ70o3XwYca+bO0/BCxT4VtZZE1pFjoIje9GyWH6okbFB3ALuM
         qjIVdaFQ7mosTAvT8X05CkCvrg/2sfG/LlggQBxcZvrx5HZmLFEYR+30t7HtJZHW/2B+
         wcBR4OifAVY15jkWGGm+VOeenGUkRRGK2mbdu+OAfOJ3yNPhloazaJoJ2vvwuO4oGNNk
         /6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4n8oRiGEGEyfxFNaU+cIAqBf4v+mw7NYCCX+EGHl+cA=;
        fh=HXATX5/62pMJVs80a2Hs0Qv0Y5F0Xlxx6Qu533NYerI=;
        b=An2Aqchr3xbJxRy2TU5H3eK92dWBpVs2v2JpXAnfnxUY/ST3kQ3FEK9Tb4+qnJ0/Em
         4tu4hLaULo6z7nNqEFjx5EC7Dfx4FsYVEH6Po5YY8vp2A6A1blsJHGjkt6pNg1KESCO3
         KR1TVZBIPM9xNibKUoIGCAlZYcnYGhYjF3zd38n0obUM7FhE337Veg34U7vER2LkZyai
         /cP08fynL9T8wl+dw4e4IQ2xPlr2CyGIOkAvOUrN8Aeb/USF/xgzqaq6P6G9Jp8+5oR8
         jno/BXa/RURaqScQy9T2U1+evl8A+A+mCdPHVdJLgGfyMptqCKr/okh2dwQEuJ7B6p4f
         pOhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp35-20020a05622a1ba300b00425da7bbf14si28658522qtb.641.2024.01.03.07.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 07:54:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rL3Z8-0004MQ-B8; Wed, 03 Jan 2024 10:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z6-0004L3-6F; Wed, 03 Jan 2024 10:53:56 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z2-00052B-Lc; Wed, 03 Jan 2024 10:53:55 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 6C83380026;
 Wed,  3 Jan 2024 16:53:43 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Anton Kochkov <anton.kochkov@proton.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v2 1/3] hw/intc/armv7m_nvic: add "num-prio-bits" property
Date: Wed,  3 Jan 2024 16:53:35 +0100
Message-ID: <20240103155337.2026946-2-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240103155337.2026946-1-sam@rfc1149.net>
References: <20240103155337.2026946-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +uBotDTyJna9

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
---
 hw/intc/armv7m_nvic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 942be7bd11..82aacd7f22 100644
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

