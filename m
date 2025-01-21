Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24281njc;
        Tue, 21 Jan 2025 03:41:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4QmI20dzF2D66eoPCeKlKiY0bTBgFiqmG7RtED1hcHGBD367sEMSGExdx3S+TtzTXmiu4RxlPCeL06Q==@linaro.org
X-Received: by 2002:a05:6000:2a9:b0:385:dea3:6059 with SMTP id ffacd0b85a97d-38bf57b64d5mr15182983f8f.49.1737459668043;
        Tue, 21 Jan 2025 03:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459668; cv=none;
        d=google.com; s=arc-20240605;
        b=eea5SQikcSwvfPpzPUcQtQaIVzP3IhHDPQelauOX89N/AZdYS5W4UcRl+oYe5kUN2j
         Pc8wvnP830Q8ZZ2ZxQ3oZeFb68kuVl5GC6Tfx6BgfUr6xqHvjZZD6CjZDfVX7ns84tAh
         GY3LAlSFUrcJm+BjLXFZPowDwfpHMgooD34bSOuDQfgyONe/bo66/+1FujRJEk4UlBVI
         Rw/9L2D5zSGBavuYBkFKF6uUwRZMp8WCYo7Xrn7+nguu1HJ8wlmgoO3loOkrEwVsn/iS
         B0XsB0gvAYfmJrthQ9dzPos0U/LmUaJCSkmD3LFDY4G+YFz3K+p42ETIi3Tfuc4v4Y7S
         p8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/3HlKJr0e+T3QTj2gDcsUT1Px2dX5i+yFz6MQF4ebrA=;
        fh=w8GRn0hwiXhyqR0Lr7tdL6/ucA1Frga6IuKQE3HhSho=;
        b=hXYlV3iLm1Q652nhsQ/oHkF/rV04ZlZ8DMJgkkZHR0RD8+y3U3nIgHl7buZA/phRLe
         EOArTyl/sIB3+NIFWap+szW+5n7Xt08AcLMqzQf1rchBKKYzoOM5L20fkF4qLybGH19j
         +nNMx45c8Fe360KSSa/hahhQPt9IqyjmE/0hiwo4CZuGeaAlhlHjzOY0Plc4C/G/FKOS
         2HAdI9HwqbV8mM5RV/Alk9rQYZm5gKGZ2bVQYVrSEK5QeOCedqcyYTdXMELylr+wFkFR
         wtHMFpEntXijYETtVi2DJa+pieqK2zcaDruVtK4DG/R/iP6ovtJGx+f8J8Sw8An/ngM/
         RwWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nw/Yk5TY";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38bf3214e7esor2893961f8f.2.2025.01.21.03.41.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nw/Yk5TY";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459667; x=1738064467; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3HlKJr0e+T3QTj2gDcsUT1Px2dX5i+yFz6MQF4ebrA=;
        b=nw/Yk5TYMahAvm0PH1s45zqZVLdZ+DCsY+BgGjFdflSacgNm0K1d8T7TIMqPNnp/+2
         2GQi1GFIN/TJ7nmK44beaSEQYwQ9l939XwIqCO/IOLVoAn32oiiEZF0ovnjB3dyguXP0
         jDzIDcIVCV4Oxc5IeEECGu+0OqI1cMAf7NxtRxQh9btJceGfejsH+KeywUyGOBtGYkLp
         9YZfjbdZrYpht6LaSVR+xz91bOFm+KCJI3hCEm9cU0YqcNIFoHrhNrJ/mzbeE40RUfgi
         rEfWJL9mZ8ZyFwq7o7cVqT0hxwXU92T1/USf12O2dWfJiaDmAkUZmyMyHgFKsYrI3FJ5
         7UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459667; x=1738064467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3HlKJr0e+T3QTj2gDcsUT1Px2dX5i+yFz6MQF4ebrA=;
        b=C+0LrqBjTIqchkbGoiNfeGFJ2dJSylvR3t5+p2T3Nooz6P9d3gm4OIjP8Z9ifpfBFL
         juNFWqAZx8bUFTzQ+X639OZxJfBjjV02X6rgN7HJntZ40z0iHFws/5n8Q7LiBXdA3G8T
         dcHCqUaXyxsOk/LU0Vk5rA6gZzWEeUtiSdJHA+MC1V5BizQNCVsF+RbCFFjuUR9K4yrQ
         Yi/9neXLK5WxW2YtyTVJt9PMVtvigGPj3D+TQM8Z5bh4Tc9zPyCjE75ldBUnT4IJCksU
         tG0MrK8rI16BEEINGfzzBa4xEazxF0v4j660HvjyvhCAgk+XahPGAwrZVAGsuA99b1id
         DXLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqXSBNPUR6swPlYW4Sm6PTVUxBspAhkGUXHcYGoZV8BL4zUfyXrYCDWdOpAI9X16980QU/pxutQk5K7w==@linaro.org
X-Gm-Message-State: AOJu0YygVRGkA5xWfd2nPsxZ4roQP6sX9NggvRIpidACmRK47tBp5RvX
	fMfa5ENs2kbC8Fc+yifmVKvsx7rvM4yD4ab5h1SuLClJGVDioiyHlB0QztNXpRE1xw==
