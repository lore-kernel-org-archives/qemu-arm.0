Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1273127ejc;
        Sun, 5 May 2024 18:14:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxXx8vIWA0NcpBTs2/gHsDA3j/2cwLXKI0fmbv/Oe00DDVU37BG7vRP4NS3AGB2CiCzVkkJVd5Yt3Z7AyDSIQlj7pB1rgu
X-Google-Smtp-Source: AGHT+IHyr/IxekwdYUmv7APtl3eFYWqrMX/CeuO5i8/g7r+4ocvuL9QMoHd1h2Q+wUBwIlvP2sZp
X-Received: by 2002:a05:622a:5b0f:b0:43a:ed0c:2a0 with SMTP id ea15-20020a05622a5b0f00b0043aed0c02a0mr9765167qtb.65.1714958099119;
        Sun, 05 May 2024 18:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958099; cv=none;
        d=google.com; s=arc-20160816;
        b=rcxsk2IPTulZGXt2gT60d9hMV4WJSNUDLCS82lLre6bIsHs5PwaUt0RLGuorOmBeq+
         HxbXf0UllmR7On0FOIls86S7RvEgERKAFvHkP2QP6hObx+U1JEJAtsCHTsITBHZf2mkZ
         2pRHyPPYZIwCFJhqHW3YpNyXIncCmvtAiHbfh26HOAVDeFZ0wlpjAgpekTpT5P1QmMZF
         8k+FSrqsetbMZdhxj7kzXhmrcAgjbazahQYv+dU2KthqVniqoB9tDezw5GJgFPapKfvD
         5iInUmiJ4VDOOuhpp3hDDFvzbnvLwDSZckrC5ZkfafH99d1qrCAOsW9uWM9CtVaT/ztC
         fPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UP8W08jGkabjOFnDqgYkqKZsFFwz0sFiQIo8Kb1nNMs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=0W8BYzrIrPf2XArruCrXxxW26IINcDZelNak6VPtjH0436IO3A3CuqAhWpDug3054U
         eq2rlz64Yq2goh5Z66xBbDjiS/w2teRDttOyUqstxiSxg70LBm0NrTea09zN3JAKk5fl
         TrOEAlJKRgwcwwYaxRHo5zBdgvZJBHBAEeBAdJMNGE7ArielMVgn8O7jeRQyGcRYwQhU
         kxswhRncGPl7B9AMdq6+xhnOiLBIsiwTJzP5nHLl6Anf5tW5S9kKilsylGojBVhMqI8d
         spprK5u2YzHyPCL/y3tDTz5EywT2W9/uhJKeCMtcah5n6tAaYYiNmJv6mpph5qJ1+FhA
         f8yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yObNugZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05622a164d00b0043cb229801asi8619841qtj.181.2024.05.05.18.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yObNugZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mnQ-0001Cy-PE; Sun, 05 May 2024 21:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmr-0008LD-9l
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:01 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmL-0002W4-2N
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:01 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5d81b08d6f2so1212203a12.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957468; x=1715562268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UP8W08jGkabjOFnDqgYkqKZsFFwz0sFiQIo8Kb1nNMs=;
 b=yObNugZe8tccZv+byBrMRVK32QIlE5yeLSlw88oLu0kQuTIJk8X24XHySV6pQsOvw5
 9KXvO0Q1sR4ta826rmJlKeIXFpTU6YbeYvMW6y4vxRUW05gkOPqsL8G0pZW4202AGSPD
 fiLJ3vH+j/qJYCunaKs0ViVy/m3T7At1ZA8NBsx47s9Fk89he/NOxuUpf0MGaLfNy36x
 HjU4ksE5ItkQfH0T14BgC7pSxWggjtDPEn8XeESSt+TjM+AtmneyvobPTrVmuAizrMpU
 zD1S1HY2JfiJLZAQ3nj9SQqa6T/RD2sS4Te626YHHRqyOGLEYhH8txBwfbmjV64zXcKG
 s9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957468; x=1715562268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UP8W08jGkabjOFnDqgYkqKZsFFwz0sFiQIo8Kb1nNMs=;
 b=Jc6zR73e1z8J8MD0sG2vWBKTjW5nyoJgm6JHifxiwguVC0FcSMEVnOMAAgdxB1KO7i
 9Pc3aeGcsDBtzgWHyCYGAI6cSsQTk59InPPR6/WmlbhMo4LLg80NeTO1NHnuEtNUIhs3
 DmmA5uPUY8Y4lyEaVrMt0iSBcuUCbuSU2z0BSnVeUJzkuIagEC1h1tQA4c/ANly6ZnMW
 f49FOWZwrOn4ckdJ7vk14Tpxz/s2Pq0yfOZbslx4JrNNNST3FCJi8iduP9ECwL+jR+X2
 EOUqKPnU+gF0QFL6Krh7wp/J1MxeBPy1G9Z7A2/ZxtstXzLHjugbBL/nUM33PRd9ScE3
 domA==
