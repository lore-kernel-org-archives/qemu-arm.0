Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70DFC79F80
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 08:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2PfS-0004rL-Ok; Fri, 04 Sep 2026 04:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2PfR-0004r3-TF
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 04:53:01 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x2PfQ-00077g-0P
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 04:53:01 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8588583a7c3so8589787b3.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 01:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511978; cv=none;
 d=google.com; s=arc-20260327;
 b=EBjVPCOw0HidTBxmD9fEN9YWDFC1BPJwFolIQliCnPlPPTVcV2fXTYQRj4MJyRYaJG
 Zc6nGdwuVy0xJpV6WtM+ug35WNOgslPY4oSmSsSZN4CxK5b5ebUIM4H4A/ibO/9D23vd
 KzdSblWWtf07MWXZGU21LNL+fR5orIbsPKqFi/vMFlvbEt0JV5jtK8Eqnittj2umuIdD
 R/k+ye9fralOHyekOZ/k4Cx0EPQ6ffMCuxEq+SkzJl6VW5ZlwnxRhZDNlVm2nI6KuZZi
 X11vq/GMxBvbIY0dh973Ei13iSrB5eogfoSaqdSw6r2b/+A5HrPhOamMHDoJwutDiZz5
 0S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YU0H9nAuS37wxDxYALgdBEzrRf0vvgwOfz9NZINVtyk=;
 fh=QIIVGlKwrv+AvA0yUf5UdmtflrFSG6WcTOtLwFZ9uNw=;
 b=okk+W4uLQ/jzXDb+lQjfxkTV5JSd28aFHrUiNxdn69DI/rwRba0ubyXi5slZXf9xeJ
 oDLfm/iBCNuGFWutTECMhe4r2gM4689wvWQndayiMXz05NFQpoqtsyQHMtJwtJT6K2Qp
 0X464Hwb+ArX0YtrNkKie+OksychLScdO5wXI6BIFZ22JT50MWrz/ZWngPrMQiTPZj1H
 o/sN7vuIgpPCg2AcTAlFvyDE9NLZVdCtxUKbjbFSvMJck1l04JB5hmwBcmJhleVTjXBZ
 ZH39rWKyjAPDRvx2TMTSRIGp8Rzb9tghBQWM6HSaoqsrGi/7UBmYP4FHv53zC3/U5N4B
 5xsQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788511978; x=1789116778; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YU0H9nAuS37wxDxYALgdBEzrRf0vvgwOfz9NZINVtyk=;
 b=DXGBOySSRSOIshN16u9V8M9F4+PHjjj5AVAXcZhrJKLNmLmdaNtXOh1Go/0SvNBinZ
 J4tXZeBjZL4p2273vPhgqra/1oL7BpBeEdVtT5ArRnG67i7SE4kROVUGBpCW0wTGHUGZ
 qJcRyGryvbo/30Y2rRTbY25oAUdsruwzp1YB+c3uBqEd4E7TSQ6BvMy82VwPqM+TjFn3
 QRBC5mcwxrkKgmB5MYAvkE+z7z6yAcJBIJd/V0HYdUYWC9l0Q39O2f/SaYeaVAqlUq1O
 axGWnwDs9GijnBebPw9UwwauiIPa0oRYcOxlVBdmDNwm0CelMxT/4WbY8v8KbBJZSqj3
 WlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788511978; x=1789116778;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YU0H9nAuS37wxDxYALgdBEzrRf0vvgwOfz9NZINVtyk=;
 b=A2/HdwU9Hyvjl0Fa/ejRCO97KEqYtRrv25U2oNgJLAUcXjrcmS5qcX98wp7S2Gd7JH
 Snrw9+BhHc29A+e7zKH57hH32FIoPyzJgsvmzxJGPyFJxeIH9PaL7lDzcwm29HgRTyyl
 EgTMOZu1dy9oBXOBry+PC/oWVaaFihX12pXd9+K8kk8HOV8UKUu3tF9S5YspXK2qfDR/
 BCWcdYKr+iZvIlEPZ0Q9d2wahKJGlaWQ6joepihYOOG2i8zXm8gp1i7Vg8HUZkqJNVX5
 wK14lcL7xwRosXqoiyykyeJHF7+LqlyKSqaPlV5hULdKb+ruZSdqtxZgD0KF78nGuIYQ
 24yw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxw2oLMWdXrCly8zSQMiiJVBlIrYt915eyMmegQBAx/QCUxd4W8hRnu29eD2KKtzkOpJdwQUUCHTw==@nongnu.org
