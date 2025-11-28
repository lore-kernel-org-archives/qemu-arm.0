Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17878D116F5
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxo3-00026o-LC; Fri, 28 Nov 2025 07:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnx-0001r4-Bi
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:30 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnu-00035k-0P
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:29 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-5597a426807so1237534e0c.2
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333744; x=1764938544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvuhIn8uZaMtJm4NBcfBnin3FaZy0VdfFZGXB/Y9EHQ=;
 b=HNN2S9y7vX5nElQA4RKQyM0dYnqBybZzEJ/xftUHwwskp54rjW9mxhZJfcap0jMflr
 G5iLuo+7IiggREUpNJKmRZohFlUWgReKRwpfYNv65R6cUZS1qhyYc008EbDO/wxM7JZi
 i2Lk8Ny9YvAhIzSaYDVxhzLDsGOzvFPgwEPcar3egq1jdlOadHiJZCsKFdLR6/z6hZC0
 7oz44nTuvJ7I1/n3klmubAsc2xlsedM91E2qX/Tx5z45hrsnomGgDGvx8R06T6WN1VsA
 o6abracmNlw7bGQw4TIAOfi49eGfuKD7tOp3xkr9+mdKtZ8Il3hHSfjAkLhK9C8BZJnp
 1sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333744; x=1764938544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TvuhIn8uZaMtJm4NBcfBnin3FaZy0VdfFZGXB/Y9EHQ=;
 b=UIrsl3gD+4ceTEDzVlu4AWxLeisgEPQ2A86gq0KzKwwM5pyBkcZAdWs6QGC5mRM/La
 XefObHgBorIKICYtsQZPskkn++UPiCQM+mU16q4zMarN/nFYWnxbZOLIPhb05JdLUvIm
 zqBHWiOShnBcvDapADf4dlbSE0xM2/THUAa+O0xjs+r6AKcRnuWx2eBJpt3ycwjywDAW
 3Lcc9TiGU6sinmv80Z/wuxJnn5kN5OzZK73kgUQ4KSGQRoiiGOrEWs5Fgs6f4kZgSZja
 MWoPT0iPGMmuOsB7cbCnkCyiGbltWpJrWsZ5Sn4Sw/9HKqVokkbrVL2ApLt4bSj15nd1
 CGwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLOAmV6zXAVjuUaSfRPSRBZcg/EYV6ZQwNuGe+8rBOyXCyNQscwg8P6Nh2zniosarg7zgjl7DxGQ==@nongnu.org
X-Gm-Message-State: AOJu0YwLdpBoi46w6fuQ36q6dszTcPlodxTnqzD6vY0QgGomvoayyv6V
 nxNfgpB1VgdLKLiffQl7RTlNLHTYF8dw74Yi226P0A+q+PbNTUz802pWZtxgiGKt8+lujSzd1cA
 JoDlB
X-Gm-Gg: ASbGnctCzCqeaI3dZXdEv0u0rYccmj+7yPDqKxiuVw+U0n3o86VXj2KbRkQIFfLN46a
 iyGMZLGx924NdnjBegdNN85u+FRz5rQkgn0Wd/t/yYA60NG7WzFtR7X5mN95eT0SvJx8YTwIk62
 b8W2YQvmacicPAHEgM2yoIpJnEfSMM4W8T3kQvucDWBk3sObqvTmEdTgGoFThO+M9sNK51L3C9l
 IsB6erTEf+802BBQRe2aJXfVxq/BYS5YW9nMbngtMTtnYOArIKVY1G8gt16quTIET1zcJCBelLN
 GfsKpT9CAlAXH3W7iSRc+LlLZZWPoZMVpg+35WFdpMwzwK5ddXGfi5JX3+6S7+K9rrQrKZYRjIF
 rx9ugmrBU2LumbXQiCxS0/SlIHlvdie7TjNKcfkt7y0JmmiAgRbFf7ae8gl5Pxiw6KRKw/x+c5X
 iG2dUenHs6V8dWQRU=
X-Google-Smtp-Source: AGHT+IEou8H9OT3q+BTzkiYzJRkn+KMoghYpSS/0UflTxuYL8Xgpy8HI5SRZKQKTKHdtMce/NRyyQg==
X-Received: by 2002:a05:6122:2893:b0:55b:1a3a:aae5 with SMTP id
 71dfb90a1353d-55b8f00e3c4mr9319308e0c.16.1764333743886; 
 Fri, 28 Nov 2025 04:42:23 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:23 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 1/6] system/physmem: Enhance the Address Space API
Date: Fri, 28 Nov 2025 12:41:05 +0000
Message-Id: <20251128124110.1272336-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128124110.1272336-1-gustavo.romero@linaro.org>
References: <20251128124110.1272336-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa35.google.com
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

Currently, the Address Space (AS) API allocates the ASes for a CPU
statically using g_new0 in cpu_address_space_init(). This requires
computing the number of ASes and setting cpu->num_ases, directly, before
calling cpu_address_space_init() to initialize the ASes for a CPU. The
number of ASes usually depends on the number of CPU features that
require an AS.

