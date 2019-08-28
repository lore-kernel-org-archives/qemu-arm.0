Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1163900wrs;
        Wed, 28 Aug 2019 12:19:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwc7A//okT0cm5KE1byBChsG+pbEPo9sykRSbqCbAhkeSsq8mO6JY+tcdQYP0414XgSrEjv
X-Received: by 2002:ac8:649:: with SMTP id e9mr5887493qth.135.1567019975685;
        Wed, 28 Aug 2019 12:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019975; cv=none;
        d=google.com; s=arc-20160816;
        b=RG3L3zTfY1C/HplgR1fcwN/kXCq9Ke4qTPNDi5XOdmdK1UBiybmD0zF5BP7kaDpDKN
         9pnZ5Z7PHDwF/UuT+TbMoEPRWJxzGPSEgagLTSs+TvUpfxuT1yNhI052wpGm6OHbwkY1
         1DHMLSgK89yuLo0B0QRnWYsS9O5OMXQeZlTt1H0UNfCCdFlj80sWY3jSLo/nnBByNpU/
         HOJe9U/FRN88xk4YUurPIV3V4vElxMfB8CadIWI+eQoHVNBB5UABSoAAWzUb8K+XDFmG
         txQ2+L9+IBpJAZBVxQ5PIp0rZfzz7Ua5n5B9/BWSlN/Eey4c8Xu6UyC9s1lgK/r+97eL
         D6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=M4p7h/i/Z1XZ25OuZSRZK70uUr5w+EGNQy0NQKl5v38=;
        b=HZKhh1muFuod/Sgcs8mWGfLluTiV6ySceH3Y0lBSVOuhU763WdO14w+Xnhg3QP3MIu
         SXiYbLV0T/RfEv8CLIpH/kWzxn5GKk5LDNfn4kFQ5WMEscMUgHP+Zx/I0TRYKy36D6xf
         c+n2L9QCjnnjxnwltkG4Ks8h17L13LpQWIgEV1ea2sEzYgXxYm9/lI+DIJU5O/JpzuoI
         iBwE1oQUD0ddOu3t3ny35rr7LFtcTXF8zO+lHBoa7q4Hr5G4WvLm/SaI2ovYj7ZYyafj
         59ZahuYkP/cX70aLmvujdhoDy6S3Qx+1qOFYRqokbskbd9CuQQNHhLVHfi3jLs3C6rgb
         3idw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DBgsO1/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x205si162374qkb.207.2019.08.28.12.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DBgsO1/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33Ti-000871-Gv
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G5-0003QI-8g
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G0-0008Ua-Gu
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:27 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33G0-0008TR-6t
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:24 -0400
Received: by mail-pf1-x441.google.com with SMTP id q139so365426pfc.13
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M4p7h/i/Z1XZ25OuZSRZK70uUr5w+EGNQy0NQKl5v38=;
 b=DBgsO1/xWzgPpKNvrbG+YB3HQ4JL62aYAPH+viDgSpAf8VLn0Hmybnp7Q4hGMd2R1d
 Vy1kibEJdR9rtiKYrkr3iD9xBEuT0RAv1Z8VGUUEidmeSdEgy8HhYlvX6EvMKt4xCWTI
 md5hSQIOwO9c3wAc4bA4gEWKBqEt31AQM3miIANLGY24Kt7Vc97ecx/xVtBUYpTsYfCl
 +jwHKBt5opkh2vvacJ/xg1ic+++cPUKUFWG4/MQ1EHQxaZL8UifQV2GxHtL8uO60JZhr
 C8Hwh9v42qHzLEat7EoFdrfs2f3zsJhZrccGTjdkv667+xWJHY3KG3D8Odf58lRP68xk
 TVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M4p7h/i/Z1XZ25OuZSRZK70uUr5w+EGNQy0NQKl5v38=;
 b=PIua3rYNLbts3qcmRUZKXRN4/9EZbcvY/OcqX8Q1gZ3sUGGiDmPDLLPccMXGThbL8N
 VlOVSiuDqw1y5T5t/GvEjKzjVmy2qSLYaEaMjkEE9BTeX3fXxx4oOfTck+hjZmUVK5Iy
 6GaBwo59ZWImiOPJSLPwGi9vhM8kbjM/DT7AL2oKDNNjWHu6t0feocgOL3i7mF05vOJE
 4bX1KS9EU+SAozAthjflZHQHIC6QDqE8UfJvtRgcntlynZgAHJ7NgtW7wD8TnXv6ZIz9
 lLvshQwzs0jh7ez25oEHJto05OtLJljZ7dKH4sAaaRiiqlVuCrhvHJV6eRUs//1fvBj/
 d2yQ==
