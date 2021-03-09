Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955925lfg;
        Tue, 9 Mar 2021 08:22:08 -0800 (PST)
X-Received: by 2002:a9d:3b26:: with SMTP id z35mr23503261otb.134.1615306928229;
        Tue, 09 Mar 2021 08:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306928; cv=none;
        d=google.com; s=arc-20160816;
        b=DDnxF8v+b3g4qRmnAkL+yqem9jIDITTghCiymbsW2ysx3M2lclPQw17T1G1xMiz7uQ
         34IEBcMdRWvaW6amRKSIC3RdoD8LwQGSOYyI1wZuUUEh4dOzq/wb8fbNJNmyNSUFi4Dl
         a48QxZPj34mIR10ExqB2AAjxRBecs/GbmMJ6+k5RfLFGCvgPxgU9aQDTviS/2Y4saObg
         gpfB4S13RHtSk39J5WPGelfj6Iy8mZE8TiK7Iyvah7LoE6Pc45qd8vOAIq24v91WbbVU
         crFk/ZKqNoccmzNj+eEQHHFUoYLWny8sM6Psv6BclQNLQp1l4gmzYaMnmcl7ml3dV5SJ
         4q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HEwyxw34JNS3xvvmtmlho/yxHK1LKHErEB/8mITxEEA=;
        b=ZZF3MCnUHlD9afb0W22w1kntF/dbYgiQ2IJ63z1hkxrVxK9o42bhyX9E37pbpXqOR6
         WnqEuJ0JClGbUlRIegTKJWeriILH2q6xLzGlQYVK7Sk9OLMIlVr6Ui7X9hCgCdSMMz/M
         T6il5M+crvhS/+kJaRs6TbwpU9GooKzvo2HBkJvSHovRPTxkGxyeUkTlOu5Bj37x0TfH
         zx/ILSwJRmn5GtWiAUywshUVEbMR3dsCcRGclcd7nTNLltx7Uq20XotxvzBHtO60A5dV
         f91A+siUpYEyZ6cKpfZqg4DoNR2BUgBCdTlyHEgoBT8DRU7UBUvwSy5xgU35TWQJ6yBo
         /8HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKL1Veqg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l28sor6923043ooa.14.2021.03.09.08.22.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKL1Veqg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HEwyxw34JNS3xvvmtmlho/yxHK1LKHErEB/8mITxEEA=;
        b=xKL1VeqgOiuR1tF7zh9YSdfceKKUpt3AVxq74NOV8Syh0+01kMfHyFun0NBhwVtz71
         AC9Nd0ZHLJ7o+nPH1pf8EXedClHxdefahUu0GhmNWy6gLI2OS+ngEz6u/t+IVVL4zDGi
         /fPxQCPawnXRh73QcTlBr2fNpCePw3oxWdYant7MZVrCG8w4OXIMPhhaCgUlXaOBwnQl
         Qt5ncFSg4F79R3fhAtkLgqgRSepXz2QTjL1pARXFE19DbpKjCx8cnYAMAoXCbEH9pmWD
         EvjMHJj78zBpuYu1eMLKv4ut+YWxAq//pqqg/AXn9b4zq/3PZQjiXJbUaQfaI6DlaFIo
         Ovwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HEwyxw34JNS3xvvmtmlho/yxHK1LKHErEB/8mITxEEA=;
        b=kY4Rib0bLQesHbsXQ9E8YaivezzLY9Qh5dDXWK9BDRoFIIKlKxhO60xDym1hJufY2q
         VzQUySKW1Z4BydrbbmL0s4V+Orm6HEByp2w5rRVipYnk4Z3Aw1DawDIcoJ/rYNvT4Ytm
         kKQFedWDe4cPK+CwwF4ETeRnUTofCOAsmc+N5yJUxM1jbjwvY7xaDxJi+S9Kab10drnJ
         8A4g85G9dYACXQFfR6NQy3aVWvFLYLkXQ+p4PGRdrygtutx69vwk246laUEAqTxF9A0e
         jH8nxPSEXgKWXZq8b1Pxug6VF6sMzeVeQ4Ig4QJfAZ+Qd8Wef5lf2qWuNkSexeS93QwG
         YUXA==
