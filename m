Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp115855lfc;
        Thu, 15 Jul 2021 02:53:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz20BQfCPgLEeoAVkUxC/0Rse0lTByStwuooCTjbq4SfNEesEsRVG3657JBSIQR0cVHuAtU
X-Received: by 2002:a37:a20d:: with SMTP id l13mr3044370qke.83.1626342839671;
        Thu, 15 Jul 2021 02:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626342839; cv=none;
        d=google.com; s=arc-20160816;
        b=WaRPKK0Y7AZQRXT7Zsqzju/IjebxNQqGwoCQ8JRoCSt+HRd9+h4am0grH+TQLUm8b5
         OY27Xp6elFxYI9lzDtEWYX7nnVRIP6MKJiJryYUWFSdgTShSSJZ6TZhKQkcER/fEu5c+
         GtWeYoRr3UYjKo3yr92ux+Eku4c+p0IPdgqFdowK31NqOV9otSgRdrzxtmXGFsLk1We8
         N24saAdieROYXMHw5k5BJaPtVnLV9nzDvWdMNaTbjV/KcNqUNMPQaF2Sv0tpLvA/Ayla
         YKCvrlV7mGkMcKJl4sNroUqkTQlELlsI2tZACG0sImpg13I1daNoUwUQe6dTqOmnqt0Y
         AsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wFJf/yglS6TdA51aTCmXDBY4DJy7bf3bOZXxC/X4XSA=;
        b=o7eChxykD47q9KvixWsYzs0fuhPbG22g49oXoAxHI7QFhzzdrLQx/eHHGzJJYdkuJt
         pEeGqsc006CbBEJ+jbJERH1FVdT1dDKOuaNg4s0TlSjJ36bbqC+8poNz0ce3UBP9hrC8
         BT9GcoZ6/F+Np6TxEoILpyu075It4hIjDRs53P9HcuYgL2ai+3wzMiAlRlXqxQFCtOf6
         JPTtxxN+7ekyZYhyhI5l3CJdcMz3zENA2x8S5jIOyB9kNZv8yL05dcEdk+vFEP4n8CSZ
         lwmN9W2OsQ50deN1xaEcQLSOkUc7jY0QtQrzANxjZTZgfOlorr2CVNF/jSJhHtjW0u3W
         GtdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xi7jdqnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si2169334qkk.92.2021.07.15.02.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jul 2021 02:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xi7jdqnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3y46-00044H-Uc
	for alex.bennee@linaro.org; Thu, 15 Jul 2021 05:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3y3w-00040t-43
 for qemu-arm@nongnu.org; Thu, 15 Jul 2021 05:53:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3y3t-0004n2-7K
 for qemu-arm@nongnu.org; Thu, 15 Jul 2021 05:53:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so4341319wmf.5
 for <qemu-arm@nongnu.org>; Thu, 15 Jul 2021 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFJf/yglS6TdA51aTCmXDBY4DJy7bf3bOZXxC/X4XSA=;
 b=Xi7jdqnfiGroyI4BSGwtYHdcOoG2gw82po7hnnsoTdT+YBACSZ7mBH4Z3QV0Yngx2i
 0pRoqqFiQGHsoBarG/HbddhfEw6h8+R7JIsMtpi6++vEQGGWP3kBQrtqjLtydvVjDdxz
 dVFY6xteFk09UmfyV8RfMIyaPj8TvyQzwfPCqcQxNNm7LVKNvMiTKMV8AmeYhspR+UKG
 bn2jaZ1b4+QNbW6hXAeLEdehNjYpbogcd5oKdB8VblR4e4k/V/DvHbyMkiFpeBuaI312
 IH9V2349/g8T+B6ZMlZ1sXbGfiLJ46ic2/ahEBGjiMVarDsVZ2CbNg9zZCn/GN0i2W0x
 VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFJf/yglS6TdA51aTCmXDBY4DJy7bf3bOZXxC/X4XSA=;
 b=mtU5JqJDWZ4EaBGaa1ptVkt6Spe/kbUHIWs3m/eNag94zlYQ2J+KMtFKDTAUlxNbPz
 z72oBR5I8hTJell5oZzlrmMwAOLNmGVKVhRcrLCnEamm8YC/X0Sj9LToxuxlc/WpX8iA
 EHt0+zGdwh2utP4/DtjnjuhdoDs0pzIbNubQMfBiYlrH6ck4GB8t37/mnpMsnRBfYOhD
 TBYUO4cwv7OZYvoBYPvcESkf5Xch3BziwVKibIwP7C5lIBWzHAD02asMPB+aVHtUvZgM
 b7SMlVuP38RGe/c1TFBDRslLfTbJv+pQTtH7hyc+evpLdExuc2WaqowO0Mi0MMRA+Fdb
 mypw==
