Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A2CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu58A-0001UP-64; Thu, 04 Sep 2025 04:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54x-0006VZ-GY
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54Q-000476-OH
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so104025366b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973509; x=1757578309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7geJ/d+IpF0bnrBWG3MkyF/FGBGbkERD3zk6LOqJjeI=;
 b=lJMHM23hJm7pX9Lw7HVZdH6GYZS23Fde9n5NtvEbbNlJDGtf791IHu6FUmiEi8/0gz
 zohtwVfNWun/MLZbUiQGoS5PG7gSVKCF8fao+eA8qKKswVY+6z/GWIENcWSfqL/pwjkx
 i8zkLRtRqBPsV/WGxkv9K3XfAtgM62m+tL4H+4Gfx7YjSAb5kzAo02Md0J2JuFtOo7V1
 6hQNTjzjLASLUx8LQGyTjwDqbDrlN/WYe6Rw51PSKf5kgpctiDRPO7bl1+SE2OZb+01D
 //CovwdjHqgELxNKfUledWb+UKe/O3UimixAOcHIdiS8iunBy2n3L1aHgrAAMvEl8tzt
 IWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973509; x=1757578309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7geJ/d+IpF0bnrBWG3MkyF/FGBGbkERD3zk6LOqJjeI=;
 b=N94Eug/OKj4fdOvNLF/1DqLyabu9IgYfzcWAcVAwl7zUcsCTbqvWQe0okElcVAaQDn
 L6aa9SCa6icvE+RayIoqU9eGKJN7mkk8h6jjAHZrQV42hshEyenaPaAcbWJQKbLVlkR5
 MriVXalQKoO7PWEBShNwwP/UCAzGOUwcX24fgCy/ZSiXiK65meEymCjGJsA3e0rHmp/k
 groQG/WBs3/FMM0CnKHNQFQr7++ZWF+KXRj6VsxEz5ywAbYrUqJPsZipfCDxB0rOHiH2
 818ZHO9icrpW1UHZW+H7BIbz3ZMqrSsMZJMC381D+sZD7K0SwqlmLzrm1aFLKYo8UAK8
 lKrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPGSqq5mgLfEUwBGZ8NnJrUrHCLHAcKEETgglQCANR+3PbC9TB6FrSpnFBDLoCAkeD2qX+INkjTA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4nab1+u71bWMFRz6XTL7tRoQxfc9YtWsgWaNsUvtO5sdQirBC
 Ejh2LPiHT4YVwRcDqkcRoMv7ySfcJOnUDBwyC9rHu6F1RlliODegFliOFAZa/3WXiD4=
X-Gm-Gg: ASbGncvT6Zd7v9+eDZN3Pge223Pc6Q+eQk8OezEl2aH7MtrccVChtpRB7pYncZKXXAt
 LQLtQMjoP+bY5IAd5DCv+nmWBVn2w/HsrlvL7XmxYubO2bYfUUvIYOdTuhDkzYDjRafxgXaYaqC
 7+pvb6sZn/zsxMVX+5jFAf1bJ7QXE9RlZ+Fdkp0HutmCbpys79ZEVi4zghC9/RY92MIEyIQnqdQ
 /JfiH1bnJC+xl7dbTaLF7sr97typi6TTcgb82DiVzmS5XA2xofiG/yw5hzszLhBC758w/ZJp+CT
 gl/UViO6R6QrMtgdDxEkwE9gQX4mpLdWlBD0F6aTzr0mfaTuU6oleh3xYrp29MD4rHLMoG8waJi
 VJyYi0+5bqB60xhjd7w0+kHx7SjQ1I033gc6ngW99+MHf
X-Google-Smtp-Source: AGHT+IF37/RkUkvHxpHyzv6Sr1CxWGia+EZsIsO88JRHZD4x5ESW6xiGp3g5mGvariieAZ54zk6iIw==
X-Received: by 2002:a17:907:3cca:b0:b04:354e:47a5 with SMTP id
 a640c23a62f3a-b04354e4b78mr1354615266b.17.1756973508907; 
 Thu, 04 Sep 2025 01:11:48 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046aa92242sm326302466b.59.2025.09.04.01.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3989B5FB07;
 Thu, 04 Sep 2025 09:11:31 +0100 (BST)
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
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 025/281] tests/functional: Move microblaze tests into
 architecture specific folder
