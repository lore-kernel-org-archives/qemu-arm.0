Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp755529njc;
        Tue, 25 Jun 2024 12:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTRD6C/NtwXlGj39/jNIw/xlVcx65UQuJno06HXfD8lARPRNpkh/hu5pi/0QaqrRTtO77CAg07YOI0MfQ9I9GrbERcbTPj
X-Google-Smtp-Source: AGHT+IGvPAXyQO8KehRAqGolZKK70+w2QLs5HEoKZ7+36+iiF1SXUDfm2z7KAuu3GJ2QkvGB5Xf3
X-Received: by 2002:a05:622a:292:b0:444:fe77:5773 with SMTP id d75a77b69052e-444fe7763fdmr19302441cf.42.1719342549056;
        Tue, 25 Jun 2024 12:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719342549; cv=none;
        d=google.com; s=arc-20160816;
        b=IMEjHMnGUUH+AKXFJCmwAgXo+Sot8C4stq6kCESmPwh4nf6fAcxtJMWDhN0XPl8MOb
         DkxuNIuAKeFQJD9AnjeYttdtBztnkdPiQ0M0IV7Vzti4uUG2VFT66OIqkQpjuu+Lijbx
         95DeyKAwN0VaCwchGHUewycmr4vdM7bRPnhlSEkpZR8pT/IbSOwDj1PynTecUkhfD7Qw
         1Pr+wFN7QmFKslz12z+byTRwtQae6uRI01nsSL9QPq3qM1C049VC5uN8p9mCTF+TZPPm
         KaJ2SI2O6fm0a++PaGfkjIoEykG1q1oyUFRv4ZBj6kTqUFxJXgWkvcen3ZbHIpG1QBLW
         VKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PecZkInRMvU6dxX9NAjaqUD1RvRTPZR33lK52/GwzZA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=eb8e4u9BBagcgYAkQDWs+mi+H7wUUdNiqYhv7w9yPC7xtPW66nWlCoeE6DlDgDEqFr
         zbVcfYVMHKIeYbHorzUYMFevq4aOOofOYo/mmzU/RkL1f129tzUkpjk2MRyNRAJZMZy/
         rpuIG1YWctmviWUYcT+Rn9Pi+SKfDO2LLmKbg/K5vvYkF6QGCnTcCtXUpC01+RzOsy90
         Dmz8nTHoUIj/bEq+OKcqZv4No/XdSvy3RvB4V1KkrYfaJqDB9gJfYHNFFhEONs9yCJ2Q
         MRiYfrOO/WdLEiU8dtPX0oSywzWEWDcdtdWMiL+wGY8PgDR/5Y0UHZiGpJDS3sA/lfEv
         OuUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvdAjfFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44503136169si5777141cf.451.2024.06.25.12.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 12:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvdAjfFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMBD8-0003DZ-JI; Tue, 25 Jun 2024 14:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB4l-00014f-5J
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:39:49 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB3h-00067U-2a
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:39:19 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f480624d0fso46131375ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340550; x=1719945350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PecZkInRMvU6dxX9NAjaqUD1RvRTPZR33lK52/GwzZA=;
 b=SvdAjfFZtIbKTxqJtVXM3wglGZPuDT1qt/9pjckoktNRO8XOdBlwZvf/qRa/bGLOgM
 3J1zn3e5ogTgLJcLymcooFC3b3Q8CDYRFNb5m+GFesT1KtRfwJqRrBwe5Gq/Kbx/dlNZ
 P/dA/o4GYGJlS+vxoCTSoSYb3jULMt5DxpPgjW31pL0/hqcHOu2L27KMZWSg2IIiqYPf
 is3/eneAzAPscYdo4+zjHe6jv6+zpnlGc9G5Mua+YnkmTTO1Dm2QFtMERaYTyRjt7SxJ
 9lX7U3kttYXWHwCk/u94PQayH39+Qt0+4QrWirAdjrPzQvudAzXMo/7wX8+xQ3q3zQ50
 fnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340550; x=1719945350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PecZkInRMvU6dxX9NAjaqUD1RvRTPZR33lK52/GwzZA=;
 b=sJv/Zge7Fbqp+2l3yEzMGb35hZT/70hdjyzKzUMryG4e9LAkhlBph0dnbZfZ7b94Ds
 N15dG/WjFEYYfrF1EVtEYpEfwP+mz5roU0xUgQO7HsFVOQe9/hJuoGkH4o5lKI/mXV5M
 bcJUAZmVHG6KBj4cJBZVE3EtpqYTzDUTsl5tE1OFObAj9Fo3bFP6KodZORPRUHyVIxDY
 IoofWjeI5IWt197vsdETLhtg39i71Jmq5zUFj90mDy8SjtBYZICAxJ480AV5bz8tpC6R
 EZM91CoIYRRauGEwJAs8HH92XrwbgkQD40dAYyATCMX5Q70KogKdlZMsDzEbPCOug0US
 p/PA==
