Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECBFCC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGZHX-0000Pk-5b; Tue, 13 Oct 2026 05:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xGZHV-0000Om-6m
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 05:58:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xGZHT-0007PT-4L
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 05:58:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so17959395e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791885525; x=1792490325; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=c3AghjnGqrYt7yziStzra1z7bS1qqDzNdF3idbC9wU0=;
 b=QPe+Sh5CaRYgBQAbAYO+K+hcuaqr7ebwOSs39cwEbC+jxNq1j63cmusLSiwPpyJGuI
 KPi36t0YIUng9qU8AbZ9rQmlbxGSgBnz5n2L1p5EoUfIl6gfyAz27pmR4PQxN2s32Vvq
 ildcnsteY6ao10CdOwtg1Qe7mWQEaHP767g/+UKtLp/MMBkTJgvdGH/W1Y3dY6+GEMKY
 C4jfF/VNBbiz/R/Cey8onMUoB4SNW6rvzTxirW+cHXfgzAT3zE/LlENKt8sHBuua9Jm4
 dSedbL/zAkGt0OskBfgv44+EjbdQbPiMMiENH419717crMLNyLQVCpepa0PGsT+p6XxY
 JqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791885525; x=1792490325;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c3AghjnGqrYt7yziStzra1z7bS1qqDzNdF3idbC9wU0=;
 b=bdL5h4dO46+3eIetoFGh0HXLnIw4VP/omoCA3l5NB+oouRRknJ+VPqPWHRjZE9iTSb
 VeYrC4fBdi5NjuEgGqlgI2aTr6tikByu93S7HqFmRXDPrxvBz+TZLW02/q1A7El+18wL
 03/QtkoEAD+Rx6da1rZsRuARn94zAcSJyLa3JaUKxwjgsHuvFsx1IpSF7BPFapnkoLZt
 gU3dY5A2w1kCMmWsth/HfMnCIMOVxpUCze1ViwIN4gcRgBE/7WaFus3xAy1sZspdC57h
 VFM4VNhSSTEuE5YtBfhNW2hg30U2Be0xKqSEZCdsfCKi3w1WvpCIfn9KFcUZYqRkruVr
 J4oA==
X-Forwarded-Encrypted: i=1;
 AKwUvBywwDFW/Kc3gWJXFO8pJIvIzsmjgAdinJAPXqR/qz+1Vs3Wnf6wf9SP4mYkyfFH/vHuHcQ6A30fRg==@nongnu.org
X-Gm-Message-State: AFq9FYJTfm0O8ekR4JjSwXIElXu/HPftuiIyFuhxRGVnXl5Vo4sYMLkx
 D9MTIF3vRP7Wrx/60ujIN4ymrqKHGKNOa2jK2N2qyN2TzBc0nKYPCzp0
X-Gm-Gg: AYBFou05q/R07AsRGTgrSrrMFMbklcJqr2nEwJg0+IfNxz0NVVGjrWm11Bq9zYzD+6L
 f2ISVqMzFeFfvV8CsrLwAFklxXcWVYa8OSSOiwFPuvH1wKzvwIuJiFi/3IqtloH88RTV+gzRzsw
 iOX4mUJbU2ln/6zOvygyJdOW4zPb5XJFlbwAgdHrnpt0TOrCgF2RjX/Uyt8rpajmNXB0iE7vS5k
 nnDnQtz+Scc8vrfDhJoZgsZCgbhK5YIov9yZrSo7yST65ddt9xN55S2IfIzdcnQ0ceega7GNr5C
 TKhIqSwQc1UaZshzpXI8joNF07rmPiki2XygSXFLRmfvV4Km2VerziyDi3jnz4zHo2N/xXMFxmv
 J1WoVgIz7Z4SdTMdEbTNvZWJBYTwmD1lkfeiBBib+1fTklTvPCAsoZqGxmIcnyR7kspDVmLq9o6
 qpujN8Y+TnDUH50kvpR5hXpyc4m7ZMdcGqS28NtXMm5qMfaiVTA/n+/+/g1PLszXfedPkEusEw8
 1YAOwTA/yRIqVb2lWmzSuYhxI0mdqbvu/51DCFbdUVEdTNFW8eZGF63+h14OEgCiuu3y30=
