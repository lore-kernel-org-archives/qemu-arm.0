Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77BECA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5AT-0007wf-K7; Thu, 04 Sep 2025 04:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55E-0006iE-Ol
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54d-0004Ex-Qa
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so120621066b.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973522; x=1757578322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwhSkKrfdqCre4lDzht549TmP5FzYY8aqrmE9QpJP0k=;
 b=kHSJNKeIyBn69mLkDO/eJ9E6xsJ7MAMAx09wVjdQbHLruHqQkSyr/4/K06F9r+vT1W
 9nA2YCHk1jF2ZNSfBrJnyPhIvxxS7j19PAoJ+0BjeaU3Phm6JQES8xWrgPZAOvQHsyYa
 XpazfeqLNiyNx2MKtAWy0nDjJxQtn2axZfDH3qRMblTRDT9rK3W8eAG5gvoFXVyK28Pc
 t34SkoFxRW7CeXB1duIuHglVJdkCOX0HLFIrO+Elb2JgSYdaEp8KUfkzGTepD09JvokU
 GrGshsA8pkPa5EsF0V2m5FcNKc2S/MpI4bA2uPSasvX1NRP6+YhXfMmAiVkO1QJyN7zH
 K1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973522; x=1757578322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwhSkKrfdqCre4lDzht549TmP5FzYY8aqrmE9QpJP0k=;
 b=Bt/a0//UgdnxM2ibki79EoQ/G5XXMj2ML6OQqrqkbC8Mnm6LgI7Bo8it4Kn/JRfD/L
 LiwGe/HYkRCCz8DP7bN1MJGt0S8yS82HPlL2WydyjJLG5Ify1nTZidnLyQm7Y5Sl6aOo
 S9FGeqENqlpeivjF4d8cHAqfQcGXsVoKIh6gTQZiHEUy3q3Xj8VDARYPxiqNM8MOd0vz
 BbiI1KV+TKVG0GkyrkZxtHsQEQQub4PjnRa0GkqrO+NGcCmUjLoH3tSRFe9d0yxxHwSa
 fJI17ViSOTeUhkAJbQKAghdvGaY7KIwIEcecL76KQsbLwXVot+9p5/6ooc6VgwVMLd0y
 Jqmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmogqFeFeDANg6CBOTTvVwLjenVbdpxTDPl7OeWl7+ou3naenNusxAFimyFElEjGXcZS6EZFR/9A==@nongnu.org
X-Gm-Message-State: AOJu0Yyn94MoFKNBPaSk5JMZbz/i8+zNsJrYFDjUbelcnPtFaXzlDb/O
 ZYdGWj+NBVen/k1wL493lYFBfNaSSwErTlcZ2EcUe2b3vpxDRTnH9rCde+c5N3zQNvE=
X-Gm-Gg: ASbGncvbMMjwrt8qTx+PznGBIuDGct6jXMZLFiTaxwjPRwfzzyMXoMMcOLkTt9NVVau
 2n9TG2jcQzUYOrPakUKQNDfAxgqHRqHE2uRgWFQFZVQMj19gMBDQoSlUrgBqISC0XbL6DZsHMuu
 0vtLk7n3KloNqtr5FhXvFlhNd9EFeBpke3xaC+26P/BvR/t2p1hBXvphh1Jjv2BfMfxGXSvnjqP
 FYfdj1wUJb01hAuTHH9gaZ4LZWip2+NejD6EvTF0Nil0jZazkB51Smn2cgTE3LGoD0ouylrRPT+
 88igT+24j9TufcRasDi5GAk9X6Rbq0T+jYg21+fjs2GsFFnEEZpXE65JFgr3JKzCcn7yvFuIcdN
 0xH1f8pQvkDno1drDyEyN6N4=
