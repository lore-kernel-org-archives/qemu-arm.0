Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D6CA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:53:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOWp-00040G-AZ; Sun, 04 Oct 2026 11:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWl-0003zK-P5
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:27 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWk-0007v2-2V
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:27 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8a83d2706fdso6919187b3.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791129205; cv=none;
 d=google.com; s=arc-20260327;
 b=keicA/WTX8v4YUnYnHM43o32txd9YeeEumiibXsNuaDh7Ru6ezatlG/km9tRkPIOpL
 u8BD+MbOFbBHrLZFAVWbJysLxYOlC0Glyt72Ce6S48WL8+uBBJnkIEytVzbTshPSHe9v
 /mTH4APJsmxtgf+p/vKJ60WJfg4gVTIW6juHUPdF8m5+itHvHjHClqJi4Dacz8MYvLT9
 hyatClIUiXO51kYEr+PRCxfESgOwjZZkxRPZ7pQdYUFOmWQgf+rCh62dKR50hLn0d9S4
 VpcieX1Kx/xvQXlSeNIQpkm2J0rOtEknHypRTYiDAIYpwvVzBA2su5UI8xQBJRwk2bUg
 BFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IPhuqLGHrYsnQ896hnkS6QDBb5AHYSO16+nV2JZ3S6A=;
 fh=0ZKxEcC13eJdw2uQTUQ0HgXwaKHwkLo5QDoJBfLMxRs=;
 b=UR2hV2uN8SmnQUWFO0n6+rLAFUHut7y+bOkgkV33hO27KI9OS3ekUgneDIEiD8lMFJ
 9efTK407Zx4XwK6LGZ6jpxJpQX2YBs2RawMky5+//PB1U222rA6veeVnvdiB+QIFoASV
 bvBelHfnSga6sJOlJmh/5YoVyWjKUGz2ncXwY+4C0JMomn5iCQ0RAcXPxK8MCaPc3qie
 p7/JGn6AfGn5YiMIjYreKR0Fc6va+ZzaWcPD/JaUuWkV8IsDWZ/o9PKs9zY0G3iXXjal
 DbRVao7RalEmPY8GW8zLUjbXdZnvXhjIiuUmaH46o5TzxbyRh5lPPmzc5vXRHVu1EAFk
 0Jag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791129205; x=1791734005; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IPhuqLGHrYsnQ896hnkS6QDBb5AHYSO16+nV2JZ3S6A=;
 b=J/27gv9cUs3b4mPhUHcKBNrshu6LvfDYUmDyQPcMIh0lhGaCymwpilCiEFRtn4heBj
 fH7lvwGyf/xSdcPE6T0ybDj3SgDxl6dV7l1W44XZg2c3RxylhuEq/47IubLZNET/+Rt6
 mQ35uaVZCCpZ4io+L9vCBVvKxgQwELzJmP6jUYbc+I1Sz6COuhytHGNDxSx7Yo6vG7vN
 NZueoye4wDalOWbfQAf+sZy5EtctsQ8kvBDVOZiL9n7eCFDlElgp+gWd4TsV3U4dsauh
 Bpdw0OjmhvtLVlFW/zRnH0Y+kZaP10V0hyria0pgOQW6o78zVQ74Ph6NA0Yq7hwbom/6
 kxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791129205; x=1791734005;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IPhuqLGHrYsnQ896hnkS6QDBb5AHYSO16+nV2JZ3S6A=;
 b=UJ2Y117knmfvbuCVhSLYIVbbqg/SPkqRzbuqQsgZq4nPZU3zDptSCv2tMV1X8wT6g/
 Um1zwchodSYnWLyfT+IhAqM2a2gyXzMqHuyRynueQUW8PQp2Oxl5u7CI4MIlkOpoAz1V
 JIwc4e9pXkAFivqJDqYJBY66pMTsioWfmZ/pVH0wMb1Ni9W60/8SUMZdlnVNN76hU/0F
 QbbsKcT8w2DygajUhErZekL14O2vOYRI4GhKNg/oKWOTbi6uAtmLYqOX/tfGNUSKumGs
 wl1ARezs3x6aHgJF9lqQbQrW2NOyJk5UrmM01rTt/j4NhcMpPshl82aCFfV/YDp4ubVP
 BjKg==
X-Forwarded-Encrypted: i=1;
 AKwUvByQdStspQKCdZiIX8XsGm8dY1ddrhUcGtuW85F39rnHb5XPACr0a49AVMu/YXp1sQtXZmuudoeocA==@nongnu.org
X-Gm-Message-State: AFq9FYJ0FGzZnENI8+wD4mMPJ/sGuIhW4v0+kGzKEqygR4XsfRUFFzNw
 4pRkSYkknIEWaCWAJKt1cLsl96SrUEyrNxOlAod06uJTOrbMrTMkGEMqiX5HAsb5lE+Uaeg/jBi
 Rfnvcpmf1uCbuaf+lWSytsVntM1U/ZoU=
