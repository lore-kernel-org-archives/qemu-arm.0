Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545252ejb;
        Fri, 2 Jun 2023 19:37:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7EDH8SZAo7f319SUtEtnS03HqNv1rRZeUbOBBJ78ApBGs9WzmsoaxA18VcqG5p7qiUPny6
X-Received: by 2002:a05:6214:1bcc:b0:62a:f634:882a with SMTP id m12-20020a0562141bcc00b0062af634882amr499308qvc.33.1685759873785;
        Fri, 02 Jun 2023 19:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759873; cv=none;
        d=google.com; s=arc-20160816;
        b=ow5p7upGBkQ+jxnwtJUyw1VzKqxX8u9xT8GjwNKUW4dt9H3o4PzyfW6bpYFXULp9DE
         lDd3A6uMerkvSd4vdzH/5WtOEnzQjWoBcNogCFdfesMM+AOXj7evynrRF9BkTDHdqgEw
         rNGe4d93aYUwM5SgDWsq4lJXHZT7K7G2OIcMnjW61TL99DqvxkD/zOLmi0CV4HohlQTe
         za3BSpKyD1ekTVHyUZWZDk5sD0p2Jf8PpwoL32156jvua/fx8LgF3PYshiTfu91aJgnd
         VePukOYkiArYtqmSbbSKKiLw/KAP0yPOYd3iJirV3syUFORncgvDCCi5NJtuEj8iIUTB
         RZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tk9bxJV83GbbH2kAWa5wG6tFQX4+USMPaSbOItp9Yr4=;
        b=Jr79xIwzbECbFRieo2c69jQSvPqJQ1+vQ3otWf1ahJwh75UjwCStGWAPh81hU21Jet
         jdfluVGKirqkMPSUpaxXsJC5tyYCKOYf3+8Jef4KMF/EAkzl6e6MduncC7LhuYKIsm7u
         0708m3/DELuOci/MHoQvL7fjZFr80/V3D2XfNkXoxN8jr5Iv0HvlDsVI7qMl/C9sPKvt
         TV+doKs2MiazXHjrl2aY7z7r56dr3UQc8WOo5rNkVmhCJGXFsZ4u67roYd8sKb/1OkBx
         vCrFZIluDESAfqXKoeTwviDYSAHzkbJ5QvvZC6xJiJyI7ySRlZcOPSeabkbEckmaArD9
         bEfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hubYscbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a0562141bc700b00628718b1300si1858019qvc.94.2023.06.02.19.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hubYscbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7d-0002QS-Kw; Fri, 02 Jun 2023 22:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6r-0000iC-Um
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:18 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6U-0004up-GV
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:17 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-b9a7e639656so3066608276.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759692; x=1688351692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tk9bxJV83GbbH2kAWa5wG6tFQX4+USMPaSbOItp9Yr4=;
 b=hubYscbVYaGRJ6WCxlPBRl43PB2R6SzU8tCFZqcHReJCSo6MbjpKqHtHgh7J3OXcfN
 vzW702l8WYTg3z3gKs3KDmpMk6pLPnoCWY2FfT8P1wC5hPrOvQI/28tDb27xPUfdonz+
 Id7bzSxK297QMVYrONqMiRDQOe3jhv/vW9jJ58OMq7FkueSd6HNkA2cUkisI1TieEXhi
 NxluAacMJ4eExvPFzMaEfQHY9GuCzG1NpZebfv83XctKThcYmq+0KxO1RAFqZRr7yuF3
 YXOcojqGjC5ZCefTDCWtvKHpDFbn258cqgxzdlcJAsMnOicxTlvgBh6Cx954EHj7PHmc
 mXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759692; x=1688351692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tk9bxJV83GbbH2kAWa5wG6tFQX4+USMPaSbOItp9Yr4=;
 b=GMazPIM3NoC7ltOfmtGVl87dgMs/8N/E5DvyNqds/8JCzPURlx/Pu+d0E0STnFFO76
 cdh4DgW7eMtOl36MrKyeqa1IH5pmeBhuQ7QRTZHtO8I46fAUb01wr1NXo0Cl8CYRuUOK
 8KCB527R2RbRxgAW0s05QJNGcmxO5Jsb1jbbtdFT5QOXrigso5tXAjb7Jzu7IizHd0c6
 W9ALJty2mdplZwVzrO5bmkPjjNHHaIPKt82J70DayNnPyb2gVrBdUDabZFks8StfSyMp
 url+GeSDqcRfnPgG8OTL3pRvXijkrM5hzmdxnrvzLlyFzUAsQpkby9zt9hw7RtKhZNMO
 Fx7Q==
X-Gm-Message-State: AC+VfDwZ4Zxeqkw4K/jzzYrTLyq+BDhwNtLbQ1+rQkVrN4+YQj5+gk4B
 GQfxc8NLaF2ZvTYAsHw4cdrmvQ==
X-Received: by 2002:a25:be92:0:b0:ba5:ee5a:f41c with SMTP id
 i18-20020a25be92000000b00ba5ee5af41cmr5243743ybk.1.1685759692663; 
 Fri, 02 Jun 2023 19:34:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 27/35] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Date: Fri,  2 Jun 2023 19:34:18 -0700
Message-Id: <20230603023426.1064431-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 30Pz1OYzd9o5

This implements the AES64DSM instruction.  This was the last use
of aes64_operation and its support macros, so remove them all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 101 ++++-------------------------------
 1 file changed, 10 insertions(+), 91 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 71694b787c..affa8292d1 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -104,96 +104,6 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     return aes32_operation(shamt, rs1, rs2, false, false);
 }
 
-#define BY(X, I) ((X >> (8 * I)) & 0xFF)
-
-#define AES_SHIFROWS_LO(RS1, RS2) ( \
-    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
-    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
-    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
-    AES_GFMUL(BY(COL, B0), 2))
-
-#define AES_MIXCOLUMN(COL) ( \
-    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
-
-#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
-    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
-    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
-
-#define AES_INVMIXCOLUMN(COL) ( \
-    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
-    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
-
-static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
-                                           bool enc, bool mix)
-{
-    uint64_t RS1 = rs1;
-    uint64_t RS2 = rs2;
-    uint64_t result;
-    uint64_t temp;
-    uint32_t col_0;
-    uint32_t col_1;
-
-    if (enc) {
-        temp = AES_SHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_MIXCOLUMN(col_0);
-            col_1 = AES_MIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    } else {
-        temp = AES_INVSHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_INVMIXCOLUMN(col_0);
-            col_1 = AES_INVMIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    }
-
-    return result;
-}
-
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
     AESState t, z = { };
@@ -230,7 +140,16 @@ target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, true);
+    AESState t, z = { };
+
+    /*
+     * This instruction does not include a round key,
+     * so supply a zero to our primitive.
+     */
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_IMC_AK(&t, &t, &z, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

