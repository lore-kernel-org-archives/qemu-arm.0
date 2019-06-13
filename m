Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp43567wrg;
        Thu, 13 Jun 2019 11:06:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNPhveyw7iOnyx+l6XPx+2BtMeNh6cUS+KqB1z1i6SC54wxmqFx9iQ+AgxhsSYfAnHtSAk
X-Received: by 2002:a0c:c612:: with SMTP id v18mr4666330qvi.215.1560449205407;
        Thu, 13 Jun 2019 11:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449205; cv=none;
        d=google.com; s=arc-20160816;
        b=oR+xw9LWwGpRWYEvq+V6prl1M6wQsoNhzoTTHrDQIS3pkqgCTrIvfzlpts7gEXz300
         jl6jfBvEdh9p/ASaxYvg33MgiIwBm6MVMJzFr5h7NwLNBwj7kGNvOamiYjjXCme53Yc1
         1MC6VQ+OnnPnGmCiAUwuCcUjrg6RckZHrIvxe0DN/eb2WPH6ablEkEEeQMqpgEgfK9JR
         TvrWTHBcSLd5I/kSjydGM2/SAUwXTaoQfYABIKNDYXvyL9rP02bHR+flQ2JxgX61mrfG
         upbvRgPlrZau7PRMS/2+tPJToQsC/1aDRUNWYsVgCH/hcDdX52kcwzC2wanZdW2H7pvp
         jlbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=G+NyIHdm+2ansJRDNwYfzFl09GqHtSLyhidznXncrP4=;
        b=l17ckC3+bbCJr5S2WGFf9Zt/1eTg6xB0O/aX4uuOynmAaqYFsZugLPKj6zod/XHhgu
         CF3OxVYMVJUpCXqvktgARQYJjV7CEieojT5e0gr1cdvJwVRPSK74lVtcWcp5g/LqJ3Cw
         vdnhHWOiL7iNN/vA6aXvlXQxK5DHgmuEQM0wJw2He2fgN6oI25tg2P0zMqpPSlJJ7q68
         E6HUPp+vTa09gYW3By1swC+7ga7LwQ1pKaE4uOU7RD+12v770w5nbarrGR0ZtsAHlPxc
         G/Zxf5R186dI3IaOjDvLp/511hGrTc/5niV4MLQoW+OjcabukCySg038sh78pT6UPH2Q
         1+nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EB3n0tHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si187109qvc.135.2019.06.13.11.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EB3n0tHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbU7X-00040g-44
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlI-00042w-Hq
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003Ku-SC
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:40 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41759)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0001vP-Gd
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id c2so21501486wrm.8
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+NyIHdm+2ansJRDNwYfzFl09GqHtSLyhidznXncrP4=;
 b=EB3n0tHSeM8OdTtRCrXDwLIA7a5NtocaQAGVRmCKhr4M5z3CEraFBqaCqVh0TJGjte
 AC4x7VSu8/IJBL3wNKnBxSGIneUx2OE9MvwEH5aonmgt973LWwPkjyJfFRv9FL/pNwUI
 hHckFN02VP+lHIiZo+TOPNADPPji5waAfaNkW9QEhB/YkGIpB/4UlhSbGmFYqMGeTjeC
 OXGhsihjUSnE5xuYrojaF5RozvXSKz8h7qi+uAWzqH/3Fyr/10fj5LymSdLlxW0d4ycN
 /pBZYLx+7uEu68FlIIXPw3YAyFWKlJnOsA48mtxBZClRv9vrYWTwQJB8dZx2vdTHNTC5
 nBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+NyIHdm+2ansJRDNwYfzFl09GqHtSLyhidznXncrP4=;
 b=U0KxNilCw8uSJOgA6z/CGSaYAP/9sCmzGZSlR0jL1/cMn1A/Lnaizjvf0j24eIpwLy
 TTz146H1ZknsFCmvTPGJa13Ydl6HJMZyiGDHdcQHeOSSypMoe1oecUQRArv6oFDq3w7Y
 0EbW+qyJgT020TiCpNYD6ZIoQDhJfe/2xQ+rpidS/wr8hDdBctT4GgV5P+BeApTDsVQY
 EeHbjjqkSGbMKFWo2jJLDjejcwT6LlwasEW/jGwnfhY4CxfBBAhZkNZ7M0Yl+gQC15YF
 6E3IyVZmFIoJZrfWiR7Si16Ui9W4Dv37cqnn1clptBNeiDFtGxi0zKLCGhd/aer39hOI
 Tl4Q==
