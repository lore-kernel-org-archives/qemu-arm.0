Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1256158dyc;
        Fri, 4 Jul 2025 07:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgfzYhecDuQE/DQquhgZ/BwEqMrYNJpyqspI2mY/89DBTIWaLRD4IcAPd0Q4j7RfaYyWrMO8rm87TACw==@linaro.org
X-Google-Smtp-Source: AGHT+IHHS8HiuSyzXbSfr6OcVmSbRckYZ9dItaI41nQaIzrHD2/EtturrbQlhFQ1xDIoA83KvLzK
X-Received: by 2002:a05:620a:2987:b0:7d4:635f:3e3a with SMTP id af79cd13be357-7d5ddae44c1mr298097185a.19.1751639563166;
        Fri, 04 Jul 2025 07:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639563; cv=none;
        d=google.com; s=arc-20240605;
        b=cE+IWjjH9LW20DTwkAN0wO9+HaiMXS0gmfHf/vWHBnAlphyVQS/y7UguikJhZfbCAN
         ZVVCiAKf6yXjAPmfeFAyHe/BhIHjwREBlRBQTxd4jib0yUw3fjQeGme0y3UNFxdg6qzv
         F6RAJIZDF6JfmeTHnmCWIFaCmxnZCGwtZUt7rXMcnkAO8GyskZdsgEtCSqGz0DnyxEq0
         3VUq077O+hrXvgRQnCmS52AVy4PKqSQLa0ee+kYsZ8wAMD/r5/KLSK+l5UZ7s1yx7Ng2
         sF3UlAkIflW85t3n+qwKEAmu/RhHZ5R+4ViuliKyNCKfbQ0OK28A+S2bUEV0Imphvh3t
         dF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VmkPVB1raZaAazvEIlQJhAAcR4Wu9MbnTOBPTi5jEm8=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=apcU3UPiPTKf5WTfcO7TkjCTRha4zjusD+yO2pzmRDYRFpWKA5P68V73AlDCVm2bHi
         /ojuFaDNnh9k6Vx+BRLn2Xi563acMQMcMMHp9lXadbiw7Yyit05pxDPyBGYvKi4lHxOi
         IMgdrssZK1fQCMyGPW4908HqY3f83ATrKkOXhqVSNYxsUcHJLouA8v5HkCZK9JVAM4Ie
         XkJB+W05NcTOOvPYQjqV1cyHu57wCWyXCHaYODCm0atl5KvQiZ+DceffZzGCbSzGTX0B
         j5Ew7re16rcUWOM2KOXRmvArwqUl0eYvY1mIfOY7cz+B5BNTC0flc9XVrjCxwkNE59dU
         8q3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXLKokaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbee30e6si225763885a.480.2025.07.04.07.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXLKokaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhR5-0005ba-NX; Fri, 04 Jul 2025 10:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM4-0004Uq-0c
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:34 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLz-000861-DA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:31 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6138ed92ba4so221004eaf.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639126; x=1752243926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmkPVB1raZaAazvEIlQJhAAcR4Wu9MbnTOBPTi5jEm8=;
 b=GXLKokaKt6X6kIIk4xuws5zZ954ZCmVseYXcsjCoNp1+f7Gsm5/aGCoXM4YUr3Ywtg
 3fTmDRAyRiVKAIKLsfnfsBjA/fAzKtkUHl5DMkmhhfRv+LkP+XO16frB7mjTD6fwxS5t
 090KQb30PbUrep/30K6UGJUnw7yijuNIMvlls2ICIuAw8YZN1WToRV5GDi3NJZC+PQAW
 ByqCdAUTxxO6Z6V6NCBvHy2baFCBbwYU+7DM26iF1wknkAs2IUNkSmlv+ydqcB1TD+s5
 IuYBBydRgNoKOgNL6RqC23OsAEMSKZPM9pnCrN1kOFu6+5TBthNgHDPwzLfnMC4Yxotf
 swEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639126; x=1752243926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmkPVB1raZaAazvEIlQJhAAcR4Wu9MbnTOBPTi5jEm8=;
 b=agNVBuwXOy2vFGmux7fbSakuWJZa9uXCSm1ta3Kuz2fspQW/EQayHr34t6MYSd7uJZ
 yQHcRi0jrAAskw+q/UEPCG5nRoNcWI8odFxLYZER5fX3BofRmzRrzg/U2NA1ZzeAWdjQ
 fjmNd6JX78WbpNzWf1BSPmbJK3haQHIYT/xmtf4rt+30yU+jZ/3HOg8+OlP+Mb1KgpgN
 xuQEB5Vwmn37Fb7CdW+SLBXm3ydD1GBOJS8g47ZhteIgPbhbZcVV5VQdVMoh8bQsPch4
 YR3VIhcV1+lrxLV4Yh6JtBHp3i9fK2V7WCZiCFfhfk+U/7Gjjaq6CSK3Skpl3iudKlH9
 //XA==
X-Gm-Message-State: AOJu0Yz+ebpdHZAHkjBpCDwKgsAW1AwAdtpr1jz0vTeq40voCNkUj9Di
 HagQKcfozL4KQOXBhM1aEYqghQIJJhYT6i1ncWT5SNtQvuuKl1J7VDwLSWQ1gn/DxCQ=
X-Gm-Gg: ASbGncvg9yoxsz3NzCAMMmwGcsfCSXkJmXOTZH71SrWnfqnxOVc6Q0x0MO6w046tSEI
 9YtnU/1gw38NzWmcAH4hvrbbNUmnBwUIzWpiAuRZJsyyZ+JCrA58SaOTiX+KogrvdthC0dCQ8BB
 hJRlSQiIUFKl9PRTuDMcUZh1OvjsHPnGGVgeE1kdrjHwz9Tqa7j6xcg2DddqCjdVCK9GKMo6SiK
 VqN0dBR9biNDX6E5BlNnQIKwfXBUAJRmiivEysDBxtAN7jwlgtKlpNnfawzjOig/YIO4Vx/l7SG
 ihrhaCl5InkYqzSZj0YZKsp/0vWQSZFUOwEj7L/y0tR0oBtV8sKLW7aSo9ftY0vJVjuCO/x3CDE
 4L5hGlApBvJLOWhX7lXBu3vnijTQiWYICnrAphWRvTkzkbsgx
X-Received: by 2002:a05:6820:f0c:b0:60d:63fe:2472 with SMTP id
 006d021491bc7-6138ff9d991mr2057287eaf.1.1751639125449; 
 Fri, 04 Jul 2025 07:25:25 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 067/108] target/arm: Enable SCLAMP, UCLAMP for SVE2p1
Date: Fri,  4 Jul 2025 08:20:30 -0600
Message-ID: <20250704142112.1018902-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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
X-TUID: m647uUGuBI1k

These instructions are present in both SME(1) and SVE2.1 extensions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ac4dc7db46..ff70bf27b0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7375,7 +7375,7 @@ static void gen_sclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
 }
 
-TRANS_FEAT(SCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_sclamp, a)
+TRANS_FEAT(SCLAMP, aa64_sme_or_sve2p1, gen_gvec_fn_arg_zzzz, gen_sclamp, a)
 
 static void gen_uclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
 {
@@ -7426,7 +7426,7 @@ static void gen_uclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
 }
 
-TRANS_FEAT(UCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
+TRANS_FEAT(UCLAMP, aa64_sme_or_sve2p1, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
 
 TRANS_FEAT(SQCVTN_sh, aa64_sme2_or_sve2p1, gen_gvec_ool_zz,
            gen_helper_sme2_sqcvtn_sh, a->rd, a->rn, 0)
-- 
2.43.0

