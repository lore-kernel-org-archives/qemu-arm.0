Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2634129ejc;
        Sat, 25 Feb 2023 01:15:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/+u03242yBs8qteBpkGNMJWDl/mOhwIB/fga6yJcuxbsmGqG15f4kztilKY6r3XVcSuB6S
X-Received: by 2002:a05:6214:c6f:b0:56e:a4c5:9da5 with SMTP id t15-20020a0562140c6f00b0056ea4c59da5mr32955061qvj.6.1677316528774;
        Sat, 25 Feb 2023 01:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316528; cv=none;
        d=google.com; s=arc-20160816;
        b=cfNn83qQ1ZpeczoujhgGk6Zwddo7mhu6ndWi7ccZSLXmOPPrZhs7aHd42IxjjBXupo
         os8UYnF4X+ls0UhEwW+RqNOnO8Xh0TJfsiLi/1YwKoD3OS1ZiiOTpgAyWckHabUnpZ7V
         sVsiOBvBkX+0J331yhWoY/No2ehivKxgVSpPDlLublFIWoiFQhl8J97NlHiAyNwCMkHy
         uRrHSI/3/z0daQubw3enSCGxIEhAA8eXVRuHhG3JjfwsPAmxZpLghsfi6QsR335KeO9/
         mMcvLDJkxpQaDIIzkxEf1bUxK7j6dWNg3vEpyYLsOn0jaC/qHmZW4FphNErbmFDRWuuE
         C/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
        b=Z+g6rCbke0J/cTTx1hFp+JUlnOGwSY9//aoCqdbyaypaag7SKqWKQa2TxTTFCjzmQD
         ntoRHe6tsHRcmbMpmgNWUaFATye44n+JUgKe8Lz8DDzg0FbtyVRmgk/A6zYKe7mYQgrd
         yZgYhz+Lwt0WyFEDcVMszqdxhKP3gfz00IIOPVpKvw7O6am90S79yI43luBwumGHK9Qv
         Iry9Tlcy/KaqMX3u/8ymL3VZdp4b0V958INJQyBA1OedUerHavR7YgTHwLJeA+HMVVcn
         YbkUZYVzHr/HPi1ap/yVnCx8/u6GuvnwbR+n35tNmiD+2+Uav88nBb54g+NVz6NgvmyB
         Rq7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jdlgqmgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a0ccb0c000000b0056ef275d752si1412317qvk.481.2023.02.25.01.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:15:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jdlgqmgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqe3-0004wE-U3; Sat, 25 Feb 2023 04:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe1-0004tg-LI
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:05 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdy-0001Wt-La
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:05 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso5181467pjb.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=JdlgqmgncbGxTjAuCB0/873O2vU9vmLANYXIv3k8ur613utSc3rjohTKRX+Y6VC559
 DB59RO2ijObnUCe/50HID/xjosGZUyZgBl+ekudR4M2KZlIKh0QM+qPcny4C3gHZIQcI
 aS644G+5LpPepYRV2YtZDOupeh9LbzkNVxtb8GcyfZ1POHipzSKAcZXbmloz1RPVrfH4
 DDxt9DghD4PftKmUKbMnvN4lOTKnSFColkHY6fzLxAXQlVOI1S+01Z24iGCQRMxzZNIZ
 EIM5vbVqbfyW+MWAP/PrTAZTPHpXYo7vygkTSoPZ1zJxuCbBAwCXsrhVX1V5sT90HWEA
 E/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6B+a0N7tu/9UM+UAFolg4I0Ga2IK7hy9mNAOGH/dPg=;
 b=TtW2mFDid/jJS5E0lH8oiIphKvyYE4tkxsohOCID9IW99TMTE5bfn8Nzq/qV2t7muV
 7lVOfZYWGAFUlZEWCfznY/Wc6XiQVKQMxAOZ4zAM6pYO3zc6qIJ3ZvX9ffRq286IwGhJ
 utJ5ZD4kvKDLa+37dmzFmx8fVP757SO7sKNxUK05+xsJCY0ZFRQPjaiW7RRPBseBchi/
 fYe9Q6ute8MH7nxzHE/VPiNnuT6NtnRYz1NADpPvo/mTFCZNnSIWME6WCO8nSjOm+1QU
 9g2Ho1gI9V64ZLsV34JA4yAVfdm5C+KH7BHp+WrlFbZkDtj3TfW9gN3Yr5QaQzGMbjG2
 jf0A==
