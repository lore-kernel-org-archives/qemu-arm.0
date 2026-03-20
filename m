Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626FF1098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:09:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYg-00034y-2Y; Fri, 20 Mar 2026 09:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYS-0002sS-Ny
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:20 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYQ-00061U-5V
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:20 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-662b5bf4b10so3882061a12.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011976; x=1774616776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJwDFHhBf+8AgcOpTirKnOmj9rGpr2ot57177Z/8DEE=;
 b=U14H7Ew20jC35+sfVwoAVnGMQgXIdZzQFSitGKMVLRcJDinNR6T1GK1Y2siqgIqPpJ
 /pDn9JEfsKU5Ymf6J2u2a7SOqaIjizwfizjctA77B3s40SXqeL+7hE1MCgqfY9GU2bth
 AYUjJQNOPEuKk0dZBH/ppdv/kRt44bBy9MrvCm+70Dy0kS4BfpO2WgnWoKPDC3IfKOMg
 PwmWQyg3wzU7V5uEGqE5fL8hUWJm/aOhliNPbzOxtjc9+cVv0r162IrlHfxorBpMG/AA
 F8Ia9RvlVd/khrdhnG/poDdizWwHEMIk7ZP/G2eUJZKMjkfxlrNc9/oBnMpdu5yJH6at
 lpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011976; x=1774616776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SJwDFHhBf+8AgcOpTirKnOmj9rGpr2ot57177Z/8DEE=;
 b=Ec9HmmYEIvKEaimXHsYTFWkAHSR8vw2DYjXs1ez+i5wZ8T5+ymiAyMTTBjrEX1lyZt
 sCZ57btGZQFIXI2gDP5dEIwlaDAdfiJlyJLgI18shxNxpq5LQBzTGNY29HoPBjONLJn3
 A+a0F1LAWiQFkbg1O70kI4p/tuCvvNK+d5QrypUccXPKShlYJXQGYKTK3sRBaotVOdYw
 3Mqd3GpJahD7xmEVTxjjsjV13UMKf0fVL03mHzZqIbR8fwH1KsJ4F3E/9U8vysNIO8ze
 kx1hcpIPx2rT6RLxo5YxBsuorWZjr/LU0ir27hBkSvap5arWE80FrmkDdkwWDnHswL3P
 TbNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUZ/4ixZRQSMN9OyF9kXuNUazKi+xmFtGmcJCsdKwMhUH25/2uYeI1C8g/rjWfjcqaGbJfqgBIFw==@nongnu.org
X-Gm-Message-State: AOJu0YxSx1N+F/7YjPeHicjB+3Seh/x+yL3kmxWo79040NkJONMpu7F3
 24rGocvEcOjRFhr1ccq6mfaFZSSFEedd42wDFF3C5q+bfupYHXaqkC6plXjQLgvG2VU=
X-Gm-Gg: ATEYQzyFz8pgDb2lj8CIpCWnsCnu8zLTBYBIf+enoBszF3392geRLzZENgW5MgCekYM
 AYZxKEyEn2+uzURmrjKEC0Lex2AYsbWxmQZZ+fLdIh5BQj+8+2wI+1TLKTix09/TTxN21SXSvkJ
 1DL6CekOaZRZBoWCIxOpBBUDkBijE05HSHD8l1UZ2r5U+S9uC5SFDCXlfUzrq5Z/Sf8N/g1cT0D
 YSFhcWPcYqkPi72EStG5LDQ/iL5uI42HcX02/RBSxmJcTi/aNjBZWCAltTGRInaLCqAyOlerAZr
 +vbxaXJ8KqC3OGicrFzB/T0o2rx6AXuABrQioY7qrtHhJF6Uf7NPzax0B7jLB78FPb1Oa1sKfz/
 oXqL8UfR4eWZAvnaTHkBp4s1OfK/r681ivmWupxVOAB07EeZxVulKRImUgOiV+z8oLtJVTo5AIv
 LlVAvFJ14aFJR0EM222xwsjDY=
X-Received: by 2002:a17:906:2746:b0:b97:f9c9:af61 with SMTP id
 a640c23a62f3a-b982f4e922fmr164777866b.45.1774011976362; 
 Fri, 20 Mar 2026 06:06:16 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b983365f607sm154752166b.50.2026.03.20.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 156AE5F943;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 07/35] target/arm: migrate BTI trap syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:38 +0000
Message-ID: <20260320130607.2071996-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 19c7659fb4f..0520e51a686 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -426,9 +426,18 @@ static inline uint32_t syn_pactrap(void)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a Branch Target Identification
+ * instruction.
+ */
+FIELD(BTI_ISS, BTYPE, 0, 2)
+
 static inline uint32_t syn_btitrap(int btype)
 {
-    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | btype;
+    uint32_t res = syn_set_ec(0, EC_BTITRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, BTI_ISS, BTYPE, btype);
+    return res;
 }
 
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
-- 
2.47.3


