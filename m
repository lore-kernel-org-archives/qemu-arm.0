Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0130CA101C
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:23:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5Cu-0004Tm-Cu; Thu, 04 Sep 2025 04:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5BW-0001ih-KJ
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:19:20 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5B7-0008Ge-OA
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:19:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b042cc3954fso130401466b.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973922; x=1757578722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Qo9EKDwE3/n/WLrIsObXlhp0emB+zNEnQk4ZCSW4aE=;
 b=yiB5+DZmnFFyDSLVh1FJEJl91Gef9cIi2oimXpGRtFY+eWivuqzfeDsRtnz9+E9KEb
 C98WVC/XuzybnUDH9Po9QM4ZvJY6HRzywEBGsbBVuK4gSWCyrKGqNUeDD3GMS/bZvQOK
 LPJnsDZD3M5515jvvRjaTkagqJG/8y0ZPzrcYrESGVq3f0Oh/AowANqc9Zq0IA5vLCUl
 nU9Wr6QYghkfMo+K8ye3x68MIxu/1uC9ikkRLchXsc9K0hG12fCgTIpQUALxRfzMjopR
 tnIeSAT/twOaPmeSOm7+M5KzuthyqeNxDX9SrANcGWBva8lqEWfxvDs/KbnCVOUOKedg
 qHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973922; x=1757578722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Qo9EKDwE3/n/WLrIsObXlhp0emB+zNEnQk4ZCSW4aE=;
 b=Wf7ekCBdvPQf3mmYS/N0yxBUM8Ezl5kYLcZdsD8aCkEbi6B08K+nlj3whyaolGcpY2
 Hs8eIhhgr+WBjkJ5ZeZLWlETrzIcVJ6xHDXtv8lj6ASPZ3wHEeJbNrIhg9LUFwVHpv/5
 COwtptIebVbSHAYMe3WiCiwGWaS2R0bzXubokXgb9/n8pliKnEZz5FboNLMDNs4YfNuP
 JrgK/3NPbkuKWMLEQKcL/wS+LMsdBkFVroHM+OgE9OQ25usk46HmpTphMrw7cv8gCtOT
 Fqpnv/jjpUQAARl5TM6GEp0PpB8M2gicuEabnRxiN4cCXjIuysvb9lfUtXWo+J6hBSeW
 q93g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk81JLxoUEq56evCJiCo4uS2XeOl5c7cH1g9FGCSDKxCO6zIT0ZcRCXQabOQKkreCVrkxuz2zjog==@nongnu.org
X-Gm-Message-State: AOJu0YwLwFBJuCsuZ+jhUg7ebAsDlp2vb5T8scJnZykouZ+qy3lIoVjW
 GQHnkZ2spRdFY+Wt/wARQN9bjvss1xzvXXXW/BLUFYtk1j6HhDTCh4dkLCX+7I8DTIM=
X-Gm-Gg: ASbGncuDaXtIx0QITJoA5UK9cqMWQThwSwZmN2HGtTaX3KCI++1ghBfACqoCIk9Dv3M
 pWJedvq9rmiU003owXXLCJ+MTkKbXWHFAi/49HpKPaW+g1PV02jFclYEhB1PbQxZj8JPjCPmLYN
 laqKok3bNcZ85HOFGM9FjcDQ/lxkekFyyGL7r9HA4Gn8dKPjWJHPrIEIgn7w2r5klY9yB4E9W3c
 4jxMJRHeTCa4xRwc5yGIZmlfQm5Wfm9W8rjbZNrNxhxWSjYeeoruvIN2tQNe3S4Vp+Cx5jBESxV
 lv9bdY3xK2TFxQZXk7gTwJSUHxwUnqnstLEgt/mzg3RmGkmZ8ZBZcm05mx1OgJ8cwAXwvwK/oQN
 ankMfBPE4BlYgOOTxzysFtf0aMvl21Z019A==
X-Google-Smtp-Source: AGHT+IGNIw8x12T3kV5HeuqvSQZLYGWD/SvTF/7vxoljfIBwghouYc0bdrfcF5N9QpMp6FebGIZl1w==
X-Received: by 2002:a17:907:968c:b0:b04:36e3:c077 with SMTP id
 a640c23a62f3a-b0436e3c5c7mr1130574266b.22.1756973922307; 
 Thu, 04 Sep 2025 01:18:42 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b045e576edbsm487971366b.75.2025.09.04.01.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:18:37 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2C5BA60A38;
 Thu, 04 Sep 2025 09:11:37 +0100 (BST)
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
Subject: [PATCH v2 069/281] linux-user: Remove ELF_PLATFORM
Date: Thu,  4 Sep 2025 09:07:43 +0100
Message-ID: <20250904081128.1942269-70-alex.bennee@linaro.org>
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

All real definitions of ELF_PLATFORM are now identical, and the stub
definitions are NULL.  Use HAVE_ELF_PLATFORM and provide a stub as a
fallback definition of get_elf_platform.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 83cb6731ec8..d2d73b06fc0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -149,8 +149,6 @@ typedef abi_int         target_pid_t;
 
 #ifdef TARGET_I386
 
-#define ELF_PLATFORM get_elf_platform(thread_cpu)
-
 #ifdef TARGET_X86_64
 #define ELF_CLASS      ELFCLASS64
 #define ELF_ARCH       EM_X86_64
@@ -309,8 +307,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 
 #ifdef TARGET_ARM
 
-#define ELF_PLATFORM get_elf_platform(thread_cpu)
-
 #ifndef TARGET_AARCH64
 /* 32 bit ARM definitions */
 
@@ -665,8 +661,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE        4096
 
-#define ELF_PLATFORM get_elf_platform(thread_cpu)
-
 #endif /* TARGET_LOONGARCH64 */
 
 #ifdef TARGET_MIPS
@@ -846,8 +840,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
     (*regs)[33] = tswapreg(cpu_get_sr(env));
 }
 
-#define ELF_PLATFORM NULL
-
 #endif /* TARGET_OPENRISC */
 
 #ifdef TARGET_SH4
@@ -1046,7 +1038,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_CLASS       ELFCLASS32
 #define ELF_ARCH        EM_PARISC
-#define ELF_PLATFORM    get_elf_platform(thread_cpu)
 #define STACK_GROWS_DOWN 0
 #define STACK_ALIGNMENT  64
 
@@ -1182,10 +1173,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define ELF_BASE_PLATFORM (NULL)
 #endif
 
-#ifndef ELF_PLATFORM
-#define ELF_PLATFORM (NULL)
-#endif
-
 #ifndef ELF_MACHINE
 #define ELF_MACHINE ELF_ARCH
 #endif
@@ -1229,6 +1216,9 @@ abi_ulong get_elf_hwcap(CPUState *cs) { return 0; }
 abi_ulong get_elf_hwcap2(CPUState *cs) { g_assert_not_reached(); }
 #define HAVE_ELF_HWCAP2 0
 #endif
+#ifndef HAVE_ELF_PLATFORM
+const char *get_elf_platform(CPUState *cs) { return NULL; }
+#endif
 
 #include "elf.h"
 
@@ -1699,7 +1689,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     }
 
     u_platform = 0;
-    k_platform = ELF_PLATFORM;
+    k_platform = get_elf_platform(thread_cpu);
     if (k_platform) {
         size_t len = strlen(k_platform) + 1;
         if (STACK_GROWS_DOWN) {
-- 
2.47.2


