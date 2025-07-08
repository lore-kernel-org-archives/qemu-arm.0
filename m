Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A46C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:09:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGUk-0008JK-Gg; Tue, 08 Jul 2025 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGCG-0003jT-PI
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:49:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGCE-0002w1-0u
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:49:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2154378f8f.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011388; x=1752616188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91kh8gM7bE1DvG8K9EhiXTHWKL7JzNJQDQuB0S1EOTc=;
 b=qPi4QAjrl0OKEVH83y3dj+AMZuXeITMFOLtQaBex20C+U36HUU7OuUFbiOx5rKmMNx
 ZRwrWWCxgwWHACcgtjU50ctV9psdJ0xRsP9/F9TBMyBzaJu+qviyvMeJJvCaIgeIydza
 WhGeeu65HeXTMNxSw9CjV8AldRgNURoUMLp5KGULu1Eyg61Iq02ZNymSROHZ18UttdXi
 s1PtdZ4+bHSCXrrXAAGBgcsiKrSH1iyVCsC6F3n8Pua2Jszti8bEdyOst0Bc+6rpPyR1
 21cA1c7C7PX7ClJlhjuZ6bYKSDJcG6+mDTbZcBfSlcrvdF+pnoxIKJv/Vc1n/xu0DUuY
 XLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011388; x=1752616188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91kh8gM7bE1DvG8K9EhiXTHWKL7JzNJQDQuB0S1EOTc=;
 b=oTtwKkhZvKpz4oLp5Y4U8BcEwZC7WwMfT2fp5PlI8bco6w7bnMPg8P118vitKmgPOj
 IJrfK72IoZLY5EBx1cmoN6pjEZCBKD1iKud0AYGMIvFu7Gc8YjQkwpa8bbvceBqTMOQ8
 fMtzSiqMXd0IDLJGHQGY8PzM8MZjnA4YvES7cebCJw14K8371AjWihWJdiGMAmcZFngL
 mvdhVC9AU6xNRgCvMssE54UwSVUyxDIeNVPKX5Q/CBoA3XDEsYKmCA3trbjWOlay6I/J
 4mK2tIenrMCbe8OTRoEZOErNTTW8Ibu0HUPCxwbGUB3iFQLMlzwXkrsCxWHE7EMtCcOS
 yuHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfb8cFI7DPI4JVbR/1UX7Ti3HAHbwhhrdjm5fniC9oQFQ2wyYBF5VMEvMb0y89bNJYCgeZIBaDfQ==@nongnu.org
X-Gm-Message-State: AOJu0YzA75m0HuUqeEgtx3C46ALpnTvjU1za1M3rEjmhO5ilIqU0XkPp
 QbSUqoGwO1sN0u1SxN0qy3qVei5JW9sXtbnqojkUZX3ksmuvjYXl+EIk3oEeFns5GiY=
X-Gm-Gg: ASbGncsq6qgW4RY60UtLI3PqoY6UBIMU2Sq+IF3AbMp5TgCDOIVoKrSGtWoKd5UpUmD
 0XBAYjTRRWmURPuhygNTYXXSFtBongbj2uNgjxheJhQiVQwsFWME4TXjry2bXY9CkW1Oqvd9X5Q
 ArlveozcxkXqfcszAypkE7KMkdHa/Maz4SuqXTWzUCD4L+dgbZgxZdY5j1B8c3G6iCkNaTnJkAm
 nteNFXLNZKvkXKLveiDSHCN4q/NdZM6FiR/cNqjB4W7e394OUtOA9HzC4K6GzhhaPLI+VsCRMRA
 osq7y5kWvBtwJLaSzJ2j5/sf38f+TeUOuPfZCtaugATem2b6jtZh3vMZS5aca4IVtJlLhDzUTYq
 ZQc3FC8W1mMl8uaWCv4HebFT1QSylETRTQ6Jf
X-Google-Smtp-Source: AGHT+IGz/nDlysTObTTFveGgG8xteLGP44HOWLHgSh2RSo9II+etzca5BMNc9nan0XmMMHCx5DdNig==
X-Received: by 2002:adf:b64a:0:b0:3b3:9ca4:ac8e with SMTP id
 ffacd0b85a97d-3b5e320cdeemr684024f8f.44.1752011388403; 
 Tue, 08 Jul 2025 14:49:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285d3bbsm14150487f8f.96.2025.07.08.14.49.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:49:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH-for-10.1 v8 1/8] target/qmp: Use target_cpu_type()
Date: Tue,  8 Jul 2025 23:49:10 +0200
Message-ID: <20250708214918.70076-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708214918.70076-1-philmd@linaro.org>
References: <20250708214918.70076-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


