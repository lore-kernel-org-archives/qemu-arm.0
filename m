Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E6CCA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:55:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbg-0004i2-4h; Mon, 22 Sep 2025 14:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbY-0004ds-Cq
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbS-00043f-G5
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-77f32d99a97so1306621b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566970; x=1759171770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNYeSBUI+ChSA2MN6MhEMZp6PedkQrBC3yc/qlTcbfM=;
 b=C8zULNPnBYfQ7fET+ThH/lTdOTQ+1N6qbtIvyCYs6dwUUlwV4brp0cxbLy7Xmb0bv1
 XhvcTAF8nabJIA8BV7JYeL8+zZByFnkAMVX/LAkhSc9MjWJci9x6TMyKTGJO2F3NYijd
 kxKXkJ0thitERLW9OoDLb45VAxOZZI0ge43pTL2oAUY+iIiHU0ttHsRsueBhiFCNXn40
 31olUERn6lObtMU9ERYjFCBAoHu5cGjBAgC8kwllq1AetcqBmypGwAe/B1nSS+nEhpUW
 NWWt272JQdqBteVcWjtOI8KkRNp/2PgKxLvHrxBKA6KPQV6QqYcjH+ucicTpwR2//YJz
 NUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566970; x=1759171770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNYeSBUI+ChSA2MN6MhEMZp6PedkQrBC3yc/qlTcbfM=;
 b=aqVyHQod3szfMNultck+imB1C8x8oArjag7BI16CS+NVSU12BQLI50xWMq8GRHcGA2
 TLOwC5QzVYx5wKT4yLJyo244Rk2r5DJKRin9Bv/aoKRzG/nxp5JD2BJ8D/GgKct2BnFt
 AyTn74KzxEQqpw+rbWhiLIv+RFApzTkzjWVhjTGMmQoQiqz3+aLaT1WLZ1hYMFpVBuks
 8hMWiV+ZlIeLE66jX7JWXdvgDXJ7ykISw03efKXf0XMpPvrZZjUX5Q2vnmE7Qo19ZWKT
 GTtyZsTSHURkIHR72mQy/rWwzbihx5WrkCQRj5aqUwQ1P5WHegFR9fehOFWr6xETybJz
 60bw==
X-Gm-Message-State: AOJu0YyGrl4WVd6hFOeG5xZuejEvpVQQchBVCiiu2xbbpphqFCSxiZ+V
 rdT5NxvuVCoZCmPZ0KwX7+JK53ZpAus5aopI3ygCiB0jSXyw2CAx/cMh6jbOeKCGwibwCtW3weC
 8gYrT
X-Gm-Gg: ASbGncvI2he2BzAqv+EUzXrBDRjaFPMoJOrqbiIUx03HUDfZQeRcjlm4t/PCyMnbZ+3
 SbsLs1hl3wyJTJPsiuZIcxdU0ehBgkiG6ysep+j98Je0nYyHbzeQx9tsCIDTzKoV49HssCCTKQy
 GKgZWgtUnY9WRkzwQvgUa3J8HB1JkwvzqJDAR3Y5xyF2nVZWizJKUoNMUQdu6tWzZFVuS1556ag
 opz+pxyrlnM6XjRM62zsMpqWKLYoupsvXQwXYphNCgoznNPDfhqJZRQEJDwZ+zI4J2PB6UFbNDc
 10f6uIMyg97g7sPktNUaQfCW4AxP4NfK7AkJeM1rCCLdBCLlf8RayngUlrkTCR8+dU06LLrzlFZ
 fB3QMa5c9cmAyzgwYZJ7gUeFylU+O
X-Google-Smtp-Source: AGHT+IH+EoRSG+hmD/8rJwDIR/miQuHIJVEbjBkhqUdph9DB9fZK/YU5WLlm12KB+AVO9Ij5lPx9PQ==
X-Received: by 2002:a05:6a00:1ad4:b0:77f:324a:6037 with SMTP id
 d2e1a72fcca58-77f324a7a52mr5595642b3a.7.1758566969337; 
 Mon, 22 Sep 2025 11:49:29 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 02/76] target/arm: Enable TCR2_ELx.PIE
Date: Mon, 22 Sep 2025 11:48:10 -0700
Message-ID: <20250922184924.2754205-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c60da6013d..5c3805eaff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5891,8 +5891,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -5900,8 +5904,12 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0


