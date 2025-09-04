Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A14CA1015
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu5Cg-0003aL-76; Thu, 04 Sep 2025 04:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5BB-0001J0-Ns
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:18:51 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu5B2-0008DY-1h
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:18:49 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0454d63802so118010366b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973916; x=1757578716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1Jmcmvj/wxtRZkBbPu5k8WLatNgN3qwXd3zyWr/Gsg=;
 b=XlKsrC6N86VatB7Pv+USBJ51emZqNq+dVYxkeXz4mJANtxrCJxQdZofoOaV1Or0n/C
 l/bIf+golt3HKWn9J6j95cxOtjucfkex2KDrPbcZk3Kg72O/SDkvafE9oRJC+cdViFBN
 bPFsNg9nMErkBBKV426Q/CkA/4cLt0FmuSbsIBkYkvls8VayiCaNcLLKmzDAfV4mBYYY
 IwESvhQ0wq+68Gfs1qvO9csipczCmQdYFXuFN7hGybp1vWackyudXJMpWj/e3NNATfKt
 EgwwEzYlJo7CzM3DDcFXH2xN+4s1+3mfyShJtBz+j9dwIVs1iG7U9aysUfVaKWXcGRa2
 UpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973916; x=1757578716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1Jmcmvj/wxtRZkBbPu5k8WLatNgN3qwXd3zyWr/Gsg=;
 b=RYRzfvxwNCfuEXRuO8cC+Uk1ooErjF683tOJETnUCs8sssQHy/sr9d4A8ezXQHZ9ie
 EcRlPN75CVIA8Ud8zx/QvXJfJc+9At5551EJMlUmBzESX4PSJ2o8lnZ3UyvrGGCUxL7+
 2ZdkZa1VWChzut5KXLga2DoUIr7XaG33CK+jA5Z0X1yTSEC66YT1Bm97SO4iTvTTfrnU
 VcJ6TkU04/8gIlv2bfq+LkDJ2J2Ne6fg20AJ4o1LUM0aUOvPH9lwRn8CJB0tXkOhGsfD
 2bu42FvZ9h7tBWwcjtjY0e5o+V7C11nbszf9FqgHglZ+tPsj9E26RGXSQZV7M0S9h7hk
 /CXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Ds/fulZTbeczv/FWw2UFRHlNaq/0lLjP6rWD2UJahZG9acOHuqCp96vSvuY8mNG00PRhOEJLDA==@nongnu.org
X-Gm-Message-State: AOJu0YxSqeTewWvJsMKxpWO/7hg+P+evBMJYTyaUi1l0R90YETeGmKfD
 1rqie8XB705VTcqrKnlDhozfQYzwgZvcy+oj3mqvxCXTezRyCtEEUt8pfZ6QpHreN0g=
X-Gm-Gg: ASbGncspmTeqlkppCK8mVoHEfswlSNJwEHDzo9fMfpYAw9J2ZICI0ea5HlgfKtKZO1l
 Z77JmxTcOUrftbAN/u1j/lb8RLPYraCf0h6SEz4pjOBVm0//HZaYg+W1joiyM+AnKmaRY17MxhI
 u+Z6/ce6r062eflGVPS6nqVNbjmX46udRQQdCF0L7uCzH9hOKO8aMJ1ugvnqSYYaJgv+cEK21V9
 XtMGGeBjOLK9ayVr/9dxGEUGqV6MTjf6Ca3rvs8GmfOoR6fcpya9ILvYlk7CIIOJDzaBtK0w4QK
 8VkMxulQd5DsjJADDfkiQnr1y+zG+UL/MBvMLuLEEFpt/ife3kcxDl0AIoSZxJV6h+2mNDDX2BV
 C/Nx7qOTxINsigBPbWn6JsPs=
X-Google-Smtp-Source: AGHT+IFSq9FPmAW+RG3aNBrh7jqMJP5WqqG1j3FRfX8nqFloJY+Lja8hHy+8ATaWdgq0oL58P4S6xg==
X-Received: by 2002:a17:907:961a:b0:b04:2edd:280b with SMTP id
 a640c23a62f3a-b042edd2a50mr1480660766b.39.1756973915613; 
 Thu, 04 Sep 2025 01:18:35 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047373afcesm232990066b.57.2025.09.04.01.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:18:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5F91E60135;
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
Subject: [PATCH v2 034/281] tests/functional: Move x86_64 tests into
 target-specific folder