X-Gm-Message-State: AFuF++n7z2Jd5222oKi/zNfN9grC1oIJYTBw9U62zq1QzXz6vd3X2jP3
 6Lx12EVH0UM3lTchGf91S+mx42j0Tb8G9sX3opUeybglITdkTEFztvf7ziqTyDX9WJYlHuBLCih
 345pxfAeB/clQJQI9vu24Q9qHKmrHBdQ=
X-Gm-Gg: AYBFou1WpFn1ay11EVn71yeLQR/zisJisd/3AbRfs9/hdk1u0uByIHaKSI6dA1y2Ns2
 wo93dCFXwksl7ySvYgNm7IEc/ghK3n9Y3qag4Th0sYCghxDl2G/flPbc6/WGgDJnQoSaJ/yU9Y0
 herbXNoFsmuKFagYCdJmEjY2D3fQfAdxHBrNskjy/L7wXPXQ2KKeHPiOBVb3bjbguRP7MoHk0qN
 iwpbVb5lJXbVP607yR5X70o/5Y37AeKwURg3chat2n1K0YySyRvUtX902Z3BDJMKc1dETSaZA9P
 zeCzmkHlbyV80/+TTprNG8A8X4tJfsLYVgXFJOeuW8ls
X-Received: by 2002:a05:690c:c59f:b0:86a:5def:5f15 with SMTP id
 00721157ae682-8712800debamr20165177b3.29.1788511978543; Fri, 04 Sep 2026
 01:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-33-bin.meng@processmission.com>
 <87y0dipfhv.fsf@draig.linaro.org>
In-Reply-To: <87y0dipfhv.fsf@draig.linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 4 Sep 2026 16:52:46 +0800
X-Gm-Features: AcwNN1XoRcVVUYWqSma1V2tDLFiFsRbYBEm6NwNA5exZ7fNtvan5tpjt_VFEeKI
Message-ID: <CAEUhbmXDFwhJrdh6w3f9pwG29W_6-ixxNiR3-jRo+4KuEHGO+g@mail.gmail.com>
Subject: Re: [PATCH 32/33] tests/functional/aarch64: Add Phytium Pi boot tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Alex,

On Thu, Sep 3, 2026 at 10:38=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Bin Meng <bin.meng@processmission.com> writes:
>
> > The Phytium Pi machine supports both the board firmware flow from SD
> > and direct Linux boot. Exercise both paths with an SDK image bundle so
> > firmware handoff and kernel loading regressions are caught.
> >
> > Verify U-Boot, PBF relocation, the Linux handoff, and login for the
> > firmware path. The Linux test loads the bundled kernel, DTB, and
> > initramfs and waits for the same login prompt.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > ---
> >
> >  tests/functional/aarch64/meson.build        |  2 +
> >  tests/functional/aarch64/test_phytium_pi.py | 77 +++++++++++++++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 tests/functional/aarch64/test_phytium_pi.py
> >
> > diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aa=
rch64/meson.build
> > index f0881bed16..71bf45e4ea 100644
> > --- a/tests/functional/aarch64/meson.build
> > +++ b/tests/functional/aarch64/meson.build
> > @@ -7,6 +7,7 @@ test_aarch64_timeouts =3D {
> >    'device_passthrough' : 720,
> >    'imx8mm_evk' : 240,
> >    'imx8mp_evk' : 240,
> > +  'phytium_pi' : 600,
> >    'raspi4' : 480,
> >    'reverse_debug' : 180,
> >    'rme_virt' : 1200,
> > @@ -39,6 +40,7 @@ tests_aarch64_system_thorough =3D [
> >    'imx8mp_evk',
> >    'kvm',
> >    'multiprocess',
> > +  'phytium_pi',
> >    'raspi3',
> >    'raspi4',
> >    'replay',
> > diff --git a/tests/functional/aarch64/test_phytium_pi.py b/tests/functi=
onal/aarch64/test_phytium_pi.py
> > new file mode 100644
> > index 0000000000..4ae0392bdd
> > --- /dev/null
> > +++ b/tests/functional/aarch64/test_phytium_pi.py
> > @@ -0,0 +1,77 @@
> > +#!/usr/bin/env python3
> > +#
> > +# Functional tests for the Phytium Pi machine
> > +#
> > +# Copyright (c) 2026 Process Mission
> > +#
> > +# Author:
> > +#   Bin Meng <bin.meng@processmission.com>
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +from qemu_test import Asset, LinuxKernelTest
> > +from qemu_test import skipBigDataTest, skipIfMissingCommands
> > +
> > +
> > +class PhytiumPiMachine(LinuxKernelTest):
> > +
> > +    ASSET_BUILDROOT =3D Asset(
> > +        ('https://github.com/processmission/qemu-machine-images/releas=
es/'
> > +         'download/v1.0.0/aarch64-phytium-pi-v1.0.0.tar.zst'),
> > +
> > '5219d52b862e1245b12f79ba72e9a6144f5e0cf1a50061f8fda2db0aeeb92428')
>
> Nice ;-)
>
> I've been looking into something similar to make it easy to set up
> github projects that can build and host test assets:
>
>   https://github.com/stsquad/buildroot-asset

This is actually very close to what I have been doing with
https://github.com/processmission/qemu-machine-images. It is intended
to be a common repository for QEMU machine test assets.

Each machine has a small description under:

  machine/<architecture>/<machine>/

It selects the independently built components, required images and
machine-specific QEMU launcher. The container builders, packaging,
checksums, release manifest and GitHub Actions workflow are shared.
The workflow also distinguishes between the main repository and forks.
A fork can build selected machines and upload run-scoped Actions
artifacts without publishing a release. It can optionally publish its
own development prerelease, while the main repository publishes
frozen, versioned assets.

>
> although my builds seem to take quite a bit longer that yours.

Yeah, as I only built the minimal busybox-based buildroot
configuration, which is enough for QEMU boot testing :)

