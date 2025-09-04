Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAECCA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu59p-0006BP-Lo; Thu, 04 Sep 2025 04:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu558-0006bX-6c
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54a-0004Cv-NV
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:33 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso113431766b.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973519; x=1757578319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYGRaEygAmq0yB6dB6NYHsKe8ftCLRayZgW4YcDy0bY=;
 b=YoXmdhZRT5C+Vv/hGhX0/L05dykpNx2ALN7WuuOgbKP1LIUfooknr+zukursRWvQOn
 ABcBWOIbtJ5HAK2KNnHh3Tg127hxb/N5nU3H11eck6f6lfQ7TcXEcg9HV454AmgXmrRh
 iMFKF+oCImdUig+YX8NGQcoIiBpaidnHujaHuS2MBSTDZTXhKCp3fjAebZpPBUQ4sTFz
 0q79rvDIcDuGHE1tU9YKNhBbBaUPtEbhM8B8Kzf1NsPnr6B3ss4DN6oZ0D8RoY7uHfzC
 rDazMbTZH0rZ+jz9Od5GqGo+DzLfCvwFPniTbVp8YuzWgXakrMLaoa1a7oBwSKUPSK/S
 AM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973519; x=1757578319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYGRaEygAmq0yB6dB6NYHsKe8ftCLRayZgW4YcDy0bY=;
 b=vSu1OeOwKOQaBus7u/kqyzFVCsAz0MCwQy0HeEQcrb0ATbbLnc1iygw94b6aKkaHI8
 XlR21HkO2b3g0TlkfTrXKdEw0ld6o2UtbDQ1z4sRYujBxFKVBO/ambEQVugrqY9UkGJs
 I8N3fJbdBixknIbfyUB9wuwaBoOQiX/EUnDBUD2yGmHd9FUoN1Nup+cvn8t0VBio8nb8
 k5jYrUL+07UT1tC/0Ndvk1ISa46K1bYOSk5IGJaW8FPMiJ1vgIXp2pCsbfdk8cwzJqR2
 auRYH9Wq9RED5Yi8ZiWFo2Mo+dA6f+BI4KkaFACRZ5TdJ8uqvA67UhbqTdIwlcLNFXWr
 GazA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmbdQAFmmxprdxDk3iW67Tki8Ca+EWVch7L6kozr7PrVPqb36Eu6jBrF/WMdsgcDRfRnOD1+V6vA==@nongnu.org
X-Gm-Message-State: AOJu0YxiaQAraiMwd+H4jVG9f6pub12tcnOZGwup8/dRQIf6WlcU8l4Z
 b/YhyLOXQYhsoEO/lmFrYFFkS99T69XHGJVlgKmUI7DuQChsUjg1S8Pok0I72K7zTnA=
X-Gm-Gg: ASbGncvGjXaEcKrTFT02y12l828lBMztbkKMZn3472NNGLx8+TLASj97+ZSFzNWVl9J
 9e/AAgY2R8m2R6JqnJ+u8K38lLZOrcSyWQjefbBrYuHQtsMRmTPTsQEpV9SNUuIJjSRNgon8e4K
 BGFfMMo2ZBm4MQBlsOw0IWmvOBWTeatF4L99iKTR5zDJ1VNPDma2RndJ0CaYzyEc5v0w2Uo26qL
 aTIdDymNXyZKDN6oSb43EsxCFohYlMf3Rzh+3KKimmU0VUz6958AVueMUWTUN5DYXH3uihN+Pke
 XS2dHKj1LkYajgh3IMqjdIoig89r3dYsYhsFU0t4Gh6JVowf13k97vSKXHRaBLFJUFNCXZwUYKn
 LigY+OFluL1HijQcm7lXQaZg=
X-Google-Smtp-Source: AGHT+IEEd8ZPtE7dzpafV3rQl5ScoDbu664sPvm+oBwKTtHgwiknmKF2oJmNRBCFGa8ApKyL2E84SA==
X-Received: by 2002:a17:907:26c4:b0:afe:a83a:87ce with SMTP id
 a640c23a62f3a-b01d8a2f955mr1857740266b.2.1756973518509; 
 Thu, 04 Sep 2025 01:11:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0423ed35e4sm981915066b.25.2025.09.04.01.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6AF12601AF;
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
Subject: [PATCH v2 050/281] linux-user: Create target/elfload.c files
Date: Thu,  4 Sep 2025 09:07:24 +0100
Message-ID: <20250904081128.1942269-51-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

