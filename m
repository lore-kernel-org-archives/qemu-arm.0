Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B2BCA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:20:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5Au-0000wu-3O; Thu, 04 Sep 2025 04:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55e-00071y-4W
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:13:06 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54x-0004Il-3q
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:13:03 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b042cc39551so125977166b.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973530; x=1757578330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qB1LJ4UCkTV3I0UmJq3Fm/edHVN6TAIhDOPJraK0el0=;
 b=m2B53mCngRlpeK29Berfl/IYCDbkhUD/jzd3/Vx6GYNzF5otFmP3JerEZc2UkbM5sH
 +jS1Ok57gxrGnyY2R/MGHoYlFCoyDXsphWKd5RmjwP0oKDWGR6pWO60tIK/x0C6MlKO3
 u8SGJjrtSqcyl4GSksihV9dduVUf9mgM3eIXDc5Q7qNr5d2ygItPyfoNmlh9EZLlts1X
 Hg0ZXNrKR5S9FfpF+V7xhBGk85H/iExZZle3doI6ME9Z4HIbb3yGKH/bYyOerjjoMBq2
 HnfnrCV5+YK2eypxjUpYeG5WL+VXSnrKkYfQkvCKZfi3Q1iv5Ot9yAWF5AXjAlwv3w5p
 H6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973530; x=1757578330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qB1LJ4UCkTV3I0UmJq3Fm/edHVN6TAIhDOPJraK0el0=;
 b=KLceO9vblY9EqZxQBKzn1ZS/grjtoXhfDsiI2lfTFucVni/UOAkUGGCjluublfXbuQ
 tNq9mEfMwFifZnIB7frBy9KcDd+CiLVm4LbaTLsZnMT5lQvvxHdb/dcYY94PkxufMKwH
 BwGTf3bc51PZB7hPrVYJqLLbkmzP0AKDd5Er4fpJE9SokN6riHnUrW6UkXu8cUQTeLN4
 LSn5Sjw/WawBEfSHAWamdrk2VtP05WtTHXTc+yPvyLrrSs6aLuOZbqL6d1MiQhVn4nZF
 oebMewpKhS3VTij2mlpKwjT0jgc/jzO3vWWIfhkFEzQ7jFry80ahX3jWG2aUpwTzaoIP
 l6Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUclUooS2FMMYAbmpejb0Sbsk9n1/w13MzdnvlLZrf3+dHjgdlQcDhekJCRX7SlCqLhsTeycWYaSw==@nongnu.org
X-Gm-Message-State: AOJu0YyexzekiO1MpRsGqaZvf88b6xQpUBnOmxDAq5hiVKJ/X+eyjnUt
 Oo6yXlZmpAn7j51Qkmefv+y2xxQz5Ew1PbTPY8FKut5146m06qXZegOpKhSdzlzqTDQ=
X-Gm-Gg: ASbGncuK86FOpgaZTsdOelLDwE+5LVTszwEb6+i7dlK91ZMlzmEckyQxzqjG5y6E3AU
 HvxZ/JBhzcn2iA+lbjRn+y6mVFozWJV5SDt2jPZKl1lxgHqDdVtbaoeY/0TmK5iy1QM8BeZVQ0Z
 MMeE0Agr/hH5tKGMD/4xMnaiatRCAXayL2OtAzz45EI2dMHP1/XJTlA3PSwUlCoGyR/OR2dnAbQ
 12lC1SuyR6yx+lB+V94mgcR3889j7fcun4UbgEyt0HGZcILUoxe2CoAJbZVjbF9Su5OgeE3c3bF
 vEb29tTc0RNYypeZzjupfjY+XF0xmDh1e5lE7TqpL7ZuGCix4F7Il3rVkEtbWU1P9U3PlCviGX8
 BgwnUsnRLmhOFrOuHh9obeLE=
X-Google-Smtp-Source: AGHT+IFCQAVN9LGnZNQM5bw7nsol51E6q256xL9QCGB4xvAhB+biS8GrN0upgpWMZzzxHUXectTPkQ==
X-Received: by 2002:a17:907:9406:b0:b04:3c66:ee5a with SMTP id
 a640c23a62f3a-b043c6703acmr1252865966b.23.1756973522876; 
 Thu, 04 Sep 2025 01:12:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0236d310casm1258249766b.44.2025.09.04.01.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3AE6B601BF;
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
Subject: [PATCH v2 054/281] linux-user: Move hwcap functions to {arm,
 aarch64}/elfload.c
Date: Thu,  4 Sep 2025 09:07:28 +0100
Message-ID: <20250904081128.1942269-55-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

For get_elf_hwcap and get_elf_hwcap2, change the return type to
abi_ulong, and pass in the cpu.  We must do these targets at the
same time because of the ifdef dependency between TARGET_AARCH64
and TARGET_ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_elf.h |   3 +
 linux-user/arm/target_elf.h     |   3 +
 linux-user/arm/target_proc.h    |   4 +-
 linux-user/loader.h             |  10 +-
 linux-user/aarch64/elfload.c    | 333 +++++++++++++++++++++
 linux-user/arm/elfload.c        | 161 ++++++++++
 linux-user/elfload.c            | 505 +-------------------------------
 7 files changed, 510 insertions(+), 509 deletions(-)

diff --git a/linux-user/aarch64/target_elf.h b/linux-user/aarch64/target_elf.h
index d955b3d07f9..77108f3cb0c 100644
--- a/linux-user/aarch64/target_elf.h
+++ b/linux-user/aarch64/target_elf.h
@@ -8,4 +8,7 @@
 #ifndef AARCH64_TARGET_ELF_H
 #define AARCH64_TARGET_ELF_H
 
+#define HAVE_ELF_HWCAP          1
+#define HAVE_ELF_HWCAP2         1
+
 #endif
diff --git a/linux-user/arm/target_elf.h b/linux-user/arm/target_elf.h
index 2abb27a7337..90470bd87b6 100644
--- a/linux-user/arm/target_elf.h
+++ b/linux-user/arm/target_elf.h
@@ -8,4 +8,7 @@
 #ifndef ARM_TARGET_ELF_H
 #define ARM_TARGET_ELF_H
 
+#define HAVE_ELF_HWCAP          1
+#define HAVE_ELF_HWCAP2         1
+
 #endif
diff --git a/linux-user/arm/target_proc.h b/linux-user/arm/target_proc.h
index ac75af9ca64..a4cd6948c60 100644
--- a/linux-user/arm/target_proc.h
+++ b/linux-user/arm/target_proc.h
@@ -10,8 +10,8 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
     ARMCPU *cpu = env_archcpu(cpu_env);
     int arch, midr_rev, midr_part, midr_var, midr_impl;
-    target_ulong elf_hwcap = get_elf_hwcap();
-    target_ulong elf_hwcap2 = get_elf_hwcap2();
+    target_ulong elf_hwcap = get_elf_hwcap(env_cpu(cpu_env));
+    target_ulong elf_hwcap2 = get_elf_hwcap2(env_cpu(cpu_env));
     const char *elf_name;
     int num_cpus, len_part, len_var;
 
diff --git a/linux-user/loader.h b/linux-user/loader.h
index 457bb36daa4..151a06f5db5 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -101,16 +101,14 @@ extern unsigned long guest_stack_size;
 /* Note that Elf32 and Elf64 use uint32_t for e_flags. */
 const char *get_elf_cpu_model(uint32_t eflags);
 
-#if defined(TARGET_I386) || defined(TARGET_X86_64)
+#if defined(TARGET_I386) || defined(TARGET_X86_64) || defined(TARGET_ARM)
 abi_ulong get_elf_hwcap(CPUState *cs);
+abi_ulong get_elf_hwcap2(CPUState *cs);
 #endif
-#if defined(TARGET_S390X) || defined(TARGET_AARCH64) || defined(TARGET_ARM)
+#if defined(TARGET_S390X)
 uint32_t get_elf_hwcap(void);
-const char *elf_hwcap_str(uint32_t bit);
 #endif
-#if defined(TARGET_AARCH64) || defined(TARGET_ARM)
-uint64_t get_elf_hwcap2(void);
+const char *elf_hwcap_str(uint32_t bit);
 const char *elf_hwcap2_str(uint32_t bit);
-#endif
 
 #endif /* LINUX_USER_LOADER_H */
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index b92442dfeb2..92c8ea62c6f 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -3,9 +3,342 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "loader.h"
+#include "target/arm/cpu-features.h"
 
 
 const char *get_elf_cpu_model(uint32_t eflags)
 {
     return "any";
 }
