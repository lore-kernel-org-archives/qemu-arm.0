Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ECF531DC
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:55:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS3W-0002dx-1J; Mon, 13 Apr 2026 20:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3U-0002cE-RM
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:55:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3S-0000Ua-4D
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:55:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d64313c39so2759795f8f.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128100; x=1776732900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Mx6Ba0qnLGCZm9ivJTiXzs+j5UyrF2KihtewVHI4MY=;
 b=CzdnXXdVnukJDfKDRtKnmzap+Qk6s5Kk31K4FFtDK4E+L9xYx/fchUR7I/gpo+IU6m
 bT/FLjozqeta56as2OA5PAdrUlEXmqpv8IqkuNvRkNKouGhRDTYLoVm9UFfPw5abU8F0
 CSe1aYIRrOUp4xLOLZLQpqkjt1uYWhBId1sdYdmA7QATBPF+ajlMPf1+chj1sylJja5P
 9hKQKFWyTPprH2rNjrmeaR+RZqsM9xVpbPVeHnfQtKYfzSHrsHG+w4EE0wDWJURV28nY
 Ewnt6CZ4Yxpafls74/LuRnBi/qwdM1tb1aeSyTB6ejb1SxZDzZ5QtZihGOzxWGrax2ln
 6HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128100; x=1776732900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/Mx6Ba0qnLGCZm9ivJTiXzs+j5UyrF2KihtewVHI4MY=;
 b=o05MhXGj0GtoogshIxMMuIbDhu9AxaH4jDuKK1StwuhImzrmSVsWKy9al7nwnUhVCw
 OUrquha5oH3Nu375sax8KSz7lVN0kLdhKVo21mXyCpW+QOFAamFHZwFcPSOFHGBYcf/w
 o96IhshnEnYGaLzFjosKo3dIwHKWxdEZYhmk3wwz9E6P092ogN2HeIGu1XHfd+badzcn
 yMOjJRgZ7bHu4LCAaPWF9eOd1yP0mc8ZqA5Auv8rghWP6T2Lkgeh3Jz1xPZu6QjwpS+x
 /gjeZDtwv5IOTIS3lhmRBiuwpz9VXA6gJqEGR0g60EBXPHj0XxsWqykSgR+9XJlh/pW5
 DhSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NGVohgcXL3p/e/aQfX7hx6tvWWedcUuQIZbj6G7ZlW3HCUj5VWQ/jh3TJEHRYhJrLx6CNIf+bPQ==@nongnu.org
X-Gm-Message-State: AOJu0YztoX2ZDXEmcwKkAlVPHmiM9Ua0BY6U63XdxnQk6trRQBdFhZOr
 oZuukRaxmCjMTLOqmkETsgF1pCtmi05z9c21yrSncrLvjZxCXishBfSMGx/0jjBndd8=
X-Gm-Gg: AeBDies0x5byIG29o7VxsxeMftEYabK2CltQ3cM64diIBe7Bz2U20mFeUZz+ggocB7K
 KjIx+3FmOerItnpkFoYgLlvkSkDfLgVgOGSL/Mq2G4bh8w5Vf3k0lpxoS5VHg2ORZhqXwpqUoNz
 qsmI7RSwVXnyMMrrBwHc4565OdeKtuKjDCr7orSecwNAMyUhSGyxURqBjhWO3IqKoWfWG5xjL8a
 gtva96cMVBFXvfnUjAhLO8ky6YhteTFiT6QcDurekQCudD9bW3gRBKnQn9aqKQF/rIOr7h3lSip
 ig6mV7KWuMLId6UOAGQbLUP/SKh1ProFrx61pB7FtMBGd/gXahXYtuYGQ27fd7l2CqhAWKrxCVs
 itEf1fVos2A70Cea0j1llsfvkKu2ztvG/WI8i4s0PSkETWafQj7iI2FbASQuUk+F20ZnT2Yy/vr
 pKQXso1uy/rMHkbUvt7ZGb3cpY9RSGcX8Hzsnh+8vCcJyWCKgbOHp+RMkShxTJdbEmFSH3LqZ4
X-Received: by 2002:a5d:46c6:0:b0:43d:70de:1c6e with SMTP id
 ffacd0b85a97d-43d70de3419mr9272418f8f.16.1776128100176; 
 Mon, 13 Apr 2026 17:55:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec295sm36387347f8f.14.2026.04.13.17.54.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 9/9] target/arm: Compile m_helper.c once
Date: Tue, 14 Apr 2026 02:53:48 +0200
Message-ID: <20260414005348.4767-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/m_helper.c  | 2 +-
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 1bec8e9aea3..f2059ed8b03 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -17,7 +17,7 @@
 #include "qemu/log.h"
 #include "exec/page-protection.h"
 #ifdef CONFIG_TCG
-#include "accel/tcg/cpu-ldst.h"
+#include "accel/tcg/cpu-ldst-common.h"
 #include "semihosting/common-semi.h"
 #endif
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 95e9da151e5..02774409e56 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,7 +32,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'm_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -70,6 +69,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'gengvec.c',
+  'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
@@ -94,6 +94,7 @@ arm_user_ss.add(
   'debug.c',
   'gengvec.c',
   'hflags.c',
+  'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.53.0