X-Gm-Message-State: AOAM531jaRyfJCrcf/WiXU9QQyPRQvqw854Ewhz8BTzsSOHzWFP2ZjlM
 5c0JHjU5L2mkhJ9XCUMQ9nvQK3wx7reDag4z
X-Received: by 2002:a1c:9807:: with SMTP id a7mr3505859wme.129.1626342823412; 
 Thu, 15 Jul 2021 02:53:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b20sm5106241wmj.7.2021.07.15.02.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:53:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Remove duplicate 'plus1' function from Neon and
 SVE decode
Date: Thu, 15 Jul 2021 10:53:41 +0100
Message-Id: <20210715095341.701-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: kpu4cnO+p09T

The Neon and SVE decoders use private 'plus1' functions to implement
"add one" for the !function decoder syntax.  We have a generic
"plus_1" function in translate.h, so use that instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-ls.decode     | 4 ++--
 target/arm/neon-shared.decode | 2 +-
 target/arm/sve.decode         | 2 +-
 target/arm/translate-neon.c   | 5 -----
 target/arm/translate-sve.c    | 5 -----
 5 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index 0a2a0e15db5..c5f364cbc00 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -41,8 +41,8 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
                vd=%vd_dp
 
 # Neon load/store single structure to one lane
-%imm1_5_p1 5:1 !function=plus1
-%imm1_6_p1 6:1 !function=plus1
+%imm1_5_p1 5:1 !function=plus_1
+%imm1_6_p1 6:1 !function=plus_1
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index df80e6ebf66..8e6bd0b61f0 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -38,7 +38,7 @@
 # which is 0 for fp16 and 1 for fp32 into a MO_* constant.
 # (Note that this is the reverse of the sense of the 1-bit size
 # field in the 3same_fp Neon insns.)
-%vcadd_size    20:1 !function=plus1
+%vcadd_size    20:1 !function=plus_1
 
 VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a62c169f1a8..c60b9f0fec5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -22,7 +22,7 @@
 ###########################################################################
 # Named fields.  These are primarily for disjoint fields.
 
-%imm4_16_p1     16:4 !function=plus1
+%imm4_16_p1     16:4 !function=plus_1
 %imm6_22_5      22:1 5:5
 %imm7_22_16     22:2 16:5
 %imm8_16_10     16:5 10:3
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index a45616cb631..c53ab20fa48 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -28,11 +28,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-static inline int plus1(DisasContext *s, int x)
-{
-    return x + 1;
-}
-
 static inline int neon_3same_fp_size(DisasContext *s, int x)
 {
     /* Convert 0==fp32, 1==fp16 into a MO_* value */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 35d838aa068..bc91a641711 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -70,11 +70,6 @@ static int tszimm_shl(DisasContext *s, int x)
     return x - (8 << tszimm_esz(s, x));
 }
 
-static inline int plus1(DisasContext *s, int x)
-{
-    return x + 1;
-}
-
 /* The SH bit is in bit 8.  Extract the low 8 and shift.  */
 static inline int expand_imm_sh8s(DisasContext *s, int x)
 {
-- 
2.20.1

