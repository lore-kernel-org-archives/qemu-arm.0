Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F0CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu56O-0008D9-7U; Thu, 04 Sep 2025 04:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54p-0006QO-7i
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54O-00045N-I1
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:13 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso89319366b.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973507; x=1757578307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGQiKrscvXmSE/ZaeZz/Ms8ug3SXVHjDAuhO1Inv93g=;
 b=QWnkzq4pz4omMvR8mjGq4hZrO0yaMB8EXLjfmfWZnMpJ2y+L+Oq4UI9IsCNg8AiujC
 ImNGai8ma3Pws21Kt/J9tLAYsozJ3FAbP7Ej6OXIZQvjMKM7RPJmMID3LEqkFJGRSaOZ
 5awRt+Cc0EpQtdkrZxTb1PlLUqw3tpfdbrB+NPybzTWzIdzXpyFSyD4xSVi/KsD+Mr+r
 Z4eP/GZ8YDH8OVL6m5GPQIMQOkz2cqlb9w4lk002iYdBhXmWysEtuqS2lGptpbJt4OnA
 OOxWD8BBKARBhCpfxBvqirTSPhjk9Aa97lLq+APGNfrKZVjIPIHPArm8ql1e3AYz59+f
 M8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973507; x=1757578307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGQiKrscvXmSE/ZaeZz/Ms8ug3SXVHjDAuhO1Inv93g=;
 b=i/vVS/bC0aSPaC3y9+QKk6tIBp35mURrkv8yd5zdnGpdw1kCj1deiN6J0f6jtpEPxb
 On3TiS2pVKZy9CBvrbL/pLsTnEe78+UcvqeH6XIx8J+jJ9rNurc+shZPQdou9o/lveHg
 fXmJAMvZwg3CAs7oHq1Y3lfi9/n9sEue2a+DNUbxSQnI3uC6kwdDZz8o+eHRQxjTWW0o
 qfqYcMyy1r52aROp+GDn1sgTIHIAm81J27i6iGJhqTprHppeiGeM2WKxvORSGCBS/RTi
 XueLj65JjTpVfEnMpFCQ1UKBwMsBG2koATd9AnbgEB681LROlH+91xIjGXPqjcDuOMS9
 mMfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr7kgsuLvKhqfJAn1Jsz85Itz0+GHC3mwED2ENRyX5YFxBZOEe8JVXUNK0vZv8XMVNZn3+PDtOeA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/tRI7znhPllojXDNIjdVVqbAzlpdsl1zhZi8dx5Caiwx6OeFw
 3LfbUTPx52neJGZ1mrXjsaX05yJOG8zd04hAJ20iqG9tuiltgHyKq5N0BKu6AdIiD04=
X-Gm-Gg: ASbGncvFqScXt6wyH+NzrNxWW9j5cSj92zgfrX9fD56JaRXM23RVIGIoyHCI9gRqt5W
 6r949S/k4Psx1IoBj3T9kR5/xfOVhlhg/lZ2tTgqhwxNnF3JqpEYDsu07gQL4eOaxbfYaC1zGE1
 bINFtj3fLNQmvqCDmeA7Ywbo6bWjFCoa/bmvVACR5rJF3uCjI+/onSDNAsXMkqpBO2QBt914t6Y
 tBPUv7L3lp52F10lznrV5tThArJ0zemHAPvHGjUJ357wJK/0I9437vA1z4H9sx5EIo550Xcmt/B
 4xlnnM/9e7J1KQQmzVWodSKa7hvfuI1E2LrzIuFzTBgSAxqNNZiCGKKvBQ8V3s8d0GBEFebTPBW
 UBd1XwyUZZ4NVUR0HJ2Fhkpk=