X-Gm-Gg: ASbGnct5Tl5+t6e20bU2rtODWKASaavhHYCPyik2AL0CFQ5qy/LDaAqcBoAfPSUsu3R
	Qnnl5638boO/1TUJnSZK1PSfzeEiqDC7mIuma+AreV2NfqBja4m9P1nS48HqAtdKmVYQIiOnfwA
	X/IcYuoyceHW3qGp1QxGckIc4BkqSpgmz6vevIrtB7x1rWdCpuklwi5un4JK7T6myBS0MCaRoFG
	FOVNCgNeTtU1Jbxa/HkfORd4aG6z/8yNHbthzuOoEgZXB3vN7hk3e7plkXAAtOu6c02IlK3xsLx
	qQNSjdlrQKexZfPKdFICskSAI9CRduHBOoqITDN3+gmS
X-Google-Smtp-Source: AGHT+IGs/ATla//lQ2AtPoPkcgm+ShlMsf7RR27CE1JH3r1iRxS5tELAIaHWMxn4/3oiZmjM0gynjA==
X-Received: by 2002:adf:ef4f:0:b0:38a:418e:bee with SMTP id ffacd0b85a97d-38bf57a2843mr10469117f8f.42.1737459667407;
        Tue, 21 Jan 2025 03:41:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327decbsm13358853f8f.90.2025.01.21.03.41.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/11] cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:47 +0100
Message-ID: <20250121114056.53949-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 567WB2nzxt3p

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 10 +++-----
 cpu-common.c          | 10 ++++----
 cpu-target.c          |  6 ++---
 hw/core/cpu-common.c  | 13 ++++------
 hw/core/cpu-system.c  | 55 +++++++++++++++----------------------------
 5 files changed, 32 insertions(+), 62 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb397cdfc53..b7367f6d808 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -824,10 +824,8 @@ const char *parse_cpu_option(const char *cpu_option);
  */
 static inline bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
 }
 
 /**
@@ -966,9 +964,7 @@ void cpu_interrupt(CPUState *cpu, int mask);
  */
 static inline void cpu_set_pc(CPUState *cpu, vaddr addr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->set_pc(cpu, addr);
+    cpu->cc->set_pc(cpu, addr);
 }
 
 /**
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..3a409aacb2e 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -389,11 +389,10 @@ void process_queued_cpu_work(CPUState *cpu)
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    if (cpu->cc->gdb_adjust_breakpoint) {
+        pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
     bp = g_malloc(sizeof(*bp));
@@ -419,11 +418,10 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 /* Remove a specific breakpoint.  */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    if (cpu->cc->gdb_adjust_breakpoint) {
+        pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
diff --git a/cpu-target.c b/cpu-target.c
index 89874496a41..98e9e7cc4a1 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -159,10 +159,8 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ff605059c15..886aa793c04 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -40,9 +40,7 @@ CPUState *cpu_by_arch_id(int64_t id)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        CPUClass *cc = CPU_GET_CLASS(cpu);
-
-        if (cc->get_arch_id(cpu) == id) {
+        if (cpu->cc->get_arch_id(cpu) == id) {
             return cpu;
         }
     }
@@ -101,11 +99,9 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
 
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->dump_state) {
+    if (cpu->cc->dump_state) {
         cpu_synchronize_state(cpu);
-        cc->dump_state(cpu, f, flags);
+        cpu->cc->dump_state(cpu, f, flags);
     }
 }
 
@@ -119,11 +115,10 @@ void cpu_reset(CPUState *cpu)
 static void cpu_common_reset_hold(Object *obj, ResetType type)
 {
     CPUState *cpu = CPU(obj);
-    CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (qemu_loglevel_mask(CPU_LOG_RESET)) {
         qemu_log("CPU Reset (CPU %d)\n", cpu->cpu_index);
-        log_cpu_state(cpu, cc->reset_dump_flags);
+        log_cpu_state(cpu, cpu->cc->reset_dump_flags);
     }
 
     cpu->interrupt_request = 0;
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 6aae28a349a..37d54d04bf8 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -25,10 +25,8 @@
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_paging_enabled) {
-        return cc->sysemu_ops->get_paging_enabled(cpu);
+    if (cpu->cc->sysemu_ops->get_paging_enabled) {
+        return cpu->cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
@@ -37,10 +35,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_memory_mapping) {
-        return cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
+    if (cpu->cc->sysemu_ops->get_memory_mapping) {
+        return cpu->cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
     }
 
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
@@ -50,14 +46,12 @@ bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_phys_page_attrs_debug) {
-        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cpu->cc->sysemu_ops->get_phys_page_attrs_debug) {
+        return cpu->cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
+    return cpu->cc->sysemu_ops->get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
@@ -81,64 +75,53 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf32_qemunote) {
+    if (!cpu->cc->sysemu_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf32_note) {
+    if (!cpu->cc->sysemu_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf64_qemunote) {
+    if (!cpu->cc->sysemu_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf64_note) {
+    if (!cpu->cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->virtio_is_big_endian) {
-        return cc->sysemu_ops->virtio_is_big_endian(cpu);
+    if (cpu->cc->sysemu_ops->virtio_is_big_endian) {
+        return cpu->cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
 
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->sysemu_ops->get_crash_info) {
-        res = cc->sysemu_ops->get_crash_info(cpu);
+    if (cpu->cc->sysemu_ops->get_crash_info) {
+        res = cpu->cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
-- 
2.47.1
