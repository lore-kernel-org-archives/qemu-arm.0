Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3790708dye;
        Wed, 2 Jul 2025 05:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfsbCrN1hJgHjjgPfia3O9DsfUWOkYfoyO0xwhE4tdcV355hJD1Z8HgFmO4yl/BcOl1/eAViCCYB02vw==@linaro.org
X-Google-Smtp-Source: AGHT+IFKdinITkhGiOxljIlAncaVUc8NpcLLHPuj+/HGO7a8CBhQOfqX/w7QmDxX26zWW/Pxd/Rd
X-Received: by 2002:a05:622a:24b:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a977be8537mr34215591cf.10.1751461128449;
        Wed, 02 Jul 2025 05:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461128; cv=none;
        d=google.com; s=arc-20240605;
        b=g3TPavp6tcQPXjbbMPQs//Hn22JD2AQJr2IilYWB2U/ww/PXuwzn4IzUhTi9jb8vsP
         1IMNcfMDsT1wq5RDk8uHncIgR/oxr58351KjpA2D7zEt0x1HvJQ+yZDVb04oTHTvill2
         htehc7vM0EMiJrThoVFrVjtjgLcqiQ8S+qH3PzYTbPEi3F4RTIpJq2MTGElnofmnNDQm
         qnMWt/qf4hDkZdJkbZK4vmS76ZMs68gmfivYLCPDPy3ARmft7pjuz5w7nameN5zq7N9k
         Fc/VuccXW4wteRK0e41lSzUA9B8vVoHPlC+11p9Aii7/+WJnVRp01AD+JjCSxLAUSKyq
         1G5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/DEQdyNP6+V8W5v9opY6SW/J7gt2DGI2TGAWbnN7DE4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Zr1ra2QlpbJF4/3B0lYdnPaHhX+pkJD1ViNU+7K0MxjoAdpBetFiLQ5BEQ1q9x0ziS
         s86eAod74u5etkXHvBRPqhzMF0gxGChKudSyKF64DDTEll3ACSc7TaF+T2LBA6cvxpyX
         asPk68t/jn5YykFNUVOoWhlg+Sc4xrjfGpYIZ4nzHhHflPnFFBWnjopSwsOGbSVFTwyZ
         dKkG4QaXIjz/6Ot0zxwXMjR0I/YbsR0ch8b5Ke3j1kGjVFrrX7h6AmkuirMi0+96Ltju
         qlaNIQ8QZt1dcmfv6dpp1J2hztsJPnLKd/VU5DS4kLo8Do+wUP8vih9QbLQiNJzWhAAu
         Puwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7rGONM3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a97df2c1d5si8840291cf.621.2025.07.02.05.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7rGONM3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWwxF-0003r2-1u; Wed, 02 Jul 2025 08:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwnF-0000A1-KP
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:42:32 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn0-0003Bp-Uq
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:42:28 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-60d666804ebso3958824eaf.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460130; x=1752064930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/DEQdyNP6+V8W5v9opY6SW/J7gt2DGI2TGAWbnN7DE4=;
 b=s7rGONM3UZ2RXMaXdlCoSmQV0+nPR+J8jeCc3hKcPYZmMJXv9lQ839Y6IaewHFM/bl
 fT8SrUF0EpVUORJBmkS8Q+snaYeRSIXAl00zmPtD+dNG5AKG9wXKo6nx/KIhACGBMV0X
 LASWSN3W+3XnsieSySjkpNAkLli8OAjfdUm37UdM4VzdQ+TV08c9vlQlQjKox6ZkushK
 mcl5thxYtPuflPmAcht2NFWbh8F/TjvBfONKXNooqQDDCxbtFqcubblJmCOFLJjn8IyJ
 CcgWnUh3r0sr+h3NuaEyKELS8w+uTsDJpf4jwxIapnhc08RWq7mzeCXkcz/bmKWGVHt5
 qFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460130; x=1752064930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DEQdyNP6+V8W5v9opY6SW/J7gt2DGI2TGAWbnN7DE4=;
 b=C+GhNMr1Diwyy2Ah2HM6pXl+hFaN9yZjslIhQijcLCtYovdY72/4OpaV0jYsrx5DAj
 J2LSHQvl4/Iaq8nykr2qWLEsgW6Rfpt8s5YkfGeeRC7hcqrUAFkojdv2Jt8qpaAcQEjC
 1lc1PwQIZgm9GlK1m3SFZZ2C1UiuZW9RQYhU4LDMWcZ3TjjuadwFP2vOB+bBByj//9Yg
 AZsJXBTQUDAcIt0LeuaysTagDCsRbDEP4IW19tA542fLgh5oyYEa7a7Pn78tBfS+i+XD
 JxHkyXxA3B2yioIVBK7I5bnImctdVwLzx3gLV3luZYtyIHD+BCagkw+wRAO4go8/aJBa
 b66Q==