Since it's necessary to know the total number of ASes to set it in
cpu->num_ases before calling cpu_address_space_init(), and because we
usually only check for the CPU features that require an AS later in the
code, having to set cpu->num_ases earlier complicates the code that
uses the current API.

Moreover, the number of ASes currently allocated statically is tightly
coupled to the AS index defined in an enum. For example, if ASes with
indexes 0 and 2 are required but not the AS at index 1, three ASes, i.e.
three CPUAddressSpace structs, will be allocated in the cpu->cpu_ases
array, but only two will be effectively used.

This commit addresses both issues by allocating the CPUAddressSpace
dynamically, using g_array_new and g_array_append instead of g_new0 in
cpu_address_space_add().

It introduces a new cpu_address_space_init(), used only to initialize
the number of ASes and that is called only once before adding the ASes.
An index map is also introduced, cpu->as_to_cpuas_idx, which is meant to
map the AS indexes, which can form a sparse sequence, to the CPU AS
indexes, which must be a dense sequence, as they are the indexes used to
access the CPU ASes in the cpu->cpu_ases array.

The old cpu_address_space_init() is renamed to cpu_address_space_add().
It can be called any number of times, once per AS type, up to the
maximum number of ASes defined by an architecture. Hence, no prior
computation of the number of ASes is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 include/exec/cpu-common.h          | 16 +++++++--
 include/hw/core/cpu.h              |  6 +++-
 stubs/cpu-destroy-address-spaces.c |  2 +-
 system/cpus.c                      |  4 +--
 system/physmem.c                   | 56 ++++++++++++++++++++++--------
 5 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index e0be4ee2b8..f3a1accdad 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -103,6 +103,17 @@ size_t qemu_ram_pagesize_largest(void);
 
 /**
  * cpu_address_space_init:
+ * @cpu: CPU to init the address space(s)
+ * @num_ases: number of address space(s) to init in the @cpu
+ *
+ * This function must be called before calling
+ * cpu_address_space_add and it sets the number of address
+ * spaces in @cpu.
+ */
+void cpu_address_space_init(CPUState *cpu, int num_ases);
+
+/**
+ * cpu_address_space_add:
  * @cpu: CPU to add this address space to
  * @asidx: integer index of this address space
  * @prefix: prefix to be used as name of address space
@@ -120,8 +131,9 @@ size_t qemu_ram_pagesize_largest(void);
  *
  * Note that with KVM only one address space is supported.
  */
-void cpu_address_space_init(CPUState *cpu, int asidx,
-                            const char *prefix, MemoryRegion *mr);
+void cpu_address_space_add(CPUState *cpu, int asidx,
+                           const char *prefix, MemoryRegion *mr);
+
 /**
  * cpu_destroy_address_spaces:
  * @cpu: CPU for which address spaces need to be destroyed
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9615051774..cb26d6acf0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -402,6 +402,9 @@ struct qemu_work_item;
 
 #define CPU_UNSET_NUMA_NODE_ID -1
 
+#define CPUAS_IDX(asidx)     (cpu->as_to_cpuas_idx[asidx])
+#define CPU_ASES(cpuas_idx)  (g_array_index(cpu->cpu_ases, CPUAddressSpace *, cpuas_idx))
+
 /**
  * struct CPUState - common state of one CPU core or thread.
  *
@@ -515,7 +518,8 @@ struct CPUState {
     QemuMutex work_mutex;
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
-    struct CPUAddressSpace *cpu_ases;
+    GArray *cpu_ases;
+    int *as_to_cpuas_idx;
     int num_ases;
     AddressSpace *as;
     MemoryRegion *memory;
diff --git a/stubs/cpu-destroy-address-spaces.c b/stubs/cpu-destroy-address-spaces.c
index dc6813f5bd..a86e8d4db1 100644
--- a/stubs/cpu-destroy-address-spaces.c
+++ b/stubs/cpu-destroy-address-spaces.c
@@ -5,7 +5,7 @@
 
 /*
  * user-mode CPUs never create address spaces with
- * cpu_address_space_init(), so the cleanup function doesn't
+ * cpu_address_space_add(), so the cleanup function doesn't
  * need to do anything. We need this stub because cpu-common.c
  * is built-once so it can't #ifndef CONFIG_USER around the
  * call; the real function is in physmem.c which is system-only.
diff --git a/system/cpus.c b/system/cpus.c
index ef2d2f241f..cfe05ef0be 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -718,8 +718,8 @@ void qemu_init_vcpu(CPUState *cpu)
         /* If the target cpu hasn't set up any address spaces itself,
          * give it the default one.
          */
-        cpu->num_ases = 1;
-        cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
+        cpu_address_space_init(cpu, 1 /* Number of address spaces */);
+        cpu_address_space_add(cpu, 0 /* AS index */, "cpu-memory", cpu->memory);
     }
 
     /* accelerators all implement the AccelOpsClass */
diff --git a/system/physmem.c b/system/physmem.c
index c9869e4049..03a2ecf495 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -692,7 +692,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
     IOMMUTLBEntry iotlb;
     int iommu_idx;
     hwaddr addr = orig_addr;
