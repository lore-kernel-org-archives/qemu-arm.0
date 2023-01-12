Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4682732ejc;
        Thu, 12 Jan 2023 02:35:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/P8d3mPKFpQsbGnoBbfNGuo8/QiQsKNIz2fLzdxvYjE9d/MPS0lWFGDJCpLUHen0G2hv7
X-Received: by 2002:a05:622a:4108:b0:3a5:1680:4cd0 with SMTP id cc8-20020a05622a410800b003a516804cd0mr104653701qtb.7.1673519717831;
        Thu, 12 Jan 2023 02:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673519717; cv=none;
        d=google.com; s=arc-20160816;
        b=G/de07meGkYevI0PMAVud3SBRYVhimXvXLTykQZyNcJqRifm+WfgF0b8bYruBIvZN8
         AEyETV+l6AoiQ58+3qjQpJY04nanIOdAYNBb48sszBy75DrWOWQXivrVGDTELh7nq7EG
         zAfgnBuOzrvpzxns6H6Zpc9KQ5w+vCia+rSwC5WY/tWKLpwq59bEaljNGKra5q7aGk0F
         O9hpmFLg8Y/rVdl6iMSNsfjKhClIK5n8wKaGwnw/dnBnXgfoWMdqrx2Dc2uSXhf1TFF+
         Eb/aJN3c9z2cwHdXqnjAUn1auu8UhM0B23oUDZ/skbH9ZNmEJ177VDlKutoSGHzbNlPY
         YnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QdbzZcLHTRdT4BdGiWixXL1Aa81U11XaY7492Ze75as=;
        b=CPnNbFxI9IqAeqYwDb9XHtDZJxxtw5UUtdbFZUy3dKWNmjkdzUXvlaNzzb8QmF/8RM
         BiyBkG/GlJ3uMiP2WbybBczrFItbT54JEGlxflz+KJlv/bLZ1lhM7rq9PWA68LaNGFOG
         TnlmFa1ycdrhKpK15R9MEUt50/FVVdHk3oG0FNhB3CC0Gw+ZtNlqJyS9LTL2WoEFtNpS
         anFrZHECjDuByO8bvdrzMRM71rIEqo2p/gwZIW6yvwocApCnsRuHOtnfROfioxjwRkwB
         hjWh8qdoVMJk3zMXku12dGN5qYi+tMyuW+3ckqWhJD7Adak2N0B5DFowHYt0yxgctidX
         rxyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAWbmTJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id r4-20020a05620a298400b006ffda29ad2bsi11136516qkp.269.2023.01.12.02.35.17
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 02:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAWbmTJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFulf-0002pk-Rs; Thu, 12 Jan 2023 05:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFule-0002p8-8J
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:25:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulc-0000G8-JZ
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:25:05 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h16so17585981wrz.12
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 02:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdbzZcLHTRdT4BdGiWixXL1Aa81U11XaY7492Ze75as=;
 b=nAWbmTJjZr2z4XR4KZiNPTDBbXLEH7I+zKOmGMhXO3LcAU+nArtF+TPvbsZs/I38iK
 zwEV8Qy8eXsf9JKUKkYkbE/c5w35qD/JlVuOIFR9jKGA90HmLAcj+4gs+BAkvXafI401
 5k5+QhWohkWjRIzlLMq0R7oIQjL6MQDYsJCMAj/0tfZniY04m4eyQXwKFZThXbHsu6ZS
 OI66zpcIIMY6zYyfywVmG6p4J6vRX6fIO5BQ5a8FU7y7t/+CJ7Bgtr1BOkwd5CfQwflg
 fXxHNLxnWFbI94nBtPGdhVgWM5rWasCFPWn3bXOkJPIp9rX9Z1yyDdmXd9GUpFDltTnQ
 Pg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdbzZcLHTRdT4BdGiWixXL1Aa81U11XaY7492Ze75as=;
 b=6C0kgINDU0rKxnsC2vkIvp6IrygMg52EMTWlSqhz0nS0mh2gNsMpLExygY3NFSSjKA
 CufTj0AfbCmr2WBAGCBQW2J6XV9JRvbvbQP2ojueEByHAku/X/8DC0i+dvmSTz9lT+Kq
 w8GyF/Bkzncaz3LPGuvT7zAU0KoHBrGlVTDHKEco4vkMR1JF53mgkm3kZOEJuPZLwjm0
 2RVk9Dv27CmiLu+jz9QZhU2rhiimX24TuevIrnjDsc1eznaP2H0YWHPJxjm2yxG4T5rK
 GHWueL2mOVBPHcxMGPKz2RcY7F6J1r48KBXmLm9TUY8h4ZOL2a41Zw8vxZyDVfWS+hNa
 lMOw==
X-Gm-Message-State: AFqh2kqlJCWP0EdDb/c7btv62DvLslXcDKaCgOUxR+rfLLc3fwp3jfMT
 yLHFD+KInwB4wqOcgHGT2twL4g==
X-Received: by 2002:a5d:6b87:0:b0:2bc:371a:8a1 with SMTP id
 n7-20020a5d6b87000000b002bc371a08a1mr9088673wrx.22.1673519103792; 
 Thu, 12 Jan 2023 02:25:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm16093843wrb.107.2023.01.12.02.25.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:25:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/7] target/arm/sme: Reset ZA state in aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:34 +0100
Message-Id: <20230112102436.1913-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w9tkcj5OTHGE

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c     | 12 ++++++++++++
 target/arm/sme_helper.c | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b655dde27d..26c3bb4cdf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6740,6 +6740,18 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
     if (change & R_SVCR_SM_MASK) {
         arm_reset_sve_state(env);
     }
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (change & new & R_SVCR_ZA_MASK) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f73bf4d285..e146c17ba1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -44,18 +44,6 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         return;
     }
     aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
     arm_rebuild_hflags(env);
 }
 
-- 
2.38.1

