Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2154798njk;
        Sun, 1 Dec 2024 07:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgKPRIxB37NIDG5lxtNZMJgRnS4PoVaxombor6Mn6uiVbB1F2LKk/SUyD73uVzzgQXJPOgGnP1X8McKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGIi6HB5IHHxg72e+VYEfBg8wZPorpQitewEA5PWeUlNJBuJOyhHlD+uxU4pppKCsuWAreW
X-Received: by 2002:a05:622a:cf:b0:466:a0c4:a6da with SMTP id d75a77b69052e-466b35f08camr274857541cf.31.1733066263881;
        Sun, 01 Dec 2024 07:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066263; cv=none;
        d=google.com; s=arc-20240605;
        b=ftLP6MVJMjfzVy8slcxe4EQ94/SB3d/95t2d5Rh45oja6SswTfTCYqL2lG+hRfEU0A
         VlvWa5LeMVdxX0YCCwITXjVJPG5EcH6+A27zxkHfkcTWc+XlM6qx8aeFeb5cyz6efD2j
         ZzMV/Mp7tU50ZL6dWieax5VGAKdURQJsu7j2gQR1gs7I2FdnkDcxkSRC+flamPE++vdV
         taOy0/mEO/eNohXs+7cthf2SchghnfUBPoei5Jhs6Fx5+JmbSr6aAcPCwL+7taooyjRD
         qmub18uM2xfAKwhsvVGhWibn/D3f9KyxqCOj2m04E+XuoM+EEI3SMNUAfqD0Qtf2CSvN
         2P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e7DfhKl5l0B+Z8DabpkQFpZe+bGRJiOCeuNJ2rOocdo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=kKbmHX8vTDnbq+fcCIBO6A3NjH05kSKtCw1aHCPhVS7V+X7G7Jrz3FrCqzrZHxG7eB
         CzsTPhbfQK++5Fk4uaziqydrFvO0Z5Bk4zKxeoy2QEOZOunHavHOSOK4+/nUYta79NRA
         Iq3NBaHcLwkiSOEqIkEb976tuzlrHtPQmgITnKKrmwV1cg5B4nNAtNgh+HmIwk9gdXWo
         BpyMaF9bNi52GsoAYUEOrLixb9W2nMIrNFmqWydsUQtYM7NZAZ5ED6ygZ27djSQLCtiy
         xd1CKLtOSNzPcOC7Tz/9a4md8nkyqcvWyq064TLJbvck5PFtumm9DkCOhS9wMcAFPeVc
         Rbyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QTTDB/aD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466d78c20b5si67392121cf.361.2024.12.01.07.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:17:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QTTDB/aD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlb3-0001tx-1p; Sun, 01 Dec 2024 10:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaS-00086c-G6
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:18 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaN-0005Dv-QD
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:15 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5f1dfb0b44dso999037eaf.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065810; x=1733670610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7DfhKl5l0B+Z8DabpkQFpZe+bGRJiOCeuNJ2rOocdo=;
 b=QTTDB/aDx6IgHJz0AlEymJGPEZMd6cXtuvu4hmOLndxaOt6P/dqjHEQ5vlGvz3f/O6
 3t+sujc6QWeqhRM8S/G5buQsKwbtzFGA8h1pYW/nxfkFoCgSVofka0WfhXTwp0QS1lSV
 6UCqnZXiSsuRT+jlN9HH0uB2ons3o/SuM3W8sdPQs3yGYTyuABEu8TbFeHT2l6yUcoZJ
 +jHA3/4ZjoHJY0ZhzT+flTvfLpTqx9iro4R8N64BkCPWIZs1B5nRU2ryNSgOKTZ/flm8
 MN9cqceqvM8DdTAgy5uwEJqi6rSFC1N7qtNpWhWZG8l3k9J3suvfsuwYF5Ube4R8dVNq
 BA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065810; x=1733670610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7DfhKl5l0B+Z8DabpkQFpZe+bGRJiOCeuNJ2rOocdo=;
 b=heN+FQtBn+fOsvZsPFy6N5GGAHjvZqjITqMzDsDQc5BCLNK9Q0Ki2iyx8j8knONFVP
 ZpL2xJsa1I9Ir628fjabgGfHzj/3hhJfE22Hj+bs2mq6mNObuZ9oLoSMDyO4UDsQW+7d
 cI2HAEMSwFY23pbkWc6Azt7nckjBbXtsE8Pck+CkkY1s7Sa2CeQEZl4ZQ3ssZQqsqBlb
 eBlWTGsDIs7kAWnfMHQtzZVf1WSQCPOvSXqNYt/Vg29o9g8bzr9rTGFyO5rrDZbl/WpR
 wbN2x9a9VjgqUJiS4B7pBdBOneKxH/BN+lbPpEAGRndmOk/tTqFsFmtaUWgMjNU38uRN
 MYnQ==
