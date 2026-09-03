Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0BC624A4
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 14:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x28Zw-0000og-B5; Thu, 03 Sep 2026 10:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28Zu-0000nJ-TX
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:38:10 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x28Zt-0001td-0R
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 10:38:10 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c2531f453eeso361119066b.3
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788446286; x=1789051086; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=b4dfJ/+buXqwCV6OULOBqSK2R5P74SiM8Tme8QzB/xg=;
 b=xdhKmKnziZsZTPBiY7W2rMZvoQ3ULwY9hKAFNc6lgsuULrgGbM2wDEnPpYQnOYbFPI
 uIAzUfmWNFZ4CGys5q1iH7zu9t3LRHaiYoJSMyJ2fqz8HPcIZxUEJgkCHiUt/xq/hleZ
 szUg5p/0tEgiLc1/SkDvmWAPNQkZTa3HNwl8QDKzAgOlgAA/2MLQcr+k2ty1qVIp7TjM
 wED/Al7FzDE85kXjcR1MJEl66reUmlIA8jv3Xm+rljAyQrq1BXE+/+qor8HAq4yR9eKZ
 PMuloclK8Qry6Daet+jF9mBQHvPiovbT8RTQn5uzjgi+XH/2yL8uYgRM59//U5Ls8VB5
 YZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788446286; x=1789051086;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b4dfJ/+buXqwCV6OULOBqSK2R5P74SiM8Tme8QzB/xg=;
 b=BxzV0QLepLqqY5kK3y3joaEIRO0Hz/6IgvqIvdOjZelu3XGDUYXviuuWdi5RkStTCF
 UNzk6XSys5tyzVLftUW+24+BAVy+fL8pQCpw6V1pmFQGey8B9OVVRRNrBTxWzpoahPxe
 cwGLUGfR2GQzc4ByM5Q4we78tdg04ASr/qHgCph0sEDAbYogqVSUQ+e704IPqblP1kbe
 xSu9KEwie73/xr+Ab44iRjlTda2538PtwmwVUGbS6C/HrBKs/nhZngA/oLtDNwLM6oAQ
 78gsLGHfg70tisv7ASMyvlQDtYDlucE5fVjcwQAuQFQq4yJ1IeTLzlktt0Cqfv3FLvxB
 WGUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/tLdph26s0hodt6bmrxcxkRWORQoqeoMQGqSMf+IAzD6A0zP1/wkX/S/OhT8GYch4Lol/6dnJ2w==@nongnu.org
X-Gm-Message-State: AFuF++k1Zwy1OPcnWSnLWikOoPqyXt1Pm+1js+Friqqe3PhGP2E2C2km
 oJH8EgpJnMyuE51dtcHWMwavlKJNAhreciyy4gNoOSR8HcSvykNZXXKJa/Tpd7cjUWY=
X-Gm-Gg: AYBFou2Z1n5jncE2U0qAQ4XiuI9rkjei1aunKPNF0Q0gFq52AN0Nwu8871A7Ptl9WVJ
 /nrA3EpL4AgQa3FIeMg1sattRxgz/e0erTite2AI/qZssOEoe+PyuQJCIyLp/ZiIz4fagmk9XvP
 6xwmc8xdC0CwUVEgSk684vq3eOSQPYQGhyZtVZVKljGuQJteVwcP0Va4yw5q20BAaRADwJNFg93
 d+kYt9dyuIOPjH+OEcPCT3slQyh5qIpfPaymKmH7mnby/eVDc+/hUPzK9eYHOjmRsLxGPkWt0pM
 /8p2mU9SgwkkKxC/HqceTA5FG2HIKY030qZn/LlgPs8Trg2sdf6WsxNkO2+IMYiKTld83cTcULZ
 48xzn1i/5C7cUe9dEMXcU9CDs/WktEgCwHwiem9loWk2N2itlNqtlFPWX26vraD1EXyZhT4FV5a
 ObuMKj1BV2J489VqEiyEWTOMOxnCT3fUUKQ5tIXBrc2qEiXEgMuI8WLCy4wPTC
X-Received: by 2002:a17:906:478a:b0:c08:417e:3696 with SMTP id
 a640c23a62f3a-c25d554d729mr805539266b.20.1788446286253; 
 Thu, 03 Sep 2026 07:38:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c25f4172032sm107674766b.22.2026.09.03.07.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 07:38:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3FFD05F8FD;
 Thu, 03 Sep 2026 15:38:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 32/33] tests/functional/aarch64: Add Phytium Pi boot tests
