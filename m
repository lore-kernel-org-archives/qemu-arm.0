Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E1F8FA78
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 14:24:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFBzz-0006DP-4v; Tue, 21 Apr 2026 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzv-0006Ai-UM
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzs-0007Of-VG
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:43 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso21544495e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776781359; x=1777386159; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n/V3BixVWfmT0cZRmnp46kdvUv9OHHl1mdE1sGsEbnI=;
 b=Lqa5in1B2SzBzv5XIi9yjKGIG07pYzhDsn4Dsn/6S2zawMw5RCbOzIf7kSGAK+2xnm
 Lv/bLEU6BnvUUnXalIlhZzgJv9N7o91MLr6PBI98vdLaLDeeCpsxp7+hrcFh2VeUZppk
 F5gWZV5ofK4k1A4Kr0IL2rnLTTN3OEyWzEFaVRTwIy2RZOScRpDVlAYUlzNmx57wU8ZW
 7hkWWRRe2iBqfmhdkMaC4RbqwPS9qOO20PIg4lDW+Fkro4It1+v/Jj4EoKmTnfKVermO
 lFbrywCWdaeHxHjLQgLcdCu04FO4ihD5jtGJtuFuxgWrMtuxk8BHrZYU+eGcU0PrNLLl
 irGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776781359; x=1777386159;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n/V3BixVWfmT0cZRmnp46kdvUv9OHHl1mdE1sGsEbnI=;
 b=CDsREkdEbgLzBx+CFB26PcxSdNFuT/q3ht7hwDJqB21ZpEKvzw+dLooOyDpd7o0dxb
 +k11Wxq+QHp1HO4qdCrbCMWey9C/63wQNhPGnKPNKIBA5mfKV8mPz3NYuCKPMfsZ+Njo
 +4IIcLJI5SBMfUPfB6WcLwYVcR7JB/sFMlMg9wsemzcXQZgOdFik1IImk4vFHNAM6cjD
 IYkUcXaA65/EHUan476+xTVE3uNc8z/gcYJ9cbx3SlmjW2eelgO93UjR9vU/AuHCwrvC
 Ch65xLj5pf8ZJ3Ld5DRZkdVOQ1l4J4S5eFksF5+yhxiIfVUJ4R52dNiaZdXq5qnvWFSw
 jF1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ynbIfPNbbLK/gajNqtHM1Qr9uK7gkmHwHrnudQ/6wziIaHHPDHbSqnUmTH+tKH2S4hrXh1q2lGA==@nongnu.org
X-Gm-Message-State: AOJu0Yz3yWuTPHNxdhGxRpkJ3xTlN738OXvrWVEkIAYrW/MgbgLJpaX2
 H70+enTKIZke9kUaH4DWWJleJhVT6DAsbL3MyXfZIF77x4C+ChHhyxi0dz5EpI5D7IA=
X-Gm-Gg: AeBDieuuGcLp/P/DiYtEZ6VnZ7zOeLDQpqKEMmpGBwaMgH/fOrIxkNIXPTCj/oCQPZR
 gK3bdxylp42Mr0+PzbJTSp87Rs19sKI+jlD9Pac3PuPIjDTYj/LPwLHysLzBmm/AVDUtg0M7jXB
 /XHsYyjc565O3qeOWyZcSWOr+JnXdxWcbwOObb0mDMMR+kLi80qNNz91PolW+FqGvWFViUeOkbF
 fTvVR3MKzhjHnSd32tXUPThVa0hbOXWamza5RvuHRaAwLk9iFMBPHLOka5h/U+/5rMw4xT9Wp86
 byG54S4tpY3qhXzNEcWliFisIa7LM6dTmfQTSgL9varB1wBK10DD2bdeI+NDgiC63uPapPh5a5+
 2ApjAKU2rUZdnO0/XiU4iG8aZraDewC5CPFK3bBktm2mcJnvuJfEU4jcYd+8j67C5T1GRfHOixC
 LsUF54e0vwOL1GitC0LnaBsz4LSmWP9mm1WuPtpg==
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id
 5b1f17b1804b1-488fb784843mr196697305e9.24.1776781358997; 
 Tue, 21 Apr 2026 07:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:5364:f814:f749:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm164250465e9.9.2026.04.21.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 07:22:38 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 21 Apr 2026 15:22:35 +0100
Subject: [PATCH v3 2/4] target/arm/cpu.h: New GPCCR fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-jmac-feat_rme_gdi-v3-2-ecd20c77eae1@linaro.org>
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32f.google.com
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

Add SA, NSP, NA6, NA7 for GDI and GPCBW for good measure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..1cfef02dc0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2089,6 +2089,11 @@ FIELD(GPCCR, TBGPCD, 18, 1)
 FIELD(GPCCR, NSO, 19, 1)
 FIELD(GPCCR, L0GPTSZ, 20, 4)
 FIELD(GPCCR, APPSAA, 24, 1)
+FIELD(GPCCR, SA, 25, 1)
+FIELD(GPCCR, NSP, 26, 1)
+FIELD(GPCCR, NA6, 27, 1)
+FIELD(GPCCR, NA7, 28, 1)
+FIELD(GPCCR, GPCBW, 29, 1)
 
 FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)

-- 
2.43.0