X-Google-Smtp-Source: AGHT+IHFPM9pyVJU+8glYre57yPnROcI/WuO+kimcG6EIXNqq+kaC27RdId8bq8rQFzCf1HLoaPs5g==
X-Received: by 2002:a17:907:bb8b:b0:b04:1d07:40de with SMTP id
 a640c23a62f3a-b041d074816mr1360140566b.23.1756973506445; 
 Thu, 04 Sep 2025 01:11:46 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0409bf055esm1238864166b.85.2025.09.04.01.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3BFD65FA42;
 Thu, 04 Sep 2025 09:11:30 +0100 (BST)
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
Subject: [PATCH v2 017/281] tests/functional: Move aarch64 tests into
 architecture specific folder
Date: Thu,  4 Sep 2025 09:06:51 +0100
Message-ID: <20250904081128.1942269-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

The tests/functional folder has become quite crowded already, some
restructuring would be helpful here. Thus move the aarch64 tests into
a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-6-thuth@redhat.com>
---
 MAINTAINERS                                   | 24 +++++-----
 tests/functional/aarch64/meson.build          | 48 +++++++++++++++++++
 .../test_aspeed_ast2700.py}                   |  0
 .../test_aspeed_ast2700fc.py}                 |  0
 .../test_device_passthrough.py}               |  0
 .../test_hotplug_pci.py}                      |  0
 .../test_imx8mp_evk.py}                       |  0
 .../test_kvm.py}                              |  0
 .../test_migration.py}                        |  0
 .../test_multiprocess.py}                     |  0
 .../test_raspi3.py}                           |  0
 .../test_raspi4.py}                           |  0
 .../test_replay.py}                           |  0
 .../test_reverse_debug.py}                    |  0
 .../test_rme_sbsaref.py}                      |  2 +-
 .../test_rme_virt.py}                         |  0
 .../test_sbsaref.py}                          |  0
 .../test_sbsaref_alpine.py}                   |  2 +-
 .../test_sbsaref_freebsd.py}                  |  2 +-
 .../test_smmu.py}                             |  0
 .../test_tcg_plugins.py}                      |  0
 .../test_tuxrun.py}                           |  0
 .../test_virt.py}                             |  0
 .../test_virt_gpu.py}                         |  0
 .../test_xen.py}                              |  0
 .../test_xlnx_versal.py}                      |  0
 tests/functional/meson.build                  | 48 +------------------
 27 files changed, 64 insertions(+), 62 deletions(-)
 create mode 100644 tests/functional/aarch64/meson.build
 rename tests/functional/{test_aarch64_aspeed_ast2700.py => aarch64/test_aspeed_ast2700.py} (100%)
 rename tests/functional/{test_aarch64_aspeed_ast2700fc.py => aarch64/test_aspeed_ast2700fc.py} (100%)
 rename tests/functional/{test_aarch64_device_passthrough.py => aarch64/test_device_passthrough.py} (100%)
 rename tests/functional/{test_aarch64_hotplug_pci.py => aarch64/test_hotplug_pci.py} (100%)
 rename tests/functional/{test_aarch64_imx8mp_evk.py => aarch64/test_imx8mp_evk.py} (100%)
 rename tests/functional/{test_aarch64_kvm.py => aarch64/test_kvm.py} (100%)
 rename tests/functional/{test_aarch64_migration.py => aarch64/test_migration.py} (100%)
 rename tests/functional/{test_aarch64_multiprocess.py => aarch64/test_multiprocess.py} (100%)
 rename tests/functional/{test_aarch64_raspi3.py => aarch64/test_raspi3.py} (100%)
 rename tests/functional/{test_aarch64_raspi4.py => aarch64/test_raspi4.py} (100%)
 rename tests/functional/{test_aarch64_replay.py => aarch64/test_replay.py} (100%)
 rename tests/functional/{test_aarch64_reverse_debug.py => aarch64/test_reverse_debug.py} (100%)
 rename tests/functional/{test_aarch64_rme_sbsaref.py => aarch64/test_rme_sbsaref.py} (98%)
 rename tests/functional/{test_aarch64_rme_virt.py => aarch64/test_rme_virt.py} (100%)
 rename tests/functional/{test_aarch64_sbsaref.py => aarch64/test_sbsaref.py} (100%)
 rename tests/functional/{test_aarch64_sbsaref_alpine.py => aarch64/test_sbsaref_alpine.py} (97%)
 rename tests/functional/{test_aarch64_sbsaref_freebsd.py => aarch64/test_sbsaref_freebsd.py} (97%)
 rename tests/functional/{test_aarch64_smmu.py => aarch64/test_smmu.py} (100%)
 rename tests/functional/{test_aarch64_tcg_plugins.py => aarch64/test_tcg_plugins.py} (100%)
 rename tests/functional/{test_aarch64_tuxrun.py => aarch64/test_tuxrun.py} (100%)
 rename tests/functional/{test_aarch64_virt.py => aarch64/test_virt.py} (100%)
 rename tests/functional/{test_aarch64_virt_gpu.py => aarch64/test_virt_gpu.py} (100%)
 rename tests/functional/{test_aarch64_xen.py => aarch64/test_xen.py} (100%)
 rename tests/functional/{test_aarch64_xlnx_versal.py => aarch64/test_xlnx_versal.py} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index adbed9df2fc..a2a5ccea7b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -212,7 +212,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
