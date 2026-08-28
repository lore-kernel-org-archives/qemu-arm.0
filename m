Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DE4C61DB9
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052G-0002on-53; Fri, 28 Aug 2026 18:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052F-0002oE-BQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:55 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0527-0002JB-Sq
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2d560775ca2so9990345ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956006; x=1788560806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lxDB1AZ/TE1qUbZALArzk4U0devuU3P17x8wphjQwTk=;
 b=C0dTyaMu8AV0lpL8B6d6qyFuub5X16m/EcgyT++kwgLfzlC4IujJUZEzljiHWqOBAR
 IIOGIXit6msaLg6Y1iH/Ml2NdawRnJHhtD/Y/+2k9xCOGSiirmxEKh/9WNIbOkS8hrs5
 064ksBBeiLtkhaYhPa2mJClKlJcjlZDrRqlMTgqfp38zg5sfzi3QANnanBgz+qS0ngEg
 95/WhQGXQk9qVCAYwhAtuxKAqeDfOnoV6ex/Nev4xAHTC85/1PEhlBqKDBmLHvUj3dE7
 /+X3zLeKJQovGjOYt+B4T4khpcss3EMwlFaSEH5Ssj+5LmMDDpB9sncfS+5I4m97tdc1
 4w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956006; x=1788560806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lxDB1AZ/TE1qUbZALArzk4U0devuU3P17x8wphjQwTk=;
 b=TaQBuP4tdWPA9k0ZWsnDCzuo7dAKViLXcD02Ztb98hpFBWQFxHSW7NIHdm8BrZh8sh
 OXnroONtz165Was9tpmy/Q88D3nopd5DjSy5uh7OCCdrdrqEQbLvKCmIqci82mJjGj8/
 BstUboyv1DKoO4FXDB13dQ6xXFDxNODE3Q6Wniy6/uWA24FAEb4MIFEO+t+gU5CnlADQ
 aMk60XEMgbgYsvEZVMH0t9wh040Dqod/IdOKIOkMCP2sFzFwM9/ShHTpiTTcGa9ukXEE
 SjCFIcfTKLqHyriGasdjdGplH3hOjnneEW6PkDLZjcoECNQSIm9bo34RqpwT1ujzJviP
 KzWA==
X-Gm-Message-State: AFuF++moq6pl1PEW5MqRtPRKBrlF2DK53lnXZUw1GlawI+zonics0vnI
 dsexc617LeYz6wnktzU6OSIM+XWSgl4hL00ZwlU0WXIZBLuq/19QT7dM2FFve/L+q/o1zSGjcYI
 VPwt1Xno=
X-Gm-Gg: AYBFou1hIzWv/Omgd/G4ClRTnsbm6a1fR+Z4HwETGki4J5GKx0MBWG16XWz+d3GpG9h
 k1EuJ7OdFxRiuvf2YfGEZWJe+OZhoH4zst0TrJXuQJzrDgjYcthrz6S2yPp+n2Vs5IcDMRicBCO
 bCIbZoDXKfTFF+EO0FQ9Hldoj/7Hl5xeMcgPm+5BlCUdIld6ImptemRynTIi4Tvsozy2RfJE/Mh
 lCOrE0gniQTVJKwTLpu+Gc3JKCe0byipMyw/fX7LhY4OtHiGY87QUrzsUfzuKwEpywrJSm2Roaf
 cHLZy2kAQc0XSly1MqyUHhF7SkHI8mR42Dw26xMGlorQZENQkBnYm6OJFZ1/0pfhyZrHedxrOI6
 MXcx9+3pdcoXh9I0ybuPZCdC5IAGlGHK65lhhvD+fO9ODjgWDLYFP1BC+6l6bqEtVBNs4sMKGl4
 3T09uYJ14yU/nmdsi8Z791Z1M6psLJT/0EnNMdmxqZJFMEgIo8cv6T3kZHW6eafnCAXaDYdE1JP
 S+95I0/sylEpuh8CAVy
X-Received: by 2002:a17:903:1a27:b0:2d8:d4d3:3fbb with SMTP id
 d9443c01a7336-2d8d4d34074mr44384525ad.15.1787956006538; 
 Fri, 28 Aug 2026 15:26:46 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/13] target/arm: Drop U from most PSTATE bits
Date: Fri, 28 Aug 2026 15:26:33 -0700
Message-ID: <20260828222639.1432046-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

PSTATE is already 64-bit, but many bits are defined
such that ~PSTATE_FOO accidentally clears the high bits.

Except for PSTATE_N, we can just drop the qualifier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e8dfc3179f2..9e258fa005e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1558,26 +1558,26 @@ void pmu_init(ARMCPU *cpu);
  * Only these are valid when in AArch64 mode; in
  * AArch32 mode SPSRs are basically CPSR-format.
  */
-#define PSTATE_SP (1U)
-#define PSTATE_M (0xFU)
-#define PSTATE_nRW (1U << 4)
-#define PSTATE_F (1U << 6)
-#define PSTATE_I (1U << 7)
-#define PSTATE_A (1U << 8)
-#define PSTATE_D (1U << 9)
-#define PSTATE_BTYPE (3U << 10)
-#define PSTATE_SSBS (1U << 12)
-#define PSTATE_ALLINT (1U << 13)
-#define PSTATE_IL (1U << 20)
-#define PSTATE_SS (1U << 21)
-#define PSTATE_PAN (1U << 22)
-#define PSTATE_UAO (1U << 23)
-#define PSTATE_DIT (1U << 24)
-#define PSTATE_TCO (1U << 25)
-#define PSTATE_V (1U << 28)
-#define PSTATE_C (1U << 29)
-#define PSTATE_Z (1U << 30)
-#define PSTATE_N (1U << 31)
+#define PSTATE_SP (1)
+#define PSTATE_M (0xF)
+#define PSTATE_nRW (1 << 4)
+#define PSTATE_F (1 << 6)
+#define PSTATE_I (1 << 7)
+#define PSTATE_A (1 << 8)
+#define PSTATE_D (1 << 9)
+#define PSTATE_BTYPE (3 << 10)
+#define PSTATE_SSBS (1 << 12)
+#define PSTATE_ALLINT (1 << 13)
+#define PSTATE_IL (1 << 20)
+#define PSTATE_SS (1 << 21)
+#define PSTATE_PAN (1 << 22)
+#define PSTATE_UAO (1 << 23)
+#define PSTATE_DIT (1 << 24)
+#define PSTATE_TCO (1 << 25)
+#define PSTATE_V (1 << 28)
+#define PSTATE_C (1 << 29)
+#define PSTATE_Z (1 << 30)
+#define PSTATE_N (1ULL << 31)
 #define PSTATE_EXLOCK (1ULL << 34)
 #define PSTATE_NZCV (PSTATE_N | PSTATE_Z | PSTATE_C | PSTATE_V)
 #define PSTATE_DAIF (PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F)
-- 
2.53.0


