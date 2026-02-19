Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952FFE9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:20:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7fO-0005M4-SO; Thu, 19 Feb 2026 12:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fN-0005L2-Hj
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fL-0000QC-Av
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso163088166b.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521494; x=1772126294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SoUGojlUBFbeTt19n+1NScOu+57mMHlZ25AsG3U0eCQ=;
 b=hO80TEESVkCxnoCOw4FWUWV3iI8z4zYFjRbfbQYiIP77CSqkqUavlS5F+emDaDHXsJ
 tcw1B7VSESyIh0oykHPYlHLPvBRtFQWxHHrat6EG/4/nO6H1BnUimoG1bkl9xfJBsADn
 M0wKxMiT0Ude8waNIrNIg9z7XMQBtQ4qRkE9BqLSUVOGlRFPnS7GVTLCKUUAU3pOcLxd
 PMLB/zY5d+VhCeAf/AMbv6GxmqA48n33LkHI5Dtm0uRnfxtj0bTw3UyRT8djDCyyEqXc
 TW9sSH6Ajv79CXHEQbezmuGoJwiL8BWAzjOs7f6+TaSPfQxoPpxguk72o5WBS0QMIlAC
 oOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521494; x=1772126294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SoUGojlUBFbeTt19n+1NScOu+57mMHlZ25AsG3U0eCQ=;
 b=n/sl6zbsI5AJuKxa6e23lEnoFUG9bQGpl+89Sz4Xh7ogjQcUZfeqZIRHlyKbkZJkCs
 vX2r7WPogfJdB4PYAsEz/GKoA85if8zMJfTTSCWILLvbAo0LwqGbQjwh5nYsY8jR4een
 zNhxxlZReyXQYuSrsTt8Akym2Xn0xdeJiwO1yP7cdncsIIaYfDjgUqObOmqyWFnNnwUQ
 ARG9r09x08MqFdxqvEFH2NKtkFwG5zpgA27GBOfiWRk3cZ6pdxyIZSl7mnXfD3zQGj2B
 0uzY4jXkVn+pLI+GqvwVnaYrCQZCqJxnTnYNm4a1VSL4oTTMYpN3Vfmo9Wb9xASOJGyr
 kKgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnCDYAimRODuny5H/NAYiZ0TtYMpQBENG1MstgxRnMvlbGXGb4oDu8U6QO6U+pjCSWmCsYo8paYQ==@nongnu.org
X-Gm-Message-State: AOJu0YwQ679Iv7xaBM1n4QNAwOAmEyIY/VkbmtmXB/rwJAm9tINfOVAN
 v4cBPQkdraA8PFOrWWLY8HkVpwFAjcocVEaHBA1fssIT8I4ai1K0s3EkwnNChd6xcxU=
X-Gm-Gg: AZuq6aI+3dOWM83x5fZB0noosd0v4hhs8i1pl3tdeLjaiXuKQI6EL1ywcWADSBsXzgv
 9Lc3W7P2oq5RB2mPPiBYL/9f/Z/A05p8uUX3ULmZ6nJK0cs5PcAO3yNg3x/mA+ikS8kYKiYyQeS
 AWKyBvXDRSWkZ3TNZdRf2H8dg61l9dhjhfu+14oRcfVWu2Ki+Kyvu5MuSUWNRXt5IWXUivRRctd
 9IUB+NNworR14l0EXaCj2kGKzThv3U3JSw4jjOylPsJX5FalKiKhcjVEL/uoruxLol90GNUMNzq
 c3VXuGyEAGrFNK6YbQE2KFxiTGqdAY3wk+qZde63DXS+uickgWBf997BOFNgqqy2h0xWKFBDDS5
 xKS9ZKLgQ4t2Ek/tvgPPh5F5Axvz8X1G3EUdc3dHyYEx0hDs7fSA5H9M8EJQ5TWeE5W0Zo7SMuP
 pBVUZj+f6YGMd5izMzL/+Px9U=
X-Received: by 2002:a17:907:25c1:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b904deacd46mr211257966b.55.1771521493625; 
 Thu, 19 Feb 2026 09:18:13 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d516sm596445866b.5.2026.02.19.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:18:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CA2B35F8A4;
 Thu, 19 Feb 2026 17:18:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v2 03/14] hw/m68k: transition virt machine to multi-phase
 reset
