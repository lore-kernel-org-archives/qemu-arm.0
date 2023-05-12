Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842770ejq;
        Fri, 12 May 2023 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Hhxlz4IBnBlwUG5jg0gDKTfmwM0lFvqWf53vqOdcbQ1XY6X2txTS8FXDCxuZhuYymS8ZF
X-Received: by 2002:a05:6214:528b:b0:621:44ee:7065 with SMTP id kj11-20020a056214528b00b0062144ee7065mr18191109qvb.9.1683902602018;
        Fri, 12 May 2023 07:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902601; cv=none;
        d=google.com; s=arc-20160816;
        b=LVAJtWRBDiGjbA3gEDRvMspH31J3sTluQkfsu4RDblkWTvGLSp8vwznGDLGcE1cs3D
         ip5XxnC9oLSSe4F0rksry0+2lFdPS6nR8bJyL6HVRE+W2IzBwGH7nijV+ZI7CCKFoOcu
         i7Y9JWaB6pSsHP4/ugwU3EbPRvd/j6FdThqtrLyd1iESUEYQVX+3E/gy1J+0dG7Q/bSD
         A/omBGvbdPYuOSHGaPxcQ12vRt6ARx0SYvsDbcE3BjGJQ7lAl67cnHb5Y4ki5y6of4hU
         IoA/qbVyMY6q68/bpJ/O1r1OsI/NAjEKX3vnAye6M5E1jix8mv6DjgdCuIPxw18fCTu3
         9u5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=frqXOGogEVBk8JyygFWcnqFlkBDGHEdOnDw7HOu9/7M=;
        b=jws0x+nyY6Cea++FebCFVE72A/eSGXyZfMZQQUNOEz6YxU9+j7HtAvTNMV9SptAEfE
         YTH+xdSEuDWioNTj8wSG9DUb+wTOKBixilERsd91dU83xkQWaGDtahioxsp7xaAAbQwy
         2W0cQHKxw06k0KoH9LZOpPZA6nLQPkAqQyvli/XIkXhXqHmUXrgSC2yQbDT/+/qOkj6I
         du66eC2yNgiobqLOx9INn8Vz+uj9soaf1Zw7dSWWsDXO27S92VyeckDz3iEHszOwaGx8
         fwfshobFq5CMSEDfZDQBTjYGL5mwItNv82kOroiPMTOZsXzojNflXHWN7U9XNq28mDHF
         J3fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2jGYeUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a056214202400b0061a07f758b8si5824549qvf.210.2023.05.12.07.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2jGYeUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxU-0006vC-Ua; Fri, 12 May 2023 10:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxT-0006uA-Ij
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxH-0004hl-VC
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso47236205e9.1
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902470; x=1686494470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frqXOGogEVBk8JyygFWcnqFlkBDGHEdOnDw7HOu9/7M=;
 b=L2jGYeUJ91L9SrZS2hUvj+PBeNDTthLHkHDr3tVMIgBnqFDLOp4rMphCVqGTFfjeUe
 +/Iv6hL9fKg/gHG5xA1aPrKP7a36lUKaCJabo+Lisq/GIWI7SAVcMsaXeuMlpeF3lRkm
 kBm3yG8iq9O6KvBcxkhkUeO6ZXYOlRu/bWT5HWFDwQTjs7tJl1eQKWNjry7GAgCs2RV7
 uHb4FpAQTEktZqgvnv0RsHuPhTnFXHjxhZdkza0YIh1mmBoJ51STsxuGcSqyjtiEbybZ
 9lGgqP9GY8xTXx4IevD9/qXGmgW8o8UPWjNukZgwj9oqfSD+qI88BHV9zmVOO5ptwi6f
 IfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902470; x=1686494470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frqXOGogEVBk8JyygFWcnqFlkBDGHEdOnDw7HOu9/7M=;
 b=NyWkJA3F25+TyqsfV59nKrFaDc824lFgGGToW1S9VFuEgogc0MTDAAuWCKdC0asGIt
 eWhRjEPDqLynLo6XRmHEFD/oOup3ZWbFPf1LpHKdSnBVwepTze/5aKbAx9esBvdCRNmr
 BOzy9yBbKaS88UtWd8h0K+iZwrxldVQaMZE2Bmn9Q4Lx+pL0JFkrZ9BVUzuoe5R6Wigj
 0rOPiC3aq/iZfJp2H2SZT5TZYtiNSpfm9aZvQcbzqhMcz5drIs6pOqiFnP5MitMJvqwR
 P848V4A7WWjV5UGZHZz9tPzxpZ7/6PYpZB6T9W5HSc4klWJk+FSfOyJ1Eh55M2l+Yadb
 GXcA==
