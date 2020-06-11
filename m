Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1497254lfc;
        Thu, 11 Jun 2020 07:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3ESWDM8M1JKKYAamRJyq3MZ8UvExfPknG+wZmw1J7fJmTxAaaTftxa870WpYNGJIma8n1
X-Received: by 2002:a5b:942:: with SMTP id x2mr6318765ybq.273.1591886783329;
        Thu, 11 Jun 2020 07:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591886783; cv=none;
        d=google.com; s=arc-20160816;
        b=oPOpT52ONIJa7s+sNQMAjWBhgqUp/ise+k6bRGi08WRg0HhPTsbhjG7Gf2Xp0qQd1Y
         KBtEaLS/+pTb4YLEEBy1VikFUY1ikYy0eO145gahkQnpYtd2ZBRL8+tKaQGLdGMW2CzJ
         /ITG2JTbHfQR2/0ksOjbhbOpyiOJxF5Ai1gUnJi+u39c7yX1bi0P9Ruta8kvGsGyLMdS
         jkA3ZAvHNnafKK1r6trIy3bprtxXbmvhllwAdC9o4FDFz0FlRYT2cyhr3+NzbV7/PVwK
         NjC8ew8gcci0MacGl3gFX1YpRqjvsdxeuRsjf+uBVlmmOD+0G3Tv5wwDEm4VVDdkxj1o
         xCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wXS6Jvw/GsSQRzbLxX/W7xj1FrkzmEuqqbzjBJFsOR0=;
        b=mzXFz8s+q2y70XrkkVNgbB+u3bawpmbkQPtEWTi0UWM3qFxc/XWPQ/fpN65HeW2RIM
         i+dSo6qATlI2MCDcXIFPg7C0zA8ql2M0Z55FBGnjAeKG8j77wDNvMI0C/N3kxR1SPIOd
         zp76JcERixq9Z2jpdYB7LUnLeU8ajAfQKjvYPI4mdPvJEAo1gQ2N8+e91Y2PafgCFevw
         Tj1oCyuRTQuVbEMu1xhYLZXRzUh1phHB1KiDOXP/vsYoSmEcs5QT9F+17W6Dz4WLufR4
         w1GiX0T69GiAhpWc1SbCUs4LSoSFljDAdaohCmWzb1rwPZB22CqMX1qBJbA+MsU6nLI0
         VyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFoCLSAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si2809220ybh.9.2020.06.11.07.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFoCLSAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOTF-00021o-OS
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSn-0001WH-0T
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:53 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37019)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSh-0003q7-Kk
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:51 -0400
Received: by mail-wm1-x343.google.com with SMTP id y20so5318045wmi.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXS6Jvw/GsSQRzbLxX/W7xj1FrkzmEuqqbzjBJFsOR0=;
 b=wFoCLSAgc5g40uPU2llbxpOqxSM74OV2GVb1HeAEKcEx8PJioV6K8MVDjTXak/sLgk
 x2CpBpbJach8FfpbBcyNmOzVP0K2mkXtkb9qK+OaphKHdknCdIj21V1gG5HB3eg7NS+8
 ndcG+e3JC7CqptrRbryF2Ldx96IbJHgdxwe5pjxwKsLbE4G3+R7k16aB2cJib2hmJ6JE
 R5AFO+m260tprgWtXj6TUwI2Kyjqs71SUg6sesg7SUOYYqgKqNBXbyU5MUxUAnImpAHK
 R+zM13Br/M+vGoc3pfmxPkp/pEG1Ma4e8ATGVOp0lSviIuq+eVAAy3mW/NZiMDXyokT5
 VbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXS6Jvw/GsSQRzbLxX/W7xj1FrkzmEuqqbzjBJFsOR0=;
 b=AqXpkShL0AEnVTOJDEE60Ta/H1G29osX5vncK8d7zzRuE01vyowgEJ2Yn2CCHAiIuS
 aZ6+ltRC1Kw6R3cqVRRXNfOnAaN9kR/UUSsik+2yybTa3GDgitjIxpCKdPi/klWOD4To
 HKfTyVzro8ymnLPy+aaNdqYdqDtXuzvF/twDTUsUhjjcXedDIxFeUPR09tAhRCbeiuFw
 XEXv9R8ysB6pnW49ZHGrLIbqss9bErLe9NpdtTGqnNyUmMpAKBzOc9bu+ZxN7CRRxDFH
 d5xgMxIxrenNRRJiz35LxUz2oDd1cmvRnPfqBImxrMXg3fAsoUi3aDsasyaTSPlOsl1z
 tRfA==
X-Gm-Message-State: AOAM531oLI7oCrltSXbKh0d7PrwgQjYmtfznQcHDfAKCTjHeKZD8tirj
 thFudzqh1W9avmvb9WtJZHuc7qL9Brt/cA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr8448712wma.101.1591886739090; 
 Thu, 11 Jun 2020 07:45:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/arm: Convert Neon 2-reg-scalar VQDMULH,
 VQRDMULH to decodetree
