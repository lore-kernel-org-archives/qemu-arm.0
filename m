Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66351CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu59v-0006TU-LA; Thu, 04 Sep 2025 04:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu55P-0006n8-9u
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54o-0004Jr-J3
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:49 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61e8fe26614so1294234a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973531; x=1757578331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5Zye4y6NxJaSczxcVcmt24avvGWMTOUTr/+SGRum6M=;
 b=boMQ9lZMfWTFZMAR62jeP6ewTopU3I4hefUKbPZLif8K2gSWn5i1rInkeGN8n4YA+j
 2OGtbQWYvv/5i9t/0onqvtiKqYjhKRebVvs95HrNgWZsB0yJ4GNSbDINh06oAzP4Crfg
 iSS0z4ioEtYGIfk369FwQ0nZtPdaIRROTeK+/tY4v/Yv8XblhE5rO5B0QSaJ6XdVTuWG
 zxHUZf+JGkPFNypnkwLYEYKw10OvQ/5HSXEy2vAUDQTUaSGzrLpShzo601ihT5tajQdt
 demdR2CZaUb/os6MCxphO3G8HwojF/eB8Q0OBJ9bC/oK++Z+k/1A8PqQks49BiOL8SdW
 Msbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973531; x=1757578331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5Zye4y6NxJaSczxcVcmt24avvGWMTOUTr/+SGRum6M=;
 b=JV4EL+obT3yqXyvEiGfmaT4Zq1iAY9us9H0gYalEESBNoa09ey62/Wf80rsl8Zf39y
 /u9cg23MwPvPZqeMOAt02KAwycmYaueSBzTN1uxqADP2Nd8yrndgIxx+gL0PyZCVlPgm
 edDEH7uxk2txkhPLV3HfOLdH8PEeXrf0S0iB6V592ohbQnKslcHzzaeQimkTEuVqWF2q
 U4qXpFQBgqukrh9xpKsczEiWuPyhzSSTyqfLC5GnSa5yI/cbYYgeSu8FcSlh0elPOPSg
 qHX3mWj/bdX81dq09dySm4JXvTB+esBdobWqZa7G2M80mVU9ViMow8ZLvLM41EoJkzhk
 yM8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMp9rh19E+FDN60CXJbr4RYRMm4yju9c+wkIHyYc/rETzr+EwA1g879qOZk3jd21qCEg8RIdBCQw==@nongnu.org
X-Gm-Message-State: AOJu0YyzMto/0HZ7sRGo2h+4YYEXyWtOAkUlzEeoT4cLjaU+VEIJPlRW
 fDo2PF4I4GEutb9xQSP9ewYsFpt5Q/W5PGMo9Jq72AaEnNbw1i1IYDzzdX6LYgkOtUU=
X-Gm-Gg: ASbGncuSWOGT9JYDO6xpPUSZbyVwomBn/GncBV+SUb0dklXxxWQWkrnS0nNCLc7XFW+
 kAvorDXFXyJLLUNl7E5UCfpXNKPYhnA3CuconMdADFMYFsPzKq49Mq0Q9/7JFUpF2n5pwbogJTi
 pJXN/vu3y9ZINhz7gLDd8k/2iefMW2OqThGaktOB3KSEtWloWLuDIRftqfJCl0/pKYh7q7eTBvk
 I+pu75/uHS6ZJNZm2tErXq+uGfC0UZRPrnYouniOotjT8iaDbyJzGEzeuQXVMmqMsKvmzv5p0gs
 jvi/O9o+eZiBRnvcAQ8fEewamtK84l0hF4XDtnbN75QOfAjaCOPuw+mYA7meJeDHJNbp5hItOpx
 Bx77+frwzopXvPLnMpa7ibsY=
X-Google-Smtp-Source: AGHT+IF1UlpN1KE60QyaFu7SPeex9JuTZpIzLFQqDWgGd66ip31ZvJUQ7H7q2GBrvomv7IKti2Khbg==
X-Received: by 2002:a05:6402:42ce:b0:615:c5a9:4cab with SMTP id
 4fb4d7f45d1cf-61d26891bb7mr18730456a12.13.1756973531393; 
 Thu, 04 Sep 2025 01:12:11 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbbd1sm13844207a12.34.2025.09.04.01.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:12:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BA7BD5F93B;
 Thu, 04 Sep 2025 09:11:38 +0100 (BST)
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
Subject: [PATCH v2 082/281] linux-user/openrisc: Create init_main_thread
Date: Thu,  4 Sep 2025 09:07:56 +0100
Message-ID: <20250904081128.1942269-83-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

Merge init_thread and target_cpu_copy_regs.
There's no point going through a target_pt_regs intermediate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c           |  7 +------
 linux-user/openrisc/cpu_loop.c | 11 ++++-------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3f9ec493595..03c95397744 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -673,12 +673,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2MSB
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->pc = infop->entry;
-    regs->gpr[1] = infop->start_stack;
-}
+#define HAVE_INIT_MAIN_THREAD
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE 8192
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 306b4f8eb43..8c72347a99a 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -83,13 +83,10 @@ void cpu_loop(CPUOpenRISCState *env)
     }
 }
 
-void target_cpu_copy_regs(CPUArchState *env, target_pt_regs *regs)
+void init_main_thread(CPUState *cs, struct image_info *info)
 {
-    int i;
+    CPUArchState *env = cpu_env(cs);
 
-    for (i = 0; i < 32; i++) {
-        cpu_set_gpr(env, i, regs->gpr[i]);
-    }
-    env->pc = regs->pc;
-    cpu_set_sr(env, regs->sr);
+    env->pc = info->entry;
+    cpu_set_gpr(env, 1, info->start_stack);
 }
-- 
2.47.2


