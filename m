Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2792052wrg;
        Mon, 17 Jun 2019 10:59:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCJ63CxK6Q7xEkRZLamYCjqnVd3fcQY1TvykoSpjbJr8v3BzXLhg3w6L/TcZtRudDWj6gB
X-Received: by 2002:a17:90a:b00b:: with SMTP id x11mr27589979pjq.120.1560794041758;
        Mon, 17 Jun 2019 10:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560794041; cv=none;
        d=google.com; s=arc-20160816;
        b=RJUXtKLMLR8sRpH8+lkgYQQRNPZByxz0nDLIinBaQctzJZVem53aTHvIUMglOTqA0k
         masctAv035n4YjGH1FHJyHtMbI67b6U+hzY4N2V130PtOhWauSl4gnygo3cKFEilX83k
         8TrchQiBYvfBfVm87+UwNMAsbCaQJGSw32C3yU6tTAo1PimvmvxqXPXMHOvswKro1F+y
         4ILIMFH3hSmCRduqc283iJ1Lq55W9AO4QeQzElxRN9HjEruy/Bd7Ks67ac16jBkDG45V
         t5I23DDO+PYQCr3w6zKA0X0wMOJBR2BoPqErFGs3KAG1rWZ+h+AYSu9HvzQ/IlI3Q4sj
         tJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZqxuBGrvpyV7bVVdQeK9vpv5xyuxJzmNpj8ibO3gKBw=;
        b=jZS3T8XTBZZAh9VZ9oNrRviM0lUGBewCBpIEdr97eaEAGT9W2B4lXd5nKDzIo/+0j6
         5OtOTOGog5fKqTUts3kPNTK+MRbIrtMueg75ix6LNTFe3GNutYvlN6gQrPq42LijYsYG
         zVzKu/CbBKLCzbL5G5fGaaSF/Tg4hBCBj3W9LkyiZYVYd5u+wfqNa0REEZeG7EEzR8/K
         KL0NkWSwLjFOHghDrHdGpJESWo9PZXeuk8zy+J7K1yL2DQ329xqlaOCGWLh76/zVCuTL
         FMxwQe/4yBpbXrv42slB89/Loi1ZaIZlNY8nkIcqYm3t0eAHvQJs8hTpNGN0ah/pdj61
         UIbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qBnMrqiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l102si10681046pje.78.2019.06.17.10.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qBnMrqiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvpN-0007gw-Vt
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50687)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvot-0007fI-SC
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvos-0000bh-3T
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcvoq-0000aQ-En
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:26 -0400
Received: by mail-wr1-x442.google.com with SMTP id d18so10953654wrs.5
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 10:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZqxuBGrvpyV7bVVdQeK9vpv5xyuxJzmNpj8ibO3gKBw=;
 b=qBnMrqiDAX2devzhltrL3k5LNwxLL0pYFEAXPUwAhF+DEGVY0ImlTww8y8aHtNGju6
 ffUdO85sB3X1bAvFocgGqqG7aHmxzLOmAU0hHzIAdhEJZ4hHseTTUW3Cd+1JfcK6AZuW
 FzniwmN9yUl2wE30w4XYIC9C44X0m8DeS4qawfB4u5ffFYXUTvfinP8QZLVoWbXNnX0V
 qJ/810BkgXp8Ttscsx5OkDZHVvKTN0JTRKJJ1DFtHP9fMRqfzx3vNGudVMnwcfqKGv9A
 svjn5Hqmk+LrJYmciUNKs/TQ02TBaHmj2TcCOoP95IgPGoXjH2gaaVsoEhdkXB6xXfyO
 ++Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqxuBGrvpyV7bVVdQeK9vpv5xyuxJzmNpj8ibO3gKBw=;
 b=RNaT+VU0zUtRtZpGKK5KWPhk/9vuvtBhvCIKViyVpcm/cTu2kKC7niJg1dbq3ttXXW
 J+bkc9dB9QGEEY0KlR53GIvwD7KMjFb0LEIFtj/jAGY8iV0yCGqmFK8yY75hc3tmvODw
 oUnodZZUOVz5BdGDLgLLhn/oWDvB4FrJIR54v7pG/J58dh6u1hofdW9Tpa8Qr81Ab+O0
 nyg+6ruMaglrcSyJmKrhx4dQb6OHYjbP6bXnIxYIfgmO3be0rzboFt3uHyUpbTEVdzBx
 oISGI2Z5c47nYLeAVQif47B/64KRhIAFyaYuX0/ezkjOYFAVtn1mNgN0+4lvzObrgLpN
 tZaA==
X-Gm-Message-State: APjAAAXwvKDpCBIT3CpwAXpCDHnDfgQs/z1w1NpNpIDxLuM3H/WbNbGC
 w9CX4+ooR1N6kbWSnrDsWa1mP9/9cPT89g==
X-Received: by 2002:adf:afe8:: with SMTP id y40mr22388286wrd.328.1560794002222; 
 Mon, 17 Jun 2019 10:53:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm8713619wrr.33.2019.06.17.10.53.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:53:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:53:13 +0100
Message-Id: <20190617175317.27557-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617175317.27557-1-peter.maydell@linaro.org>
References: <20190617175317.27557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 2/6] arm v8M: Forcibly clear negative-priority
 exceptions on deactivate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s0Gj5D+wlmPB

To prevent execution priority remaining negative if the guest
returns from an NMI or HardFault with a corrupted IPSR, the
v8M interrupt deactivation process forces the HardFault and NMI
to inactive based on the current raw execution priority,
even if the interrupt the guest is trying to deactivate
is something else. In the pseudocode this is done in the
Deactivate() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index b8ede30b3cb..330eb728dd5 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -812,15 +812,45 @@ void armv7m_nvic_get_pending_irq_info(void *opaque,
 int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
 {
     NVICState *s = (NVICState *)opaque;
-    VecInfo *vec;
+    VecInfo *vec = NULL;
     int ret;
 
     assert(irq > ARMV7M_EXCP_RESET && irq < s->num_irq);
 
-    if (secure && exc_is_banked(irq)) {
-        vec = &s->sec_vectors[irq];
-    } else {
-        vec = &s->vectors[irq];
+    /*
+     * For negative priorities, v8M will forcibly deactivate the appropriate
+     * NMI or HardFault regardless of what interrupt we're being asked to
+     * deactivate (compare the DeActivate() pseudocode). This is a guard
+     * against software returning from NMI or HardFault with a corrupted
+     * IPSR and leaving the CPU in a negative-priority state.
+     * v7M does not do this, but simply deactivates the requested interrupt.
+     */
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
+        switch (armv7m_nvic_raw_execution_priority(s)) {
+        case -1:
+            if (s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+                vec = &s->vectors[ARMV7M_EXCP_HARD];
+            } else {
+                vec = &s->sec_vectors[ARMV7M_EXCP_HARD];
+            }
+            break;
+        case -2:
+            vec = &s->vectors[ARMV7M_EXCP_NMI];
+            break;
+        case -3:
+            vec = &s->sec_vectors[ARMV7M_EXCP_HARD];
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (!vec) {
+        if (secure && exc_is_banked(irq)) {
+            vec = &s->sec_vectors[irq];
+        } else {
+            vec = &s->vectors[irq];
+        }
     }
 
     trace_nvic_complete_irq(irq, secure);
-- 
2.20.1

