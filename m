Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3874F606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvddITIR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoME-0004mq-0m; Fri, 30 Oct 2026 11:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoM2-0004bs-4L
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:18 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoM0-0008W0-6b
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:17 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-1a2af4c8d00so1573304c88.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373435; x=1793978235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
 b=UvddITIRGppPhk9RxFZ1M/UETsEUgmdxoB86M8NSL032pxbc/5q02QcGEcIszdnCuW
 jLeuEJuyX3Vn1kb8Uhz9hCxBwkf82vm1ITfM2bJJerRzgJ4hQaEwjO3/e0KiqP4Tni8P
 DKSc/r+nJITU/Muocw2gKHVf2TfCHOd6at2u8fA3FCaYhjOhHXKmOO09WFwPdne67MUT
 J45s/QiLXWAhcJ/AkYrEio09H+qeieLXNCujtEI1ClWtFIRCuF4Sb37Z9Dbrhaduogpa
 HtDLo+jig+3zMSIiEKENl3zwUpF3Z75VcdZc/7Rd+05u0AjrATODJiVVrgRXs/6LgZoO
 MjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373435; x=1793978235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m864uzH9D1nJnXhJ32zoDB2BUw6AVK2KA1WWNZhkMsE=;
 b=C19lnA57IZhrVG8Xrcjiy4HcV/fxcsy51VNvh4wiWjGzy+f59W3FPrc6YPJ7EwEHLF
 V3ABZfQNFkMaDGF84ffy6M/FHp0SFiUhl06v7V3SSaXmjnobkvAui5ESKpDVfqm2Cx4D
 zEBIyLMcsgbojj3O0ghDpR2FrHmDcny06C4ZkQaxV8/Jx+uSSvXQZlDUck2pQcH5CSaX
 aLFbWDkEyrAzPSjVohXj4JFpqtOuxiRhrL6dRcaTd7TiG+pOELOMeVgqoNwACkm1VzRc
 D/wdlYXyr8PsQrHHTwx2LJaLOSFIm+FyraofRWBTu+by9zt11M/8rBYHnV6AxRHOMJgb
 jWVA==
X-Forwarded-Encrypted: i=1;
 AKwUvByzkUlcuLpMgIqV1Rc9rQXAUo5aWjVzWVAsph3r7BwPLyMsZ3kd0mhAwIQ6tKq6BYXhNyjY9/879w==@nongnu.org
X-Gm-Message-State: AFq9FYK7XbhTVSWuKhMLUpuYCN145ycEmVkQmXGH6WXrdvThl69tFwr9
 rIgvHQchmpkke37+67garkrkokryZAFakR+RZ0US1q47NgF8uW8nyKOv
X-Gm-Gg: AYBFou0SwIccxdoMlcIGeJ2uSLK+5l3v7nYxiv7t6lDQJ/tvjAXf/4FyTjpVKodojsH
 joIywO35qSkulZZCkqrleSZPx8yVX1ydicCHv1e4pAwC9ic+fWDqA9HW6tDG9zDMjyleSPh8t8Q
 hBe3GVYKPc6EWu6A9/0+TZ95iccl0cEKn1vmcJhvhZmbx/tBMgqd8z/pvZstGGBHRGtV3HQ1bKK
 qWIRmVdd4Hf1KaBz7bl3i7c+s5ZCkhqv0IBVif37VfZA8Z6wN1CPKrMADej844cxO4gyRzSS56/
 YiJEaY0FbSczwIGwwTEnTkiueL9iXNATlL2HUOM2ZIAboxX4Mgfv6xy9YuPJabz9oKTPVnpIHNz
 St8dsfjU6x4oex941Tr9AsKdmS1Sb4ynsO6Fl8hgM9GKc1K29FVwsT8RJ4+nbwUND2aabP4R6iR
 9TRWCWoR09qH8uZmP9s32fkZSKjJImSTsWBjyuLAoONYelrUe9QXcSTvbJT5dZdbCGLI8qqNCc6
 ldE9b/MLjjPZtT3uOtfHwQzQdNf/SXyjgXH8d+HVzixUL+PHVQJlmH2g4lTeYTgiUf6SOQ2nbr2
 Rz3abBkIUY80VoIQPHf/scnC7CovzFKdvQ==
X-Received: by 2002:a05:701b:4512:10b0:181:73fc:e53 with SMTP id
 a92af1059eb24-1ac5b7e21fdmr3546543c88.29.1793373434663; 
 Fri, 30 Oct 2026 08:17:14 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:13 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-ppc@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH 07/15] hw/core/null-machine: expand DEFINE_MACHINE
Date: Fri, 30 Oct 2026 23:15:28 +0800
Message-ID: <20261030151539.1872-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand DEFINE_MACHINE() for the none machine to
machine_none_machine_typeinfo and
machine_none_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/core/null-machine.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 60254913019..1f35b9169d1 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void machine_none_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,16 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo machine_none_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("none"),
+    .parent     = TYPE_MACHINE,
+    .class_init = machine_none_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void machine_none_machine_register_types(void)
+{
+    type_register_static(&machine_none_machine_typeinfo);
+}
+
+type_init(machine_none_machine_register_types)
-- 
2.55.0.windows.3