X-Gm-Message-State: AOJu0YzlD9ahTJP67hq2u5as4gJNaJno3ThTbCxEjiH8gr0o5gcfNz5F
 ybFOXVUYpY90t1o/bwG5X8JKE4QMLgyOYjOoaXFYEdYjKNC1kzHZoPfZKzsGl77JdOiuJtXGHrm
 f
X-Received: by 2002:a17:902:ea03:b0:1f9:c1f0:7150 with SMTP id
 d9443c01a7336-1fa23f224a5mr85343315ad.8.1719340549928; 
 Tue, 25 Jun 2024 11:35:49 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/13] target/arm: Delete dead code from disas_simd_indexed
Date: Tue, 25 Jun 2024 11:35:36 -0700
Message-Id: <20240625183536.1672454-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: Zwnhx70w9SuM

MLA, MLS, SQDMULH, SQRDMULH, were converted with 8db93dcd3def
and f80701cb44d, and this code should have been removed then.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 93 ----------------------------------
 1 file changed, 93 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 161fa2659c..6c07aeaf3b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -11976,7 +11976,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int h = extract32(insn, 11, 1);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    bool is_long = false;
     int index;
 
     switch (16 * u + opcode) {
@@ -11990,12 +11989,10 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        is_long = true;
         break;
     case 0x03: /* SQDMLAL, SQDMLAL2 */
     case 0x07: /* SQDMLSL, SQDMLSL2 */
     case 0x0b: /* SQDMULL, SQDMULL2 */
-        is_long = true;
         break;
     default:
     case 0x00: /* FMLAL */
@@ -12047,96 +12044,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
     if (size == 3) {
         g_assert_not_reached();
-    } else if (!is_long) {
-        /* 32 bit floating point, or 16 or 32 bit integer.
-         * For the 16 bit scalar case we use the usual Neon helpers and
-         * rely on the fact that 0 op 0 == 0 with no side effects.
-         */
-        TCGv_i32 tcg_idx = tcg_temp_new_i32();
-        int pass, maxpasses;
-
-        if (is_scalar) {
-            maxpasses = 1;
-        } else {
-            maxpasses = is_q ? 4 : 2;
-        }
-
-        read_vec_element_i32(s, tcg_idx, rm, index, size);
-
-        if (size == 1 && !is_scalar) {
-            /* The simplest way to handle the 16x16 indexed ops is to duplicate
-             * the index into both halves of the 32 bit tcg_idx and then use
-             * the usual Neon helpers.
-             */
-            tcg_gen_deposit_i32(tcg_idx, tcg_idx, tcg_idx, 16, 16);
-        }
-
-        for (pass = 0; pass < maxpasses; pass++) {
-            TCGv_i32 tcg_op = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
-
-            switch (16 * u + opcode) {
-            case 0x10: /* MLA */
-            case 0x14: /* MLS */
-            {
-                static NeonGenTwoOpFn * const fns[2][2] = {
-                    { gen_helper_neon_add_u16, gen_helper_neon_sub_u16 },
-                    { tcg_gen_add_i32, tcg_gen_sub_i32 },
-                };
-                NeonGenTwoOpFn *genfn;
-                bool is_sub = opcode == 0x4;
-
-                if (size == 1) {
-                    gen_helper_neon_mul_u16(tcg_res, tcg_op, tcg_idx);
-                } else {
-                    tcg_gen_mul_i32(tcg_res, tcg_op, tcg_idx);
-                }
-                if (opcode == 0x8) {
-                    break;
-                }
-                read_vec_element_i32(s, tcg_op, rd, pass, MO_32);
-                genfn = fns[size - 1][is_sub];
-                genfn(tcg_res, tcg_op, tcg_res);
-                break;
-            }
-            case 0x0c: /* SQDMULH */
-                if (size == 1) {
-                    gen_helper_neon_qdmulh_s16(tcg_res, tcg_env,
-                                               tcg_op, tcg_idx);
-                } else {
-                    gen_helper_neon_qdmulh_s32(tcg_res, tcg_env,
-                                               tcg_op, tcg_idx);
-                }
-                break;
-            case 0x0d: /* SQRDMULH */
-                if (size == 1) {
-                    gen_helper_neon_qrdmulh_s16(tcg_res, tcg_env,
-                                                tcg_op, tcg_idx);
-                } else {
-                    gen_helper_neon_qrdmulh_s32(tcg_res, tcg_env,
-                                                tcg_op, tcg_idx);
-                }
-                break;
-            default:
-            case 0x01: /* FMLA */
-            case 0x05: /* FMLS */
-            case 0x09: /* FMUL */
-            case 0x19: /* FMULX */
-            case 0x1d: /* SQRDMLAH */
-            case 0x1f: /* SQRDMLSH */
-                g_assert_not_reached();
-            }
-
-            if (is_scalar) {
-                write_fp_sreg(s, rd, tcg_res);
-            } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-            }
-        }
-
-        clear_vec_high(s, is_q, rd);
     } else {
         /* long ops: 16x16->32 or 32x32->64 */
         TCGv_i64 tcg_res[2];
-- 
2.34.1

