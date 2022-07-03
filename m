Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439861lft;
        Sun, 3 Jul 2022 01:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgEqRvMoUYr+dSb6XinaV+F1PpBAK+zGAWdShv01lT6lPN2XvFGtAk5nhaiNj3QOdE9xui
X-Received: by 2002:a0d:c585:0:b0:317:f0d6:1d8 with SMTP id h127-20020a0dc585000000b00317f0d601d8mr27901932ywd.86.1656837814810;
        Sun, 03 Jul 2022 01:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837814; cv=none;
        d=google.com; s=arc-20160816;
        b=unh4w+QVlUFLVyQp+4hMkMoVAmHtWM6BRV+PC3bdWwcm4Wo6w0PkYxN2VwPHPKJsAE
         wg0Y9kROcWosG9byifQG86U0NhrRZSo/mbdrvBIVnt+it2zVVRlBzxJTFcFUNv8zgE4E
         N+XA34ao/E8zxM/AeNgsd1/bX4tkyRscfTxvv/uER0z9mFmOKij24gU/SkrO2y7/vHD7
         8FskrIzBjq42yDYHre667DDzaMkTsGNIMeY51hqzDaTBdhRphMgqyu9ALahg57+uqpaa
         FKnt4lLzXLsnPOYAmVMKDujxE5mDFbGQy6SecLwaGIIysJVEGMH/tqdhvJ/7Z66U/2Pp
         vCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ksx6W4Sx5o5nja+lkexLW8pvcoLuTT+mih01KAHBd4Q=;
        b=tQproQf3voebjl7SUZScqcnC4zv+I2waiohSMy37a1jqbCcJCB3GVNpdKtg8Z+BtvH
         hkkkoOHqxLThgIsMNMK9hn/JU+2O9nHuEoiW1Gv5F7icNhO4kFk0yR4BXQVYJMBCnD0o
         xbvUVds0xLlocDpgecsDDxDp3EsW/1waREvTr1mXMURC8YdnvYUs7f3VfgTYZwENOV7q
         sPSoV7uNgqIUnyh0XgzhDN6U9KnC9S+hGsuEJEl7dHxRfOWrEcFsBSZj5sR+XKnVc8JZ
         l+pCm4sgGTdqwPNIdGwBx/5ZdKYps5zYBRVBkjmWYgqEQazwwKJVBNUFkwHpGXqQRkIT
         UYiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ7H3pKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a056902154400b0066e36c52563si1753820ybu.688.2022.07.03.01.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZ7H3pKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vCY-00061d-6p
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvX-0000PV-KT
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:59 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvW-0006E4-4h
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:59 -0400
Received: by mail-pf1-x436.google.com with SMTP id n12so6404566pfq.0
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksx6W4Sx5o5nja+lkexLW8pvcoLuTT+mih01KAHBd4Q=;
 b=wZ7H3pKQ/D78ehF7aylWWstzzV32gIJ2gK8GHhapNKohJYPONVymz6znV44EziPDzu
 SmSgpDKKat+ZlvuRfjwhVcIBlEg3tmyetD5HVUWn7ViZLGuDUH7ViQGf7LULryw8dpxZ
 q6bmo2REXia8rmTgenmIk+qsw4XtPuib+Td+uo9M8lnje23mUzhQrbLQKPyY2rodlgZw
 aPf1LpFHkGBow+45JVAAnHCsE6V53ZMazDO4Srh8lB9RdyzhKXMJPBwFmnkOZx/15Pc6
 la78QAPfSBJzPn0l4ozA2tDWUH6uRD44LQZYl8Qsh/Biv+MnZG6LvKLebx0Ja3Ltq8b+
 /YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksx6W4Sx5o5nja+lkexLW8pvcoLuTT+mih01KAHBd4Q=;
 b=K0Se0Z+QAHV+P+gDYRYsER2y8wtHgwImRV1FdcGGZbX18u2+jORxYOtoYQQC4pdN8P
 177uAPOp9bZg4680zPFgioxt/9lc2XN10vSn0Qm/WHBg1vZ9h852+vAgWdDGLR6Z+EVU
 NoUUH4MdDzLQdovQKEF+SUKbio4zjGk0zRPr4/m4C/Rm8xuGUFiVrwS4/9GBZUjWrClq
 peX/7R5KeJPF8BXHJfH679vv+oL9plV/mvwy/KVD8tWNfMaWwTQ+XXT0HzLLfVQY/MZd
 8Q5KOqNPyQ/qJrUC0lRkzy4rhwqxCk8TsdZZbrWyHHnBnXhAn/+WavW3UnJCfyKAkZhB
 g5lQ==
X-Gm-Message-State: AJIora91w3KAL5zOlKAyj2O6h8nLTDRz6KIkrCl+ZhXZmY3h/0DhnQvw
 Qcxh10vo9PWxEXmWFDHoTYFthyYXBDWaZ5WC
X-Received: by 2002:a63:224f:0:b0:412:12cc:1960 with SMTP id
 t15-20020a63224f000000b0041212cc1960mr4500469pgm.348.1656836756742; 
 Sun, 03 Jul 2022 01:25:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/62] target/arm: Add TBFLAG_M32.SECURE
Date: Sun,  3 Jul 2022 13:53:47 +0530
Message-Id: <20220703082419.770989-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7AjEcrr88NOA

Remove the use of regime_is_secure from arm_tr_init_disas_context.
Instead, provide the value of v8m_secure directly from tb_flags.
Rather than use regime_is_secure, use the env->v7m.secure directly,
as per arm_mmu_idx_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 ++
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4a41b5dcef..919e7c27a3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3162,6 +3162,8 @@ FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 /* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
 FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
+/* Set if in secure mode */
+FIELD(TBFLAG_M32, SECURE, 6, 1)
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fb13e0f4c0..0908c20215 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11281,6 +11281,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6617de775f..540ce84d95 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9359,8 +9359,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
-        dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-            regime_is_secure(env, dc->mmu_idx);
+        dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
         dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-- 
2.34.1

