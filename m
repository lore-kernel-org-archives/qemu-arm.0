Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4201262njb;
        Wed, 11 Dec 2024 08:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAIGTPh5geiEEL6IXHMkq2njSlJ7/QqoM/LpJXyjf4h+aLzHyvjL8MVH42Ggb9M/LTSbj9o/iIFzyI1g==@linaro.org
X-Google-Smtp-Source: AGHT+IFhNVk9jBPB2IJ7bJQtleXVCid2ZsOtj6IWYtoRXHZ2Hok7b/MwEBIKJ2bHdk1HkkwCMeM7
X-Received: by 2002:a05:6214:e47:b0:6d1:7433:3670 with SMTP id 6a1803df08f44-6d934ad2d36mr69989406d6.4.1733935752039;
        Wed, 11 Dec 2024 08:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935752; cv=none;
        d=google.com; s=arc-20240605;
        b=Dy+ViAHulJ0xs/onAEhHV5rV/3qDBwvBbIKZfWUIS8xo1ffpOKGwKgDTGA+nvqKr0E
         QQ92qFYdVSEvzvfSkwL2pvjXFXbi1DOTNEfA0As14El1xItYg1QbmrJmR8yoOo6hvC2a
         GZASgDP995Y93sA+Xpt9kuhMdg+tKE+o0XQyqAxeVzPz1wy7sX+KPegv3zv8uiDOnoSa
         auEYj/frLgrwnXQMQ3ptlDoD1yY3MSVY+h0S+Ak8X3Tisubn3CCgBhpbJixPmT2j8Bhb
         FD/8HOc1+q43UnDyS4dZ7eNwfAMBFb+6WVjkGihZhGZkp+Fe7XSRWQZghAZR68iupUQS
         0PRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1xi1VVupk6UAAF6uJqvVpXPkvd7FQ1UcQ5SjuvIKep8=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=b2nxdbJgVOCQzGaEld+Ni2nSFwHygTSb9IsZXRH7y/kmWkVCzEcf8chLEAum0MRE87
         3DXPUM+20XNSkq9FFgxp74bEFnpW00vgytJwF83Cf3VtF2lfWxpnF62UQLj0MHQ9ADlv
         BgA88qT7XGwcWOD8PJTsGx1QDwVvGWsDGVCCRp/St8Ctzmvd5nhTfr2jY9JHweLUeDAO
         jPlSXgVIQTHMXvMeExL/LDOmkjFilHdd/UtV1WCDmJrHO0RJVYUygYEeb1lsm736GnUB
         rA49mcnAtIFkLDrhqhR4OEtc/LZiySMed1EleEu3U5sZAGG8r5h0R+iIrArmbZgxwC4W
         s1ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1iI6Gte;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6f205687asi10845485a.545.2024.12.11.08.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E1iI6Gte;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPht-0001l8-Vy; Wed, 11 Dec 2024 11:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhV-0000aB-1M
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:37 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhT-0002EV-5A
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:36 -0500
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6d88282980bso63339836d6.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934994; x=1734539794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xi1VVupk6UAAF6uJqvVpXPkvd7FQ1UcQ5SjuvIKep8=;
 b=E1iI6GteNKP9lJm9nBP6n63m++O/H/Dkbr62IPvM5/ALGaGeRFOw0f1dU/3KpZVm3f
 qXYK23v1vhzZyCGZHeW6BRehFtLnGklHk1d2x1hh9gkiATZJInTYFm65c81eHnLLB+VA
 h1fOWBuCMEJqIFmS/jIbG2w5445ftVN3C+IvdvUjUrsiFyjGqn/wWGVBGZRNZeXkFh/6
 woYKTfAWFBgwMRAsXLOJyYiBVxLHBzbshZ4B+1CABrEAS9nRVNQaGgLJ/7YgCfaHQCG0
 hwOvud1dV9bSvVtT5RR6xKi00l4SrzkiTw/zy1Lq+vAGCGcRj0DeXllahx4zsI8/kanf
 lOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934994; x=1734539794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xi1VVupk6UAAF6uJqvVpXPkvd7FQ1UcQ5SjuvIKep8=;
 b=Q/Ja8kVxaTu/prg+GdTauEDWHFPMbAL8OtWud9DgZBEpZmL6Q/+8m2P5deD/bPxEfS
 LU/TXfrI5PZOLHV79YcLt9BgJK2KrkPO3YVyBqjtpV2esKXOBsv7dg8WYr8ZqKI0vu3W
 pe8snj//htyeGCYDcQl6A/TiqJe69an7LFr/KiV6XwcjqRVELb1SlLvmz6tVi+RWESTN
 6SxkVKC6W0BYkiQ5ZZuClE5lHU5mN6GLaDp7+VbwhvlAXYqog1zvW0IkYVSVs6YivvL3
 17Gwg2vTwAa8qdcXhw+krodn1GBWCn1gXjiAAhRdm5Tjh3QzGJE/B8UOlyhpvpcobXEE
 DHNQ==
X-Gm-Message-State: AOJu0Yxf/bRZaRYpTahQBBT3WyCjfuVSIYXBlKrzohkfgD2y2rXBGh53
 fQuNwBxGfsWO2YkiF+WFB3lhRKeQc3nUPWy0UBRBYRbS65dF25JcW2CMW/A8OANvdvSUuiYveoq
 fO8fGxyNM
