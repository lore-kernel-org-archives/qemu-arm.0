Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3E5EDF176
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 16:01:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvbh-00088u-Nu; Fri, 13 Feb 2026 11:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvbf-00088X-Mi
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 11:01:23 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvbc-0002Tk-UT
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 11:01:23 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-65a196a735eso1938012a12.2
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770998477; x=1771603277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8w4VGqlHz8MwxUOn2Nmm/m4PBbg1b1nWqf085CuVo8=;
 b=cl8a+8EA9wmb69VIrRaUJeD5jQ8fNBaFzJ1S18n0AnnDZOpjfPbz3cOXq2iLDWVRLp
 YyZ+FdAaHJY4gDq/KsbeN1LiDYW3lOJTZ/7PQEE/iEGOpHTumy2Vz+LBTPMuV4v1+KbJ
 KfVYAbD1cX8AZrTdfCJZ/zBkq/uHwrRML0+AVvzZ0J8I7exlTBEMjSbq9HVnsFkk2V0s
 InxIWoavbKcaAcw+S6FVKHcsrxVuV9e1GmIEJlHK1FTOXoJxJ0K0KPqZtRWTWkj40gun
 KljJLFO4Ta35N5klRERSrznyrRJNKXYbhi6UcBUtMyXXFq8M0/fDxkelWWi2mb0/nFJR
 ctZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770998477; x=1771603277;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8w4VGqlHz8MwxUOn2Nmm/m4PBbg1b1nWqf085CuVo8=;
 b=CMlNGtbfG96e7oDDqykno1YDRp+pt6fmqHNTdm2j8OZSG4Rbmp9wgEehWPDcshi559
 wnU2pA81PGq5qIMbaw6lDRwuqCyZWkRWMO+mRLzq2GLBy0QRerokNnQwN0Z8T8iXThGn
 /rB9wTsLz+tsgo3A5am9a497lnRgI6RR1dU7vcdtbCiWmibX26ObCjuWrRiu8/sMMeLY
 UPqAEOkTmT6672a++p0V6vtC9n03zgOVFiZzb6BfCzMqXDf1DUKanwQf2hV38HfKnZ92
 +5WrhB8+PfZ+hnhnH1EXmcI8H2Gkvw23RpYBAX9FHe2Xz77dOToUHyoOT7beeIWkRna7
 t6XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgD0z1jIKOhBBw7ccOHBK42hCBttPASeeIdqQypJ5fxCDLGLEgMTc4TH0TpU6g7JIBIYaS1AVWHA==@nongnu.org
X-Gm-Message-State: AOJu0YwJ5LbuZHwlNN3e+5yRgOjla/45AcgqmHqVI31jkKWwg6StDbWu
 7oNOyDcGLUaCNS51zanQPfhhRGJOUd95VWhl7f4WF369qrRvc73AjBuGk31Jq9hXEF4=
X-Gm-Gg: AZuq6aIyodavde06uzkSkjBGTtS38cIROAjIKjrI0HCRYa9ctpQBYHb9x0Lb1ZVWOIi
 KB+3xuL1aaivZd9k7q7U657JdW0kq5yLkIg9pctXe1rQWUzaJENcfjZ/PadpnmcrmWoBlznwbaN
 SSLyJ3YGjO8KU2KU+JFr3kAXtSC6dwOTErSNLa0z+5F+IS1PByUIurP/AtlR4AQ4xukX1TVVBQ8
 aS8FjS9x61aQB7IRhVYP4EOimXvqOi6Wv2EoaQv8jhhH1eOSADASPTpw7STv2LDuyNjSUQLEmmB
 5ldgtbg+fB0Q+ejMOga7C5U4rKZvh/J8mHbSvHk+RTtWgqxiqu3KV25tB2RCL01VrPO1Ls9CF1C
 1z94JNrtGRtOvFTqa/8WgnHH+VXF6XiZ5fCAu3CdoRbTfWG8dBAnVwA22y0vwegLsabQJAI5vj7
 3MNoqESA44Y7QWtIDIx+Cjp2s=
X-Received: by 2002:a17:907:3d42:b0:b88:448c:be01 with SMTP id
 a640c23a62f3a-b8fb41936ddmr145009166b.18.1770998477219; 
 Fri, 13 Feb 2026 08:01:17 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ebd9859sm279180066b.38.2026.02.13.08.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:01:16 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3DEC85F894;
 Fri, 13 Feb 2026 16:01:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,  Warner Losh <imp@bsdimp.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Kyle
 Evans <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 6/6] tests/functional: add Arm VBSA uefi conformance test
In-Reply-To: <20260213154859.1551283-7-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 13 Feb 2026 15:48:59 +0000")
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
 <20260213154859.1551283-7-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Fri, 13 Feb 2026 16:01:15 +0000
