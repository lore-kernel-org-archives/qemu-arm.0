Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5033090wre;
        Wed, 30 May 2018 11:16:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKUFns4AwKN8jbTN+M9BI4Dl4VDEj66lSGLtbOSwnqk2oTPl5rdkcKY28dS6xP8C6E0DsHH
X-Received: by 2002:a0c:d28f:: with SMTP id q15-v6mr3610772qvh.65.1527704171596;
        Wed, 30 May 2018 11:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527704171; cv=none;
        d=google.com; s=arc-20160816;
        b=xAU+nsN80hVrWVGFjn/E/rBTRdqCikKItJ2eMeHGsRtD9Vfu78f8RI1E+t3ziCPJDk
         HBy3613VV0yR9SWtVxrwZ0A3Ji/jLKsRufiEJMbPFwkRwkyMFTiXNXTc24HTU1W9fGSU
         ubsTqgMPztZv1XiQZjP3WDULbphh5VsWg8N2+If83bm2lI4KT7hH9VBdh4BUmu0IUGsv
         RVBYm49EkoKyJZK4T2SmhN1fSCXDRDnCCFfbBgbBalDiRksfAi/7TYKTBsCocVXLpcEb
         VxQ5T3y2IoTHBMd1eyPc4ToWgPCrVV9/lbUL+RQPM37GePW/JbCT+WuSfkPUL0a/qAyl
         5NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9ZJ5MS9BNhn0KK0l8M8UKXBgrg+2w93FAOiLtmMVeCs=;
        b=nJ8432uJYFZUNW/Fawit9H0lrfQ3JNdlON5WAL8omfQ3hfxKwNOnEPy2qENLmmeuRd
         W78rIxcRrq/vRp/r2j+oul8snbWYkwhAZNgKSfvMk3wC/tFllQL4PVbsCXXAzEaBn8NN
         pbQU5JJkLeIDxgKauyRf1/unRkmiDnNOxp38t70h9rRRplLRwEvWiiSppGkZWvNNPvMP
         tRZ8MZCpWOxh6bT6ELHI3J6o5FOdAZTN/JADAsW9X9lGAWbZwineFCUVfOLxo7necGGR
         MfULseM6soaDVzTYR8q9EHGla3iOdB66lKTYUgMG1RD5995ptZy7G9xwrL0dqRpBQA4r
         Lbuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWoW990Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u55-v6si9855375qtk.182.2018.05.30.11.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWoW990Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5dr-0005Ch-4g
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:16:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pw-00025H-BA
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pr-0004hc-Bs
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:48 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:44770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pr-0004gc-0B
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:43 -0400
Received: by mail-pg0-x22a.google.com with SMTP id p21-v6so8481893pgd.11
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9ZJ5MS9BNhn0KK0l8M8UKXBgrg+2w93FAOiLtmMVeCs=;
	b=XWoW990QEqujpOzMT8qvXCWY1nKSWU0FRRR/17eL8KvERtTBMo2H7KieG/ui5rLSkz
	FFiNjQJosxAY1CQF7Z/85p7CVzbicGiL3PZdZ53fW5enf7wtow1pAL372b4lO2TMexAD
	rNySsnEGxnUkYTGNh5owQjKiE577z94FoxaDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9ZJ5MS9BNhn0KK0l8M8UKXBgrg+2w93FAOiLtmMVeCs=;
	b=VJyiJHQCB7FXm4EzWU4TuSGFDYJVJ/Qwz/1QmzBJKwhNJQIiRJKd1vJXO8DIhXL+Ki
	EcYXa9roeZxzIeXmTX63s2f7gI2/OCxp6qQJKkt1hbQf6U0sqw42HKSSp6tkxTMnbNBq
	uCGdsAOuR82tl3DGH1r/p2pnCnDzUGCDDtyQr1gZEcMSIX+NCU8cmfOUv/+R/FUcxdbX
	SjPzPKLY3nm82Z7ggZmUU1nITsfW5v+Wn+rh874Rw1051G89nFHscOzbOGIHSAR3OWVd
	tv4WlDP93LlZME0QC3aSJZ1AlMBW0edOT0qxwc0GfYZ4HlRge3v0nKVVuEe2682SSAug
	SWoQ==
