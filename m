Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956257lfg;
        Tue, 9 Mar 2021 08:22:27 -0800 (PST)
X-Received: by 2002:a05:6808:2d0:: with SMTP id a16mr3478080oid.83.1615306947790;
        Tue, 09 Mar 2021 08:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306947; cv=none;
        d=google.com; s=arc-20160816;
        b=gj92B0AsvDhMHa4vDWtPI2SFjoVwZMGAMnjWjqBy0SIWHLS0Ur25Au0T/yPY/qchpM
         g0nQdQFAhdXckgJPby52yP4CTAZfOWF5V5jyDmarWc/zdxJpe3FrD+7z58U5M5PWjEk+
         /C6DLrkrnjppfRANu+RFpLOJGyCnU3CVUaNlekqbutAwktZ3nyGgK+mvPyV+hqduqypa
         ZtyR0Qy+uVWvx7lXF2020seSySJOoTaR04AtrhdlSvviDMAwt9/0iCq20rFALZbhIpfW
         ek2n5ItocPAFoGPYIQWFnIDDOS3Xf/8NymrSAeX92QCoBc+GhdLnx8HrhUXedpiPu1Jg
         ltbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k7HUMIRolyiVf+4bR2Asr5i8Un4DIvsL9C7fcAzpPAA=;
        b=Fe5ZfNYmccPlWx7j5Bt1lmxOa86QJqAu8IBPCk/awUkZkvTky6mVsii0krDalQnhXk
         WJBQWGNcnK71qCtFXHhsdwpO3/DUA90q9HxPy1km/GDK4TV8P8Z63lqKKVZrcuUh7iLV
         pmF2hPbqJ74ftjmNVCReCuRI9GE2cf3w9CLWIi8incwVNk0z4HjC6d1T1T9a5qz5tH3T
         SqIprqio0vKYCxK4YpoAI/DlM5yBWsNbQ4IRxAIlPzJYwco20kmebTZ1hBNnf8M5Ui1w
         9riRQtM0ZNToUBuvy06eq4fOMjOmzQAJGgEIBtFaSC7HMgUaIRf2joGDcRL7ARBcYYuJ
         4xdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLcMPzIj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l7sor2011915oil.35.2021.03.09.08.22.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLcMPzIj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7HUMIRolyiVf+4bR2Asr5i8Un4DIvsL9C7fcAzpPAA=;
        b=yLcMPzIjEcBtO4Qlig/bEO7aFwlHLnVgs1hFqivL9FZq++JyfV7SGfT0KvcGFKA1Tl
         b03X+idNPu/1Mqt9acHuXvQ5Uums+rawTWNcklg5DwK9eqQ/duwOpQYPgP1Du2YmKY2e
         VfxPOW5ByPad3OtBcF/BcuR6j2RBpP2MkCOm2RfOEex3n3YPcLBJ2iyH14eimTkKJMK5
         lXL3lSFyAQnR9hFHKDJ3iAZ7sQmf5Cup49QDmnGoglA8JM9SR8yL5ySnxlyYzfgFJgxn
         8Auei4AjoA4C47hdHr8lFUIxccTRhGxm9QtnB4fRXlgq3YjYekQyGbdTh0sos39qz7T7
         WZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7HUMIRolyiVf+4bR2Asr5i8Un4DIvsL9C7fcAzpPAA=;
        b=Q4gsARdq6y7PmjdyO3/PaNVSLkaNuL5j8kBvOMRLtXUJUyxB/Ht2lre7uttstTtrAY
         T4F/Clg1tuza4/N9vmZlR+4ysTW44+Xfj+FJPpP2qSq2bO+RjIm3xdPyh3FdAEjGJsMb
         Lqa6nkv9xo9adTYRMlXnKbRGZORLcGtjJv7qolJjDHYPD/XFwJo2VFFlBvdPGDOGVKmW
         WAd1XeMlSKCkcvaibefgDtgIPzJWmLEnxXxu5p4nC6kWF/2j1hxUMcoIMwvf/zj+cMbS
         qNaszV/TavgyqvOrpbZ8BALFOucOF7x5GZw5nBffvzzOTScksIj1ejqqD1uxkXL7iRgO
         N1sQ==
X-Gm-Message-State: AOAM532htauZreTQG/ALRFWfikqL+iJYe8rPjNR+XOXZ/aM+XIzhsHKI
	vg13sqOgJvpxmgBwXhLyQBrT/DwJpEw79TM9LbU=
X-Google-Smtp-Source: ABdhPJwNXk9pQO3JjjcynYAqGbb613NAJ/RiAbpE9T/QmSbksnbFEGCod3s8INAvHgfHXgbbvXFIHA==
X-Received: by 2002:aca:a9c7:: with SMTP id s190mr3511345oie.19.1615306947449;
        Tue, 09 Mar 2021 08:22:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 65/78] target/arm: Implement SVE2 crypto destructive binary operations
Date: Tue,  9 Mar 2021 08:20:28 -0800
Message-Id: <20210309162041.23124-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n6VfcniMel5r

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c84bfb62b..8c482f229b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b161334e93..bbb1dbd990 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -118,6 +118,8 @@
 @pd_pn_pm       ........ esz:2 .. rm:4 ....... rn:4 . rd:4      &rrr_esz
 @rdn_rm         ........ esz:2 ...... ...... rm:5 rd:5 \
                 &rrr_esz rn=%reg_movprfx
+@rdn_rm_e0      ........ .. ...... ...... rm:5 rd:5 \
+                &rrr_esz rn=%reg_movprfx esz=0
 @rdn_sh_i8u     ........ esz:2 ...... ...... ..... rd:5 \
                 &rri_esz rn=%reg_movprfx imm=%sh8_i8u
 @rdn_i8u        ........ esz:2 ...... ... imm:8 rd:5 \
@@ -1557,3 +1559,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 # SVE2 crypto unary operations
 # AESMC and AESIMC
 AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+
+# SVE2 crypto destructive binary operations
+AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
+AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
+SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f61e6ff6ea..14360b2b08 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8134,3 +8134,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
     }
     return true;
 }
+
+static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
+                         a->rd, a->rn, a->rm, decrypt);
+    }
+    return true;
+}
+
+static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_aese(s, a, false);
+}
+
+static bool trans_AESD(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_aese(s, a, true);
+}
+
+static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2_sm4, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4e);
+}
-- 
2.25.1
