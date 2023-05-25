Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788479ejb;
        Thu, 25 May 2023 16:28:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eH029yOePUdgxLzkSdt49OkUa3Bm1gYALPpQCc2NmIsoDqtHmbEQEZotKNSrDjcB/c3s6
X-Received: by 2002:a05:620a:2191:b0:75b:23a1:8e4b with SMTP id g17-20020a05620a219100b0075b23a18e4bmr362970qka.28.1685057302111;
        Thu, 25 May 2023 16:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057302; cv=none;
        d=google.com; s=arc-20160816;
        b=CWbRHtwrPbA6ffOTx0T3WJ4DqCj1X5RxINWBl99jTDIabClIwwiIAQQizcpkpWvFLP
         ECVdfXu1wmWEyLCtw8uyRYp+Z9siy9fVY49K22JqTcrSpSM5SB7auRecjkCgsI5XptnB
         4gdYxOaCsCrrANouA60DgWXkBjyITN1suQmXbpD/1rqPH13uPjNRV+8PCDPOKzhHDBK9
         h/KZpEBzqV7ua9SEpqXQqyU/BmozuiTrs1ELGybnAcIV3VGJ1+E1MdFXKEO0YizPs1VL
         sBjuK1afcnLFLn3qv9uQ3UbZ8x2DOPVu9tksE3Ezg2Ty/qJwVPg6DKJkxyIf3/imWIS4
         noIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
        b=SHfCfAR+zlOXqR4yhVg6lQTnKyq8awHzR7St+Sw2SS6nZl8ynAUshkhlCW8f2SeL1c
         1bsDPi48kkrG0rFQWJSMdrpBGXpldPNvNrZ4vW9sW9WKXTncXQHS83JYWkCJZfniixZ3
         2LgWPr0E5ul16bAFZ7ibplSM+KiWcgB33G5L6vV2LPCsFJy7r37XbiLiSMXwjEl3hIOw
         osKKIM9WJKyqoWxTaN75NgYDTQeZsbR6nm0FsA65s2EOTGSa3gcNu+jwsvL1mF4pNXLy
         1X5Ydiu4hkGoOu0tDlaSCv3EmN8fg8Yv/oWAXoEwaIS39Wa+9hr9bbR+5SEcoXIDOrX1
         Ai3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPcqo3D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27-20020a05620a151b00b0075b05e65a32si935042qkk.528.2023.05.25.16.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPcqo3D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLa-0005rK-6p; Thu, 25 May 2023 19:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLV-0005n3-CN
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:13 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLQ-0005md-AX
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:12 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so103003a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057167; x=1687649167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
 b=QPcqo3D9BOm9RWkUYTd0/sVdjwWj9QIa2ZcskEusulX3urqxaZ25taJ/8SsWe06hZC
 rP/rZ2ALkgf/fw+aBS1j3ec4sw+bqJ4pP/M38KEksLh11jmqyqzaHvzCmhiNxyIiexL4
 KFNpe+7H6yQAHS56MMM7PpMB5cgWqavevT5psd/SkoymXBnewc8ojYF7ACJPVGUAr4FE
 rdiZ64P/C5zQv7UrNOCRD4fcQU0vn9vlbzutUyEHmWyYptdBMRfg3Wf1dgoEHySyZkFL
 RaKNE+qPPtjTjaV45LVWATsI2ViuYtpe+GQHSeUMtBRpwH7UhfQzG+U1rll2jhAG1X79
 KJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057167; x=1687649167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
 b=IyaX4nwQUbZfvMm0Otbs8xBu0lRuTd0jlQKMG3HAGSvSnqwMOWhhkbomu7L3e3Pi+v
 4gJ7TPMooF5/9STvYWBFd2n7ztaKscPE5ry43x+bx1avVs1kOqbw5Pt3AQcdvnaLqfEz
 DO/gs+OHRZh5sKRpifSCP/FK4k8OOy2xeTbjzRyz+P421hFpWSTkP2PS33pZGK2CnH+0
 OGlcqFf+EILdDO4z4E3+kKAQNWuBCd5pXJq/rMLhXm1L5AaT4BdxYDyc9v90naB7UrNX
 VqNV/SR4zG0O4IYH/GZPMsPnUTU2Jjf52do/Q2jk8M0P5nybf5f3YP68OsAyhPEi3z3y
 3aUQ==