+
+enum {
+    ARM_HWCAP_A64_FP            = 1 << 0,
+    ARM_HWCAP_A64_ASIMD         = 1 << 1,
+    ARM_HWCAP_A64_EVTSTRM       = 1 << 2,
+    ARM_HWCAP_A64_AES           = 1 << 3,
+    ARM_HWCAP_A64_PMULL         = 1 << 4,
+    ARM_HWCAP_A64_SHA1          = 1 << 5,
+    ARM_HWCAP_A64_SHA2          = 1 << 6,
+    ARM_HWCAP_A64_CRC32         = 1 << 7,
+    ARM_HWCAP_A64_ATOMICS       = 1 << 8,
+    ARM_HWCAP_A64_FPHP          = 1 << 9,
+    ARM_HWCAP_A64_ASIMDHP       = 1 << 10,
+    ARM_HWCAP_A64_CPUID         = 1 << 11,
+    ARM_HWCAP_A64_ASIMDRDM      = 1 << 12,
+    ARM_HWCAP_A64_JSCVT         = 1 << 13,
+    ARM_HWCAP_A64_FCMA          = 1 << 14,
+    ARM_HWCAP_A64_LRCPC         = 1 << 15,
+    ARM_HWCAP_A64_DCPOP         = 1 << 16,
+    ARM_HWCAP_A64_SHA3          = 1 << 17,
+    ARM_HWCAP_A64_SM3           = 1 << 18,
+    ARM_HWCAP_A64_SM4           = 1 << 19,
+    ARM_HWCAP_A64_ASIMDDP       = 1 << 20,
+    ARM_HWCAP_A64_SHA512        = 1 << 21,
+    ARM_HWCAP_A64_SVE           = 1 << 22,
+    ARM_HWCAP_A64_ASIMDFHM      = 1 << 23,
+    ARM_HWCAP_A64_DIT           = 1 << 24,
+    ARM_HWCAP_A64_USCAT         = 1 << 25,
+    ARM_HWCAP_A64_ILRCPC        = 1 << 26,
+    ARM_HWCAP_A64_FLAGM         = 1 << 27,
+    ARM_HWCAP_A64_SSBS          = 1 << 28,
+    ARM_HWCAP_A64_SB            = 1 << 29,
+    ARM_HWCAP_A64_PACA          = 1 << 30,
+    ARM_HWCAP_A64_PACG          = 1ULL << 31,
+    ARM_HWCAP_A64_GCS           = 1ULL << 32,
+    ARM_HWCAP_A64_CMPBR         = 1ULL << 33,
+    ARM_HWCAP_A64_FPRCVT        = 1ULL << 34,
+    ARM_HWCAP_A64_F8MM8         = 1ULL << 35,
+    ARM_HWCAP_A64_F8MM4         = 1ULL << 36,
+    ARM_HWCAP_A64_SVE_F16MM     = 1ULL << 37,
+    ARM_HWCAP_A64_SVE_ELTPERM   = 1ULL << 38,
+    ARM_HWCAP_A64_SVE_AES2      = 1ULL << 39,
+    ARM_HWCAP_A64_SVE_BFSCALE   = 1ULL << 40,
+    ARM_HWCAP_A64_SVE2P2        = 1ULL << 41,
+    ARM_HWCAP_A64_SME2P2        = 1ULL << 42,
+    ARM_HWCAP_A64_SME_SBITPERM  = 1ULL << 43,
+    ARM_HWCAP_A64_SME_AES       = 1ULL << 44,
+    ARM_HWCAP_A64_SME_SFEXPA    = 1ULL << 45,
+    ARM_HWCAP_A64_SME_STMOP     = 1ULL << 46,
+    ARM_HWCAP_A64_SME_SMOP4     = 1ULL << 47,
+
+    ARM_HWCAP2_A64_DCPODP       = 1 << 0,
+    ARM_HWCAP2_A64_SVE2         = 1 << 1,
+    ARM_HWCAP2_A64_SVEAES       = 1 << 2,
+    ARM_HWCAP2_A64_SVEPMULL     = 1 << 3,
+    ARM_HWCAP2_A64_SVEBITPERM   = 1 << 4,
+    ARM_HWCAP2_A64_SVESHA3      = 1 << 5,
+    ARM_HWCAP2_A64_SVESM4       = 1 << 6,
+    ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
+    ARM_HWCAP2_A64_FRINT        = 1 << 8,
+    ARM_HWCAP2_A64_SVEI8MM      = 1 << 9,
+    ARM_HWCAP2_A64_SVEF32MM     = 1 << 10,
+    ARM_HWCAP2_A64_SVEF64MM     = 1 << 11,
+    ARM_HWCAP2_A64_SVEBF16      = 1 << 12,
+    ARM_HWCAP2_A64_I8MM         = 1 << 13,
+    ARM_HWCAP2_A64_BF16         = 1 << 14,
+    ARM_HWCAP2_A64_DGH          = 1 << 15,
+    ARM_HWCAP2_A64_RNG          = 1 << 16,
+    ARM_HWCAP2_A64_BTI          = 1 << 17,
+    ARM_HWCAP2_A64_MTE          = 1 << 18,
+    ARM_HWCAP2_A64_ECV          = 1 << 19,
+    ARM_HWCAP2_A64_AFP          = 1 << 20,
+    ARM_HWCAP2_A64_RPRES        = 1 << 21,
+    ARM_HWCAP2_A64_MTE3         = 1 << 22,
+    ARM_HWCAP2_A64_SME          = 1 << 23,
+    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
+    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
+    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
+    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
+    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
+    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
+    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
+    ARM_HWCAP2_A64_WFXT         = 1ULL << 31,
+    ARM_HWCAP2_A64_EBF16        = 1ULL << 32,
+    ARM_HWCAP2_A64_SVE_EBF16    = 1ULL << 33,
+    ARM_HWCAP2_A64_CSSC         = 1ULL << 34,
+    ARM_HWCAP2_A64_RPRFM        = 1ULL << 35,
+    ARM_HWCAP2_A64_SVE2P1       = 1ULL << 36,
+    ARM_HWCAP2_A64_SME2         = 1ULL << 37,
+    ARM_HWCAP2_A64_SME2P1       = 1ULL << 38,
+    ARM_HWCAP2_A64_SME_I16I32   = 1ULL << 39,
+    ARM_HWCAP2_A64_SME_BI32I32  = 1ULL << 40,
+    ARM_HWCAP2_A64_SME_B16B16   = 1ULL << 41,
+    ARM_HWCAP2_A64_SME_F16F16   = 1ULL << 42,
+    ARM_HWCAP2_A64_MOPS         = 1ULL << 43,
+    ARM_HWCAP2_A64_HBC          = 1ULL << 44,
+    ARM_HWCAP2_A64_SVE_B16B16   = 1ULL << 45,
+    ARM_HWCAP2_A64_LRCPC3       = 1ULL << 46,
+    ARM_HWCAP2_A64_LSE128       = 1ULL << 47,
+    ARM_HWCAP2_A64_FPMR         = 1ULL << 48,
+    ARM_HWCAP2_A64_LUT          = 1ULL << 49,
+    ARM_HWCAP2_A64_FAMINMAX     = 1ULL << 50,
+    ARM_HWCAP2_A64_F8CVT        = 1ULL << 51,
+    ARM_HWCAP2_A64_F8FMA        = 1ULL << 52,
+    ARM_HWCAP2_A64_F8DP4        = 1ULL << 53,
+    ARM_HWCAP2_A64_F8DP2        = 1ULL << 54,
+    ARM_HWCAP2_A64_F8E4M3       = 1ULL << 55,
+    ARM_HWCAP2_A64_F8E5M2       = 1ULL << 56,
+    ARM_HWCAP2_A64_SME_LUTV2    = 1ULL << 57,
+    ARM_HWCAP2_A64_SME_F8F16    = 1ULL << 58,
+    ARM_HWCAP2_A64_SME_F8F32    = 1ULL << 59,
+    ARM_HWCAP2_A64_SME_SF8FMA   = 1ULL << 60,
+    ARM_HWCAP2_A64_SME_SF8DP4   = 1ULL << 61,
+    ARM_HWCAP2_A64_SME_SF8DP2   = 1ULL << 62,
+    ARM_HWCAP2_A64_POE          = 1ULL << 63,
+};
+
+#define GET_FEATURE_ID(feat, hwcap) \
+    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
+
+abi_ulong get_elf_hwcap(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    abi_ulong hwcaps = 0;
+
+    hwcaps |= ARM_HWCAP_A64_FP;
+    hwcaps |= ARM_HWCAP_A64_ASIMD;
+    hwcaps |= ARM_HWCAP_A64_CPUID;
+
+    /* probe for the extra features */
+
+    GET_FEATURE_ID(aa64_aes, ARM_HWCAP_A64_AES);
+    GET_FEATURE_ID(aa64_pmull, ARM_HWCAP_A64_PMULL);
+    GET_FEATURE_ID(aa64_sha1, ARM_HWCAP_A64_SHA1);
+    GET_FEATURE_ID(aa64_sha256, ARM_HWCAP_A64_SHA2);
+    GET_FEATURE_ID(aa64_sha512, ARM_HWCAP_A64_SHA512);
+    GET_FEATURE_ID(aa64_crc32, ARM_HWCAP_A64_CRC32);
+    GET_FEATURE_ID(aa64_sha3, ARM_HWCAP_A64_SHA3);
+    GET_FEATURE_ID(aa64_sm3, ARM_HWCAP_A64_SM3);
+    GET_FEATURE_ID(aa64_sm4, ARM_HWCAP_A64_SM4);
+    GET_FEATURE_ID(aa64_fp16, ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
+    GET_FEATURE_ID(aa64_atomics, ARM_HWCAP_A64_ATOMICS);
+    GET_FEATURE_ID(aa64_lse2, ARM_HWCAP_A64_USCAT);
+    GET_FEATURE_ID(aa64_rdm, ARM_HWCAP_A64_ASIMDRDM);
+    GET_FEATURE_ID(aa64_dp, ARM_HWCAP_A64_ASIMDDP);
+    GET_FEATURE_ID(aa64_fcma, ARM_HWCAP_A64_FCMA);
+    GET_FEATURE_ID(aa64_sve, ARM_HWCAP_A64_SVE);
+    GET_FEATURE_ID(aa64_pauth, ARM_HWCAP_A64_PACA | ARM_HWCAP_A64_PACG);
+    GET_FEATURE_ID(aa64_fhm, ARM_HWCAP_A64_ASIMDFHM);
+    GET_FEATURE_ID(aa64_dit, ARM_HWCAP_A64_DIT);
+    GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
+    GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
+    GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
+    GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
+    GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
+    GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+
+    return hwcaps;
+}
+
+abi_ulong get_elf_hwcap2(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    abi_ulong hwcaps = 0;
+
+    GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
+    GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
+    GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_sve_bf16, ARM_HWCAP2_A64_SVEBF16);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
+    GET_FEATURE_ID(aa64_bf16, ARM_HWCAP2_A64_BF16);
+    GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
+    GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
+    GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
+    GET_FEATURE_ID(aa64_mte3, ARM_HWCAP2_A64_MTE3);
+    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
+                              ARM_HWCAP2_A64_SME_F32F32 |
+                              ARM_HWCAP2_A64_SME_B16F32 |
+                              ARM_HWCAP2_A64_SME_F16F32 |
+                              ARM_HWCAP2_A64_SME_I8I32));
+    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
+    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
+    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
+    GET_FEATURE_ID(aa64_hbc, ARM_HWCAP2_A64_HBC);
+    GET_FEATURE_ID(aa64_mops, ARM_HWCAP2_A64_MOPS);
+    GET_FEATURE_ID(aa64_sve2p1, ARM_HWCAP2_A64_SVE2P1);
+    GET_FEATURE_ID(aa64_sme2, (ARM_HWCAP2_A64_SME2 |
+                               ARM_HWCAP2_A64_SME_I16I32 |
+                               ARM_HWCAP2_A64_SME_BI32I32));
+    GET_FEATURE_ID(aa64_sme2p1, ARM_HWCAP2_A64_SME2P1);
+    GET_FEATURE_ID(aa64_sme_b16b16, ARM_HWCAP2_A64_SME_B16B16);
+    GET_FEATURE_ID(aa64_sme_f16f16, ARM_HWCAP2_A64_SME_F16F16);
+    GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
+
+    return hwcaps;
+}
+
+const char *elf_hwcap_str(uint32_t bit)
+{
+    static const char * const hwcap_str[] = {
+    [__builtin_ctz(ARM_HWCAP_A64_FP      )] = "fp",
+    [__builtin_ctz(ARM_HWCAP_A64_ASIMD   )] = "asimd",
+    [__builtin_ctz(ARM_HWCAP_A64_EVTSTRM )] = "evtstrm",
+    [__builtin_ctz(ARM_HWCAP_A64_AES     )] = "aes",
+    [__builtin_ctz(ARM_HWCAP_A64_PMULL   )] = "pmull",
+    [__builtin_ctz(ARM_HWCAP_A64_SHA1    )] = "sha1",
+    [__builtin_ctz(ARM_HWCAP_A64_SHA2    )] = "sha2",
+    [__builtin_ctz(ARM_HWCAP_A64_CRC32   )] = "crc32",
+    [__builtin_ctz(ARM_HWCAP_A64_ATOMICS )] = "atomics",
+    [__builtin_ctz(ARM_HWCAP_A64_FPHP    )] = "fphp",
+    [__builtin_ctz(ARM_HWCAP_A64_ASIMDHP )] = "asimdhp",
+    [__builtin_ctz(ARM_HWCAP_A64_CPUID   )] = "cpuid",
+    [__builtin_ctz(ARM_HWCAP_A64_ASIMDRDM)] = "asimdrdm",
+    [__builtin_ctz(ARM_HWCAP_A64_JSCVT   )] = "jscvt",
+    [__builtin_ctz(ARM_HWCAP_A64_FCMA    )] = "fcma",
+    [__builtin_ctz(ARM_HWCAP_A64_LRCPC   )] = "lrcpc",
+    [__builtin_ctz(ARM_HWCAP_A64_DCPOP   )] = "dcpop",
+    [__builtin_ctz(ARM_HWCAP_A64_SHA3    )] = "sha3",
+    [__builtin_ctz(ARM_HWCAP_A64_SM3     )] = "sm3",
+    [__builtin_ctz(ARM_HWCAP_A64_SM4     )] = "sm4",
+    [__builtin_ctz(ARM_HWCAP_A64_ASIMDDP )] = "asimddp",
+    [__builtin_ctz(ARM_HWCAP_A64_SHA512  )] = "sha512",
+    [__builtin_ctz(ARM_HWCAP_A64_SVE     )] = "sve",
+    [__builtin_ctz(ARM_HWCAP_A64_ASIMDFHM)] = "asimdfhm",
+    [__builtin_ctz(ARM_HWCAP_A64_DIT     )] = "dit",
+    [__builtin_ctz(ARM_HWCAP_A64_USCAT   )] = "uscat",
+    [__builtin_ctz(ARM_HWCAP_A64_ILRCPC  )] = "ilrcpc",
+    [__builtin_ctz(ARM_HWCAP_A64_FLAGM   )] = "flagm",
+    [__builtin_ctz(ARM_HWCAP_A64_SSBS    )] = "ssbs",
+    [__builtin_ctz(ARM_HWCAP_A64_SB      )] = "sb",
+    [__builtin_ctz(ARM_HWCAP_A64_PACA    )] = "paca",
+    [__builtin_ctz(ARM_HWCAP_A64_PACG    )] = "pacg",
+    [__builtin_ctzll(ARM_HWCAP_A64_GCS   )] = "gcs",
+    [__builtin_ctzll(ARM_HWCAP_A64_CMPBR )] = "cmpbr",
+    [__builtin_ctzll(ARM_HWCAP_A64_FPRCVT)] = "fprcvt",
+    [__builtin_ctzll(ARM_HWCAP_A64_F8MM8 )] = "f8mm8",
+    [__builtin_ctzll(ARM_HWCAP_A64_F8MM4 )] = "f8mm4",
+    [__builtin_ctzll(ARM_HWCAP_A64_SVE_F16MM)] = "svef16mm",
+    [__builtin_ctzll(ARM_HWCAP_A64_SVE_ELTPERM)] = "sveeltperm",
+    [__builtin_ctzll(ARM_HWCAP_A64_SVE_AES2)] = "sveaes2",
+    [__builtin_ctzll(ARM_HWCAP_A64_SVE_BFSCALE)] = "svebfscale",
+    [__builtin_ctzll(ARM_HWCAP_A64_SVE2P2)] = "sve2p2",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME2P2)] = "sme2p2",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME_SBITPERM)] = "smesbitperm",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME_AES)] = "smeaes",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME_SFEXPA)] = "smesfexpa",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME_STMOP)] = "smestmop",
+    [__builtin_ctzll(ARM_HWCAP_A64_SME_SMOP4)] = "smesmop4",
+    };
+
+    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
+}
+
+const char *elf_hwcap2_str(uint32_t bit)
+{
+    static const char * const hwcap_str[] = {
+    [__builtin_ctz(ARM_HWCAP2_A64_DCPODP       )] = "dcpodp",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVE2         )] = "sve2",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEAES       )] = "sveaes",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEPMULL     )] = "svepmull",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEBITPERM   )] = "svebitperm",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVESHA3      )] = "svesha3",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVESM4       )] = "svesm4",
+    [__builtin_ctz(ARM_HWCAP2_A64_FLAGM2       )] = "flagm2",
+    [__builtin_ctz(ARM_HWCAP2_A64_FRINT        )] = "frint",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEI8MM      )] = "svei8mm",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEF32MM     )] = "svef32mm",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEF64MM     )] = "svef64mm",
+    [__builtin_ctz(ARM_HWCAP2_A64_SVEBF16      )] = "svebf16",
+    [__builtin_ctz(ARM_HWCAP2_A64_I8MM         )] = "i8mm",
+    [__builtin_ctz(ARM_HWCAP2_A64_BF16         )] = "bf16",
+    [__builtin_ctz(ARM_HWCAP2_A64_DGH          )] = "dgh",
+    [__builtin_ctz(ARM_HWCAP2_A64_RNG          )] = "rng",
+    [__builtin_ctz(ARM_HWCAP2_A64_BTI          )] = "bti",
+    [__builtin_ctz(ARM_HWCAP2_A64_MTE          )] = "mte",
+    [__builtin_ctz(ARM_HWCAP2_A64_ECV          )] = "ecv",
+    [__builtin_ctz(ARM_HWCAP2_A64_AFP          )] = "afp",
+    [__builtin_ctz(ARM_HWCAP2_A64_RPRES        )] = "rpres",
+    [__builtin_ctz(ARM_HWCAP2_A64_MTE3         )] = "mte3",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME          )] = "sme",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_I16I64   )] = "smei16i64",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F64F64   )] = "smef64f64",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_I8I32    )] = "smei8i32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F16F32   )] = "smef16f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_B16F32   )] = "smeb16f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F32F32   )] = "smef32f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_FA64     )] = "smefa64",
+    [__builtin_ctz(ARM_HWCAP2_A64_WFXT         )] = "wfxt",
+    [__builtin_ctzll(ARM_HWCAP2_A64_EBF16      )] = "ebf16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SVE_EBF16  )] = "sveebf16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_CSSC       )] = "cssc",
+    [__builtin_ctzll(ARM_HWCAP2_A64_RPRFM      )] = "rprfm",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SVE2P1     )] = "sve2p1",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME2       )] = "sme2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME2P1     )] = "sme2p1",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_I16I32 )] = "smei16i32",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_BI32I32)] = "smebi32i32",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_B16B16 )] = "smeb16b16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F16F16 )] = "smef16f16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_MOPS       )] = "mops",
+    [__builtin_ctzll(ARM_HWCAP2_A64_HBC        )] = "hbc",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SVE_B16B16 )] = "sveb16b16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_LRCPC3     )] = "lrcpc3",
+    [__builtin_ctzll(ARM_HWCAP2_A64_LSE128     )] = "lse128",
+    [__builtin_ctzll(ARM_HWCAP2_A64_FPMR       )] = "fpmr",
+    [__builtin_ctzll(ARM_HWCAP2_A64_LUT        )] = "lut",
+    [__builtin_ctzll(ARM_HWCAP2_A64_FAMINMAX   )] = "faminmax",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8CVT      )] = "f8cvt",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8FMA      )] = "f8fma",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8DP4      )] = "f8dp4",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8DP2      )] = "f8dp2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8E4M3     )] = "f8e4m3",
+    [__builtin_ctzll(ARM_HWCAP2_A64_F8E5M2     )] = "f8e5m2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_LUTV2  )] = "smelutv2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F8F16  )] = "smef8f16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F8F32  )] = "smef8f32",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_SF8DP4 )] = "smesf8dp4",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_SF8DP2 )] = "smesf8dp2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_POE        )] = "poe",
+    };
+
+    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
+}
diff --git a/linux-user/arm/elfload.c b/linux-user/arm/elfload.c
index b92442dfeb2..c7561b005b4 100644
--- a/linux-user/arm/elfload.c
+++ b/linux-user/arm/elfload.c
@@ -3,9 +3,170 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "loader.h"
+#include "target/arm/cpu-features.h"
 
 
 const char *get_elf_cpu_model(uint32_t eflags)
 {
     return "any";
 }