X-Gm-Message-State: APjAAAWAvm4T2EKaA8Pnjf8p7no16s4oeK768F5yEVpKstfmOvOjmRYT
 Bt3ecpvNvo+hfTuvwCW+YTLjyg==
X-Received: by 2002:a63:2043:: with SMTP id r3mr4797328pgm.311.1567019123045; 
 Wed, 28 Aug 2019 12:05:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:05 -0700
Message-Id: <20190828190456.30315-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 18/69] target/arm: Convert the rest of A32
 Miscelaneous instructions
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fr761RfgS5Mu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Call unallocated_encoding for IS_USER.
---
 target/arm/translate.c | 127 +++++++++++++++--------------------------
 target/arm/a32.decode  |   8 +++
 target/arm/t32.decode  |   5 ++
 3 files changed, 58 insertions(+), 82 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 203b6160da..ad4b3c55c6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8498,6 +8498,47 @@ static bool trans_ERET(DisasContext *s, arg_ERET *a)
     return true;
 }
 
+static bool trans_HLT(DisasContext *s, arg_HLT *a)
+{
+    gen_hlt(s, a->imm);
+    return true;
+}
+
+static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
+{
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
+    return true;
+}
+
+static bool trans_HVC(DisasContext *s, arg_HVC *a)
+{
+    if (!ENABLE_ARCH_7 || arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        unallocated_encoding(s);
+    } else {
+        gen_hvc(s, a->imm);
+    }
+    return true;
+}
+
+static bool trans_SMC(DisasContext *s, arg_SMC *a)
+{
+    if (!ENABLE_ARCH_6K || arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        unallocated_encoding(s);
+    } else {
+        gen_smc(s);
+    }
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8778,68 +8819,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     } else if ((insn & 0x0f900000) == 0x01000000
                && (insn & 0x00000090) != 0x00000090) {
         /* miscellaneous instructions */
-        op1 = (insn >> 21) & 3;
-        sh = (insn >> 4) & 0xf;
-        rm = insn & 0xf;
-        switch (sh) {
-        case 0x0:
-            /* MSR/MRS (banked/register) */
-            /* All done in decodetree.  Illegal ops already signalled.  */
-            g_assert_not_reached();
-        case 0x1: /* bx, clz */
-        case 0x2: /* bxj */
-        case 0x3: /* blx */
-        case 0x4: /* crc32 */
-            /* All done in decodetree.  Illegal ops reach here.  */
-            goto illegal_op;
-        case 0x5: /* Saturating addition and subtraction.  */
-        case 0x6: /* ERET */
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-        case 7:
-        {
-            int imm16 = extract32(insn, 0, 4) | (extract32(insn, 8, 12) << 4);
-            switch (op1) {
-            case 0:
-                /* HLT */
-                gen_hlt(s, imm16);
-                break;
-            case 1:
-                /* bkpt */
-                ARCH(5);
-                gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm16, false));
-                break;
-            case 2:
-                /* Hypervisor call (v7) */
-                ARCH(7);
-                if (IS_USER(s)) {
-                    goto illegal_op;
-                }
-                gen_hvc(s, imm16);
-                break;
-            case 3:
-                /* Secure monitor call (v6+) */
-                ARCH(6K);
-                if (IS_USER(s)) {
-                    goto illegal_op;
-                }
-                gen_smc(s);
-                break;
-            default:
-                g_assert_not_reached();
-            }
-            break;
-        }
-        case 0x8:
-        case 0xa:
-        case 0xc:
-        case 0xe:
-            /* Halfword multiply and multiply accumulate.  */
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-        default:
-            goto illegal_op;
-        }
+        /* All done in decodetree.  Illegal ops reach here.  */
+        goto illegal_op;
     } else if (((insn & 0x0e000000) == 0 &&
                 (insn & 0x00000090) != 0x90) ||
                ((insn & 0x0e000000) == (1 << 25))) {
@@ -10497,26 +10478,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     goto illegal_op;
 
                 if (insn & (1 << 26)) {
-                    if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                        goto illegal_op;
-                    }
-                    if (!(insn & (1 << 20))) {
-                        /* Hypervisor call (v7) */
-                        int imm16 = extract32(insn, 16, 4) << 12
-                            | extract32(insn, 0, 12);
-                        ARCH(7);
-                        if (IS_USER(s)) {
-                            goto illegal_op;
-                        }
-                        gen_hvc(s, imm16);
-                    } else {
-                        /* Secure monitor call (v6+) */
-                        ARCH(6K);
-                        if (IS_USER(s)) {
-                            goto illegal_op;
-                        }
-                        gen_smc(s);
-                    }
+                    /* hvc, smc, in decodetree */
+                    goto illegal_op;
                 } else {
                     op = (insn >> 20) & 7;
                     switch (op) {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 52a66dd1d5..c7f156be6d 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -31,6 +31,7 @@
 &rrr             rd rn rm
 &rr              rd rm
 &r               rm
+&i               imm
 &msr_reg         rn r mask
 &mrs_reg         rd r
 &msr_bank        rn r sysm
@@ -196,9 +197,11 @@ CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
 # Miscellaneous instructions
 
 %sysm            8:1 16:4
+%imm16_8_0       8:12 0:4
 
 @rm              ---- .... .... .... .... .... .... rm:4      &r
 @rdm             ---- .... .... .... rd:4 .... .... rm:4      &rr
+@i16             ---- .... .... .... .... .... .... ....      &i imm=%imm16_8_0
 
 MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
 MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
@@ -213,3 +216,8 @@ BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
 CLZ              .... 0001 0110 1111 .... 1111 0001 ....      @rdm
 
 ERET             ---- 0001 0110 0000 0000 0000 0110 1110
+
+HLT              .... 0001 0000 .... .... .... 0111 ....      @i16
+BKPT             .... 0001 0010 .... .... .... 0111 ....      @i16
+HVC              .... 0001 0100 .... .... .... 0111 ....      @i16
+SMC              ---- 0001 0110 0000 0000 0000 0111 imm:4     &i
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 6236d28b99..5116c6165a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -28,6 +28,7 @@
 &rrr             !extern rd rn rm
 &rr              !extern rd rm
 &r               !extern rm
+&i               !extern imm
 &msr_reg         !extern rn r mask
 &mrs_reg         !extern rd r
 &msr_bank        !extern rn r sysm
@@ -189,6 +190,7 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
 
 %msr_sysm        4:1 8:4
 %mrs_sysm        4:1 16:4
+%imm16_16_0      16:4 0:12
 
 {
   {
@@ -226,4 +228,7 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
     SUB_rri      1111 0011 1101 1110 1000 1111 imm:8 \
                  &s_rri_rot rot=0 s=1 rd=15 rn=14
   }
+  SMC            1111 0111 1111 imm:4 1000 0000 0000 0000     &i
+  HVC            1111 0111 1110 ....  1000 .... .... ....     \
+                 &i imm=%imm16_16_0
 }
-- 
2.17.1

