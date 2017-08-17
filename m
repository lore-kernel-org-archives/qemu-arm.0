Received: by 10.223.183.22 with SMTP id l22csp80866wre;
        Thu, 17 Aug 2017 16:01:24 -0700 (PDT)
X-Received: by 10.84.232.197 with SMTP id x5mr7457479plm.329.1503010884146;
        Thu, 17 Aug 2017 16:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010884; cv=none;
        d=google.com; s=arc-20160816;
        b=Uy/i8ESToGNC+JIvF+xsmxtckK7NxZ4OI0RoN9X3F1S7+wyO1qA1V7OB/SFGT46pTl
         6YyNeGN7aDG9psikUbkPfkEKhEyNQlbuEb8DlWF8pP7tsM/L1c9UcQv8fX3DXjUacdpt
         GPzz9XQjFXXSeDkMNG5M1Jwe7N1jjzfofgP5QhtICXUtUcJJK8Aye2w7djH2sfazIlvz
         0I6KeBgmRpYjyTtAKGCtDK4wNfFJz6NNYbnXt48RmH6TWWdxSoCDIbQNFM7DN4fSC1Lh
         1uQMp7M8eGhvmml+lpR2cElzww6F9jTma/Fl+onfKiATZSbrDXT9D2WZXz+IH4XPgSG6
         OFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=hIDrwc+oo2/OTeyFZIxY3GeNtfhOOi0JxoLuI/S8d1Q=;
        b=fauEmCYya5i2n1yijL9eOBIpW7l2oW+/d5+HGaWf2U3Cg3V8nKOuZ1NMvmWEKe8kIf
         rU4spa3hbWBjOvf2mBfd3QtEGNggqcXCRFEWTFlVZdI/mFcPu/GZaJZC6VLt0JbQ4afY
         hC826VSlyWtNgbwM8X+WffFFIu2MCXo9UnWpRrrC+nsbJnfT1Z1VFqvvF86gjE/8nck9
         t/cSTuJQkaJXGpZK1qcm3ArqbJkHXLJ600YQ7sbXJXmQBPVi/bXLEzqRL/g4q2JtH6MU
         c5+Sv6eNf5XnTSKIrugxv5wsqzYSpGfOkpCTmyMMPzCa47xiSiu5xHdAX8igGJQwBmcr
         YHUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0Lsb3z6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::234 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com. [2607:f8b0:400e:c05::234])
        by mx.google.com with ESMTPS id z65si2637786pgz.92.2017.08.17.16.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::234 as permitted sender) client-ip=2607:f8b0:400e:c05::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0Lsb3z6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::234 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x234.google.com with SMTP id y129so51925475pgy.4
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hIDrwc+oo2/OTeyFZIxY3GeNtfhOOi0JxoLuI/S8d1Q=;
        b=Y0Lsb3z60F7sB14wYzFrb59izB7AHueIXWhSfpjV9vCPDXmsE4WpCyRAZjpn7RjgFp
         s1cMHaKERonXYCCb5ZTfT+af5GVV+sVq4J6lOdYqrvLKAuLJxD69VdA3VwWgj9WkxFrU
         cQgOlf1XiQkd+YpwWxKsvz1/w4vvOwJ4YSNTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hIDrwc+oo2/OTeyFZIxY3GeNtfhOOi0JxoLuI/S8d1Q=;
        b=nHzl2zSzl+PLNRD4FF6q7hvK++zBnSfB/KBHFXCT0MBdYoERw7OnzWDf91N3QELmo5
         eC1lBVpTXM/uxm26LpXT8SdOzUsgs6pa2H+3os6JTKyCM6XJ8BMLEfvEPI6LB3iYV3AP
         +mnQvqaK5KL/HNgdGKAu0ji8sC1W9aDAu8GdyTr85po3VO3HPO8ARpWhnK/UtDXTw9yZ
         qNZmYx3PGNRf3d1iS4Zg1+EJcbF1tdIm0OhYFOHLOyK1mx10LGMODYPxmjS8nlxRHO56
         sXInHpu/wBl8rPQT5CVAs6wn+bONT1QWRL8TWaYQwUyQFfpIOcu/6e1mz/zUtitoWhin
         Seiw==
X-Gm-Message-State: AHYfb5gdrZzUxQ7e+eAkW+21/ak1ZpeO5mCAnH7xfzRUXuFfsewSGU8V
	pt0gRsJTZqhjaO832dc=
X-Received: by 10.98.82.2 with SMTP id g2mr6749735pfb.308.1503010883573;
        Thu, 17 Aug 2017 16:01:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 5/8] tcg: Add tcg_op_supported
