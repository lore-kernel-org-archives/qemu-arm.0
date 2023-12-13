Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431246ejo;
        Tue, 12 Dec 2023 22:42:32 -0800 (PST)
X-Received: by 2002:a17:903:1206:b0:1d0:7d9a:3bca with SMTP id l6-20020a170903120600b001d07d9a3bcamr9273116plh.52.1702449752261;
        Tue, 12 Dec 2023 22:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449752; cv=none;
        d=google.com; s=arc-20160816;
        b=MPCkdDyoNSGdItwiOs5SImSJ1tukHEWCtByjuAwHpDDvttYfoO8KJlaE06NXSNhk1K
         lGAp2iLifoaK7BSrD74NBpOKQRC3SrO4O8tVoWDPFPH/oB8LtIe2QmR8F1HYW6NQfs5f
         yPBYiEWTPRfrrXnI7zlgzHUvyOQwLjnbFdHf5mKJOaQVoaPSkBL6QqgkjxwALq5yen/e
         K0GJ8sH7jXtDKvnlAakEs3WYz6FX3lq6GLfAt2BcW4HfOXEF77G2teKeZb7cuXngiV25
         JUKzbi2doAt5EQgfyXwWzyDwWPcdLMZLre6Y9hvwds+MJkNvPXTGc3ChNi0JFerzFsKP
         bPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=MbbRxjII4jr++GPX3QPvBMzd7JXwmzHEH/GlIUlzF5s=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=H/ISWjnxExDywVmhasvo7GWUhnWtdpZofC00p2arIhV5Pe0wdeaby55Z5dTtPEslCR
         EqyoEk5BTbu8QKWyzfNH8TmZTxLXTJox4nZznj5fQ80aw7WYsD78ztR+BSff59dxdKRB
         aSodFGdzKQaYmHPK1xkV761y+ZIF02BtU+k8sQw50dumBVhe7zKfZ4kPSgzNrHTJ+dfE
         Nxcg9Bd3JTjs0Tf+CKMLoZL7tM4qk7XJDNM6FHsboGrwBOEHvFhMRVfO5lnlvmXI5cvA
         dzmF63dmyOXb4EGuvYHBxz15/uP7/UVaJe1VdUXL0oK417OMDjmiUdbfZ7qKBgl9fzg8
         4jRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=u4sZ2l0X;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t8-20020a1709028c8800b001cc411b5404sor6734797plo.2.2023.12.12.22.42.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:42:32 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=u4sZ2l0X;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449752; x=1703054552; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbbRxjII4jr++GPX3QPvBMzd7JXwmzHEH/GlIUlzF5s=;
        b=u4sZ2l0X9pJOdSpfjZ1pvpIg2N2cqmP42W3Vi4GOxWz7V9got6SpBPCZwlN08GjlnL
         X054gysSYJhe2cWHJDKohOWm7eSFUiXVOqzRnVEy5B29FNVqKBNPMoTK0M5Qfhj7MfId
         QbaGsH89TcE+FTQ1cRXv8ZSYJegw4oRxUs4Xe/PdQzYY9C2mS2qfyJy57jqb14YNfLIY
         s+xFfUWOk3LgyBqHbaPMEZpiGK10L8JZoVTqWRxiUgXGt4QKgUANhU2bYUstMfjdr+Xu
         M+ckLzt+ENhqPyLAMFXBylPgVof1GdQwqHUvzu9Sqj4zJK7kvHEaR+jj2frDnxIY0fPb
         xQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449752; x=1703054552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbbRxjII4jr++GPX3QPvBMzd7JXwmzHEH/GlIUlzF5s=;
        b=V1py6I+3uN/XzckR4wIkz0JrSBztXGVKuO3w+LckBu2t5jxhGXDAfIC9gqY90ciqtR
         DkY+RXKjnJN2jPRxuTKj4sjolcWJIhQ0dGLyriy5hzyrrylWULNNTYJzg5PWpvBotHez
         3TUHnLMLVCTX8eCeONjvaTbJhFbzdzB6Up+uvFAiyGZ/tirCrfXJ2BT5azU99b5RCzQ9
         tRobwoxuuGfNimokMJtNLkzyp+fdg39tjUGBp37hIilgBJyOXDjKkRWAtHHOXziXjOss
         FQjPr6sA62z7X+gOhio4h72hVQeZ4Xkc4/R8gTumej4feSD6qjEski1+4c//p9zVvxhv
         1nSw==
