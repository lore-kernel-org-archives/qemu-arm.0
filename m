Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4224217wrg;
        Tue, 11 Jun 2019 04:20:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy65vFC6a+EIwmMqy9HhF0LRMNcDz8BjnCuLvQOIlZrtQdRoiOVOwgqGPnRd/c/bhUUEZ4Q
X-Received: by 2002:a37:660b:: with SMTP id a11mr59612333qkc.342.1560252057491;
        Tue, 11 Jun 2019 04:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252057; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJPaj6AZ4unOBu2kkMm8OSULsJP6zq6zgF8724ofZod6OadmRyo2SnP5ZwjSLugbuq
         qmIRnRuhKomNMM22R5IptlaMnKcExmy/W6cOyjgj/zUNUNNchqS7qAP/qf24uLzSkFuH
         ZKjUdS31Dy2k1wzSqOPlhGlDa0MGS0sQZhvXOfWTEsP4fMpUtlooCC+cm0ShiTBFy+uz
         Bz1TY/PGY2VVFxkM24IGgft48IQ6Z90ToDHjaBBD314WEILqZA3XtlQqzsVdc3Dp21me
         uOiZ1fth6z3almv3AHbXvjUB0tWUO2bDqbB9PGso1knI4TRK4TIgsrcjrFQFfrawv5N7
         qKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ArclSEoRm2zBs6YVh3NYURVc6boo9wJxlzan6nD1jCM=;
        b=zK1q0tyM9BaLNXxeVJpbXfkpLaMzswDIhXghrTna2YlPkMBi6h3AYoErFR3TT/d+JM
         x6A9vst/zgMQhBGVvy4oiYE+WpLMEezz+f2IRBeS5TbI+6wu9eGptNzHoYmbftezHgF4
         kYJY3uQSiwrQ+RVyswQEyVH1n4C4f75mCHeX3Uq+RVk0fWmovW3I9yMSlCzEG9CjHXlm
         jqIMHG9XqZgfhlWxZrDOuCZlXiNxesWZeA4syVmK5K0pbmzQaR/W823JuzbrhUYDDYok
         rKDQtOVIoLE4UlE84ewzbARhV6n9sRtWsU3UoRR8MoWJc+cQaz7U9sAROaFoGhYJYj43
         4YSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MDv3GQGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si516880qtu.273.2019.06.11.04.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MDv3GQGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haepk-0005AX-U8
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39617)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQP-0007bT-AR
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007r2-VJ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:45 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42832)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007gk-JO
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wr1-x441.google.com with SMTP id x17so12457692wrl.9
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArclSEoRm2zBs6YVh3NYURVc6boo9wJxlzan6nD1jCM=;
 b=MDv3GQGDV37DbvwmtT3ayV+ug4cRNFprEwYhiO9vyIq/QSwpVWWDXY4P4uyH78y0oA
 BfB6mX0lss1ov48mInGJnxc6sV1kg7SUDkil+BdmQbD7bJWJaVtTJfiNK2Zt5xu4YhhM
 rRUU84N1eqSubhzPGH7IcSO43r6fcFGT3I/M69rUUsyTEsb7uBJ4Skjx53P72HQqKwEq
 w+g6UNQXZ5P8YdaBK/yn22mjp0uzwE8O8Ycej9T3Q5bfcHIHoFeo7zZonLAYX8w94PcI
 ozrCeiAosJJPlMxcoNCNffbx7sy46nubkOrw1TkpKktGZWrt17e7GkZlVxu/acHfsg/M
 0Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArclSEoRm2zBs6YVh3NYURVc6boo9wJxlzan6nD1jCM=;
 b=X5QewGWIMmx3lMT3K1ZYApHhMSLJwM44iHGgAPntJ+YJHVqhLCZCbDHJ4BR0ZkABgO
 1GrdvE8Lapv/uXKRAs1uvvagz4FVEHCteY1IHG8EEebF7l9o8+FnaIhDhrEB4wSoSpiA
 hDJZhxUhHM6bA0C9PNoYuzCz6mLedXmX0Bl2GbaRsg78O5cftQNsxi4aBrPT9N3XuqGk
 wOaW/mxL4ZbyCoTtxDEHqPr9ur7fKN3Am1Sos3UYE5GAuSGPto2sZtI3GOGjSVqOwwUb
 aJIek+icAeBgPjeNGht7YRFdFE3lCVq5ZxaKgOFjA0gJV+DI+1gtPpdaXQNXpg0nfd3P
 kqIA==
X-Gm-Message-State: APjAAAWOXE4nIlmlvIVS4twFQgaCTfP6Zm4LkefYpuPboNDFqM9cI53b
 flC1g2R9PqsNiIap5jKnXxsfLrqIvotkiQ==
X-Received: by 2002:a5d:5510:: with SMTP id b16mr14634904wrv.267.1560250467310; 
 Tue, 11 Jun 2019 03:54:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:40 +0100
Message-Id: <20190611105351.9871-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2 31/42] target/arm: Convert VSQRT to decodetree
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
X-TUID: O/KpC5SkV/Kv

Convert the VSQRT instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 20 ++++++++++++++++++++
 target/arm/translate.c         | 14 +-------------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 6e06b2a130a..ae2f77a873b 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1908,3 +1908,23 @@ static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
 {
     return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
 }
+
+static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
+{
+    gen_helper_vfp_sqrts(vd, vm, cpu_env);
+}
+
+static bool trans_VSQRT_sp(DisasContext *s, arg_VSQRT_sp *a)
+{
+    return do_vfp_2op_sp(s, gen_VSQRT_sp, a->vd, a->vm);
+}
+
+static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
+{
+    gen_helper_vfp_sqrtd(vd, vm, cpu_env);
+}
+
+static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
+{
+    return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b0eecb6ca8f..ce805f0ab28 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1390,14 +1390,6 @@ static inline void gen_vfp_neg(int dp)
         gen_helper_vfp_negs(cpu_F0s, cpu_F0s);
 }
 
-static inline void gen_vfp_sqrt(int dp)
-{
-    if (dp)
-        gen_helper_vfp_sqrtd(cpu_F0d, cpu_F0d, cpu_env);
-    else
-        gen_helper_vfp_sqrts(cpu_F0s, cpu_F0s, cpu_env);
-}
-
 static inline void gen_vfp_cmp(int dp)
 {
     if (dp)
@@ -3098,7 +3090,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 1 ... 2:
+                case 1 ... 3:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3112,7 +3104,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
                 case 0x00: /* vmov */
-                case 0x03: /* vsqrt */
                     break;
 
                 case 0x04: /* vcvtb.f64.f16, vcvtb.f32.f16 */
@@ -3290,9 +3281,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 0: /* cpy */
                         /* no-op */
                         break;
-                    case 3: /* sqrt */
-                        gen_vfp_sqrt(dp);
-                        break;
                     case 4: /* vcvtb.f32.f16, vcvtb.f64.f16 */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(false);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 79e41963be4..2780e1ed9ea 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -166,3 +166,8 @@ VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 .... \
              vd=%vd_sp vm=%vm_sp
 VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

