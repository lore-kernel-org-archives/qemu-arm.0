Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0F5D1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6E-0007M9-J5; Thu, 08 Jan 2026 09:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5x-00072C-6W
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5t-0000hn-PY
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so36079085e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882870; x=1768487670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJzuVbaZdIwgkAzM484kEZrNbs3ZhkcE6xTd5j2Mceg=;
 b=HYygImr4GhSEdt1R/SIEM+pDUdO/MLWXiAIlyg60A2D7iOkfkyc+ASIL8LdRoUyDcX
 o0tlFgzlwHsAcuL+6svx36tTurp4oJbD5AwEwF1b4tnT3Ztmg26+4tylczwPC7/DZkWo
 g+wvu/DnzehhcreiVR+HKqquU9LSuThe1cbe9WmhDhmbM02/MjiMZB0BqlqHeHf4I1LN
 Bz8QVfTJ5uDtnB/dU78Z/2rRjqJR3FzIKZ5aJry44ap4HoabZiuX1pflO4X3ba8x29mh
 2fmwqDYHlZrq9nhuxnwER9w4dPt5ABrQbU2BII4x8QRvE7yi7w8BH9OLbEokVvvoLq5+
 O/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882870; x=1768487670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CJzuVbaZdIwgkAzM484kEZrNbs3ZhkcE6xTd5j2Mceg=;
 b=g0MO1qgJ8a2ONF0Nc6qLYJfCpGRt1vaq18UlY2Gs9rZKCzn+aFDRVgFN5PiI15wFdj
 GyMbIDbNRvx/yvhfcFOfjdNS9cHN/6rBMj6lkvDOa7OR1BQRFaKi9XmYc0v6Nde3bElX
 uyO9w3eBl9/ZIHjtTs0S46aUnrG6GdVNvtiArYLbWDd+vhjpTptn610bxq+HwRcc3k6X
 j0sjifPGj4houQ3Z0g1fFKhF43dBGV7TJjMPYk08fpgcMRYKsCXbzecQL5PbhowD9e0z
 645Zd5YeDosSwohXdFPbmW59EX+IlJFTC8XQF7u8TFlEAU7JQZqa7J7jCWC2UiFmFu8A
 ZAhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBvG6anbeHjlJSC6KhvliDnnouj6dpqBUQ6uRc0l0T7HG8pMVbqrHjeys32bpsqGqO7nFvQjSYcw==@nongnu.org
X-Gm-Message-State: AOJu0YycHh3akvAQuowYFAYTUhd8Y8GP2Ncv8LbPADdGsX7NeD5UNmQX
 KM8hLjtvFassiBU64V5+gctfooSboU4ksyyc4/FY+2L//uKW3PSU3XAT2Q2t4JXtH0A=
X-Gm-Gg: AY/fxX5ClaRkkeuVOOHnK+Ku4so2GcT96t4ew78E9zuTIzG95B7v0OLsyF8lT7ac0JR
 7EJBkySh0gDZ3JSsemE3NiJ6GDERdoNK1wxTKV50Xd9R0VTMrc/SmO6frpcNGBLk/yTVOaKETq6
 YsmXiLYxtq3x/eGCSylHMPwuxfdSebB3i4N7KM6yrXDO5Agup7U+nU/wM4qAn6pcSjh3UzJsEbu
 0/rIRETCO5IDQpHU+6wuy47h2Ffua/wRKIDPYN0usKnQmD1QUIwCrhN4oYwJNm6xB8Lwr4zazKR
 /O/3B3OhbgoJPioBa+x0mHEZqO/THFovbBAUpljO/sdCFHWo5EHmYgBHivhSGxVq4vjfgdDwGlB
 9A5zU5WWw/GYAzUCLi6rk1vsdjqTkDENaJXzbIbWPNvj+HUn3ZLm46/9PVbt44G49ET9PRHyfvw
 J7oJ8GadTCnBLm/D1ktWxDTw==
X-Google-Smtp-Source: AGHT+IEszrccpcodAmK2Okm4qvXdSHUt71l38BB9KgWymhwhe6pMkgAQT1Emcr+HTay4HgOGZdg82w==
X-Received: by 2002:a05:600c:4fc6:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-47d84b0aaa3mr69677235e9.3.1767882870170; 
 Thu, 08 Jan 2026 06:34:30 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm37602105e9.17.2026.01.08.06.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6156D5F943;
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
Subject: [RFC PATCH 06/12] hw/m68k: just use reset_pc for virt platform
Date: Thu,  8 Jan 2026 14:34:17 +0000
Message-ID: <20260108143423.1378674-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

We never actually set initial_stack so revert to the previous
behaviour and stash pc in the common env->reset_pc holding place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/m68k/virt.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e67900c727d..6af74b7ba1d 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -87,21 +87,14 @@
 #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
 #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
 
-typedef struct {
-    M68kCPU *cpu;
-    hwaddr initial_pc;
-    hwaddr initial_stack;
-} ResetInfo;
-
 static void main_cpu_reset(void *opaque)
 {
-    ResetInfo *reset_info = opaque;
-    M68kCPU *cpu = reset_info->cpu;
+    M68kCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-    cpu->env.aregs[7] = reset_info->initial_stack;
-    cpu->env.pc = reset_info->initial_pc;
+    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
+    cpu->env.pc = cpu->env.reset_pc;
 }
 
 static void rerandomize_rng_seed(void *opaque)
@@ -129,8 +122,8 @@ static void virt_init(MachineState *machine)
     SysBusDevice *sysbus;
     hwaddr io_base;
     int i;
-    ResetInfo *reset_info;
     uint8_t rng_seed[32];
+    CPUM68KState *env;
 
     if (ram_size > 3399672 * KiB) {
         /*
@@ -142,13 +135,10 @@ static void virt_init(MachineState *machine)
         exit(1);
     }
 
-    reset_info = g_new0(ResetInfo, 1);
-
     /* init CPUs */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
-
-    reset_info->cpu = cpu;
-    qemu_register_reset(main_cpu_reset, reset_info);
+    qemu_register_reset(main_cpu_reset, cpu);
+    env = &cpu->env;
 
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
@@ -235,7 +225,7 @@ static void virt_init(MachineState *machine)
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        reset_info->initial_pc = elf_entry;
+        env->reset_pc = elf_entry;
         parameters_base = (high + 1) & ~1;
         param_ptr = param_blob;
 
-- 
2.47.3


