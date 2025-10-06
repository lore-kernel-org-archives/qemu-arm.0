Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E278DCAC5BB
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 00:11:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5Yor-0000FI-Kn; Sun, 05 Oct 2025 20:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5Yoe-0000D1-0y
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:11:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5Yoc-0004Et-DV
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:10:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-3306d93e562so4741859a91.1
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759709455; x=1760314255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNQxTEzi80lbl0xN4caDnqv6yc8FN8B4ZjgNrtVOCtM=;
 b=hoJFDd22LX+zUUM3wgeUb6t8TWXWvyQA5X+GV3dm10hXSzOYwglloLi5HRFXkUT0Hv
 wT24gP5Y8ZZzqdstZptNvjQ1m51xTYLlTQkpiKlQtAPnHsQBgDReUqFI3A+OIZDX4h9o
 A3TPmSlLLDpdtptBgzfKHwwEi/qLwd2GkHaK99QFesDZj7bWl+kHHCd78KAFi2gpmQDA
 iW3jYjnI5O9P0/MWxvPyTuQ6z9J4V4XnrxUURID0+9t9N3/Kb0uJyjIpWhY747BF5o98
 w1ILChlioIfE1t20Mrg/fhF5TubqPawaeYASXypP/V6cK6ibew8fwypLYNx9DKwKyd2P
 Quzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759709455; x=1760314255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNQxTEzi80lbl0xN4caDnqv6yc8FN8B4ZjgNrtVOCtM=;
 b=OzV71XyoSDduV/ohzdPUiycYm/xukCFz8kWfu5mlr6RCLuWE4EVozLTYBhDwaWLBm5
 JB9cPwJaQmcwuIJxUQGnOOPlsU9FJ+3q91VEgYcnV5Yoa/9ctnBtEp0/K3ZbtnxeKzMK
 3zeFRHrmLhlfYw1Wq+1h56Y7FB/eKxpMpZso8Hv/Bi2i+F0/8xvfIpIvnuS9AvFVN3Dp
 pPQPX96pckH4jGVD+twIODVZs6Q8+SPWN5oMYM/oNOq83HFrPMrTPjQBiUaY60h/RQE1
 U0ddcZ+9Vlovh6V+KJLJV8s0j5wf1f651XtpHb4Uf51lwdimB4Y917v98FgopS3M9VCU
 PADw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJs21z+QKCW+GCixjQJrIp9IcBG4qCv2Fr1sK8uY0WRxPrZP6kteubfe5ZrFcOqs7gBii2AzVS8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyq0R7w7gPCsiDUDvb8kwS5ax6ukLighf8gOOkckSbgwwiqOIzt
 I49gJZpMIbKB1IFXXo5s2pYO0Ml4woylbghOFzQI5vuMIaMo5jtl4uykcgkuaJwRYphi+dMA5ao
 w7lJh
X-Gm-Gg: ASbGncurYWiz9LZ4DGvldZjIaw5kQk3Z/5uYu7T0T11Dk7LbWYBQ1ZTxnldZeOpjCS1
 38bIhMTJNCn4ReeDEefVTkH5j35UroQ3x+IviZM07061Yxzn+r9WSP6CoKf+oNT979RP8x9Uf15
 LHfjQdrwYERhqCQHr98LVCIb3ZFZURlv2K93bYjGWdpehwk0oaxEkIkEpTp+wAUPD7lKGTqLGM7
 6ay3eRrvcIe2+qcUoFtUv4fRd/setO7U6TPA/51aYEeeGOkLc6pPuXZ2J4lLozpeogZ0KEtcTkP
 NaJ0MoXGvHeiBRjEQ4hq2tp646c594xvohnDP0l/Wu62p6nb96WubwPOhNvrnsHTZuDXK9nl8Pt
 JjO2zrBtTRWSjpjZW4Z6upW6IT6RjNJr7fUMStVSNMtcI8R/JMkQ0HdXtap2CON0oriI=
X-Google-Smtp-Source: AGHT+IGqjr3mkrKA0/TtaTN6rI92HNJoV7++MgtxbpCawXS361PDi2jYQu6Lqvq1tra5M1+GkI4Dww==
X-Received: by 2002:a17:90b:2544:b0:339:d03e:2a11 with SMTP id
 98e67ed59e1d1-339d03e2c14mr7614911a91.14.1759709455276; 
 Sun, 05 Oct 2025 17:10:55 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a48584sm8804881a91.23.2025.10.05.17.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 17:10:54 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v10 3/3] target/arm: Enable FEAT_MEC in -cpu max
Date: Mon,  6 Oct 2025 00:10:18 +0000
Message-Id: <20251006001018.219756-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006001018.219756-1-gustavo.romero@linaro.org>
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1034.google.com
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

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption is supported, but software
stacks that rely on FEAT_MEC should work properly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20250711140828.1714666-7-gustavo.romero@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst | 3 +++
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 4 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6b04c96c8c..0876a232c6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -92,6 +92,9 @@ the following architecture extensions:
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
 - FEAT_LVA (Large Virtual Address space)
+- FEAT_MEC (Memory Encryption Contexts)
+
+  * This is a register-only implementation without encryption.
 - FEAT_MixedEnd (Mixed-endian support)
 - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index abef6a246e..3661f3ec83 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1252,6 +1252,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64MMFR3);
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
-- 
2.34.1