Date: Thu,  4 Sep 2025 09:06:59 +0100
Message-ID: <20250904081128.1942269-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Thomas Huth <thuth@redhat.com>

The tests/functional folder has become quite crowded, thus move the
microblaze tests into a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-14-thuth@redhat.com>
---
 MAINTAINERS                                           |  2 +-
 tests/functional/meson.build                          | 11 ++---------
 tests/functional/microblaze/meson.build               |  6 ++++++
 .../test_replay.py}                                   |  0
 .../test_s3adsp1800.py}                               |  0
 tests/functional/microblazeel/meson.build             |  5 +++++
 .../test_s3adsp1800.py}                               |  2 +-
 7 files changed, 15 insertions(+), 11 deletions(-)
 create mode 100644 tests/functional/microblaze/meson.build
 rename tests/functional/{test_microblaze_replay.py => microblaze/test_replay.py} (100%)
 rename tests/functional/{test_microblaze_s3adsp1800.py => microblaze/test_s3adsp1800.py} (100%)
 create mode 100644 tests/functional/microblazeel/meson.build
 rename tests/functional/{test_microblazeel_s3adsp1800.py => microblazeel/test_s3adsp1800.py} (92%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e188de813fb..b6a835777bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1370,7 +1370,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
 F: include/hw/char/xilinx_uartlite.h
-F: tests/functional/test_microblaze*.py
+F: tests/functional/microblaze*/test_s3adsp1800.py
 
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index d32dd4a371f..fee68056145 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -17,6 +17,8 @@ subdir('hppa')
 subdir('i386')
 subdir('loongarch64')
 subdir('m68k')
+subdir('microblaze')
+subdir('microblazeel')
 
 test_mips_timeouts = {
   'mips_malta' : 480,
@@ -82,15 +84,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_microblaze_system_thorough = [
-  'microblaze_replay',
-  'microblaze_s3adsp1800'
-]
-
-tests_microblazeel_system_thorough = [
-  'microblazeel_s3adsp1800'
-]
-
 tests_mips_system_thorough = [
   'mips_malta',
   'mips_replay',
diff --git a/tests/functional/microblaze/meson.build b/tests/functional/microblaze/meson.build
new file mode 100644
index 00000000000..8069ca9be60
--- /dev/null
+++ b/tests/functional/microblaze/meson.build
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_microblaze_system_thorough = [
+  'replay',
+  's3adsp1800'
+]
diff --git a/tests/functional/test_microblaze_replay.py b/tests/functional/microblaze/test_replay.py
similarity index 100%
rename from tests/functional/test_microblaze_replay.py
rename to tests/functional/microblaze/test_replay.py
diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/microblaze/test_s3adsp1800.py
similarity index 100%
rename from tests/functional/test_microblaze_s3adsp1800.py
rename to tests/functional/microblaze/test_s3adsp1800.py
diff --git a/tests/functional/microblazeel/meson.build b/tests/functional/microblazeel/meson.build
new file mode 100644
index 00000000000..27619dc5a9a
--- /dev/null
+++ b/tests/functional/microblazeel/meson.build
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_microblazeel_system_thorough = [
+  's3adsp1800'
+]
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/microblazeel/test_s3adsp1800.py
similarity index 92%
rename from tests/functional/test_microblazeel_s3adsp1800.py
rename to tests/functional/microblazeel/test_s3adsp1800.py
index 915902d48bd..75ce8856ed1 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/microblazeel/test_s3adsp1800.py
@@ -7,7 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-from test_microblaze_s3adsp1800 import MicroblazeMachine
+from microblaze.test_s3adsp1800 import MicroblazeMachine
 
 
 class MicroblazeLittleEndianMachine(MicroblazeMachine):
-- 
2.47.2


