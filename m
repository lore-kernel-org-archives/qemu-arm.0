Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6741CDB47F
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 12:47:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcMzT-0003Tu-Uf; Wed, 24 Jun 2026 08:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz4-00038T-QB
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMyy-0006NF-Uk
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4645995069bso680308f8f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 05:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782305130; x=1782909930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OxKAmxXDbdUwrSn2RL88EjStXd/xDaL2uq1O996DDgY=;
 b=re31eqDB+iOUd2K9MGWcXVpVxe1SEF7mh2wSvuFL6qy+1hOY4iPmLCyotknHf7yMt1
 HY62a+eQ05VK0um/WmNYamrjWhGQ+Uj1N70CG6YXyU4mMxOkVPyhH9RD6Jum+rs8RgNe
 4MP3UPPnStTVet6GYLEQp5qRoEm9jMneB03GBfTmE9A+/gcY+TcFnnwq/GK4MXW+vRse
 gjN/Fak9XciNF7giVZhI20DHmRvP5EdVjnQrXTl9wTa2Iuk8m5q6CbABgPH5Dx5o3jl8
 ReECAseU+y5hp1LNcDpaVSszllJeXjugPaJ8GA0NuOrHH30KAF37BlxW8G4B7TyQbHEk
 OjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305130; x=1782909930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OxKAmxXDbdUwrSn2RL88EjStXd/xDaL2uq1O996DDgY=;
 b=Kk7MXaUN2+2b8rxqggoMGbpUuXHGQ0UtJQn0sXb/0QGzc5a5MaMTCTJHYelx1zgnXg
 6dqG6BPdugkUOzDnFSWYLU8YBuxCfADODVCj/ZMT0rnWh7Ow6G3v9ASrRxxIr7f+1pwW
 MFmppdl3J3dQ40k6nmjlruFDXxBwIjPEe+4/UGaC7+ZG5wtMF4dHrcHfWZVvYgyIkQoc
 NNZphV2U/gBA0Utr3ArhXThDV1Js+U6YQ9HrHY0uwJo8yyapO1nZXnImrPybegcqgjyp
 0dLvBT6yWJgyBhWHclffSjHZ2aR1XeTNCefOZEBSJUaHGubGhUk3AjqIFCAXpjKCaGFE
 AzHA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrq2PenLIEpl5UnMZZq4oNaN10tikFL40XoDDXZxWZ9vvXTBaLZWFE4Jx5/qUYjfosP3evU7ImekA==@nongnu.org
X-Gm-Message-State: AOJu0YxjVDDcxrqprDuohvpUqdaloLsrQ5ERXjol+T1zaxgob6gDfUJ5
 qO2OISK7XMlw8Qtq8NrokUtJee5PUL/SLrbVwmGRNahfzLXBgkGP1J7YIWV0zOpaNI0=
X-Gm-Gg: AfdE7cnEwRFSyU07kYP1NyLtUbe2Bbs6r/qzCTo8jcsjOmppabZPQx7DggeeGd6kAUZ
 4zvAI2K7ujoqN06VwGt5ZLF8U/JEQ33iymhVQiZUSsMAFo6vlaLLV+J06G68PXWt0hDLgfuD859
 /Hmc8RP+admlEPEYquKpWwAXypKxIi57QXXJiDBimOP+ZLXcVyP3EPOpVzK9yoxqeCVQEzrty07
 lTXEACFpRoxiIDcKDEmqIFbB6Z/Z+oc8A+4mJ/DCf5bNJ8y/Q20xubcbP0KG2ZoHImWZLG7VVWb
 s/UnjucyCsl3if1DYM9vSZiACohzF49QCqNAemJXeCZuXzmd8gIblnBqSgKbWZv2+V4eGPhAa0M
 ufemPkfLD0C40v8SzRuavzTm3r01YuXfylHSEkUZIG+nejyqGzqtRTNfICdciv+/fX2C12bkhL/
 E4qzuW5AORrwAc
X-Received: by 2002:a05:6000:4685:b0:461:a161:8102 with SMTP id
 ffacd0b85a97d-46c06ad9fcdmr4336513f8f.28.1782305130576; 
 Wed, 24 Jun 2026 05:45:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caad603b3sm3590250f8f.7.2026.06.24.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:45:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 678935F9D4;
 Wed, 24 Jun 2026 13:45:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 4/6] target/arm: gate check on scr_el3 behind
 ARM_FEATURE_EL3 check
Date: Wed, 24 Jun 2026 13:45:25 +0100
Message-ID: <20260624124527.1018912-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624124527.1018912-1-alex.bennee@linaro.org>
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We shouldn't be reading SCR_EL3 unless ARM_FEATURE_EL3 is enabled, if
it is then we check SCR_ECVEN allows tweaking the offset.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't bail early - if there is no EL3 we still honour CNTHCTL_EL2
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b843857e5d..4273e3c5395 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1413,10 +1413,10 @@ void gt_rme_post_el_change(ARMCPU *cpu, void *ignored)
 
 static uint64_t gt_phys_raw_cnt_offset(CPUARMState *env)
 {
-    if ((env->cp15.scr_el3 & SCR_ECVEN) &&
-        FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV) &&
-        arm_is_el2_enabled(env) &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if ((!arm_feature(env, ARM_FEATURE_EL3) || (env->cp15.scr_el3 & SCR_ECVEN))
+        && FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV)
+        && arm_is_el2_enabled(env)
+        && (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         return env->cp15.cntpoff_el2;
     }
     return 0;
-- 
2.47.3


