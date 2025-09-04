Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40160CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu58J-0001wh-UZ; Thu, 04 Sep 2025 04:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54x-0006VW-FT
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:25 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54T-00048d-CC
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:21 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso124030466b.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973512; x=1757578312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6t+p8GOgjhvQY+BqPqQ3Q/gGWWqVMPzMSTGgeOugcs=;
 b=nxTu2LklQL4gZK5r10sAT93rmbArAmAvp52GtsBJ6ql+2XQUWVMprLUbJkCN2GZhci
 xlQ1QYqMzir1tTQoI4UyvzsQsVu7FwykDKB8v6bwW2A64SYJTHnDPnJpspkVYA5xOev+
 sz+m0LMNGn+Mo3r3Y8av0LMxAwnKmAaxb6cL0zRede/bY7w7FzVrUS4pPHXOIHsS2gMn
 zLD+0QkcUrggbDHWXPPPY7VLhNPZWcS11nf6StX5UhiYCMgG2uHqlRTKLezf+c577/vf
 tjw8Sbc+J3A7VNT1n9EkyfIcuETnzCRDWjQvJqm7du6Xh4BfPEU/xD4JhYdkXiaYZBqY
 1Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973512; x=1757578312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6t+p8GOgjhvQY+BqPqQ3Q/gGWWqVMPzMSTGgeOugcs=;
 b=gpQaAVUbN5KIZ6JPPJO8W6mJSROfsFP6A4dG4sAOpczO7DmtZI6+f8DyIRZsYd5FwK
 m1pSyoUoCbNtxEmQWNVU6FxiqPDWlIkROpgtfML1ZaCfOz+kyn5B4iDAyZQBT6caPUW1
 g49k3YlexnkT5Lj5rAl3YxW0pHK4fprCtr9geXxt2qUiH2U6LhtyAIlOMGNq67H3dMc9
 5b0tsndqMBUbOMBiQgP0bBC0FzHmT60deV4/XQHEM+dc0IXc19e8JLBGVZlrPFgFp5qw
 4tknvE0vd63ddeI36sSY5K7982QcGuakiQV9s+8eIW4hUyaO7yBaEE+1uXhCh1x66k6G
 YSsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLEKiuv/DEFtVN2BXtNVQXyS61kw7X0KwQRugZ8L5dJnQsjgj3hyIo86ODXQMfqI15bXWO4N3z4A==@nongnu.org
X-Gm-Message-State: AOJu0Yz9ByMeKqrwUK0VAbAnl0CkBkiLZrqFsCijBfBZ+8RxoP+ZRGmX
 MTohj0+NS1Kx47RxL74jd+FTqBGjTi6IpYnHeEWDzqszsG02cdpSRT3ms2AV2HA503Q=
X-Gm-Gg: ASbGncuTV8Uce3P5e+OHwSGJKosoKqvulB7syeH4Bjti1RV45UUPNWBQw7z85P4ksJq
 slZc/wIWGFC8jYcY96TM8G80J916dKP2OV07luf9slle+NmuPAa81DgONfcFI9N8Lo5gnQnobRQ
 PEtaLVo4cGkao4SixyBSou1SBPdDY+UdIMw42zvmUQu9jiGtIl2TN22YyEb+ew8h4jEyulpybB7
 +uLp7xEI3foXpHs50YJW6/YlEPuCqvLE2k+ZIPLWuJLGq/essTvyQGu1e9CxpcX3rD/q9Gh946E
 ndlubaeqaZAVB7DUnVb7NcLM/xoXRHCBGG/ZTdGCIdiLbS/+obH35iyWUAHmXZB/bwSzhKB6G5G
 Wy6AKq90l9f62jq+bYGcCPbKo0OxGPVC+dA==
X-Google-Smtp-Source: AGHT+IGs9IFC2MqlanPqq9Em5B426D0kzqXXfRSpZpCnpllr2COQwDaPn9fFf5H2072+YVpPFQfweQ==
X-Received: by 2002:a17:907:3d0b:b0:adb:428f:f748 with SMTP id
 a640c23a62f3a-b01d8a72fddmr1793943566b.21.1756973511490; 
 Thu, 04 Sep 2025 01:11:51 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046af12536sm324245966b.100.2025.09.04.01.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3FB8D600AF;
 Thu, 04 Sep 2025 09:11:32 +0100 (BST)
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
Subject: [PATCH v2 033/281] tests/functional: Move sparc/sparc64 tests into
 target-specific folders
