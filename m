Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250998dyc;
        Fri, 4 Jul 2025 07:24:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8ukmn8i4plo/KM7eQ4zDsp/eOHeX9RzIEI9NninRSdsNtYfr2nSLkuCFmJeUl98kY+j4oPggCnOvnCA==@linaro.org
X-Google-Smtp-Source: AGHT+IFJmFPylk+mw5siz83cy/CAhTVSlRg69II66AhpQsIQTHXe1ADbZzD27kitt7AEFT0kOyN6
X-Received: by 2002:a05:622a:1a24:b0:4a5:9825:d6fe with SMTP id d75a77b69052e-4a9964ff905mr32558241cf.26.1751639069519;
        Fri, 04 Jul 2025 07:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639069; cv=none;
        d=google.com; s=arc-20240605;
        b=Os2s7ocCHPIwYZefu7zCbbc//LIocHXIxBOmHuaUjoCuw8pxxmHlkEFFOo3HEH/AKE
         TOXfNsTZP8jSZCPNKqEGzecvNNokrAp5fKylw4Dd/o/H3Xg4ToIs3pn+HwpCjedIJ4ef
         NLDmS72ve5Vavc4jqrFBTBtHt177v6iULMEu3U4QPN4TZuZQSfLCGT8cxRXXKVP0dIvO
         Fi8yZxjp18sKnOsbgLiaixoXE/xz/tlrW9Ldv8tQAdy+yhXeIPg75FmDZTcIvHQYUCvU
         wzSzxkH7KJP+/bnQaGwcmdpwhAA1o9fE+sf6AfadEtcojHXtQGEXJE6vkxUxgyI4TXWt
         gaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/yxK4ycoVNRw596WwqFvL3H0CMyEDhZFsU88OCfnpOI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=i0N/xfHBhnnQAJObFLc5avcX/9xQ7POmyv55GyTgqogeZW/QkpucdungBZ+vSkFibR
         eehqgUivymW8A7tqYIFoyLx/X1VV4Dn9zCisBACC+juZgoDWPNOTHEuiJS+DEwcAjoTN
         S1LNHBUWCr//K3YfGwZbwIMjKZUiQDXV3666lI/Zn3DP4VOTJOJ3XBcztaYqiV73X4jw
         iVMd5MHVcu5Os+SP+z5IKACknIGoEMoiI9GyfusZDWOgt3x8nqxmO8E5nD4tCQfhT0KE
         mPNLVwp307qgG9AQCG6Sr0xd0gqMDh3Ok043TSWoICJ3hi40PJkXU1F6BuC4/hJt7RZs
         j72Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tA5tcOKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f390bsi20491721cf.90.2025.07.04.07.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tA5tcOKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhJS-0007HA-Lr; Fri, 04 Jul 2025 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIA-00050K-R8
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:32 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI8-0005VM-Jm
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:30 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2f3dab2a2a9so896389fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638887; x=1752243687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yxK4ycoVNRw596WwqFvL3H0CMyEDhZFsU88OCfnpOI=;
 b=tA5tcOKo9K0J3rPuuFfMphKNQQP1mmZKx7bV+D3pB2OTD+3Z6gv2J/mP7UNy7kOxDs
 4/AovTDkeD79pM9kq+j1FZoJTs0ktSCe1CMN6Wfw6JbPwTTCfEHBKX6cnqpXgUqYq6OM
 Or2YKkQhwfSR6T8JNQ5VVAqIRQmf0R/AvVmrdD4Ui5k9UUP2hj25ZgabbiE4QcXYl0VV
 itarpuU6oajZp4S58e3IoEzV/v75R2tHX28IR7z0aD5D9whCd7n2gN3sO1K8mVIs/dNK
 GLGYuF0nvwDtTUe7Nx8GU8Lx1hGuFDs+3Qr/BUsJ0BqmP+DHGw0Ai9yF3x+iBH1mGbuv
 QKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638887; x=1752243687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yxK4ycoVNRw596WwqFvL3H0CMyEDhZFsU88OCfnpOI=;
 b=qISaNezFkzJ039MHVh2xWfI6CllagYlhYYnd6pN+QULnqqQg2SaCmioEiAF07Bnn9B
 0WbSlkGM47UhcnFvdZjNzk7zdqnQMa7roSlvIrd+AL5Z3Ncje1Ytt/Pm4PbicCNz/ko3
 zwqe/5+R+xLJxkjS5ewChQYGmtKrTWm2460+wzXvfspWAof8ryqG/eFY4mT4f0Mv5l+A
 uFIebC5AZP9XQDZCDF1gUJiz45QumDYnbszgi6u/PJf+5s6SBPoNsXw9B3D56b6dB5Cm
 8+64IVi+tP52LXuLTgprkGZ8N+xSBdpwupRoH4T1fYL9hRg3khSrg1rit/pnP+RXdhU/
 lElg==
X-Gm-Message-State: AOJu0Ywdu3WWMIi2d/JRMb+UmFTNooVQ7GoGf5nmDnMuc7aJB/afiQmr
 p65Isg20YcHvlzEPBm/zVzOMDhhsCFeTgDNALtoGtVHBua32FznPueH+S3NVHscBpCw=
