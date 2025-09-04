Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF59CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5D2-0004sS-32; Thu, 04 Sep 2025 04:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5BS-0001f9-K7
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:19:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5B5-0008G1-Jl
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:19:06 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso138915166b.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973921; x=1757578721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+88w9AQZ9cLJwlirAZW/BDB9U/6ab+UNG3qEc9GZaw4=;
 b=w3qF9zPegvyCR7fo/+K+sFJlrYhHzB/6ZWBxbqfVRlrCINgr4GrC6CuOO1aDaA+F16
 55p7CVzht3RK8ORAadGSkOIgXXyTRhz+o4vbc2Zn8QvW9Z5CRBPUCQi5HYJaTVfKJeJV
 nG7XWEI24cHlcVZ2WTTc7DfZM/rRltY3MLA/D5hgbeFI8LYtttbCYjUgWt+rkhdAUu84
 5hB6buBzf1C4J8GD0MwkfI9aBQiDYmNCf3pV6PibhNJ03X0MfYS/mMEJm+ZEIYge64kS
 Iy/63wLoDoqlkc0XqBVkaxubn/etNyB34C0H6GCJpTPiZxGY/+bQRx6IoihU08/+2FKM
 y0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973921; x=1757578721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+88w9AQZ9cLJwlirAZW/BDB9U/6ab+UNG3qEc9GZaw4=;
 b=V1OaAeC/gTWXmQv2H3jZDytqKCwAyXUSRF4x+AmuJ3NdmUDXw/TwSKXSoA4VYWkHvO
 JCyF54XiZy1KMQhW3DKwHeUHEM/j6fIGdIT2+Oxt/IIxfrafF/RTwER/xNmrFM/Hg51b
 2yGSbJyICkPmRLSS4im0qjmLSirnfKhEH65uqCSIxM9JtPrAEpetG/eJPxgZUPWiCZ6h
 RlIh3YiHDbpeI6D5At5NuzyUvr4eV4MvCgaFPhi7voheP2ICCYVO2lFwUz8Y+SV0tWx5
 cXpdDky1b6rOUbby8UnOhXqZMeoWQw+k6vfrH+utmXpKRJJBkOql6DdSfQUw6nWWxTb2
 mYWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6/9cuWlrRfHjbP42HQbAX5LF+1QFgvgt0Il4nBjJdKE/o2exh/bxneSw4YOY1sENPwh2MjzUhUw==@nongnu.org
X-Gm-Message-State: AOJu0YxSoXhNYiILm2yFZdKk7sIMaD0AOv8EG6s4FNVN4x08/1gy0F3V
 6gGVClVe4BJiitVyaDD9OcAEwTD11+O5oEBZufOcY2E8+uQXvkVnRuN5zhMOWp1KStU=
X-Gm-Gg: ASbGnctKDfnSoW5i+2jNftMcHRN5CjRE84knYHuJ2TynnYpmFbH2wd0nG1NWXKBmofe
 8iljGD1miUdimHn37A7tzAybKilmH7eHX6HBZ3i/X08ZM2r+A5aeM/N5t/KT4vEwNbLmXSFt1q2
 UDEggeiC9PDYckqeVyNQ58T8ReQR0tlkLFckLPLOiqYecK4naaoPLTtETbESALt7pZKTnVmKh3x
 RcmbJ029OjWtMqbkasuOvEZxdXcZoc5D5/hufymuIkH3v/xDDtRpoR6aF/9IdKZqISgzi0jPNuY
 47m6ijyMwDOQO+Agz1b5l4fmEc3uRUWRuPzjzOwL8mCkuEXxvU1GQGu02AhN5LOOk97Bc7rfFbt
 8rjTJ9v1mTvFe/H8z6fbJ657ELh1c738mXA==
X-Google-Smtp-Source: AGHT+IHFAVdVOvMLcJHuai65MWsr9SmBgeL2Tgj0QMP02jLqWRogO17ihLL64IqF5n9Rmjb5DNoXJQ==
X-Received: by 2002:a17:906:2a54:b0:b04:e39:74a8 with SMTP id
 a640c23a62f3a-b040e39a890mr1460103766b.20.1756973920724; 
 Thu, 04 Sep 2025 01:18:40 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0470f11088sm255181566b.111.2025.09.04.01.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:18:37 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5504A60AF7;
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
Subject: [PATCH v2 087/281] linux-user/riscv: Create init_main_thread
Date: Thu,  4 Sep 2025 09:08:01 +0100
Message-ID: <20250904081128.1942269-88-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
 linux-user/elfload.c        |  7 +------
 linux-user/riscv/cpu_loop.c | 10 ++++------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 16aa09214e8..556f11d720d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -849,12 +849,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define VDSO_HEADER "vdso-64.c.inc"
 #endif
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->sepc = infop->entry;
-    regs->sp = infop->start_stack;
-}
+#define HAVE_INIT_MAIN_THREAD
 
 #define ELF_EXEC_PAGESIZE 4096
 
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 2dd30c7b288..b3162815320 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -94,14 +94,12 @@ void cpu_loop(CPURISCVState *env)
     }
 }
 
-void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
+void init_main_thread(CPUState *cs, struct image_info *info)
 {
-    CPUState *cpu = env_cpu(env);
-    TaskState *ts = get_task_state(cpu);
-    struct image_info *info = ts->info;
+    CPUArchState *env = cpu_env(cs);
 
-    env->pc = regs->sepc;
-    env->gpr[xSP] = regs->sp;
+    env->pc = info->entry;
+    env->gpr[xSP] = info->start_stack;
     env->elf_flags = info->elf_flags;
 
     if ((env->misa_ext & RVE) && !(env->elf_flags & EF_RISCV_RVE)) {
-- 
2.47.2


