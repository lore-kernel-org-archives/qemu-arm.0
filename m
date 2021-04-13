Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5014410lfr;
        Tue, 13 Apr 2021 09:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqreVT10kWXinDn2yBw3C8QdG886d/oDCxNw7g10E4FzRKl6HFJedsP7tZVp7nseGc4041
X-Received: by 2002:a92:7f08:: with SMTP id a8mr3328065ild.87.1618330400495;
        Tue, 13 Apr 2021 09:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330400; cv=none;
        d=google.com; s=arc-20160816;
        b=NW2xcnqNph/DSS/i1wwFnO0hzFT3SXlpiHg2Wn1zAel7XrXg6BUxPekKrUVbyXAui2
         7vHJIeIh8CCcmuZUdaUK/zdRhZqE+Y1wT77pYWGbUaRwdc0LzcC9nAs61Hx/nEglVQZw
         UfFVCDT66tQZHLyFpYlELAnO8oke32WJQESEtfxbzl2tN3bFpJvXYlWeVA/4/LYEHiRr
         tWj/+FNFz0tOTVBBXEixeJk+TfUhcF92oIwrBJ2U6U4b1/qrpniZWQIrc680bxTAUlrq
         RpcJPENO6I5Evqhn495p5W0/6NzES3Pjy7WA8rWiGkyIVDVCnwsI4YK+rT8pjq4phhwl
         8LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EPKR+7Ln/JdgPQuKuo+DrQ9fLD+pJbsk48aZLHSdMSs=;
        b=gnSuBywxoJCQtWRyCQxona5F+h7pU51g+p7uwQi2VV84BvSxIv9v0SOv8tLM3GQ2eW
         ZlhYVNne61DDQOapj+oL3m452IizEUeesFQjMNOWLjeH/ETnlpZkiiZl24Wm2GuGpwqa
         29+6+02cu1kTN4vGuuszNOwj4xeQhSPAw8823RZA4EatLteGtYtKLlCNgK5xRhb+MCJR
         SJSgnVZyACpMgX2qebtj+LJES19n7OFU9jQiZTCyLfdBAy12uU6SG/eeqjPIT2vX2E0G
         39yiFYhay33OYXMUzja75rMyCx0J5d+viMLCfQvoDQvDZMQ+jY9nbwEcPz/AOs8iTX2O
         0XfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BWRL8Z2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si16792658jal.8.2021.04.13.09.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BWRL8Z2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLfD-0004Zq-PX
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaU-0006Gs-KQ
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaM-0006tm-O2
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 12so9044914wmf.5
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EPKR+7Ln/JdgPQuKuo+DrQ9fLD+pJbsk48aZLHSdMSs=;
 b=BWRL8Z2B0r6EeF0eim2PaFy0/iE1ut59kkYoyZMm5e3pht5jmG1AUOvIQmNDedQd6F
 lhFdRRYtbVREmFA8sqkKm/cEHcs06LvM7IeZvACwmSaSyfJyN7poUNF9ROfFgVg9biSb
 GcsKcfIfPcs6BhqxUe5cLpJZ0tZOydx3l+3S9gMwc4tfGYU+xGe0cnDSSQcG/tIkv5pD
 4oykLZ55hPwpkosAFq7xOG6d172856jj5IA1PsrH7z1Ppu2sfdxboO0QmrZ4DBmXKahk
 QWmSZAoSgNh0mpIHAasYxySNTy9NfbySDn/TBVNidhqU+cz38+2cYenmpwZCVhnZJRVt
 PIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPKR+7Ln/JdgPQuKuo+DrQ9fLD+pJbsk48aZLHSdMSs=;
 b=lgrLCRlhmAykErON326Q7z/+f3zc8JGvPi6ANmoNyoROvEpos13ObL5HWX47NdEA7G
 a27J4gf5I3p2hpqO7uQIMVFOcYXQ0XwredAzu2eElbWmr21HpcBo1pXdVna/0RF2RwHI
 fhzLatGem2y4h8Ew2n7D0e6NjeGiAteKdL1la+7UtDo6eQSPwTPW59OO8TsVzpWHU8I+
 HxRj2IWKSsU1j71cDeWw+TP6x6aQMD2sOP8yZRHOltY0nbkRO+wnF7Ua4WBdYY/ZzN/7
 kYXccRuko6i1Fdfqvgjzp5zXarreCa2iGshI5/dtGhAsrIma+AWS5VDdAx/3Fzka2CP+
 1Rbg==
X-Gm-Message-State: AOAM530PycMqWzaMN7UFnmf7QizohigZBbnlftCeEp15PykzOCWLjbiF
 wlaP5M6eSjvnUp921Sv7wbyyJ6uL0kFNzOOy
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr687387wmm.153.1618330097371; 
 Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/arm: Move vfp_{load, store}_reg{32,
 64} to translate-vfp.c.inc
Date: Tue, 13 Apr 2021 17:07:52 +0100
Message-Id: <20210413160759.5917-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: KDnOW7QWasWK

The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c         | 20 --------------------
 target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fd248b101f2..2daabb5fb6f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1103,26 +1103,6 @@ static long vfp_reg_offset(bool dp, unsigned reg)
     }
 }
 
-static inline void vfp_load_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_store_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_load_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
-static inline void vfp_store_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 16a730b7bdd..873a6237ea1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -30,6 +30,26 @@
 #include "decode-vfp.c.inc"
 #include "decode-vfp-uncond.c.inc"
 
+static inline void vfp_load_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_store_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_load_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
+static inline void vfp_store_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
 /*
  * The imm8 encodes the sign bit, enough bits to represent an exponent in
  * the range 01....1xx to 10....0xx, and the most significant 4 bits of
-- 
2.20.1