X-Received: by 2002:a05:600c:3b8b:b0:4a1:811c:8078 with SMTP id
 5b1f17b1804b1-4a18e4a7cfcmr291341545e9.26.1791885524865; 
 Tue, 13 Oct 2026 02:58:44 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf35e00015f07061f2b3fa54.dip0.t-ipconnect.de.
 [2003:fa:af35:e000:15f0:7061:f2b3:fa54])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18beabbd0sm405573545e9.12.2026.10.13.02.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:58:44 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:58:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 QEMU <qemu-devel@nongnu.org>
CC: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_10/10=5D_tests/function?=
 =?US-ASCII?Q?al/arm=3A_Add_MCIMX6UL-EVK_boot_tests?=
In-Reply-To: <20261004090500.3082641-11-bin.meng@processmission.com>
References: <20261004090500.3082641-1-bin.meng@processmission.com>
 <20261004090500.3082641-11-bin.meng@processmission.com>
Message-ID: <4BE19F95-8B6D-45A0-B225-19431D698F47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 4=2E Oktober 2026 09:04:55 UTC schrieb Bin Meng <bin=2Emeng@processmiss=
ion=2Ecom>:
>The MCIMX6UL-EVK machine supports loading U-Boot proper with the
>generic loader and booting Linux directly, but neither path has
>functional coverage=2E
>
>Add a versioned Buildroot asset containing U-Boot, a Linux kernel,
>the board DTB, and a 128 MiB SD card image=2E Exercise both boot paths
>and verify that they reach the Buildroot login prompt=2E
>
>Signed-off-by: Bin Meng <bin=2Emeng@processmission=2Ecom>
>
>---
>
>(no changes since v1)
>
> MAINTAINERS                               |  1 +
> tests/functional/arm/meson=2Ebuild          |  2 +
> tests/functional/arm/test_mcimx6ul_evk=2Epy | 69 +++++++++++++++++++++++

I get:

    QEMU_TEST_QEMU_BINARY=3Dqemu-system-aarch64 =2E/run =2E=2E/src/tests/f=
unctional/arm/test_mcimx6ul_evk=2Epy=20

    ERROR: Command `=2E=2E/src/tests/functional/arm/test_mcimx6ul_evk=2Epy=
` failed to execute: [Errno 13] Permission denied: '=2E=2E/src/tests/functi=
onal/arm/test_mcimx6ul_evk=2Epy'

Adding the execute permission to the script fixes the problem=2E

With this fixed:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