X-Gm-Message-State: AOJu0YwC6eBQ9TBuk1LAduaT4OxtCwD3JqWSN9F56bkn0CnOAeXPju0m
	IR/zNyISBfFlmocSUqk4xfoeJw==
X-Google-Smtp-Source: AGHT+IH92tkHkf5azzdc38h9Nyyd7e+K73ewrWof5QMcI/1urqoxWWM49mLMNNblVWxpdNijt2/+bA==
X-Received: by 2002:a17:902:e741:b0:1d0:6ffe:a1f with SMTP id p1-20020a170902e74100b001d06ffe0a1fmr9124252plf.125.1702449751724;
        Tue, 12 Dec 2023 22:42:31 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id t23-20020a1709028c9700b001cff9cd5129sm9661022plo.298.2023.12.12.22.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:42:31 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:07 +0900
Subject: [PATCH v17 08/14] gdbstub: Infer number of core registers from XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-8-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: bXYBT5nhCQXi

GDBFeature has the num_regs member so use it where applicable to
remove magic numbers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h   | 3 ++-
 target/s390x/cpu.h      | 2 --
 gdbstub/gdbstub.c       | 5 ++++-
 target/arm/cpu.c        | 1 -
 target/arm/cpu64.c      | 1 -
 target/avr/cpu.c        | 1 -
 target/hexagon/cpu.c    | 1 -
 target/i386/cpu.c       | 2 --
 target/loongarch/cpu.c  | 2 --
 target/m68k/cpu.c       | 1 -
 target/microblaze/cpu.c | 1 -
 target/riscv/cpu.c      | 1 -
 target/rx/cpu.c         | 1 -
 target/s390x/cpu.c      | 1 -
 14 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c0c8320413e5..a6214610603f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -127,7 +127,8 @@ struct SysemuCPUOps;
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
- * @gdb_num_core_regs: Number of core registers accessible to GDB.
+ * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
+ *                     from @gdb_core_xml_file.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index fa3aac4f9739..2d81fbfea5cb 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -491,8 +491,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1d5c1da1b243..801eba9a0b0b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,9 +546,12 @@ void gdb_init_cpu(CPUState *cpu)
         gdb_register_feature(cpu, 0,
                              cc->gdb_read_register, cc->gdb_write_register,
                              feature);
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
     }
 
-    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    if (cc->gdb_num_core_regs) {
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    }
 }
 
 void gdb_register_coprocessor(CPUState *cpu,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index efb22a87f9ed..efcc22b1446c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2498,7 +2498,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1e9c6c85aece..8a5bad54cf70 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -793,7 +793,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 999c010dedb8..4bab9e227286 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -251,7 +251,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
     cc->tcg_ops = &avr_tcg_ops;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 65ac9c75ad08..71678ef9c674 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -384,7 +384,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_core_xml_file = "hexagon-core.xml";
     cc->disas_set_info = hexagon_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cd16cb893daf..7c2276b90656 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7969,10 +7969,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
 #endif
     cc->disas_set_info = x86_disas_set_info;
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fc075952e635..eedfeb965f67 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -847,7 +847,6 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base32.xml";
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
@@ -861,7 +860,6 @@ static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_arch_name = loongarch64_gdb_arch_name;
 }
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 11c7e0a79020..a27194b2a590 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -564,7 +564,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 1998f69828f9..9d3fbfe15921 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -428,7 +428,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
     cc->gdb_core_xml_file = "microblaze-core.xml";
 
     cc->disas_set_info = mb_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 673e937a5d82..a3a98230ca87 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1688,7 +1688,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9cc9d9d15ec4..cf11b1891162 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -231,7 +231,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
     cc->tcg_ops = &rx_tcg_ops;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 6acfa1c91b20..6fba9497295a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -362,7 +362,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 

-- 
2.43.0