-F: tests/functional/test_aarch64_smmu.py
+F: tests/functional/aarch64/test_smmu.py
 
 AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
@@ -874,7 +874,7 @@ F: include/hw/arm/fsl-imx8mp.h
 F: include/hw/misc/imx8mp_*.h
 F: include/hw/pci-host/fsl_imx8m_phy.h
 F: docs/system/arm/imx8mp-evk.rst
-F: tests/functional/test_aarch64_imx8mp_evk.py
+F: tests/functional/aarch64/test_imx8mp_evk.py
 F: tests/qtest/rs5c372-test.c
 
 MPS2 / MPS3
@@ -952,8 +952,7 @@ F: include/hw/arm/rasp*
 F: include/hw/*/bcm283*
 F: docs/system/arm/raspi.rst
 F: tests/functional/test_arm_raspi2.py
-F: tests/functional/test_aarch64_raspi3.py
-F: tests/functional/test_aarch64_raspi4.py
+F: tests/functional/aarch64/test_raspi*.py
 
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -993,7 +992,7 @@ F: hw/misc/sbsa_ec.c
 F: hw/watchdog/sbsa_gwdt.c
 F: include/hw/watchdog/sbsa_gwdt.h
 F: docs/system/arm/sbsa.rst
-F: tests/functional/test_aarch64_*sbsaref*.py
+F: tests/functional/aarch64/test_*sbsaref*.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -1063,8 +1062,8 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
-F: tests/functional/test_aarch64_*virt*.py
-F: tests/functional/test_aarch64_tuxrun.py
+F: tests/functional/aarch64/test_*virt*.py
+F: tests/functional/aarch64/test_tuxrun.py
 F: tests/functional/test_arm_tuxrun.py
 F: tests/functional/test_arm_virt.py
 
@@ -1096,7 +1095,7 @@ F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
 F: docs/system/arm/xlnx-zcu102.rst
-F: tests/functional/test_aarch64_xlnx_versal.py
+F: tests/functional/aarch64/test_xlnx_versal.py
 
 Xilinx Versal OSPI
 M: Francisco Iglesias <francisco.iglesias@amd.com>
@@ -2109,7 +2108,7 @@ ARM PCI Hotplug
 M: Gustavo Romero <gustavo.romero@linaro.org>
 L: qemu-arm@nongnu.org
 S: Supported
-F: tests/functional/test_aarch64_hotplug_pci.py
+F: tests/functional/aarch64/test_hotplug_pci.py
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
@@ -2263,6 +2262,7 @@ F: util/vfio-helpers.c
 F: include/hw/vfio/
 F: docs/devel/migration/vfio.rst
 F: qapi/vfio.json
+F: tests/functional/aarch64/test_device_passthrough.py
 
 vfio-igd
 M: Alex Williamson <alex.williamson@redhat.com>
@@ -2638,7 +2638,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
-F: tests/functional/test_aarch64_xen.py
+F: tests/functional/aarch64/test_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
@@ -2707,7 +2707,7 @@ F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
 F: docs/system/devices/virtio-gpu.rst
-F: tests/functional/test_aarch64_virt_gpu.py
+F: tests/functional/aarch64/test_virt_gpu.py
 
 vhost-user-blk
 M: Raphael Norwitz <raphael@enfabrica.net>
@@ -3933,7 +3933,7 @@ S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
 F: tests/tcg/plugins/
-F: tests/functional/test_aarch64_tcg_plugins.py
+F: tests/functional/aarch64/test_tcg_plugins.py
 F: contrib/plugins/
 F: scripts/qemu-plugin-symbols.py
 
diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarch64/meson.build
new file mode 100644
index 00000000000..04846c6eb18
--- /dev/null
+++ b/tests/functional/aarch64/meson.build
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+test_aarch64_timeouts = {
+  'aspeed_ast2700' : 600,
+  'aspeed_ast2700fc' : 600,
+  'device_passthrough' : 720,
+  'imx8mp_evk' : 240,
+  'raspi4' : 480,
+  'reverse_debug' : 180,
+  'rme_virt' : 1200,
+  'rme_sbsaref' : 1200,
+  'sbsaref_alpine' : 1200,
+  'sbsaref_freebsd' : 720,
+  'smmu' : 720,
+  'tuxrun' : 240,
+  'virt' : 360,
+  'virt_gpu' : 480,
+}
+
+tests_aarch64_system_quick = [
+  'migration',
+]
+
+tests_aarch64_system_thorough = [
+  'aspeed_ast2700',
+  'aspeed_ast2700fc',
+  'device_passthrough',
+  'hotplug_pci',
+  'imx8mp_evk',
+  'kvm',
+  'multiprocess',
+  'raspi3',
+  'raspi4',
+  'replay',
+  'reverse_debug',
+  'rme_virt',
+  'rme_sbsaref',
+  'sbsaref',
+  'sbsaref_alpine',
+  'sbsaref_freebsd',
+  'smmu',
+  'tcg_plugins',
+  'tuxrun',
+  'virt',
+  'virt_gpu',
+  'xen',
+  'xlnx_versal',
+]
diff --git a/tests/functional/test_aarch64_aspeed_ast2700.py b/tests/functional/aarch64/test_aspeed_ast2700.py
similarity index 100%
rename from tests/functional/test_aarch64_aspeed_ast2700.py
rename to tests/functional/aarch64/test_aspeed_ast2700.py
diff --git a/tests/functional/test_aarch64_aspeed_ast2700fc.py b/tests/functional/aarch64/test_aspeed_ast2700fc.py
similarity index 100%
rename from tests/functional/test_aarch64_aspeed_ast2700fc.py
rename to tests/functional/aarch64/test_aspeed_ast2700fc.py
diff --git a/tests/functional/test_aarch64_device_passthrough.py b/tests/functional/aarch64/test_device_passthrough.py
similarity index 100%
rename from tests/functional/test_aarch64_device_passthrough.py
rename to tests/functional/aarch64/test_device_passthrough.py
diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/aarch64/test_hotplug_pci.py
similarity index 100%
rename from tests/functional/test_aarch64_hotplug_pci.py
rename to tests/functional/aarch64/test_hotplug_pci.py
diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/aarch64/test_imx8mp_evk.py
similarity index 100%
rename from tests/functional/test_aarch64_imx8mp_evk.py
rename to tests/functional/aarch64/test_imx8mp_evk.py
diff --git a/tests/functional/test_aarch64_kvm.py b/tests/functional/aarch64/test_kvm.py
similarity index 100%
rename from tests/functional/test_aarch64_kvm.py
rename to tests/functional/aarch64/test_kvm.py
diff --git a/tests/functional/test_aarch64_migration.py b/tests/functional/aarch64/test_migration.py
similarity index 100%
rename from tests/functional/test_aarch64_migration.py
rename to tests/functional/aarch64/test_migration.py
diff --git a/tests/functional/test_aarch64_multiprocess.py b/tests/functional/aarch64/test_multiprocess.py
similarity index 100%
rename from tests/functional/test_aarch64_multiprocess.py
rename to tests/functional/aarch64/test_multiprocess.py
diff --git a/tests/functional/test_aarch64_raspi3.py b/tests/functional/aarch64/test_raspi3.py
similarity index 100%
rename from tests/functional/test_aarch64_raspi3.py
rename to tests/functional/aarch64/test_raspi3.py
diff --git a/tests/functional/test_aarch64_raspi4.py b/tests/functional/aarch64/test_raspi4.py
similarity index 100%
rename from tests/functional/test_aarch64_raspi4.py
rename to tests/functional/aarch64/test_raspi4.py
diff --git a/tests/functional/test_aarch64_replay.py b/tests/functional/aarch64/test_replay.py
similarity index 100%
rename from tests/functional/test_aarch64_replay.py
rename to tests/functional/aarch64/test_replay.py
diff --git a/tests/functional/test_aarch64_reverse_debug.py b/tests/functional/aarch64/test_reverse_debug.py
similarity index 100%
rename from tests/functional/test_aarch64_reverse_debug.py
rename to tests/functional/aarch64/test_reverse_debug.py
diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/aarch64/test_rme_sbsaref.py
similarity index 98%
rename from tests/functional/test_aarch64_rme_sbsaref.py
rename to tests/functional/aarch64/test_rme_sbsaref.py
index 746770e776d..100f1c7738b 100755
--- a/tests/functional/test_aarch64_rme_sbsaref.py
+++ b/tests/functional/aarch64/test_rme_sbsaref.py
@@ -13,7 +13,7 @@
 
 from qemu_test import QemuSystemTest, Asset, wait_for_console_pattern
 from qemu_test import exec_command_and_wait_for_pattern
-from test_aarch64_rme_virt import test_realms_guest
+from test_rme_virt import test_realms_guest
 
 
 class Aarch64RMESbsaRefMachine(QemuSystemTest):
diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/aarch64/test_rme_virt.py
similarity index 100%
rename from tests/functional/test_aarch64_rme_virt.py
rename to tests/functional/aarch64/test_rme_virt.py
diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/aarch64/test_sbsaref.py
similarity index 100%
rename from tests/functional/test_aarch64_sbsaref.py
rename to tests/functional/aarch64/test_sbsaref.py
diff --git a/tests/functional/test_aarch64_sbsaref_alpine.py b/tests/functional/aarch64/test_sbsaref_alpine.py
similarity index 97%
rename from tests/functional/test_aarch64_sbsaref_alpine.py
rename to tests/functional/aarch64/test_sbsaref_alpine.py
index 87769993831..abb8f5114bd 100755
--- a/tests/functional/test_aarch64_sbsaref_alpine.py
+++ b/tests/functional/aarch64/test_sbsaref_alpine.py
@@ -12,7 +12,7 @@
 
 from qemu_test import QemuSystemTest, Asset, skipSlowTest
 from qemu_test import wait_for_console_pattern
-from test_aarch64_sbsaref import fetch_firmware
+from test_sbsaref import fetch_firmware
 
 
 class Aarch64SbsarefAlpine(QemuSystemTest):
diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py b/tests/functional/aarch64/test_sbsaref_freebsd.py
similarity index 97%
rename from tests/functional/test_aarch64_sbsaref_freebsd.py
rename to tests/functional/aarch64/test_sbsaref_freebsd.py
index 7ef016fba62..3b942f7795c 100755
--- a/tests/functional/test_aarch64_sbsaref_freebsd.py
+++ b/tests/functional/aarch64/test_sbsaref_freebsd.py
@@ -12,7 +12,7 @@
 
 from qemu_test import QemuSystemTest, Asset, skipSlowTest
 from qemu_test import wait_for_console_pattern
-from test_aarch64_sbsaref import fetch_firmware
+from test_sbsaref import fetch_firmware
 
 
 class Aarch64SbsarefFreeBSD(QemuSystemTest):
diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/aarch64/test_smmu.py
similarity index 100%
rename from tests/functional/test_aarch64_smmu.py
rename to tests/functional/aarch64/test_smmu.py
diff --git a/tests/functional/test_aarch64_tcg_plugins.py b/tests/functional/aarch64/test_tcg_plugins.py
similarity index 100%
rename from tests/functional/test_aarch64_tcg_plugins.py
rename to tests/functional/aarch64/test_tcg_plugins.py
diff --git a/tests/functional/test_aarch64_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
similarity index 100%
rename from tests/functional/test_aarch64_tuxrun.py
rename to tests/functional/aarch64/test_tuxrun.py
diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/aarch64/test_virt.py
similarity index 100%
rename from tests/functional/test_aarch64_virt.py
rename to tests/functional/aarch64/test_virt.py
diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/aarch64/test_virt_gpu.py
similarity index 100%
rename from tests/functional/test_aarch64_virt_gpu.py
rename to tests/functional/aarch64/test_virt_gpu.py
diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/aarch64/test_xen.py
similarity index 100%
rename from tests/functional/test_aarch64_xen.py
rename to tests/functional/aarch64/test_xen.py
diff --git a/tests/functional/test_aarch64_xlnx_versal.py b/tests/functional/aarch64/test_xlnx_versal.py
similarity index 100%
rename from tests/functional/test_aarch64_xlnx_versal.py
rename to tests/functional/aarch64/test_xlnx_versal.py
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 8c24ac1cc2d..9cb6325360f 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -9,23 +9,7 @@ if get_option('tcg_interpreter')
   subdir_done()
 endif
 
-# Timeouts for individual tests that can be slow e.g. with debugging enabled
-test_aarch64_timeouts = {
-  'aarch64_aspeed_ast2700' : 600,
-  'aarch64_aspeed_ast2700fc' : 600,
-  'aarch64_device_passthrough' : 720,
-  'aarch64_imx8mp_evk' : 240,
-  'aarch64_raspi4' : 480,
-  'aarch64_reverse_debug' : 180,
-  'aarch64_rme_virt' : 1200,
-  'aarch64_rme_sbsaref' : 1200,
-  'aarch64_sbsaref_alpine' : 1200,
-  'aarch64_sbsaref_freebsd' : 720,
-  'aarch64_smmu' : 720,
-  'aarch64_tuxrun' : 240,
-  'aarch64_virt' : 360,
-  'aarch64_virt_gpu' : 480,
-}
+subdir('aarch64')
 
 test_arm_timeouts = {
   'arm_aspeed_palmetto' : 120,
@@ -112,36 +96,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_aarch64_system_quick = [
-  'aarch64_migration',
-]
-
-tests_aarch64_system_thorough = [
-  'aarch64_aspeed_ast2700',
-  'aarch64_aspeed_ast2700fc',
-  'aarch64_device_passthrough',
-  'aarch64_hotplug_pci',
-  'aarch64_imx8mp_evk',
-  'aarch64_kvm',
-  'aarch64_multiprocess',
-  'aarch64_raspi3',
-  'aarch64_raspi4',
-  'aarch64_replay',
-  'aarch64_reverse_debug',
-  'aarch64_rme_virt',
-  'aarch64_rme_sbsaref',
-  'aarch64_sbsaref',
-  'aarch64_sbsaref_alpine',
-  'aarch64_sbsaref_freebsd',
-  'aarch64_smmu',
-  'aarch64_tcg_plugins',
-  'aarch64_tuxrun',
-  'aarch64_virt',
-  'aarch64_virt_gpu',
-  'aarch64_xen',
-  'aarch64_xlnx_versal',
-]
-
 tests_alpha_system_quick = [
   'alpha_migration',
 ]
-- 
2.47.2