X-Gm-Message-State: AOJu0YxCdOdG7Z6xfS1oocumx6B01p3kef8sA9HOfJWO/ibCyiatgg2c
 ylJq4hgWqWx+ayOn3y/RzKLlCTN0MXAdbh12xgJ4DT62kwSgTRzvHIpFwItZPzHGPvtoZhvFmIN
 Sls4=
X-Gm-Gg: ASbGncuvbpWvC75QKrP4sMOYDnFE328dNuTTle917QbyPFluRqETGyIm8AKM2FfSc6V
 cv/fFRTEWqGVdEb3g7fCenKcm9jWtpVqn3c2iY+hhXctXn/BsXGERN6SvMOJ6CMARi2yNvE/bww
 J/ZaNDuaCC4Ubh1g5rYvH9nqGhZADa8Nv1c7TQjMbPgtEuax+oTM05PmkcXxTc9VAuRPmCU7npf
 KcVT2naXkJuw08D8VKrPf5p7huUGVrvnrs2rg1GdCNJiLW2xGUzQTgiT63F4uDh2Z4qFFxOjHsy
 mrRlfMv5qKtXV44AoNqaFhUUwKEmOOkQ0aRo
X-Received: by 2002:a4a:ee0f:0:b0:5ee:e2eb:ea57 with SMTP id
 006d021491bc7-5f209fc7ea5mr12761755eaf.0.1733065810131; 
 Sun, 01 Dec 2024 07:10:10 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 54/67] target/arm: Convert FRINT* (vector) to decodetree