>
> I wonder if there is a way to have a common repository set up but in a
> way that the forks can just build their own images. Either that or a
> core repository which everyone just forks adds their device and merges.

So perhaps qemu-machine-images could serve as a starting point for the
common repository you describe. I would be happy to accept machine
definitions from other contributors and make the add-a-machine
workflow simpler.

Your buildroot-asset project also has useful ideas, particularly
including enough Buildroot configuration and source metadata to
reproduce an image manually. It would be good to align the two efforts
instead of growing separate repositories for each maintainer or board.

>
> Anyway, test looks sane:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks for the review!

>
> > +
> > +    def _prepare_images(self):
> > +        self.set_machine('phytium-pi')
> > +
> > +        archive_path =3D self.uncompress(
> > +            self.ASSET_BUILDROOT,
> > +            target=3D'aarch64-phytium-pi-v1.0.0.tar',
> > +            format=3D'zstd')
> > +        self.archive_extract(archive_path, format=3D'tar')
> > +
> > +        self.vm.set_console(console_index=3D1)
> > +        self.vm.add_args('-smp', '4',
> > +                         '-m', '4G',
> > +                         '-display', 'none',
> > +                         '-nic', 'none',
> > +                         '-no-reboot')
> > +
> > +    @skipIfMissingCommands('zstd')
> > +    @skipBigDataTest()
> > +    def test_firmware_boot(self):
> > +        self._prepare_images()
> > +        sdcard =3D self.scratch_file('images', 'sdcard.img')
> > +
> > +        self.vm.add_args(
> > +            '-snapshot',
> > +            '-drive', f'file=3D{sdcard},format=3Draw,if=3Dsd,index=3D0=
')
> > +        self.vm.launch()
> > +
> > +        self.wait_for_console_pattern('U-Boot 2022.01')
> > +        self.wait_for_console_pattern('PBF relocate done')
> > +        self.wait_for_console_pattern('Starting kernel ...')
> > +        self.wait_for_console_pattern('Phytium login:')
> > +
> > +    @skipIfMissingCommands('zstd')
> > +    @skipBigDataTest()
> > +    def test_linux_boot(self):
> > +        self._prepare_images()
> > +        kernel =3D self.scratch_file('images', 'Image.gz')
> > +        dtb =3D self.scratch_file('images', 'phytiumpi_firefly.dtb')
> > +        initrd =3D self.scratch_file('images', 'rootfs.cpio.gz')
> > +
> > +        self.vm.add_args(
> > +            '-kernel', kernel,
> > +            '-dtb', dtb,
> > +            '-initrd', initrd,
> > +            '-append', 'console=3DttyAMA1,115200 '
> > +                       'earlycon=3Dpl011,mmio32,0x2800d000 rdinit=3D/i=
nit')
> > +        self.vm.launch()
> > +
> > +        self.wait_for_console_pattern('Booting Linux on physical CPU')
> > +        self.wait_for_console_pattern('Machine model: Phytium Pi Board=
')
> > +        self.wait_for_console_pattern('Phytium login:')
> > +
> > +
> > +if __name__ =3D=3D '__main__':
> > +    LinuxKernelTest.main()
>
> --

Regards,
Bin

