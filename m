Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1878086ejb;
        Mon, 7 Aug 2023 20:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+qwbdhqAJlITsq6NFb2mZpeWP75w5jSOIOhcl5jq+rUjCfNgwPS5aspnua7yygzRpoI27
X-Received: by 2002:a0c:b40d:0:b0:63d:43aa:e076 with SMTP id u13-20020a0cb40d000000b0063d43aae076mr10365107qve.1.1691464552729;
        Mon, 07 Aug 2023 20:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464552; cv=none;
        d=google.com; s=arc-20160816;
        b=VTlkau0vHmZHq0ApQkFnm4LjbbUWE+qSkdU3Aer31APgtbSls+98yRwwyP5TRy9zf5
         4e61KrtAurkuECz0EGcjmU8nr+c1bUj7dPedbSkVZ3NB2//PpMOUGI6pzu9Gwq7LyRpE
         jHdoVvlvlVUdwOjTPsN2N+ImuS1VCO3CPdYFrHMDqLU1FyMv7XumYKvDA4+aeEZ8nzvg
         jWZ5xw5qxHGJWF6DpkfV3te+ighaI76FQi8jwQfk8O7NLM4KCl/jHWx8Sjb5TjJsAkFG
         U4lzTDLDiHr+a5LeonddsKIaEZGWmFcSOziokJoVOQKVKJV7iJoUSAYbDHMCJhJPjgT/
         kjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HftGyFuliXonCmDTfSQ595T2noxt1RPBvVTS1fEpJE4=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=OEJHMHHeVW8Ulf0lwjjU895WEaku7bFpGLz72z+g/0ILZUwn/I6UoNjh0cB6bjzLDO
         K4oqpthbFNEk8UkL5QNErOH+jrRzZMeFGSDer8yeLAhg/33ltWZ62PmJDymT/g+Nlz9B
         om6PFqWVyo7TChbJnpQyxOOg40TJr0FDfksANRlBpY6cVNFk6J0PCwA/NC3mVloePrg4
         9qUWrzvfyffnZuiehRrc6w6zXxKMoTH9P6z7FITUO+WQ5qPkOA4ha1+qt3OZ6sc0muvY
         YqJnC8hrazt210nc45pfJAFxk0paYxNTICIQf/AZ62Mn6PXallsWrMKd8tEHWLL8KvBy
         MIWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyZ4ShXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a0ca993000000b0063d52f6e529si5669238qvb.56.2023.08.07.20.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyZ4ShXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD8X-0000Bj-RK; Mon, 07 Aug 2023 23:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8W-0000AJ-By
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:11:56 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8P-000093-K6
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:11:56 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-55bac17b442so3807897a12.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464308; x=1692069108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HftGyFuliXonCmDTfSQ595T2noxt1RPBvVTS1fEpJE4=;
 b=qyZ4ShXL/IiCMFN/uaOF8PrML7SdB9xDL81Mx3A6DQq5Sx0QJhmTdhXDeoHZZKwh5+
 oKgpoH0rHWQytnAsV4cOFC0pGnSbhSTo4ArfifOsWDtQ1suzW91GdNvlS8VChGCEOZND
 yTd6jD6fORf70WR3Y0IwbVzYQiscOJnzO6JlzNqdTzcPjEbBBPFaKnyTfuFmp5PH1Rlt
 kBVS3Ld4ry1eno0TZoplPwsU01L7OwqMyWXluCS871Gfy898tKQ0aK8MVbi9FwSaVQMA
 3dFBekgfS9/GkgvxCvUWn4y/A9B7jRRxE43qNo/lnttA8ztmf2TX4jBP6/5ITweMdnS+
 +C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464308; x=1692069108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HftGyFuliXonCmDTfSQ595T2noxt1RPBvVTS1fEpJE4=;
 b=JDQ5L/dQ3Eg6LHwvofMm5iB0/ZRu/DZmwQmqFxDAJWJd687Q+N5U2u5HDlxYEeIzA0
 ka9oNPRMW5EMNFcSHzwGlpD9VlDQvV/YOHROMEeISmsyAU2PyEMHszGrKZ087qTNE2iW
 tyZFRm6I2fZd2JziPa2c0vkkAxs72CyROoz+cZF0rbTvHaRsWpN4U9j+8Xi+lv/HdW0x
 HvQdYBYKSCKrZqFG6kuy1HmXu5Vpkk35Fj/ZaScj6rwZwQarxgKL9OBhdIwotuZoadPQ
 OJImdnBNhZxZBRUE6cE7XgBf/0tflRq1KFFCCKjwIOpOuWAknmgjAc0B81NsHA/cGMsj
 2ebQ==