Message-ID: <87zf5cmy44.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The VBSA test is a subset of the wider Arm architecture compliance
> suites (ACS) which validate machines meet particular minimum set of
> requirements. The VBSA is for virtual machines so it makes sense we
> should check the -M virt machine is compliant.
>
> Fortunately there are prebuilt binaries published via github so all we
> need to do is build an EFI partition and place things in the right
> place.
>
> There are some additional Linux based tests which are left for later.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/functional/aarch64/meson.build       |  1 +
>  tests/functional/aarch64/test_virt_vbsa.py | 99 ++++++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100755 tests/functional/aarch64/test_virt_vbsa.py
>
> diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarc=
h64/meson.build
> index 49eca120589..7ea8c22b048 100644
> --- a/tests/functional/aarch64/meson.build
> +++ b/tests/functional/aarch64/meson.build
> @@ -46,6 +46,7 @@ tests_aarch64_system_thorough =3D [
>    'tuxrun',
>    'virt',
>    'virt_gpu',
> +  'virt_vbsa',
>    'xen',
>    'xlnx_versal',
>  ]
> diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/functiona=
l/aarch64/test_virt_vbsa.py
> new file mode 100755
> index 00000000000..53cabf9d6c5
> --- /dev/null
> +++ b/tests/functional/aarch64/test_virt_vbsa.py
> @@ -0,0 +1,99 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that runs the Arm VBSA conformance tests.
> +#
> +# Copyright (c) 2026 Linaro Ltd.
> +#
> +# Author:
> +#  Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import shutil
> +from subprocess import check_call, DEVNULL
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern, get_qemu_img, skipIfMiss=
ingCommands
> +from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
> +
> +
> +@skipIfMissingCommands("mformat", "mcopy", "mmd")
> +class Aarch64VirtMachine(QemuSystemTest):
> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> +    timeout =3D 360
> +
> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message=3D'Kernel panic - not s=
yncing',
> +                                 vm=3Dvm)
> +
> +    ASSET_VBSA_EFI =3D Asset('https://github.com/ARM-software/sysarch-ac=
s/raw/refs/heads/main'
> +                           '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa=
.efi',
> +                           '80f37d2fb86d152d95dec4d05ff099c9e47ee8a89314=
268e08056b0e1359e1fa')
> +
> +    ASSET_BSA_SHELL =3D Asset('https://github.com/ARM-software/bsa-acs/r=
aw/refs/heads/main/'
> +                            'prebuilt_images/BSA_DT/v20.05_05_ALPHA/Shel=
l.efi',
> +                            '763e7b293fa9d1582153ea8fd0cf60e2a7a87d092d3=
5d342cf9b3b697f47b588')
> +
> +    def test_aarch64_vbsa_uefi_tests(self):
> +        """
> +        Launch the UEFI based VBSA test from an EFI file-system
> +        """
> +
> +        self.vm.set_console()
> +
> +        # virt machine wi
> +        self.set_machine('virt')
> +        self.vm.add_args('-M',
> 'virt,gic-version=3Dmax,virtualization=3Don')

We can drop the virtualization=3Don here so we run under KVM (or HVF?) as w=
ell.

> +        self.vm.add_args('-cpu', 'max','-m', '1024')
> +
> +        # We will use the QEMU firmware blobs to boot
> +        code_path =3D self.build_file('pc-bios', 'edk2-aarch64-code.fd')
> +        vars_source =3D self.build_file('pc-bios', 'edk2-arm-vars.fd')
> +        vars_path =3D self.scratch_file('vars.fd')
> +        shutil.copy(vars_source, vars_path)
> +
> +        self.vm.add_args('-drive', f'if=3Dpflash,format=3Draw,readonly=
=3Don,file=3D{code_path}')
> +        self.vm.add_args('-drive', f'if=3Dpflash,format=3Draw,file=3D{va=
rs_path}')
> +
> +        # Build an EFI FAT32 file-system for the UEFI tests
> +        vbsa_efi =3D self.ASSET_VBSA_EFI.fetch()
> +        bsa_shell =3D self.ASSET_BSA_SHELL.fetch()
> +
> +        img_path =3D self.scratch_file('vbsa.img')
> +        qemu_img =3D get_qemu_img(self)
> +        check_call([qemu_img, 'create', '-f', 'raw', img_path, '64M'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        check_call(['mformat', '-i', img_path, '-v', 'VBSA', '::'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        check_call(['mmd', '-i', img_path, '::/EFI'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        check_call(['mmd', '-i', img_path, '::/EFI/BOOT'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        check_call(['mcopy', '-i', img_path, bsa_shell, '::/EFI/BOOT/BOO=
TAA64.EFI'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        check_call(['mcopy', '-i', img_path, vbsa_efi, '::/Vbsa.efi'],
> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
> +
> +        self.vm.add_args('-drive', f'file=3D{img_path},format=3Draw,if=
=3Dnone,id=3Ddrive0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=3Ddrive0')
> +
> +        self.vm.launch()
> +
> +        # wait for EFI prompt
> +        self.wait_for_console_pattern('Shell>')
> +
> +        # Start the VBSA tests
> +        ec_and_wait(self, "FS0:Vbsa.efi", 'VBSA Architecture Compliance =
Suite')
> +
> +        # could we parse the summary somehow?
> +
> +        self.wait_for_console_pattern('VBSA tests complete. Reset the sy=
stem.')
> +
> +if __name__ =3D=3D '__main__':
> +    QemuSystemTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