+
+enum
+{
+    ARM_HWCAP_ARM_SWP       = 1 << 0,
+    ARM_HWCAP_ARM_HALF      = 1 << 1,
+    ARM_HWCAP_ARM_THUMB     = 1 << 2,
+    ARM_HWCAP_ARM_26BIT     = 1 << 3,
+    ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
+    ARM_HWCAP_ARM_FPA       = 1 << 5,
+    ARM_HWCAP_ARM_VFP       = 1 << 6,
+    ARM_HWCAP_ARM_EDSP      = 1 << 7,
+    ARM_HWCAP_ARM_JAVA      = 1 << 8,
+    ARM_HWCAP_ARM_IWMMXT    = 1 << 9,
+    ARM_HWCAP_ARM_CRUNCH    = 1 << 10,
+    ARM_HWCAP_ARM_THUMBEE   = 1 << 11,
+    ARM_HWCAP_ARM_NEON      = 1 << 12,
+    ARM_HWCAP_ARM_VFPv3     = 1 << 13,
+    ARM_HWCAP_ARM_VFPv3D16  = 1 << 14,
+    ARM_HWCAP_ARM_TLS       = 1 << 15,
+    ARM_HWCAP_ARM_VFPv4     = 1 << 16,
+    ARM_HWCAP_ARM_IDIVA     = 1 << 17,
+    ARM_HWCAP_ARM_IDIVT     = 1 << 18,
+    ARM_HWCAP_ARM_VFPD32    = 1 << 19,
+    ARM_HWCAP_ARM_LPAE      = 1 << 20,
+    ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
+    ARM_HWCAP_ARM_FPHP      = 1 << 22,
+    ARM_HWCAP_ARM_ASIMDHP   = 1 << 23,
+    ARM_HWCAP_ARM_ASIMDDP   = 1 << 24,
+    ARM_HWCAP_ARM_ASIMDFHM  = 1 << 25,
+    ARM_HWCAP_ARM_ASIMDBF16 = 1 << 26,
+    ARM_HWCAP_ARM_I8MM      = 1 << 27,
+};
+
+enum {
+    ARM_HWCAP2_ARM_AES      = 1 << 0,
+    ARM_HWCAP2_ARM_PMULL    = 1 << 1,
+    ARM_HWCAP2_ARM_SHA1     = 1 << 2,
+    ARM_HWCAP2_ARM_SHA2     = 1 << 3,
+    ARM_HWCAP2_ARM_CRC32    = 1 << 4,
+    ARM_HWCAP2_ARM_SB       = 1 << 5,
+    ARM_HWCAP2_ARM_SSBS     = 1 << 6,
+};
+
+abi_ulong get_elf_hwcap(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    abi_ulong hwcaps = 0;
+
+    hwcaps |= ARM_HWCAP_ARM_SWP;
+    hwcaps |= ARM_HWCAP_ARM_HALF;
+    hwcaps |= ARM_HWCAP_ARM_THUMB;
+    hwcaps |= ARM_HWCAP_ARM_FAST_MULT;
+
+    /* probe for the extra features */
+#define GET_FEATURE(feat, hwcap) \
+    do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
+
+#define GET_FEATURE_ID(feat, hwcap) \
+    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
+
+    /* EDSP is in v5TE and above, but all our v5 CPUs are v5TE */
+    GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
+    GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
+    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
+    GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
+    GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
+    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
+    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
+    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
+    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
+
+    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
+        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
+        hwcaps |= ARM_HWCAP_ARM_VFPv3;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            hwcaps |= ARM_HWCAP_ARM_VFPD32;
+        } else {
+            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
+        }
+    }
+    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
+    /*
+     * MVFR1.FPHP and .SIMDHP must be in sync, and QEMU uses the same
+     * isar_feature function for both. The kernel reports them as two hwcaps.
+     */
+    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_FPHP);
+    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_ASIMDHP);
+    GET_FEATURE_ID(aa32_dp, ARM_HWCAP_ARM_ASIMDDP);
+    GET_FEATURE_ID(aa32_fhm, ARM_HWCAP_ARM_ASIMDFHM);
+    GET_FEATURE_ID(aa32_bf16, ARM_HWCAP_ARM_ASIMDBF16);
+    GET_FEATURE_ID(aa32_i8mm, ARM_HWCAP_ARM_I8MM);
+
+    return hwcaps;
+}
+
+abi_ulong get_elf_hwcap2(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    abi_ulong hwcaps = 0;
+
+    GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
+    GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
+    GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
+    GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
+    GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
+    GET_FEATURE_ID(aa32_sb, ARM_HWCAP2_ARM_SB);
+    GET_FEATURE_ID(aa32_ssbs, ARM_HWCAP2_ARM_SSBS);
+    return hwcaps;
+}
+
+const char *elf_hwcap_str(uint32_t bit)
+{
+    static const char *hwcap_str[] = {
+    [__builtin_ctz(ARM_HWCAP_ARM_SWP      )] = "swp",
+    [__builtin_ctz(ARM_HWCAP_ARM_HALF     )] = "half",
+    [__builtin_ctz(ARM_HWCAP_ARM_THUMB    )] = "thumb",
+    [__builtin_ctz(ARM_HWCAP_ARM_26BIT    )] = "26bit",
+    [__builtin_ctz(ARM_HWCAP_ARM_FAST_MULT)] = "fast_mult",
+    [__builtin_ctz(ARM_HWCAP_ARM_FPA      )] = "fpa",
+    [__builtin_ctz(ARM_HWCAP_ARM_VFP      )] = "vfp",
+    [__builtin_ctz(ARM_HWCAP_ARM_EDSP     )] = "edsp",
+    [__builtin_ctz(ARM_HWCAP_ARM_JAVA     )] = "java",
+    [__builtin_ctz(ARM_HWCAP_ARM_IWMMXT   )] = "iwmmxt",
+    [__builtin_ctz(ARM_HWCAP_ARM_CRUNCH   )] = "crunch",
+    [__builtin_ctz(ARM_HWCAP_ARM_THUMBEE  )] = "thumbee",
+    [__builtin_ctz(ARM_HWCAP_ARM_NEON     )] = "neon",
+    [__builtin_ctz(ARM_HWCAP_ARM_VFPv3    )] = "vfpv3",
+    [__builtin_ctz(ARM_HWCAP_ARM_VFPv3D16 )] = "vfpv3d16",
+    [__builtin_ctz(ARM_HWCAP_ARM_TLS      )] = "tls",
+    [__builtin_ctz(ARM_HWCAP_ARM_VFPv4    )] = "vfpv4",
+    [__builtin_ctz(ARM_HWCAP_ARM_IDIVA    )] = "idiva",
+    [__builtin_ctz(ARM_HWCAP_ARM_IDIVT    )] = "idivt",
+    [__builtin_ctz(ARM_HWCAP_ARM_VFPD32   )] = "vfpd32",
+    [__builtin_ctz(ARM_HWCAP_ARM_LPAE     )] = "lpae",
+    [__builtin_ctz(ARM_HWCAP_ARM_EVTSTRM  )] = "evtstrm",
+    [__builtin_ctz(ARM_HWCAP_ARM_FPHP     )] = "fphp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDHP  )] = "asimdhp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDDP  )] = "asimddp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDFHM )] = "asimdfhm",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDBF16)] = "asimdbf16",
+    [__builtin_ctz(ARM_HWCAP_ARM_I8MM     )] = "i8mm",
+    };
+
+    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
+}
+
+const char *elf_hwcap2_str(uint32_t bit)
+{
+    static const char *hwcap_str[] = {
+    [__builtin_ctz(ARM_HWCAP2_ARM_AES  )] = "aes",
+    [__builtin_ctz(ARM_HWCAP2_ARM_PMULL)] = "pmull",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SHA1 )] = "sha1",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SHA2 )] = "sha2",
+    [__builtin_ctz(ARM_HWCAP2_ARM_CRC32)] = "crc32",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SB   )] = "sb",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SSBS )] = "ssbs",
+    };
+
+    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
+}
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0c62c249e9f..149d1313c0a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -401,48 +401,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUARMState *en
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-enum
-{
-    ARM_HWCAP_ARM_SWP       = 1 << 0,
-    ARM_HWCAP_ARM_HALF      = 1 << 1,
-    ARM_HWCAP_ARM_THUMB     = 1 << 2,
-    ARM_HWCAP_ARM_26BIT     = 1 << 3,
-    ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
-    ARM_HWCAP_ARM_FPA       = 1 << 5,
-    ARM_HWCAP_ARM_VFP       = 1 << 6,
-    ARM_HWCAP_ARM_EDSP      = 1 << 7,
-    ARM_HWCAP_ARM_JAVA      = 1 << 8,
-    ARM_HWCAP_ARM_IWMMXT    = 1 << 9,
-    ARM_HWCAP_ARM_CRUNCH    = 1 << 10,
-    ARM_HWCAP_ARM_THUMBEE   = 1 << 11,
-    ARM_HWCAP_ARM_NEON      = 1 << 12,
-    ARM_HWCAP_ARM_VFPv3     = 1 << 13,
-    ARM_HWCAP_ARM_VFPv3D16  = 1 << 14,
-    ARM_HWCAP_ARM_TLS       = 1 << 15,
-    ARM_HWCAP_ARM_VFPv4     = 1 << 16,
-    ARM_HWCAP_ARM_IDIVA     = 1 << 17,
-    ARM_HWCAP_ARM_IDIVT     = 1 << 18,
-    ARM_HWCAP_ARM_VFPD32    = 1 << 19,
-    ARM_HWCAP_ARM_LPAE      = 1 << 20,
-    ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
-    ARM_HWCAP_ARM_FPHP      = 1 << 22,
-    ARM_HWCAP_ARM_ASIMDHP   = 1 << 23,
-    ARM_HWCAP_ARM_ASIMDDP   = 1 << 24,
-    ARM_HWCAP_ARM_ASIMDFHM  = 1 << 25,
-    ARM_HWCAP_ARM_ASIMDBF16 = 1 << 26,
-    ARM_HWCAP_ARM_I8MM      = 1 << 27,
-};
-
-enum {
-    ARM_HWCAP2_ARM_AES      = 1 << 0,
-    ARM_HWCAP2_ARM_PMULL    = 1 << 1,
-    ARM_HWCAP2_ARM_SHA1     = 1 << 2,
-    ARM_HWCAP2_ARM_SHA2     = 1 << 3,
-    ARM_HWCAP2_ARM_CRC32    = 1 << 4,
-    ARM_HWCAP2_ARM_SB       = 1 << 5,
-    ARM_HWCAP2_ARM_SSBS     = 1 << 6,
-};
-
 /* The commpage only exists for 32 bit kernels */
 
 #define HI_COMMPAGE (intptr_t)0xffff0f00u
