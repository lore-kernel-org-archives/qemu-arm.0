Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF180D1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6A-0007CR-V0; Thu, 08 Jan 2026 09:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5r-000712-0N
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5o-0000gL-1N
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:30 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so22898545e9.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882866; x=1768487666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xegit4ejNTk5f0W5DGBT7IrkTCynuOYYrskO3sfAUpw=;
 b=HLpPbAvlBYEuciJnAg7EivyOW+LuSPk3JAulHjUj09RdTwuxwJqy+ckyKgfQSqm0Mn
 TnHFPRYgvBzvZ69hx8hK/aQMYqiKQYJSuKUUCmSM5neGqYdePXVW2RAKi34QZWX/mf/+
 iEhbUMG61bMt5sVILtbC3+Px55YDKKObMy55yvl4QoE/HEv5S5vJiGjGJAgVnlnKOSKQ
 acPAo34zdYI9oO9wpnb74OzJEXUNLgDAUkRNXBWrXb7G8cpnwwC9bViqQ9L6dBG5B7i+
 /EZKJX4apDSpAUXdWD7z8T5J/kvqGxg81QcBtCWP+jy36vhekb509ezA4eY3repaNxtF
 q3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882866; x=1768487666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xegit4ejNTk5f0W5DGBT7IrkTCynuOYYrskO3sfAUpw=;
 b=WJ9loSbtfl2Y0Vjr1oIAhsJ9cSqwCKoNGICK4wQQDKsyMqiEASJDuZ6QTvMF6POAIx
 fAK8+V27t0PkJC0I1VQBBvJXSei9rEBo0BR1hBqllvv9PsB4stl53fYxS0+heZka9okd
 uK01DgZc2BlMETMEhz/21g4itHY2yDo083OByAxNNifMRe1K+OKsemB3nJTyGyRgQHUV
 ttM6WyPu8kKKpqEK3+HnlaQhew7+2/B9DqOZU6Ngyo1pq3he4Js+7Ky5clCuFId44r09
 kl+lNMixEKqpspDGmG5GpUZmjuhAAuK5jrA1MH2ywBF5E74jNUThlvplJRddoqWp899W
 uOxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf7Y+BEshfct1gPKzQNkUGTsIRqx9DNtZZ2vyHYRcbxXJPYYMss3umoFn9hcpr2a66YU6nrE6J7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzcv5KdRbkprPpRXRGpEtl6WeqOPDJo7a/A7PJH2iZP5NB4n05D
 q21PrplSO5MsLpGlgeH6jmxDAPJnnStxUNL2g3607KOMAHHi/5F7SJ+mZe9QVTuuj+U=
X-Gm-Gg: AY/fxX7ImK4LO6hkSk6m+NVwe5otHO4e3G3lzDS6ogvYlM9G3oZqQkIQzB7B5Lnnhno
 IELz/F8z0FM4tmcqS7xjHBWZ7GhVvBIxtWYe0FKS/Qr1puBsDPGVo8nKXvygOqoTwlk7GJHOJOG
 NmDa5rVHMdhnybwuf0UlRiAeEFpfAatHLOd8ASQCj6QMPlqQmWiBDOKLRKumww6+YD8wgHbihnK
 haqhBf9Dy5ldCfOW2jZHnmULGuFkf7J1BuBRTdGGL9GKW7uz5eeDzIzMOim4zqqFfJCtO8k1QON
 R1HJgoAU9yLqzlLy9AVBjbvh930Ai5dBgcVh6oSPJC8Mogfg2BfJVEsyttcqRLi73LhUIE6ZFL4
 zl2jEgDY52Fr++0E4yYbWwiRIJx8y+sPbTl2NE+dEvMbitK3m8zkV3EpFJ3fyKCQevLwgzmuZ4Y
 DWXETvfyCRPSg=
X-Google-Smtp-Source: AGHT+IEx+WjdFSQNuvpe/UppetDTRNkYuwVaL12fCmNTmDl4lE5Wr+4Uohf6JheTbqrvNh2aXPuT0A==
X-Received: by 2002:a05:600c:470c:b0:477:79f8:da9d with SMTP id
 5b1f17b1804b1-47d84b3b522mr82961925e9.24.1767882865921; 
 Thu, 08 Jan 2026 06:34:25 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f410c6csm167037385e9.1.2026.01.08.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:24 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 21A055F8ED;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 03/12] hw/m68k: register a nextcube_cpu_reset handler
Date: Thu,  8 Jan 2026 14:34:14 +0000
Message-ID: <20260108143423.1378674-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

This is a fairly simple migration to the handler. Alternatively we
could eschew stashing the value in reset_pc and just re-read the ROM
on reset.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/m68k/next-cube.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 26177c7b867..3d66f5e7607 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -16,6 +16,7 @@
 #include "exec/cpu-interrupt.h"
 #include "system/system.h"
 #include "system/qtest.h"
+#include "system/reset.h"
 #include "hw/core/irq.h"
 #include "hw/m68k/next-cube.h"
 #include "hw/core/boards.h"
@@ -1249,6 +1250,19 @@ static const TypeInfo next_pc_info = {
     .class_init = next_pc_class_init,
 };
 
+static void nextcube_cpu_reset(void *opaque)
+{
+    M68kCPU *cpu = opaque;
+    CPUM68KState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    cpu_reset(cs);
+    /* Initialize CPU registers.  */
+    env->vbr = 0;
+    env->sr  = 0x2700;
+    env->pc = env->reset_pc;
+}
+
 static void next_cube_init(MachineState *machine)
 {
     NeXTState *m = NEXT_MACHINE(machine);
@@ -1264,12 +1278,9 @@ static void next_cube_init(MachineState *machine)
         error_report("Unable to find m68k CPU definition");
         exit(1);
     }
+    qemu_register_reset(nextcube_cpu_reset, cpu);
     env = &cpu->env;
 
-    /* Initialize CPU registers.  */
-    env->vbr = 0;
-    env->sr  = 0x2700;
-
     /* Peripheral Controller */
     pcdev = qdev_new(TYPE_NEXT_PC);
     object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu), &error_abort);
@@ -1335,8 +1346,8 @@ static void next_cube_init(MachineState *machine)
         /* Initial PC is always at offset 4 in firmware binaries */
         ptr = rom_ptr(0x01000004, 4);
         g_assert(ptr != NULL);
-        env->pc = ldl_be_p(ptr);
-        if (env->pc >= 0x01020000) {
+        env->reset_pc = ldl_be_p(ptr);
+        if (env->reset_pc >= 0x01020000) {
             error_report("'%s' does not seem to be a valid firmware image.",
                          bios_name);
             exit(1);
-- 
2.47.3


