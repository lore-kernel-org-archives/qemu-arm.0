Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1802760lfb;
        Mon, 6 Jun 2022 19:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhvlOOo5bb9PPkIChY6UsNGDSrqFBYFOgWebcnI57pHWdkqR+nQBf5Xo8fn8E+OmeiEt6+
X-Received: by 2002:a37:510:0:b0:6a6:ab9e:1b80 with SMTP id 16-20020a370510000000b006a6ab9e1b80mr10280840qkf.770.1654570077335;
        Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570077; cv=none;
        d=google.com; s=arc-20160816;
        b=ylH/GinRCoeps5DDbmduQpu+wf+MQ0PG8RG1vId6ICqghYlh/piiVPIDFwQRZZv5VW
         zaDMvEiWWVgzBsmT9uTaaVjegHHyzBk/gO4s2couYl/X9W9qtoHMWMdFFiwqDr+Z8GDM
         WSXSy38aHYS1cr03Y5bS7QFqvdeDHuvtToMbDLlQJwjTqNVTyPzccMTJpzFEm9R+RHNx
         IDMyMeQNAFdYswVfx1U8mirMdfa+BpaxJ51k9K7NtLCCTwBlAx1vvzqCOsiHTcK8y+lN
         rhZBDDvrofsO5ndudVM3VfhO8A1pv6A39m5CxwsuMLijl4uu3gIJReP6gMjNFLg8DKK4
         Hp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T8AfpmQwL0+E6fQxm6ojECpdw/9TThJiZv66f6M94Xg=;
        b=njrP5cJr2Mq80x7kKkhRaRJUcdwUA96gRuK1PUByh3RJcEUr/Zn/xEkVLbaa6lIT3n
         xmuZ/3vBRk/VfbV9URUr9+Fki+2ljX2VJ7IH8GhtPgPIFpn+seU+VAVOhN5nqXEAcNZ8
         dbmxgyXV8AQqo+fdrLy6muA1cxr8YOHJryt5XaiIvCIPzGqjV0NF+d/OXT4lCbfDG8Iq
         dUex9VgdmpXsr2ddWKCqWSUdVyY/mEbL+Yc8icFt0xA9RhkuL4tp2JbFCwPrCmllmRwC
         O6y9TCq5CBXpju5atmJcABZfoDVXYVLScydi9vuwoblzaZTqiTJlzhgtV0ITYcowFa47
         OXCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTsaaHAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020ac85cce000000b00304f1f952bdsi1513630qta.531.2022.06.06.19.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTsaaHAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPG8-0006Vb-O7
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFs-0006US-W4
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:41 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFq-0000Gv-OZ
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id j7so14418215pjn.4
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8AfpmQwL0+E6fQxm6ojECpdw/9TThJiZv66f6M94Xg=;
 b=YTsaaHAYR0BLZT+M420CbUXR8IC/0ANMMBDZrQ+OedSOF513xc0LHmg0tad5fb4OWw
 v8xVuOYgfqnMLjuBwnYsAdlWPDBKgSvL5GpNjsNNsFB3K0d5jtmzih4Mrh5d+4tu0DPj
 ZHPTp+F78A1LuFeaV5VmvHIgSasmiXPVIIYPA4BserO+kLGzqwYigOFkT7lEeD3eNWuq
 n+6/JRNELAJL34DgUPbSi6susoiAdjUmd+tCGO8GPC7cB00dnqTczc69c6qCg8UQ3+IE
 92U5oGzWYCwqt4kI7imXzsYB9quay9rDpnFwDkudS4iOjCe60BTK1RFJDyoCAEjfkIJq
 MHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8AfpmQwL0+E6fQxm6ojECpdw/9TThJiZv66f6M94Xg=;
 b=SzXQWndUpL14SE6d1RekNL8g4k5JC/Gj/umUlrHJyGNfPxrRXor6kvZWo69aSdYByq
 n2nBrATSYlzAlDBLovNujnAvloH0VTmGompWxJZWoe9CyL/Qike9uVzlaHnhchy3MIwP
 8uIMsV1Uswl7haBK9L8b8gCVIHsHfn+D/BctVerNSn1XPPF1ZGYjqdeN18i5Ien/wYV1
 ddfC2l+5vz7/keWdrvXgn4icl/LbZWX5tmQZb3BtBcBjz3XZvheByYLjtgWlqEcf4Rhe
 hXY4ndg5ps0y+uH7Z8t16CxU1W83b2eRbfbYYrlbJjGI/El1LTWgd2F6BXkIsZoG4tIh
 5OAg==
X-Gm-Message-State: AOAM531u6J0gaJSi7muPoTQ/PcWKmFn+C9L+jNksAeks+ikTL4BOqhI+
 w5b84cw6M0Ah0IFrekh1D6ckyQ==
X-Received: by 2002:a17:902:e80b:b0:167:5e77:e697 with SMTP id
 u11-20020a170902e80b00b001675e77e697mr15713154plg.93.1654570057544; 
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/25] target/arm: Add coproc parameter to
 syn_fp_access_trap
Date: Mon,  6 Jun 2022 19:47:11 -0700
Message-Id: <20220607024734.541321-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0OdGlB+Xn12

With ARMv8, this field is always RES0.
With ARMv7, targeting EL2 and TA=0, it is always 0xA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h      |  7 ++++---
 target/arm/translate-a64.c |  3 ++-
 target/arm/translate-vfp.c | 14 ++++++++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d..c105f9e6ba 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -185,12 +185,13 @@ static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
         | (rt2 << 10) | (rt << 5) | (crm << 1) | isread;
 }
 
-static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
+static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit,
+                                          int coproc)
 {
-    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
+    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 */
     return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
         | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | 0xa;
+        | (cv << 24) | (cond << 20) | coproc;
 }
 
 static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 935e1929bb..14b90a37ea 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1162,7 +1162,8 @@ static bool fp_access_check(DisasContext *s)
         s->fp_access_checked = true;
 
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_fp_access_trap(1, 0xe, false, 0),
+                           s->fp_excp_el);
         return false;
     }
     s->fp_access_checked = true;
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 40a513b822..0f797c56fd 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -219,8 +219,18 @@ static void gen_update_fp_context(DisasContext *s)
 static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        /*
+         * The full syndrome is only used for HSR when HCPTR traps:
+         * For v8, when TA==0, coproc is RES0.
+         * For v7, any use of a Floating-point instruction or access
+         * to a Floating-point Extension register that is trapped to
+         * Hyp mode because of a trap configured in the HCPTR sets
+         * this field to 0xA.
+         */
+        int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
+        uint32_t syn = syn_fp_access_trap(1, 0xe, false, coproc);
+
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
     }
 
-- 
2.34.1