X-Gm-Gg: ASbGncvgzXpPYw2+pEy4Hfcfcbwf8PZiR8hWObMk0Q2CwSP3yYOJxJvsxh6ybjtC8qs
 kzwKh8UA9bPMastb/uyJL+z32HUUomS8LXn4G/pUV+yhvyTKNqjD065M9nHBG9k2pv2p6XxMvpf
 YBOz13VHKqS+/bOPY4UmFJUEFZi09X7Tk5IDRQb4pMp7AUB9ekKj+k1OoLEZQE9b1oX8KROxQ3s
 l6cp4jMJqa59CmfsBpbHsEHGtrdLZzUzRyc2djgC/vrHQ0tU3kTsOOdMOikBinUsfH13+eoYr+G
 nvq+dFKvlP8LHrNMshuPrNQaYxG+f+Grx9c2/ffwfessdbifyIKTSCUcffQDyWUv64OFN3hZQWK
 ZREZ6+SWtQ4G3mRv63waMIVLfdNz5KHgpj+C0YM7NdVzr59L3
X-Received: by 2002:a05:6870:8588:b0:29e:24c7:2861 with SMTP id
 586e51a60fabf-2f796a19e1dmr1863391fac.13.1751638887284; 
 Fri, 04 Jul 2025 07:21:27 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 011/108] target/arm: Introduce FPST_ZA, FPST_ZA_F16
Date: Fri,  4 Jul 2025 08:19:34 -0600
Message-ID: <20250704142112.1018902-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
X-TUID: 49eSI2JGBCZH

Rather than repeatedly copying FPST_FPCR to locals
and setting default nan mode, create dedicated float_status.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            | 12 +++++++++++-
 target/arm/cpu.c            |  4 ++++
 target/arm/tcg/vfp_helper.c | 12 +++++++++++-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 96a4907266..2530aaca22 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -207,6 +207,8 @@ typedef struct NVICState NVICState;
  *       when FPCR.AH == 1 (bfloat16 conversions and multiplies,
  *       and the reciprocal and square root estimate/step insns);
  *       for half-precision
+ * ZA: the "streaming sve" fp status.
+ * ZA_F16: likewise for half-precision.
  *
  * Half-precision operations are governed by a separate
  * flush-to-zero control bit in FPSCR:FZ16. We pass a separate
@@ -227,6 +229,12 @@ typedef struct NVICState NVICState;
  * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
  * which means we need an FPST_AH_F16 as well.
  *
+ * The "ZA" float_status are for Streaming SVE operations which use
+ * default-NaN and do not generate fp exceptions, which means that they
+ * do not accumulate exception bits back into FPCR.
+ * See e.g. FPAdd vs FPAdd_ZA pseudocode functions, and the setting
+ * of fpcr.DN and fpexec parameters.
+ *
  * To avoid having to transfer exception bits around, we simply
  * say that the FPSCR cumulative exception flags are the logical
  * OR of the flags in the four fp statuses. This relies on the
@@ -240,10 +248,12 @@ typedef enum ARMFPStatusFlavour {
     FPST_A64_F16,
     FPST_AH,
     FPST_AH_F16,
+    FPST_ZA,
+    FPST_ZA_F16,
     FPST_STD,
     FPST_STD_F16,
 } ARMFPStatusFlavour;
-#define FPST_COUNT  8
+#define FPST_COUNT  10
 
 typedef struct CPUArchState {
     /* Regs for current mode.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ebac86f70d..7b207f2620 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -554,11 +554,15 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
+    set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA]);
+    set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
+    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
     arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index b1324c5c0a..e156e3774a 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -123,7 +123,7 @@ uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status[FPST_A64_F16])
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
-     * We do not merge in flags from FPST_AH or FPST_AH_F16, because
+     * We do not merge in flags from FPST_{AH,ZA} or FPST_{AH,ZA}_F16, because
      * they are used for insns that must not set the cumulative exception bits.
      */
 
@@ -196,6 +196,8 @@ void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A32_F16]);
         set_float_rounding_mode(i, &env->vfp.fp_status[FPST_A64_F16]);
+        set_float_rounding_mode(i, &env->vfp.fp_status[FPST_ZA]);
+        set_float_rounding_mode(i, &env->vfp.fp_status[FPST_ZA_F16]);
     }
     if (changed & FPCR_FZ16) {
         bool ftz_enabled = val & FPCR_FZ16;
@@ -203,15 +205,18 @@ void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_ZA_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A32_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_ZA_F16]);
     }
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A32]);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A64]);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_ZA]);
         /* FIZ is A64 only so FZ always makes A32 code flush inputs to zero */
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_A32]);
     }
@@ -223,6 +228,7 @@ void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         bool fitz_enabled = (val & FPCR_FIZ) ||
             (val & (FPCR_FZ | FPCR_AH)) == FPCR_FZ;
         set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status[FPST_A64]);
+        set_flush_inputs_to_zero(fitz_enabled, &env->vfp.fp_status[FPST_ZA]);
     }
     if (changed & FPCR_DN) {
         bool dnan_enabled = val & FPCR_DN;
@@ -240,9 +246,13 @@ void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
             /* Change behaviours for A64 FP operations */
             arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
             arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
+            arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
         } else {
             arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
             arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
+            arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
+            arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
         }
     }
     /*
-- 
2.43.0