X-Gm-Gg: AYBFou3qFdKCTfCZunrZhBDO84V/hNgwqH4IMD3QnlTGytKuQlLYe4kdr7QJrRIatgL
 5Z8QbQSJuq5u+t+PoeE2ESTKuX9D8dBU4ohjKhrXOF3EAOC3Y9VvrR7vHNcCN9EuMtaaWf+xp7q
 B+maf7dx68ZpGUotRdX1A6xSoNFvBFEFK3CZd4LmQZ/U3rbieYz+JNcJUgmx6ih37WPTCGZ8cde
 LouoBQZul8tBL4YNJWSXR5FXtSKcjtmPqHWfoz2g0Y97QtdCyI7gxU42NyXdsgEnls7iU46RZLS
 XZampGY8WTorgPNBkFW/efHLoEgGjJkDUmqf2+/CYdCXzAqp9NeujKXiE4dA0yDLvwk9Q3y9Kfu
 YWGMhTyEeE2ybzPA=
X-Received: by 2002:a05:690c:6c07:b0:8ab:42fd:2cc2 with SMTP id
 00721157ae682-8ae948abd2cmr18084437b3.3.1791129204937; Sun, 04 Oct 2026
 08:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-11-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-11-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:53:11 +0800
X-Gm-Features: AclHuK9C-2-y7S9nPdOcUh6UsopZpEUX2Y3UTQrWFieju1PrSZM9j_7xEKY6_vg
Message-ID: <CAEUhbmVcGKSUFLCKX=eREfmXwjq7oKTqjqsUxCus7-2g2WpwBg@mail.gmail.com>
Subject: Re: [PATCH v2 10/30] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
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

Hi Bernhard,

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:

nits: please add a simple commit body.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  MAINTAINERS                                |  1 +
>  tests/functional/arm/meson.build           |  1 +
>  tests/functional/arm/test_mcimx7d_sabre.py | 46 ++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f31245716a..a605d65d94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -935,6 +935,7 @@ F: include/hw/misc/imx7_*.h
>  F: hw/pci-host/designware.c
>  F: include/hw/pci-host/designware.h
>  F: docs/system/arm/mcimx7d-sabre.rst
> +F: tests/functional/arm/test_mcimx7d_sabre.py
>
>  MCIMX8MM-EVK / iMX8MM
>  M: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meso=
n.build
> index 761b371a8d..e49a04ea6a 100644
> --- a/tests/functional/arm/meson.build
> +++ b/tests/functional/arm/meson.build
> @@ -20,6 +20,7 @@ test_arm_timeouts =3D {
>    'bpim2u' : 500,
>    'collie' : 180,
>    'cubieboard' : 360,
> +  'mcimx7d-sabre' : 240,

This should be "mcimx7d_sabre".

>    'orangepi' : 540,
>    'quanta_gsj' : 240,
>    'raspi2' : 120,

and missing an entry in tests_arm_system_thorough.

> diff --git a/tests/functional/arm/test_mcimx7d_sabre.py b/tests/functiona=
l/arm/test_mcimx7d_sabre.py
> new file mode 100755
> index 0000000000..2894b5201f
> --- /dev/null
> +++ b/tests/functional/arm/test_mcimx7d_sabre.py
> @@ -0,0 +1,46 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import LinuxKernelTest, Asset
> +
> +
> +class Mcimx7dSabreMachine(LinuxKernelTest):
> +
> +    ASSET_KERNEL =3D Asset(
> +        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-ar=
mhf/'
> +         '20230607/images/netboot/vmlinuz'),
> +        '5851e9c61465a26db810796db671c4729e66e81c365b3ebb1a4b7f772737605=
b')
> +
> +    ASSET_INITRD =3D Asset(
> +        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-ar=
mhf/'
> +         '20230607/images/netboot/initrd.gz'),
> +        'fe33f836232a9107716d34dc56d36dea81bab039243a2a42ea6583a50c9b92c=
a')
> +
> +    ASSET_DTB =3D Asset(
> +        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-ar=
mhf/'
> +         '20230607/images/device-tree/imx7d-sdb.dtb'),
> +        'eed45fe3ba682cc814217bc4558551d36c034ec7a7692c4eb6eaf86132baf80=
c')
> +
> +    def setUp(self):
> +        super().setUp()
> +
> +        self.kernel_path =3D self.ASSET_KERNEL.fetch()
> +        self.initrd_path =3D self.ASSET_INITRD.fetch()
> +        self.dtb_path =3D self.ASSET_DTB.fetch()
> +
> +    def test_console(self):
> +        self.require_accelerator("tcg")
> +        self.set_machine('mcimx7d-sabre')
> +        self.vm.set_console(console_index=3D0)
> +        self.vm.add_args('-kernel', self.kernel_path,
> +                         '-initrd', self.initrd_path,
> +                         '-dtb', self.dtb_path)
> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Starting system log daemon:')
> +
> +if __name__ =3D=3D '__main__':
> +    LinuxKernelTest.main()
> --

Regards,
Bin

