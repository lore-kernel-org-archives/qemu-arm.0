Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC4CCD1AB
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAJ-00082d-Kt; Mon, 20 Oct 2025 18:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAG-0007xx-9c
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAE-0006ot-Gl
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so3158573f8f.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998537; x=1761603337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iIq3d7ugauwSFwb7NuuD2EvqM+PTyDDPePzmnW8HEF0=;
 b=m4ltgyujTSAmigIYp29BjJOPboFwKb62WK6DyX4T/yUbdJPyHJVjWXVUBKEM6XkcJj
 FkEEfW7R4u/HMjHNh+53D26ZQLqfZm63QRW3Oev68OMilDRqB72ZxSukQ2quSA7U/bbr
 dz7zv1a7TNBV0LMO4tYQk/8JfGw4T+cUkuHa7zvVc4T0U/ugHQSbhEFBX1hEw8w83mgh
 kEVjIYhoEmbAaFnIBw2XC9pSn8ngOc67YfmHw2EtlZtP92hx1zXZKmY7g7M3T8lL/WiC
 QbUsmARDqJbO4j20d3Rssq7mpFEtwIQYciMBVXNS0kwMWQnNIYO8fIGiIL0zS2yKhfFy
 6yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998537; x=1761603337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIq3d7ugauwSFwb7NuuD2EvqM+PTyDDPePzmnW8HEF0=;
 b=nznWejtKyLwCbeAXtqfnYlIiyXL4ejWpd1z9n+owmU9S7NokF4Mvo+pZ6nrTHnWe9j
 rFMNM6w5PUX6/qHBPEuKIU39EVqPe4dPAm5vf5YEZafJh2wxwdeqkSxy8NIgTf7mAq88
 t+zEJcDcvHxRPMzI1OSzvHSuv7/B6qPXVutZ4N/O3FCdD2FNe+o9kUMtO0TiAy1hbF6b
 wTHiMiqrn6P5X4xat0k2AYchMkhCUfGzcnCGAF+vub++OJn5cIeQcx2GCaE31IztEHml
 UyZouUU7ta1ra8lYQwwDCjrMzbpJkfMUIhzPUWJ0nJoAcbBCvhirbXlK5jS1T8glO5sZ
 Qnkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX72D6Rs9lTIXckjAWb8UnyzlFROvsQbHgyS8z+iqnkqZ1sxS2VEMQL96e/KlwHVn2MrnPq1wE2AQ==@nongnu.org
X-Gm-Message-State: AOJu0YwcV4CE2Mbu0gni0rOo4+vc28S+YcSIBhnNs4bQUDsydG7dQ0uc
 T3YP8vU6pNx3dZr61eHYKJ3vvrWya6XYq9ucWTqBH/ECaeoRiuAaSM56YV4koKiy3W74FZZqhGJ
 T5O7VJK4=
X-Gm-Gg: ASbGncu7qfHfxYpin8cXjTtIkAOAnm/mC7QVX9MPd/IRe4GxF9TkS7tCcvoeC8yvFzd
 U2vKJC7NdPPf0soUUtuOkXMbRHfo/QD7giVLLohmr07R+qZtpE9OZUG3HJfw7JdvmfHCylgE4qf
 VVj6olCTC478kJeO5tEn1o2fuNIU5RVq0v3DAbzN4XQhTIqU2fl+Tu4CpPgF3W9K27w5GQwnltU
 JmHvLaDWFwMMAygFO3ry3ho3FShF4CchixYoY8Wk/Z5LlNZFFstZzuYa7lkKvIWqA6g6d3dw3WI
 tJKQKH+l0iYpeo16TfFrpPUZhM20K+n4SnwgWgbSX5w2GWBxMZmDsmZBf5C5kLIL86riBi1UuWF
 +4Rh9SDdbNiq/rgXOWwWIn8xulMfPLz+qPY0EDd1X+Y/DMEeiMt8G7Jqo7e+5HWyx4M+u3HrOE8
 85vhecRrCy5a0kmO4BLTseuzausRVGmncZQ2+3IXkrWEIRv8XGpQ==
X-Google-Smtp-Source: AGHT+IGOzC8NFR459Iyg/x6I6BazigcAwIaqRGlvru5H12xY+WosrlT2e9g6FJOo/25C9FnSr8Rz/Q==
X-Received: by 2002:a05:6000:2405:b0:3ea:e0fd:290a with SMTP id
 ffacd0b85a97d-42704d9ccc4mr9710219f8f.12.1760998536901; 
 Mon, 20 Oct 2025 15:15:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b988dsm17559204f8f.35.2025.10.20.15.15.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 21/30] hw/arm/virt: Replace TARGET_AARCH64 ->
 target_aarch64()
Date: Tue, 21 Oct 2025 00:14:59 +0200
Message-ID: <20251020221508.67413-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Replace the target-specific TARGET_AARCH64 definition
by a call to the generic target_aarch64() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/virt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d3809754460..dda8edb2745 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -32,6 +32,7 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
+#include "qemu/target-info.h"
 #include "monitor/qdev.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
@@ -3263,7 +3264,8 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
     if (tcg_enabled()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
-#ifdef TARGET_AARCH64
+    }
+    if (tcg_enabled() && target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a55")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a72")));
@@ -3273,15 +3275,14 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
-#endif /* TARGET_AARCH64 */
     }
-#ifdef TARGET_AARCH64
+    if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a57")));
         if (kvm_enabled() || hvf_enabled()) {
             g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("host")));
         }
-#endif /* TARGET_AARCH64 */
+    }
     g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max")));
 
     return vct;
-- 
2.51.0