X-Gm-Message-State: ALKqPwfe+4JsAtqEsWi+SLEIkvuozFmYEKVK+xwoh7dID1lEOovSE9VK
	OGbghGeGu0tZhCZRL5uNriUA3g==
X-Received: by 2002:a62:93c8:: with SMTP id
	r69-v6mr3693558pfk.59.1527703301807; 
	Wed, 30 May 2018 11:01:41 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:14 -0700
Message-Id: <20180530180120.13355-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: [Qemu-arm] [PATCH v3b 12/18] target/arm: Implement SVE Integer
 Compare - Immediate Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DU8uws+JaUck

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 44 +++++++++++++++++++
 target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 66 ++++++++++++++++++++++++++++
 target/arm/sve.decode      | 23 ++++++++++
 4 files changed, 221 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6ffd1fbe8e..ae38c0a4be 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -605,6 +605,50 @@ DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_s, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1dc2ec1e65..f6c58f54ad 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2387,3 +2387,91 @@ DO_CMP_PPZW_S(sve_cmpls_ppzw_s, uint32_t, uint64_t, <=)
 #undef DO_CMP_PPZW_H
 #undef DO_CMP_PPZW_S
 #undef DO_CMP_PPZW
+
+/* Similar, but the second source is immediate.  */
+#define DO_CMP_PPZI(NAME, TYPE, OP, H, MASK)                         \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)   \
+{                                                                    \
+    intptr_t opr_sz = simd_oprsz(desc);                              \
+    uint32_t flags = PREDTEST_INIT;                                  \
+    TYPE mm = simd_data(desc);                                       \
+    intptr_t i = opr_sz;                                             \
+    do {                                                             \
+        uint64_t out = 0, pg;                                        \
+        do {                                                         \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                 \
+            TYPE nn = *(TYPE *)(vn + H(i));                          \
+            out |= nn OP mm;                                         \
+        } while (i & 63);                                            \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                    \
+        out &= pg;                                                   \
+        *(uint64_t *)(vd + (i >> 3)) = out;                          \
+        flags = iter_predtest_bwd(out, pg, flags);                   \
+    } while (i > 0);                                                 \
+    return flags;                                                    \
+}
+
+#define DO_CMP_PPZI_B(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZI_H(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZI_S(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1_4, 0x1111111111111111ull)
+#define DO_CMP_PPZI_D(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP,     , 0x0101010101010101ull)
+
+DO_CMP_PPZI_B(sve_cmpeq_ppzi_b, uint8_t,  ==)
+DO_CMP_PPZI_H(sve_cmpeq_ppzi_h, uint16_t, ==)
+DO_CMP_PPZI_S(sve_cmpeq_ppzi_s, uint32_t, ==)
+DO_CMP_PPZI_D(sve_cmpeq_ppzi_d, uint64_t, ==)
+
+DO_CMP_PPZI_B(sve_cmpne_ppzi_b, uint8_t,  !=)
+DO_CMP_PPZI_H(sve_cmpne_ppzi_h, uint16_t, !=)
+DO_CMP_PPZI_S(sve_cmpne_ppzi_s, uint32_t, !=)
+DO_CMP_PPZI_D(sve_cmpne_ppzi_d, uint64_t, !=)
+
+DO_CMP_PPZI_B(sve_cmpgt_ppzi_b, int8_t,  >)
+DO_CMP_PPZI_H(sve_cmpgt_ppzi_h, int16_t, >)
+DO_CMP_PPZI_S(sve_cmpgt_ppzi_s, int32_t, >)
+DO_CMP_PPZI_D(sve_cmpgt_ppzi_d, int64_t, >)
+
+DO_CMP_PPZI_B(sve_cmpge_ppzi_b, int8_t,  >=)
+DO_CMP_PPZI_H(sve_cmpge_ppzi_h, int16_t, >=)
+DO_CMP_PPZI_S(sve_cmpge_ppzi_s, int32_t, >=)
+DO_CMP_PPZI_D(sve_cmpge_ppzi_d, int64_t, >=)
+
+DO_CMP_PPZI_B(sve_cmphi_ppzi_b, uint8_t,  >)
+DO_CMP_PPZI_H(sve_cmphi_ppzi_h, uint16_t, >)
+DO_CMP_PPZI_S(sve_cmphi_ppzi_s, uint32_t, >)
+DO_CMP_PPZI_D(sve_cmphi_ppzi_d, uint64_t, >)
+
+DO_CMP_PPZI_B(sve_cmphs_ppzi_b, uint8_t,  >=)
+DO_CMP_PPZI_H(sve_cmphs_ppzi_h, uint16_t, >=)
+DO_CMP_PPZI_S(sve_cmphs_ppzi_s, uint32_t, >=)
+DO_CMP_PPZI_D(sve_cmphs_ppzi_d, uint64_t, >=)
+
+DO_CMP_PPZI_B(sve_cmplt_ppzi_b, int8_t,  <)
+DO_CMP_PPZI_H(sve_cmplt_ppzi_h, int16_t, <)
+DO_CMP_PPZI_S(sve_cmplt_ppzi_s, int32_t, <)
+DO_CMP_PPZI_D(sve_cmplt_ppzi_d, int64_t, <)
+
+DO_CMP_PPZI_B(sve_cmple_ppzi_b, int8_t,  <=)
+DO_CMP_PPZI_H(sve_cmple_ppzi_h, int16_t, <=)
+DO_CMP_PPZI_S(sve_cmple_ppzi_s, int32_t, <=)
+DO_CMP_PPZI_D(sve_cmple_ppzi_d, int64_t, <=)
+
+DO_CMP_PPZI_B(sve_cmplo_ppzi_b, uint8_t,  <)
+DO_CMP_PPZI_H(sve_cmplo_ppzi_h, uint16_t, <)
+DO_CMP_PPZI_S(sve_cmplo_ppzi_s, uint32_t, <)
+DO_CMP_PPZI_D(sve_cmplo_ppzi_d, uint64_t, <)
+
+DO_CMP_PPZI_B(sve_cmpls_ppzi_b, uint8_t,  <=)
+DO_CMP_PPZI_H(sve_cmpls_ppzi_h, uint16_t, <=)
+DO_CMP_PPZI_S(sve_cmpls_ppzi_s, uint32_t, <=)
+DO_CMP_PPZI_D(sve_cmpls_ppzi_d, uint64_t, <=)
+
+#undef DO_CMP_PPZI_B
+#undef DO_CMP_PPZI_H
+#undef DO_CMP_PPZI_S
+#undef DO_CMP_PPZI_D
+#undef DO_CMP_PPZI
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ed0e3c48b1..5054d4d91c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -34,6 +34,8 @@
 #include "translate-a64.h"
 
 
