Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C86CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:18:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5AJ-000798-AZ; Thu, 04 Sep 2025 04:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu558-0006bZ-8i
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:37 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54Y-0004Bw-VW
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:31 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b043da5a55fso107835866b.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973517; x=1757578317; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KM2ZDhNYkLW1KWUOdLmFVe8gLAQ7wgd1StjOThDS9B0=;
 b=bAJgtD5nXHix0yY9qWxVpDG0992ZNEyC7uYSRbyMzaBwG+SB+xRsA6NH2xByh8GG+T
 GNa2nHUn0TJT2Tz3VaSfpbeblotb4Pojy4Cd9/ZD4o6LAozYzIMQgb3eoGKc7N2Bcx9q
 YWw+CG4PBVYTMbHK14sIFJHwAz/tTmIaiip/KSmlL9UlwOfrqPcrt+uCPpw4oEoBwNHg
 /W2YaTVUNavM4ybB6liBXYne7l9PlCDu67AMLC1bcIB+WhWmhNScy/KAE4zHXEQIUrn4
 fecUyRpeuznWg2DZeu5WY/gItpFk90CkcCR+3+HJmK7PTRX4xAasNPSZ90sGl75ufg+D
 VydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973517; x=1757578317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KM2ZDhNYkLW1KWUOdLmFVe8gLAQ7wgd1StjOThDS9B0=;
 b=nwxMerVxy70CdsFO8R2DDJgaR1gb4Y7IZi1KvB7bU7SlMge+n/u+/LH1si0lmRH+3/
 1dVNJhRydq9tiZtLqddzbWShgvdNV/qVHqQzxBAOl8BGu879Kkz2ysuePqm3xaozVUiy
 MSHIwutrAw+pk4pqMhjoOTIVyUbk2P/OJvOoLw5QYkqfLAjZmJo5UQ3IK70n5uzgY7Wo
 cHebgBhAJw4CcF3A5aa8+1GanLUfwLpFPu5sC3PLvv+1bmh7t2aLjuZ2EIOGh2CEw/rR
 1q61eLN4mumM/XJ2UtrcnndtxigdgMwtUJXBvvRiDeamv9PRWmqvwoCE0auVd1xNmVKV
 n3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHJ8UI0YIBXbvVBFaL5sgm5w8H5jkY6yg5Kt799QLy2Wm61iy0CNHoyo5A4x2PqD+kMasEd35nPg==@nongnu.org
X-Gm-Message-State: AOJu0Yy5xHFhcyzwFnHmKiHjAm5XFQ681n1JlfwHB0cuH5dXXFK8JFtG
 KlGXlGvAR1qAB1SQe6cfjgZZhyQXudcdy8ymu7ujRAthpq3flEfumKAYwHgFMSfKqic=
X-Gm-Gg: ASbGncto7yaMK6YoT73FN+ndTxTXpRofK7v3bf61oh5RNzR/qovyXpog0+ryecB2EkK
 YXrSDHXPhvjQZGiyc/DwF5/N53+ft6YHwlSvORBE2hjZol0NiZMpH9O/AaUStc6xKtSc0KS6KDC
 m4EzaIroY/xGHp0glBej/ccyCN+4M6uY8dvB/9eEeJUIOTpVbQGIBkmkL9qY/PSJuTu4pxv3ZqA
 p3xeeEjUntHvgggDJgDISiPP1NRneboFTeCxE1232ivgdROCUhlVxcaD5/7tI0qh/34p4NhHCRc
 IcoA9iboanlDobcCH/VhaOIb8A4TkotscNwS3D+LASlLfB1lvZ50TxpeGyRDydaJWnsaAO6l7up
 ssZfgXEKwWuEI2JhX0U7s6yk=
X-Google-Smtp-Source: AGHT+IHrIfYhoi3D9Gm+87PPt9KEGR+SpE522yU9r/ngWzQfRBd4CgfSmCQXYip3hia/ZuTrUqkq6w==
X-Received: by 2002:a17:907:7ba3:b0:b04:848f:a0d4 with SMTP id
 a640c23a62f3a-b04848fa469mr89096666b.13.1756973517037; 
 Thu, 04 Sep 2025 01:11:57 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0484e8a4a1sm55353466b.83.2025.09.04.01.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 30E81601A8;
 Thu, 04 Sep 2025 09:11:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 049/281] semihosting: Initialize heap once per process
Date: Thu,  4 Sep 2025 09:07:23 +0100
Message-ID: <20250904081128.1942269-50-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

While semihosting isn't really thread aware, the current
implementation allocates space for the heap per-thread.

