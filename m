Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3CC83F0A
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 18:06:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZZBg-0001M9-1y; Wed, 09 Jul 2025 14:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZB5-00013m-Iz
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:05:57 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZB1-00048k-U9
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:05:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b34a8f69862so242538a12.2
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 11:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752084350; x=1752689150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=GyvGoAZ/ANAFePzdECm7laBFQbFvsGoo95Je9Xu054E7YHLlKU0yOSggLgLq4PK3oY
 zPGRZ7argdtYrifbGmA53LluwO9cKklk54MGuf/qBFrhhh7V4BREOm/RWWMZffNdzPak
 gJ3scFiC8JInlkxymTA6nE9AkVUueDhSMywBZOxshTkJAYdee+wMPg0TMEz+vosO/KWr
 o2hyB0ALKG3x5iHzfRngl5eZKvbT7XZjYnSgsAGfPFz42F29SLTlcu+kwuk2FkZzSSaG
 1DVWpfYRE2RCa/xBd4+zVCWNE7cPLf18sF6Hww5CEu9hXNAfULEeVhz5gYM7cgg+O2lt
 sxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752084350; x=1752689150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=ROi4QZB7efwz9QGEUIXTY1xOd9Pa8pqT6gZFY+FZqkNC2zh04aF6NjS+F2d68O3fph
 QBR9dvLz2/zg0YNmiDrQIGdAPU2YciOfvCpsWbpX0ZIS8y2jIa1li59Y1RhBjAb4J0o6
 dLQWMfp07jsp2SqzQ2NjukS4lxFmaJyqor2f1Oc/mPP7GPd+JCj2CDq0XJDqKTd56c7Y
 jsUjurq0dxQvoOzHbNZ+r70bw1SS01cI+ea/4guUUJ/GC2vthr4+2hMucyEsFBsPAG42
 XMtJvR9OWeEhmhRk1PX5eo+LmqgRXgb19031CLykE0iDHENTiX/zjOPAwXGMjViOJ6rO
 oMPg==
X-Gm-Message-State: AOJu0YzO4EzjxHx4MX+nuiCX1brHYHF5bPEp3nicJ7upaeZ/7huez3Z8
 W/iS+r7ZAyErb6O7HMeWGusbAv5QMzT8GahfmkMq/VdKX6Y9tIvQfe/W+LD0TCtAOSLWmyxtifA
 4xgogUjI=
X-Gm-Gg: ASbGncuVc7DE8B/lKWmnE3+FskrpTepUDOIfAyHxTRUWhbfJqUPYrJM7qRVA8N3Llxk
 O6Gfu43X/LtKTzE380OHeZm2oLvoh8cuNBXxxuOwWJ79eTZv31sw/aIS8kFnvUWBtuWHESx4sKa
 O1/AygI+y96CHQvP3/rk2VHZ6gGg/WQm5NcPvbH0TyseaVg/Qqh2B1lu1IwPSzKittnUhMgCS6/
 Aitgdz+QoaXwE3EoXuP9O/EB0tLpbl1xhhopczL91q2Ybe8AOrqaiL/xvcMukVYi34z+2NrAg3H
 Ey1Q7BE32r+bPtHEVWOydEcnn/0STR4qP+gVgRS6ZTwGb4BuBYPck91O/bL1V88Oc5g=
X-Google-Smtp-Source: AGHT+IHlaKJfJDEhDeguKXFw3p6Nu7oCLURk+bMtTCV7YeCCek8aHndypC4k1qqUj64kyXUeg9BgKA==
X-Received: by 2002:a17:90b:1c0a:b0:31c:203f:cacd with SMTP id
 98e67ed59e1d1-31c2fe001f2mr5359211a91.22.1752084349958; 
 Wed, 09 Jul 2025 11:05:49 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84599f07sm153380175ad.218.2025.07.09.11.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 11:05:49 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v4 1/6] target/arm: Add the MECEn SCR_EL3 bit
Date: Wed,  9 Jul 2025 18:03:21 +0000
Message-Id: <20250709180326.1079826-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709180326.1079826-1-gustavo.romero@linaro.org>
References: <20250709180326.1079826-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x536.google.com
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

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8cf0ab417..0f64c7b163 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1717,6 +1717,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1


