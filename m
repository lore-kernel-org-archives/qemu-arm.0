Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2390890ejb;
        Tue, 30 May 2023 12:15:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bT1+i20AGQixYxMZdydCNNqysd/A6/DSaHfTu1689h//2OZfFpWkm/vd+AzZQL4jtvMHe
X-Received: by 2002:a05:6214:23ca:b0:623:9218:58e1 with SMTP id hr10-20020a05621423ca00b00623921858e1mr3803506qvb.31.1685474158018;
        Tue, 30 May 2023 12:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474158; cv=none;
        d=google.com; s=arc-20160816;
        b=EvzSlWAQut10kdx3xfqgkolDIGbNkM3eotWI3UYu8i/pXr52Lby7POq7/m03NlAjlK
         JxIIW+kLmILdC1oc2avrUPk5uPF0DXoZkvysyreCcsCP2IhQ5OKlNTdffc+mSTzwC3wm
         DIow11QjzU8S9NofpHbXi9v9Xe7X4eJDTZgAo5NLAhy0K/nsK90ngfUBaRSTgnQXGGF4
         9UhRhnpLsaXSGts1PSgo3kIsLzeB81iKn7IDLAyVQRXEREJW+hzQdubszDFflxRCa+Ke
         jGm1UjDnmoGR+RGrIZRPxO1EFCKh+P/7z+Unud0eBdz615Lf/0FotU8MNFXKr/FFXBtC
         w08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
        b=pYBMbSoX9cOPWf35vwzIB7hH1vDinlXq4+jf6VTGccFOLdWUYHIs60ed57bazBWZzP
         Yf5r3yQ7tj3UYZEuac8NrqaFTzwKmarXxse94REPsb25MGJEMOYVVjJZbW7j7k76CVtl
         2bvt50BPbzP5AsOuvDEuGRATJQz3OXk+F4SJ8CHdXLVOkmX13F+y3oIbzUn3vqj/nLUH
         zpwbw7JAhNAvYwhndmDr07qVxrEAcMMgZCScNPq/KUfCMUXnpvGltTwykbqKCl1g3pNg
         StnhAnMxqi1KCVOJieaLaKz7ngbbBy2TW9csj4MPCVdtlS6/h7IYmdM6DcJ4xiQBAUL1
         lKjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfR9ostw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05620a01ef00b0075b285ea25dsi5738772qkn.727.2023.05.30.12.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfR9ostw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44o7-0006y8-HY; Tue, 30 May 2023 15:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44ny-00068v-Dc
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:51 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44nw-0004g1-8G
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:50 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-25673e8c464so1800155a91.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474087; x=1688066087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
 b=UfR9ostwPmDrSyArGDQajpNfSij1C0FWClArMnp8NbsTKFFyd1YwqofMAKHzmQPwWh
 dPPgeCzVAd2lOGzRlRiInHfbiETsG3i6csCdWUksL45b6177+srCiK6WJT69Ozrn3Sv5
 bk0Q0QIz6kPhLw7C32M+oSEYZuFSZOVCbrkop/R5hOqM9Jj6YViR4M0yPs+MLOBnRt9P
 fY78SVwEQLKSsYW+55tZJdjQcc8z30a3yJQVABv1zLSo7ksEta3xl995iLV+tTJR4oPL
 efHYfC9GEeSuAXWLjeqJFwad4AltJiqhWq2tFuMTBXCjR8SFrzFBdcndgxNiq33KGmAb
 z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474087; x=1688066087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/k1qWQ9n1nK/LPGBxkHi7oTQfCtAyyOXQtWzeqV16Y=;
 b=eJlnXl8XgLrsk5zWKBuG9RLbQuMIFnIMpxb0gcqs53Ciq8E0pvTix3roM7hiOdJawc
 ok1XT1LRWPUd8Gd33Xd0/uISmU71JSlPTh+hlC644w2Bv8bKsAmfkK7xVFynZ8Crjvus
 xDp6oQs6je878oEc7TbIcxVRPbyCLPR12dO+UEbHbKuICDLwsywUHjtmQs4oRYmYTsHb
 YpxpsYKSMjgVP2Av2A7AZ68o/fnfmd1uu+o63TE7HfsdEpcBbBT44QSyyiJTJlVBRSb4
 SwHBQwY1YuVpZy7BebSxyYJlb1x84cPsU8BxxJFoAqZxXVNWV0BNS5+cKG9gWZgIKh8f
 6eNw==
X-Gm-Message-State: AC+VfDwVv7iKJqiAyEKsH1JmjHU9gaP/9SYniHn0LDqHTY/t9V9OjknB
 4rvU8ZADp/PCwBF62YWjG6oEeQ==
X-Received: by 2002:a17:90a:8a0b:b0:256:2590:818 with SMTP id
 w11-20020a17090a8a0b00b0025625900818mr3528367pjn.33.1685474086883; 
 Tue, 30 May 2023 12:14:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/20] target/arm: Load/store integer pair with one tcg
 operation
Date: Tue, 30 May 2023 12:14:27 -0700
Message-Id: <20230530191438.411344-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3bAf8LiYQquF

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

