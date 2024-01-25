Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp233347ejc;
        Thu, 25 Jan 2024 05:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ7gXJoOLPasr+5Y8/HcjjVeFN1q56ByDh09U3xVM1pLasoMHHLkqpTdTlmZevISXZG9SE
X-Received: by 2002:ac8:5706:0:b0:42a:63bd:c32f with SMTP id 6-20020ac85706000000b0042a63bdc32fmr1317159qtw.3.1706190216083;
        Thu, 25 Jan 2024 05:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706190216; cv=none;
        d=google.com; s=arc-20160816;
        b=RHg0Bbb0VCR5k5pukg86m5G3241x0YTzt1vApV5rt1d2mrW09JreL1NCRYAt5ACTmn
         Hmz3pqAqdNKJuLuziRKFc1IPTt1gOmT3byJtdnUGWzgDNeh/0QpCtQtolOKHCzl0SQlT
         1q/YzuV0KcurhbbTpnWpUR4sUX4tGgf5lLgXV2AHChhMtZoVQy49aSVBXSxLQqwZUziB
         syLskh6h1c7GXy+IkQ/pbDIYYUPkQWhIIQ4kz4rcsuUsKBivI7pHLe5USzTYfIwEeZia
         aijz8gjvhuR6CnuFScNRO0hrvNB0fo+baL90yhxShu28Jpqpc+zcSpToEySIS3wvHwWX
         nnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8cqesZOdW9FLhCoNybK1K8wV/PFZ0n/GQh3iLYD7EDg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Cbm9RanXTgo9AFStoy4I9msIyJhrIRQcM37jtqigw9CJraguhgl6vxJexnRZ8MjDmR
         jM6gHLO1WB4nmZw4nj18swIIY93s4MnPadtm7t0cMolTw7IaCy7nSv/VHFZyreI53E7n
         jjqsJdTQhalwrn5/P9DrLQiPbK521WBfviUUYgHi+wiwce3apHEeGvSfsggBFqmswuk5
         TkCCyUc/Uo8/m77TcPDkDp3907tVckGFFg5KpmPXnhHSa19wQeQNrxtAKiy+gVJAESGf
         kpBkwPxhn80ci8HfmOCIZm+r9Db4gOM87wjAlYiajeiXqI2xji6bTIMQHHVFCCUjLW6F
         +Mcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZpW/cEJ+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ac87d83000000b0042a45478593si7920787qtd.578.2024.01.25.05.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 05:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZpW/cEJ+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rT00d-0003ZO-1t; Thu, 25 Jan 2024 08:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT00b-0003XX-6j
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 08:43:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT00Z-0001kn-Ar
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 08:43:08 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-339289fead2so5722930f8f.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jan 2024 05:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706190185; x=1706794985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=8cqesZOdW9FLhCoNybK1K8wV/PFZ0n/GQh3iLYD7EDg=;
 b=ZpW/cEJ+CCTg+N4tI41HEJBOWWfopjl+x252kk/oBWVmmNWn44/gmca1UWv4yxz3cX
 5WK3pbZAgoSKPKuoeT+cn/FtHopGKmzDYIU71ARkSQ5mX/bcwt2Bi2rzJpvDeMKCKssB
 eS0kOCS55/nx/NxpfW/czP3Qzrkzc7vTc7k7vLyK7FHpzoNkeERJk6wYrRwANZoSlHZa
 ZGXgX2zi169ruArfD3qVjHBjeditQM5XmoHOqdw937PUQib15Rk1XGfzfjCqP856tbca
 1rGtrmPqC7Ff5Jk8KXvAv/hISMpMu9ZfIZnQLuoY1W9S9BQET1BFA6WU+Ft18mZlQf0z
 4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706190185; x=1706794985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8cqesZOdW9FLhCoNybK1K8wV/PFZ0n/GQh3iLYD7EDg=;
 b=UVF8OixBRBrtzE0ElrVyvAtuA+icypxVBdxWqzere05QnH/E9a0BbBUx1vI15w/UE6
 fnCLEja++p6xCWym8zz77t3DWewg2fQKLs1tKaX9MwEmY9DP/JLj4aC+9EAax1U4e27+
 63wMMAyozEiTe95LzAW/SWOdU+qFG2HNykDK32h8CHvujSYl9XApJsFX6Php/we5PYXD
 cy20YCc4pkArWcq7lTNa16Plvy4rDWxeGKDOEBKWBUCfI3KtnuLiy0UBDlZA5HH44b+M
 tn6woJqV68x9W4gr+fliqnLiDKN0YKRL1EpBMFIQ8P4EuuOGIPmz0Y6l6BvvVWfiJ+PH
 nTbw==