@@ -491,129 +449,8 @@ static bool init_guest_commpage(void)
     return true;
 }
 
-#define ELF_HWCAP get_elf_hwcap()
-#define ELF_HWCAP2 get_elf_hwcap2()
-
-uint32_t get_elf_hwcap(void)
-{
-    ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
-
-    hwcaps |= ARM_HWCAP_ARM_SWP;
-    hwcaps |= ARM_HWCAP_ARM_HALF;
-    hwcaps |= ARM_HWCAP_ARM_THUMB;
-    hwcaps |= ARM_HWCAP_ARM_FAST_MULT;
-
-    /* probe for the extra features */
-#define GET_FEATURE(feat, hwcap) \
-    do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
-
-#define GET_FEATURE_ID(feat, hwcap) \
-    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
-
-    /* EDSP is in v5TE and above, but all our v5 CPUs are v5TE */
-    GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
-    GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
-    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
-    GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
-    GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
-    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
-    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
-    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
-    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
-
-    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
-        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
-        hwcaps |= ARM_HWCAP_ARM_VFPv3;
-        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
-            hwcaps |= ARM_HWCAP_ARM_VFPD32;
-        } else {
-            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
-        }
-    }
-    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
-    /*
-     * MVFR1.FPHP and .SIMDHP must be in sync, and QEMU uses the same
-     * isar_feature function for both. The kernel reports them as two hwcaps.
-     */
-    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_FPHP);
-    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_ASIMDHP);
-    GET_FEATURE_ID(aa32_dp, ARM_HWCAP_ARM_ASIMDDP);
-    GET_FEATURE_ID(aa32_fhm, ARM_HWCAP_ARM_ASIMDFHM);
-    GET_FEATURE_ID(aa32_bf16, ARM_HWCAP_ARM_ASIMDBF16);
-    GET_FEATURE_ID(aa32_i8mm, ARM_HWCAP_ARM_I8MM);
-
-    return hwcaps;
-}
-
-uint64_t get_elf_hwcap2(void)
-{
-    ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint64_t hwcaps = 0;
-
-    GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
-    GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
-    GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
-    GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
-    GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
-    GET_FEATURE_ID(aa32_sb, ARM_HWCAP2_ARM_SB);
-    GET_FEATURE_ID(aa32_ssbs, ARM_HWCAP2_ARM_SSBS);
-    return hwcaps;
-}
-
-const char *elf_hwcap_str(uint32_t bit)
-{
-    static const char *hwcap_str[] = {
-    [__builtin_ctz(ARM_HWCAP_ARM_SWP      )] = "swp",
-    [__builtin_ctz(ARM_HWCAP_ARM_HALF     )] = "half",
-    [__builtin_ctz(ARM_HWCAP_ARM_THUMB    )] = "thumb",
-    [__builtin_ctz(ARM_HWCAP_ARM_26BIT    )] = "26bit",
-    [__builtin_ctz(ARM_HWCAP_ARM_FAST_MULT)] = "fast_mult",
-    [__builtin_ctz(ARM_HWCAP_ARM_FPA      )] = "fpa",
-    [__builtin_ctz(ARM_HWCAP_ARM_VFP      )] = "vfp",
-    [__builtin_ctz(ARM_HWCAP_ARM_EDSP     )] = "edsp",
-    [__builtin_ctz(ARM_HWCAP_ARM_JAVA     )] = "java",
-    [__builtin_ctz(ARM_HWCAP_ARM_IWMMXT   )] = "iwmmxt",
-    [__builtin_ctz(ARM_HWCAP_ARM_CRUNCH   )] = "crunch",
-    [__builtin_ctz(ARM_HWCAP_ARM_THUMBEE  )] = "thumbee",
-    [__builtin_ctz(ARM_HWCAP_ARM_NEON     )] = "neon",
-    [__builtin_ctz(ARM_HWCAP_ARM_VFPv3    )] = "vfpv3",
-    [__builtin_ctz(ARM_HWCAP_ARM_VFPv3D16 )] = "vfpv3d16",
-    [__builtin_ctz(ARM_HWCAP_ARM_TLS      )] = "tls",
-    [__builtin_ctz(ARM_HWCAP_ARM_VFPv4    )] = "vfpv4",
-    [__builtin_ctz(ARM_HWCAP_ARM_IDIVA    )] = "idiva",
-    [__builtin_ctz(ARM_HWCAP_ARM_IDIVT    )] = "idivt",
-    [__builtin_ctz(ARM_HWCAP_ARM_VFPD32   )] = "vfpd32",
-    [__builtin_ctz(ARM_HWCAP_ARM_LPAE     )] = "lpae",
-    [__builtin_ctz(ARM_HWCAP_ARM_EVTSTRM  )] = "evtstrm",
-    [__builtin_ctz(ARM_HWCAP_ARM_FPHP     )] = "fphp",
-    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDHP  )] = "asimdhp",
-    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDDP  )] = "asimddp",
-    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDFHM )] = "asimdfhm",
-    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDBF16)] = "asimdbf16",
-    [__builtin_ctz(ARM_HWCAP_ARM_I8MM     )] = "i8mm",
-    };
-
-    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-}
-
-const char *elf_hwcap2_str(uint32_t bit)
-{
-    static const char *hwcap_str[] = {
-    [__builtin_ctz(ARM_HWCAP2_ARM_AES  )] = "aes",
-    [__builtin_ctz(ARM_HWCAP2_ARM_PMULL)] = "pmull",
-    [__builtin_ctz(ARM_HWCAP2_ARM_SHA1 )] = "sha1",
-    [__builtin_ctz(ARM_HWCAP2_ARM_SHA2 )] = "sha2",
-    [__builtin_ctz(ARM_HWCAP2_ARM_CRC32)] = "crc32",
-    [__builtin_ctz(ARM_HWCAP2_ARM_SB   )] = "sb",
-    [__builtin_ctz(ARM_HWCAP2_ARM_SSBS )] = "ssbs",
-    };
-
-    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-}
-
-#undef GET_FEATURE
-#undef GET_FEATURE_ID
+#define ELF_HWCAP get_elf_hwcap(thread_cpu)
+#define ELF_HWCAP2 get_elf_hwcap2(thread_cpu)
 
 #define ELF_PLATFORM get_elf_platform()
 