+typedef void gen_helper_gvec_flags_3(TCGv_i32, TCGv_ptr, TCGv_ptr,
+                                     TCGv_ptr, TCGv_i32);
 typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
                                      TCGv_ptr, TCGv_ptr, TCGv_i32);
 
@@ -2777,6 +2779,70 @@ DO_PPZW(CMPLS, cmpls)
 
 #undef DO_PPZW
 
+/*
+ *** SVE Integer Compare - Immediate Groups
+ */
+
+static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
+                          gen_helper_gvec_flags_3 *gen_fn)
+{
+    TCGv_ptr pd, zn, pg;
+    unsigned vsz;
+    TCGv_i32 t;
+
+    if (gen_fn == NULL) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    t = tcg_const_i32(simd_desc(vsz, vsz, a->imm));
+    pd = tcg_temp_new_ptr();
+    zn = tcg_temp_new_ptr();
+    pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(pd, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    gen_fn(t, pd, zn, pg, t);
+
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pg);
+
+    do_pred_flags(t);
+
+    tcg_temp_free_i32(t);
+    return true;
+}
+
+#define DO_PPZI(NAME, name) \
+static bool trans_##NAME##_ppzi(DisasContext *s, arg_rpri_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_3 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzi_b, gen_helper_sve_##name##_ppzi_h,   \
+        gen_helper_sve_##name##_ppzi_s, gen_helper_sve_##name##_ppzi_d,   \
+    };                                                                    \
+    return do_ppzi_flags(s, a, fns[a->esz]);                              \
+}
+
+DO_PPZI(CMPEQ, cmpeq)
+DO_PPZI(CMPNE, cmpne)
+DO_PPZI(CMPGT, cmpgt)
+DO_PPZI(CMPGE, cmpge)
+DO_PPZI(CMPHI, cmphi)
+DO_PPZI(CMPHS, cmphs)
+DO_PPZI(CMPLT, cmplt)
+DO_PPZI(CMPLE, cmple)
+DO_PPZI(CMPLO, cmplo)
+DO_PPZI(CMPLS, cmpls)
+
+#undef DO_PPZI
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 76a42193e4..9bc383b085 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -131,6 +131,11 @@
 @rdn_dbm        ........ .. .... dbm:13 rd:5 \
                 &rr_dbm rn=%reg_movprfx
 