X-Gm-Message-State: AOJu0Yxco4X0gzOvCO9OBYQM35U7EJGkyT9mqXlgWgDfGKovwirRPP2F
 PzYNR6X7l0WhCv9AAA2jOwJvOyIWxA8wlzEBOGZpmMCJ3KxvC6pP23rGL/SKutSIuzkANS3i7ss
 1
X-Received: by 2002:a05:6000:1209:b0:337:bcac:35eb with SMTP id
 e9-20020a056000120900b00337bcac35ebmr529645wrx.136.1706190185451; 
 Thu, 25 Jan 2024 05:43:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adf9cc5000000b003368849129dsm20810534wre.15.2024.01.25.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 05:43:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Add ID_AA64ZFR0_EL1.B16B16 to the
 exposed-to-userspace set
Date: Thu, 25 Jan 2024 13:43:04 +0000
Message-Id: <20240125134304.1470404-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: u7EEO4yT6QhS

In kernel commit 5d5b4e8c2d9ec ("arm64/sve: Report FEAT_SVE_B16B16 to
userspace") Linux added ID_AA64ZFR0_el1.B16B16 to the set of ID
register fields which it exposes to userspace.  Update our
exported_bits mask to include this.

(This doesn't yet change any behaviour for us, because we don't yet
have any CPUs that implement this feature, which is part of SVE2.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a loose end from last year: in commit 5f7b71fb99dc I
updated our mask values to match the kernel, and when I was
doing that I noticed that the kernel had forgotten to add
B16B16 to its report-to-userspace list when adding support
for that architectural feature. Now the kernel has fixed its
side, we can update again to match it.
---
 target/arm/helper.c         | 1 +
 tests/tcg/aarch64/sysregs.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e068d353831..24c0f80679d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8895,6 +8895,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64ZFR0_AES_MASK |
                                R_ID_AA64ZFR0_BITPERM_MASK |
                                R_ID_AA64ZFR0_BFLOAT16_MASK |
+                               R_ID_AA64ZFR0_B16B16_MASK |
                                R_ID_AA64ZFR0_SHA3_MASK |
                                R_ID_AA64ZFR0_SM4_MASK |
                                R_ID_AA64ZFR0_I8MM_MASK |
diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index f7a055f1d5f..301e61d0dd4 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -137,7 +137,7 @@ int main(void)
     /* all hidden, DebugVer fixed to 0x6 (ARMv8 debug architecture) */
     get_cpu_reg_check_mask(id_aa64dfr0_el1,  _m(0000,0000,0000,0006));
     get_cpu_reg_check_zero(id_aa64dfr1_el1);
-    get_cpu_reg_check_mask(SYS_ID_AA64ZFR0_EL1,  _m(0ff0,ff0f,00ff,00ff));
+    get_cpu_reg_check_mask(SYS_ID_AA64ZFR0_EL1,  _m(0ff0,ff0f,0fff,00ff));
     get_cpu_reg_check_mask(SYS_ID_AA64SMFR0_EL1, _m(8ff1,fcff,0000,0000));
 
     get_cpu_reg_check_zero(id_aa64afr0_el1);
-- 
2.34.1