Remove the heap_base and heap_limit fields from TaskState.
Replace with static variables within do_common_semihosting.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h             |  5 -----
 linux-user/aarch64/cpu_loop.c |  7 -------
 linux-user/arm/cpu_loop.c     | 25 +++++++++++--------------
 linux-user/m68k/cpu_loop.c    |  8 --------
 linux-user/riscv/cpu_loop.c   |  4 ----
 semihosting/arm-compat-semi.c | 22 +++++++++-------------
 6 files changed, 20 insertions(+), 51 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index b6621536b36..4d6fad28c63 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -121,11 +121,6 @@ struct TaskState {
     abi_ulong child_tidptr;
 #ifdef TARGET_M68K
     abi_ulong tp_value;
-#endif
-#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
-    /* Extra fields for semihosted binaries.  */
-    abi_ulong heap_base;
-    abi_ulong heap_limit;
 #endif
     int used; /* non zero if used */
     struct image_info *info;
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index b65999a75bf..030a630c936 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -140,9 +140,6 @@ void cpu_loop(CPUARMState *env)
 void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
 {
     ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = env_cpu(env);
-    TaskState *ts = get_task_state(cs);
-    struct image_info *info = ts->info;
     int i;
 
     if (!(arm_feature(env, ARM_FEATURE_AARCH64))) {
@@ -167,8 +164,4 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         qemu_guest_getrandom_nofail(&env->keys, sizeof(env->keys));
     }
-
-    ts->heap_base = info->brk;
-    /* This will be filled in on the first SYS_HEAPINFO call.  */
-    ts->heap_limit = 0;
 }
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e40d6beafa2..9d54422736c 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -492,19 +492,16 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
     for(i = 0; i < 16; i++) {
         env->regs[i] = regs->uregs[i];
     }
-#if TARGET_BIG_ENDIAN
-    /* Enable BE8.  */
-    if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
-        && (info->elf_flags & EF_ARM_BE8)) {
-        env->uncached_cpsr |= CPSR_E;
-        env->cp15.sctlr_el[1] |= SCTLR_E0E;
-    } else {
-        env->cp15.sctlr_el[1] |= SCTLR_B;
-    }
-    arm_rebuild_hflags(env);
-#endif
 
-    ts->heap_base = info->brk;
-    /* This will be filled in on the first SYS_HEAPINFO call.  */
-    ts->heap_limit = 0;
+    if (TARGET_BIG_ENDIAN) {
+        /* Enable BE8.  */
+        if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
+            && (info->elf_flags & EF_ARM_BE8)) {
+            env->uncached_cpsr |= CPSR_E;
+            env->cp15.sctlr_el[1] |= SCTLR_E0E;
+        } else {
+            env->cp15.sctlr_el[1] |= SCTLR_B;
+        }
+        arm_rebuild_hflags(env);
+    }
 }
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 3aaaf02ca4e..23693f33582 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -94,10 +94,6 @@ void cpu_loop(CPUM68KState *env)
 
 void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
 {
-    CPUState *cpu = env_cpu(env);
-    TaskState *ts = get_task_state(cpu);
-    struct image_info *info = ts->info;
-
     env->pc = regs->pc;
     env->dregs[0] = regs->d0;
     env->dregs[1] = regs->d1;
@@ -116,8 +112,4 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
     env->aregs[6] = regs->a6;
     env->aregs[7] = regs->usp;
     env->sr = regs->sr;
-
-    ts->heap_base = info->brk;
-    /* This will be filled in on the first SYS_HEAPINFO call.  */
-    ts->heap_limit = 0;
 }
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 541de765ffa..2dd30c7b288 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -108,8 +108,4 @@ void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
         error_report("Incompatible ELF: RVE cpu requires RVE ABI binary");
         exit(EXIT_FAILURE);
     }
-
-    ts->heap_base = info->brk;
-    /* This will be filled in on the first SYS_HEAPINFO call.  */
-    ts->heap_limit = 0;
 }
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index bc04b02eba8..bcd13cd6dfd 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -666,7 +666,7 @@ void do_common_semihosting(CPUState *cs)
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = get_task_state(cs);
-            target_ulong limit;
+            static abi_ulong heapbase, heaplimit;
 #else
             LayoutInfo info = common_semi_find_bases(cs);
 #endif
@@ -678,24 +678,20 @@ void do_common_semihosting(CPUState *cs)
              * Some C libraries assume the heap immediately follows .bss, so
              * allocate it using sbrk.
              */
-            if (!ts->heap_limit) {
-                abi_ulong ret;
-
-                ts->heap_base = do_brk(0);
-                limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
+            if (!heaplimit) {
+                heapbase = do_brk(0);
                 /* Try a big heap, and reduce the size if that fails.  */
-                for (;;) {
-                    ret = do_brk(limit);
+                for (abi_ulong size = COMMON_SEMI_HEAP_SIZE; ; size >>= 1) {
+                    abi_ulong limit = heapbase + size;
+                    abi_ulong ret = do_brk(limit);
                     if (ret >= limit) {
+                        heaplimit = limit;
                         break;
                     }
-                    limit = (ts->heap_base >> 1) + (limit >> 1);
                 }
-                ts->heap_limit = limit;
             }
-
-            retvals[0] = ts->heap_base;
-            retvals[1] = ts->heap_limit;
+            retvals[0] = heapbase;
+            retvals[1] = heaplimit;
             /*
              * Note that semihosting is *not* thread aware.
              * Always return the stack base of the main thread.
-- 
2.47.2


