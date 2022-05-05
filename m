Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1309866lfj;
        Thu, 5 May 2022 12:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzblbt90HP1v4gvtLCDATcADICMp67YCCMDKVya+Dx3QzrgvUx3i998ZxOsfOEsJi2wd2oK
X-Received: by 2002:ac8:5811:0:b0:2f3:81d3:6c31 with SMTP id g17-20020ac85811000000b002f381d36c31mr25970961qtg.131.1651779290979;
        Thu, 05 May 2022 12:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651779290; cv=none;
        d=google.com; s=arc-20160816;
        b=ouYSq/M5DQewpo4gpQo0nOzRiAszoLdu69rkxSeG/nuObBEhkcSJTSPgm2okHLCban
         MhGgFHhm65iB6vgFI1KB0SXCG0RDHAgSQfdU5GzrzHPMpsPWtjDx2iQTtt2BbT/L0OFT
         caT1XrV1dNyiRmEvZPCK9dZ7zd9BQhm+jjNPhZy8gL9zSqRFS0DbRts73WDzPp/a/b65
         pqdVDay1T7eT1R+5nW/TRWxS8Ee39cBtIrEAqnPuJDTCmCeiDsmKBu98peNzNHKOL2hb
         hTD7Zc1Xsz+wyWnpUEexRlSDOlDRVpz1eWiOOMMAH0IFHyfTwWDm/JzWmKk0v9Y4ebgh
         k8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
        b=vM4jVlEGzCltnjrA0ECzV4gHvKe/EOGLyycJxBMwpL95V7TJLNGEh3FaQ3M24/rGiP
         u9mWmp1c5kia1Jvz0ZYIdsF9Z73q7HRsWWhhfGkRBwqb5nfQ3P+sZOvXYOI30znuEe2e
         91ysgufEHTeURQDP65vfyvcwPvm3KfUZgKp1ZFUgCfHBHl35XwtCZyrComk+OtLsF9Dv
         FQaI7dVgfOdb2m/Vpgr4Itlj8ZStsQZ7MfI7c97pU+Mv8dpHDFTb3n0SldHAM+f9Q7s9
         ihaxUC7TsdZ/r/2kVnirTYEe7/OQd9Ko0s1jrUmCL9o6ksPUhD/0cnIsTAe9rHZE9k6z
         0G7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfSkOVch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr8-20020a05621408e800b0045ab0b7b252si1088544qvb.517.2022.05.05.12.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UfSkOVch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhFS-0002u4-Fa
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYg-00036X-Pz
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:39 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYf-0004PL-4C
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:38 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so5096145fac.4
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=UfSkOVchHfgBlrTVp+PH/kf8/Sfoel/eQSDwrU7RGWHkxroYJlEIVQQSNDKBepVn+x
 FOA1UgIigPqB/5XSEqLCqexNXUsHA9LV/BZjr01hD8x52vkCSVhmww6UPNuk4dKoulv0
 FRwNqlWcAmflCLGWA3dmww/XaJNRX2lpcu8zsQZmBtlq0eMAyIWG2OPPuepWiYglY+b8
 G9G/bv1+V0C+0JrsYaoNQBfmpUh0ekptK0mYbg7bcFYAO3AFG+m0DnBEXVqzZa++5wXW
 oHPM/YILqAe6N9qjcb29+UDEf0833INtYs7qGRxbkFjrNV3xFUJW1Qc4hAgtKVjgwGLq
 JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=GMQuG0/TNMLfk1HijRn+Fuibh9nkmssP2vcBtruCkq0mTYrwiLHxh6/8SnksIXMeXv
 muBTh0MTDxS/DV8fWGW1n+ei67rIZI5nN5LuS7tWRVPu2eO1eIgi+166DjWq9+VPGeO3
 8zSZUbX7MCaqMFQRqolA/S8xbAtwCAgt3win5BwoA24O5LHkTVdajXQb1s5AseRhjniu
 uKFi3LGzQarcZsVRchriHJ7B/e+4HvCRPZ2IiSmpJ5YPselxNOtgSrj3Wr8goeyr3ll+
 Tnwf8A+CQW81n45mjV4Q6uL9Crx4Wbyn/x8Le692+7ivU3jmCsYD6dql6GAwW1IbEWoM
 w5DA==
X-Gm-Message-State: AOAM532sGqof5ncswZFzhlLTfg0HfXbdRI3xSBW3RbyWAry3uFnPE1US
 Mdc/JLsg3tQgDMnCd+qYEFgkejNfpP8srxiH
X-Received: by 2002:a05:6870:6013:b0:e5:e6f6:5379 with SMTP id
 t19-20020a056870601300b000e5e6f65379mr2946078oaa.67.1651776636353; 
 Thu, 05 May 2022 11:50:36 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 19/24] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Thu,  5 May 2022 13:50:01 -0500
Message-Id: <20220505185006.200555-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBVP5izKEh2c

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b200012d89..b2a3e2a437 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10410619f9..25fe74f928 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c5cf7efe95..762b961707 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.34.1