In-Reply-To: <20260903112532.3276678-33-bin.meng@processmission.com> (Bin
 Meng's message of "Thu, 3 Sep 2026 19:25:12 +0800")
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-33-bin.meng@processmission.com>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Thu, 03 Sep 2026 15:38:04 +0100
Message-ID: <87y0dipfhv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Bin Meng <bin.meng@processmission.com> writes:

> The Phytium Pi machine supports both the board firmware flow from SD
> and direct Linux boot. Exercise both paths with an SDK image bundle so
> firmware handoff and kernel loading regressions are caught.
>
> Verify U-Boot, PBF relocation, the Linux handoff, and login for the
> firmware path. The Linux test loads the bundled kernel, DTB, and
> initramfs and waits for the same login prompt.
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
>
>  tests/functional/aarch64/meson.build        |  2 +
>  tests/functional/aarch64/test_phytium_pi.py | 77 +++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 tests/functional/aarch64/test_phytium_pi.py
>
> diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarc=
h64/meson.build
> index f0881bed16..71bf45e4ea 100644
> --- a/tests/functional/aarch64/meson.build
> +++ b/tests/functional/aarch64/meson.build
> @@ -7,6 +7,7 @@ test_aarch64_timeouts =3D {
>    'device_passthrough' : 720,
>    'imx8mm_evk' : 240,
>    'imx8mp_evk' : 240,
> +  'phytium_pi' : 600,
>    'raspi4' : 480,
>    'reverse_debug' : 180,
>    'rme_virt' : 1200,
> @@ -39,6 +40,7 @@ tests_aarch64_system_thorough =3D [
>    'imx8mp_evk',
>    'kvm',
>    'multiprocess',
> +  'phytium_pi',
>    'raspi3',
>    'raspi4',
>    'replay',
> diff --git a/tests/functional/aarch64/test_phytium_pi.py b/tests/function=
al/aarch64/test_phytium_pi.py
> new file mode 100644
> index 0000000000..4ae0392bdd
> --- /dev/null
> +++ b/tests/functional/aarch64/test_phytium_pi.py
> @@ -0,0 +1,77 @@
> +#!/usr/bin/env python3
> +#
> +# Functional tests for the Phytium Pi machine
> +#
> +# Copyright (c) 2026 Process Mission
> +#
> +# Author:
> +#   Bin Meng <bin.meng@processmission.com>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import Asset, LinuxKernelTest
> +from qemu_test import skipBigDataTest, skipIfMissingCommands
> +
> +
> +class PhytiumPiMachine(LinuxKernelTest):
> +
> +    ASSET_BUILDROOT =3D Asset(
> +        ('https://github.com/processmission/qemu-machine-images/releases=
/'
> +         'download/v1.0.0/aarch64-phytium-pi-v1.0.0.tar.zst'),
> +
> '5219d52b862e1245b12f79ba72e9a6144f5e0cf1a50061f8fda2db0aeeb92428')

Nice ;-)

I've been looking into something similar to make it easy to set up
github projects that can build and host test assets:

  https://github.com/stsquad/buildroot-asset

although my builds seem to take quite a bit longer that yours.

I wonder if there is a way to have a common repository set up but in a
way that the forks can just build their own images. Either that or a
core repository which everyone just forks adds their device and merges.

Anyway, test looks sane:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +
> +    def _prepare_images(self):
> +        self.set_machine('phytium-pi')
> +
> +        archive_path =3D self.uncompress(
> +            self.ASSET_BUILDROOT,
> +            target=3D'aarch64-phytium-pi-v1.0.0.tar',
> +            format=3D'zstd')
> +        self.archive_extract(archive_path, format=3D'tar')
> +
> +        self.vm.set_console(console_index=3D1)
> +        self.vm.add_args('-smp', '4',
> +                         '-m', '4G',
> +                         '-display', 'none',
> +                         '-nic', 'none',
> +                         '-no-reboot')
> +
> +    @skipIfMissingCommands('zstd')
> +    @skipBigDataTest()
> +    def test_firmware_boot(self):
> +        self._prepare_images()
> +        sdcard =3D self.scratch_file('images', 'sdcard.img')
> +
> +        self.vm.add_args(
> +            '-snapshot',
> +            '-drive', f'file=3D{sdcard},format=3Draw,if=3Dsd,index=3D0')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('U-Boot 2022.01')
> +        self.wait_for_console_pattern('PBF relocate done')
> +        self.wait_for_console_pattern('Starting kernel ...')
> +        self.wait_for_console_pattern('Phytium login:')
> +
> +    @skipIfMissingCommands('zstd')
> +    @skipBigDataTest()
> +    def test_linux_boot(self):
> +        self._prepare_images()
> +        kernel =3D self.scratch_file('images', 'Image.gz')
> +        dtb =3D self.scratch_file('images', 'phytiumpi_firefly.dtb')
> +        initrd =3D self.scratch_file('images', 'rootfs.cpio.gz')
> +
> +        self.vm.add_args(
> +            '-kernel', kernel,
> +            '-dtb', dtb,
> +            '-initrd', initrd,
> +            '-append', 'console=3DttyAMA1,115200 '
> +                       'earlycon=3Dpl011,mmio32,0x2800d000 rdinit=3D/ini=
t')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('Booting Linux on physical CPU')
> +        self.wait_for_console_pattern('Machine model: Phytium Pi Board')
> +        self.wait_for_console_pattern('Phytium login:')
> +
> +
> +if __name__ =3D=3D '__main__':
> +    LinuxKernelTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

