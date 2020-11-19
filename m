Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp761985lfb;
        Thu, 19 Nov 2020 14:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrRAdDxH2QzQ+SpYvJNBQviH6eY/RmEdj55OS3JLBs5Ub83wsI1fliPe8pQAtK4nMT9lgi
X-Received: by 2002:a25:7355:: with SMTP id o82mr18683104ybc.122.1605824073913;
        Thu, 19 Nov 2020 14:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605824073; cv=none;
        d=google.com; s=arc-20160816;
        b=bOAb6KrKAgSVP/zrp7DGrZBn8qzkHEOeUli/o3jbrk7TDaRA3rlyMZKEnU4zk6BVS3
         7K2K1pGdZDqYtPd3RD1SBI9vD3nEYYj+kNpQpuiwcF7VpR1/NOiOrbnjYiMJAnwjp5yA
         zGqE6W355q1+4KqmpvyVMLgrf2U3brWSr1afHu2puAvvmOEzxigL4yuqSSXzQKtHqAoE
         4/R+Mgb2amzp6drPsXkrCzgL2lCawTLSgonV1v1ix13F2ptKuaEVWxwTONwRyRGE9Cal
         459SOI3/P74iW9vpR4OXxUrmsHCVqc/JSV9qDTi2dYU6goD+Fj6yNerwYQVvuZ24Fnz9
         JvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x/1ikKgCtIh33k/Ei8GUh695aaBVR/KcxDX2doWvQMY=;
        b=qnqOhmttSBC8u8gpwzLLDcQv5X/IQgpnrQmwrFN3A4vbTQSSc7jKBOJ3uRS2Bz8jSR
         MEhxYiGff/QJYGskcDMaWV/RLe7M963p5ilsslMp8pYU4TbPkSIEjRTBsObXg572Fbe7
         pBocGhYky7FMHEuEsYsfltuTaSQpZHgvfTUEq1LsQ5A2uNmeDChlHQuHO86ePeBGc6bq
         CZFUEbYBfhccotLPyhmcK2SHMqRI3gDgrWX0qfyNx7yt/lP7zmNk3OgYduNSdot1d1PX
         fK4j4OtS8D0BdSjCrV+c+84I6Cgy2FKkv6ObWPWD3KLM1FEH9DKAuWyy5gbKiPe0PFmo
         Xfcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opmGv8RD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si579273ybp.209.2020.11.19.14.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opmGv8RD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfsCH-0006cP-7S
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvF-0000va-5q
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:57 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv1-0004De-81
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:56 -0500
Received: by mail-wm1-x341.google.com with SMTP id a186so5772469wme.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x/1ikKgCtIh33k/Ei8GUh695aaBVR/KcxDX2doWvQMY=;
 b=opmGv8RDBXEjJGAPXp5nLTJIqrWGs4Zd6lF6a+Unm/qXUKITnmBLaOjy3MGV5iuXtd
 3sMgTCk0dVT9iqtTAbsb5ZRxTlEn1r7rsdkZ56lJiG+ddZ6KgJJ5rgKwlDTJz2Eo1W2A
 NtilX51tqFnmtJviuU3OETDm1EmBWjrQZ91HZpIyOSnbYp23CjhDxyS27wRR/pbiiM+6
 f4ej8IsbeR9MTZfhJmoxUap2S+IQvmsi0MVkr/JoK4yy1WZiU9IFuQU4wuvmuhLvhbJQ
 g2drs+BEcVH2GPVCyyzhDkY2BrPP/12jIZF3i8amIESeZnsPOQi63meCAvCfDRIfjAAA
 tfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/1ikKgCtIh33k/Ei8GUh695aaBVR/KcxDX2doWvQMY=;
 b=tOZ+u5eKjCczskuyJfRAVzYb45vFoqxQU8Oco0AekEK1xQqWFe3+xPR0+myaYUrN9Z
 EJIAwoGX/4RjqlO+m7G8rVAbYNI/ZcA3ezgGWKNmo4tzTPa6o+DOMoQj1gzh7alSX9Px
 y3L/JhAm8ktO7QfMhZRelFPfk8izkmdkT5AvpiosmG0SeAHcMW43QfcgSan9sVFYBWfe
 wzS3hnPDRHU6Eps+/xhBCDoAV17BWolpv8+yinSCH8ra8kUMiI2nBuIhJRDIjHwnclmC
 46kVWoHr22hONlmhUl9yZprw0tpArleXp4zTjz8/0dqdNglVmn19B60laZdMK5MA3cCD
 b8oQ==
X-Gm-Message-State: AOAM531gT0rlqdsN4tj9N0uPz8m22y5vvVGmIt5oyBmR3LOUvkjJr/Vu
 KiwsDCmiV1IijwihGR1abUdeNQ==
X-Received: by 2002:a1c:103:: with SMTP id 3mr6381648wmb.81.1605823000830;
 Thu, 19 Nov 2020 13:56:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/28] target/arm: Implement v8.1M REVIDR register
Date: Thu, 19 Nov 2020 21:56:07 +0000
Message-Id: <20201119215617.29887-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j9IeDvP5vhgO

In v8.1M a REVIDR register is defined, which is at address 0xe00ecfc
and is a read-only IMPDEF register providing implementation specific
minor revision information, like the v8A REVIDR_EL1. Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index be3bc1f1f45..effc4a784ca 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1025,6 +1025,11 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return val;
     }
+    case 0xcfc:
+        if (!arm_feature(&cpu->env, ARM_FEATURE_V8_1M)) {
+            goto bad_offset;
+        }
+        return cpu->revidr;
     case 0xd00: /* CPUID Base.  */
         return cpu->midr;
     case 0xd04: /* Interrupt Control State (ICSR) */
-- 
2.20.1

