Received: by 10.28.4.212 with SMTP id 203csp1219395wme;
        Wed, 2 May 2018 15:16:10 -0700 (PDT)
X-Received: by 2002:a63:91c4:: with SMTP id l187-v6mr17344255pge.261.1525299370868;
        Wed, 02 May 2018 15:16:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299370; cv=none;
        d=google.com; s=arc-20160816;
        b=aNmEttCG06CYaIGFpqyvM5II4N5A3YgiMhGeFk9FIIeKJ3c8JdnfcBQU9eK9uxHxV2
         oPQdnOlxZmReBpSa3+L2jdIbP7J8mXft0BEovQb5iaoUcs479+bnFxPNCV/+K6ktiZ6o
         BunD+UwVIAK9/N+TmaGFG+12hqf7hAAHe9KvpX9at30iqVStAxpeRKUj8tZCajm+OX60
         U4Ef68+gNsZoXc/SlODdG6BA1Jg95TplMlS9a0KQhJQ8nz6aJ28w8ze7ZkS5glYXe6kJ
         aavEcFe05XmtqpK4rqcnb/4RX7JDcY68SYXgaGT66NfNy+OGqT21+qJfRANCeQ0mGLPt
         52ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=Qjy5KDciNnwaKwZSWdv3Ve9BMVD2CqGha4QSuIzajro=;
        b=TXgLKesiYWdQtNH3DbtGiTWzc6Y5G8rsVR7gveDxK5Ynlmb3s/KRZ5VHBifAk2l2UB
         +vv89z+2Ux7dHFQAKW9fU+ua5BlB3mLcuH0CHj0fnVbLkf2gUZ2xb/X++5WgpgGEBMie
         cCrG4hFSRBBIpelwwyoOq91bl95nowlsYXAp8QsovtVqkkN7Z0OycoOtyFGF8/5eA+PW
         kCCHDWXWoLH0g7U+Zed+TUzcKfNCTgyPdYQKyQNrsyet3l8nCZTxQOqB3RCsCgGa4ir5
         o+invuUnlArSZCyL2jIVG844sQUQpf6i3G5dzXPrvnsJFL4EAug1gN4z3ypbEquoVshS
         dRUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Foz0SZTs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f5-v6sor1155777pgn.349.2018.05.02.15.16.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 15:16:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Foz0SZTs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qjy5KDciNnwaKwZSWdv3Ve9BMVD2CqGha4QSuIzajro=;
        b=Foz0SZTsRtXezzTitqGfd9EvbKbbstdiZ/GqNJAnnM3NTm/IYL0dETN5Hm0AAb+0Wt
         HgUooCugVqokRG0/YveMbEQhmiPANlSUXPeP7YbI+0LHKuZTvb9rUTTzq7kkagnFIi7l
         dNDe9Seqm2p9UPwJ7n6jaTOXcmxAvMYbCsCBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qjy5KDciNnwaKwZSWdv3Ve9BMVD2CqGha4QSuIzajro=;
        b=s8vo0pBCjUDysyfP9c+JEpDFSF2LHQkVhuMxowrq2CVJHtPx39OMo4ioWfhX6Tq9k1
         v9G6H2mZhuATt5XatiS3v5r0K3ivqQ5+7/N2kZ/Fz4PnqAOyMgu4nf1k2SSlPvu9JKJr
         YR20mWo57gcyq0dgeRp6xRzRFOyl94clPpBDSYeH+/yjLP0IEjPOlnmCt2xDKnoTbW/Q
         FUvxQY5dnU4ADEOFbfnO3dZmu43w6u3BpefBjAfF4svOEPnyKr2/BKrqurnPmdxSqVRi
         vK2ZYGQJoigDKsgf7o+TutDy2x81EwCQrTHJ+9jXrzx5P9agnkyfJvhpULuR6GJR+S3v
         xDLw==
X-Gm-Message-State: ALQs6tCtryTKfMfFp/iXHiX8cLEI1WP1oYrGv1nj46oa4afOrKk5vD00
	hEV6ACoeAHoXJlyIQ7xZraADVUEa
X-Google-Smtp-Source: AB8JxZqNaJ0DtwmvV5wJPEUnvH8XLKYzXZ10C8uaMghiNk8FiNsKXj4HBFygmKsGgGxpfituCanYMw==
X-Received: by 2002:a65:4e03:: with SMTP id r3-v6mr17674540pgt.121.1525299370415;
        Wed, 02 May 2018 15:16:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id 65sm26170145pft.74.2018.05.02.15.16.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 15:16:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 12/14] target/arm: Implement FCSEL for fp16
Date: Wed,  2 May 2018 15:15:50 -0700
Message-Id: <20180502221552.3873-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4DgFpYS3ldtY

From: Alex Bennée <alex.bennee@linaro.org>

These were missed out from the rest of the half-precision work.

Cc: qemu-stable@nongnu.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[rth: Fix erroneous check vs type]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f0aca20771..1ea5185f14 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4666,15 +4666,34 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     unsigned int mos, type, rm, cond, rn, rd;
     TCGv_i64 t_true, t_false, t_zero;
     DisasCompare64 c;
+    TCGMemOp sz;
 
     mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2); /* 0 = single, 1 = double */
+    type = extract32(insn, 22, 2);
     rm = extract32(insn, 16, 5);
     cond = extract32(insn, 12, 4);
     rn = extract32(insn, 5, 5);
     rd = extract32(insn, 0, 5);
 
-    if (mos || type > 1) {
+    if (mos) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch(type) {
+    case 0:
+        sz = MO_32;
+        break;
+    case 1:
+        sz = MO_64;
+        break;
+    case 3:
+        sz = MO_16;
+        if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            break;
+        }
+        /* fallthru */
+    default:
         unallocated_encoding(s);
         return;
     }
@@ -4683,11 +4702,11 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* Zero extend sreg inputs to 64 bits now.  */
+    /* Zero extend sreg & hreg inputs to 64 bits now.  */
     t_true = tcg_temp_new_i64();
     t_false = tcg_temp_new_i64();
-    read_vec_element(s, t_true, rn, 0, type ? MO_64 : MO_32);
-    read_vec_element(s, t_false, rm, 0, type ? MO_64 : MO_32);
+    read_vec_element(s, t_true, rn, 0, sz);
+    read_vec_element(s, t_false, rm, 0, sz);
 
     a64_test_cc(&c, cond);
     t_zero = tcg_const_i64(0);
@@ -4696,7 +4715,7 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(t_false);
     a64_free_cc(&c);
 
-    /* Note that sregs write back zeros to the high bits,
+    /* Note that sregs & hregs write back zeros to the high bits,
        and we've already done the zero-extension.  */
     write_fp_dreg(s, rd, t_true);
     tcg_temp_free_i64(t_true);
-- 
2.14.3
