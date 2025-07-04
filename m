Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1269383dyc;
        Fri, 4 Jul 2025 07:56:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMSSqZB9gI9np6aUf3wDf+nWFpbXTfsjdltawxdwT1h7/AGBxhFRuQLBFgTS5mlygftcvmyxs13QY++w==@linaro.org
X-Google-Smtp-Source: AGHT+IEq1DukTjfR26SBGM0+ZJGdho2X326ywMf4YLD+2WadbiIb7xyDmxo/RfLlwFAenADgMA3q
X-Received: by 2002:a05:620a:4491:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d5ddb33324mr369111885a.2.1751641008859;
        Fri, 04 Jul 2025 07:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751641008; cv=none;
        d=google.com; s=arc-20240605;
        b=aO+7kC2RyQQku0YLO4ei9FeOEic+dxhwUFapkOW7rxWvKsfbHbgeNTmq1shtQ+kcFs
         +PIevQt1iBgd1vOK5MKQL04F9oDVCoEnxpjAJtesa3j49gqwjSjrCs1KwlgE+BZPkHzg
         6VYNRSVpJY4syIjqgHnXOJ06eezMdJgTkMB7Lpnb2uc5wkSY02prV6zsvl1ExX2aM5wO
         uaVueyD1Vrbu0Wmdv3wDM6QLYDBU4HMj6HUrEW9C344wCs2sqNSjQogRxwQvJn/oVumf
         tbC2QoER549+G5oYaacyiu++rczBISLjqcQjYXid7SN8jhvoUAjxAUsuZwWsSF4aywRv
         dyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sorSqm7J6SLZ7V/7UMO5+5Rzi28tdsa7Du0nld/DrRI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=H6tF2yTa1bC4mo7SVyfgpMfgfp68kSEyg+ORx/e8MVCu3MnFvwSsh6FO5oOc5Xn/8j
         r+OivOdeqNMk+gCu+KWwVc8S8FM3PuWlfLQIarwej6hIGavQUKzgtlVrDrq9dLzFcmtV
         halssoQrLEmtR/Nmwsx+VaV9mmoF4EboiQ69HAJg0McoCRUVlEHSf+9KnWdC+w68OONo
         FwCUeZjg4o0OzwgzEnm1wCzdHl5xFi0R/ESirnPgbkSCLCZmJVlwNXLIKS+GmOWNQcpV
         UrFGECUrJHADpEZVyxalOzoXIdnhPbDK2YS7AFhxhJM+wb1J5iNEYULOS+/79n/7YhIm
         SP7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KN3aJTl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbef711csi209030685a.545.2025.07.04.07.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KN3aJTl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhSV-0007cd-Kd; Fri, 04 Jul 2025 10:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhMD-0004pQ-D3
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:46 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM8-0008D3-20
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:40 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-60efc773b5fso663045eaf.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639134; x=1752243934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sorSqm7J6SLZ7V/7UMO5+5Rzi28tdsa7Du0nld/DrRI=;
 b=KN3aJTl4s0nZSXjMcuRVgEI2gG6nW6NGgDMEHcf/zLz65J0GiETA6KBZG8EBulE00g
 aIjGdCbPH58Y2mK8euEDZqwzx7citwF7ejAXyBTaSzyYmlOsIQWXT5jmUcnSl1oN4vjn
 8NPJFsNsiVPU1zaySl6aLxCZ1HkAEithheA1L72AxGYKT07Twy7tgDdE65vJKEbvKWM2
 0eWxVc6CJmLHeMr2BH2yk78D4Zo766sR3ZWj2itHnqH+lBZvGRWNotYSHP31I2mLuaeD
 WQIhT20agkHuiT3ySxiRZ+jpJ00DnGtung+Lo7VuOVEvcYHeMPpuAbPZ3mwCCSpoNSKZ
 GZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639134; x=1752243934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sorSqm7J6SLZ7V/7UMO5+5Rzi28tdsa7Du0nld/DrRI=;
 b=oUN2n/I8BlY0XAaDzmOwlSQKk1Gecz1nn2Lg40tZ/T2sVlAl1BNYMuZXJF7a0M4B7b
 O3+vrlj87S6HW9m2WANcTQK6JPYEEsrbI7oT3/S2LvOWmgaF+eDmgbMCpTO476+dtGVs
 tWUL1d7IevHAqF9YQ7X8cHB0Z1UEM7Ztv0PSQVkdJVTRQNCxr4539k2CxUrr6Z6A8RG9
 4JGnygRX9M0Mas9t9llHf/6z6demXMT6Ikgs02n4UDMLaR4CIEszolLhqsbWYT0e1Jsz
 RuIRl79Rmu/KCjdBB3cI2W0v7ArtEKiY/sLYA6zplCZ9lTAXm9kFe8kjDJC5Pno61JQn
 cnvw==
X-Gm-Message-State: AOJu0Yy+LZnYPIoOawb0qNe4xpcY3qBAO45UCp5/3gKgDM8TIbEToeJu
 AbGpFP279R7Fzp/SDm//Wqud5a/pSXEctwfuSWFl2E5Lrls197DSQUivp3d4De87BKSui+KNQly
 E0TvhKDc=
X-Gm-Gg: ASbGnctrXQhF4zzV4MuvhxOHV8bjEk63QfcYWOOe24kz1FuB0j6fB2M41lGfUrzEMce
 Uo671qpmfJrHHz/tY1VxvdM5wNAfwKAxiuPdlOfJFZ3iak3McoDBhNEEuesEixvpvlVgKTgREzh
 MQGS1Af3BIvfnwmdc3LAl79FTVTxRlNNC5ijswRf2C6CDW3VzXnMOU1NU2G+jZdkzViLLVUrKln
 nxB9oLiPsZV6H+8Vx8kAu1KI2E6YpCGfbRP9eXnytEX1Yr9OYun78QgpS35BVoRwr6TRx1ACFsh
 lR0EUdu8wces9xEtgsaiam96cMhTVtaN/7TIiUm5EDoJQO98B7GhF2EH1FvAfOj9EB9PG0MkrjV
 z7QRceEvRC9dTqt503lIQEKdrk6GZR99/jaAPa+OsjPE6AokP
X-Received: by 2002:a05:6820:907:b0:611:ffa0:3863 with SMTP id
 006d021491bc7-61390056a60mr2126308eaf.3.1751639134363; 
 Fri, 04 Jul 2025 07:25:34 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 077/108] target/arm: Enable PSEL for SVE2p1
Date: Fri,  4 Jul 2025 08:20:40 -0600
Message-ID: <20250704142112.1018902-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
X-TUID: DFPr6A0cwE2q

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
This instruction is present in both SME(1) and SVE2.1 extensions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 62d3e2efd6..cb60b533e9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7273,7 +7273,7 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     TCGv_i64 tmp, didx, dbit;
     TCGv_ptr ptr;
 
-    if (!dc_isar_feature(aa64_sme, s)) {
+    if (!dc_isar_feature(aa64_sme_or_sve2p1, s)) {
         return false;
     }
     if (!sve_access_check(s)) {
-- 
2.43.0

