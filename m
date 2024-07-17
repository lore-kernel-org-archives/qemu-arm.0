Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615585njk;
        Tue, 16 Jul 2024 23:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSEKXk7jg+DFNwGQMSwazw25eJygDL8yxJc8STSW/+XPVR2FPt/RTJ5NN/NP58fLUaAvk+3ZCADya1jkLyzOP7SDxFUw3K
X-Google-Smtp-Source: AGHT+IGvjxSXLYLBg4yMKTVAqheKLaae24yuBTcmnk8Za0oh8ZjgOZb2tdIOJI7GlrXlreBHg3h2
X-Received: by 2002:a05:622a:1445:b0:447:f301:3a36 with SMTP id d75a77b69052e-44f86046ab8mr10493991cf.0.1721196705576;
        Tue, 16 Jul 2024 23:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196705; cv=none;
        d=google.com; s=arc-20160816;
        b=tOSiFQQduPgHsXxpwo5utEONOW49k/EFoS9kpSAebCXlI2PaMP5x7dNMdQvC7S34Dk
         oz+ShWwtHq9G5mOziWG6CuhRdm2Fiqlwq3s3hzURxyzP4dxqyuMSaJE8OXVvIlTqO/Td
         hFYyZdHwkVW3Vy0T/RpsAkZoLMZI1AH/i+tfqpgUvfI7CgKpAJn2TR3yeEZJ4w3Qa/yp
         dqkQ3FM+Y5rucWt2xR2xEqyknhPbB3oQZpDSWf3ySufxBFt1b5yWy2v4ENaMIFGTwn7h
         MmpHtwdm+JHeUMwLfSlDJzm0lRGnpdmIncc2Od2c7zUDdNz+Z5sD33e6vJsnOv2DwsbI
         C+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L50cMFgY8xp9UNkN7NVIRy+rY10HarTYUNyP2m/NWeU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=wGN7+2ulGDBndBOVOLh6Fe7SX+p8a4+YIiuGnlFf5wlQWvKhdvVHudRW/TnlNsuhFk
         gFkgrEpKLCJgX1oAOsrbgS9BU9K/9Y84aZfH4ZzCgmbMQRq78oultvOpJh/zqtf+4AQv
         HhB0Bu9yr9yS0tCd0ijl9tWB8U4X028i1/ra8mwWYpLx6AdfXztdTS2iFuhPH+tGQPYl
         ISDBlwcToqkOntJqnT7Gm3nG3cNBUxSdQ2zWrS/0MB0BylrGcmItBYZT5URdJps1Kjif
         QJBhzhsV8KPbY1U8bORZhRWJA/HKG7tJF5erUQVJS4oD8jPNwBKw0q0ngQJPmkwyJju5
         grvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IsQp/wZD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b813951si92212471cf.590.2024.07.16.23.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IsQp/wZD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxr5-0004N3-Ho; Wed, 17 Jul 2024 02:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqs-0003gX-1H
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:22 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqq-00030y-Au
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:21 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7037a208ff5so3790051a34.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196559; x=1721801359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L50cMFgY8xp9UNkN7NVIRy+rY10HarTYUNyP2m/NWeU=;
 b=IsQp/wZDpu8zLgwZAb0SbFhmaMOsmMnQ4UKFX3/VppMXOjkux3SW+KDFI2N/Bp6+8F
 ASz2BDceSrwj4mD3ucP4rL9+nLKJTkVDj8Q9zRFwMI+EJ8/CbzG6FD+kXjggrbZVabzo
 fo322R/pORCFszttDv/1jBG8CO7ckXGFJKxOFdPTEy7rd4siYhCrm7kvnVUqvbC277PI
 N4sB5dJRhAMfP9/QkAaflm3J8pketNVs7IIPQIG7Q3G9WAknPlSKpf+49sqjvcQaY2bj
 DTmm3UYmjvDWlADzKiNNtBYuLHGoCDwkKf6MbHlQzEhf1TnPvc5DQuOBXQtKG3QdFxgn
 0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196559; x=1721801359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L50cMFgY8xp9UNkN7NVIRy+rY10HarTYUNyP2m/NWeU=;
 b=JcjkW4Z9t/+0iFHNVPZgYr/jXcdzi4Ftld35cWxnO1jdHZvDrWMOMmin/fbd3JNAbT
 FqKwasPnpPD9u56x3t4bRNKScJkggCoktbj7aLH3yqiOg/yN7HCykqfc2kV4TqdyT0tQ
 Ie+g21D24qmb5pGV2YVTNi6Yk8yPcyQMwJ4swSk+JzasPPE2JbHVWCGw4PUfsgaBtX8q
 6s3tYQfrW6hWA5f3ZSingkSGZXiQ+Wa2qMux2jfUcPY5WIR/l3jjaop0t3Hu7VNiUgWj
 o02sMriVhLH5nRX7lUu34Oorpv6A/QZ0ezw9wPeKBtlePzEgEKubjAxO83CLLFRugbvG
 iBZg==