X-Gm-Message-State: AOAM532hiaZHWJXPxK1i2F0M36BuaFh4MgYCIuVVn0Er/iVkOdKpK3gC
	TenYnOP9X/MeSoIdVr2BJd2XZbON
X-Google-Smtp-Source: ABdhPJwM44zXhW4QyIwtPy7cUNPmRdeTsCRoXBGXBPGIa2B7Yl2LrIezZ6uWHvLUFObd/YLIE83dcw==
X-Received: by 2002:a4a:d994:: with SMTP id k20mr22846236oou.70.1615306927863;
        Tue, 09 Mar 2021 08:22:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 47/78] target/arm: Implement SVE2 SPLICE, EXT
Date: Tue,  9 Mar 2021 08:20:10 -0800
Message-Id: <20210309162041.23124-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uOf8HbUpoEaI

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200423180347.9403-1-steplong@quicinc.com>
[rth: Rename the trans_* functions to *_sve2.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++--
 target/arm/translate-sve.c | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cb2ee86228..67b6466a1e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -494,10 +494,14 @@ CPY_z_i         00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 
 ### SVE Permute - Extract Group
 
-# SVE extract vector (immediate offset)
+# SVE extract vector (destructive)
 EXT             00000101 001 ..... 000 ... rm:5 rd:5 \
                 &rrri rn=%reg_movprfx imm=%imm8_16_10
 
+# SVE2 extract vector (constructive)
+EXT_sve2        00000101 011 ..... 000 ... rn:5 rd:5 \
+                &rri imm=%imm8_16_10
+
 ### SVE Permute - Unpredicated Group
 
 # SVE broadcast general register
@@ -588,9 +592,12 @@ REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 
-# SVE vector splice (predicated)
+# SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 
+# SVE2 vector splice (predicated, constructive)
+SPLICE_sve2     00000101 .. 101 101 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Select Vectors Group
 
 # SVE select vector elements (predicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8c93d87897..cfcf4893ac 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2266,18 +2266,18 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
  *** SVE Permute Extract Group
  */
 
-static bool trans_EXT(DisasContext *s, arg_EXT *a)
+static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
 {
     if (!sve_access_check(s)) {
         return true;
     }
 
     unsigned vsz = vec_full_reg_size(s);
-    unsigned n_ofs = a->imm >= vsz ? 0 : a->imm;
+    unsigned n_ofs = imm >= vsz ? 0 : imm;
     unsigned n_siz = vsz - n_ofs;
-    unsigned d = vec_full_reg_offset(s, a->rd);
-    unsigned n = vec_full_reg_offset(s, a->rn);
-    unsigned m = vec_full_reg_offset(s, a->rm);
+    unsigned d = vec_full_reg_offset(s, rd);
+    unsigned n = vec_full_reg_offset(s, rn);
+    unsigned m = vec_full_reg_offset(s, rm);
 
     /* Use host vector move insns if we have appropriate sizes
      * and no unfortunate overlap.
@@ -2296,6 +2296,19 @@ static bool trans_EXT(DisasContext *s, arg_EXT *a)
     return true;
 }
 
+static bool trans_EXT(DisasContext *s, arg_EXT *a)
+{
+    return do_EXT(s, a->rd, a->rn, a->rm, a->imm);
+}
+
+static bool trans_EXT_sve2(DisasContext *s, arg_rri *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_EXT(s, a->rd, a->rn, (a->rn + 1) % 32, a->imm);
+}
+
 /*
  *** SVE Permute - Unpredicated Group
  */
@@ -3013,6 +3026,18 @@ static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
     return true;
 }
 
+static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
+    }
+    return true;
+}
+
 /*
  *** SVE Integer Compare - Vectors Group
  */
-- 
2.25.1
