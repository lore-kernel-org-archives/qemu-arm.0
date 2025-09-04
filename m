Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E27CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:20:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5Ai-0000O6-4c; Thu, 04 Sep 2025 04:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55i-00079A-HT
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:13:11 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54z-0004Mi-VF
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:13:10 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b0415e03e25so101444966b.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973536; x=1757578336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFNUB0V49RFoANOb1kSaGEn6pZ+DOzW4FGm2O4halkE=;
 b=Spk+yPrSWkwMNmmNacgG6gzgsdn4g4wdgvoEqQ5SVeaazL0oBQYQrgPgac/2Zm3C3Q
 nNj4f/dZrU3DNWa1EfGS7aNYHFLN+SeGl7AYW5EPIF5rWW3wPwBOwtInZ4SxsIXMOuPA
 EjCatG5qkOPAt3erJ5vjroOCh++o8kmZZPtv7YYumyg8iAQYzzaOUBnC5UJK97FxdjT8
 lIWFKZgJXZfpUEKjfejwr77S7eLa0ioJizS7urnbtXcfvY0XLW2eNEdzWz8j4zAtfkAn
 jvooDiKZyuGL9UJYYZMIacCuNgl3vSNAdPibLD5cUUIpomFjwl2e45jffKVL77Bj0wsy
 aukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973536; x=1757578336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFNUB0V49RFoANOb1kSaGEn6pZ+DOzW4FGm2O4halkE=;
 b=w5ECfxgevSM52GUzGD7hishrHBSrOJIbZJEA7YTBKP+saUGu3z8Cq99qpHoVz9I4Ny
 hkSkWa55Uk96Fe9vDP7By0FrN7tL5zUuaAgQ0P1o3hFLdTkB8mgZkUW8OzMgMYuLVYJQ
 C1mzVXLXchgqAHg9c3aSEgQDk+E/MlSZ+uCXDSHDds6YfdyzzZOtwEIY7oBhkWkzjD1I
 9V9ymsC0fw/8jsG2RdeTsxxZ3rAFI0+6wHmo0DNCY6PXHC1MgMAwYTIt3qQfjDjZfIZi
 amipFL/clJZoEamG0fsk5wEwre3KmmfKyHj7u7IOOhpasuhjuugmcKt2N4Iy0L71vtAk
 eGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUByK92tjH0sYbrQgcSKaptPxd54K0IXI4eS4nxlFfi/oX4Ta6LMCOZS/CgWRMxdwBKUZYWH4dnVw==@nongnu.org
X-Gm-Message-State: AOJu0YwDzvEXW2W3fIdJgH7I6NX/DS9V4Dx4xUZl02hrgOfE6RZZ14mJ
 Mfb2m9BHu8qQpemN63tmaVt0874cZWgl/aHeXv2/f8KLPIoB9UCM6ntbHB6J1VzxQww=
X-Gm-Gg: ASbGncswLFXQfGhXIwwV2XSoLZtcNp7pJL9GpLPMTg+RXcFZy4qQUGvUTiWLo/QFg3V
 tvKGLItEe4FAFoK9EPioB1MkKJDaU7cQsltLuvClE0Rd0XP0I225mgu8Upv/E0YJAVwCcZ6KvQj
 zk20e4AyubZHR55cWaTHh9IaRtgWOmL+FvmnBoBbzEf8Gx/xV0udrOSFWgOMzzt3MATLn8eD73s
 6nXPxp9qd87QAuhYnJ42ans4iWZyoWoXc+XfdjtjapmFUtlHHfV3gIUfxK4ukZXBXJq7EshTfJ+
 bqLl1lyEcRyqZDvBI6iRIjwv3RDq/gyPLg++xTzxlCuyRJHze1M0lt/ONmPNkWra/SvzFSiroL2
 nvxbGrlorgKCnx6+uW57CPx0=
X-Google-Smtp-Source: AGHT+IGIalYOz68UVLpWwAQ502u/6C1wYzVQm3dA2hqMKbFddMADRpQhWxxMK1CrZqrYwwk6HQP7Eg==
X-Received: by 2002:a17:907:728e:b0:b04:48c5:35f with SMTP id
 a640c23a62f3a-b0448c507b9mr1060418366b.10.1756973535683; 
 Thu, 04 Sep 2025 01:12:15 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b02152cc1b8sm1264174566b.36.2025.09.04.01.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8D2E960AFF;
 Thu, 04 Sep 2025 09:11:39 +0100 (BST)
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
Subject: [PATCH v2 089/281] linux-user/xtensa: Create init_main_thread
Date: Thu,  4 Sep 2025 09:08:03 +0100
Message-ID: <20250904081128.1942269-90-alex.bennee@linaro.org>
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

Merge init_thread and target_cpu_copy_regs.
There's no point going through a target_pt_regs intermediate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c         | 18 +-----------------
 linux-user/xtensa/cpu_loop.c | 22 ++++++++++++++++------
 2 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 4876e4b0a80..447a9be11d7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -905,23 +905,7 @@ static bool init_guest_commpage(void)
 #define ELF_CLASS       ELFCLASS32
 #define ELF_ARCH        EM_XTENSA
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->windowbase = 0;
-    regs->windowstart = 1;
-    regs->areg[1] = infop->start_stack;
-    regs->pc = infop->entry;
-    if (info_is_fdpic(infop)) {
-        regs->areg[4] = infop->loadmap_addr;
-        regs->areg[5] = infop->interpreter_loadmap_addr;
-        if (infop->interpreter_loadmap_addr) {
-            regs->areg[6] = infop->interpreter_pt_dynamic_addr;
-        } else {
-            regs->areg[6] = infop->pt_dynamic_addr;
-        }
-    }
-}
+#define HAVE_INIT_MAIN_THREAD
 
 /* See linux kernel: arch/xtensa/include/asm/elf.h.  */
 #define ELF_NREG 128
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index c0fcf743e70..43a194fc4a4 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -238,12 +238,22 @@ void cpu_loop(CPUXtensaState *env)
     }
 }
 
-void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
+void init_main_thread(CPUState *cs, struct image_info *info)
 {
-    int i;
-    for (i = 0; i < 16; ++i) {
-        env->regs[i] = regs->areg[i];
+    CPUArchState *env = cpu_env(cs);
+
+    env->sregs[WINDOW_BASE] = 0;
+    env->sregs[WINDOW_START] = 1;
+    env->regs[1] = info->start_stack;
+    env->pc = info->entry;
+
+    if (info_is_fdpic(info)) {
+        env->regs[4] = info->loadmap_addr;
+        env->regs[5] = info->interpreter_loadmap_addr;
+        if (info->interpreter_loadmap_addr) {
+            env->regs[6] = info->interpreter_pt_dynamic_addr;
+        } else {
+            env->regs[6] = info->pt_dynamic_addr;
+        }
     }
-    env->sregs[WINDOW_START] = regs->windowstart;
-    env->pc = regs->pc;
 }
-- 
2.47.2