X-Gm-Message-State: AOJu0YxQACHbKXH7aRU+PNaAEj7m5YlZkrR7vuQHs1SrQAG55suvhMvH
 5NMLdVO6jAPCXz8YveWx+F58kvd2IoclTkwNpfaScHqSihggoKjSjpATUa20dnq/7NB2JxWfuTV
 ygH4=
X-Received: by 2002:a05:6830:4181:b0:703:ba24:7320 with SMTP id
 46e09a7af769-708e378942fmr913594a34.10.1721196558470; 
 Tue, 16 Jul 2024 23:09:18 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/17] target/arm: Convert TBL, TBX to decodetree
Date: Wed, 17 Jul 2024 16:08:49 +1000
Message-ID: <20240717060903.205098-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: uJ+XRRHJNgI/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 47 ++++++++++------------------------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6ca24d9842..7e3bde93fe 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4657,6 +4657,20 @@ static bool trans_EXTR(DisasContext *s, arg_extract *a)
     return true;
 }
 
+static bool trans_TBL_TBX(DisasContext *s, arg_TBL_TBX *a)
+{
+    if (fp_access_check(s)) {
+        int len = (a->len + 1) * 16;
+
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rm), tcg_env,
+                           a->q ? 16 : 8, vec_full_reg_size(s),
+                           (len << 6) | (a->tbx << 5) | a->rn,
+                           gen_helper_simd_tblx);
+    }
+    return true;
+}
+
 /*
  * Cryptographic AES, SHA, SHA512
  */
@@ -8897,38 +8911,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-/* TBL/TBX
- *   31  30 29         24 23 22  21 20  16 15  14 13  12  11 10 9    5 4    0
- * +---+---+-------------+-----+---+------+---+-----+----+-----+------+------+
- * | 0 | Q | 0 0 1 1 1 0 | op2 | 0 |  Rm  | 0 | len | op | 0 0 |  Rn  |  Rd  |
- * +---+---+-------------+-----+---+------+---+-----+----+-----+------+------+
- */
-static void disas_simd_tb(DisasContext *s, uint32_t insn)
-{
-    int op2 = extract32(insn, 22, 2);
-    int is_q = extract32(insn, 30, 1);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    int is_tbx = extract32(insn, 12, 1);
-    int len = (extract32(insn, 13, 2) + 1) * 16;
-
-    if (op2 != 0) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rm), tcg_env,
-                       is_q ? 16 : 8, vec_full_reg_size(s),
-                       (len << 6) | (is_tbx << 5) | rn,
-                       gen_helper_simd_tblx);
-}
-
 /* ZIP/UZP/TRN
  *   31  30 29         24 23  22  21 20   16 15 14 12 11 10 9    5 4    0
  * +---+---+-------------+------+---+------+---+------------------+------+
@@ -11792,7 +11774,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     /* simd_mod_imm decode is a subset of simd_shift_imm, so must precede it */
     { 0x0f000400, 0x9ff80400, disas_simd_mod_imm },
     { 0x0f000400, 0x9f800400, disas_simd_shift_imm },
-    { 0x0e000000, 0xbf208c00, disas_simd_tb },
     { 0x0e000800, 0xbf208c00, disas_simd_zip_trn },
     { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 05927fade6..45896902d5 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1141,3 +1141,7 @@ FNMSUB          0001 1111 .. 1 ..... 1 ..... ..... .....    @rrrr_hsd
 
 EXT_d           0010 1110 00 0 rm:5 00 imm:3 0 rn:5 rd:5
 EXT_q           0110 1110 00 0 rm:5 0  imm:4 0 rn:5 rd:5
+
+# Advanced SIMD Table Lookup
+
+TBL_TBX         0 q:1 00 1110 000 rm:5 0 len:2 tbx:1 00 rn:5 rd:5
-- 
2.43.0

