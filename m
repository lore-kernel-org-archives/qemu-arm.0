Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087384lfc;
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
X-Received: by 2002:a17:90a:5285:: with SMTP id w5mr5943556pjh.77.1584042157834;
        Thu, 12 Mar 2020 12:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042157; cv=none;
        d=google.com; s=arc-20160816;
        b=FoaKOajAXs5nDjc11tcE56mYUhXZ+HQAI50FFAn58tkyJNt2o7O1iTu5JDaQh3QoiZ
         iA1eQH+/PfkgtN91m2jHCqBqNoFqScVwZwYHNzlghhmo1MEGzjkFBoDdL5/WWPxTgSqI
         TdO2uS2oc+QIQbcgFWgjILnQ2l6352LxqsrOSXZsPx7wr28cAts3ZTCYdp1xb872uOc2
         M1MC+YtdmMmjEz7EXVNMS+32X7sNvFSh6DLUNceNDOg3jnOfJe0EI6izzsXo3R3DOsEI
         dwuuaOwhZ/gg/hdAd33mICuNoE79msBiK5s1PhG8evKUOOCTLgHbauLoz0YS2TO7CwJD
         vGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+pq9oFT7R9IJPpeslQpwFqiLS0a1utLd0OoEdcej/ZM=;
        b=UJdMO9iSyS3aMVHKhkFBDVuwRj7NbXUDaGL3Zp2/zLQBeNs2BU+cIvBYIuO/W3gm71
         CbSC4NHf0Qo1FYRyvQ1mksDBp9EWi+lWfVbf25v/M8jwJdtmsFNtjpFLlwRNbVGLAMtx
         ER0LUz/UwzMmhofuGBcXGHvP3gleebLYl7yruVhv9+P5X9f19QH8SZ81QQ+3oT6qlja1
         8GYO6JHlafyEVUxfjzrgRrF7XVUoaEwsAec0vj/IU7kQSNcdgFtlT05FPavna6ozNllb
         o2nNRWpxNxSA2gASFcbZ8e7ZSB7ohiVis9dfUHypudMJvm3fmT1hiZiG/0M6UFS0AT3i
         Y0MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0f6CdgR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b25sor7140543pfd.0.2020.03.12.12.42.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0f6CdgR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+pq9oFT7R9IJPpeslQpwFqiLS0a1utLd0OoEdcej/ZM=;
        b=Z0f6CdgRbrkF9SqFjCgN7a+fM09hvkMXdpxNmFJzThEMQUaDC7XLqeqIg6BDO31+lx
         ZoFgzfgx0CJT35KjBo7Yfl2io/0+gcoIZ+wkC+SlhmBLYUelCLumX7MOX8n7j/YGFwbp
         E+K0KP6NXUaOIPP7d/zsKPlnbEuCm14x19KWM4l5SuIlfvbhJiylZMxuE4Hk/OBOlt69
         McDJlI4Y5i5BIOUPhhKShACXfzYaZCVjQdda28G+b6+hzhq60IlD5Ur2We12nNIk511j
         iVFDNX2hBuU0g6dOEXNczsPjIdGRpJmzcuoi3Zox6lbb6GEFdADZhAvi6XPkZEwZA4Rq
         BhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+pq9oFT7R9IJPpeslQpwFqiLS0a1utLd0OoEdcej/ZM=;
        b=cKm+zqhkh6DyPCloa3nXFSGgsKZX2yakmT7OjaGEfDw5vZwG45+SMo2X2aH5IM3FU9
         QAIGzOtEOrwJo2U3nDUb1wu5yBADpri3ZNmOTSLoUKAPD713USUkN7ZHrFKG0YvuZ7IB
         iAjWDrWi8ut+iqoZxPUdHPtxJTGgMYlgI3/wbJk3uu2KIQSjJa5vBnX5akS2JP8V50GZ
         VoU/+0U/djtdFS97B7wA/q/KUFlW/PR6RWv/ghr1bWNGP7x9eDfrdAR28YC0WRy7OX71
         PHCo3Sog4TCVtwv47FSnBLrNik8VBaie0DozOFrn6AItlomD9cYCDwbGR2N4gS7WDgk0
         AMjw==
X-Gm-Message-State: ANhLgQ1HCnPVNzf5IP+kx9SX3vbjRBWmuzqJbGNhh/9vvTjUb5qoybSa
	Z4uk87XvUkB+qLu8QlsCu5a7SsoT
X-Google-Smtp-Source: ADFU+vt+C1pnf2FMY/Sg6/BNv5qT6DEle70MB/qOpmEIQvr71Uku5x8JjTbbIqBuUoVBErHDCH96eQ==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr9482465pfh.173.1584042157146;
        Thu, 12 Mar 2020 12:42:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 12/42] target/arm: Implement the SUBP instruction
Date: Thu, 12 Mar 2020 12:41:49 -0700
Message-Id: <20200312194219.24406-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pQYinwMxUVst

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix extraction length.
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9adc259186..49c94bc565 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5348,19 +5348,39 @@ static void handle_crc32(DisasContext *s,
  */
 static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
 {
-    unsigned int sf, rm, opcode, rn, rd;
+    unsigned int sf, rm, opcode, rn, rd, setflag;
     sf = extract32(insn, 31, 1);
+    setflag = extract32(insn, 29, 1);
     rm = extract32(insn, 16, 5);
     opcode = extract32(insn, 10, 6);
     rn = extract32(insn, 5, 5);
     rd = extract32(insn, 0, 5);
 
-    if (extract32(insn, 29, 1)) {
+    if (setflag && opcode != 0) {
         unallocated_encoding(s);
         return;
     }
 
     switch (opcode) {
+    case 0: /* SUBP(S) */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 tcg_n, tcg_m, tcg_d;
+
+            tcg_n = read_cpu_reg_sp(s, rn, true);
+            tcg_m = read_cpu_reg_sp(s, rm, true);
+            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
+            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
+            tcg_d = cpu_reg(s, rd);
+
+            if (setflag) {
+                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
+            } else {
+                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
+            }
+        }
+        break;
     case 2: /* UDIV */
         handle_div(s, false, sf, rm, rn, rd);
         break;
-- 
2.20.1
