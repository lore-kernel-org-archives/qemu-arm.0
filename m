Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956265lfg;
        Tue, 9 Mar 2021 08:22:28 -0800 (PST)
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr24916340otf.37.1615306948783;
        Tue, 09 Mar 2021 08:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306948; cv=none;
        d=google.com; s=arc-20160816;
        b=QCibLELy/rsC+JHi0TT/dLEAOrb923HIpBGEgZoKGWMpfY/6gChI+LHTwH9718CYmq
         zXy+9PitV/xnwj5mT4B1zpK57JKBtiiVl2DCH/ato/kr5Lvw63B5OwjOxNOjEyFRNRa2
         V0RYAG8ezSfCQTLp/VgUCTTY0ysgnED7zgrHod7lv1MRO75jHAWOyAZypN0UlAP3yLEb
         X+OQibJnY8gBe/u4RBRhRI+N9glSlBjA0vAAlWV4Wbp7rgjLZttXFXv5oWlK0+30HFSG
         wxDq3W00Osu5+Jw3TzPWeYhuwM4PptXSGif1iTCHsNHpVErnuSjLYIzSiJxVduf0r5xe
         pZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CYN66BzpOIeY3pk3bLTjjeoAsrmmNKLt+cAT2PgztsE=;
        b=uswD8GJauyDeQomHSx3BN5Pv5ZMFVDoxHy745Y7jb3T0mmqaU4WVXLXKPZieJlwdk+
         8RgKTrEi79wzkSeoYaYiXEmxXnA8okg1IrOTmGthz+B/jX4rcJdc6JeVZFawM4i5QHTQ
         3Qrf4JnJZfB8op53GbN52QhoKqcxxG2o62/rhIbitKMAW6HyPiT9z6M3WPuwDsd3O2pU
         SMEHGzxpi8JDO5ZEbK/RCwF9sOAqeAi7sLA8SxUhO1CO5v7o43a2WNMOD445oWi3WI+p
         GdM49pYohbLOctKKeOLLexttMqM/y7FFnZZgvlL3CrkuryhSU6bzyoyTdLTxtglP8yYD
         z2Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j2NXNAt1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u21sor4123687oiv.32.2021.03.09.08.22.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j2NXNAt1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYN66BzpOIeY3pk3bLTjjeoAsrmmNKLt+cAT2PgztsE=;
        b=j2NXNAt1EvgD4xFtn5T0eQlxs1pwduriDBQd+RE9FSs5qp8SHRcIi4/r+MR2Q3fxkK
         Vm7Ymtvdc42bb2R/soyNvUFcKtFT68EueMHNNFJbao1vQucQ+NTVqhqz6I12ujYgycan
         IvNoPKkZPG5Q+cxSnugtbqNlBhR085JSgYH5B0gR9+HoVh+ThGTJUZt+jvFwnEWy20MI
         iWhuqqD5SputC++32VmApa3Lp7o/qGOk1ZShUq8WxbCfqNbvrcA0tsVVe63oAzc8ZerD
         c74cDXRwlRHYS8IVXrw3yHNoaRc2x/YlWd3Y0hthkJsnoV3MfB/AusuHgG8iiRvdS+KJ
         YT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYN66BzpOIeY3pk3bLTjjeoAsrmmNKLt+cAT2PgztsE=;
        b=eyXTRtb2PqN0sb/mz1Wo5U5mysOXDfKrjdfotqrVb+nfjqbCK4tKaHCFLuvCmRZA9e
         8AlJc8rTUC7sLt3awxsJlUgdUO1FHhu5lRURNuhPXLeFK09Mh/Ap24Q9FUorI8UoECoI
         vLKGhFgMRKalhgR7AywIOvq/FlmYW227MFvkt8S80z5Y6d4ADe9mWGD00Uj47o+9BixA
         WFB1vKO4hPMfX9ZNRnYgSdvp/55lV28nUqYVKtyK0Rbg4GyxUgbNF/LEZsSUSZyO31fI
         319euav2rRykh0+KwIdc/vvCXRVO7WGE0XZH98zuUo+NCwL5xhDdkbc92yx5NpxWXr9c
         djiQ==
X-Gm-Message-State: AOAM532cIDg+SYsHeOZpJ35LbUNn6pvymVIlXqygPcarLXQT317Dilwr
	P5jE4MHZjR9XYis+fmqlYlfp6roTTJ62X1TvlYE=
X-Google-Smtp-Source: ABdhPJxjbNAMz3wXnuuqkf7dPiJitIw6rmUIZqWavm23h1RAh3qcCBDeeuG9XQO+pZeRcw1QE3EJKA==
X-Received: by 2002:aca:5882:: with SMTP id m124mr3508467oib.137.1615306948459;
        Tue, 09 Mar 2021 08:22:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 66/78] target/arm: Implement SVE2 crypto constructive binary operations
Date: Tue,  9 Mar 2021 08:20:29 -0800
Message-Id: <20210309162041.23124-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WjrG2Se7hPat

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c482f229b..1c5ad44bad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bbb1dbd990..26385a9c2f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1564,3 +1564,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 14360b2b08..6ee4d10ece 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8172,3 +8172,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1
