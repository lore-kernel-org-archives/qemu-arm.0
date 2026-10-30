Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680EA606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYzCWxEo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoM8-0004hO-Qq; Fri, 30 Oct 2026 11:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoLw-0004VD-Cv
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:14 -0400
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoLs-0008UK-SS
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:12 -0400
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-36a1947498bso88571eec.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373424; x=1793978224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8a2b4rCQZ/Ri0eDvVEGx78IoeAx/tMieqM2WVNnANN8=;
 b=HYzCWxEofrFoim3bt4ZLgV6v42AKGyv3H8RWtdxWXT+4ebON233iplDbnbqKnvmtkN
 4qRNXNwqPQ/vKHMFVVL+TB86X0v5iM6xCkimRM9BrrK2GezRHe6XkwjohYTb0z7DKFI+
 PxU/cMPlO96vnKt05mf20iiaQr3DWZ44VLCKztI9+Dhb98WghJpS3wqnFiKzMd5IDpSf
 smFcTJ3vz5uJZNty81YSxakb1QjHv+AAKEK1aPhxzELK3tYEmRZQpRAN5DMmSe014PYH
 AIg5OHPDk+R7r73mcWwlmruxGUkFU0z4LwEfnk6fPGzO8tGGbGQBUpckii0Tc6Q1A+/8
 d0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373424; x=1793978224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8a2b4rCQZ/Ri0eDvVEGx78IoeAx/tMieqM2WVNnANN8=;
 b=2p1aosJcONmtzIJH3UGSPrpehq1hp8ndSvYed1IO9Bzwk/OM616CStxZA6srMdURQd
 Yi8dUUlfd5AQD8FOBAr2upS5IrM8qyg2pI2VYhSiSZ7ij6u9ryNNjTrzvbMPHIjbnQ6V
 uE+lTMZ0WNibHmCJAfNkn6zYg0QkFSQxNmMERYBNL10uKAcHvmqXqKFeZpDCzfpeR3jr
 VxI9anByf1AUvcp7fCCVDd93KU158crO4mck2e/bHHPBc8cH6umcde5t6gw6ruWXUwgx
 QGkxu+b+ikWb41cdqHwROAAn9VPe9YZVL6TLwrSh5pGyhXDaYl56D0twy7s/P9BUKj4B
 GdUQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBycBOua1ZnP5cPhiWfo5rhVbLvaMYaturto14W2W15yGQlEjcJH1WMmU6y6Q8Xt1I3dMBqD/H8HFA==@nongnu.org
X-Gm-Message-State: AFq9FYKPx8shH/npJGmhKW3TLJo/at61cRz+JVrVLQV7b21MTQpFYexj
 WxD3czlhKJu9HKhr7wvuN3i4mgblYvNDp64qbXA+kHAfQSN940UMO2j3
X-Gm-Gg: AYBFou2BM6h+UIjh6azRndQ2gcd2DJpIeUVd/4JpBUqQ3o6+FeFJu2cndqnOGk0zQja
 DWZLJfBVY/p/NXhzkauZERZ9j2bdfHgAmbf+bXfJFCy7M7J/7MtIcWecU3eGrQSj9dWzid4E7sg
 d7GiNT9T55zLfXG2M5vg4ibifLgPeVYTSz1ns0ySQNTDgRHAgi31XrAuYH21UMHHK0JXIliMpuV
 iuoZZt6w80hn3veVOvQaPn7xabnohEu0zGtNgN3MWmq86w0olxIi0w9MFJEkbQr2KZkTqE5HNPO
 bepz3OFdkDo9hKDQAW0Zm+PNWbFB8qCvhpWDFEAQjDGVVc5AP1q0SlTx4Jl9dagPIBDeEWkUfty
 9vlYHLAxGyLA87TkRB2pNyJujC85bSsGRyINuDrdcBubx9Cb/4i2KQdgwV+BnREzgbo4GkiEQJ0
 ZIXfYnHLRayVmeXid8Fb4r+54QVYKwrt/FUvyhYkJnkgjYJQk4PU7s6TWDX8yZFpZNQdzLNMlzB
 k8bG0+F67Xz3lUsrkI5NL5oSfUit5jlF//iOxp+xlGzIzi+rAhOkRbio9gK+7TpsIqktdfb72rH
 tfzJpxPY406FKCbpb7vG1fE5iwXcJVIcc3isG/ZlU+YORSAKZABOS83myGjSwzG/pu3kKA==
X-Received: by 2002:a05:7022:eb50:10b0:1ac:9da7:e881 with SMTP id
 a92af1059eb24-1ac9dc67142mr3312715c88.36.1793373423386; 
 Fri, 30 Oct 2026 08:17:03 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:02 -0700 (PDT)
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
Subject: [PATCH 06/15] hw/riscv: expand DEFINE_MACHINE for RISC-V machines
Date: Fri, 30 Oct 2026 23:15:27 +0800
Message-ID: <20261030151539.1872-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132f.google.com
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

Expand DEFINE_MACHINE() in hw/riscv/boston-aia.c and
hw/riscv/microblaze-v-generic.c to explicit TypeInfo and type_init()
functions calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/boston-aia.c           | 18 ++++++++++++++++--
 hw/riscv/microblaze-v-generic.c | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boston-aia.c b/hw/riscv/boston-aia.c
index b90da096ea8..54979eae86e 100644
--- a/hw/riscv/boston-aia.c
+++ b/hw/riscv/boston-aia.c
@@ -462,8 +462,10 @@ static void boston_mach_init(MachineState *machine)
     }
 }
 
-static void boston_mach_class_init(MachineClass *mc)
+static void boston_mach_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "MIPS Boston-aia";
     mc->init = boston_mach_init;
     mc->block_default_type = IF_IDE;
@@ -473,4 +475,16 @@ static void boston_mach_class_init(MachineClass *mc)
     mc->default_cpu_type = TYPE_RISCV_CPU_MIPS_P8700;
 }
 
-DEFINE_MACHINE("boston-aia", boston_mach_class_init)
+static const TypeInfo boston_mach_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("boston-aia"),
+    .parent     = TYPE_MACHINE,
+    .class_init = boston_mach_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void boston_mach_register_types(void)
+{
+    type_register_static(&boston_mach_typeinfo);
+}
+
+type_init(boston_mach_register_types)
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index b0494b1ac50..b0f837b6ee7 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -176,8 +176,10 @@ static void mb_v_generic_init(MachineState *machine)
     create_unimplemented_device("qspi", QSPI_BASEADDR, 0x10000);
 }
 
-static void mb_v_generic_machine_init(MachineClass *mc)
+static void mb_v_generic_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "AMD Microblaze-V generic platform";
     mc->init = mb_v_generic_init;
     mc->min_cpus = 1;
@@ -186,4 +188,16 @@ static void mb_v_generic_machine_init(MachineClass *mc)
     mc->default_cpus = 1;
 }
 
-DEFINE_MACHINE("amd-microblaze-v-generic", mb_v_generic_machine_init)
+static const TypeInfo mb_v_generic_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("amd-microblaze-v-generic"),
+    .parent     = TYPE_MACHINE,
+    .class_init = mb_v_generic_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void mb_v_generic_machine_register_types(void)
+{
+    type_register_static(&mb_v_generic_machine_typeinfo);
+}
+
+type_init(mb_v_generic_machine_register_types)
-- 
2.55.0.windows.3


