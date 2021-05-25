Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4054657lfm;
        Mon, 24 May 2021 19:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxORa742pdEi4f3YYd+CoVmS/FSejhpZhPHrcVcsD2zzezJC5xqziwoTejIxSjf4sOr1XxU
X-Received: by 2002:a6b:156:: with SMTP id 83mr16618789iob.22.1621908782852;
        Mon, 24 May 2021 19:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908782; cv=none;
        d=google.com; s=arc-20160816;
        b=fpbpS1VHfikk18NIIOAukoZuKsiHjDvuPMAkZvrMd3VtSY8c0LLk7ZpzEzDsfU8Wmu
         kgYCA7/KYDTOJcAeKakYs67qzdeWfwm3IRtcOIeSoDYq+hZ14H2q0DgA8PZzTLvGL4Hn
         JSgTUJWRNGd6Yrr7uTmloqojQPBXGZHijsX1jk4LXLW5f0RY4FUG/S5WtoRUEt/KNk6h
         P4ZbMD/w22lg10lNsO5M0XeEXh6uCd9Z6jRHUZ44VQNw+dkwSIQlD+mxbddInASnivPy
         IhcXKO2QM1I8NzYca0JzXvQ/HZ4+Imd1Bu023T36aDgwxslMC8WQEtWF9CVumFqA7yho
         pAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KPcdnZuAqCJG4HBYcNFFV8xlK+AmV9NrhFUm0MsLHPQ=;
        b=KO/tLEkwoZuLrwcp6NCyMZCocEOLst3BNk+PoWcZnkriLkqv1n3GGI44I+fsrfvCVE
         aGaM3poapP0uGSFc6pVAg8OUyLx3uc5Ijo9Wv9mGGajJoYoex7Jer9TaWkH9QmOB7pYT
         c0yrsAeWS2xwFowfWx9y0s8qY4vyALnHbb8zoa6tnsOdAwlZWK3KFmU+mpgYCDQIj6Uf
         i8t98kkqdMvF2mDehE7GzurVi088EogHUgssRrtnR56TLoMTTzbgXKmf9YhuzNf9qJ3N
         07LHwvHTz2gEuQnzAY+W8fgNVbLaLGopn/tsLIZQ8gSyNR+87jw7rVOPZvessq6nl+EP
         1LqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QPr1qhjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13si5692402ilk.14.2021.05.24.19.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QPr1qhjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMZ4-0001O6-55
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbD-0006hv-RT
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb0-0005uq-DT
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p39so5938853pfw.8
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPcdnZuAqCJG4HBYcNFFV8xlK+AmV9NrhFUm0MsLHPQ=;
 b=QPr1qhjCoLCnXWo91jcXi/EuFp5jx+GwHMkBv6dYC4476in/lfjglA2QVcoZRIDxsk
 5qHOeXTg+INbnFyqdrJw/ci6A3k0QQNzw+N8O9YQ2faQAPu+4VXMJak3SYgHinIH3awu
 xFWhTIEae3wVeD2HYtMFU/vjEyXdLtN9q6AbogBHjDLMz55j9OpZaBm2/bFIloMfU7fq
 6iGZOSwPK/sRmLVZHupNSwQXNRTo4jDmVqwL1oMvllCTm0104lwJ4YMPzcrjBg/SqRrz
 Rp8KylJ8sCzkZ94q7eSmIapmRWrLV3KSFv5vAYbGhybklMrsQwgQDkJkWCCKYnM1y3yw
 sTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPcdnZuAqCJG4HBYcNFFV8xlK+AmV9NrhFUm0MsLHPQ=;
 b=CelToJ8cEOkpez1Xq2ulIYSBhZEMIJInsSfy5iSJ2gGIpIAI37q/8jjFJoAiZvRm9z
 dxAbD8Ruw96Quix3r4o8n5ILkebyJKQxRv1eOENErNpNLA/r031yuxiDMEiNs8vOC/09
 dRWFKoLImqCtT0FVvtxqt6ah67Mc6H+M2mBDFwTtihNrnzgAMLWdlLw1l5HorfimTHkz
 ayGoIAj2N+1U+9qq0d8aqCwCAfZ9PMgPpea1CV9as6sEZIDOhwkFyCpfLs1ukqukHYu/
 pcnfz/tbvW3C0fv5OqggAZizYwt5IC4GTBmsxqW/f00BpiNW8X8po41fofkTCQV2DXtm
 NNmQ==
X-Gm-Message-State: AOAM533vnGudJhlgd6zr6ncSYzYw2h8h7HmfLYGcjPQDPTXkA0CFkMUw
 7hPcP+etMU46uplIgqkXDM2ghg==
X-Received: by 2002:a62:1a10:0:b029:28d:1590:d204 with SMTP id
 a16-20020a621a100000b029028d1590d204mr27415066pfa.78.1621905056463; 
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 91/92] linux-user/aarch64: Enable hwcap bits for sve2 and
 related extensions
Date: Mon, 24 May 2021 18:03:57 -0700
Message-Id: <20210525010358.152808-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+nsmRcgIbuP

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0e832b2649..1ab97e38e0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -648,8 +648,18 @@ static uint32_t get_elf_hwcap2(void)
     uint32_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1

