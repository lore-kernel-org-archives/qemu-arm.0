Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp185323ejc;
        Mon, 10 Apr 2023 18:11:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350atbXOtqguHrofcWGPuU6KZXuhknM7rELdqJxXewnRzT9eTzLAGUKmzG/wX709R/+aI4Znw
X-Received: by 2002:ac8:7d44:0:b0:3e6:71d6:5d5b with SMTP id h4-20020ac87d44000000b003e671d65d5bmr21323101qtb.4.1681175505293;
        Mon, 10 Apr 2023 18:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175505; cv=none;
        d=google.com; s=arc-20160816;
        b=jJS1Bd7FN2o4oplAUdHDkNtV+C632FS4utzKlNRmTXbyU+xufmugNqCmzECFqa6xay
         iWMhMkZA6/LF5aXb/p3Itoeek2cGyaipr20egMRxKv24bmRLCOYd3InNk51SKz9RSXln
         xJBk8yaPDD4RoScWX97/dqp4kw6nZicTPkBzem8iuyWZzTsSuhwwdN4aYXghUXOTfXQE
         xHRy8SrFAAZaNoIzwnjNKL5yaifcEouTKdeaOZjhUdTHL7UN8o77N77douUpeGnF/j6S
         xhMdVuD6cdLeOBf3nfNH0WkIc9OnTWSMQCavTuWvpAy1Y0WGJPf+Er/5BsYbl83Zz5ZY
         VWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LV1DkoNVtzP7I71/XYjV3YLNXsXbI6vgEyZrR2VbPvk=;
        b=Y+n0zk8ZJe7vPNM/qIPiprd5fXi1QdSVe1KdKLAXsxNqakoUvgAbFaIIv2hn2emkIL
         5RXEPP4x2Ufz/jN6lszEeib4fW0iFuUWJ8SsyrvkqcQgI7XOTEAbYUzsvOR+4hnHFjZl
         HLJEI8sZWBnZxVdsejJP1bbj1lVVpzsH+zbVbu6WHcp10C7yw8tKy7DipRT7sCoV2Ius
         2cbKhK9MjvKPvSe2r2MkHssqm4NlVHKodQGA7GLQ8jVSlmuemrPbynmjhmaQ6L7kdXKi
         H1sYQQxxkwS8uKwOThUGgrh4V3N1C0rpCs3x36MY8Y28hCr0ZN/+ar0TOXm9wp+yDhmf
         VEEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+sEFdrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a205-20020ae9e8d6000000b0074601668a72si8434727qkg.379.2023.04.10.18.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+sEFdrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Wa-0004PG-6A; Mon, 10 Apr 2023 21:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WX-0003yb-AZ
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:17 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0001p8-MY
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:15 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 90-20020a17090a0fe300b0023b4bcf0727so6285408pjz.0
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LV1DkoNVtzP7I71/XYjV3YLNXsXbI6vgEyZrR2VbPvk=;
 b=o+sEFdrx9cvoUmwOUyrTQlSKVuItfS8u2QW6qTZ5EjmvTRYkY9OVEM5cQ1fv8TE8rp
 bYsp7YspYRajTYm0IO1EIMoPJIfe/DPP68Gxo/mq+uZKEgaAcBGmyjOSC7CPIRRJUAhB
 WKHAU0XInCwQrK32wHyv5mWAcRDiG2wK+2poPfLgh/bIWB9Mok7jNoby9JEGjcmr/aEg
 xb+W452xqskGCG34w9UU94BfzVLJHB3GS/+wx4x1BCgkQHfljmm2LGEJPznLhCHRZnsi
 xQCBhK5kO2Q/CRyIjsXOYsnpn8m68jjTuFUPohiuUfMtNY/XzBwhAvUMjLP7pBQ3MNYx
 frmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LV1DkoNVtzP7I71/XYjV3YLNXsXbI6vgEyZrR2VbPvk=;
 b=oMEbyy75xKocXoBUWHkV09kuZjZ7xCcy2G5EG8G+6MH6jsRB6fXUAhZXj4WwPGPr63
 9Kx+F35IRYuk43jPKwKNJNF4jYxSivxAQBQjq4V/q+q+4F4GAs9jkJhFfOA88BkOfdoF
 NVZ1v7zEDzcwm1e17nYVZADsPsHqpW+sc+16rI5MLRi/f3N9W4C2bU6nCQuLGnF2mTTG
 +OXt/Bk4p7dd1mbsnJCQxgtJS12lLQn0hzQ+WT9a1+lfYTKDLo5qwRb/ulze5YRsiCqM
 /9WhMsQjdcpuUVlsPWNprr3XcYpr/43dX5GJrlnCahmbqSDNQZ3C8HvBlntvqsDVxk2e
 A1yA==
X-Gm-Message-State: AAQBX9fAAanuMhF27hVOIACEVjSD0dKNjUUeN4x18hveOeTP2rzMG1eD
 WoN/tkPxOEl9i/ZoFHBNsbTh/A==
X-Received: by 2002:a17:902:ced1:b0:19c:be03:d1ba with SMTP id
 d17-20020a170902ced100b0019cbe03d1bamr17613994plg.6.1681175409855; 
 Mon, 10 Apr 2023 18:10:09 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 45/54] tcg/loongarch64: Simplify constraints on qemu_ld/st
Date: Mon, 10 Apr 2023 18:05:03 -0700
Message-Id: <20230411010512.5375-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: DxhGuIv5YTHb

The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 --
 tcg/loongarch64/tcg-target-con-str.h |  1 -
 tcg/loongarch64/tcg-target.c.inc     | 23 ++++-------------------
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 172c107289..c2bde44613 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,9 +17,7 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(LZ, L)
 C_O1_I1(r, r)
-C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index 541ff47fa9..6e9ccca3ad 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -14,7 +14,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 5ecae7cef0..23a8dbde5f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -133,18 +133,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
 
-#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
-/*
- * For softmmu, we need to avoid conflicts with the first 5
- * argument registers to call the helper.  Some of these are
- * also used for the tlb lookup.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
-#else
-#define SOFTMMU_RESERVE_REGS  0
-#endif
-
+#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
 static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 {
@@ -1583,16 +1572,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(LZ, L);
-
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1628,11 +1615,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
-        return C_O1_I1(r, r);
-
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, L);
+        return C_O1_I1(r, r);
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-- 
2.34.1

