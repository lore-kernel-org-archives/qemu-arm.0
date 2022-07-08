Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338206lft;
        Fri, 8 Jul 2022 08:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubkkH5p0XuAGdWvYCWRk5moBiayEWbgf3BCAZ7VtCpjD4ywqI0YIe6xO/0KFQjmff9UdJD
X-Received: by 2002:a0c:b28a:0:b0:473:38b7:b5db with SMTP id r10-20020a0cb28a000000b0047338b7b5dbmr3317125qve.72.1657294126211;
        Fri, 08 Jul 2022 08:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294126; cv=none;
        d=google.com; s=arc-20160816;
        b=jLpCf9/ZARTnZ0yp26VufaqwMgkKh12xxBzUdEXcWVuY3XHxdJ7BYyvWQ4QYMeItm/
         BUI3IM8rkrwx5b8lwFIdd8dZSpKvWnkHISqbx5/vZcKfWjMjFGq5RGUaRt+c3vQJpekh
         q77yfq2U+OGl57Ih21KYEiuT+kqtmGS01D+tGNrzemrz8ZNOYq1Tjywl/Z5bsj9u8My6
         2Ayrpskj1dTmeL3V+b88uDGIdBG3NvvxatrmTD4esPp3bCmrIZRumKtEr++j3nelTMix
         yEgBvRZzbxdcYLw/fK8m2Qi9dtrFNyU5Q2akkINX11t+huWOjpOK9qePAXRqYDjBujy4
         ukxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
        b=X5EwDMZ4PUTUsHsnvACeHHCCCPBoSkJ6XdtdjpEdXqO7u805wG04UtRG8fzei0hqDg
         V3xTMkHQrxE+2JC5GgIbbyb8p5Z7oncX5mWElGTLPeG1kuGeYskeEO126J6Pv68+hUiZ
         6HbCk9H+qcINQ8zKa7cyw+pvahyZMTbdlnwH4obXIAjwhCTsVpT3RecOzUGBLPBWBz5A
         84Fib3CpwqQEyepTCZUPegR+hozniAbQRFHLQq9bg76zJJnAqn+3MxJKq2kb6rge3PX5
         1tNibsexON9hN3R1T/iCWwgxOrEadUclpYATTcJlDYG2MkRMxhmLr2ijINKBCcNzdVnC
         HUNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLRqYk0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a248900b006b54151ad6dsi6349643qkn.91.2022.07.08.08.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLRqYk0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9puP-0002wB-LF
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pia-0002a2-1v
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:33 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piX-0002IU-BV
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id s27so22580221pga.13
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=RLRqYk0b4m+zHsufuHYy7XOLtTeQ7v56+VvEl5yg+lSfw6qbJ4ilGk7ZYhdn32RK5M
 pr0wasqrkSGUrSYVhAhZxQMc7QE2B6xQFOSSDr/aapx5k/21I265MGfmvty9TLYMmGmJ
 2czn5Rj2eJlWml1W4DVmrh8dCYnyGWgPBBTWYOjKbDOqodo2HUwpSiYy4/pIqjevV6W1
 /R9tAWpvvDN0yTLjfGDmJ8aHW2ynInnTso9T/tLEt+PqA/A84CU8BbWZfo0odlCylN36
 T0AXt6IHEilZ1yYS+hndgmBcRWvT9iyA0GqOx3RzTnzqlNU2gMaeDrCSVhuzlpcINCWw
 Tx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eedjnu3eOCixQFi7+Gzy6ksLbMXPKA3RAkF+Pv5QpfE=;
 b=VVb6ay0DaNjhm3/q/Cc9K9L8qr3dJJzlPGkmk4o8Ib/VkcdQ2CLDuKq+jkFnMKXYnk
 LDIFhQO053P/kxMLpw7cffCU7OAB71s9rpmSz2YnPeZ5Mt2dggoZqzawir8tEK2EOziz
 BzNO/5gc1pia+a8TVl3geRY+MmHgUMw7ApQzcfgbTOgAp0Cqsvz3cL1foSqRdxHEFcHN
 ZS9+VK3CmLB3hAO7/u35dfu2C1dnf7+DTPxzsNzJXpWQDENGx158PNs4KBkWqOW74sMC
 DkKvSq+qz4Mt8bp80euoHy5BQUSOTDjuyQc9S+QlNPMfHY0LholGV4zfqJ/j8cKS5Fyj
 6wzQ==
X-Gm-Message-State: AJIora/I9O7oGT2oejZYiogrTKBJbsI8wdoO2d5rlK38tT4fq1jhojaZ
 AvsYNgzoYTx04yybUnG6qWtFsw==
X-Received: by 2002:a05:6a00:124a:b0:525:894b:7924 with SMTP id
 u10-20020a056a00124a00b00525894b7924mr4324990pfi.31.1657293387932; 
 Fri, 08 Jul 2022 08:16:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 14/45] target/arm: Mark LD1RO as non-streaming
Date: Fri,  8 Jul 2022 20:45:09 +0530
Message-Id: <20220708151540.18136-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: aAZeZRXfjABg

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 3 ---
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 2b5432bf85..47708ccc8d 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,6 +58,3 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
-
-FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
-FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5182ee4c06..96e934c1ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     if (a->rm == 31) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
-- 
2.34.1