X-Gm-Message-State: AOJu0YxFrocwGBMRRRidO22zn99qZgF7xtVnTv+7gX27Pj9F/q57m+sI
 QZ+iwJCmw9ABi6py7PXbhpp12g==
X-Received: by 2002:a05:6a20:9154:b0:13e:8ce5:bed4 with SMTP id
 x20-20020a056a20915400b0013e8ce5bed4mr14442332pzc.7.1691464308275; 
 Mon, 07 Aug 2023 20:11:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 04/24] target/arm: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:23 -0700
Message-Id: <20230808031143.50925-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: FVI++1F4ZFVy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 22 +++++++++-------------
 target/arm/tcg/translate.c     | 12 ++++--------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..ac16593699 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4935,9 +4935,12 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
 
     if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
         /* CSET & CSETM.  */
-        tcg_gen_setcond_i64(tcg_invert_cond(c.cond), tcg_rd, c.value, zero);
         if (else_inv) {
-            tcg_gen_neg_i64(tcg_rd, tcg_rd);
+            tcg_gen_negsetcond_i64(tcg_invert_cond(c.cond),
+                                   tcg_rd, c.value, zero);
+        } else {
+            tcg_gen_setcond_i64(tcg_invert_cond(c.cond),
+                                tcg_rd, c.value, zero);
         }
     } else {
         TCGv_i64 t_true = cpu_reg(s, rn);
@@ -8670,13 +8673,10 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         break;
     case 0x6: /* CMGT, CMHI */
-        /* 64 bit integer comparison, result = test ? (2^64 - 1) : 0.
-         * We implement this using setcond (test) and then negating.
-         */
         cond = u ? TCG_COND_GTU : TCG_COND_GT;
     do_cmop:
-        tcg_gen_setcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
-        tcg_gen_neg_i64(tcg_rd, tcg_rd);
+        /* 64 bit integer comparison, result = test ? -1 : 0. */
+        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
         break;
     case 0x7: /* CMGE, CMHS */
         cond = u ? TCG_COND_GEU : TCG_COND_GE;
@@ -9265,14 +9265,10 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         }
         break;
     case 0xa: /* CMLT */
-        /* 64 bit integer comparison against zero, result is
-         * test ? (2^64 - 1) : 0. We implement via setcond(!test) and
-         * subtracting 1.
-         */
+        /* 64 bit integer comparison against zero, result is test ? 1 : 0. */
         cond = TCG_COND_LT;
     do_cmop:
-        tcg_gen_setcondi_i64(cond, tcg_rd, tcg_rn, 0);
-        tcg_gen_neg_i64(tcg_rd, tcg_rd);
+        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_constant_i64(0));
         break;
     case 0x8: /* CMGT, CMGE */
         cond = u ? TCG_COND_GE : TCG_COND_GT;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b71ac2d0d5..31d3130e4c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -2946,13 +2946,11 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 #define GEN_CMP0(NAME, COND)                                            \
     static void gen_##NAME##0_i32(TCGv_i32 d, TCGv_i32 a)               \
     {                                                                   \
-        tcg_gen_setcondi_i32(COND, d, a, 0);                            \
-        tcg_gen_neg_i32(d, d);                                          \
+        tcg_gen_negsetcond_i32(COND, d, a, tcg_constant_i32(0));        \
     }                                                                   \
     static void gen_##NAME##0_i64(TCGv_i64 d, TCGv_i64 a)               \
     {                                                                   \
-        tcg_gen_setcondi_i64(COND, d, a, 0);                            \
-        tcg_gen_neg_i64(d, d);                                          \
+        tcg_gen_negsetcond_i64(COND, d, a, tcg_constant_i64(0));        \
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
@@ -3863,15 +3861,13 @@ void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 static void gen_cmtst_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
     tcg_gen_and_i32(d, a, b);
-    tcg_gen_setcondi_i32(TCG_COND_NE, d, d, 0);
-    tcg_gen_neg_i32(d, d);
+    tcg_gen_negsetcond_i32(TCG_COND_NE, d, d, tcg_constant_i32(0));
 }
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     tcg_gen_and_i64(d, a, b);
-    tcg_gen_setcondi_i64(TCG_COND_NE, d, d, 0);
-    tcg_gen_neg_i64(d, d);
+    tcg_gen_negsetcond_i64(TCG_COND_NE, d, d, tcg_constant_i64(0));
 }
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
-- 
2.34.1

