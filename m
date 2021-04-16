Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp749398lfr;
        Fri, 16 Apr 2021 14:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxM81121Ft/nzh+bdUeW0FnZzwncDCo03CbQfiRJbLEanD1cxxdaN5p8+0eEvwkqBFz6Qh
X-Received: by 2002:a02:ca4c:: with SMTP id i12mr5987268jal.95.1618609539347;
        Fri, 16 Apr 2021 14:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609539; cv=none;
        d=google.com; s=arc-20160816;
        b=BMa4DPRa+f6gpDjqah5jV/GN5dT8NmqTfOZ7vb/kxLTCdG+D1DdVIegrtbi8ONkKtT
         g1LF/lCXUOCy+4OGK3gU6s7Hv0ICeAEWp2ppHaB0+E+CO1XuP7fRqwtPGktaqzi61OND
         VuL6m+tFSkSEJKBHI6Ehr/Z2O8V45L7jABTUkw6rNbj3NjbpkfE0BMF30xAJ6tFlvuQe
         ets9vgL+JsfMUysI09DGy7wgDPBvMtBoYHI5fmm7fLzYaLSZaes9NJ/YAV8q2M363nC4
         QnYHc353eWJoO66rWnzCqfL+FGjf5c/TgRLwTFibHPmFQI2sGkZZmGoVv0GfepLLtjYa
         Wqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qO7nX/keqWMY4kFJdwer6bjckmqvkxXLwxerKkDKNvA=;
        b=xbbY+XEZ69Rzq5wdeQwx7dTn34+BR6GNHOOnXkqovwA4BYC4R1uh+M+rh/B08yWDwN
         fLmEWdRS/N2V7I8Mlg+6F+MOEFnLhqWaTdHdFoc1Dx6qk63Osbou3BBXCuETH2UysbSc
         nunopYzhhIS1mpKhh0Ngb7hPR0KLNwDCnHAlv4XnIMDQCaiaKznJ6AL6yIHv8fYv2Atb
         DBi+v53NcZ4LhMJPo0DOyLJUlAzz0M6MydaZi3NcA4EGOzLVriX0toZuXliFJLAyUpsZ
         0p15ppKDm33Cb9sBJDHn1aih7UwVkFWg4MRnO9zcHk4d09utpLoHX68gkqhiELw2JHmj
         gVjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbSJgHjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si4645151ilh.43.2021.04.16.14.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbSJgHjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWHS-0008SL-LW
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdi-0006EW-0b
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001k6-Ei
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so17057487pjb.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qO7nX/keqWMY4kFJdwer6bjckmqvkxXLwxerKkDKNvA=;
 b=NbSJgHjwQselsNtZ3gvP6mjDDx8hz9ihxjcRidOFkO4fVfARuAWzVG+hYzIMoXc1ts
 NYWDl8+CHob4iYLQQxr58EhxpJKqJd//BoXPki0xysXwIdGoCQ3hqXuIMM/g1pjs7ihR
 ky137UiGqeZUvqnNaqNIolx+IGQtLcvw1gLilNKOXyPzB/BOUEG8UhknR3wcE+xO8f6q
 fMR5cS6hEPCyj8bn3e30wDmQcugxn8t2HXuQtw2gAORzDRzLrIGjsiZLfXT6uAntJp49
 KPOyJKK5nWl7/Em3KTC2yy5GFS4rsF6d0Z4MRAEwJ1UryVsZS8qkx5mv7o6R60LwJMf0
 WPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qO7nX/keqWMY4kFJdwer6bjckmqvkxXLwxerKkDKNvA=;
 b=liVe5/pIuxIkZeVYrVQZSlvsz7jO3LZEII1dZKUUWDeXIXLD+AHQIkJcipV93EugSi
 e4mE4sGlrAxFv+tIlTakPwoQkhV0uYEZjJpDqdwMooGNlC1tbq7iZ7GETkFsh7zEhWfU
 372XN9HL7g8QKxdHWAP7j4Pjhckcg1VlBSXpBHLR89aZCcxj/t04bZccuvPuVVTYR6Dq
 Rwi+gPFkE92hP/jxMNNo6RvTg5Akr80gn9T0ptmo8oyiY1Qq78dVBVX+4Z8sBuHHIK5u
 g0sal96wqpYjh1rKpD7uAF6uypo/YQvdHdkPWXDOQr6IPr5+yfIfoo7q7znKDWjb42hw
 SbxA==
X-Gm-Message-State: AOAM532+8uRERE44FtlLqoHpkB1P6PgqjbSaGmVfJWA7Dbw3YZXb3zDj
 kAjjmMGX7ifkA7GlawLGA5MzGjPpll1+Jw==
X-Received: by 2002:a17:90a:1990:: with SMTP id
 16mr4970193pji.172.1618607052898; 
 Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 62/81] target/arm: Implement SVE2 crypto destructive binary
 operations
Date: Fri, 16 Apr 2021 14:02:21 -0700
Message-Id: <20210416210240.1591291-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W/hwdK/60kbH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 132ac5d8ec..904f5da290 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6ab13b2f78..fb4d32691e 100644
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
@@ -1515,3 +1517,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 # SVE2 crypto unary operations
 # AESMC and AESIMC
 AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+
+# SVE2 crypto destructive binary operations
+AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
+AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
+SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4213411caa..681bbc6174 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8083,3 +8083,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
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