Date: Thu, 17 Aug 2017 16:01:11 -0700
Message-Id: <20170817230114.3655-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170817230114.3655-1-richard.henderson@linaro.org>
References: <20170817230114.3655-1-richard.henderson@linaro.org>
X-TUID: YxoFmzpaVr3q

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.h |   2 +
 tcg/tcg.c | 310 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 312 insertions(+)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index b9e15da13b..b443143b21 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -962,6 +962,8 @@ do {\
 #define tcg_temp_free_ptr(T) tcg_temp_free_i64(TCGV_PTR_TO_NAT(T))
 #endif
 
+bool tcg_op_supported(TCGOpcode op);
+
 void tcg_gen_callN(TCGContext *s, void *func,
                    TCGArg ret, int nargs, TCGArg *args);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ea78d47fad..3c3cdda938 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -751,6 +751,316 @@ int tcg_check_temp_count(void)
 }
 #endif
 
+/* Return true if OP may appear in the opcode stream.
+   Test the runtime variable that controls each opcode.  */
+bool tcg_op_supported(TCGOpcode op)
+{
+    switch (op) {
+    case INDEX_op_discard:
+    case INDEX_op_set_label:
+    case INDEX_op_call:
+    case INDEX_op_br:
+    case INDEX_op_mb:
+    case INDEX_op_insn_start:
+    case INDEX_op_exit_tb:
+    case INDEX_op_goto_tb:
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_ld_i64:
+    case INDEX_op_qemu_st_i64:
+        return true;
+
+    case INDEX_op_goto_ptr:
+        return TCG_TARGET_HAS_goto_ptr;
+
+    case INDEX_op_mov_i32:
+    case INDEX_op_movi_i32:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_brcond_i32:
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld_i32:
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+    case INDEX_op_add_i32:
+    case INDEX_op_sub_i32:
+    case INDEX_op_mul_i32:
+    case INDEX_op_and_i32:
+    case INDEX_op_or_i32:
+    case INDEX_op_xor_i32:
+    case INDEX_op_shl_i32:
+    case INDEX_op_shr_i32:
+    case INDEX_op_sar_i32:
+        return true;
+
+    case INDEX_op_movcond_i32:
+        return TCG_TARGET_HAS_movcond_i32;
+    case INDEX_op_div_i32:
+    case INDEX_op_divu_i32:
+        return TCG_TARGET_HAS_div_i32;
+    case INDEX_op_rem_i32:
+    case INDEX_op_remu_i32:
+        return TCG_TARGET_HAS_rem_i32;
+    case INDEX_op_div2_i32:
+    case INDEX_op_divu2_i32:
+        return TCG_TARGET_HAS_div2_i32;
+    case INDEX_op_rotl_i32:
+    case INDEX_op_rotr_i32:
+        return TCG_TARGET_HAS_rot_i32;
+    case INDEX_op_deposit_i32:
+        return TCG_TARGET_HAS_deposit_i32;
+    case INDEX_op_extract_i32:
+        return TCG_TARGET_HAS_extract_i32;
+    case INDEX_op_sextract_i32:
+        return TCG_TARGET_HAS_sextract_i32;
+    case INDEX_op_add2_i32:
+        return TCG_TARGET_HAS_add2_i32;
+    case INDEX_op_sub2_i32:
+        return TCG_TARGET_HAS_sub2_i32;
+    case INDEX_op_mulu2_i32:
+        return TCG_TARGET_HAS_mulu2_i32;
+    case INDEX_op_muls2_i32:
+        return TCG_TARGET_HAS_muls2_i32;
+    case INDEX_op_muluh_i32:
+        return TCG_TARGET_HAS_muluh_i32;
+    case INDEX_op_mulsh_i32:
+        return TCG_TARGET_HAS_mulsh_i32;
+    case INDEX_op_ext8s_i32:
+        return TCG_TARGET_HAS_ext8s_i32;
+    case INDEX_op_ext16s_i32:
+        return TCG_TARGET_HAS_ext16s_i32;
+    case INDEX_op_ext8u_i32:
+        return TCG_TARGET_HAS_ext8u_i32;
+    case INDEX_op_ext16u_i32:
+        return TCG_TARGET_HAS_ext16u_i32;
+    case INDEX_op_bswap16_i32:
+        return TCG_TARGET_HAS_bswap16_i32;
+    case INDEX_op_bswap32_i32:
+        return TCG_TARGET_HAS_bswap32_i32;
+    case INDEX_op_not_i32:
+        return TCG_TARGET_HAS_not_i32;
+    case INDEX_op_neg_i32:
+        return TCG_TARGET_HAS_neg_i32;
+    case INDEX_op_andc_i32:
+        return TCG_TARGET_HAS_andc_i32;
+    case INDEX_op_orc_i32:
+        return TCG_TARGET_HAS_orc_i32;
+    case INDEX_op_eqv_i32:
+        return TCG_TARGET_HAS_eqv_i32;
+    case INDEX_op_nand_i32:
+        return TCG_TARGET_HAS_nand_i32;
+    case INDEX_op_nor_i32:
+        return TCG_TARGET_HAS_nor_i32;
+    case INDEX_op_clz_i32:
+        return TCG_TARGET_HAS_clz_i32;
+    case INDEX_op_ctz_i32:
+        return TCG_TARGET_HAS_ctz_i32;
+    case INDEX_op_ctpop_i32:
+        return TCG_TARGET_HAS_ctpop_i32;
+
+    case INDEX_op_brcond2_i32:
+    case INDEX_op_setcond2_i32:
+        return TCG_TARGET_REG_BITS == 32;
+
+    case INDEX_op_mov_i64:
+    case INDEX_op_movi_i64:
+    case INDEX_op_setcond_i64:
+    case INDEX_op_brcond_i64:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld_i64:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
+    case INDEX_op_add_i64:
+    case INDEX_op_sub_i64:
+    case INDEX_op_mul_i64:
+    case INDEX_op_and_i64:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i64:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i64:
+    case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
+        return TCG_TARGET_REG_BITS == 64;
+
+    case INDEX_op_movcond_i64:
+        return TCG_TARGET_HAS_movcond_i64;
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i64:
+        return TCG_TARGET_HAS_div_i64;
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i64:
+        return TCG_TARGET_HAS_rem_i64;
+    case INDEX_op_div2_i64:
+    case INDEX_op_divu2_i64:
+        return TCG_TARGET_HAS_div2_i64;
+    case INDEX_op_rotl_i64:
+    case INDEX_op_rotr_i64:
+        return TCG_TARGET_HAS_rot_i64;
+    case INDEX_op_deposit_i64:
+        return TCG_TARGET_HAS_deposit_i64;
+    case INDEX_op_extract_i64:
+        return TCG_TARGET_HAS_extract_i64;
+    case INDEX_op_sextract_i64:
+        return TCG_TARGET_HAS_sextract_i64;
+    case INDEX_op_extrl_i64_i32:
+        return TCG_TARGET_HAS_extrl_i64_i32;
+    case INDEX_op_extrh_i64_i32:
+        return TCG_TARGET_HAS_extrh_i64_i32;
+    case INDEX_op_ext8s_i64:
+        return TCG_TARGET_HAS_ext8s_i64;
+    case INDEX_op_ext16s_i64:
+        return TCG_TARGET_HAS_ext16s_i64;
+    case INDEX_op_ext32s_i64:
+        return TCG_TARGET_HAS_ext32s_i64;
+    case INDEX_op_ext8u_i64:
+        return TCG_TARGET_HAS_ext8u_i64;
+    case INDEX_op_ext16u_i64:
+        return TCG_TARGET_HAS_ext16u_i64;
+    case INDEX_op_ext32u_i64:
+        return TCG_TARGET_HAS_ext32u_i64;
+    case INDEX_op_bswap16_i64:
+        return TCG_TARGET_HAS_bswap16_i64;
+    case INDEX_op_bswap32_i64:
+        return TCG_TARGET_HAS_bswap32_i64;
+    case INDEX_op_bswap64_i64:
+        return TCG_TARGET_HAS_bswap64_i64;
+    case INDEX_op_not_i64:
+        return TCG_TARGET_HAS_not_i64;
+    case INDEX_op_neg_i64:
+        return TCG_TARGET_HAS_neg_i64;
+    case INDEX_op_andc_i64:
+        return TCG_TARGET_HAS_andc_i64;
+    case INDEX_op_orc_i64:
+        return TCG_TARGET_HAS_orc_i64;
+    case INDEX_op_eqv_i64:
+        return TCG_TARGET_HAS_eqv_i64;
+    case INDEX_op_nand_i64:
+        return TCG_TARGET_HAS_nand_i64;
+    case INDEX_op_nor_i64:
+        return TCG_TARGET_HAS_nor_i64;
+    case INDEX_op_clz_i64:
+        return TCG_TARGET_HAS_clz_i64;
+    case INDEX_op_ctz_i64:
+        return TCG_TARGET_HAS_ctz_i64;
+    case INDEX_op_ctpop_i64:
+        return TCG_TARGET_HAS_ctpop_i64;
+    case INDEX_op_add2_i64:
+        return TCG_TARGET_HAS_add2_i64;
+    case INDEX_op_sub2_i64:
+        return TCG_TARGET_HAS_sub2_i64;
+    case INDEX_op_mulu2_i64:
+        return TCG_TARGET_HAS_mulu2_i64;
+    case INDEX_op_muls2_i64:
+        return TCG_TARGET_HAS_muls2_i64;
+    case INDEX_op_muluh_i64:
+        return TCG_TARGET_HAS_muluh_i64;
+    case INDEX_op_mulsh_i64:
+        return TCG_TARGET_HAS_mulsh_i64;
+
+    case INDEX_op_mov_v64:
+    case INDEX_op_movi_v64:
+    case INDEX_op_ld_v64:
+    case INDEX_op_st_v64:
+    case INDEX_op_and_v64:
+    case INDEX_op_or_v64:
+    case INDEX_op_xor_v64:
+    case INDEX_op_add8_v64:
+    case INDEX_op_add16_v64:
+    case INDEX_op_add32_v64:
+    case INDEX_op_sub8_v64:
+    case INDEX_op_sub16_v64:
+    case INDEX_op_sub32_v64:
+        return TCG_TARGET_HAS_v64;
+
+    case INDEX_op_mov_v128:
+    case INDEX_op_movi_v128:
+    case INDEX_op_ld_v128:
+    case INDEX_op_st_v128:
+    case INDEX_op_and_v128:
+    case INDEX_op_or_v128:
+    case INDEX_op_xor_v128:
+    case INDEX_op_add8_v128:
+    case INDEX_op_add16_v128:
+    case INDEX_op_add32_v128:
+    case INDEX_op_add64_v128:
+    case INDEX_op_sub8_v128:
+    case INDEX_op_sub16_v128:
+    case INDEX_op_sub32_v128:
+    case INDEX_op_sub64_v128:
+        return TCG_TARGET_HAS_v128;
+
+    case INDEX_op_mov_v256:
+    case INDEX_op_movi_v256:
+    case INDEX_op_ld_v256:
+    case INDEX_op_st_v256:
+    case INDEX_op_and_v256:
+    case INDEX_op_or_v256:
+    case INDEX_op_xor_v256:
+    case INDEX_op_add8_v256:
+    case INDEX_op_add16_v256:
+    case INDEX_op_add32_v256:
+    case INDEX_op_add64_v256:
+    case INDEX_op_sub8_v256:
+    case INDEX_op_sub16_v256:
+    case INDEX_op_sub32_v256:
+    case INDEX_op_sub64_v256:
+        return TCG_TARGET_HAS_v256;
+
+    case INDEX_op_not_v64:
+        return TCG_TARGET_HAS_not_v64;
+    case INDEX_op_not_v128:
+        return TCG_TARGET_HAS_not_v128;
+    case INDEX_op_not_v256:
+        return TCG_TARGET_HAS_not_v256;
+
+    case INDEX_op_andc_v64:
+        return TCG_TARGET_HAS_andc_v64;
+    case INDEX_op_andc_v128:
+        return TCG_TARGET_HAS_andc_v128;
+    case INDEX_op_andc_v256:
+        return TCG_TARGET_HAS_andc_v256;
+
+    case INDEX_op_orc_v64:
+        return TCG_TARGET_HAS_orc_v64;
+    case INDEX_op_orc_v128:
+        return TCG_TARGET_HAS_orc_v128;
+    case INDEX_op_orc_v256:
+        return TCG_TARGET_HAS_orc_v256;
+
+    case INDEX_op_neg8_v64:
+    case INDEX_op_neg16_v64:
+    case INDEX_op_neg32_v64:
+        return TCG_TARGET_HAS_neg_v64;
+
+    case INDEX_op_neg8_v128:
+    case INDEX_op_neg16_v128:
+    case INDEX_op_neg32_v128:
+    case INDEX_op_neg64_v128:
+        return TCG_TARGET_HAS_neg_v128;
+
+    case INDEX_op_neg8_v256:
+    case INDEX_op_neg16_v256:
+    case INDEX_op_neg32_v256:
+    case INDEX_op_neg64_v256:
+        return TCG_TARGET_HAS_neg_v256;
+
+    case NB_OPS:
+        break;
+    }
+    g_assert_not_reached();
+}
+
 /* Note: we convert the 64 bit args to 32 bit and do some alignment
    and endian swap. Maybe it would be better to do the alignment
    and endian swap in tcg_reg_alloc_call(). */
-- 
2.13.5