Date: Thu,  4 Sep 2025 09:07:07 +0100
Message-ID: <20250904081128.1942269-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
sparc tests into a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-22-thuth@redhat.com>
---
 MAINTAINERS                                   |  6 +++---
 tests/functional/meson.build                  | 20 ++-----------------
 tests/functional/sparc/meson.build            | 10 ++++++++++
 .../test_migration.py}                        |  0
 .../test_replay.py}                           |  0
 .../test_sun4m.py}                            |  0
 tests/functional/sparc64/meson.build          | 10 ++++++++++
 .../test_migration.py}                        |  0
 .../test_sun4u.py}                            |  0
 .../test_tuxrun.py}                           |  0
 10 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 tests/functional/sparc/meson.build
 rename tests/functional/{test_sparc_migration.py => sparc/test_migration.py} (100%)
 rename tests/functional/{test_sparc_replay.py => sparc/test_replay.py} (100%)
 rename tests/functional/{test_sparc_sun4m.py => sparc/test_sun4m.py} (100%)
 create mode 100644 tests/functional/sparc64/meson.build
 rename tests/functional/{test_sparc64_migration.py => sparc64/test_migration.py} (100%)
 rename tests/functional/{test_sparc64_sun4u.py => sparc64/test_sun4u.py} (100%)
 rename tests/functional/{test_sparc64_tuxrun.py => sparc64/test_tuxrun.py} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index eddec0058e0..b46445ff5c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1755,7 +1755,7 @@ F: include/hw/nvram/sun_nvram.h
 F: include/hw/sparc/sparc32_dma.h
 F: include/hw/sparc/sun4m_iommu.h
 F: pc-bios/openbios-sparc32
-F: tests/functional/test_sparc_sun4m.py
+F: tests/functional/sparc/test_sun4m.py
 
 Sun4u
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
@@ -1768,8 +1768,8 @@ F: include/hw/pci-host/sabre.h
 F: hw/pci-bridge/simba.c
 F: include/hw/pci-bridge/simba.h
 F: pc-bios/openbios-sparc64
-F: tests/functional/test_sparc64_sun4u.py
-F: tests/functional/test_sparc64_tuxrun.py
+F: tests/functional/sparc64/test_sun4u.py
+F: tests/functional/sparc64/test_tuxrun.py
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index ce713509e32..00d18dba3ce 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -32,6 +32,8 @@ subdir('rx')
 subdir('s390x')
 subdir('sh4')
 subdir('sh4eb')
+subdir('sparc')
+subdir('sparc64')
 
 test_x86_64_timeouts = {
   'acpi_bits' : 420,
@@ -54,24 +56,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_sparc_system_quick = [
-  'sparc_migration',
-]
-
-tests_sparc_system_thorough = [
-  'sparc_replay',
-  'sparc_sun4m',
-]
-
-tests_sparc64_system_quick = [
-  'sparc64_migration',
-]
-
-tests_sparc64_system_thorough = [
-  'sparc64_sun4u',
-  'sparc64_tuxrun',
-]
-
 tests_x86_64_system_quick = [
   'cpu_queries',
   'mem_addr_space',
diff --git a/tests/functional/sparc/meson.build b/tests/functional/sparc/meson.build
new file mode 100644
index 00000000000..88732becd81
--- /dev/null
+++ b/tests/functional/sparc/meson.build
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_sparc_system_quick = [
+  'migration',
+]
+
+tests_sparc_system_thorough = [
+  'replay',
+  'sun4m',
+]
diff --git a/tests/functional/test_sparc_migration.py b/tests/functional/sparc/test_migration.py
similarity index 100%
rename from tests/functional/test_sparc_migration.py
rename to tests/functional/sparc/test_migration.py
diff --git a/tests/functional/test_sparc_replay.py b/tests/functional/sparc/test_replay.py
similarity index 100%
rename from tests/functional/test_sparc_replay.py
rename to tests/functional/sparc/test_replay.py
diff --git a/tests/functional/test_sparc_sun4m.py b/tests/functional/sparc/test_sun4m.py
similarity index 100%
rename from tests/functional/test_sparc_sun4m.py
rename to tests/functional/sparc/test_sun4m.py
diff --git a/tests/functional/sparc64/meson.build b/tests/functional/sparc64/meson.build
new file mode 100644
index 00000000000..2e04e7d4f3d
--- /dev/null
+++ b/tests/functional/sparc64/meson.build
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_sparc64_system_quick = [
+  'migration',
+]
+
+tests_sparc64_system_thorough = [
+  'sun4u',
+  'tuxrun',
+]
diff --git a/tests/functional/test_sparc64_migration.py b/tests/functional/sparc64/test_migration.py
similarity index 100%
rename from tests/functional/test_sparc64_migration.py
rename to tests/functional/sparc64/test_migration.py
diff --git a/tests/functional/test_sparc64_sun4u.py b/tests/functional/sparc64/test_sun4u.py
similarity index 100%
rename from tests/functional/test_sparc64_sun4u.py
rename to tests/functional/sparc64/test_sun4u.py
diff --git a/tests/functional/test_sparc64_tuxrun.py b/tests/functional/sparc64/test_tuxrun.py
similarity index 100%
rename from tests/functional/test_sparc64_tuxrun.py
rename to tests/functional/sparc64/test_tuxrun.py
-- 
2.47.2


