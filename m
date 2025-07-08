Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C97C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGY6-0003iV-LP; Tue, 08 Jul 2025 18:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGFx-0000mH-Sw
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:53:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGFv-0003Kw-8J
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:53:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3340269f8f.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011617; x=1752616417; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQ7EZXT9CO2OHBTy9GyeX1UKDvNPuq/+5ZdKjXTN/Ns=;
 b=Psld7g/74SA6GJhQAs/jfv8k2wtgeJmYGSN1xjNhURa0ypfON4niWCEAzLe+sCaWSg
 igIAuVtsgOUBAvo8V6r79IDwmQSyh1bIAFOEVLb2UvRhOR6yFtraNjUDJSaWrdgaUodl
 kNLTy0C/4gWrkAzYmkG5VjcHjF4bzgNlvJB9xF0Aea1TG/w1HSdHv5lm2Wq7euY9gD1g
 UCr95+su0+p/j9iOpOKko72FKgOCzyqbcOAXKniipIasTeIyCo95iACOjq5/U2HYHYbK
 0bnxoQMPC/AXqopjY17Wkk7x5wVJ1THriQdc/IDGN9zMESk3lCa5cdIHGry7n3IKgsu9
 gmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011617; x=1752616417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQ7EZXT9CO2OHBTy9GyeX1UKDvNPuq/+5ZdKjXTN/Ns=;
 b=GtxBEJNHBlSZES8ryQ4/x+jX50puFGc/JNA5fRZKXSVhOIRk4EBXwAc2tpE69ZerWW
 bWMvNhLDj758DQUH3ejREoCcojK8kBKUyXmFe6Sq70MS1iAu8SANL8GalhhJnUNUzNo0
 s23Hbf3LKsBd3mbxA3M07ovAq9xInvlYFwTDysztOiqPS1ihoVjPPhnFsU4vatxEQltB
 ERiMbXexU58ytVymyPVl0UfpFDVg+b0ln5v0ELpQAKzEKQ0mUz0YxuF7akmstEynCjGR
 gM+gt60tq0nrHU2cRMPf4GqtBhkz4VEHyxCOaZxGYvxBllXanTuU0S4CmAmMajFbpJjZ
 8NUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYXOo3sDUZpqZyBaGJ2zlGwXmnH8ZWBKt5FyceOW3Swzvzka0NnpRtHrVhJUv8wHzKUsSo4cFKIg==@nongnu.org
X-Gm-Message-State: AOJu0YwsTMALnDdItP3k7cq3PX3mjeiK4IyOsfi8TxggIwpX1PgoZwfe
 CVQdcFd+u6F5A1br523nBrgQqGY7JDy/RLWZnu3SmETRjDFaWaH6ogFkxbMkC1+CJXA=
X-Gm-Gg: ASbGncvQkzjEYY2XR2483Vh8Zw2umkjjF1azC1LJgRss2PWPVPJA8Z/v1RAR5ZRoQzP
 edIP6xd8+FPIJe3zcl1RoiVflbghpCDn0iBKxR4j5NES5WQjpqcBCWKKWkAySpg1dDjS6wuBa8V
 AJVAY1R2E3heUZitiAnsQRSfc93zi9wQ0QiBtqWCHW2LigRmv0p8YW9gI8RelNPgsv0Yswr0tJ4
 IveO8xm3bRcv9rVTlMjCbpH7W2bf7G15iwli/Ye7hjhGby7piZDzM4gWxWhOudnFdwNlCyEmyEo
 hWAs5eZuLsA9YbJIy0NQ7MYGR9DRE2sbW87mFUztgpkDIfZckcCWnveJzyjy5X8UI+D0Cj7RsTB
 QXRrUAMeH6DhG9nsNrmKkWm3pn0VJnPkEjeRZlLSpkw==
X-Google-Smtp-Source: AGHT+IH6LgiCiKP3S4x7k4EEXqGXeCKB1z+Qt1OoQC51l1ga4Ds5cTR1QEfJT4eN5CJVshZ3/iSHSw==
X-Received: by 2002:a5d:64e7:0:b0:3a4:ddde:13e4 with SMTP id
 ffacd0b85a97d-3b4964ee263mr14146877f8f.58.1752011617528; 
 Tue, 08 Jul 2025 14:53:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d508cbdesm703125e9.33.2025.07.08.14.53.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:53:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 RESEND v8 3/8] qemu/target-info: Add %target_arch
 field to TargetInfo
Date: Tue,  8 Jul 2025 23:53:14 +0200
Message-ID: <20250708215320.70426-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708215320.70426-1-philmd@linaro.org>
References: <20250708215320.70426-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/target-info-impl.h | 4 +++-
 target-info-stub.c              | 1 +
 target-info.c                   | 9 +++++++--
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index 1b51cbcfe1b..a8b34d150ab 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -9,11 +9,13 @@
 #ifndef QEMU_TARGET_INFO_IMPL_H
 #define QEMU_TARGET_INFO_IMPL_H
 
-#include "qemu/target-info.h"
+#include "qapi/qapi-types-machine.h"
 
 typedef struct TargetInfo {
     /* runtime equivalent of TARGET_NAME definition */
     const char *target_name;
+    /* related to TARGET_ARCH definition */
+    SysEmuTarget target_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
     /* runtime equivalent of CPU_RESOLVING_TYPE definition */
diff --git a/target-info-stub.c b/target-info-stub.c
index fecc0e71286..2e4407ff04b 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -14,6 +14,7 @@
 
 static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
+    .target_arch = SYS_EMU_TARGET__MAX,
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
diff --git a/target-info.c b/target-info.c
index 9ebabec988f..8e29553b4ef 100644
--- a/target-info.c
+++ b/target-info.c
@@ -24,8 +24,13 @@ unsigned target_long_bits(void)
 
 SysEmuTarget target_arch(void)
 {
-    return qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
-                           &error_abort);
+    SysEmuTarget arch = target_info()->target_arch;
+
+    if (arch == SYS_EMU_TARGET__MAX) {
+        arch = qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
+                               &error_abort);
+    }
+    return arch;
 }
 
 const char *target_cpu_type(void)
-- 
2.49.0