Prepare to split the main linux-user/elfload.c.
Create empty files for each target, and add the common build rule.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                      | 6 +++++-
 linux-user/aarch64/elfload.c     | 1 +
 linux-user/alpha/elfload.c       | 1 +
 linux-user/arm/elfload.c         | 1 +
 linux-user/hexagon/elfload.c     | 1 +
 linux-user/hppa/elfload.c        | 1 +
 linux-user/i386/elfload.c        | 1 +
 linux-user/loongarch64/elfload.c | 1 +
 linux-user/m68k/elfload.c        | 1 +
 linux-user/microblaze/elfload.c  | 1 +
 linux-user/mips/elfload.c        | 1 +
 linux-user/mips64/elfload.c      | 1 +
 linux-user/openrisc/elfload.c    | 1 +
 linux-user/ppc/elfload.c         | 1 +
 linux-user/riscv/elfload.c       | 1 +
 linux-user/s390x/elfload.c       | 1 +
 linux-user/sh4/elfload.c         | 1 +
 linux-user/sparc/elfload.c       | 1 +
 linux-user/x86_64/elfload.c      | 1 +
 linux-user/xtensa/elfload.c      | 1 +
 20 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 linux-user/aarch64/elfload.c
 create mode 100644 linux-user/alpha/elfload.c
 create mode 100644 linux-user/arm/elfload.c
 create mode 100644 linux-user/hexagon/elfload.c
 create mode 100644 linux-user/hppa/elfload.c
 create mode 100644 linux-user/i386/elfload.c
 create mode 100644 linux-user/loongarch64/elfload.c
 create mode 100644 linux-user/m68k/elfload.c
 create mode 100644 linux-user/microblaze/elfload.c
 create mode 100644 linux-user/mips/elfload.c
 create mode 100644 linux-user/mips64/elfload.c
 create mode 100644 linux-user/openrisc/elfload.c
 create mode 100644 linux-user/ppc/elfload.c
 create mode 100644 linux-user/riscv/elfload.c
 create mode 100644 linux-user/s390x/elfload.c
 create mode 100644 linux-user/sh4/elfload.c
 create mode 100644 linux-user/sparc/elfload.c
 create mode 100644 linux-user/x86_64/elfload.c
 create mode 100644 linux-user/xtensa/elfload.c

diff --git a/meson.build b/meson.build
index 50c774a1955..0d42de61ae6 100644
--- a/meson.build
+++ b/meson.build
@@ -4327,7 +4327,11 @@ foreach target : target_dirs
     )
     if 'CONFIG_LINUX_USER' in config_target
       dir = base_dir / abi
-      arch_srcs += files(dir / 'signal.c', dir / 'cpu_loop.c')
+      arch_srcs += files(
+        dir / 'cpu_loop.c',
+        dir / 'elfload.c',
+        dir / 'signal.c',
+      )
       if config_target.has_key('TARGET_SYSTBL_ABI')
         arch_srcs += \
           syscall_nr_generators[abi].process(base_dir / abi / config_target['TARGET_SYSTBL'],
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/aarch64/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/alpha/elfload.c b/linux-user/alpha/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/alpha/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/arm/elfload.c b/linux-user/arm/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/arm/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/hexagon/elfload.c b/linux-user/hexagon/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/hexagon/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/hppa/elfload.c b/linux-user/hppa/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/hppa/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/i386/elfload.c b/linux-user/i386/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/i386/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/loongarch64/elfload.c b/linux-user/loongarch64/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/loongarch64/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/m68k/elfload.c b/linux-user/m68k/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/m68k/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/microblaze/elfload.c b/linux-user/microblaze/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/microblaze/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/mips/elfload.c b/linux-user/mips/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/mips/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/mips64/elfload.c b/linux-user/mips64/elfload.c
new file mode 100644
index 00000000000..b719555e659
--- /dev/null
+++ b/linux-user/mips64/elfload.c
@@ -0,0 +1 @@
+#include "../mips/elfload.c"
diff --git a/linux-user/openrisc/elfload.c b/linux-user/openrisc/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/openrisc/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/ppc/elfload.c b/linux-user/ppc/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/ppc/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/riscv/elfload.c b/linux-user/riscv/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/riscv/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/s390x/elfload.c b/linux-user/s390x/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/s390x/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/sh4/elfload.c b/linux-user/sh4/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/sh4/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/sparc/elfload.c b/linux-user/sparc/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/sparc/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/x86_64/elfload.c b/linux-user/x86_64/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/x86_64/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/linux-user/xtensa/elfload.c b/linux-user/xtensa/elfload.c
new file mode 100644
index 00000000000..73fa78ef14e
--- /dev/null
+++ b/linux-user/xtensa/elfload.c
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
-- 
2.47.2


