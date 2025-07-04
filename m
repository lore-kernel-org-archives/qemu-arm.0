Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1260896dyc;
        Fri, 4 Jul 2025 07:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2CnqcYDv7V52HfMISrha/FTrGw0qYL3ZTob3kVWsxtFfQsSMW7Rw/NlHrl6mze8xU/S93ynbDoYPLUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE1cKc7O/AwglhHUT/vcUAESwsmuqPAt4iU4ezL0KYC4//SKZLxPnS6DKYH26XbdThkXT4f
X-Received: by 2002:a05:6102:952:b0:4e5:a9b7:df with SMTP id ada2fe7eead31-4f2ee1d3ecfmr2173473137.13.1751640037662;
        Fri, 04 Jul 2025 07:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640037; cv=none;
        d=google.com; s=arc-20240605;
        b=B90C5ntofDGmo03k8WOeSaeVZNW529UXol0UrIHE2r9bvKOfoHPs/3RkbrY2YNQXJ4
         jHbd+dh8ITkCRiP7IhnxDMfqPCv5oO3vx93bqwTRFlS9ueNQdh4zkkYn5outlXOzQC6/
         /cqonDA3FBHjFyV/bFXLbldtIO4EuL76MM898aUYH0cO6+gwZdBKIXwQM4K0yAwamg0F
         NUjtdsS1bO4lzq7ecFKf4Mwu0xYEkaN31BZzs+LEs2cyAMh3fnusRs2ipelSZIp63Jsr
         r6g7ZLvUm91PeTdQkcqhWDiuYiQfZrewZfN/dBlZItbf5WDnuVi1K1Rmhn1BYL2649qm
         oMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NlTOBE4Jn2fkd9net09wcfWNBe1xruDmY2EOcz8YZIc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=RNpu7fcMBfT7Jp/PfHyWczuxaM0xcc+Uh9jktwWT7WhJzo2ZKz0hcR3qvlL0AEt9PY
         aQPEHBizIWdKHie+0OMeE+2hCdDsbxFWGzIepenS6qmjLYX32Lq4K9y1zBBZtkpDzGAN
         wK6Sfc1SDS0PB+qm6bSvy02m6dlQfzRKWpvQg8nCeijFej9A6cJO7zpeWaSjJARRdMHL
         zm1PlGv1SNJTOuZFteuhHuUaokX6f7tCxtFfqXym6BVHa/xKsvBLU65Tqi2ZJiyhd0rd
         cIOpeDXGzl89UzcdG+AuubSAB+jgSBH78ChVAE18TJnii5zzc7yBE4FZITmXYmRj8s+Z
         Ngyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxI7lAi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea4e89a7si668706137.60.2025.07.04.07.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxI7lAi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhOA-0000Up-99; Fri, 04 Jul 2025 10:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLs-00042Y-2Z
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:22 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLn-0007wZ-W4
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:18 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-611998766c0so545272eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639112; x=1752243912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlTOBE4Jn2fkd9net09wcfWNBe1xruDmY2EOcz8YZIc=;
 b=hxI7lAi0QAJRML5nQfJ21KiHb54pbfqkxdPFyhc/P/8K8cbuwqmP1gpdPAFch7E6Tb
 ftYwLBxQnwN0nWlfKieq06qRHkC463dJzb2twig6b4d9vO4D5eC8w+O6wy7P5tyLSf3f
 YpZvphJuOs/N6ZC1NyRfpj4AeOb3W6/HhLdEt3SRXR/MFIRIFjk4djM4FOgP5rmeuyuS
 jMmYsn0b3erSH+I3/ao+4j92nta/KHm1HfzvpAFYR4qqAismAO4yrDauJ6bKZg2aRSrF
 RUZj/0L14aHF40RiOzdWTWJo82w3tjDJvZLE7Q911eSTmCk+eeDNcRHLlrwSHGxfPMRT
 T5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639112; x=1752243912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlTOBE4Jn2fkd9net09wcfWNBe1xruDmY2EOcz8YZIc=;
 b=XvEYfnUWq2JE2ryJgwCvl9bvVeKXbwjv1qj9BeMFefKDSKO0Z6YADsRnWNIXzM+wKY
 eeIu6slHpV+1WdzDpNe/YO3ESEvgpNUPLmjOit8PrnunXcTcCdkcWBjEhzRN/T6o4w7m
 FPVfruiSQFPtlQwkm+SrOxvK92+iaTCpAd3SGn7leAUJML73uxUxmbgudo0LW8BZb4yg
 ZJ++D/EwEdrkfK1ax4e+WghSCCFnvs5s7V2wN1SCH/zMcZNvcZwhO57BomH89UGC9tfp
 tpMMkNGZRfQDYK075wzLGBaJUKIH56yDZTxirGTDyXVJjAR18xNUc2YWjqorBKX++h48
 QANw==
