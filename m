Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4748644wrg;
        Thu, 6 Jun 2019 10:47:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxc0hQw98xkx8mA2gIeTpUXLMhenSg+qOQI9ggRs2IVtxQQK7lFVitw33XZHmpzSqwG1tU
X-Received: by 2002:ac8:21dd:: with SMTP id 29mr22345291qtz.340.1559843258543;
        Thu, 06 Jun 2019 10:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843258; cv=none;
        d=google.com; s=arc-20160816;
        b=dVRY1FMwga7D5clfmIgXChFJDqtrOny9DRI+xiaP93NItDw6i+WGBIDRsT0LBT+gE+
         rLKohv6Lxt1yCzkP+vcTJBWLmsDaEQatCgdxo2uM4rG1Yt9tUE/KYxPeeiW1+cDE5JM7
         40Rh+PSXoqvwI0agj/xVy7XCCy12bKFJdSy0jAtGv8nqn/BGl7q0eRCZQHUBXJWvyjM8
         CcYnx0gg3iVQnhTBaKhR7ucK02TzhztTqeyZZRQafiLyLltzWX8GDzVBnXLKtgvWx6Xm
         cmjU+ViTo0gW2A+eM9uMo1oU1EAjb87YRl7ZSBTfxMfaW+3jpXJPWPkG3N6/rdY28F7J
         A+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=KtIfSIKYeaE77uLCULn8mRdtcD4iWxd4JC2TjSFb1R8=;
        b=y7ttvgWOj5XZtr48uhpbaAlBS4r7iDJfHq3KmDglDunneS3BxByQuamk4tsqaAeMiN
         3EUHBoCvfYjzP4R4z6A/pLLITtuDHo3q4GrYI6TrDGgG9lXMCA4/xGk/LgmOVTJpifAL
         Funio0++SDJyTngg8ZyBVjvHj8Ih5NAwIKL/lyPZFLJshyfGFTTYSfUIHlJ95lLUeuuA
         NHXoyesKSvmaUEKrBQNvhk+WGZyysDjywZaY1S1Ht9JwzBfrV+adtdPXt1QmCfA2qWC7
         TnU0EHrVHxo/vs0K8lMprqIj3k0rsQv/Y5Bv6n0oaTqaQSSRTpYBdxRifQAB7rdxkX+7
         OJEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SiFVQbao;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c68si297069qkb.79.2019.06.06.10.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SiFVQbao;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwUE-00046U-0s
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:47:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTi-00042p-Jv
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTg-0003Va-DI
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:05 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTf-0002mv-VK
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:04 -0400
Received: by mail-wm1-x343.google.com with SMTP id s3so802467wms.2
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KtIfSIKYeaE77uLCULn8mRdtcD4iWxd4JC2TjSFb1R8=;
	b=SiFVQbaorp/ryzAfQvS9FdhoS3ZlfB/R7KNWo22KXM5RnAbfpAQzuVedj9rm29reWX
	Odpz2vu1fthyMOZtAktNuQVfn7MvDNHRIub81oqb9mMwfyoUiyBEVmx1otGtj2eUMrx0
	O/5Uv+pnwe9L30Qg3kWlilCr+wVaDmgK9vU6Up9X1K0OcH5t9pd+JI+Oamg49eMcRO45
	pAjhZI3T509giCCdxmrhOhA1YuKE9Zpr/W35+PDFLLInRnfG2ULB5cJ8HQWOwv9zWKsm
	xmok6zVVWJ9xxnMXSGR+f9icxays5c2xCsYCwl+/uEqZdk3Ivh1qLWYxBnADVsAGzFPR
	wnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KtIfSIKYeaE77uLCULn8mRdtcD4iWxd4JC2TjSFb1R8=;
	b=iWPNnpBWcgeCfGidiSemg/QzFTSx1uVVsP5KXAEoWvQuFLSNtGCNtwMXfudGjLVxqy
	Rkzga9u2xrN6eqBnBmf3ctS+2eNYkSkjN1wiXVfGLADdsEQ1DS8/D0wlSV9Zz21jLGRt
	Apz8m1eQmPBJIp5XeHhUCxzdYHpXKMFqtzKz7ySlYwHwBEq3kFVt2vD8eFVtiuZItAnb
	t6JhtC054FPFUrgFvp5Rt9umHLkyMwbWWagVIH5JIv2PU7S2IDxquwhcyoERJmcZyG60
	AEDbXfvoF/MeH3C7f1tkEVum2naZuL/jz3SH1ftmjhYH5PfHoikEnWdQk4+7AiPjJN+s
	zwIw==
X-Gm-Message-State: APjAAAXZHnz05xhDZphynUrZMNkmRqjWRILh8y/WtuBJqDOLSCA+D+fG
	NJinQZwQMwh5DK8nWMs0mSVXSADivofigw==
X-Received: by 2002:a1c:cfc3:: with SMTP id f186mr759827wmg.134.1559843172539; 
	Thu, 06 Jun 2019 10:46:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:28 +0100
Message-Id: <20190606174609.20487-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 01/42] decodetree: Fix comparison of Field
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s6rZvawnmDu1

From: Richard Henderson <richard.henderson@linaro.org>

Typo comparing the sign of the field, twice, instead of also comparing
the mask of the field (which itself encodes both position and length).

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190604154225.26992-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 81874e22cc7..d7a59d63ac3 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -184,7 +184,7 @@ class Field:
         return '{0}(insn, {1}, {2})'.format(extr, self.pos, self.len)
 
     def __eq__(self, other):
-        return self.sign == other.sign and self.sign == other.sign
+        return self.sign == other.sign and self.mask == other.mask
 
     def __ne__(self, other):
         return not self.__eq__(other)
-- 
2.20.1