@@ -702,342 +539,8 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-enum {
-    ARM_HWCAP_A64_FP            = 1 << 0,
-    ARM_HWCAP_A64_ASIMD         = 1 << 1,
-    ARM_HWCAP_A64_EVTSTRM       = 1 << 2,
-    ARM_HWCAP_A64_AES           = 1 << 3,
-    ARM_HWCAP_A64_PMULL         = 1 << 4,
-    ARM_HWCAP_A64_SHA1          = 1 << 5,
-    ARM_HWCAP_A64_SHA2          = 1 << 6,
-    ARM_HWCAP_A64_CRC32         = 1 << 7,
-    ARM_HWCAP_A64_ATOMICS       = 1 << 8,
-    ARM_HWCAP_A64_FPHP          = 1 << 9,
-    ARM_HWCAP_A64_ASIMDHP       = 1 << 10,
-    ARM_HWCAP_A64_CPUID         = 1 << 11,
-    ARM_HWCAP_A64_ASIMDRDM      = 1 << 12,
-    ARM_HWCAP_A64_JSCVT         = 1 << 13,
-    ARM_HWCAP_A64_FCMA          = 1 << 14,
-    ARM_HWCAP_A64_LRCPC         = 1 << 15,
-    ARM_HWCAP_A64_DCPOP         = 1 << 16,
-    ARM_HWCAP_A64_SHA3          = 1 << 17,
-    ARM_HWCAP_A64_SM3           = 1 << 18,
-    ARM_HWCAP_A64_SM4           = 1 << 19,
-    ARM_HWCAP_A64_ASIMDDP       = 1 << 20,
-    ARM_HWCAP_A64_SHA512        = 1 << 21,
-    ARM_HWCAP_A64_SVE           = 1 << 22,
-    ARM_HWCAP_A64_ASIMDFHM      = 1 << 23,
-    ARM_HWCAP_A64_DIT           = 1 << 24,
-    ARM_HWCAP_A64_USCAT         = 1 << 25,
-    ARM_HWCAP_A64_ILRCPC        = 1 << 26,
-    ARM_HWCAP_A64_FLAGM         = 1 << 27,
-    ARM_HWCAP_A64_SSBS          = 1 << 28,
-    ARM_HWCAP_A64_SB            = 1 << 29,
-    ARM_HWCAP_A64_PACA          = 1 << 30,
-    ARM_HWCAP_A64_PACG          = 1ULL << 31,
-    ARM_HWCAP_A64_GCS           = 1ULL << 32,
-    ARM_HWCAP_A64_CMPBR         = 1ULL << 33,
-    ARM_HWCAP_A64_FPRCVT        = 1ULL << 34,
-    ARM_HWCAP_A64_F8MM8         = 1ULL << 35,
-    ARM_HWCAP_A64_F8MM4         = 1ULL << 36,
-    ARM_HWCAP_A64_SVE_F16MM     = 1ULL << 37,
-    ARM_HWCAP_A64_SVE_ELTPERM   = 1ULL << 38,
-    ARM_HWCAP_A64_SVE_AES2      = 1ULL << 39,
-    ARM_HWCAP_A64_SVE_BFSCALE   = 1ULL << 40,
-    ARM_HWCAP_A64_SVE2P2        = 1ULL << 41,
-    ARM_HWCAP_A64_SME2P2        = 1ULL << 42,
-    ARM_HWCAP_A64_SME_SBITPERM  = 1ULL << 43,
-    ARM_HWCAP_A64_SME_AES       = 1ULL << 44,
-    ARM_HWCAP_A64_SME_SFEXPA    = 1ULL << 45,
-    ARM_HWCAP_A64_SME_STMOP     = 1ULL << 46,
-    ARM_HWCAP_A64_SME_SMOP4     = 1ULL << 47,
-
-    ARM_HWCAP2_A64_DCPODP       = 1 << 0,
-    ARM_HWCAP2_A64_SVE2         = 1 << 1,
-    ARM_HWCAP2_A64_SVEAES       = 1 << 2,
-    ARM_HWCAP2_A64_SVEPMULL     = 1 << 3,
-    ARM_HWCAP2_A64_SVEBITPERM   = 1 << 4,
-    ARM_HWCAP2_A64_SVESHA3      = 1 << 5,
-    ARM_HWCAP2_A64_SVESM4       = 1 << 6,
-    ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
-    ARM_HWCAP2_A64_FRINT        = 1 << 8,
-    ARM_HWCAP2_A64_SVEI8MM      = 1 << 9,
-    ARM_HWCAP2_A64_SVEF32MM     = 1 << 10,
-    ARM_HWCAP2_A64_SVEF64MM     = 1 << 11,
-    ARM_HWCAP2_A64_SVEBF16      = 1 << 12,
-    ARM_HWCAP2_A64_I8MM         = 1 << 13,
-    ARM_HWCAP2_A64_BF16         = 1 << 14,
-    ARM_HWCAP2_A64_DGH          = 1 << 15,
-    ARM_HWCAP2_A64_RNG          = 1 << 16,
-    ARM_HWCAP2_A64_BTI          = 1 << 17,
-    ARM_HWCAP2_A64_MTE          = 1 << 18,
-    ARM_HWCAP2_A64_ECV          = 1 << 19,
-    ARM_HWCAP2_A64_AFP          = 1 << 20,
-    ARM_HWCAP2_A64_RPRES        = 1 << 21,
-    ARM_HWCAP2_A64_MTE3         = 1 << 22,
-    ARM_HWCAP2_A64_SME          = 1 << 23,
-    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
-    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
-    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
-    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
-    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
-    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
-    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
-    ARM_HWCAP2_A64_WFXT         = 1ULL << 31,
-    ARM_HWCAP2_A64_EBF16        = 1ULL << 32,
-    ARM_HWCAP2_A64_SVE_EBF16    = 1ULL << 33,
-    ARM_HWCAP2_A64_CSSC         = 1ULL << 34,
-    ARM_HWCAP2_A64_RPRFM        = 1ULL << 35,
-    ARM_HWCAP2_A64_SVE2P1       = 1ULL << 36,
-    ARM_HWCAP2_A64_SME2         = 1ULL << 37,
-    ARM_HWCAP2_A64_SME2P1       = 1ULL << 38,
-    ARM_HWCAP2_A64_SME_I16I32   = 1ULL << 39,
-    ARM_HWCAP2_A64_SME_BI32I32  = 1ULL << 40,
-    ARM_HWCAP2_A64_SME_B16B16   = 1ULL << 41,
-    ARM_HWCAP2_A64_SME_F16F16   = 1ULL << 42,
-    ARM_HWCAP2_A64_MOPS         = 1ULL << 43,
-    ARM_HWCAP2_A64_HBC          = 1ULL << 44,
-    ARM_HWCAP2_A64_SVE_B16B16   = 1ULL << 45,
-    ARM_HWCAP2_A64_LRCPC3       = 1ULL << 46,
-    ARM_HWCAP2_A64_LSE128       = 1ULL << 47,
-    ARM_HWCAP2_A64_FPMR         = 1ULL << 48,
-    ARM_HWCAP2_A64_LUT          = 1ULL << 49,
-    ARM_HWCAP2_A64_FAMINMAX     = 1ULL << 50,
-    ARM_HWCAP2_A64_F8CVT        = 1ULL << 51,
-    ARM_HWCAP2_A64_F8FMA        = 1ULL << 52,
-    ARM_HWCAP2_A64_F8DP4        = 1ULL << 53,
-    ARM_HWCAP2_A64_F8DP2        = 1ULL << 54,
-    ARM_HWCAP2_A64_F8E4M3       = 1ULL << 55,
-    ARM_HWCAP2_A64_F8E5M2       = 1ULL << 56,
-    ARM_HWCAP2_A64_SME_LUTV2    = 1ULL << 57,
-    ARM_HWCAP2_A64_SME_F8F16    = 1ULL << 58,
-    ARM_HWCAP2_A64_SME_F8F32    = 1ULL << 59,
-    ARM_HWCAP2_A64_SME_SF8FMA   = 1ULL << 60,
-    ARM_HWCAP2_A64_SME_SF8DP4   = 1ULL << 61,
-    ARM_HWCAP2_A64_SME_SF8DP2   = 1ULL << 62,
-    ARM_HWCAP2_A64_POE          = 1ULL << 63,
-};
-
-#define ELF_HWCAP   get_elf_hwcap()
-#define ELF_HWCAP2  get_elf_hwcap2()
-
-#define GET_FEATURE_ID(feat, hwcap) \
-    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
-
-uint32_t get_elf_hwcap(void)
-{
-    ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
-
-    hwcaps |= ARM_HWCAP_A64_FP;
-    hwcaps |= ARM_HWCAP_A64_ASIMD;
-    hwcaps |= ARM_HWCAP_A64_CPUID;
-
-    /* probe for the extra features */
-
-    GET_FEATURE_ID(aa64_aes, ARM_HWCAP_A64_AES);
-    GET_FEATURE_ID(aa64_pmull, ARM_HWCAP_A64_PMULL);
-    GET_FEATURE_ID(aa64_sha1, ARM_HWCAP_A64_SHA1);
-    GET_FEATURE_ID(aa64_sha256, ARM_HWCAP_A64_SHA2);
-    GET_FEATURE_ID(aa64_sha512, ARM_HWCAP_A64_SHA512);
-    GET_FEATURE_ID(aa64_crc32, ARM_HWCAP_A64_CRC32);
-    GET_FEATURE_ID(aa64_sha3, ARM_HWCAP_A64_SHA3);
-    GET_FEATURE_ID(aa64_sm3, ARM_HWCAP_A64_SM3);
-    GET_FEATURE_ID(aa64_sm4, ARM_HWCAP_A64_SM4);
-    GET_FEATURE_ID(aa64_fp16, ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
-    GET_FEATURE_ID(aa64_atomics, ARM_HWCAP_A64_ATOMICS);
-    GET_FEATURE_ID(aa64_lse2, ARM_HWCAP_A64_USCAT);
-    GET_FEATURE_ID(aa64_rdm, ARM_HWCAP_A64_ASIMDRDM);
-    GET_FEATURE_ID(aa64_dp, ARM_HWCAP_A64_ASIMDDP);
-    GET_FEATURE_ID(aa64_fcma, ARM_HWCAP_A64_FCMA);
-    GET_FEATURE_ID(aa64_sve, ARM_HWCAP_A64_SVE);
-    GET_FEATURE_ID(aa64_pauth, ARM_HWCAP_A64_PACA | ARM_HWCAP_A64_PACG);
-    GET_FEATURE_ID(aa64_fhm, ARM_HWCAP_A64_ASIMDFHM);
-    GET_FEATURE_ID(aa64_dit, ARM_HWCAP_A64_DIT);
-    GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
-    GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
-    GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
-    GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
-    GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
-    GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
-
-    return hwcaps;
-}
-
-uint64_t get_elf_hwcap2(void)
-{
-    ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint64_t hwcaps = 0;
-
-    GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
-    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
-    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
-    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
-    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
-    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
-    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
-    GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
-    GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
-    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
-    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
-    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
-    GET_FEATURE_ID(aa64_sve_bf16, ARM_HWCAP2_A64_SVEBF16);
-    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
-    GET_FEATURE_ID(aa64_bf16, ARM_HWCAP2_A64_BF16);
-    GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
-    GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
-    GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-    GET_FEATURE_ID(aa64_mte3, ARM_HWCAP2_A64_MTE3);
-    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
-                              ARM_HWCAP2_A64_SME_F32F32 |
-                              ARM_HWCAP2_A64_SME_B16F32 |
-                              ARM_HWCAP2_A64_SME_F16F32 |
-                              ARM_HWCAP2_A64_SME_I8I32));
-    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
-    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
-    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
-    GET_FEATURE_ID(aa64_hbc, ARM_HWCAP2_A64_HBC);
-    GET_FEATURE_ID(aa64_mops, ARM_HWCAP2_A64_MOPS);
-    GET_FEATURE_ID(aa64_sve2p1, ARM_HWCAP2_A64_SVE2P1);
-    GET_FEATURE_ID(aa64_sme2, (ARM_HWCAP2_A64_SME2 |
-                               ARM_HWCAP2_A64_SME_I16I32 |
-                               ARM_HWCAP2_A64_SME_BI32I32));
-    GET_FEATURE_ID(aa64_sme2p1, ARM_HWCAP2_A64_SME2P1);
-    GET_FEATURE_ID(aa64_sme_b16b16, ARM_HWCAP2_A64_SME_B16B16);
-    GET_FEATURE_ID(aa64_sme_f16f16, ARM_HWCAP2_A64_SME_F16F16);
-    GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
-
-    return hwcaps;
-}
-
-const char *elf_hwcap_str(uint32_t bit)
-{
-    static const char * const hwcap_str[] = {
-    [__builtin_ctz(ARM_HWCAP_A64_FP      )] = "fp",
-    [__builtin_ctz(ARM_HWCAP_A64_ASIMD   )] = "asimd",
-    [__builtin_ctz(ARM_HWCAP_A64_EVTSTRM )] = "evtstrm",
-    [__builtin_ctz(ARM_HWCAP_A64_AES     )] = "aes",
-    [__builtin_ctz(ARM_HWCAP_A64_PMULL   )] = "pmull",
-    [__builtin_ctz(ARM_HWCAP_A64_SHA1    )] = "sha1",
-    [__builtin_ctz(ARM_HWCAP_A64_SHA2    )] = "sha2",
-    [__builtin_ctz(ARM_HWCAP_A64_CRC32   )] = "crc32",
-    [__builtin_ctz(ARM_HWCAP_A64_ATOMICS )] = "atomics",
-    [__builtin_ctz(ARM_HWCAP_A64_FPHP    )] = "fphp",
-    [__builtin_ctz(ARM_HWCAP_A64_ASIMDHP )] = "asimdhp",
-    [__builtin_ctz(ARM_HWCAP_A64_CPUID   )] = "cpuid",
-    [__builtin_ctz(ARM_HWCAP_A64_ASIMDRDM)] = "asimdrdm",
-    [__builtin_ctz(ARM_HWCAP_A64_JSCVT   )] = "jscvt",
-    [__builtin_ctz(ARM_HWCAP_A64_FCMA    )] = "fcma",
-    [__builtin_ctz(ARM_HWCAP_A64_LRCPC   )] = "lrcpc",
-    [__builtin_ctz(ARM_HWCAP_A64_DCPOP   )] = "dcpop",
-    [__builtin_ctz(ARM_HWCAP_A64_SHA3    )] = "sha3",
-    [__builtin_ctz(ARM_HWCAP_A64_SM3     )] = "sm3",
-    [__builtin_ctz(ARM_HWCAP_A64_SM4     )] = "sm4",
-    [__builtin_ctz(ARM_HWCAP_A64_ASIMDDP )] = "asimddp",
-    [__builtin_ctz(ARM_HWCAP_A64_SHA512  )] = "sha512",
-    [__builtin_ctz(ARM_HWCAP_A64_SVE     )] = "sve",
-    [__builtin_ctz(ARM_HWCAP_A64_ASIMDFHM)] = "asimdfhm",
-    [__builtin_ctz(ARM_HWCAP_A64_DIT     )] = "dit",
-    [__builtin_ctz(ARM_HWCAP_A64_USCAT   )] = "uscat",
-    [__builtin_ctz(ARM_HWCAP_A64_ILRCPC  )] = "ilrcpc",
-    [__builtin_ctz(ARM_HWCAP_A64_FLAGM   )] = "flagm",
-    [__builtin_ctz(ARM_HWCAP_A64_SSBS    )] = "ssbs",
-    [__builtin_ctz(ARM_HWCAP_A64_SB      )] = "sb",
-    [__builtin_ctz(ARM_HWCAP_A64_PACA    )] = "paca",
-    [__builtin_ctz(ARM_HWCAP_A64_PACG    )] = "pacg",
-    [__builtin_ctzll(ARM_HWCAP_A64_GCS   )] = "gcs",
-    [__builtin_ctzll(ARM_HWCAP_A64_CMPBR )] = "cmpbr",
-    [__builtin_ctzll(ARM_HWCAP_A64_FPRCVT)] = "fprcvt",
-    [__builtin_ctzll(ARM_HWCAP_A64_F8MM8 )] = "f8mm8",
-    [__builtin_ctzll(ARM_HWCAP_A64_F8MM4 )] = "f8mm4",
-    [__builtin_ctzll(ARM_HWCAP_A64_SVE_F16MM)] = "svef16mm",
-    [__builtin_ctzll(ARM_HWCAP_A64_SVE_ELTPERM)] = "sveeltperm",
-    [__builtin_ctzll(ARM_HWCAP_A64_SVE_AES2)] = "sveaes2",
-    [__builtin_ctzll(ARM_HWCAP_A64_SVE_BFSCALE)] = "svebfscale",
-    [__builtin_ctzll(ARM_HWCAP_A64_SVE2P2)] = "sve2p2",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME2P2)] = "sme2p2",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME_SBITPERM)] = "smesbitperm",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME_AES)] = "smeaes",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME_SFEXPA)] = "smesfexpa",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME_STMOP)] = "smestmop",
-    [__builtin_ctzll(ARM_HWCAP_A64_SME_SMOP4)] = "smesmop4",
-    };
-
-    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-}
-
-const char *elf_hwcap2_str(uint32_t bit)
-{
-    static const char * const hwcap_str[] = {
-    [__builtin_ctz(ARM_HWCAP2_A64_DCPODP       )] = "dcpodp",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVE2         )] = "sve2",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEAES       )] = "sveaes",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEPMULL     )] = "svepmull",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEBITPERM   )] = "svebitperm",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVESHA3      )] = "svesha3",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVESM4       )] = "svesm4",
-    [__builtin_ctz(ARM_HWCAP2_A64_FLAGM2       )] = "flagm2",
-    [__builtin_ctz(ARM_HWCAP2_A64_FRINT        )] = "frint",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEI8MM      )] = "svei8mm",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEF32MM     )] = "svef32mm",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEF64MM     )] = "svef64mm",
-    [__builtin_ctz(ARM_HWCAP2_A64_SVEBF16      )] = "svebf16",
-    [__builtin_ctz(ARM_HWCAP2_A64_I8MM         )] = "i8mm",
-    [__builtin_ctz(ARM_HWCAP2_A64_BF16         )] = "bf16",
-    [__builtin_ctz(ARM_HWCAP2_A64_DGH          )] = "dgh",
-    [__builtin_ctz(ARM_HWCAP2_A64_RNG          )] = "rng",
-    [__builtin_ctz(ARM_HWCAP2_A64_BTI          )] = "bti",
-    [__builtin_ctz(ARM_HWCAP2_A64_MTE          )] = "mte",
-    [__builtin_ctz(ARM_HWCAP2_A64_ECV          )] = "ecv",
-    [__builtin_ctz(ARM_HWCAP2_A64_AFP          )] = "afp",
-    [__builtin_ctz(ARM_HWCAP2_A64_RPRES        )] = "rpres",
-    [__builtin_ctz(ARM_HWCAP2_A64_MTE3         )] = "mte3",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME          )] = "sme",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_I16I64   )] = "smei16i64",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F64F64   )] = "smef64f64",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_I8I32    )] = "smei8i32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F16F32   )] = "smef16f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_B16F32   )] = "smeb16f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F32F32   )] = "smef32f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_FA64     )] = "smefa64",
-    [__builtin_ctz(ARM_HWCAP2_A64_WFXT         )] = "wfxt",
-    [__builtin_ctzll(ARM_HWCAP2_A64_EBF16      )] = "ebf16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SVE_EBF16  )] = "sveebf16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_CSSC       )] = "cssc",
-    [__builtin_ctzll(ARM_HWCAP2_A64_RPRFM      )] = "rprfm",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SVE2P1     )] = "sve2p1",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME2       )] = "sme2",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME2P1     )] = "sme2p1",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_I16I32 )] = "smei16i32",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_BI32I32)] = "smebi32i32",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_B16B16 )] = "smeb16b16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F16F16 )] = "smef16f16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_MOPS       )] = "mops",
-    [__builtin_ctzll(ARM_HWCAP2_A64_HBC        )] = "hbc",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SVE_B16B16 )] = "sveb16b16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_LRCPC3     )] = "lrcpc3",
-    [__builtin_ctzll(ARM_HWCAP2_A64_LSE128     )] = "lse128",
-    [__builtin_ctzll(ARM_HWCAP2_A64_FPMR       )] = "fpmr",
-    [__builtin_ctzll(ARM_HWCAP2_A64_LUT        )] = "lut",
-    [__builtin_ctzll(ARM_HWCAP2_A64_FAMINMAX   )] = "faminmax",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8CVT      )] = "f8cvt",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8FMA      )] = "f8fma",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8DP4      )] = "f8dp4",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8DP2      )] = "f8dp2",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8E4M3     )] = "f8e4m3",
-    [__builtin_ctzll(ARM_HWCAP2_A64_F8E5M2     )] = "f8e5m2",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_LUTV2  )] = "smelutv2",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F8F16  )] = "smef8f16",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F8F32  )] = "smef8f32",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_SF8DP4 )] = "smesf8dp4",
-    [__builtin_ctzll(ARM_HWCAP2_A64_SME_SF8DP2 )] = "smesf8dp2",
-    [__builtin_ctzll(ARM_HWCAP2_A64_POE        )] = "poe",
-    };
-
-    return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-}
-
-#undef GET_FEATURE_ID
+#define ELF_HWCAP   get_elf_hwcap(thread_cpu)
+#define ELF_HWCAP2  get_elf_hwcap2(thread_cpu)
 
 #if TARGET_BIG_ENDIAN
 # define VDSO_HEADER  "vdso-be.c.inc"
-- 
2.47.2