X-Gm-Message-State: AOJu0Ywu6zbSDk1N18kNGAIjALXNnTeX5HO8EXriBfJojQTOb6sIqcCl
 mhBIcxC/EdOAUIUY/gFtq/5er19fnW2csEUKVr1mYIjF8NPfyqKQ3vcVUzPRUtjXzZI=
X-Gm-Gg: ASbGncvmVdvM8bF6uBK9gG8Bw4g/vMRLSE6VaI68f+/RPSfbqpvcOYtXUQejZ3Xtkag
 HeddutIK1y8elZuHWSyruWE+bPOaH0BJTwogaJyAfocyxQ2BJzD5pQ1YeG6bm1J6PxMZLyVDNmo
 IQfQubgrFqHqZlpyflfDaXXLvylY1t7yVqiJuKYXBsEYyaCaqvs1S0AeCQ6GOTlE4orD/xk25JJ
 E9g6FYUncZauKCWBg60VTVN/dxJgN/Rrm22WvSp3UFGHYGCli9kPTTMBc0eTGTPBHy19NjK2CMS
 osehx/zXhBnfLh2vI9EKL7BDOsSOTKXvICFcl2HyRLsk+rpWRyZCynG54JnpYNkJ8LSB6TF/ycg
 ooTWZ/yeT4tr9dqG3APKs5NlP4Wa1zxCsgs0ZTunGSp+2yL5l
X-Received: by 2002:a05:6820:818f:b0:611:bdaa:5b01 with SMTP id
 006d021491bc7-6138fdb94c0mr2128064eaf.6.1751639112542; 
 Fri, 04 Jul 2025 07:25:12 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 054/108] target/arm: Implement SME2 FCVTZS, FCVTZU
Date: Fri,  4 Jul 2025 08:20:17 -0600
Message-ID: <20250704142112.1018902-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yn8NxbPj/9f5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 5 +++++
 target/arm/tcg/sme.decode      | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d6167eafe1..3bf2b6935f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1365,3 +1365,8 @@ TRANS_FEAT(FCVT_w, aa64_sme_f16f16, do_zz_fpst, a, 0,
            FPST_A64_F16, gen_helper_sme2_fcvt_w)
 TRANS_FEAT(FCVTL, aa64_sme_f16f16, do_zz_fpst, a, 0,
            FPST_A64_F16, gen_helper_sme2_fcvtl)
+
+TRANS_FEAT(FCVTZS, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_gvec_vcvt_rz_fs)
+TRANS_FEAT(FCVTZU, aa64_sme2, do_zz_fpst, a, 0,
+           FPST_A64, gen_helper_gvec_vcvt_rz_fu)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 5100ebaeba..79df2dcd2b 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -728,6 +728,10 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
                 &zz_n n=1 zn=%zn_ax2
 @zz_2x1         ........ ... ..... ...... zn:5  .....       \
                 &zz_n n=1 zd=%zd_ax2
+@zz_2x2         ........ ... ..... ...... .... . .....      \
+                &zz_n n=2 zd=%zd_ax2 zn=%zn_ax2
+@zz_4x4         ........ ... ..... ...... .... . .....      \
+                &zz_n n=4 zd=%zd_ax4 zn=%zn_ax4
 
 BFCVT           11000001 011 00000 111000 ....0 .....       @zz_1x2
 BFCVTN          11000001 011 00000 111000 ....1 .....       @zz_1x2
@@ -737,3 +741,8 @@ FCVTN           11000001 001 00000 111000 ....1 .....       @zz_1x2
 
 FCVT_w          11000001 101 00000 111000 ..... ....0       @zz_2x1
 FCVTL           11000001 101 00000 111000 ..... ....1       @zz_2x1
+
+FCVTZS          11000001 001 00001 111000 ....0 ....0       @zz_2x2
+FCVTZS          11000001 001 10001 111000 ...00 ...00       @zz_4x4
+FCVTZU          11000001 001 00001 111000 ....1 ....0       @zz_2x2
+FCVTZU          11000001 001 10001 111000 ...01 ...00       @zz_4x4
-- 
2.43.0