X-Gm-Message-State: AOJu0YySNS+jhpPYqt/Uw9gMwdOkrsSo7Peg4AzCdhUiCebJfU1k3NiZ
 HAvpxo93EB4uGgDJ8IwmXMGBNonEaTH1CeooFoHauUcKDtH+O91Tom2llttq/rw=
X-Received: by 2002:a05:6a20:4328:b0:1a9:8152:5102 with SMTP id
 h40-20020a056a20432800b001a981525102mr12628161pzk.24.1714957467736; 
 Sun, 05 May 2024 18:04:27 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/57] target/arm: Use gvec for neon pmax, pmin
Date: Sun,  5 May 2024 18:03:33 -0700
Message-Id: <20240506010403.6204-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: /YSKmvAgJDf/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-neon.c | 78 ++-------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 6c5a7a98e1..18b048611b 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -831,6 +831,10 @@ DO_3SAME_NO_SZ_3(VABA_S, gen_gvec_saba)
 DO_3SAME_NO_SZ_3(VABD_U, gen_gvec_uabd)
 DO_3SAME_NO_SZ_3(VABA_U, gen_gvec_uaba)
 DO_3SAME_NO_SZ_3(VPADD, gen_gvec_addp)
+DO_3SAME_NO_SZ_3(VPMAX_S, gen_gvec_smaxp)
+DO_3SAME_NO_SZ_3(VPMIN_S, gen_gvec_sminp)
+DO_3SAME_NO_SZ_3(VPMAX_U, gen_gvec_umaxp)
+DO_3SAME_NO_SZ_3(VPMIN_U, gen_gvec_uminp)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -1003,80 +1007,6 @@ DO_3SAME_32_ENV(VQSHL_U, qshl_u)
 DO_3SAME_32_ENV(VQRSHL_S, qrshl_s)
 DO_3SAME_32_ENV(VQRSHL_U, qrshl_u)
 
-static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
-{
-    /* Operations handled pairwise 32 bits at a time */
-    TCGv_i32 tmp, tmp2, tmp3;
-
-    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
-    }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if (a->size == 3) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    assert(a->q == 0); /* enforced by decode patterns */
-
-    /*
-     * Note that we have to be careful not to clobber the source operands
-     * in the "vm == vd" case by storing the result of the first pass too
-     * early. Since Q is 0 there are always just two passes, so instead
-     * of a complicated loop over each pass we just unroll.
-     */
-    tmp = tcg_temp_new_i32();
-    tmp2 = tcg_temp_new_i32();
-    tmp3 = tcg_temp_new_i32();
-
-    read_neon_element32(tmp, a->vn, 0, MO_32);
-    read_neon_element32(tmp2, a->vn, 1, MO_32);
-    fn(tmp, tmp, tmp2);
-
-    read_neon_element32(tmp3, a->vm, 0, MO_32);
-    read_neon_element32(tmp2, a->vm, 1, MO_32);
-    fn(tmp3, tmp3, tmp2);
-
-    write_neon_element32(tmp, a->vd, 0, MO_32);
-    write_neon_element32(tmp3, a->vd, 1, MO_32);
-
-    return true;
-}
-
-#define DO_3SAME_PAIR(INSN, func)                                       \
-    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
-    {                                                                   \
-        static NeonGenTwoOpFn * const fns[] = {                         \
-            gen_helper_neon_##func##8,                                  \
-            gen_helper_neon_##func##16,                                 \
-            gen_helper_neon_##func##32,                                 \
-        };                                                              \
-        if (a->size > 2) {                                              \
-            return false;                                               \
-        }                                                               \
-        return do_3same_pair(s, a, fns[a->size]);                       \
-    }
-
-/* 32-bit pairwise ops end up the same as the elementwise versions.  */
-#define gen_helper_neon_pmax_s32  tcg_gen_smax_i32
-#define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
-#define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
-#define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
-
-DO_3SAME_PAIR(VPMAX_S, pmax_s)
-DO_3SAME_PAIR(VPMIN_S, pmin_s)
-DO_3SAME_PAIR(VPMAX_U, pmax_u)
-DO_3SAME_PAIR(VPMIN_U, pmin_u)
-
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
     WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
-- 
2.34.1