Date: Sun,  1 Dec 2024 09:05:53 -0600
Message-ID: <20241201150607.12812-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
X-TUID: anoW9PYw3VDJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 176 ++++++++++++---------------------
 target/arm/tcg/a64.decode      |  26 +++++
 2 files changed, 88 insertions(+), 114 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1e8cb07992..98a42feb7d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9221,6 +9221,21 @@ static bool do_fp1_vector(DisasContext *s, arg_qrr_e *a,
 
 TRANS(FSQRT_v, do_fp1_vector, a, &f_scalar_fsqrt, -1)
 
+TRANS(FRINTN_v, do_fp1_vector, a, &f_scalar_frint, FPROUNDING_TIEEVEN)
+TRANS(FRINTP_v, do_fp1_vector, a, &f_scalar_frint, FPROUNDING_POSINF)
+TRANS(FRINTM_v, do_fp1_vector, a, &f_scalar_frint, FPROUNDING_NEGINF)
+TRANS(FRINTZ_v, do_fp1_vector, a, &f_scalar_frint, FPROUNDING_ZERO)
+TRANS(FRINTA_v, do_fp1_vector, a, &f_scalar_frint, FPROUNDING_TIEAWAY)
+TRANS(FRINTI_v, do_fp1_vector, a, &f_scalar_frint, -1)
+TRANS(FRINTX_v, do_fp1_vector, a, &f_scalar_frintx, -1)
+
+TRANS_FEAT(FRINT32Z_v, aa64_frint, do_fp1_vector, a,
+           &f_scalar_frint32, FPROUNDING_ZERO)
+TRANS_FEAT(FRINT32X_v, aa64_frint, do_fp1_vector, a, &f_scalar_frint32, -1)
+TRANS_FEAT(FRINT64Z_v, aa64_frint, do_fp1_vector, a,
+           &f_scalar_frint64, FPROUNDING_ZERO)
+TRANS_FEAT(FRINT64X_v, aa64_frint, do_fp1_vector, a, &f_scalar_frint64, -1)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9532,25 +9547,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x7b: /* FCVTZU */
         gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    case 0x18: /* FRINTN */
-    case 0x19: /* FRINTM */
-    case 0x38: /* FRINTP */
-    case 0x39: /* FRINTZ */
-    case 0x58: /* FRINTA */
-    case 0x79: /* FRINTI */
-        gen_helper_rintd(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
-    case 0x59: /* FRINTX */
-        gen_helper_rintd_exact(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
-    case 0x1e: /* FRINT32Z */
-    case 0x5e: /* FRINT32X */
-        gen_helper_frint32_d(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
-    case 0x1f: /* FRINT64Z */
-    case 0x5f: /* FRINT64X */
-        gen_helper_frint64_d(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
     default:
     case 0x4: /* CLS, CLZ */
     case 0x5: /* NOT */
@@ -9562,6 +9558,17 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
     case 0x7f: /* FSQRT */
+    case 0x18: /* FRINTN */
+    case 0x19: /* FRINTM */
+    case 0x38: /* FRINTP */
+    case 0x39: /* FRINTZ */
+    case 0x58: /* FRINTA */
+    case 0x79: /* FRINTI */
+    case 0x59: /* FRINTX */
+    case 0x1e: /* FRINT32Z */
+    case 0x5e: /* FRINT32X */
+    case 0x1f: /* FRINT64Z */
+    case 0x5f: /* FRINT64X */
         g_assert_not_reached();
     }
 }
@@ -10106,46 +10113,12 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_widening(s, opcode, is_q, size, rn, rd);
             return;
-        case 0x18: /* FRINTN */
-        case 0x19: /* FRINTM */
-        case 0x38: /* FRINTP */
-        case 0x39: /* FRINTZ */
-            rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
-            /* fall through */
-        case 0x59: /* FRINTX */
-        case 0x79: /* FRINTI */
-            need_fpstatus = true;
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
-        case 0x58: /* FRINTA */
-            rmode = FPROUNDING_TIEAWAY;
-            need_fpstatus = true;
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         case 0x7c: /* URSQRTE */
             if (size == 3) {
                 unallocated_encoding(s);
                 return;
             }
             break;
-        case 0x1e: /* FRINT32Z */
-        case 0x1f: /* FRINT64Z */
-            rmode = FPROUNDING_ZERO;
-            /* fall through */
-        case 0x5e: /* FRINT32X */
-        case 0x5f: /* FRINT64X */
-            need_fpstatus = true;
-            if ((size == 3 && !is_q) || !dc_isar_feature(aa64_frint, s)) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         default:
         case 0x16: /* FCVTN, FCVTN2 */
         case 0x36: /* BFCVTN, BFCVTN2 */
@@ -10153,6 +10126,17 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x2f: /* FABS */
         case 0x6f: /* FNEG */
         case 0x7f: /* FSQRT */
+        case 0x18: /* FRINTN */
+        case 0x19: /* FRINTM */
+        case 0x38: /* FRINTP */
+        case 0x39: /* FRINTZ */
+        case 0x59: /* FRINTX */
+        case 0x79: /* FRINTI */
+        case 0x58: /* FRINTA */
+        case 0x1e: /* FRINT32Z */
+        case 0x1f: /* FRINT64Z */
+        case 0x5e: /* FRINT32X */
+        case 0x5f: /* FRINT64X */
             unallocated_encoding(s);
             return;
         }
@@ -10241,33 +10225,25 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                     gen_helper_vfp_touls(tcg_res, tcg_op,
                                          tcg_constant_i32(0), tcg_fpstatus);
                     break;
-                case 0x18: /* FRINTN */
-                case 0x19: /* FRINTM */
-                case 0x38: /* FRINTP */
-                case 0x39: /* FRINTZ */
-                case 0x58: /* FRINTA */
-                case 0x79: /* FRINTI */
-                    gen_helper_rints(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
-                case 0x59: /* FRINTX */
-                    gen_helper_rints_exact(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
                 case 0x7c: /* URSQRTE */
                     gen_helper_rsqrte_u32(tcg_res, tcg_op);
                     break;
-                case 0x1e: /* FRINT32Z */
-                case 0x5e: /* FRINT32X */
-                    gen_helper_frint32_s(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
-                case 0x1f: /* FRINT64Z */
-                case 0x5f: /* FRINT64X */
-                    gen_helper_frint64_s(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
                 default:
                 case 0x7: /* SQABS, SQNEG */
                 case 0x2f: /* FABS */
                 case 0x6f: /* FNEG */
                 case 0x7f: /* FSQRT */
+                case 0x18: /* FRINTN */
+                case 0x19: /* FRINTM */
+                case 0x38: /* FRINTP */
+                case 0x39: /* FRINTZ */
+                case 0x58: /* FRINTA */
+                case 0x79: /* FRINTI */
+                case 0x59: /* FRINTX */
+                case 0x1e: /* FRINT32Z */
+                case 0x5e: /* FRINT32X */
+                case 0x1f: /* FRINT64Z */
+                case 0x5f: /* FRINT64X */
                     g_assert_not_reached();
                 }
             }
@@ -10301,7 +10277,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     int rn, rd;
     bool is_q;
     bool is_scalar;
-    bool only_in_vector = false;
 
     int pass;
     TCGv_i32 tcg_rmode = NULL;
@@ -10355,31 +10330,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x3d: /* FRECPE */
     case 0x3f: /* FRECPX */
         break;
-    case 0x18: /* FRINTN */
-        only_in_vector = true;
-        rmode = FPROUNDING_TIEEVEN;
-        break;
-    case 0x19: /* FRINTM */
-        only_in_vector = true;
-        rmode = FPROUNDING_NEGINF;
-        break;
-    case 0x38: /* FRINTP */
-        only_in_vector = true;
-        rmode = FPROUNDING_POSINF;
-        break;
-    case 0x39: /* FRINTZ */
-        only_in_vector = true;
-        rmode = FPROUNDING_ZERO;
-        break;
-    case 0x58: /* FRINTA */
-        only_in_vector = true;
-        rmode = FPROUNDING_TIEAWAY;
-        break;
-    case 0x59: /* FRINTX */
-    case 0x79: /* FRINTI */
-        only_in_vector = true;
-        /* current rounding mode */
-        break;
     case 0x1a: /* FCVTNS */
         rmode = FPROUNDING_TIEEVEN;
         break;
@@ -10416,6 +10366,13 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
     case 0x7f: /* FSQRT (vector) */
+    case 0x18: /* FRINTN */
+    case 0x19: /* FRINTM */
+    case 0x38: /* FRINTP */
+    case 0x39: /* FRINTZ */
+    case 0x58: /* FRINTA */
+    case 0x59: /* FRINTX */
+    case 0x79: /* FRINTI */
         unallocated_encoding(s);
         return;
     }
@@ -10427,11 +10384,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        /* FRINTxx is only in the vector form */
-        if (only_in_vector) {
-            unallocated_encoding(s);
-            return;
-        }
     }
 
     if (!fp_access_check(s)) {
@@ -10507,17 +10459,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x7b: /* FCVTZU */
                 gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-            case 0x18: /* FRINTN */
-            case 0x19: /* FRINTM */
-            case 0x38: /* FRINTP */
-            case 0x39: /* FRINTZ */
-            case 0x58: /* FRINTA */
-            case 0x79: /* FRINTI */
-                gen_helper_advsimd_rinth(tcg_res, tcg_op, tcg_fpstatus);
-                break;
-            case 0x59: /* FRINTX */
-                gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, tcg_fpstatus);
-                break;
             case 0x7d: /* FRSQRTE */
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
@@ -10525,6 +10466,13 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x2f: /* FABS */
             case 0x6f: /* FNEG */
             case 0x7f: /* FSQRT */
+            case 0x18: /* FRINTN */
+            case 0x19: /* FRINTM */
+            case 0x38: /* FRINTP */
+            case 0x39: /* FRINTZ */
+            case 0x58: /* FRINTA */
+            case 0x79: /* FRINTI */
+            case 0x59: /* FRINTX */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f6b334b148..4bd72d7f7f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1697,3 +1697,29 @@ FNEG_v          0.10 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
 
 FSQRT_v         0.10 1110 111 11001 11111 0 ..... .....     @qrr_h
 FSQRT_v         0.10 1110 1.1 00001 11111 0 ..... .....     @qrr_sd
+
+FRINTN_v        0.00 1110 011 11001 10001 0 ..... .....     @qrr_h
+FRINTN_v        0.00 1110 0.1 00001 10001 0 ..... .....     @qrr_sd
+
+FRINTM_v        0.00 1110 011 11001 10011 0 ..... .....     @qrr_h
+FRINTM_v        0.00 1110 0.1 00001 10011 0 ..... .....     @qrr_sd
+
+FRINTP_v        0.00 1110 111 11001 10001 0 ..... .....     @qrr_h
+FRINTP_v        0.00 1110 1.1 00001 10001 0 ..... .....     @qrr_sd
+
+FRINTZ_v        0.00 1110 111 11001 10011 0 ..... .....     @qrr_h
+FRINTZ_v        0.00 1110 1.1 00001 10011 0 ..... .....     @qrr_sd
+
+FRINTA_v        0.10 1110 011 11001 10001 0 ..... .....     @qrr_h
+FRINTA_v        0.10 1110 0.1 00001 10001 0 ..... .....     @qrr_sd
+
+FRINTX_v        0.10 1110 011 11001 10011 0 ..... .....     @qrr_h
+FRINTX_v        0.10 1110 0.1 00001 10011 0 ..... .....     @qrr_sd
+
+FRINTI_v        0.10 1110 111 11001 10011 0 ..... .....     @qrr_h
+FRINTI_v        0.10 1110 1.1 00001 10011 0 ..... .....     @qrr_sd
+
+FRINT32Z_v      0.00 1110 0.1 00001 11101 0 ..... .....     @qrr_sd
+FRINT32X_v      0.10 1110 0.1 00001 11101 0 ..... .....     @qrr_sd
+FRINT64Z_v      0.00 1110 0.1 00001 11111 0 ..... .....     @qrr_sd
+FRINT64X_v      0.10 1110 0.1 00001 11111 0 ..... .....     @qrr_sd
-- 
2.43.0