-    AddressSpaceDispatch *d = address_space_to_dispatch(cpu->cpu_ases[asidx].as);
+    AddressSpaceDispatch *d = address_space_to_dispatch(CPU_ASES(CPUAS_IDX(asidx))->as);
 
     for (;;) {
         section = address_space_translate_internal(d, addr, &addr, plen, false);
@@ -752,7 +752,7 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
                                       hwaddr index, MemTxAttrs attrs)
 {
     int asidx = cpu_asidx_from_attrs(cpu, attrs);
-    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
+    CPUAddressSpace *cpuas = CPU_ASES(CPUAS_IDX(asidx));
     AddressSpaceDispatch *d = address_space_to_dispatch(cpuas->as);
     int section_index = index & ~TARGET_PAGE_MASK;
     MemoryRegionSection *ret;
@@ -775,10 +775,23 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
 
 #endif /* CONFIG_TCG */
 
-void cpu_address_space_init(CPUState *cpu, int asidx,
-                            const char *prefix, MemoryRegion *mr)
+void cpu_address_space_init(CPUState *cpu, int num_ases)
 {
-    CPUAddressSpace *newas;
+    /* Must be called only once per vCPU. */
+    assert(cpu->as_to_cpuas_idx == NULL);
+
+    cpu->num_ases = num_ases;
+    cpu->as_to_cpuas_idx = g_new0(int, num_ases);
+    /* Mark all AS indexes as uninitialized. */
+    for (int i = 0; i < num_ases; i++) {
+        cpu->as_to_cpuas_idx[i] = -1;
+    }
+}
+
+void cpu_address_space_add(CPUState *cpu, int asidx,
+                           const char *prefix, MemoryRegion *mr)
+{
+    CPUAddressSpace *newas = g_new0(CPUAddressSpace, 1);
     AddressSpace *as = g_new0(AddressSpace, 1);
     char *as_name;
 
@@ -787,19 +800,24 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     address_space_init(as, mr, as_name);
     g_free(as_name);
 
-    /* Target code should have set num_ases before calling us */
+    /*
+     * Target code should have called cpu_address_space_init()
+     * before to set the number of address spaces in a vCPU.
+     */
     assert(asidx < cpu->num_ases);
 
+    /* An address space can only be initialized once. */
+    assert(cpu->as_to_cpuas_idx[asidx] == -1);
+
     if (asidx == 0) {
         /* address space 0 gets the convenience alias */
         cpu->as = as;
     }
 
     if (!cpu->cpu_ases) {
-        cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
+        cpu->cpu_ases = g_array_new(true, true, sizeof(CPUAddressSpace *));
     }
 
-    newas = &cpu->cpu_ases[asidx];
     newas->cpu = cpu;
     newas->as = as;
     if (tcg_enabled()) {
@@ -808,20 +826,25 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
         newas->tcg_as_listener.name = "tcg";
         memory_listener_register(&newas->tcg_as_listener, as);
     }
+
+   /* Map the AS index to the next available index in the CPU ASes array. */
+   cpu->as_to_cpuas_idx[asidx] = cpu->cpu_ases->len;
+   /* Add the new CPU AS to the slot at the next available index. */
+   g_array_append_val(cpu->cpu_ases, newas);
 }
 
 void cpu_destroy_address_spaces(CPUState *cpu)
 {
     CPUAddressSpace *cpuas;
-    int asidx;
+    int cpuas_idx;
 
     assert(cpu->cpu_ases);
 
     /* convenience alias just points to some cpu_ases[n] */
     cpu->as = NULL;
 
-    for (asidx = 0; asidx < cpu->num_ases; asidx++) {
-        cpuas = &cpu->cpu_ases[asidx];
+    for (cpuas_idx = cpu->cpu_ases->len; cpuas_idx-- > 0; ) {
+        cpuas = CPU_ASES(cpuas_idx);
         if (!cpuas->as) {
             /* This index was never initialized; no deinit needed */
             continue;
@@ -829,16 +852,19 @@ void cpu_destroy_address_spaces(CPUState *cpu)
         if (tcg_enabled()) {
             memory_listener_unregister(&cpuas->tcg_as_listener);
         }
+        /* Free CPUAddressSpace->AddressSpace. */
         g_clear_pointer(&cpuas->as, address_space_destroy_free);
+        /* Free CPUAddressSpace. */
+        g_free(cpuas);
+        /* Remove pointer to freed CPUAddressSpace. */
+        g_array_remove_index(cpu->cpu_ases, cpuas_idx);
     }
-
-    g_clear_pointer(&cpu->cpu_ases, g_free);
 }
 
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-    return cpu->cpu_ases[asidx].as;
+    return CPU_ASES(CPUAS_IDX(asidx))->as;
 }
 
 /* Called from RCU critical section */
@@ -4056,7 +4082,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
         if (l > len)
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
-        res = address_space_rw(cpu->cpu_ases[asidx].as, phys_addr, attrs, buf,
+        res = address_space_rw(CPU_ASES(CPUAS_IDX(asidx))->as, phys_addr, attrs, buf,
                                l, is_write);
         if (res != MEMTX_OK) {
             return -1;
-- 
2.34.1