X-Gm-Message-State: APjAAAVvaw1a9oxm0Rcal2QPwWaY90wJwg6y/rZlN5WBlQ144y1SruZF
 8+JwXrpldk4DXt52bJ1es3ENmYatM1OT3g==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr14515369wrw.154.1560443960508; 
 Thu, 13 Jun 2019 09:39:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:06 +0100
Message-Id: <20190613163917.28589-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 01/12] target/arm: Move vfp_expand_imm() to
 translate.[ch]
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /l6czainOlKA

We want to use vfp_expand_imm() in the AArch32 VFP decode;
move it from the a64-only header/source file to the
AArch32 one (which is always compiled even for AArch64).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h     |  1 -
 target/arm/translate.h         |  7 +++++++
 target/arm/translate-a64.c     | 32 --------------------------------
 target/arm/translate-vfp.inc.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 9569bc5963d..9ab40872d85 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -39,7 +39,6 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
-uint64_t vfp_expand_imm(int size, uint8_t imm8);
 bool sve_access_check(DisasContext *s);
 
 /* We should have at some point before trying to access an FP register
diff --git a/target/arm/translate.h b/target/arm/translate.h
index dc06dce7675..bc1617809da 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -237,6 +237,13 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
+/*
+ * Given a VFP floating point constant encoded into an 8 bit immediate in an
+ * instruction, expand it to the actual constant value of the specified
+ * size, as per the VFPExpandImm() pseudocode in the Arm ARM.
+ */
+uint64_t vfp_expand_imm(int size, uint8_t imm8);
+
 /* Vector operations shared between ARM and AArch64.  */
 extern const GVecGen3 mla_op[4];
 extern const GVecGen3 mls_op[4];
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ae739f65756..97f4164fbbc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6380,38 +6380,6 @@ static void disas_fp_3src(DisasContext *s, uint32_t insn)
     }
 }
 
-/* The imm8 encodes the sign bit, enough bits to represent an exponent in
- * the range 01....1xx to 10....0xx, and the most significant 4 bits of
- * the mantissa; see VFPExpandImm() in the v8 ARM ARM.
- */
-uint64_t vfp_expand_imm(int size, uint8_t imm8)
-{
-    uint64_t imm;
-
-    switch (size) {
-    case MO_64:
-        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
-            (extract32(imm8, 6, 1) ? 0x3fc0 : 0x4000) |
-            extract32(imm8, 0, 6);
-        imm <<= 48;
-        break;
-    case MO_32:
-        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
-            (extract32(imm8, 6, 1) ? 0x3e00 : 0x4000) |
-            (extract32(imm8, 0, 6) << 3);
-        imm <<= 16;
-        break;
-    case MO_16:
-        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
-            (extract32(imm8, 6, 1) ? 0x3000 : 0x4000) |
-            (extract32(imm8, 0, 6) << 6);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    return imm;
-}
-
 /* Floating point immediate
  *   31  30  29 28       24 23  22  21 20        13 12   10 9    5 4    0
  * +---+---+---+-----------+------+---+------------+-------+------+------+
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 709fc65374d..a66084f6e36 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -30,6 +30,39 @@
 #include "decode-vfp.inc.c"
 #include "decode-vfp-uncond.inc.c"
 
+/*
+ * The imm8 encodes the sign bit, enough bits to represent an exponent in
+ * the range 01....1xx to 10....0xx, and the most significant 4 bits of
+ * the mantissa; see VFPExpandImm() in the v8 ARM ARM.
+ */
+uint64_t vfp_expand_imm(int size, uint8_t imm8)
+{
+    uint64_t imm;
+
+    switch (size) {
+    case MO_64:
+        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
+            (extract32(imm8, 6, 1) ? 0x3fc0 : 0x4000) |
+            extract32(imm8, 0, 6);
+        imm <<= 48;
+        break;
+    case MO_32:
+        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
+            (extract32(imm8, 6, 1) ? 0x3e00 : 0x4000) |
+            (extract32(imm8, 0, 6) << 3);
+        imm <<= 16;
+        break;
+    case MO_16:
+        imm = (extract32(imm8, 7, 1) ? 0x8000 : 0) |
+            (extract32(imm8, 6, 1) ? 0x3000 : 0x4000) |
+            (extract32(imm8, 0, 6) << 6);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return imm;
+}
+
 /*
  * Return the offset of a 16-bit half of the specified VFP single-precision
  * register. If top is true, returns the top 16 bits; otherwise the bottom
-- 
2.20.1