X-Gm-Gg: ASbGncu0RpAEV3t2E27hhS68p1jbKGsL+rt+YSmlD3E04d0EGBGJSG4vS3LoQMO3o+1
 +8pY+mH8IHploy93zSR7xG4mJhjDDJkkYmyPCptaS00L4AluTXnhjkzobMcwduQ8JVQ8JfbCQyk
 YF6J5Bqkxhr7RO5dNbLPPv6kqKOoK+iFEHmK11Hsb48hpX5nE66yjNwQ6x9Wg7mZi9alP2nAKk2
 hOX+B730Pm0kHq7abimasgp5ztljguas3fflaAwQXHaBxSViXpdiyZioptH1A==
X-Received: by 2002:a05:6214:2461:b0:6d8:a70d:5e41 with SMTP id
 6a1803df08f44-6d934b8fae0mr69199066d6.33.1733934994059; 
 Wed, 11 Dec 2024 08:36:34 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 54/69] target/arm: Convert FABS, FNEG (vector) to decodetree
Date: Wed, 11 Dec 2024 10:30:21 -0600
Message-ID: <20241211163036.2297116-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0vg60I3YrgHD

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 54 +++++++++++++++-------------------
 target/arm/tcg/a64.decode      |  7 +++++
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c5d456de3b..fd7f7ae714 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9149,6 +9149,20 @@ static bool trans_SHLL_v(DisasContext *s, arg_qrr_e *a)
     return true;
 }
 
+static bool do_fabs_fneg_v(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
+{
+    int check = fp_access_check_vector_hsd(s, a->q, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    gen_gvec_fn2(s, a->q, a->rd, a->rn, fn, a->esz);
+    return true;
+}
+
+TRANS(FABS_v, do_fabs_fneg_v, a, gen_gvec_fabs)
+TRANS(FNEG_v, do_fabs_fneg_v, a, gen_gvec_fneg)
 
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
@@ -9447,12 +9461,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
      * requires them.
      */
     switch (opcode) {
-    case 0x2f: /* FABS */
-        gen_vfp_absd(tcg_rd, tcg_rn);
-        break;
-    case 0x6f: /* FNEG */
-        gen_vfp_negd(tcg_rd, tcg_rn);
-        break;
     case 0x7f: /* FSQRT */
         gen_helper_vfp_sqrtd(tcg_rd, tcg_rn, tcg_fpstatus);
         break;
@@ -9497,6 +9505,8 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x9: /* CMEQ, CMLE */
     case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
+    case 0x2f: /* FABS */
+    case 0x6f: /* FNEG */
         g_assert_not_reached();
     }
 }
@@ -9968,13 +9978,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         opcode |= (extract32(size, 1, 1) << 5) | (u << 6);
         size = is_double ? 3 : 2;
         switch (opcode) {
-        case 0x2f: /* FABS */
-        case 0x6f: /* FNEG */
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         case 0x1d: /* SCVTF */
         case 0x5d: /* UCVTF */
         {
@@ -10099,6 +10102,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x16: /* FCVTN, FCVTN2 */
         case 0x36: /* BFCVTN, BFCVTN2 */
         case 0x56: /* FCVTXN, FCVTXN2 */
+        case 0x2f: /* FABS */
+        case 0x6f: /* FNEG */
             unallocated_encoding(s);
             return;
         }
@@ -10171,12 +10176,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x2f: /* FABS */
-                    gen_vfp_abss(tcg_res, tcg_op);
-                    break;
-                case 0x6f: /* FNEG */
-                    gen_vfp_negs(tcg_res, tcg_op);
-                    break;
                 case 0x7f: /* FSQRT */
                     gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_fpstatus);
                     break;
@@ -10220,6 +10219,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     break;
                 default:
                 case 0x7: /* SQABS, SQNEG */
+                case 0x2f: /* FABS */
+                case 0x6f: /* FNEG */
                     g_assert_not_reached();
                 }
             }
@@ -10362,17 +10363,14 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7b: /* FCVTZU */
         rmode = FPROUNDING_ZERO;
         break;
-    case 0x2f: /* FABS */
-    case 0x6f: /* FNEG */
-        only_in_vector = true;
-        need_fpst = false;
-        break;
     case 0x7d: /* FRSQRTE */
         break;
     case 0x7f: /* FSQRT (vector) */
         only_in_vector = true;
         break;
     default:
+    case 0x2f: /* FABS */
+    case 0x6f: /* FNEG */
         unallocated_encoding(s);
         return;
     }
@@ -10474,12 +10472,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x59: /* FRINTX */
                 gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-            case 0x2f: /* FABS */
-                tcg_gen_andi_i32(tcg_res, tcg_op, 0x7fff);
-                break;
-            case 0x6f: /* FNEG */
-                tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
-                break;
             case 0x7d: /* FRSQRTE */
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
@@ -10487,6 +10479,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_vfp_sqrth(tcg_res, tcg_op, tcg_fpstatus);
                 break;
             default:
+            case 0x2f: /* FABS */
+            case 0x6f: /* FNEG */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ec0d46a563..f46bd1a715 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -77,6 +77,7 @@
 @qrr_s          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=2
 @qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
 @qrr_hs         . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=%esz_hs
+@qrr_sd         . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=%esz_sd
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
 
 @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
@@ -1687,3 +1688,9 @@ FCVTXN_v        0.10 1110 011 00001 01101 0 ..... .....     @qrr_s
 BFCVTN_v        0.00 1110 101 00001 01101 0 ..... .....     @qrr_h
 
 SHLL_v          0.10 1110 ..1 00001 00111 0 ..... .....     @qrr_e
+
+FABS_v          0.00 1110 111 11000 11111 0 ..... .....     @qrr_h
+FABS_v          0.00 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
+
+FNEG_v          0.10 1110 111 11000 11111 0 ..... .....     @qrr_h
+FNEG_v          0.10 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
-- 
2.43.0