X-Google-Smtp-Source: AGHT+IHUOHtzpsODUITWWyMTdwpfu6v0SGVJAsS4QaZt+cayYydt6GrT7iXWSxVMyu0qa6rieq+RPA==
X-Received: by 2002:a17:906:f592:b0:b04:3cd2:265b with SMTP id
 a640c23a62f3a-b043cd2803fmr1292006366b.5.1756973521904; 
 Thu, 04 Sep 2025 01:12:01 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0476e0d61esm186076466b.53.2025.09.04.01.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7D45260240;
 Thu, 04 Sep 2025 09:11:35 +0100 (BST)
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
Subject: [PATCH v2 056/281] linux-user: Move hwcap functions to ppc/elfload.c
Date: Thu,  4 Sep 2025 09:07:30 +0100
Message-ID: <20250904081128.1942269-57-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Change the return type to abi_ulong, and pass in the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loader.h         |   2 +-
 linux-user/ppc/target_elf.h |   3 +
 linux-user/elfload.c        | 116 +-----------------------------------
 linux-user/ppc/elfload.c    | 116 ++++++++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 115 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index 2c8414e0e53..818c5e6d7d7 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -102,7 +102,7 @@ extern unsigned long guest_stack_size;
 const char *get_elf_cpu_model(uint32_t eflags);
 
 #if defined(TARGET_I386) || defined(TARGET_X86_64) || defined(TARGET_ARM) \
-    || defined(TARGET_SPARC)
+    || defined(TARGET_SPARC) || defined(TARGET_PPC)
 abi_ulong get_elf_hwcap(CPUState *cs);
 abi_ulong get_elf_hwcap2(CPUState *cs);
 #endif
diff --git a/linux-user/ppc/target_elf.h b/linux-user/ppc/target_elf.h
index 8c0a8ea4312..4203a89d665 100644
--- a/linux-user/ppc/target_elf.h
+++ b/linux-user/ppc/target_elf.h
@@ -8,4 +8,7 @@
 #ifndef PPC_TARGET_ELF_H
 #define PPC_TARGET_ELF_H
 
+#define HAVE_ELF_HWCAP          1
+#define HAVE_ELF_HWCAP2         1
+
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 16709865f78..843b1f7b6cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -598,120 +598,8 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_ARCH        EM_PPC
 
