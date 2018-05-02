Received: by 10.28.4.212 with SMTP id 203csp1219418wme;
        Wed, 2 May 2018 15:16:12 -0700 (PDT)
X-Received: by 2002:a65:650a:: with SMTP id x10-v6mr13212793pgv.169.1525299372136;
        Wed, 02 May 2018 15:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299372; cv=none;
        d=google.com; s=arc-20160816;
        b=JyUmeNKlYph1Nr79qy9OFrUaJyTtPyCHXUgLYWK6Ere6Ti2fyL3hjgcoDuabghB9Rt
         rFHdwvYmbuJcfAWxJQebIEpUQBcZddsuNnlJP7aTPHFok5WgEgW/W2tUxwclBVfYUowT
         fAn8mDRJ3R9Wd+xlrFjMhlkMchAzjHo3stw4YXpOlqrAg1qF+pj1MJgsRjRH0vHtg8vK
         PS97Iq9Vmjf9GbLbilAXWOqLifJGBngN+xdASiLfvMZSexb1VmWti9xUMYcB1b3PNhrH
         sjalU/skFMymiwfw5Go1GsAg4vnzh75HpGEIECZTKu/KHClbgMhEkyGiJqGRESP+3HWY
         OutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=/7J+dDkSM4Xa1wJSgJjRgLbXvJcp4wTSzR2jMj2N0bo=;
        b=eq8nG5qG6PQIkdBZH67YhJHQQRIhd5hTLJU4a+kUU8BdmoJ19PgKBXDrYz2uqQeVH/
         yy6hXs33bVTssHfpA6RRv+EvbDscZsObGkbw3pafg9CPWn3zI1JFIsl+4Qj2iA+7UEan
         pLIQrn5RW9uZZ7dMSwTgj/Urnn7ND4KXBIBTFd3vlwAMPlTiAR8ab66ScSKyftZi7Wak
         n/I9gr1NCf68wLX4gD28xz6aUnfKvAEna/6I6FrGVpaZyepF0ctc3Yw+KVtYzIL/F5j5
         hRYbbdneE+I0RALfk2G3YTsLPDOfe6jD9S2t1FHbO12g4yP6OROB4Ml4WZbUpf8NG9D2
         Sfzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jglgpfj8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bh5-v6sor4362241plb.7.2018.05.02.15.16.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 15:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jglgpfj8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7J+dDkSM4Xa1wJSgJjRgLbXvJcp4wTSzR2jMj2N0bo=;
        b=jglgpfj8DC/RkpFTtU7vE3OR4pf+ON78LNY9WZmzws6i+pUNZALYLywCxLS3sTjmoa
         14Wjq8YEYC4LDPMAZlRV5qj4URehqV40eCTQRSP+sns2ckeiAtV28pdbMMuHCIWHxL6L
         01rU+3bLJcIHOYryAvX3JHFkFAf/2ZI+yZIEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7J+dDkSM4Xa1wJSgJjRgLbXvJcp4wTSzR2jMj2N0bo=;
        b=Dm0Zm/+IVuNvFJZoZOukvwQ5YixaG+qbrw9huh8dUqgpEhvsCMrcyzzlG52RVFvTkL
         Z8FliINprN4guM0RS2V2H+5/gFEkLGcD+n3Ej78NIj4wvEocL67PJe8+GWx4pmNbFfnf
         5VyDgD44K2hBl4EA/BJvvqeX8DV9Xh+J8h/nJUnmMpQeaZeQp/D8t2uUJUO/ziVPYzM2
         G4e7xSE/nDSaKXa/5M3h4Xc9MJ8ABAU8Mit+HNDRIIrFOjTXnh6guYpW9sIAjFgjpIap
         Qm7kcmapFnIH3oLspAF2TWCDXmigPJp0v1TD+aQot16m/945wg1+hNgxNePT7swq4yln
         adNw==
X-Gm-Message-State: ALQs6tAVA2GvT9UDd8C1vD+klY0723EUunLipJDx4zNs2Uye6MFcmKAZ
	Uv23TbpeWiTpAgh2wgjgyw9/bkWw
X-Google-Smtp-Source: AB8JxZpv4NiE6j0ciqOw7SonTa8zQJnD4ZmLY5ZUluEkjpDMfP3zcR0q0qPWfh8O/tmIHdIAk+QqBA==
X-Received: by 2002:a17:902:76c1:: with SMTP id j1-v6mr21452037plt.284.1525299371717;
        Wed, 02 May 2018 15:16:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id 65sm26170145pft.74.2018.05.02.15.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 15:16:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 13/14] target/arm: Implement FMOV (immediate) for fp16
Date: Wed,  2 May 2018 15:15:51 -0700
Message-Id: <20180502221552.3873-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BbuDPTf8Gk5O

From: Alex Bennée <alex.bennee@linaro.org>

All the hard work is already done by vfp_expand_imm, we just need to
make sure we pick up the correct size.

Cc: qemu-stable@nongnu.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[rth: Merge unallocated_encoding check with TCGMemOp conversion.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1ea5185f14..b73d6d96cd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5437,11 +5437,25 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
 {
     int rd = extract32(insn, 0, 5);
     int imm8 = extract32(insn, 13, 8);
-    int is_double = extract32(insn, 22, 2);
+    int type = extract32(insn, 22, 2);
     uint64_t imm;
     TCGv_i64 tcg_res;
+    TCGMemOp sz;
 
-    if (is_double > 1) {
+    switch (type) {
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
@@ -5450,7 +5464,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t insn)
         return;
     }
 
-    imm = vfp_expand_imm(MO_32 + is_double, imm8);
+    imm = vfp_expand_imm(sz, imm8);
 
     tcg_res = tcg_const_i64(imm);
     write_fp_dreg(s, rd, tcg_res);
-- 
2.14.3