X-Gm-Message-State: AO0yUKXkd8EaYYBWqOM9Qwd+uwp2zGJVuBPtezv2K9JBp4WlUc4X6JUG
 latUX2r7iMEL825WfBirGAJtWA==
X-Received: by 2002:a17:902:e5d0:b0:19a:80e6:2a21 with SMTP id
 u16-20020a170902e5d000b0019a80e62a21mr25497874plf.33.1677316501185; 
 Sat, 25 Feb 2023 01:15:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 11/76] target/arm: Drop tcg_temp_free from translator-m-nocp.c
Date: Fri, 24 Feb 2023 23:13:22 -1000
Message-Id: <20230225091427.1817156-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-TUID: Zt82iMceaTrc

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-m-nocp.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 5df7d46120..9a89aab785 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -91,7 +91,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     } else {
         gen_helper_v7m_vlstm(cpu_env, fptr);
     }
-    tcg_temp_free_i32(fptr);
 
     clear_eci_state(s);
 
@@ -303,8 +302,6 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
     tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
     tcg_gen_or_i32(fpca, fpca, aspen);
     tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
-    tcg_temp_free_i32(aspen);
-    tcg_temp_free_i32(fpca);
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
@@ -328,7 +325,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_FPSCR:
         tmp = loadfn(s, opaque, true);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
@@ -351,7 +347,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
         tcg_gen_or_i32(fpscr, fpscr, tmp);
         store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_temp_free_i32(tmp);
         break;
     }
     case ARM_VFP_FPCXT_NS:
@@ -400,8 +395,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
-        tcg_temp_free_i32(sfpa);
         break;
     }
     case ARM_VFP_VPR:
@@ -423,7 +416,6 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
         store_cpu_field(vpr, v7m.vpr);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        tcg_temp_free_i32(tmp);
         break;
     }
     default:
@@ -491,7 +483,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(sfpa);
         /*
          * Store result before updating FPSCR etc, in case
          * it is a memory write which causes an exception.
@@ -505,7 +496,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(fpscr);
         lookup_tb = true;
         break;
     }
@@ -546,7 +536,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
         tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
         tcg_gen_or_i32(tmp, tmp, sfpa);
-        tcg_temp_free_i32(control);
         /* Store result before updating FPSCR, in case it faults */
         storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
@@ -554,9 +543,6 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, tcg_constant_i32(0),
                             fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(sfpa);
-        tcg_temp_free_i32(fpdscr);
-        tcg_temp_free_i32(fpscr);
         break;
     }
     case ARM_VFP_VPR:
@@ -598,7 +584,6 @@ static void fp_sysreg_to_gpr(DisasContext *s, void *opaque, TCGv_i32 value,
     if (a->rt == 15) {
         /* Set the 4 flag bits in the CPSR */
         gen_set_nzcv(value);
-        tcg_temp_free_i32(value);
     } else {
         store_reg(s, a->rt, value);
     }
@@ -666,7 +651,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
     if (do_access) {
         gen_aa32_st_i32(s, value, addr, get_mem_index(s),
                         MO_UL | MO_ALIGN | s->be_data);
-        tcg_temp_free_i32(value);
     }
 
     if (a->w) {
@@ -675,8 +659,6 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
 }
 
@@ -717,8 +699,6 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque,
             tcg_gen_addi_i32(addr, addr, offset);
         }
         store_reg(s, a->rn, addr);
-    } else {
-        tcg_temp_free_i32(addr);
     }
     return value;
 }
-- 
2.34.1