Date: Thu, 11 Jun 2020 15:45:24 +0100
Message-Id: <20200611144529.8873-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PJ4ajb4tyyos

Convert the VQDMULH and VQRDMULH insns in the 2-reg-scalar group
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 +++
 target/arm/translate-neon.inc.c | 29 +++++++++++++++++++++++
 target/arm/translate.c          | 42 ++-------------------------------
 3 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index cc2ee9641d6..105cf2b2db3 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -485,5 +485,8 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
 
     VMUL_2sc     1111 001 . 1 . .. .... .... 1000 . 1 . 0 .... @2scalar
     VMUL_F_2sc   1111 001 . 1 . .. .... .... 1001 . 1 . 0 .... @2scalar
+
+    VQDMULH_2sc  1111 001 . 1 . .. .... .... 1100 . 1 . 0 .... @2scalar
+    VQRDMULH_2sc 1111 001 . 1 . .. .... .... 1101 . 1 . 0 .... @2scalar
   ]
 }
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index a5c7d60bdac..6301016d5cf 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -2546,3 +2546,32 @@ static bool trans_VMLS_F_2sc(DisasContext *s, arg_2scalar *a)
 
     return do_2scalar(s, a, opfn[a->size], accfn[a->size]);
 }
+
+WRAP_ENV_FN(gen_VQDMULH_16, gen_helper_neon_qdmulh_s16)
+WRAP_ENV_FN(gen_VQDMULH_32, gen_helper_neon_qdmulh_s32)
+WRAP_ENV_FN(gen_VQRDMULH_16, gen_helper_neon_qrdmulh_s16)
+WRAP_ENV_FN(gen_VQRDMULH_32, gen_helper_neon_qrdmulh_s32)
+
+static bool trans_VQDMULH_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenTwoOpFn * const opfn[] = {
+        NULL,
+        gen_VQDMULH_16,
+        gen_VQDMULH_32,
+        NULL,
+    };
+
+    return do_2scalar(s, a, opfn[a->size], NULL);
+}
+
+static bool trans_VQRDMULH_2sc(DisasContext *s, arg_2scalar *a)
+{
+    static NeonGenTwoOpFn * const opfn[] = {
+        NULL,
+        gen_VQRDMULH_16,
+        gen_VQRDMULH_32,
+        NULL,
+    };
+
+    return do_2scalar(s, a, opfn[a->size], NULL);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e4a6a38c782..5d0e00f92e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2973,19 +2973,6 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
 
 #define CPU_V001 cpu_V0, cpu_V0, cpu_V1
 
-static TCGv_i32 neon_load_scratch(int scratch)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, vfp.scratch[scratch]));
-    return tmp;
-}
-
-static void neon_store_scratch(int scratch, TCGv_i32 var)
-{
-    tcg_gen_st_i32(var, cpu_env, offsetof(CPUARMState, vfp.scratch[scratch]));
-    tcg_temp_free_i32(var);
-}
-
 static int gen_neon_unzip(int rd, int rm, int size, int q)
 {
     TCGv_ptr pd, pm;
@@ -5190,35 +5177,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 case 1: /* Float VMLA scalar */
                 case 5: /* Floating point VMLS scalar */
                 case 9: /* Floating point VMUL scalar */
-                    return 1; /* handled by decodetree */
-
                 case 12: /* VQDMULH scalar */
                 case 13: /* VQRDMULH scalar */
-                    if (u && ((rd | rn) & 1)) {
-                        return 1;
-                    }
-                    tmp = neon_get_scalar(size, rm);
-                    neon_store_scratch(0, tmp);
-                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
-                        tmp = neon_load_scratch(0);
-                        tmp2 = neon_load_reg(rn, pass);
-                        if (op == 12) {
-                            if (size == 1) {
-                                gen_helper_neon_qdmulh_s16(tmp, cpu_env, tmp, tmp2);
-                            } else {
-                                gen_helper_neon_qdmulh_s32(tmp, cpu_env, tmp, tmp2);
-                            }
-                        } else {
-                            if (size == 1) {
-                                gen_helper_neon_qrdmulh_s16(tmp, cpu_env, tmp, tmp2);
-                            } else {
-                                gen_helper_neon_qrdmulh_s32(tmp, cpu_env, tmp, tmp2);
-                            }
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        neon_store_reg(rd, pass, tmp);
-                    }
-                    break;
+                    return 1; /* handled by decodetree */
+
                 case 3: /* VQDMLAL scalar */
                 case 7: /* VQDMLSL scalar */
                 case 11: /* VQDMULL scalar */
-- 
2.20.1

