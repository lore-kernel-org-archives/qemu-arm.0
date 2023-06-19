Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884436ejt;
        Mon, 19 Jun 2023 08:59:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BVEBpGOWOu1RkCfuR3NiQOslXcJUqyQ+XVtCZnCj3d/xcAdn5FwFvvXhy39jQ+iIq8Xme
X-Received: by 2002:a05:620a:22cb:b0:75f:4eb:6bd8 with SMTP id o11-20020a05620a22cb00b0075f04eb6bd8mr7871081qki.77.1687190349157;
        Mon, 19 Jun 2023 08:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190349; cv=none;
        d=google.com; s=arc-20160816;
        b=ei8ADpHH+DbkK2wg/L1vZ1Jf/Tz+4YhV6Q6Eadw6Vx+dfPly8/YF2OfaatUq+ufPIb
         rAHMjrnf+uZOqahmkW+kHGFoajdF9q525cnFLWNC7wKoiwfpuXAxc7MU/Y637zRWRGy2
         XVFH00dwg8v8zomfykp6dp4wUQomHPhpViarg2f5PrjwKqEfxa7h1vlBMi/9gI5AonVs
         XLJopujG9OY9IN5vfgdtfeG8FfOVBdvjmIHdzcbxjs+3OyWQX/k7c0SrpF7UtpVS+D2s
         MM+Ri2a/b0Mlh7Pqji66ugqrT8PtPKGEqIxPgfdxIsIrPE99kfV90GadgCRPobYR1YRF
         c9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Rdk+XeZoEXG/u6oKHpGn3TbpaF/+hAR3XMc4ZFEmMlk=;
        b=URAa3tExXUFLr7mIpUSfGAvWgJ6SozG+/2HhP/EsCxFQUnWnjMzUu1Ini9S/c8yZpy
         RE64awbVvLQTZ9RPhCaPYX/GFzMoG4YNM+IcrQuFZAi4Jr9FUemKmocAJDSXBZHeRppx
         tq8Bt87w/Bkx6pybh7p1XsSH+ProMQ2KV6V7JxbVwUu2UXjUTbaRx0qjtjeKrT1q9+bM
         NiXQi7ctriqCUjwNcJ1lTtvJq33qfc2DZ6gUhuqxgmp5yHbkXMVxyWb22nQVy5hWOOL/
         RXDrytPAE+xnC7Wow0rFGWCBpkld8BlQ1LxddBYuFporP0x1V+P139S97oHmN01N6zF0
         VyZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqgA9urS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a142d00b00761cc80a08dsi54978qkj.512.2023.06.19.08.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqgA9urS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHFa-0000QT-Cj; Mon, 19 Jun 2023 11:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFT-00009O-NV
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFR-0005Bj-0m
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:58 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so442260666b.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190214; x=1689782214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rdk+XeZoEXG/u6oKHpGn3TbpaF/+hAR3XMc4ZFEmMlk=;
 b=mqgA9urSUQ1ecZZpFL1BCiT3PK0fmt0KAUDD72LdPeoHWekTvDFMy+TE9XLv8rEMnX
 BGCcaX7TTMvMdq9BoS0QwKtZyeemV0HDn1wVOMrWzLVfP+WZb9bJThnK/GvEzOjTl88g
 hs8cpyYztsnIxcYKJKsm1sm/9UxlIH0JcsdBoO9/4LLs2DS+6HbzVOF6lguy+vuzQMaB
 vz4Y6HPFjdSfAMOJ4s2/124xEfNZFhzwLvYUDbPas8Aza36cF9hMhVCLdkxvkTEsC2eZ
 c4iGpHLaoE1UpBXQhzbb21kBvTsjpzukrcrBPcJQZSzVMNTc8WLCXJ+mBciyojICFpxo
 UMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190214; x=1689782214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rdk+XeZoEXG/u6oKHpGn3TbpaF/+hAR3XMc4ZFEmMlk=;
 b=Ts9ipYp/IwfQ/H0V+O+D+HYgv15ymcM4GkBI0GG65ITHuCfeXKp0qMRPHaf9Tm8jEu
 6jGo8QllHPqRbwcWc4EQkan5P1EN0zdWY38Pdz5J0+/ImPXcVuJR00j5cuM3WfQy0bCV
 qnKCjzRDsZEpJ1xGdBS3vpPxdX2z8l4T9G8gMhmm7xyl3OY6Fy1gHHep+kW78DXg9Pbz
 q7wT/AKvnuogbMiGvEaud7rysTLksFw1NS3CoihVZusvrZvMXsSwxHbkcME1t0EkTc57
 Fvyion1HiX417Et40hoDCuxtJzunicCnhU8AosfInz2RFiJieG+LQPHj8cim5DsBDdfg
 LWnQ==
X-Gm-Message-State: AC+VfDxGulkBx6CdFtWalB6EyPMDiuxd9Fq1e8tQ3fHnFq+V3BdDH61z
 D2azq4+X5FBj43etYLRbJ5Mdqq2hFbB1p9Gt4KqipA==
X-Received: by 2002:a17:906:da8a:b0:96f:e45f:92e9 with SMTP id
 xh10-20020a170906da8a00b0096fe45f92e9mr7841643ejb.16.1687190214532; 
 Mon, 19 Jun 2023 08:56:54 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906684d00b0096f7500502csm14913530ejs.199.2023.06.19.08.56.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:56:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 25/34] target/arm/tcg: Extract PAuth definitions to
 'helper-pauth.h.inc'
Date: Mon, 19 Jun 2023 17:55:01 +0200
Message-Id: <20230619155510.80991-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VDEIU7yYuwkJ

helper.h is used by all units, but not all require the crypto
definitions. Move them to a new header, which we only include
where necessary, removing the need for "exec/helper-proto.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/helper-a64.h.inc   | 12 ------------
 target/arm/tcg/helper-pauth.h.inc | 19 +++++++++++++++++++
 target/arm/tcg/pauth_helper.c     |  4 +++-
 target/arm/tcg/translate-a64.c    |  6 ++++++
 4 files changed, 28 insertions(+), 13 deletions(-)
 create mode 100644 target/arm/tcg/helper-pauth.h.inc

diff --git a/target/arm/tcg/helper-a64.h.inc b/target/arm/tcg/helper-a64.h.inc
index adff15600d..2f1aeb3ea5 100644
--- a/target/arm/tcg/helper-a64.h.inc
+++ b/target/arm/tcg/helper-a64.h.inc
@@ -69,18 +69,6 @@ DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
 
-DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(pacda, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(pacdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(pacga, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(autia, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(autib, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
-DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
-
 DEF_HELPER_FLAGS_3(mte_check, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(mte_check_zva, TCG_CALL_NO_WG, i64, env, i32, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/arm/tcg/helper-pauth.h.inc b/target/arm/tcg/helper-pauth.h.inc
new file mode 100644
index 0000000000..b5bf8aae24
--- /dev/null
+++ b/target/arm/tcg/helper-pauth.h.inc
@@ -0,0 +1,19 @@
+/*
+ * ARM v8.3-PAuth helper definitions
+ *
+ * Copyright (c) 2019 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(pacda, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(pacdb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(pacga, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autia, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autib, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
+DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 62af569341..c872f7e337 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -22,10 +22,12 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "qemu/xxhash.h"
 
+#define HELPER_H "tcg/helper-pauth.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
 
 static uint64_t pac_cell_shuffle(uint64_t i)
 {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f4c9448582..0d74e5b6e4 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -46,6 +46,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-pauth.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
-- 
2.38.1