Date: Thu, 19 Feb 2026 17:17:59 +0000
Message-ID: <20260219171810.602667-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219171810.602667-1-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

We don't need to re-create the architectural reset behaviour now it is
handled in the core m68k CPU reset code. We do however need to add
support for direct kernel booting so we stash that value in
env->direct_kernel_boot_pc and enhance m68k_cpu_reset_exit() to use it
if set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - re-write to use proper 3-phase logic, so dropped all tags
  - favour cpu_reset over resettable_reset(cs)
---
 target/m68k/cpu.h |  2 ++
 hw/m68k/virt.c    | 34 ++++++++++------------------------
 target/m68k/cpu.c |  5 +++++
 3 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7911ab9de30..d3b604689ab 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -155,6 +155,8 @@ typedef struct CPUArchState {
 
     /* Fields from here on are preserved across CPU reset. */
     uint64_t features;
+    /* Override the normal reset vector with a direct kernel boot */
+    uint32_t direct_kernel_boot_pc;
 } CPUM68KState;
 
 /*
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e67900c727d..b2e651ebcfd 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -87,23 +87,6 @@
 #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
 #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
 
-typedef struct {
-    M68kCPU *cpu;
-    hwaddr initial_pc;
-    hwaddr initial_stack;
-} ResetInfo;
-
-static void main_cpu_reset(void *opaque)
-{
-    ResetInfo *reset_info = opaque;
-    M68kCPU *cpu = reset_info->cpu;
-    CPUState *cs = CPU(cpu);
-
-    cpu_reset(cs);
-    cpu->env.aregs[7] = reset_info->initial_stack;
-    cpu->env.pc = reset_info->initial_pc;
-}
-
 static void rerandomize_rng_seed(void *opaque)
 {
     struct bi_record *rng_seed = opaque;
@@ -111,6 +94,14 @@ static void rerandomize_rng_seed(void *opaque)
                                 be16_to_cpu(*(uint16_t *)rng_seed->data));
 }
 
+static void virt_machine_reset(MachineState *ms, ResetType type)
+{
+    CPUState *cs = first_cpu;
+
+    qemu_devices_reset(type);
+    cpu_reset(cs);
+}
+
 static void virt_init(MachineState *machine)
 {
     M68kCPU *cpu = NULL;
@@ -129,7 +120,6 @@ static void virt_init(MachineState *machine)
     SysBusDevice *sysbus;
     hwaddr io_base;
     int i;
-    ResetInfo *reset_info;
     uint8_t rng_seed[32];
 
     if (ram_size > 3399672 * KiB) {
@@ -142,14 +132,9 @@ static void virt_init(MachineState *machine)
         exit(1);
     }
 
-    reset_info = g_new0(ResetInfo, 1);
-
     /* init CPUs */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
 
-    reset_info->cpu = cpu;
-    qemu_register_reset(main_cpu_reset, reset_info);
-
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
@@ -235,7 +220,7 @@ static void virt_init(MachineState *machine)
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        reset_info->initial_pc = elf_entry;
+        cpu->env.direct_kernel_boot_pc = elf_entry;
         parameters_base = (high + 1) & ~1;
         param_ptr = param_blob;
 
@@ -315,6 +300,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "QEMU M68K Virtual Machine";
     mc->init = virt_init;
+    mc->reset = virt_machine_reset;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
     mc->max_cpus = 1;
     mc->no_floppy = 1;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 0dce8ef282e..71393b9fa19 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -193,6 +193,11 @@ static void m68k_cpu_reset_exit(Object *obj, ResetType type)
                                          MEMTXATTRS_UNSPECIFIED, NULL);
     env->pc = address_space_ldl_be(cs->as, 4,
                                    MEMTXATTRS_UNSPECIFIED, NULL);
+
+    /* some machine models support direct kernel boot */
+    if (env->direct_kernel_boot_pc) {
+        env->pc = env->direct_kernel_boot_pc;
+    }
 #endif
 }
 
-- 
2.47.3


