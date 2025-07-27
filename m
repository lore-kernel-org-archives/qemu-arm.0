Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F297C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:06:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMN-0007Jy-0e; Sun, 27 Jul 2025 04:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLg-0005B2-OI
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:13 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLf-00043k-Ad
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:12 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-234f17910d8so29658465ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603389; x=1754208189; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMGC5A24KwjwokxNjbljMwweFFMcRjy7ppuyvfWNL3w=;
 b=TBe6yjk3WYPmjO8whI/gxXWh0DJ/pZDhycJK9T9o/9lkgayLPhWhfcRW4RJQx8M8JC
 Qp+6jUbl5cfxdicYnrL/6SQIlqTLtwPLn0al1reH0C5I2SxJASaOcpRyj8RNIkNw43a8
 7vKoqxMKhAVytIZSiYRCGoPk4UdnVVcVxOUz8TtIJqddxL6M8ZcNiSWu8FlR5CxiK4xU
 rUaQXUQr7Tv1GkoFVS270fyUtxTXXjLpWA0lRxCDczs+kdr195MV+hy3hsGHeLb5qDKU
 9grormeD/ZVSvonVHv0ZiYOZZ5J04x+/WoDZf8rndHwR3N51eMKWOqN4asNnGc7g6DdH
 4XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603389; x=1754208189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QMGC5A24KwjwokxNjbljMwweFFMcRjy7ppuyvfWNL3w=;
 b=DB82rQJJqWBD0peQqBFRL6e5XmNl3aKwXIY8lvCxct4rMi+jAvnYr58dgDpZYzj2sr
 8Y1Mj9dZP+PXact/diUKmdoUi8uGW33OQcmcM92zWA0G+I2n7YzeWR41R0zAOGQJiHDX
 XbbutoLR1MEg+ixFZnaDP1bNp0D/SFD8u0Z7lDfyH/GHgBJcMIvu0WyzrB6RZKusfRmA
 6mhOqA/Q2+yyRAHXmo98wV1HxJwYktmxpXcAI8phBynnJNEuG/LG6EVjO4/xEqnFdTm4
 pjZ3796JY/xJwaGNPPuGb+dHu3D+FrXUU2e6BnJ8kwDFuRnC37S+cemDNLE+1idewXyJ
 T/hg==
X-Gm-Message-State: AOJu0YxPVSnfeW31DQPw7TP5orHcjxkAHuZVmNbPRKPQJRpwsFgcwJUq
 BSSg0egLuhxPkQifBoDYgEQr3CJko7aVFBIPpcAcx4fbxLT/JMa31zYire79Cbe+z0I=
X-Gm-Gg: ASbGncuUryBTNHfyfjrPr63bGN6UiwjGP2Sjr5AaPUaauRlToRmCsDjC2zDX9KfcboQ
 17exFBThLA4h3eehu//0uhHG1lupfsiCbrdGmBHS4e5Zs/rFPEniin9Iqe/KXeYAAlTrvmzTSQ9
 oyziWGuiipesZ1oyLojVefZVyvigeTk/Yjamswr91Yqky2Co+Y6ICE04NsHc6YpLQH0KAID7I+m
 Qdbf8+nJzsglJh2G4zcpsz8TCsxWeGq4KdklfKMYwulBbKD2MdspJqMHx15e1JYFq03vTG+xKPu
 myCH06yKWwzpct8kdrVtD4t5m5KxAVz0yMt5BnB9+GUbzNAfTBHP3Mm+alTo3X9EoRZ4SoO50f0
 V4I/pLFbnVg9m2eCBf1+zUnTOdt8gUkSuYVGr9KPAxdSKYHFcU7uws4wYsPFWrsDw5gW6lpcxW5
 K5+wl3L3U+Z4ZccCiASEZzvhwvGzEX8g0=
X-Google-Smtp-Source: AGHT+IH4jY+b1OjVLIoKFK5y/UUEhv9wVPF6RDRt1TAW/dGh7V9q9DWQx2aS1sTd7KOMhNu+pw/zlA==
X-Received: by 2002:a17:902:daca:b0:236:15b7:62f6 with SMTP id
 d9443c01a7336-23fb30aaff0mr110769455ad.34.1753603389562; 
 Sun, 27 Jul 2025 01:03:09 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/82] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Date: Sat, 26 Jul 2025 22:01:42 -1000
Message-ID: <20250727080254.83840-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7f2ca51b4c..83875c06bb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -919,6 +919,16 @@ static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, SCTLRX) != 0;
 }
 
+static inline bool isar_feature_aa64_s1pie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S1PIE) != 0;
+}
+
+static inline bool isar_feature_aa64_s2pie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S2PIE) != 0;
+}
+
 static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
-- 
2.43.0