X-Gm-Message-State: AC+VfDzvaI2POu8SbynN2eBYTlEl9+NVgrQYnEtC4gJKYsA4G622XUse
 6esIMI/qW1bJ5t/ZD49y13vhjs/u0BCa1tzXeIc=
X-Received: by 2002:a1c:7303:0:b0:3f1:6e88:5785 with SMTP id
 d3-20020a1c7303000000b003f16e885785mr17723289wmb.14.1683902470501; 
 Fri, 12 May 2023 07:41:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/20] target/arm: Split gen_add_CC and gen_sub_CC
Date: Fri, 12 May 2023 15:40:51 +0100
Message-Id: <20230512144106.3608981-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: Pfbsl9pNQ/8a

From: Richard Henderson <richard.henderson@linaro.org>

Split out specific 32-bit and 64-bit functions.
These carry the same signature as tcg_gen_add_i64,
and so will be easier to pass as callbacks.

Retain gen_add_CC and gen_sub_CC during conversion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 149 +++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 65 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ce3e8b1d08e..a3bccbd708a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -682,83 +682,102 @@ static inline void gen_logic_CC(int sf, TCGv_i64 result)
 }
 
 /* dest = T0 + T1; compute C, N, V and Z flags */
+static void gen_add64_CC(TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
+{
+    TCGv_i64 result, flag, tmp;
+    result = tcg_temp_new_i64();
+    flag = tcg_temp_new_i64();
+    tmp = tcg_temp_new_i64();
+
+    tcg_gen_movi_i64(tmp, 0);
+    tcg_gen_add2_i64(result, flag, t0, tmp, t1, tmp);
+
+    tcg_gen_extrl_i64_i32(cpu_CF, flag);
+
+    gen_set_NZ64(result);
+
+    tcg_gen_xor_i64(flag, result, t0);
+    tcg_gen_xor_i64(tmp, t0, t1);
+    tcg_gen_andc_i64(flag, flag, tmp);
+    tcg_gen_extrh_i64_i32(cpu_VF, flag);
+
+    tcg_gen_mov_i64(dest, result);
+}
+
+static void gen_add32_CC(TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
+{
+    TCGv_i32 t0_32 = tcg_temp_new_i32();
+    TCGv_i32 t1_32 = tcg_temp_new_i32();
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    tcg_gen_movi_i32(tmp, 0);
+    tcg_gen_extrl_i64_i32(t0_32, t0);
+    tcg_gen_extrl_i64_i32(t1_32, t1);
+    tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, tmp, t1_32, tmp);
+    tcg_gen_mov_i32(cpu_ZF, cpu_NF);
+    tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
+    tcg_gen_xor_i32(tmp, t0_32, t1_32);
+    tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
+    tcg_gen_extu_i32_i64(dest, cpu_NF);
+}
+
 static void gen_add_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 {
     if (sf) {
-        TCGv_i64 result, flag, tmp;
-        result = tcg_temp_new_i64();
-        flag = tcg_temp_new_i64();
-        tmp = tcg_temp_new_i64();
-
-        tcg_gen_movi_i64(tmp, 0);
-        tcg_gen_add2_i64(result, flag, t0, tmp, t1, tmp);
-
-        tcg_gen_extrl_i64_i32(cpu_CF, flag);
-
-        gen_set_NZ64(result);
-
-        tcg_gen_xor_i64(flag, result, t0);
-        tcg_gen_xor_i64(tmp, t0, t1);
-        tcg_gen_andc_i64(flag, flag, tmp);
-        tcg_gen_extrh_i64_i32(cpu_VF, flag);
-
-        tcg_gen_mov_i64(dest, result);
+        gen_add64_CC(dest, t0, t1);
     } else {
-        /* 32 bit arithmetic */
-        TCGv_i32 t0_32 = tcg_temp_new_i32();
-        TCGv_i32 t1_32 = tcg_temp_new_i32();
-        TCGv_i32 tmp = tcg_temp_new_i32();
-
-        tcg_gen_movi_i32(tmp, 0);
-        tcg_gen_extrl_i64_i32(t0_32, t0);
-        tcg_gen_extrl_i64_i32(t1_32, t1);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, tmp, t1_32, tmp);
-        tcg_gen_mov_i32(cpu_ZF, cpu_NF);
-        tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
-        tcg_gen_xor_i32(tmp, t0_32, t1_32);
-        tcg_gen_andc_i32(cpu_VF, cpu_VF, tmp);
-        tcg_gen_extu_i32_i64(dest, cpu_NF);
+        gen_add32_CC(dest, t0, t1);
     }
 }
 
 /* dest = T0 - T1; compute C, N, V and Z flags */
