Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B77D1D462
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr67-0007A1-JR; Thu, 08 Jan 2026 09:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5x-00072T-UW
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5u-0000io-25
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so30607985e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882873; x=1768487673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sbu0M+maxtcRxXrgLFp4j1Dj8ytESdyrwiWOp43GF9w=;
 b=gn2BDc8Db/3PE20HBSfrSfyEvv3tAhXbrAG/OBYrOiM5avEcOWyluVpQGLhNojzbqb
 cfN5hBYcIylkU6EgI/uj3/t76/2lZlZ7lEIhsXGINzU9DEJy1G4RYd9vCgBAXygjpksl
 KFcufQ5o14E6fHG5uxPAPn3eW2CFLK4okQfeikOcL/7SVmFgoQApfDZpdusRI1JHBfBK
 TZlDmZPdadJLVwTywwL/yL2+m3lwVCEP7UiLIKW9qQexx1XB5d3kdRTUdyRs2i5BsTCu
 58z9eZXmTOgrVJzO1krHiM+/Qcbc7C8yD7LG9X9GYR0ktJGD7g55pQydDfN33PRhtqge
 HUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882873; x=1768487673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sbu0M+maxtcRxXrgLFp4j1Dj8ytESdyrwiWOp43GF9w=;
 b=n+DtcOBgArcdTBKxLJiGZE2gImiIbwaLmmQTGQ4t3wnT01PZGY1WUixR4Cfe2+lA31
 72ZLvSAKpQm/qIGkKr5atTEl4L3ziRFPNetLxhDz6QtlzAZnMdzzR6K6yCy/lq/xGjLB
 95/qmxMmX77vPgwyjSHFy1JLOjd969KDhMke5F7joqCcFqYlQsMsYYFTevhUSgUVCkNH
 yLEf7oGHTNCKBJwEvPw4oMnQBszmGaE1gUH1CnuRGOrOF4kYoyC0ki3Ees1xYg+Vkzix
 CGBJVhAa4xfNvuju8bGWUDz/cs/zZ6tSLL0GFEcFjsY5wxYxTrvNXvFWQiLiX63MrhKq
 txzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpo6L35+Y8N8+X+UJWFhd/0pO9trganF8IpIXJtvAHuRiS7DK1sPFGkMmj2+F5tDL3zeBa9bHEzw==@nongnu.org
X-Gm-Message-State: AOJu0Yx67waK4QnGPU/oxAXk/sSCPdCEzLiVVWLc6HU24Z/Otc6TcGrn
 07ie+w6Ig6loTaPTavUD2yJ//gNJJugsxnma9LtJoPQJnNYAJGX6+cBzj4eXKn6k6Kg=
X-Gm-Gg: AY/fxX6Crz7vRHeEudPoLEbe8Hw6r/TghXJxKdQ/XC2LwgmEIoHAe211U8RwiGgaEVG
 R4NND0U+hz9lBrTUzQqGZPGop/zAcEghVe9FlohbfwQapJmqTRW5UpDgczCZcK4EV1Q2LTH6C7P
 TZ1P3MH2ZAA3/j84pUFKoDSr+X2Y+44mDfpj2w3dRNTk11xbu+wD7ymHposu7PXP3ODqrV1cmq0
 HnSDtEpIM++ANW8JB4A8QS0eyLYkmZNTcucON29BH/TweF5ZaoMAOdQNcDBAmqusE/9ud3sPW+G
 rur6t5O7K8NFxwi5lvhpYROVt1m33m1V5uipNP/T53uPwhuHZLUiq/zPJroGjWByxt8YlcSmQPs
 M9QVjoNkPB/yLBH/Y3t70MRCXv0cN+MTAH6P8UxbO11ONFdWHy6sjAy+P0rZMRGljpKV8fd3RrB
 If/tnpz++SnLudJyU3LwM7kw==
X-Google-Smtp-Source: AGHT+IHHSKKF+8FsIcUnpmA+HxWnW4K6jZYoR2rUxPtSe+qc42mC3oncWJhn1rGbKjit/NRtcIjHyw==
X-Received: by 2002:a05:600c:620f:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-47d8f34f2e2mr6490295e9.0.1767882872578; 
 Thu, 08 Jan 2026 06:34:32 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d86637b90sm42599195e9.2.2026.01.08.06.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 48F365F917;
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
Subject: [RFC PATCH 05/12] hw/m68k: register a an5206_cpu_reset handler
Date: Thu,  8 Jan 2026 14:34:16 +0000
Message-ID: <20260108143423.1378674-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

As the mbar/rambar0 values are currently fixed we can migrate the
setting of them to the reset handler as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/m68k/an5206.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index f92a5d6a339..918c376a384 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -15,11 +15,26 @@
 #include "elf.h"
 #include "qemu/error-report.h"
 #include "system/qtest.h"
+#include "system/reset.h"
 
 #define KERNEL_LOAD_ADDR 0x10000
 #define AN5206_MBAR_ADDR 0x10000000
 #define AN5206_RAMBAR_ADDR 0x20000000
 
+static void an5206_cpu_reset(void *opaque)
+{
+    M68kCPU *cpu = opaque;
+    CPUM68KState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    cpu_reset(cs);
+    cpu->env.vbr = 0;
+    cpu->env.mbar = AN5206_MBAR_ADDR | 1;
+    cpu->env.rambar0 = AN5206_RAMBAR_ADDR | 1;
+
+    cpu->env.pc = env->reset_pc;
+}
+
 static void mcf5206_init(M68kCPU *cpu, MemoryRegion *sysmem, uint32_t base)
 {
     DeviceState *dev;
@@ -47,14 +62,9 @@ static void an5206_init(MachineState *machine)
     MemoryRegion *sram = g_new(MemoryRegion, 1);
 
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
+    qemu_register_reset(an5206_cpu_reset, cpu);
     env = &cpu->env;
 
-    /* Initialize CPU registers.  */
-    env->vbr = 0;
-    /* TODO: allow changing MBAR and RAMBAR.  */
-    env->mbar = AN5206_MBAR_ADDR | 1;
-    env->rambar0 = AN5206_RAMBAR_ADDR | 1;
-
     /* DRAM at address zero */
     memory_region_add_subregion(address_space_mem, 0, machine->ram);
 
@@ -90,7 +100,7 @@ static void an5206_init(MachineState *machine)
         exit(1);
     }
 
-    env->pc = entry;
+    env->reset_pc = entry;
 }
 
 static void an5206_machine_init(MachineClass *mc)
-- 
2.47.3


