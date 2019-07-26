Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207825wrv;
        Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
X-Received: by 2002:a63:124a:: with SMTP id 10mr91871078pgs.254.1564163507694;
        Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163507; cv=none;
        d=google.com; s=arc-20160816;
        b=cPmWV2d1XipxjBMIfQzaYsmM41SoG4LQn9A/zSOolGVXGlyezoyrYK3UN0FIOFuyH8
         uwHWFtonNfTBwCupWc3c+HdO0nbbrsgM7DUOzWcq7jZPXp2gfTm8wQ7q3UdyeYE/4NVT
         Wqbpdi/IGDJ5yMUeYTbSJAbW+/6R9NopmVLvVmscP0wLcDnnoPla1tR1w54jLOkQGTzs
         thTi1XIIajUKPTlAygAKmi374mKu0eAupUZp5wWg1dcpQCzRtnAasnfkPffkq7aRwu93
         uRzzzmfWstfxL5m7iLBzcvgcrH60GMckSVyP7ffLpxTPXnyM2wp25TtKfI/Wh9PmY/tB
         G2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=8QVQ4BiqNc7iS0VjGNnUVyPSyENYZan6FBJAYfvLZTc=;
        b=qLQm26oAx0QkKL2wtUjVKYMBbeUX/v8T/4/Bf4tP7mwvcUIA7kdlvEkeHs/Wx4lHu8
         cZlbEfEDJnGgOIH3jSNMJBkL94koI+74ngBssgCMi0Me/IHbeBp72SNjC0aAfCYs/1u0
         mQOCBEHgWxFam73Nt7QU77VyualbaIGucCiJe+rjuue+pq/rnf0bx5lM5JqeNu5MgGxl
         pwJsKlRSSZ6L1/ZeibmhkOmCji6B2Rnh+jJAUFwNQA4AfECNX0aZth4Hm87rEYY1JekH
         B6QA/olw6zmFLVH5gehnyWRSfi0+U3Qqjmh0VCXacGI5sg6V4fVXrSAsrxjloTfxIHZo
         rZhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVe2eF5t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r69sor64479818pjb.8.2019.07.26.10.51.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVe2eF5t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8QVQ4BiqNc7iS0VjGNnUVyPSyENYZan6FBJAYfvLZTc=;
        b=QVe2eF5t5OwKctLNlKcL1Cp/S1HuU3u6npmInBLg3MDJTacCR0bML8eN+coRv0pbfv
         fLSOCeNWiPxy/8AIXOrKPgXvMkKY6Ff7QMEdesGKPqy70QVK5Z16zFslntSDkUbuKJyI
         oTbSy2oonDD3UwsbvTFlbPR2zK/GQfwyEcAbRMTJrKEi/oe7buRlUPd8tU1nk8KbP6ff
         S2jI7/EXaec4/SA2OYPJLcu6WhkrgmBh+cS5Vd3hR5GTZuZHV0HTSyEIFZ26YqbJ3rPK
         72tOnaeVDwDFU3fO/Ytap2znGT6mIglouuMwHztJHkLStwCWeMvpSLqpsjpufPaNUy+z
         Wvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8QVQ4BiqNc7iS0VjGNnUVyPSyENYZan6FBJAYfvLZTc=;
        b=V5CZpzQ6LmTu4CqL8AgTlTvutpAbW4uDNxcGupyMGrmQiupxnKVVxa+xNVkAZKQ74R
         K2fE8ritRCTwXkRdhD/Decd+Oz6dip+6bbaabIDvCEFbdp/3lVEdsnti+cOg8+5u4R0B
         7yaZMygN4tkrkMqBBaq5ycXB4GLeAi7xYI94ip3eNH8U5Nc+k5Vnf80/V8ze+KtyOmcs
         iSp9qrPlPdcDd4ZTmmFFVyjZWIn9XqVBY6/0iDvjKOS3dbitXyFsK5g6HYGYCkHVDRcv
         tKn2GbHem3N9hqoFBmEpCL9ua+TanjD3O0sgHSJxbuqsYV+WYq9kCVh6rmf5KAj1rt2u
         Zd5g==
X-Gm-Message-State: APjAAAWWHA9JnzGaQKy1/1eQzIkEWy7cDTD6akt1Hj04ghmJkvsVMMLh
	d94oXhGJi6kTOjaZHz5y/2zhsEkHcEBs/A==
X-Google-Smtp-Source: APXvYqz8ljBw/qlm89WBne2jFlT876lxaKbNtgC10rRL1yl+nmsFW1+FS2a/T8fI0YUdnfOArEgvLg==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id q70mr96449651pjq.69.1564163507269;
        Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 61/67] target/arm: Convert T16, shift immediate
Date: Fri, 26 Jul 2019 10:50:26 -0700
Message-Id: <20190726175032.6769-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: mz84eSFHdLdY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  |  8 ++++++++
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f3a946d8c9..f9022fe65c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10657,7 +10657,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift;
+    uint32_t val, rd;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10669,29 +10669,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     /* fall back to legacy decoder */
 
     switch (insn >> 12) {
-    case 0: case 1:
-
-        rd = insn & 7;
-        op = (insn >> 11) & 3;
-        if (op == 3) {
-            /*
-             * 0b0001_1xxx_xxxx_xxxx
-             *  - Add, subtract (three low registers)
-             *  - Add, subtract (two low registers and immediate)
-             * In decodetree.
-             */
-            goto illegal_op;
-        } else {
-            /* shift immediate */
-            rm = (insn >> 3) & 7;
-            shift = (insn >> 6) & 0x1f;
-            tmp = load_reg(s, rm);
-            gen_arm_shift_im(tmp, op, shift, s->condexec_mask == 0);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-        }
-        break;
+    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
     case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
         goto illegal_op;
     case 4:
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 17297a3032..ddffd073a2 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -126,6 +126,14 @@ ADD_rri         10101 rd:3 ........ \
 STM             11000 ... ........              @ldstm
 LDM_t16         11001 ... ........              @ldstm
 
+# Shift (immediate)
+
+@shift_i        ..... shim:5 rm:3 rd:3          &s_rrr_shi %s rn=%reg_0
+
+MOV_rrri        000 00 ..... ... ...            @shift_i shty=0  # LSL
+MOV_rrri        000 01 ..... ... ...            @shift_i shty=1  # LSR
+MOV_rrri        000 10 ..... ... ...            @shift_i shty=2  # ASR
+
 # Add/subtract (three low registers)
 
 @addsub_3       ....... rm:3 rn:3 rd:3 \
-- 
2.17.1
