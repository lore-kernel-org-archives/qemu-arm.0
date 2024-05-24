Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993406ejb;
        Fri, 24 May 2024 16:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3CC8ELp/Qb0GuAGhaY4WGRqKUEsaTYhilD5LKSLeXCnGlBLF3xdeMGL1PTVqcpmUdM8/J3ojmbKKcl4NhyNAM7I3F0mG6
X-Google-Smtp-Source: AGHT+IGbfpjMFmR6+79VHPYXPHd10rSAeAgF5jsH1vpP+3IlPqk35A+kGprwlLXz6nGVsPUu6eCB
X-Received: by 2002:a05:6871:338f:b0:245:3809:7038 with SMTP id 586e51a60fabf-24ca1472dc3mr3709502fac.52.1716593035550;
        Fri, 24 May 2024 16:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593035; cv=none;
        d=google.com; s=arc-20160816;
        b=SwyuMoiB+/E7UPgVLkpzxBdCzFCx0205O2t1g6oYQkhE2L/feQpQWSUgWiTCtYUiBT
         /5f1H4TWpcrWX0ZQsvyb+I0C666TEeO7xG0v2YB8mcg8pmzGk0Zh0ApOtkUkslL0ARrs
         Bd5aQHNK6sIwAkzFElBbbUwtlDqOxYDRcST6ubPdHogF9NTwWejt9vyr8XbNv2DMhqYQ
         kV1ZKQsyZy6fOCRcrXn29uFgu00o/PQBPG8PRbWoTwxNQAGrQSsWd86+Jsei7hVYvEtE
         38QY8hGUpiyV1vYaHg0WMwBf5kLgCKqr82C/JeMO3dpjNvR8nFp6zsKDckxNQR0OWFU3
         /ZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z+tXvY1ceN292X4zMeCgBDzx+CgSby56X2Qdm2MgXZU=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=hTf5+97VjVRZiX8HDUutKBabwjEuY9sWClxTH8mQKOvmk1Zw0agtZAxxkS4VaUFR3c
         o6URroK0LnLZmAalQFG5mwNWuGVYUtg2VKecagVerbDkC6SQHPRILDFq9TAlrAW0q60A
         AzShFOnY/oRuI8x25aCi0X8GWr6SFU2zsBFh0UtgAT45NXQzygLyMs8mQRW5Dfsum4B/
         PwEcrHFVIQCjx/Bzv4pBNXoxlZX24XsfhBQYGUvwCwRZaNuvvTRJjSiBz1O7xoFytWTF
         +F+t7YNvp93Zn9m4y2Nrrxc8k31xwmr9D4+rPKvY5VXcBDwXkZy9MWkqq15Lk6POoDXR
         o1nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN0sNJ8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18ed709si33611001cf.804.2024.05.24.16.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN0sNJ8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEg-0006ua-T9; Fri, 24 May 2024 19:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEc-0006p3-Aw
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:02 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEU-0005tx-A6
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f44b5ba445so12730025ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592913; x=1717197713; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+tXvY1ceN292X4zMeCgBDzx+CgSby56X2Qdm2MgXZU=;
 b=zN0sNJ8SFJeOS3o4/EvAENtlKnix/SQftn7oNkA/U6Zfdm4PPV/SS3nC/3enB8Grs/
 kulcnxkhnPciKmMzJvSZOnaT8l2RQXgBlwhZH/DsbrxyT0wOqZA697bPBBz4l1HYk43q
 vzDxbHqGqDN6rsD9lhgSZ/qIv2k+Co9HcH4YD4E79grHiDmsaUeDqdmRzswglxx00b3O
 DedoMuo9S+wnacHzP8rFbToBIRnufvq7Ta28FGzd7dbT2qFo+zWrzoIGEUfg/dDoJ6Lm
 QHFLt3KZRtbi285BpfVSnzCz/VSg+DG6/wRLz0PfPzB3cHjmR4X+rH1eF3tSit6Pwdv9
 xttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592913; x=1717197713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+tXvY1ceN292X4zMeCgBDzx+CgSby56X2Qdm2MgXZU=;
 b=P/HqrAPjnerlHU4JFrtkWKdvDhzWcwaJAIU5Wi6LPwEdgOUhhGS0FRx6d4r0E5IH/m
 dxvR7MhOiAUPRk1Xy3sX5HJgSNy5KmpxphQWXLEaPuAz0DbYV+ypAE2WUApMy8uFtNvl
 qrjoLFNiOfZQ+K7IW1ySf8wbIKSBkFzawudHqP4WsT9flANuCJGsIRVhgDIKyNWH0buF
 luKeO1ScDgup9dCPMyfLR1y1Ja3qlUuMpyEOykZd1gRZdbhvzEiVNffcWpE3f3xpnqfg
 1cglCYVJ3TliV6lJ2TR6yzvOPzTWK4aHladdA8NLYYzjYLGJXM8N1zIljxBulFxffQAQ
 fk6w==
X-Gm-Message-State: AOJu0YwKUjwIdDQrinUh+mnJ1Rzb/am0id1BszohGs9XK7qXRcHYjDly
 Pxfb5iPe9coUbmQ4Wu7noCr31SY8HUqsi7EWI9JNfU9MqH83ju+cckGY+3keiHI=
X-Received: by 2002:a17:902:d509:b0:1f3:4714:3d3c with SMTP id
 d9443c01a7336-1f4499017demr40374715ad.65.1716592912941; 
 Fri, 24 May 2024 16:21:52 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 34/67] target/arm: Use gvec for neon pmax, pmin
Date: Fri, 24 May 2024 16:20:48 -0700
Message-Id: <20240524232121.284515-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: ope8WBhtanG1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