> 3 files changed, 72 insertions(+)
> create mode 100644 tests/functional/arm/test_mcimx6ul_evk=2Epy
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 40232cb65e=2E=2E3f8f0608c0 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -922,6 +922,7 @@ F: include/hw/arm/fsl-imx6ul=2Eh
> F: include/hw/display/imx6ul_lcdif=2Eh
> F: include/hw/misc/imx6ul_ccm=2Eh
> F: docs/system/arm/mcimx6ul-evk=2Erst
>+F: tests/functional/arm/test_mcimx6ul_evk=2Epy
>=20
> MCIMX7D SABRE / i=2EMX7
> M: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>diff --git a/tests/functional/arm/meson=2Ebuild b/tests/functional/arm/me=
son=2Ebuild
>index 61b00932db=2E=2Ed8b1408b13 100644
>--- a/tests/functional/arm/meson=2Ebuild
>+++ b/tests/functional/arm/meson=2Ebuild
>@@ -20,6 +20,7 @@ test_arm_timeouts =3D {
>   'bpim2u' : 500,
>   'collie' : 180,
>   'cubieboard' : 360,
>+  'mcimx6ul_evk' : 240,
>   'orangepi' : 540,
>   'quanta_gsj' : 240,
>   'raspi2' : 120,
>@@ -59,6 +60,7 @@ tests_arm_system_thorough =3D [
>   'emcraft_sf2',
>   'integratorcp',
>   'max78000fthr',
>+  'mcimx6ul_evk',
>   'microbit',
>   'orangepi',
>   'quanta_gsj',
>diff --git a/tests/functional/arm/test_mcimx6ul_evk=2Epy b/tests/function=
al/arm/test_mcimx6ul_evk=2Epy
>new file mode 100644
>index 0000000000=2E=2E0b4dcd5a94
>--- /dev/null
>+++ b/tests/functional/arm/test_mcimx6ul_evk=2Epy
>@@ -0,0 +1,69 @@
>+#!/usr/bin/env python3
>+#
>+# Functional tests for the NXP MCIMX6UL-EVK machine
>+#
>+# Copyright (c) 2026 Process Mission
>+#
>+# Author:
>+#   Bin Meng <bin=2Emeng@processmission=2Ecom>
>+#
>+# SPDX-License-Identifier: GPL-2=2E0-or-later
>+
>+from qemu_test import Asset, LinuxKernelTest, skipIfMissingCommands
>+
>+
>+class MCIMX6ULEVKMachine(LinuxKernelTest):
>+
>+    ASSET_BUILDROOT =3D Asset(
>+        ('https://github=2Ecom/processmission/qemu-machine-images/releas=
es/download/'
>+         'v1=2E0=2E0/arm-mcimx6ul-evk-v1=2E0=2E0=2Etar=2Ezst'),
>+        'a08f2b5dae139cf73cfa601c9df9316356a07a5dc59c74d99f30ebee61c405f=
b')
>+
>+    def _prepare_images(self):
>+        self=2Eset_machine('mcimx6ul-evk')
>+
>+        archive_path =3D self=2Euncompress(
>+            self=2EASSET_BUILDROOT,
>+            target=3D'arm-mcimx6ul-evk-v1=2E0=2E0=2Etar',
>+            format=3D'zstd')
>+        self=2Earchive_extract(archive_path, format=3D'tar')
>+
>+        sdcard_path =3D self=2Escratch_file('images', 'sdcard=2Eimg')
>+        self=2Evm=2Eset_console()
>+        self=2Evm=2Eadd_args(
>+            '-m', '512M',
>+            '-snapshot',
>+            '-drive', f'file=3D{sdcard_path},format=3Draw,if=3Dsd,index=
=3D1',
>+            '-no-reboot')
>+
>+    @skipIfMissingCommands('zstd')
>+    def test_uboot_boot(self):
>+        self=2E_prepare_images()
>+
>+        uboot_path =3D self=2Escratch_file('images', 'u-boot=2Ebin')
>+        self=2Evm=2Eadd_args(
>+            '-device', f'loader,file=3D{uboot_path},addr=3D0x87800000,cp=
u-num=3D0')
>+        self=2Evm=2Elaunch()
>+
>+        self=2Ewait_for_console_pattern('U-Boot 2024=2E07')
>+        self=2Ewait_for_console_pattern('Starting kernel =2E=2E=2E')
>+        self=2Ewait_for_console_pattern('buildroot login:')
>+
>+    @skipIfMissingCommands('zstd')
>+    def test_linux_boot(self):
>+        self=2E_prepare_images()
>+
>+        self=2Evm=2Eadd_args(
>+            '-kernel', self=2Escratch_file('images', 'zImage'),
>+            '-dtb', self=2Escratch_file('images',
>+                                      'imx6ul-14x14-evk=2Edtb'),
>+            '-append',
>+            'console=3Dttymxc0,115200 root=3D/dev/mmcblk1p2 rootwait rw'=
)
>+        self=2Evm=2Elaunch()
>+
>+        self=2Ewait_for_console_pattern('Linux version')
>+        self=2Ewait_for_console_pattern('buildroot login:')
>+
>+
>+if __name__ =3D=3D '__main__':
>+    LinuxKernelTest=2Emain()

