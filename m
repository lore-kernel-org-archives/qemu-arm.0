Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE893CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:51:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE4A-0005MO-08; Wed, 29 Oct 2025 17:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE45-0005Ly-VX
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:50:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE3p-0007aL-TX
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:50:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso1546905e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774623; x=1762379423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbKQE7qm6IKS1msYSrsdvM6/yFqMo5M5BB1u87CRFX0=;
 b=wJrchxNauDqyR6JwhoabgQhzgGNlBkG+6I+wWPylocoosmCmxJ77wvhxNQrzCdFh2c
 YosOrZKThdvDifZwYz3Lf8pAFG8kvUASjdy8PacNSavFlG8nAnc2OnIVavgPUvV+BHlu
 64OSlkBp7JmC1LkkpzZOzvjv2JA2WRAYIl0AHH7F5OToD5IUdXLYvYfAWdWlwKry4Ymt
 ciLdFx9IQ2Wc+Ti2k115T+R6LAz2B+vWnMWuzuFvlnG5Ymwnd580csdJHBTE7EJ/LKCE
 FqJ0ajHon0QQGm+uZ/m6/dxD6zr8t8VuoCAYEpmkh32AjyPl5y474PwB99erKfRSB4fb
 voIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774623; x=1762379423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbKQE7qm6IKS1msYSrsdvM6/yFqMo5M5BB1u87CRFX0=;
 b=e41ujBV5qqWCITjLjkC/D8HzQIVz1cdYMSum/C5L0RGSzw8DQS2z4YvIqRZfOC8bB+
 bJVR7IDW2ZABsoEQanNU4827kz2PhXOST7KHAfLdGbgsNqImEuKS+vfMrYQRNDXrtSr7
 gsu8vT5W1gz/4rAJ8w1PGkgrO6X9/tUYevMiCiu0p1tF1hyvkZe9wdw63tZSlCxwH0oJ
 RE79MfZC0fWioOc7zJdXqYNDl60G5+msW6Z1z2HA7KzFfhOO3Hu2QLowHbpzRrSWi0ZF
 9WFl3EoY1hPaSy1csFZD2nG/Sy/f/UD+x28Xy5afCO8QdLhPwj64QIdc7s2wBD+yfKrQ
 xPgw==
X-Gm-Message-State: AOJu0YytelqI4LEIVwBH+qMjVgn0P7Ayyss8rbJ4WIjYihl/VGM/JxNt
 kJPyqiGTi8sWUfdbUry06G/jt1BtnE7nwbNaHynpVYASCNtujkTiPF1D+lZI3fuwaAUQX97LrSx
 9H+yX3ik=
X-Gm-Gg: ASbGncsVrvqWlUITf39K0k+egasfuiXBOW9K6YXe+gRbe9++onBnqrqW2QMJhxisLOF
 ZoswHxcOP8DeIoUMeU3tXRxV7RiHLNNOFBVd7v207d1iYEONJljnYimiasEOjmd6aeQI2r52NSV
 TiOubqCYuQz3/dGPjaHfJh6Wfaq1rAcTsRwAlrJx2f+4XiK0QCyJJLwxlUlDx8dYvjsy+ronBzs
 Ac+JW9vV0bg2BKegajOBS7gbCRWZ1uK0qLJNqYXNgmGnPB1BeloXaU/A+Wcc2fKeNXWj7MzS5nE
 MVkCOoOfPS1S+myj9eR70kYWazrQv9ox8zMWH6rGRDIw35M3WbsQPL+H0pRX9++F0nK58ZfWfek
 SHWy2B7v8rciiZ/4J/4gPr1XIHe4EGuWPu5SJNQu5zdjs1HyyTYi7nj6OF/GglSsSwfnRP2Y/E5
 f7WtDyRD4VvlFJJrasYs5ksEiq+hYpVhp+aVJcleR7eUPfY3W50Q==
X-Google-Smtp-Source: AGHT+IHTSwKOMFv0RaZtT2IQ/+PmQSFEK0hhc41Z4oKaL7KKgqcOFYejd02ZoERiD+R5YJKMT2Igng==
X-Received: by 2002:a05:600c:4ed1:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-4771e177c4amr40857215e9.13.1761774622623; 
 Wed, 29 Oct 2025 14:50:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477285df825sm4921395e9.0.2025.10.29.14.50.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:50:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 10/23] qemu/target_info: Add target_aarch64() helper
Date: Wed, 29 Oct 2025 22:39:47 +0100
Message-ID: <20251029214001.99824-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add a helper to distinct whether the binary is targetting
Aarch64 or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-2-philmd@linaro.org>
---
 include/qemu/target-info.h | 7 +++++++
 target-info.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 984fba3f42d..e8fbdf19d53 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -57,4 +57,11 @@ bool target_big_endian(void);
  */
 bool target_arm(void);
 
+/**
+ * target_aarch64:
+ *
+ * Returns whether the target architecture is Aarch64.
+ */
+bool target_aarch64(void);
+
 #endif
diff --git a/target-info.c b/target-info.c
index 40716bf4051..e567cb4c40a 100644
--- a/target-info.c
+++ b/target-info.c
@@ -57,3 +57,8 @@ bool target_arm(void)
 {
     return target_arch() == SYS_EMU_TARGET_ARM;
 }
+
+bool target_aarch64(void)
+{
+    return target_arch() == SYS_EMU_TARGET_AARCH64;
+}
-- 
2.51.0