+# Predicate output, vector and immediate input,
+# controlling predicate, element size.
+@pd_pg_rn_i7    ........ esz:2 . imm:7 . pg:3 rn:5 . rd:4       &rpri_esz
+@pd_pg_rn_i5    ........ esz:2 . imm:s5 ... pg:3 rn:5 . rd:4    &rpri_esz
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9       ........ ........ ...... rn:5 . rd:4    \
                 &rri imm=%imm9_16_10
@@ -496,6 +501,24 @@ CMPHI_ppzw      00100100 .. 0 ..... 110 ... ..... 1 ....        @pd_pg_rn_rm
 CMPLO_ppzw      00100100 .. 0 ..... 111 ... ..... 0 ....        @pd_pg_rn_rm
 CMPLS_ppzw      00100100 .. 0 ..... 111 ... ..... 1 ....        @pd_pg_rn_rm
 
+### SVE Integer Compare - Unsigned Immediate Group
+
+# SVE integer compare with unsigned immediate
+CMPHS_ppzi      00100100 .. 1 ....... 0 ... ..... 0 ....      @pd_pg_rn_i7
+CMPHI_ppzi      00100100 .. 1 ....... 0 ... ..... 1 ....      @pd_pg_rn_i7
+CMPLO_ppzi      00100100 .. 1 ....... 1 ... ..... 0 ....      @pd_pg_rn_i7
+CMPLS_ppzi      00100100 .. 1 ....... 1 ... ..... 1 ....      @pd_pg_rn_i7
+
+### SVE Integer Compare - Signed Immediate Group
+
+# SVE integer compare with signed immediate
+CMPGE_ppzi      00100101 .. 0 ..... 000 ... ..... 0 ....      @pd_pg_rn_i5
+CMPGT_ppzi      00100101 .. 0 ..... 000 ... ..... 1 ....      @pd_pg_rn_i5
+CMPLT_ppzi      00100101 .. 0 ..... 001 ... ..... 0 ....      @pd_pg_rn_i5
+CMPLE_ppzi      00100101 .. 0 ..... 001 ... ..... 1 ....      @pd_pg_rn_i5
+CMPEQ_ppzi      00100101 .. 0 ..... 100 ... ..... 0 ....      @pd_pg_rn_i5
+CMPNE_ppzi      00100101 .. 0 ..... 100 ... ..... 1 ....      @pd_pg_rn_i5
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