X-Gm-Message-State: AC+VfDzM9k9aZATbfdmuIayFepu2XmoxsjWghzhesVOC2wTt7YHuyI1s
 uBBKOAQMAqrF37pTIeBJb9DK8w==
X-Received: by 2002:a17:902:f801:b0:1ae:5212:748b with SMTP id
 ix1-20020a170902f80100b001ae5212748bmr288567plb.49.1685057166872; 
 Thu, 25 May 2023 16:26:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/20] target/arm: Load/store integer pair with one tcg
 operation
Date: Thu, 25 May 2023 16:25:47 -0700
Message-Id: <20230525232558.1758967-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: F/zpz+1cBVSW

This is required for LSE2, where the pair must be treated atomically if
it does not cross a 16-byte boundary.  But it simplifies the code to do
this always.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 70 ++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 19f0f20896..40c6adc9cc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2954,26 +2954,66 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
+        MemOp mop = size + 1;
+
+        /*
+         * With LSE2, non-sign-extending pairs are treated atomically if
+         * aligned, and if unaligned one of the pair will be completely
+         * within a 16-byte block and that element will be atomic.
+         * Otherwise each element is separately atomic.
+         * In all cases, issue one operation with the correct atomicity.
+         *
+         * This treats sign-extending loads like zero-extending loads,
+         * since that reuses the most code below.
+         */
+        if (s->align_mem) {
+            mop |= (size == 2 ? MO_ALIGN_4 : MO_ALIGN_8);
+        }
+        mop = finalize_memop_pair(s, mop);
 
         if (is_load) {
-            TCGv_i64 tmp = tcg_temp_new_i64();
+            if (size == 2) {
+                int o2 = s->be_data == MO_LE ? 32 : 0;
+                int o1 = o2 ^ 32;
 
-            /* Do not modify tcg_rt before recognizing any exception
-             * from the second load.
-             */
-            do_gpr_ld(s, tmp, clean_addr, size + is_signed * MO_SIGN,
-                      false, false, 0, false, false);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_ld(s, tcg_rt2, clean_addr, size + is_signed * MO_SIGN,
-                      false, false, 0, false, false);
+                tcg_gen_qemu_ld_i64(tcg_rt, clean_addr, get_mem_index(s), mop);
+                if (is_signed) {
+                    tcg_gen_sextract_i64(tcg_rt2, tcg_rt, o2, 32);
+                    tcg_gen_sextract_i64(tcg_rt, tcg_rt, o1, 32);
+                } else {
+                    tcg_gen_extract_i64(tcg_rt2, tcg_rt, o2, 32);
+                    tcg_gen_extract_i64(tcg_rt, tcg_rt, o1, 32);
+                }
+            } else {
+                TCGv_i128 tmp = tcg_temp_new_i128();
 
-            tcg_gen_mov_i64(tcg_rt, tmp);
+                tcg_gen_qemu_ld_i128(tmp, clean_addr, get_mem_index(s), mop);
+                if (s->be_data == MO_LE) {
+                    tcg_gen_extr_i128_i64(tcg_rt, tcg_rt2, tmp);
+                } else {
+                    tcg_gen_extr_i128_i64(tcg_rt2, tcg_rt, tmp);
+                }
+            }
         } else {
-            do_gpr_st(s, tcg_rt, clean_addr, size,
-                      false, 0, false, false);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_st(s, tcg_rt2, clean_addr, size,
-                      false, 0, false, false);
+            if (size == 2) {
+                TCGv_i64 tmp = tcg_temp_new_i64();
+
+                if (s->be_data == MO_LE) {
+                    tcg_gen_concat32_i64(tmp, tcg_rt, tcg_rt2);
+                } else {
+                    tcg_gen_concat32_i64(tmp, tcg_rt2, tcg_rt);
+                }
+                tcg_gen_qemu_st_i64(tmp, clean_addr, get_mem_index(s), mop);
+            } else {
+                TCGv_i128 tmp = tcg_temp_new_i128();
+
+                if (s->be_data == MO_LE) {
+                    tcg_gen_concat_i64_i128(tmp, tcg_rt, tcg_rt2);
+                } else {
+                    tcg_gen_concat_i64_i128(tmp, tcg_rt2, tcg_rt);
+                }
+                tcg_gen_qemu_st_i128(tmp, clean_addr, get_mem_index(s), mop);
+            }
         }
     }
 
-- 
2.34.1

