Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B141FC87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:04:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwLx-0005fN-7l; Sun, 27 Jul 2025 04:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLe-0005AF-5e
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLc-00042r-Kh
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2350fc2591dso39842335ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603387; x=1754208187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8A2p50fg2lrocPlTL2vHTdYXWv0sBXWf3nT/JIz8EKA=;
 b=C87E6EkqCknoLZoMSb/v9s4gIXy2tX1480zD183lDNVHer1rg/H9/LVMCdrVw/TVHw
 scavmGM+Ha/pLPZ4T0SicJxIxkD2RF+lETqCjAC97cBmBh34CTttRkYQ7dsCqi08eeTq
 L/gICFChno/HPXgBmDfK/15QidlYlctb6/OHfQD5aMAcz9QzyMm5HIH2MtZ/Av3yGnsH
 tldHlgYqExOwQrQ/u2QQ+C0R96dS3vR5dyE6aQyRE+aDnII2kfYdCXvXB2qa1IPGco7w
 dq+JmfThMV6fnIr4HooHzz+GFwcDzE/8TzT2bx/s/Vtqat48N6U28KgZnKo3rk2KEG2a
 z0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603387; x=1754208187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8A2p50fg2lrocPlTL2vHTdYXWv0sBXWf3nT/JIz8EKA=;
 b=IRzRlm5rZRXCJPxdby9BBAsYd0T7ArjQyI9CTqcraWCAtw61RSgiRWNndKwt/uEqq6
 8Aa3HgDYrtQd0RpyFPrFwrxx7C0FwRCFgHmERGCmU5+/Pdg5raJl1J1q7Q/KuC9MDiZn
 3d/jjKj88AIZv1YAizT81+aF4/S2SYg4qgo95IuYz078XvJ0B73vjCCcs1+FYVBYlRd4
 fd0LdywzqxHFwTxZVhN6UhDGTk9sIyDoy4dAL7SEKz1mHmq/fCYABiFU4b+RWXnVwM5O
 FN3YFqL18amTcrmlX8V44z7ar7D3yMvGt0G5IkAb41C6M5iwg7lJMIqWm3QqXYtpaVvE
 /3WA==
X-Gm-Message-State: AOJu0Yye+VjekHlUtAx5EoQdvSrSiJUsRsJxoYdbfZOdukwbP55sWQSn
 5umRQ72sA1y13hE4H6OS7TtTD7dYhm/nUXQghCLe7V/ee9ZQ24YP4YZo3APJaHGvGyqHhQzBp7p
 amMXc
X-Gm-Gg: ASbGnctLXQ9sGGVDfHRZ5X3wDeNw3YP8vsFqpXw8UMtrXurmZ4nP5a84IuNxPr/JLEu
 Al4MAPxIhGxIoVHg5CsRXmuSdgWTyFMdCblhCOm8K5SYVvFv2Cewlax8Pex6xlNJtDytTzSfir3
 P+5yZpmRX7ZHcheZlkkYMai1qFOzOXuyMBkMgjrE6EVGDFWmbTeZch/77MsJ/KdLe6+o6iosnWj
 PXlLWqd1oPcchaDELkoOkAVoi1JImnFtWtrOWxGfMZRlJI3R8P9iU8uDxBfC34SA0YtiCbShlsz
 gquHT19fm2+RZPeU/v2PrSQ6T7A56SlBIdQblSBxC5+6iJHHZ4HptffVJ/J+w/a92bunDc9jxne
 krO2ilbdpE9geQ/ECoSfjZc38QkevvFvNTOn3iItQWpcb2VujpNAqJptiOPJH5Qzb/8DIZE/EOb
 x9k+NvGpS7b1qEYG3FQDMV
X-Google-Smtp-Source: AGHT+IHf3wJsHXONbsv6Uf4y5Yowp0JbTdoHUBtuq5S5db/3aMTJ1/U4pGseHJ2GiebRIvyL4dEnZQ==
X-Received: by 2002:a17:902:dacc:b0:231:fd73:f8e5 with SMTP id
 d9443c01a7336-23fb2cc0818mr114605865ad.24.1753603387243; 
 Sun, 27 Jul 2025 01:03:07 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/82] target/arm: Remove outdated comment for ZCR_EL12
Date: Sat, 26 Jul 2025 22:01:40 -1000
Message-ID: <20250727080254.83840-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

The comment about not being included in the summary table
has been out of date for quite a while.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20b69a12df..dc6c82b7e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4566,11 +4566,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
           "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
 
-        /*
-         * Note that redirection of ZCR is mentioned in the description
-         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
-         * not in the summary table.
-         */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
         { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
-- 
2.43.0


