Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5016522lfr;
        Tue, 13 Apr 2021 09:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+FoEGuzHEK/YdGBpNkttZNq7Ig8l+F2aWhR17oON5l10JGlHwboZ0o5Fyx71JelLT2CX+
X-Received: by 2002:a5e:9316:: with SMTP id k22mr8415498iom.160.1618330545030;
        Tue, 13 Apr 2021 09:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330545; cv=none;
        d=google.com; s=arc-20160816;
        b=mOW6e4UKuemSOaRbdH2QPafZB8cU08WEoaAxKgBa1hSebDcL2ogmBjwCkyKXEih4ZK
         5WG+KRPX4xX4y458I1BBwVWbTu8v+x1sCAAI0d6XkjV0Lj2CNcac3mc+Sh27qcno4tii
         V9kMrrlxk265uHEK/mO8ZEF2qjtCrBmr3M/rPDZajNfSO8r2rodWN1Uw/aGZOT/BfZ4J
         PaiZkJX1AVmOzvp5oJ1MMXXaN+AzqJkMplsrK5LTv5fYpSjW2L41SVJmwWRx05xzKqX8
         X/dZLs5j3VcGL9OozruqKGCG7lWaJVPBuIe3tL+vCDrPJPFKHERsyVCZ/RAkUqm+G8+J
         dhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6kBII81aZuLJmqi4T7s/m8HPG70NUqDGFjy7vwjtQU0=;
        b=jBWV/kY21gVoZ3jh6BNnqRhaOD/FXCsagO2PlwbMzrEYgWWvnJf3ITfKmy3CsnzapD
         FIUAIMfRSyrzA9VZdzRtmLLfBMZ/+wnIGf99EcF+JGt4rvAvDcEBTcZuez+rSAhZ7Sys
         keJFAzV/hBf6gjtaakj20DAAf0S829CgE4NnpmCAtWTKTNRVq6MNxNSTD3Y/0rX+tQcf
         93yW1iaq19x670wM1+VsMH4xCzLllFuAzLXFEK+7hVuh9NUMAPOTW6hEP7ySSLj0Biqa
         RS6OZ1EQ/Yl9e0DcTjKXr6/DB9xlSnaoS6ti/gE1lTveSCcikGqUKyZ1nIgMpYueLCLY
         g97A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRCUzrTv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si6731731ila.70.2021.04.13.09.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:15:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRCUzrTv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLhY-000782-92
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaY-0006Py-Br
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006vp-4C
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g66-20020a1c39450000b0290125d187ba22so8709630wma.2
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6kBII81aZuLJmqi4T7s/m8HPG70NUqDGFjy7vwjtQU0=;
 b=QRCUzrTv50P4yl2DWccnEi2XeSnfuiyvKZlrLJgXpu4uYQEaZEk9s24MlsJGMz7iIs
 noe94rzxSDUogELkw4SkYg+Nuc7tmer2mMQ+8DCl6H25GvPBQVtBuNizKZ8mkW4VKLHx
 SDHRc7pnBIwXrV1GL4JAfVnLhYGFelL898L5b9jLpKBCkxY9kCDN3KgnCbFUvkveTUoz
 7qCufuFAHl64qj+7HcH1+lbrwyQ+dOcnBR6+DiDa4wacqt3N9Cl+1f0/OBuGUw2ck/kI
 U+3e6dU0Ea88AE+tQ7D5DnPPBnv5D+VeOp+FwlmmmnJey8P9UK+CMVMyx/isPRivPgYq
 239g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kBII81aZuLJmqi4T7s/m8HPG70NUqDGFjy7vwjtQU0=;
 b=mkd5mLYm/wzUcgQuxiaW/02a38orSxbP7g1kdCFRtnKtVciFTRY9URqPgHLN49/bpO
 EI6H3EoIRi+Lt79jGnPepDcKL5+neiBFfjpOpisdcad30zltynd0ep8jWR9y0cyFZyRv
 jneuhNww3KIyl/jSTsTeXS0EjJQZoZZRmKcXr87qaa0w8Rar9DTCjgBa3hp4D65TJxIQ
 Wo7RevWNWMoMdQYDNs93XqmcFnkH2oB7VwgoHJpOAxFjD0xQW1twoui0V59TezHaM/j4
 P24yz8kvl3eVOwv4Dwvg4BSDv6QUN4lj2nAKWbUL8/BwlICtijJSdUNdwsETFGDpig8S
 z9Wg==
X-Gm-Message-State: AOAM533YUwJLARJuoApn0IJOR4J4Vk07yUHvb0+wyfWtmuF1RhUX+dWM
 GF73vxideqdRqPUUdhvYViIEO4eA9E4QN/Gy
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr720026wmq.115.1618330099558; 
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
Date: Tue, 13 Apr 2021 17:07:55 +0100
Message-Id: <20210413160759.5917-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9t28OEo6NFZr

The function vfp_reg_ptr() is used only in translate-neon.c.inc;
move it there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c          | 7 -------
 target/arm/translate-neon.c.inc | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2ed02df05e0..5eece97584d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1158,13 +1158,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     }
 }
 
-static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
-    return ret;
-}
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the Neon decoder */
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab2..c6f8bc259a1 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -60,6 +60,13 @@ static inline int neon_3same_fp_size(DisasContext *s, int x)
 #include "decode-neon-ls.c.inc"
 #include "decode-neon-shared.c.inc"
 
+static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
+    return ret;
+}
+
 static void neon_load_element(TCGv_i32 var, int reg, int ele, MemOp mop)
 {
     long offset = neon_element_offset(reg, ele, mop & MO_SIZE);
-- 
2.20.1

