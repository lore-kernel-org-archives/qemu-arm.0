Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1992902ejb;
        Fri, 24 May 2024 16:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVloWuhAypk36yeC0wbijEBNENqbOyFm74nyprHytbUQD4Gcc0FtdhSxniLAZRnId50FarsynZwhdvh6wQefE7EYAphXL7f
X-Google-Smtp-Source: AGHT+IGWHHj4/x++IMoVZKKplN9yHyWBNOQUro6dBFqtH4EWxawdXfHbyRfpZCKVsNaMiuA/9jPw
X-Received: by 2002:a05:620a:2fb:b0:794:9b38:2359 with SMTP id af79cd13be357-794ab0f42a0mr375686985a.56.1716592934948;
        Fri, 24 May 2024 16:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716592934; cv=none;
        d=google.com; s=arc-20160816;
        b=nY4JDuPrZpNUkyGnk2c6vwlWquDLtJvlGN2+QX7cq7KplSa74q+xg9Oz4uhEEIEEqu
         lxPrl/k8KR/ir3aDr7Sf7/3WOfhG2eAJd5knub13JCWkZjCTISjYcbnmQsQSyas0XdvG
         5YhDN2oe8IrrVu7FzgyQVHBHGZ31tv1paQyPdPh0Ja8pA6nxKSkx2UJ1mzqmFLTnjgwp
         TXFI/HcKXH/2iHYbcVevKAN4HLN4FKlD5xYmUH69NiejzfDqsPLJ4NhqQlkxCACb8KP8
         RorkSjQmTJiwcT8wwi8j8sbGRfq69RH1Lp+Kkdk3hK2htzm0m/+0Ja/haphvkGs5NlGt
         Parg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qjg0N9d1UiR78WeGkTTMqX2tHTL3eVpJWXsbVAhKPqc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gW9g5SkHI3CmtCzS8RVaHgRtdIOim1FxYIho7FnXNoMkcpcSMucOgLKGDrQLMQxyaQ
         AzPZA81DVGSm3pxbdToDyZTgI3CzL4jScdgZOVrtBmI6aSgpkyL+dJcYnJ9uuAx84CTN
         wpPE+NgSvJODzjeWl88OiE2CpAlsQKG/3ZPsJkj2CfJrUGHXx/stNzFw8DOEbarsCGBo
         kM4zfcf3qHE5R8y5pkzc81Ti+Z2g7QlDD6Ox7C4B2CE0DubHccHgtJBbmPE8waT4NN+V
         4Z5B7WnnEk/Wvw2ENl6XEKmPTqyCkMqBMQMIsf7llGJlkVkozJPDPrbiymsXNcVHEp0f
         C7xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEdndpfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcac3a2si310268985a.48.2024.05.24.16.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEdndpfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeE8-0006QW-LK; Fri, 24 May 2024 19:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE7-0006Os-DR
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:31 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE5-0005hm-78
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-681a4422f49so1049516a12.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592888; x=1717197688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qjg0N9d1UiR78WeGkTTMqX2tHTL3eVpJWXsbVAhKPqc=;
 b=vEdndpfNXdSLolIRiwW8rs8U2X0QWDjmrZADLvwF9Enr2yqjJPjZAvsQQdFsHqTzKE
 TwuT9k8LlXgM3J5CZwmow6muZmRGUObcqpOIjDb6oChFk0jI+KNnAD+vLTwyclxLLlbZ
 xehqMDjHZu25gabmslehW+Pn2kMtUt2zs3N9QRleCFQHYaO5DnT9Wx1j8mI6cSeHVvjt
 jKwIWRambVj0kgs/cHzZkunMdArxDV3Oyr/7ZzCSqF642ijIAUjILHPUcYYWbLr1cblK
 d2713FnamlChCuJDM2L22RZNGVMnaqrB3h29tEB21p2k7M1q5Y+rQowZnwqpMiIf+mW2
 klIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592888; x=1717197688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qjg0N9d1UiR78WeGkTTMqX2tHTL3eVpJWXsbVAhKPqc=;
 b=ZqZcSMykDvex68nXzXNk4/jaxbgC3YRBhupOoKQWWR2HIMJWG7Sm7ldwT4lj2iLN23
 bodihfA0rJt7ClXxiuJT5QkKAQ9HZ3cWQj2Cl0NJs0U7pTj3/ky8wov5RH8oF6eEvCfW
 5z10EIPlWSPLcF1j5CA2+ZNQcGwMBWl9hzjE++EP7BVuBh8H4/e66GowKqeYLduV1//s
 4hsG35PNtucudvIghw/WMuuQMLWiwUY7fm70nvE0bRKVOTJb/1/KAlV+tgFBDBB4abho
 Nqn9ufiDddGOjQacrfQLcWgK59Jj+KdmBCp0uUyh2gtytlk2psR4Gseq5Zo9Amz4unYd
 LnkA==
X-Gm-Message-State: AOJu0YwirI0gP/ttj5OONLt3Bsgf+Kf+Pbpk4AWN0caRSY8O6wE0HBsY
 BmfJ75dcLdXOhM0NTFq1Af7AA2jfShOkohkv1ApA49PO5UNkEbxHeBMPMEzDGF0=
X-Received: by 2002:a17:902:db11:b0:1f4:5c4b:dc6b with SMTP id
 d9443c01a7336-1f45c4be9d5mr24810025ad.47.1716592887707; 
 Fri, 24 May 2024 16:21:27 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/67] target/arm: Verify sz=0 for Advanced SIMD scalar
 pairwise (fp16)
Date: Fri, 24 May 2024 16:20:20 -0700
Message-Id: <20240524232121.284515-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RswDrZRDRU/9

All of these insns have "if sz == '1' then UNDEFINED" in their pseudocode.
Fixes a RISU miscompare for invalid insn 0x5ef0c87a.

Fixes: 5c36d89567c ("arm/translate-a64: add all FP16 ops in simd_scalar_pairwise")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5455ae3685..0bdddb8517 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8006,7 +8006,7 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
     case 0x2f: /* FMINP */
         /* FP op, size[0] is 32 or 64 bit*/
         if (!u) {
-            if (!dc_isar_feature(aa64_fp16, s)) {
+            if ((size & 1) || !dc_isar_feature(aa64_fp16, s)) {
                 unallocated_encoding(s);
                 return;
             } else {
-- 
2.34.1