Date: Thu,  4 Sep 2025 09:07:08 +0100
Message-ID: <20250904081128.1942269-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
x86_64 tests into a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-23-thuth@redhat.com>
---
 MAINTAINERS                                   | 32 ++++++++--------
 tests/functional/meson.build                  | 37 +------------------
 tests/functional/x86_64/meson.build           | 37 +++++++++++++++++++
 .../functional/{ => x86_64}/test_acpi_bits.py |  0
 .../test_cpu_model_versions.py}               |  0
 .../{ => x86_64}/test_cpu_queries.py          |  0
 .../test_hotplug_blk.py}                      |  0
 .../test_hotplug_cpu.py}                      |  0
 .../{ => x86_64}/test_intel_iommu.py          |  0
 .../test_kvm_xen.py}                          |  0
 .../{ => x86_64}/test_linux_initrd.py         |  0
 .../{ => x86_64}/test_mem_addr_space.py       |  0
 tests/functional/{ => x86_64}/test_memlock.py |  0
 .../test_migration.py}                        |  0
 .../test_multiprocess.py}                     |  0
 .../{ => x86_64}/test_netdev_ethtool.py       |  0
 .../{ => x86_64}/test_pc_cpu_hotplug_props.py |  0
 .../test_replay.py}                           |  0
 .../test_reverse_debug.py}                    |  0
 .../test_tuxrun.py}                           |  0
 .../{ => x86_64}/test_virtio_balloon.py       |  0
 .../{ => x86_64}/test_virtio_gpu.py           |  0
 .../{ => x86_64}/test_virtio_version.py       |  0
 23 files changed, 55 insertions(+), 51 deletions(-)
 create mode 100644 tests/functional/x86_64/meson.build
 rename tests/functional/{ => x86_64}/test_acpi_bits.py (100%)
 rename tests/functional/{test_x86_cpu_model_versions.py => x86_64/test_cpu_model_versions.py} (100%)
 rename tests/functional/{ => x86_64}/test_cpu_queries.py (100%)
 rename tests/functional/{test_x86_64_hotplug_blk.py => x86_64/test_hotplug_blk.py} (100%)
 rename tests/functional/{test_x86_64_hotplug_cpu.py => x86_64/test_hotplug_cpu.py} (100%)
 rename tests/functional/{ => x86_64}/test_intel_iommu.py (100%)
 rename tests/functional/{test_x86_64_kvm_xen.py => x86_64/test_kvm_xen.py} (100%)
 rename tests/functional/{ => x86_64}/test_linux_initrd.py (100%)
 rename tests/functional/{ => x86_64}/test_mem_addr_space.py (100%)
 rename tests/functional/{ => x86_64}/test_memlock.py (100%)
 rename tests/functional/{test_x86_64_migration.py => x86_64/test_migration.py} (100%)
 rename tests/functional/{test_x86_64_multiprocess.py => x86_64/test_multiprocess.py} (100%)
 rename tests/functional/{ => x86_64}/test_netdev_ethtool.py (100%)
 rename tests/functional/{ => x86_64}/test_pc_cpu_hotplug_props.py (100%)
 rename tests/functional/{test_x86_64_replay.py => x86_64/test_replay.py} (100%)
 rename tests/functional/{test_x86_64_reverse_debug.py => x86_64/test_reverse_debug.py} (100%)
 rename tests/functional/{test_x86_64_tuxrun.py => x86_64/test_tuxrun.py} (100%)
 rename tests/functional/{ => x86_64}/test_virtio_balloon.py (100%)
 rename tests/functional/{ => x86_64}/test_virtio_gpu.py (100%)
 rename tests/functional/{ => x86_64}/test_virtio_version.py (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b46445ff5c0..7b1a94f696c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -147,6 +147,7 @@ F: target/i386/Kconfig
 F: target/i386/meson.build
 F: tools/i386/
 F: tests/functional/i386/
+F: tests/functional/x86_64/
 
 Guest CPU cores (TCG)
 ---------------------
@@ -483,7 +484,7 @@ F: docs/system/i386/sgx.rst
 F: target/i386/kvm/
 F: target/i386/sev*
 F: scripts/kvm/vmxcap
-F: tests/functional/test_x86_64_hotplug_cpu.py
+F: tests/functional/x86_64/test_hotplug_cpu.py
 
 Xen emulation on X86 KVM CPUs
 M: David Woodhouse <dwmw2@infradead.org>
@@ -492,7 +493,7 @@ S: Supported
 F: include/system/kvm_xen.h
 F: target/i386/kvm/xen*
 F: hw/i386/kvm/xen*
-F: tests/functional/test_x86_64_kvm_xen.py
+F: tests/functional/x86_64/test_kvm_xen.py
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
@@ -1894,11 +1895,11 @@ F: include/hw/isa/apm.h
 F: tests/unit/test-x86-topo.c
 F: tests/qtest/test-x86-cpuid-compat.c
 F: tests/functional/i386/test_tuxrun.py
-F: tests/functional/test_linux_initrd.py
-F: tests/functional/test_mem_addr_space.py
-F: tests/functional/test_pc_cpu_hotplug_props.py
-F: tests/functional/test_x86_64_tuxrun.py
-F: tests/functional/test_x86_cpu_model_versions.py
+F: tests/functional/x86_64/test_linux_initrd.py
+F: tests/functional/x86_64/test_mem_addr_space.py
+F: tests/functional/x86_64/test_pc_cpu_hotplug_props.py
+F: tests/functional/x86_64/test_tuxrun.py
+F: tests/functional/x86_64/test_cpu_model_versions.py
 
 PC Chipset
 M: Michael S. Tsirkin <mst@redhat.com>
@@ -1974,7 +1975,7 @@ F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/system/numa.h
-F: tests/functional/test_cpu_queries.py
+F: tests/functional/x86_64/test_cpu_queries.py
 F: tests/functional/test_empty_cpu_model.py
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
@@ -2159,7 +2160,7 @@ M: Ani Sinha <anisinha@redhat.com>
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/functional/acpi-bits/*
-F: tests/functional/test_acpi_bits.py
+F: tests/functional/x86_64/test_acpi_bits.py
 F: docs/devel/testing/acpi-bits.rst
 
 ACPI/HEST/GHES
@@ -2345,7 +2346,7 @@ F: net/vhost-user.c
 F: include/hw/virtio/
 F: docs/devel/virtio*
 F: docs/devel/migration/virtio.rst
-F: tests/functional/test_virtio_version.py
+F: tests/functional/x86_64/test_virtio_version.py
 
 virtio-balloon
 M: Michael S. Tsirkin <mst@redhat.com>
@@ -2357,7 +2358,7 @@ F: include/hw/virtio/virtio-balloon.h
 F: system/balloon.c
 F: include/system/balloon.h
 F: tests/qtest/virtio-balloon-test.c
-F: tests/functional/test_virtio_balloon.py
+F: tests/functional/x86_64/test_virtio_balloon.py
 
 virtio-9p
 M: Christian Schoenebeck <qemu_oss@crudebyte.com>
@@ -2380,7 +2381,7 @@ F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
 F: include/hw/virtio/virtio-blk-common.h
 F: tests/qtest/virtio-blk-test.c
-F: tests/functional/test_x86_64_hotplug_blk.py
+F: tests/functional/x86_64/test_hotplug_blk.py
 T: git https://github.com/stefanha/qemu.git block
 
 virtio-ccw
@@ -2604,7 +2605,7 @@ R: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>
 S: Odd Fixes
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-F: tests/functional/test_netdev_ethtool.py
+F: tests/functional/x86_64/test_netdev_ethtool.py
 F: tests/qtest/igb-test.c
 F: tests/qtest/libqos/igb.c
 
@@ -2713,6 +2714,7 @@ F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
 F: docs/system/devices/virtio-gpu.rst
 F: tests/functional/aarch64/test_virt_gpu.py
+F: tests/functional/x86_64/test_virtio_gpu.py
 
 vhost-user-blk
 M: Raphael Norwitz <raphael@enfabrica.net>
@@ -3856,7 +3858,7 @@ S: Supported
 F: hw/i386/intel_iommu.c
 F: hw/i386/intel_iommu_internal.h
 F: include/hw/i386/intel_iommu.h
-F: tests/functional/test_intel_iommu.py
+F: tests/functional/x86_64/test_intel_iommu.py
 F: tests/qtest/intel-iommu-test.c
 
 AMD-Vi Emulation
@@ -4330,7 +4332,7 @@ F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
 F: tests/lcitool/
-F: tests/functional/test_*_tuxrun.py
+F: tests/functional/*/test_tuxrun.py
 F: scripts/archive-source.sh
 F: docs/devel/testing/ci*
 F: docs/devel/testing/main.rst
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 00d18dba3ce..34e30239a6b 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -34,15 +34,7 @@ subdir('sh4')
 subdir('sh4eb')
 subdir('sparc')
 subdir('sparc64')
-
-test_x86_64_timeouts = {
-  'acpi_bits' : 420,
-  'intel_iommu': 300,
-  'netdev_ethtool' : 180,
-  'virtio_balloon': 120,
-  'x86_64_kvm_xen' : 180,
-  'x86_64_replay' : 480,
-}
+subdir('x86_64')
 
 tests_generic_system = [
   'empty_cpu_model',
@@ -56,33 +48,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_x86_64_system_quick = [
-  'cpu_queries',
-  'mem_addr_space',
-  'x86_64_migration',
-  'pc_cpu_hotplug_props',
-  'virtio_version',
-  'x86_cpu_model_versions',
-  'vnc',
-  'memlock',
-]
-
-tests_x86_64_system_thorough = [
-  'acpi_bits',
-  'intel_iommu',
-  'linux_initrd',
-  'x86_64_multiprocess',
-  'netdev_ethtool',
-  'virtio_balloon',
-  'virtio_gpu',
-  'x86_64_hotplug_blk',
-  'x86_64_hotplug_cpu',
-  'x86_64_kvm_xen',
-  'x86_64_replay',
-  'x86_64_reverse_debug',
-  'x86_64_tuxrun',
-]
-
 tests_xtensa_system_thorough = [
   'xtensa_lx60',
   'xtensa_replay',
diff --git a/tests/functional/x86_64/meson.build b/tests/functional/x86_64/meson.build
new file mode 100644
index 00000000000..696a9ecab42
--- /dev/null
+++ b/tests/functional/x86_64/meson.build
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+test_x86_64_timeouts = {
+  'acpi_bits' : 420,
+  'intel_iommu': 300,
+  'kvm_xen' : 180,
+  'netdev_ethtool' : 180,
+  'replay' : 480,
+  'virtio_balloon': 120,
+}
+
+tests_x86_64_system_quick = [
+  'cpu_model_versions',
+  'cpu_queries',
+  'mem_addr_space',
+  'migration',
+  'pc_cpu_hotplug_props',
+  'virtio_version',
+  'vnc',
+  'memlock',
+]
+
+tests_x86_64_system_thorough = [
+  'acpi_bits',
+  'hotplug_blk',
+  'hotplug_cpu',
+  'intel_iommu',
+  'kvm_xen',
+  'linux_initrd',
+  'multiprocess',
+  'netdev_ethtool',
+  'replay',
+  'reverse_debug',
+  'tuxrun',
+  'virtio_balloon',
+  'virtio_gpu',
+]
diff --git a/tests/functional/test_acpi_bits.py b/tests/functional/x86_64/test_acpi_bits.py
similarity index 100%
rename from tests/functional/test_acpi_bits.py
rename to tests/functional/x86_64/test_acpi_bits.py
diff --git a/tests/functional/test_x86_cpu_model_versions.py b/tests/functional/x86_64/test_cpu_model_versions.py
similarity index 100%
rename from tests/functional/test_x86_cpu_model_versions.py
rename to tests/functional/x86_64/test_cpu_model_versions.py
diff --git a/tests/functional/test_cpu_queries.py b/tests/functional/x86_64/test_cpu_queries.py
similarity index 100%
rename from tests/functional/test_cpu_queries.py
rename to tests/functional/x86_64/test_cpu_queries.py
diff --git a/tests/functional/test_x86_64_hotplug_blk.py b/tests/functional/x86_64/test_hotplug_blk.py
similarity index 100%
rename from tests/functional/test_x86_64_hotplug_blk.py
rename to tests/functional/x86_64/test_hotplug_blk.py
diff --git a/tests/functional/test_x86_64_hotplug_cpu.py b/tests/functional/x86_64/test_hotplug_cpu.py
similarity index 100%
rename from tests/functional/test_x86_64_hotplug_cpu.py
rename to tests/functional/x86_64/test_hotplug_cpu.py
diff --git a/tests/functional/test_intel_iommu.py b/tests/functional/x86_64/test_intel_iommu.py
similarity index 100%
rename from tests/functional/test_intel_iommu.py
rename to tests/functional/x86_64/test_intel_iommu.py
diff --git a/tests/functional/test_x86_64_kvm_xen.py b/tests/functional/x86_64/test_kvm_xen.py
similarity index 100%
rename from tests/functional/test_x86_64_kvm_xen.py
rename to tests/functional/x86_64/test_kvm_xen.py
diff --git a/tests/functional/test_linux_initrd.py b/tests/functional/x86_64/test_linux_initrd.py
similarity index 100%
rename from tests/functional/test_linux_initrd.py
rename to tests/functional/x86_64/test_linux_initrd.py
diff --git a/tests/functional/test_mem_addr_space.py b/tests/functional/x86_64/test_mem_addr_space.py
similarity index 100%
rename from tests/functional/test_mem_addr_space.py
rename to tests/functional/x86_64/test_mem_addr_space.py
diff --git a/tests/functional/test_memlock.py b/tests/functional/x86_64/test_memlock.py
similarity index 100%
rename from tests/functional/test_memlock.py
rename to tests/functional/x86_64/test_memlock.py
diff --git a/tests/functional/test_x86_64_migration.py b/tests/functional/x86_64/test_migration.py
similarity index 100%
rename from tests/functional/test_x86_64_migration.py
rename to tests/functional/x86_64/test_migration.py
diff --git a/tests/functional/test_x86_64_multiprocess.py b/tests/functional/x86_64/test_multiprocess.py
similarity index 100%
rename from tests/functional/test_x86_64_multiprocess.py
rename to tests/functional/x86_64/test_multiprocess.py
diff --git a/tests/functional/test_netdev_ethtool.py b/tests/functional/x86_64/test_netdev_ethtool.py
similarity index 100%
rename from tests/functional/test_netdev_ethtool.py
rename to tests/functional/x86_64/test_netdev_ethtool.py
diff --git a/tests/functional/test_pc_cpu_hotplug_props.py b/tests/functional/x86_64/test_pc_cpu_hotplug_props.py
similarity index 100%
rename from tests/functional/test_pc_cpu_hotplug_props.py
rename to tests/functional/x86_64/test_pc_cpu_hotplug_props.py
diff --git a/tests/functional/test_x86_64_replay.py b/tests/functional/x86_64/test_replay.py
similarity index 100%
rename from tests/functional/test_x86_64_replay.py
rename to tests/functional/x86_64/test_replay.py
diff --git a/tests/functional/test_x86_64_reverse_debug.py b/tests/functional/x86_64/test_reverse_debug.py
similarity index 100%
rename from tests/functional/test_x86_64_reverse_debug.py
rename to tests/functional/x86_64/test_reverse_debug.py
diff --git a/tests/functional/test_x86_64_tuxrun.py b/tests/functional/x86_64/test_tuxrun.py
similarity index 100%
rename from tests/functional/test_x86_64_tuxrun.py
rename to tests/functional/x86_64/test_tuxrun.py
diff --git a/tests/functional/test_virtio_balloon.py b/tests/functional/x86_64/test_virtio_balloon.py
similarity index 100%
rename from tests/functional/test_virtio_balloon.py
rename to tests/functional/x86_64/test_virtio_balloon.py
diff --git a/tests/functional/test_virtio_gpu.py b/tests/functional/x86_64/test_virtio_gpu.py
similarity index 100%
rename from tests/functional/test_virtio_gpu.py
rename to tests/functional/x86_64/test_virtio_gpu.py
diff --git a/tests/functional/test_virtio_version.py b/tests/functional/x86_64/test_virtio_version.py
similarity index 100%
rename from tests/functional/test_virtio_version.py
rename to tests/functional/x86_64/test_virtio_version.py
-- 
2.47.2


