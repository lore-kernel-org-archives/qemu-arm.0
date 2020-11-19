Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp764088lfb;
        Thu, 19 Nov 2020 14:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi6bkj7pfgdcVHn6gs03+ORndsiYnlPWa9uXI0Ju30OaghAQMdICf4zFbMiu/XLGQR+G37
X-Received: by 2002:a5b:cd1:: with SMTP id e17mr17193534ybr.177.1605824270869;
        Thu, 19 Nov 2020 14:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605824270; cv=none;
        d=google.com; s=arc-20160816;
        b=Bf3xKzAuqCuPFj2Drkv2WHV4TtnuIBlsP0Fe0V3yCQHaJLAZCI1SJqj41n99NeGG3M
         86nzKu1GCqbPYsLqIhbWVsM3Sf+kiFb2695miiXVqlgu9ffJAxHg1aAThDS9vbysdFuB
         TEWVuQY3h+8VGIPrFPxdVljkNAxme3v4+RA8RsvcHOEfgCbmxM3+VVpT6aUmgERM4orD
         uRSj8HmV4QX5w54IxbYXPyP8KotIqlgi1bOeGqQwQ8E0onp+lLuOQ6A8AzSEmYi4msIy
         2faPTOvIMVweKhY+lIuq45fz4nb4fcOJkL1x1+5OsoUaFGnsXXdm3lZ2FBwpiYYB1prU
         vZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IYl49JEXLJ4NfyGT6TJwXfRcF2SPUTrLyQsnI7fa5Vo=;
        b=AHjwQ+3Jbq/+JbC/xry/uV9Ic50jljUQsPwynR6TPwARor63MNNw1oGz9dAvhGnFs/
         ZPbiol/n01LhisP6WCWXSlbBQDmiABGRoqhf20ALgWGm+jC3RZnAGNxR3dwAujc3We79
         W6Hn0sYYiaUEe5n/RqKGu6bhPrluskl5t3ArzMPcM1a6Fwoqk69r7rpMIeX6y3SlCRzx
         ZX+T3RKpP2qZzvsv5JIrvruKEbWX6bZNuioACA9VjjLGkVocIszhux5GB+8TbVlkhOL5
         eK43/uHqurV6FZvsXU9UZIau5T1+6d96f2p3QumnPKxe0mDufZIHtdDY6iAfw/t9nX9V
         OhAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RW65dYVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si766598ybh.411.2020.11.19.14.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RW65dYVU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfsFS-0002A6-8z
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvH-00011D-AQ
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:59 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv4-0004FC-TI
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:59 -0500
Received: by mail-wm1-x342.google.com with SMTP id a3so8060072wmb.5
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IYl49JEXLJ4NfyGT6TJwXfRcF2SPUTrLyQsnI7fa5Vo=;
 b=RW65dYVUokAroAYmmJpkqUnENT9sMP0nallQRhd0kU0t/hoFmbuIswAHFv2fMl+/GA
 Ik8qLEPuDJ7lv+b22tytoetx7VCDoDaKy1v6gbaGd2qnhCs4g1V5ays4E0z5fi/27ki3
 NCAFhWgC5OttC5+cPeXCCn1JR1bIsPi2TxpH68MnTT9666ftSfMpiB49p1TQofN2/Kxs
 k9Y3NMeMLjo/ihCrWIPALS4dk76ZxK4UN28iRsInnpcyIFWe4/NkOLtOTemac7C/YquQ
 Fc0nkr3gp/kKGEXheQadq+1GXz9jUqrOWI95vZOGOmdc3D9a11SBAc4X0ge2nyhmctzK
 RqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYl49JEXLJ4NfyGT6TJwXfRcF2SPUTrLyQsnI7fa5Vo=;
 b=a9I6w1D3w/o4QcKqMCeQO2cOw3FAhEHXZvKqDgfhRYf6K32+WjDi/8g40/k0TH/TpG
 xc6oQyRNFJaD3cPMvlJn9kx9UKZ1lRkcauOwmytYfbw9ErkXp0Ee/bkTzVDJ9NvC7QgW
 s4E88BZLB+/M1Bm1SaZxIanobjQCCLxlgd7f0kxUL183rlJ++rTPm2LJVBbMqOvb1b5n
 ycVEfxnjdRpt/VBdMMn+1fIutvzJXUXrGxfNH3JLskQjokF1/qliTICJNKEAiRkSRrFT
 n9GRVNvEEz7E+oJHqJ86YPFsywB6u/k/MuG32HO2+p7EnlHt7koAVIBgtYbuaJwK6n2h
 8P3w==
X-Gm-Message-State: AOAM532+PuVr9n2FeZY/IJd6xnI3pgCD6jI0O6c+J34nM6x0r1ucfuvX
 u65UY8i6Mm6/+JgYe1GE0nkXZT4Lp2MnqQ==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr6629056wme.0.1605823004064; 
 Thu, 19 Nov 2020 13:56:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
Date: Thu, 19 Nov 2020 21:56:10 +0000
Message-Id: <20201119215617.29887-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: fbPsDn91Ixah

The CCR is a register most of whose bits are banked between security
states but where BFHFNMIGN is not, and we keep it in the non-secure
entry of the v7m.ccr[] array.  The logic which tries to handle this
bit fails to implement the "RAZ/WI from Nonsecure if AIRCR.BFHFNMINS
is zero" requirement; correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index effc4a784ca..deb4bd56c95 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1100,6 +1100,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
          */
         val = cpu->env.v7m.ccr[attrs.secure];
         val |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+        /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
+        if (!attrs.secure) {
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                val &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+            }
+        }
         return val;
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1662,6 +1668,11 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                 (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
                 | (value & R_V7M_CCR_BFHFNMIGN_MASK);
             value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+        } else {
+            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+            }
         }
 
         cpu->env.v7m.ccr[attrs.secure] = value;
-- 
2.20.1

