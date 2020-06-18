Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1286491lfm;
        Wed, 17 Jun 2020 22:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSOfNVvap6CL9/Gxt9RQL/5DTJ5W3z282SRSkYi63XdGlWmGmnOg2foGbD4ESgBUhEHFO/
X-Received: by 2002:a25:9746:: with SMTP id h6mr3563488ybo.409.1592457139220;
        Wed, 17 Jun 2020 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457139; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdDTKk/24KmAQI+1q952pooaJ3G/eyG2BfOsTr3TRNZ4PBQE+fTc8j7lahcAxj5Cod
         dejf+fIIGnJJxgh/yqgq6jw3F9eGKVnm4CFD+RqVJyLFtak8JMkl8RL36vzfU1VyQKZv
         7GIppiPoBizvCz0jVJUc4r4ys7RsW8cyXlPpOjkYxBJUgvtJqCKotQARNUXps8fT/z4w
         da6TXT2+un14eaTNKrm5xPTKpT0/bspkcOtmjjXxCb8ErWn7e+qyRFt2D+LXSlZrRbZa
         Y21yZk9xMomKecbsmUHkZMqqwEwlQIUUOeE4N5KvdqDLHXJ5YckQ7H6r0JBp5hOdnfYh
         VInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/UB6J774uuR5LiuUwntUTQWEH3U6r5EYks5GcEtJxWo=;
        b=zAsWJ+c55jl3deADuiGBTu0kLqt75J6xpMilP7Uq8Mt5ft3FgES9Z1fKaCG2LEDYzw
         k5iaYhlEDFXD2m2jr/xoaqMyfjLuRO70a5oeUi4vUKcGIS/iKGX8Sc9qAszkPpFbZB2z
         6eHuMuTIpOAmlEBSeOQc75zAMAnR8Ru6WAirkV80u+d5oKmYaklGh1OJwK6r0+lGynno
         CcOMxNOcNLGDgY4eXyRDAPf5ZAlRd5q2XsopliWvRCNpKBevXETpbB32otPt0hDGw5g2
         B+lvGuMDxOQNE51tgSZc+Sop0vNYasCVY6lQBQweTovUDTIAt++BFLzLCvUR8f/r+o5x
         s9VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ioxfextV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si1582433ybe.280.2020.06.17.22.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ioxfextV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmqY-0006gU-KE
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEO-0006Bq-IP
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEM-0003cX-4E
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:52 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ne5so1957279pjb.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/UB6J774uuR5LiuUwntUTQWEH3U6r5EYks5GcEtJxWo=;
 b=ioxfextVsudD19uzqAPqbaA2WiJie4QcKP2SIHGNAjZeGYOLe470i9hESfKGdcAHhF
 UquLz7yWJ31SDJDX+la5XnP9xZ0mV75bwpz5pdKkMKnIzJ0qy3MOPq35D+sXg8x80yGF
 7n/ErUhKBYZ26glfk5j46hHhVtH8JrQOVHmSiDZNnK3raxQp7UTVhVmAQDLDXpJ4W+Rf
 0HeVKtQUFsuKbFJ1auHm6Lp3kGOEX02XaxqQzkO8spPfTDqMk58KLDPKp+EVjEoctfX7
 eSp7d4suSMeH35FK3PIZZYABIUgptgAXJ/I7sdLaGYQsXj46j94GCFcLqKUi+1AT5I19
 FuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UB6J774uuR5LiuUwntUTQWEH3U6r5EYks5GcEtJxWo=;
 b=Fy/8mUB9UAAlKTJ20tOzGJViGaKaTGq/dO0dQvD/JLkzSOKNuH6V9/eS6MJ3Q2LZ+n
 /V3xElSgqtZ/I+Z5z8QxRDE1J+a6iRKQc32TFZ51rs4bFGadiSOVeu/xIqnMJOh+Kz94
 hkxMZzKGutyAmgPvYY7Pvksn3GY8EMouu4WVd18HCTlQ3qapGEc7rztklPBUmGuXwN9o
 3sE7yMDVae51FYXzjfu3DYrYyLwxCF2yMcdMfckQw0mlvSyK9IOKuKyOEIN0TWAePsn3
 R2uMW7gfhEGCmbviYMWD+7Eqm/hY9eLsAEffOmJSoYkjiZR2X9eKN2liSQCSiBncsoLH
 yxlg==
X-Gm-Message-State: AOAM533i1fXmFQ+Olqp/Xy/jli1FTIHyP6EW+2H+cveFugtH9h9WcRwQ
 Fc3OJKhRHBuJ5KmXl2suLIs1YQ==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr2258717pll.18.1592454768568; 
 Wed, 17 Jun 2020 21:32:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 087/100] target/arm: Implement SVE2 crypto destructive
 binary operations
Date: Wed, 17 Jun 2020 21:26:31 -0700
Message-Id: <20200618042644.1685561-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pLxkFTlLhPC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0a3e201b..37fc866cf8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3877,6 +3877,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index 9b0d0f3a5d..2ebf65f376 100644
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
index bc65b3e367..92140ed2fa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7693,3 +7693,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
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