-/* Feature masks for the Aux Vector Hardware Capabilities (AT_HWCAP).
-   See arch/powerpc/include/asm/cputable.h.  */
-enum {
-    QEMU_PPC_FEATURE_32 = 0x80000000,
-    QEMU_PPC_FEATURE_64 = 0x40000000,
-    QEMU_PPC_FEATURE_601_INSTR = 0x20000000,
-    QEMU_PPC_FEATURE_HAS_ALTIVEC = 0x10000000,
-    QEMU_PPC_FEATURE_HAS_FPU = 0x08000000,
-    QEMU_PPC_FEATURE_HAS_MMU = 0x04000000,
-    QEMU_PPC_FEATURE_HAS_4xxMAC = 0x02000000,
-    QEMU_PPC_FEATURE_UNIFIED_CACHE = 0x01000000,
-    QEMU_PPC_FEATURE_HAS_SPE = 0x00800000,
-    QEMU_PPC_FEATURE_HAS_EFP_SINGLE = 0x00400000,
-    QEMU_PPC_FEATURE_HAS_EFP_DOUBLE = 0x00200000,
-    QEMU_PPC_FEATURE_NO_TB = 0x00100000,
-    QEMU_PPC_FEATURE_POWER4 = 0x00080000,
-    QEMU_PPC_FEATURE_POWER5 = 0x00040000,
-    QEMU_PPC_FEATURE_POWER5_PLUS = 0x00020000,
-    QEMU_PPC_FEATURE_CELL = 0x00010000,
-    QEMU_PPC_FEATURE_BOOKE = 0x00008000,
-    QEMU_PPC_FEATURE_SMT = 0x00004000,
-    QEMU_PPC_FEATURE_ICACHE_SNOOP = 0x00002000,
-    QEMU_PPC_FEATURE_ARCH_2_05 = 0x00001000,
-    QEMU_PPC_FEATURE_PA6T = 0x00000800,
-    QEMU_PPC_FEATURE_HAS_DFP = 0x00000400,
-    QEMU_PPC_FEATURE_POWER6_EXT = 0x00000200,
-    QEMU_PPC_FEATURE_ARCH_2_06 = 0x00000100,
-    QEMU_PPC_FEATURE_HAS_VSX = 0x00000080,
-    QEMU_PPC_FEATURE_PSERIES_PERFMON_COMPAT = 0x00000040,
-
-    QEMU_PPC_FEATURE_TRUE_LE = 0x00000002,
-    QEMU_PPC_FEATURE_PPC_LE = 0x00000001,
-
-    /* Feature definitions in AT_HWCAP2.  */
-    QEMU_PPC_FEATURE2_ARCH_2_07 = 0x80000000, /* ISA 2.07 */
-    QEMU_PPC_FEATURE2_HAS_HTM = 0x40000000, /* Hardware Transactional Memory */
-    QEMU_PPC_FEATURE2_HAS_DSCR = 0x20000000, /* Data Stream Control Register */
-    QEMU_PPC_FEATURE2_HAS_EBB = 0x10000000, /* Event Base Branching */
-    QEMU_PPC_FEATURE2_HAS_ISEL = 0x08000000, /* Integer Select */
-    QEMU_PPC_FEATURE2_HAS_TAR = 0x04000000, /* Target Address Register */
-    QEMU_PPC_FEATURE2_VEC_CRYPTO = 0x02000000,
-    QEMU_PPC_FEATURE2_HTM_NOSC = 0x01000000,
-    QEMU_PPC_FEATURE2_ARCH_3_00 = 0x00800000, /* ISA 3.00 */
-    QEMU_PPC_FEATURE2_HAS_IEEE128 = 0x00400000, /* VSX IEEE Bin Float 128-bit */
-    QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
-    QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
-    QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
-    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
-    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
-};
-
-#define ELF_HWCAP get_elf_hwcap()
-
-static uint32_t get_elf_hwcap(void)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(thread_cpu);
-    uint32_t features = 0;
-
-    /* We don't have to be terribly complete here; the high points are
-       Altivec/FP/SPE support.  Anything else is just a bonus.  */
-#define GET_FEATURE(flag, feature)                                      \
-    do { if (cpu->env.insns_flags & flag) { features |= feature; } } while (0)
-#define GET_FEATURE2(flags, feature) \
-    do { \
-        if ((cpu->env.insns_flags2 & flags) == flags) { \
-            features |= feature; \
-        } \
-    } while (0)
-    GET_FEATURE(PPC_64B, QEMU_PPC_FEATURE_64);
-    GET_FEATURE(PPC_FLOAT, QEMU_PPC_FEATURE_HAS_FPU);
-    GET_FEATURE(PPC_ALTIVEC, QEMU_PPC_FEATURE_HAS_ALTIVEC);
-    GET_FEATURE(PPC_SPE, QEMU_PPC_FEATURE_HAS_SPE);
-    GET_FEATURE(PPC_SPE_SINGLE, QEMU_PPC_FEATURE_HAS_EFP_SINGLE);
-    GET_FEATURE(PPC_SPE_DOUBLE, QEMU_PPC_FEATURE_HAS_EFP_DOUBLE);
-    GET_FEATURE(PPC_BOOKE, QEMU_PPC_FEATURE_BOOKE);
-    GET_FEATURE(PPC_405_MAC, QEMU_PPC_FEATURE_HAS_4xxMAC);
-    GET_FEATURE2(PPC2_DFP, QEMU_PPC_FEATURE_HAS_DFP);
-    GET_FEATURE2(PPC2_VSX, QEMU_PPC_FEATURE_HAS_VSX);
-    GET_FEATURE2((PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 | PPC2_ATOMIC_ISA206 |
-                  PPC2_FP_CVT_ISA206 | PPC2_FP_TST_ISA206),
-                  QEMU_PPC_FEATURE_ARCH_2_06);
-#undef GET_FEATURE
-#undef GET_FEATURE2
-
-    return features;
-}
-
-#define ELF_HWCAP2 get_elf_hwcap2()
-
-static uint32_t get_elf_hwcap2(void)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(thread_cpu);
-    uint32_t features = 0;
-
-#define GET_FEATURE(flag, feature)                                      \
-    do { if (cpu->env.insns_flags & flag) { features |= feature; } } while (0)
-#define GET_FEATURE2(flag, feature)                                      \
-    do { if (cpu->env.insns_flags2 & flag) { features |= feature; } } while (0)
-
-    GET_FEATURE(PPC_ISEL, QEMU_PPC_FEATURE2_HAS_ISEL);
-    GET_FEATURE2(PPC2_BCTAR_ISA207, QEMU_PPC_FEATURE2_HAS_TAR);
-    GET_FEATURE2((PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
-                  PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
-                  QEMU_PPC_FEATURE2_VEC_CRYPTO);
-    GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
-                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
-    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
-                 QEMU_PPC_FEATURE2_MMA);
-
-#undef GET_FEATURE
-#undef GET_FEATURE2
-
-    return features;
-}
+#define ELF_HWCAP get_elf_hwcap(thread_cpu)
+#define ELF_HWCAP2 get_elf_hwcap2(thread_cpu)
 
 /*
  * The requirements here are:
diff --git a/linux-user/ppc/elfload.c b/linux-user/ppc/elfload.c
index 7775dc06fac..a2146756504 100644
--- a/linux-user/ppc/elfload.c
+++ b/linux-user/ppc/elfload.c
@@ -13,3 +13,119 @@ const char *get_elf_cpu_model(uint32_t eflags)
     return "750";
 #endif
 }
+
+/*
+ * Feature masks for the Aux Vector Hardware Capabilities (AT_HWCAP).
+ * See arch/powerpc/include/asm/cputable.h.
+ */
+enum {
+    QEMU_PPC_FEATURE_32 = 0x80000000,
+    QEMU_PPC_FEATURE_64 = 0x40000000,
+    QEMU_PPC_FEATURE_601_INSTR = 0x20000000,
+    QEMU_PPC_FEATURE_HAS_ALTIVEC = 0x10000000,
+    QEMU_PPC_FEATURE_HAS_FPU = 0x08000000,
+    QEMU_PPC_FEATURE_HAS_MMU = 0x04000000,
+    QEMU_PPC_FEATURE_HAS_4xxMAC = 0x02000000,
+    QEMU_PPC_FEATURE_UNIFIED_CACHE = 0x01000000,
+    QEMU_PPC_FEATURE_HAS_SPE = 0x00800000,
+    QEMU_PPC_FEATURE_HAS_EFP_SINGLE = 0x00400000,
+    QEMU_PPC_FEATURE_HAS_EFP_DOUBLE = 0x00200000,
+    QEMU_PPC_FEATURE_NO_TB = 0x00100000,
+    QEMU_PPC_FEATURE_POWER4 = 0x00080000,
+    QEMU_PPC_FEATURE_POWER5 = 0x00040000,
+    QEMU_PPC_FEATURE_POWER5_PLUS = 0x00020000,
+    QEMU_PPC_FEATURE_CELL = 0x00010000,
+    QEMU_PPC_FEATURE_BOOKE = 0x00008000,
+    QEMU_PPC_FEATURE_SMT = 0x00004000,
+    QEMU_PPC_FEATURE_ICACHE_SNOOP = 0x00002000,
+    QEMU_PPC_FEATURE_ARCH_2_05 = 0x00001000,
+    QEMU_PPC_FEATURE_PA6T = 0x00000800,
+    QEMU_PPC_FEATURE_HAS_DFP = 0x00000400,
+    QEMU_PPC_FEATURE_POWER6_EXT = 0x00000200,
+    QEMU_PPC_FEATURE_ARCH_2_06 = 0x00000100,
+    QEMU_PPC_FEATURE_HAS_VSX = 0x00000080,
+    QEMU_PPC_FEATURE_PSERIES_PERFMON_COMPAT = 0x00000040,
+
+    QEMU_PPC_FEATURE_TRUE_LE = 0x00000002,
+    QEMU_PPC_FEATURE_PPC_LE = 0x00000001,
+
+    /* Feature definitions in AT_HWCAP2.  */
+    QEMU_PPC_FEATURE2_ARCH_2_07 = 0x80000000, /* ISA 2.07 */
+    QEMU_PPC_FEATURE2_HAS_HTM = 0x40000000, /* Hardware Transactional Memory */
+    QEMU_PPC_FEATURE2_HAS_DSCR = 0x20000000, /* Data Stream Control Register */
+    QEMU_PPC_FEATURE2_HAS_EBB = 0x10000000, /* Event Base Branching */
+    QEMU_PPC_FEATURE2_HAS_ISEL = 0x08000000, /* Integer Select */
+    QEMU_PPC_FEATURE2_HAS_TAR = 0x04000000, /* Target Address Register */
+    QEMU_PPC_FEATURE2_VEC_CRYPTO = 0x02000000,
+    QEMU_PPC_FEATURE2_HTM_NOSC = 0x01000000,
+    QEMU_PPC_FEATURE2_ARCH_3_00 = 0x00800000, /* ISA 3.00 */
+    QEMU_PPC_FEATURE2_HAS_IEEE128 = 0x00400000, /* VSX IEEE Bin Float 128-bit */
+    QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
+    QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
+    QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
+    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
+    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
+};
+
+abi_ulong get_elf_hwcap(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    uint32_t features = 0;
+
+    /*
+     * We don't have to be terribly complete here; the high points are
+     * Altivec/FP/SPE support.  Anything else is just a bonus.
+     */
+#define GET_FEATURE(flag, feature)                                      \
+    do { if (cpu->env.insns_flags & flag) { features |= feature; } } while (0)
+#define GET_FEATURE2(flags, feature) \
+    do { \
+        if ((cpu->env.insns_flags2 & flags) == flags) { \
+            features |= feature; \
+        } \
+    } while (0)
+    GET_FEATURE(PPC_64B, QEMU_PPC_FEATURE_64);
+    GET_FEATURE(PPC_FLOAT, QEMU_PPC_FEATURE_HAS_FPU);
+    GET_FEATURE(PPC_ALTIVEC, QEMU_PPC_FEATURE_HAS_ALTIVEC);
+    GET_FEATURE(PPC_SPE, QEMU_PPC_FEATURE_HAS_SPE);
+    GET_FEATURE(PPC_SPE_SINGLE, QEMU_PPC_FEATURE_HAS_EFP_SINGLE);
+    GET_FEATURE(PPC_SPE_DOUBLE, QEMU_PPC_FEATURE_HAS_EFP_DOUBLE);
+    GET_FEATURE(PPC_BOOKE, QEMU_PPC_FEATURE_BOOKE);
+    GET_FEATURE(PPC_405_MAC, QEMU_PPC_FEATURE_HAS_4xxMAC);
+    GET_FEATURE2(PPC2_DFP, QEMU_PPC_FEATURE_HAS_DFP);
+    GET_FEATURE2(PPC2_VSX, QEMU_PPC_FEATURE_HAS_VSX);
+    GET_FEATURE2((PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 | PPC2_ATOMIC_ISA206 |
+                  PPC2_FP_CVT_ISA206 | PPC2_FP_TST_ISA206),
+                  QEMU_PPC_FEATURE_ARCH_2_06);
+
+#undef GET_FEATURE
+#undef GET_FEATURE2
+
+    return features;
+}
+
+abi_ulong get_elf_hwcap2(CPUState *cs)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    uint32_t features = 0;
+
+#define GET_FEATURE(flag, feature)                                      \
+    do { if (cpu->env.insns_flags & flag) { features |= feature; } } while (0)
+#define GET_FEATURE2(flag, feature)                                      \
+    do { if (cpu->env.insns_flags2 & flag) { features |= feature; } } while (0)
+
+    GET_FEATURE(PPC_ISEL, QEMU_PPC_FEATURE2_HAS_ISEL);
+    GET_FEATURE2(PPC2_BCTAR_ISA207, QEMU_PPC_FEATURE2_HAS_TAR);
+    GET_FEATURE2((PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
+                  PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
+                  QEMU_PPC_FEATURE2_VEC_CRYPTO);
+    GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
+                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
+    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
+                 QEMU_PPC_FEATURE2_MMA);
+
+#undef GET_FEATURE
+#undef GET_FEATURE2
+
+    return features;
+}
-- 
2.47.2