X-Gm-Message-State: AOJu0YwmTf2TMv2khnqVuQEACbK1vkV6uyM8k0qUL8PKkt7PwiPptLt+
 pIExZ01WBwKs+46ZgDPGUUH84uTMByQpnmaeMpecpj6euj8gYgIVgkbMwi5sI+o9WIWfgr/ktNq
 6idYQutc=
X-Gm-Gg: ASbGncvtQfWHuCwNTOivCZ12sSsvN+71VV59pLLnq4TCo5slqQx1TzF4IXozS5E+sQ7
 f16t2z2Dol2sE9wVJ6AeEkwKL+eVL9l5fFBnC6jmy0QU9XX9WEzM+rGobA9b5kgh79f9QRD76CQ
 IP9eQo7sF3KHpMugUnDZ3JEwBNyCt38SUJDv63fpFXxi1FQtV4NB7d0EuTnZHa2nXdrvjY3MTHw
 cmreJnqt8HtTOBlA8pExoeKAh+n+CUAqBF2gv/neG7C4RId1jP8almocuMhuf/UgB9e4P75zoah
 5+afEY2yMNWL+8rdLf9ZKTcxn23pNQ3OXUxvgbdIQAvYQagv+OdIyEjHGK76nhA+bRG3cg==
X-Received: by 2002:a05:6871:4409:b0:2e9:925b:206f with SMTP id
 586e51a60fabf-2f6649c53cemr1662568fac.17.1751460130453; 
 Wed, 02 Jul 2025 05:42:10 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:42:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 90/97] target/arm: Rename FMOPA_h to FMOPA_w_h
Date: Wed,  2 Jul 2025 06:34:03 -0600
Message-ID: <20250702123410.761208-91-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8B2VBdVkgj0v

From: Peter Maydell <peter.maydell@linaro.org>

The pattern we currently have as FMOPA_h is the "widening" insn
that takes fp16 inputs and produces single-precision outputs.
This is unlike FMOPA_s and FMOPA_d, which are non-widening
produce outputs the same size as their inputs.

SME2 introduces a non-widening fp16 FMOPA operation; rename
FMOPA_h to FMOPA_w_h (for 'widening'), so we can use FMOPA_h
for the non-widening version, giving it a name in line with
the other non-widening ops FMOPA_s and FMOPA_d.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 2 +-
 target/arm/tcg/sme_helper.c    | 4 ++--
 target/arm/tcg/translate-sme.c | 4 ++--
 target/arm/tcg/sme.decode      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index c9961d6b7f..67d620e456 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -135,7 +135,7 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+DEF_HELPER_FLAGS_7(sme_fmopa_w_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index bcaa67b0fd..00ff4b4c15 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1139,8 +1139,8 @@ static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
     return float32_add(sum, t32, s_std);
 }
 
-void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
-                         void *vpm, CPUARMState *env, uint32_t desc)
+void HELPER(sme_fmopa_w_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                           void *vpm, CPUARMState *env, uint32_t desc)
 {
     intptr_t row, col, oprsz = simd_maxsz(desc);
     uint32_t neg = simd_data(desc) * 0x80008000u;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d38b8a5ca2..1167aa4964 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -565,8 +565,8 @@ static bool do_outprod_env(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
-TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_env, a,
-           MO_32, gen_helper_sme_fmopa_h)
+TRANS_FEAT(FMOPA_w_h, aa64_sme, do_outprod_env, a,
+           MO_32, gen_helper_sme_fmopa_w_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a,
            MO_32, FPST_ZA, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 5a5b8ff8a5..77744eef4f 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -190,7 +190,7 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
-FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_w_h       10000001 101 ..... ... ... ..... . 00 ..        @op_32
 
 SMOPA_s         1010000 0 10 0 ..... ... ... ..... . 00 ..      @op_32
 SUMOPA_s        1010000 0 10 1 ..... ... ... ..... . 00 ..      @op_32
-- 
2.43.0

