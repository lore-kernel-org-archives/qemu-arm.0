Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD78BC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:02:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEVq-0008H9-0L; Tue, 08 Jul 2025 16:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCNt-0007UL-Ua
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:45:38 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCMU-00029Y-UZ
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:45:30 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so8716689a12.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996634; x=1752601434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHSfU1hw2z+9jkIM4IPD8mN1I4YQgc2MZothfwYUUn4=;
 b=g1BksczeO13qaqoqqRUsqpgSUhEx7ANJ95lOEgaoz+u+fWGzaJh+NoE7R9Y3/MAjQj
 nyWAwy9LAeqXC+oaBH33qj3//DQ88+k6TWV5i5064VzHHY4G3qjPxMQhyrQvSGXIoMXl
 2u4w3Fe4qk8+1Hj4OsHGuEwBLMDNNfTu+sQWQZ/A/Lxoxzu7PKJyfJqnIw9ZGHJvvt6S
 i2bRjT6bbAF0Brry1Ueov9kk1HBtLs5EZfaH4KPyZnMMlh/EHElynSfyGV65ckEYeLpI
 8HlJHDMVA/jEjzD6Py8BQT7CoHoZGKM4rOFXU48W9ty58T+ehjNmXLB7IyA2254JgBe/
 vh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996634; x=1752601434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHSfU1hw2z+9jkIM4IPD8mN1I4YQgc2MZothfwYUUn4=;
 b=VZrqy6ohHXDLMmbWp6k4vRH4NMjl6/xmsUs3Qu4wtq7hLZ4HVW9ISWZ4U7HiEsLHR/
 J7fKCuznUJTmy4jguYreUEBuDQGj0804Jk3Q87ZvrQ30PAjrF0vLtDLs/Q2yrmoBL9Et
 2HDc5g1nu4cd8AyV7U1Ek1y67rEyxTuF8ztPqZTF75Z9Jb1e/7bMyE6ABHcrFkYl3oaR
 m/CEqg0XvMKzF4kWOfJlP6M+0lrOmZElA8rNDg3pu2j9DS3Iqy5zkPk+NrxXWWeLYoR0
 JcX2ZAv0cUCPEyVrc58Yw8/0syols8ZRVOfQrgwe3mkhRF8VtTy603dA4qMEQOXdRmMM
 akXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoAf7k8k1gscd7Fs6ej6yluBp77AJelDr7FNO9V04Kew50YTXZ3Uz2ZNBJcEP6O1ZHrKX9GhFptA==@nongnu.org
X-Gm-Message-State: AOJu0Yx5Kk4W1qAzJ04wXM66Jurljd8vyWCiLQ7VB7kcP0NHJJXQS7P/
 tVFxJ78QlOnMiP9QiZiBSln2//nNhi9z6J9oVGf9S+54E1honJ7IljEODv40dImlTxHXfUlUdJq
 z/e3o
X-Gm-Gg: ASbGncsCw3lICmMrTJW4aMTFJ48B40w1eUIAGunkE/N6fWYkhh92NyefWgcn8B0101e
 fC8g1AJLP/+NAI5uXKDrRbsTg3qi1sLJeMABrXLIK2S4I54Nz4CWdi9i0xMBng8ZNOuJr0OByfG
 OZAAw+O03CmPCZ0dRhBkFz6VgR7YD18R6sozEEEyDC+5BhNwJAF/NmFLsycw+zS2bKxeBLb33bA
 uAL4ZnmsmY5jw/9UAYOoikIvjkRrtw7sxI3XRqyQ0Chx3+thS756avYKpBvQ/xIMSFyedEWYVWi
 5n/LaxIMNS30hq7N4HcEIZVZuC5JB/qxS9rI8fVtibmee4Bz7LbNvvxsrE054kwMw+649L7mJxy
 MGPXNzwuPzehbxua4tVafbzNzEUFN40dtrFDUzdBvuTk/POo=
X-Google-Smtp-Source: AGHT+IFsmodWCOsSIAzcPTk6dkh6F8N2/9PUPUtepWvho3NU70iaiwVVCG+G9Q36XUWaJ/6q1u8LHw==
X-Received: by 2002:a5d:6f1a:0:b0:3a6:d255:7eda with SMTP id
 ffacd0b85a97d-3b497038ed2mr14264397f8f.28.1751995228021; 
 Tue, 08 Jul 2025 10:20:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97353sm13744377f8f.51.2025.07.08.10.20.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:20:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH-for-10.1 v7 1/8] target/qmp: Use target_cpu_type()
Date: Tue,  8 Jul 2025 19:19:41 +0200
Message-ID: <20250708171949.62500-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-qmp-cmds.c             | 3 ++-
 target/loongarch/loongarch-qmp-cmds.c | 3 ++-
 target/mips/system/mips-qmp-cmds.c    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index cefd2352638..d292c974c44 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/error.h"
@@ -241,7 +242,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_ARM_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index f5f1cd0009d..1d8cd32f5fc 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "cpu.h"
@@ -32,7 +33,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
diff --git a/target/mips/system/mips-qmp-cmds.c b/target/mips/system/mips-qmp-cmds.c
index d98d6623f2f..b6a2874f2dd 100644
--- a/target/mips/system/mips-qmp-cmds.c
+++ b/target/mips/system/mips-qmp-cmds.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "cpu.h"
@@ -40,7 +41,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_MIPS_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
-- 
2.49.0


