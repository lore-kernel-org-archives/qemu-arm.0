Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp498791lfg;
        Fri, 30 Apr 2021 14:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVTUEk50kum5n7UWKTm4WLD9TmQL9wp/0gEzD3xEcD9CxsyLqU8mncuzrgFoElEZtKsx5f
X-Received: by 2002:a05:6638:d7:: with SMTP id w23mr6962463jao.14.1619817115534;
        Fri, 30 Apr 2021 14:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817115; cv=none;
        d=google.com; s=arc-20160816;
        b=I295uhtSUBcpWATKA7V7D+GHcDLlFRzcbe1nGhvBiQ74GJQPsck/zsrsygjyGyFX4p
         qoXWkd4+IuRA1O/p27Up0xRsGRkgi3aPA/MtxKbLpicCh/aqDEN3KpyUpKEJnk11BC/C
         LyCjSWFDa01h7v/bd4yw4h5eXwEGi2EhuG5EsPH8rQPwTE/sAXDEWsjS97B36uOFc7WC
         8ovwM/T0sP4PQB1AhnhkB3gyVonQVPbHUg4bPyS7/1CL2Xk0bZmv2a27mJ+PLdCyLpPn
         muPfnBciSI0LBN46fcfHAiIAZ7I2f3VQHgIvj6R9YVX/hfRNSRNof55ZA/vycaAH86Sc
         rWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CXYlVo4thPOg47NozYtH3Ja8wzwpSJTG3c2FPfnTAhM=;
        b=mzYnrGDI1KYWqAn83Ke+6ns1dsYiazBOvWczgWxKV/ClEjh9esnUbxHrnJYrTM6AXd
         z5NmYNd8jbYamrIUIHYOtDzQXX7nyqZBUnnva/TdqHEOGYzRt4pZX7T982W4jfEulp/v
         xHnlYcrAKXX/L3yXH2AmfP2zOIWzlxRyVLbRg0/+tnvbfw1tRpmvoeoBW/HKVEiWvvPP
         40zylklN6PLfZve0oEGVkoZAbnnz/9uk7CvQBXGKaU8tFKKQaq8ODIrULSgv/0ruJ8bV
         RBNxvNNUGnI7KxwjRV1TDuH3imJB1GoN41AMlI7wuZqays1Xj1pd+2H8s5J+Tx8pUIP4
         yXOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3g0lfHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si5111671iov.10.2021.04.30.14.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3g0lfHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaQU-00054D-Sa
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmf-0004wU-6Q
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlw-0007ls-VK
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p12so50171807pgj.10
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXYlVo4thPOg47NozYtH3Ja8wzwpSJTG3c2FPfnTAhM=;
 b=Y3g0lfHVJqE7tAI0bXBuq28F6X/2rDpc+YYK3cLRFXAz0UYEKyp9q3cDt8ia3p21XP
 na1HC2IGnqfZ1lg1Q4/7qy/VJ9AMsX7CDNiPWHxnDMR/pYYkmnFSZXJgCSuH0oZGijUg
 4aScBZ0VjpW407+afjhMOCT4v8oCXjKFgd/tyss1Hf7AzoOqU+VKijfF5y/Z1yBd/xkZ
 97dXJ9PY/naVvQ43KOZ1v83g5VZfSWrnnAa9Yf1tkR//kZs9ixlPRmK8ioeZ1FpclkBX
 HehguYjH39dda/raZuvA+qao1gMvmFjbG0oNxKCe0j+TMYU5r6UAYGs9j66ePerrC5Ic
 1xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXYlVo4thPOg47NozYtH3Ja8wzwpSJTG3c2FPfnTAhM=;
 b=R2UBZyqfOTUK5WaTE5D5QteSY/0FWeaOCUstPQNO4rCO9JzvqSwYaamMAJnxti6kMV
 DVDoeDRt/TQ14kndpgKt+iPUpBVQCROaDBT/h+oaEUbzxG845zI7vMGV3jWAM+UMt6sw
 KQX2sHS2bRNkx0rIVB1xCVZp6YHX4rPgff6ZKRQ2DbAG2VHnd61xxf7HQtFva/MIG5JV
 D601vuiG1s5pS/gq2QnciF6RN/iZrX2c87yXHJhPzduQG1IwCSvj9knAK3IjZOQhZcBw
 GXoVykYf7BK6oW+FQud1WMKiuirB0p867jKDACkos5MOk7sxlzAcDkskVz6kBjrAVznA
 YPrA==
X-Gm-Message-State: AOAM531EAkv0GyAZsZnyxQchmCSwzNb9fnLcN/obcoyGeXHGpPovhIKm
 goiFUifsrEVwlnm9WCBaQGnzbQ==
X-Received: by 2002:a62:d409:0:b029:27d:338:1cca with SMTP id
 a9-20020a62d4090000b029027d03381ccamr6739543pfh.25.1619814590459; 
 Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 63/82] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Fri, 30 Apr 2021 13:25:51 -0700
Message-Id: <20210430202610.1136687-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ewuaqt5xNskf

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 384c92eebb..c75601b221 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index fb4d32691e..7a2770cb0c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1522,3 +1522,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fd4ec4a66b..5f2a2b1eb2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8121,3 +8121,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
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