+static void gen_sub64_CC(TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
+{
+    /* 64 bit arithmetic */
+    TCGv_i64 result, flag, tmp;
+
+    result = tcg_temp_new_i64();
+    flag = tcg_temp_new_i64();
+    tcg_gen_sub_i64(result, t0, t1);
+
+    gen_set_NZ64(result);
+
+    tcg_gen_setcond_i64(TCG_COND_GEU, flag, t0, t1);
+    tcg_gen_extrl_i64_i32(cpu_CF, flag);
+
+    tcg_gen_xor_i64(flag, result, t0);
+    tmp = tcg_temp_new_i64();
+    tcg_gen_xor_i64(tmp, t0, t1);
+    tcg_gen_and_i64(flag, flag, tmp);
+    tcg_gen_extrh_i64_i32(cpu_VF, flag);
+    tcg_gen_mov_i64(dest, result);
+}
+
+static void gen_sub32_CC(TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
+{
+    /* 32 bit arithmetic */
+    TCGv_i32 t0_32 = tcg_temp_new_i32();
+    TCGv_i32 t1_32 = tcg_temp_new_i32();
+    TCGv_i32 tmp;
+
+    tcg_gen_extrl_i64_i32(t0_32, t0);
+    tcg_gen_extrl_i64_i32(t1_32, t1);
+    tcg_gen_sub_i32(cpu_NF, t0_32, t1_32);
+    tcg_gen_mov_i32(cpu_ZF, cpu_NF);
+    tcg_gen_setcond_i32(TCG_COND_GEU, cpu_CF, t0_32, t1_32);
+    tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
+    tmp = tcg_temp_new_i32();
+    tcg_gen_xor_i32(tmp, t0_32, t1_32);
+    tcg_gen_and_i32(cpu_VF, cpu_VF, tmp);
+    tcg_gen_extu_i32_i64(dest, cpu_NF);
+}
+
 static void gen_sub_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 {
     if (sf) {
-        /* 64 bit arithmetic */
-        TCGv_i64 result, flag, tmp;
-
-        result = tcg_temp_new_i64();
-        flag = tcg_temp_new_i64();
-        tcg_gen_sub_i64(result, t0, t1);
-
-        gen_set_NZ64(result);
-
-        tcg_gen_setcond_i64(TCG_COND_GEU, flag, t0, t1);
-        tcg_gen_extrl_i64_i32(cpu_CF, flag);
-
-        tcg_gen_xor_i64(flag, result, t0);
-        tmp = tcg_temp_new_i64();
-        tcg_gen_xor_i64(tmp, t0, t1);
-        tcg_gen_and_i64(flag, flag, tmp);
-        tcg_gen_extrh_i64_i32(cpu_VF, flag);
-        tcg_gen_mov_i64(dest, result);
+        gen_sub64_CC(dest, t0, t1);
     } else {
-        /* 32 bit arithmetic */
-        TCGv_i32 t0_32 = tcg_temp_new_i32();
-        TCGv_i32 t1_32 = tcg_temp_new_i32();
-        TCGv_i32 tmp;
-
-        tcg_gen_extrl_i64_i32(t0_32, t0);
-        tcg_gen_extrl_i64_i32(t1_32, t1);
-        tcg_gen_sub_i32(cpu_NF, t0_32, t1_32);
-        tcg_gen_mov_i32(cpu_ZF, cpu_NF);
-        tcg_gen_setcond_i32(TCG_COND_GEU, cpu_CF, t0_32, t1_32);
-        tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
-        tmp = tcg_temp_new_i32();
-        tcg_gen_xor_i32(tmp, t0_32, t1_32);
-        tcg_gen_and_i32(cpu_VF, cpu_VF, tmp);
-        tcg_gen_extu_i32_i64(dest, cpu_NF);
+        gen_sub32_CC(dest, t0, t1);
     }
 }
 
-- 
2.34.1

