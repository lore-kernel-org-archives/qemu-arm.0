Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AC8CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5Af-0000Gw-JP; Thu, 04 Sep 2025 04:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55T-0006vs-Cp
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:13:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54r-0004H7-FL
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b04770a25f2so102749666b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973526; x=1757578326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YbgiQLabRIDzMbEqEJW5pMy577MNL35xIUV9J9ORiGc=;
 b=WS/eYI27w8ojbHWQpCvWdOVPWGFu3rK6L7tqWO+G0olt6M5QMQPKu06R9Fl51jAr4J
 fXJnFkUioh8wOUvs8CxkA7QbK/Gr2bMaN5oM2xcOxWTQe9CmH/B2goQF3rH3+CxpY8PL
 lAQOHMAYYAWvq3gVgGb6YyJ76PXUjQCXXJZH0pVFHCXV0zSnzEgVO6DNEGQ6mNLPF3Mw
 XgGIfCJe55L/jy9G35L/YFFKHBw1AHdKQrYyO7+Jp4ek5mvVNCYEEA7Q0Yj8qDq5cDs1
 KZ6gmxLpaStOilR6Kmbpigv8Iu0zSu6cA1bGfZ2U790Uqg1+1kGHfcOPE4YDXjldpKsN
 ABhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973526; x=1757578326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YbgiQLabRIDzMbEqEJW5pMy577MNL35xIUV9J9ORiGc=;
 b=nSDE/W7sx9TQbD6Z3r0OlWhUs3k8BRQsBqDhCZ51qQIfvrGp3esmorKB+hhmbdKnU7
 9bcJLgEmlshnNF6i0YjxNb9HdxdFgeCaaX2sKqJsIO8tCFvclmIx+hLcV3H0NmCp3vMv
 KpIsnlCM/mkjf9gsow+fVvJyZTzamnKwNVx2J9JRiMt5jREni4i26RRWbxuM1dVzyEOT
 y734PrwPnT1wACE4QyPuXBX+GUQ8kG+fpkWgJwyouVqKQIkEFxK6Kw5jjws2ae6x3I1Y
 tdazNS7J/UpLnSZDkSwYgXlI/gWDJoG9i8tm/qcyEso+0qB5n9eeB6n51njrhbc7Bd7R
 5hTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC+XF/zSRR4RVoX1LeBZ/gUr9CXR7kB9JqHamgqztiJs5D2/Ew022w2c8eohQ6vvNYdcRAdjMb0Q==@nongnu.org
X-Gm-Message-State: AOJu0YySl/Zyhn5+18fxvJXYoS0j9hOpZkap3g7+z8fxZL6h+4Hxathj
 MwW3PSPsZTq0bjm95xqkY+FDKSIM8idd6xjo+ylDPOo45gXF5HR7Ox/YEukh7pfvDlc=
X-Gm-Gg: ASbGncsni8yNdj0mDPCcr8NbIng9AkhOEbxVf4mI5FOx9s/JYHI29qvijLHEg2L9NG/
 sJZppSmNxMSUL+Ce9feyOVnf6lSl29fzdiAzk3J2PRaHHl3/C3UjmgdZ8AO/ndX10kRexGnuMn4
 4ytpKZQfLJWV06cScJumWsfVqYED+ncrrcxDxlVj6J8iOItPOhJ36YKV6ttpukB//OsPM3DVSev
 l+IplRZi3DoyhQHqqifjH5UrU2FpCCXgS5K6oZcXDvTtqIuXNvEOYqzWvxV78ggjzVx0tHoaqJt
 rDG5vD72RslDpG3vI9nuRhvPE0SUOpGm1OFs/Ye3hEeNLJgSKdjheAIcMKzj+ZEHv9PWtcHLiwl
 /uhN48+1w6JypjjoKkLA98EU5OpXvGy3zHA==
X-Google-Smtp-Source: AGHT+IGvfUUxfZf0n7TZT/tpiPwBLlPK5VHPmndW4xraKK5riVT7vXeP9znOPanhCZ2TZ8Ykjw9z6g==
X-Received: by 2002:a17:907:3d05:b0:b04:5c5b:16b1 with SMTP id
 a640c23a62f3a-b045c5b1dd9mr740404766b.42.1756973526443; 
 Thu, 04 Sep 2025 01:12:06 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042a4b3110sm950782266b.49.2025.09.04.01.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 62F8560761;
 Thu, 04 Sep 2025 09:11:36 +0100 (BST)
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
Subject: [PATCH v2 063/281] linux-user: Remove ELF_HWCAP2
Date: Thu,  4 Sep 2025 09:07:37 +0100
Message-ID: <20250904081128.1942269-64-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

All definitions of ELF_HWCAP2 are now identical.  Provide a
not-reached stub as a fallback definition of get_elf_hwcap2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 88d439f3486..7a41917b49d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -448,8 +448,6 @@ static bool init_guest_commpage(void)
     return true;
 }
 
-#define ELF_HWCAP2 get_elf_hwcap2(thread_cpu)
-
 #define ELF_PLATFORM get_elf_platform()
 
 static const char *get_elf_platform(void)
@@ -537,8 +535,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#define ELF_HWCAP2  get_elf_hwcap2(thread_cpu)
-
 #if TARGET_BIG_ENDIAN
 # define VDSO_HEADER  "vdso-be.c.inc"
 #else
@@ -593,8 +589,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_ARCH        EM_PPC
 
-#define ELF_HWCAP2 get_elf_hwcap2(thread_cpu)
-
 /*
  * The requirements here are:
  * - keep the final alignment of sp (sp & 0xf)
@@ -1279,6 +1273,10 @@ static inline void init_thread(struct target_pt_regs *regs,
 #ifndef HAVE_ELF_HWCAP
 abi_ulong get_elf_hwcap(CPUState *cs) { return 0; }
 #endif
+#ifndef HAVE_ELF_HWCAP2
+abi_ulong get_elf_hwcap2(CPUState *cs) { g_assert_not_reached(); }
+#define HAVE_ELF_HWCAP2 0
+#endif
 
 #include "elf.h"
 
@@ -1801,9 +1799,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #ifdef DLINFO_ARCH_ITEMS
     size += DLINFO_ARCH_ITEMS * 2;
 #endif
-#ifdef ELF_HWCAP2
-    size += 2;
-#endif
+    if (HAVE_ELF_HWCAP2) {
+        size += 2;
+    }
     info->auxv_len = size * n;
 
     size += envc + argc + 2;
@@ -1863,10 +1861,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
     NEW_AUX_ENT(AT_EXECFN, info->file_string);
 
-#ifdef ELF_HWCAP2
-    NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
-#endif
-
+    if (HAVE_ELF_HWCAP2) {
+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
+    }
     if (u_base_platform) {
         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
     }
-- 
2.47.2


