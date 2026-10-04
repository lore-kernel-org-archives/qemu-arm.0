Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942AFCA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:48:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDORV-0002rP-I0; Sun, 04 Oct 2026 11:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDORI-0002mD-Qz
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:47:49 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDORH-0007R4-4R
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:47:48 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8925e417565so6805547b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128866; cv=none;
 d=google.com; s=arc-20260327;
 b=O7qMh6bdWdsJuPYUZvElPDzretc9CBA2HprzMdM86kWGbFL80+M/h9uPoDYRd3KP+J
 lHPjpsvc9Po7Cf6UqJqX7ygKaHopR3ObFgV1uLoz3XxiwRHtfMZRlWHZ9CNvqnACSzmk
 CKkPvD/9IDZHDir8MvZ5N0/upOruanjczYqXXynpn4eMeAtmUICc45Ex53PG+oPFJBrG
 ePIAQARySePh/4luZ3iSjpurKN3QSprWoS9gphT3+jH/AHukNSXUg0tfuMmyC5LA71Ev
 oNP82slmC0f1D8Lo05wHAcEPNczSJWxZGVTk5oGf1EoKUPfI4QG2oXffspevG6hJiML8
 32Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QTO3DfG1oxftptPpiajQV/Fsp6AfJiZczYgK4cqsWWQ=;
 fh=ofIyQNz+kmPI529FDU9K+PdTcUheANPLBC0gyb5OO1Y=;
 b=Lhn4l/hfkdWyg9SLkwPl+Khh+p0NyJtN3UTTuv4WwmADdU1xdrGYmpghL3qiwDHjRX
 Q2jPAlIYMdmgk7l1YJD7WoCNEdNRC4pG5XmR+LcaFGyZ6XO4jG3QbsqRo2a8W2YQQtA7
 llYYxV/4WqMzfxHgCDGuNx6vrHkxFlHey8wEu1WkRNZiyHhlh4NYEVCF31EFR+QupCnD
 zSaVbkbQ4d4uKJTPFQr//eX9EtNZak2v6SRvhaX8rfC6qGqmD1S18z4+j5Xxi1/lHaYd
 lQGVKakBjQYyRMTlPU1pjp7POGeaNRCnqwhcX0T0sbBkXmCrWEc1hOt/uyZ9lRyo7h0m
 HsPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791128866; x=1791733666; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QTO3DfG1oxftptPpiajQV/Fsp6AfJiZczYgK4cqsWWQ=;
 b=QbSpw9qkip08KV2YqPYajlchcAEJMW9GiwxDHYtVXZ7mpR3cut3XlegTEgK/8X/Ih1
 SiCFeUDD2US5uIdEgKoMBBo+YtKz+Bp68Swg3RVRfVwIqbgDRCjyYk/oIfRi7uOzp7+Y
 WO3Gu6yfQx4xvqsdwOLlwygU3RbTY8vfTCdynVRkeG3EWorUrD1BAg13dUnUw4yCKKqs
 pSka4Rw/qWVF34RRzcCNai8B9nMdyQkdQqt9alORlOJvOo9fZiifdrUKHEB3m8sbxXsT
 L6RVUtdHFbLM+TSDPHuRLzlfCWNkdycxIPj0a4bvVamnmxXFeutD6jvZ5Y7e32krk4mV
 FCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791128866; x=1791733666;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QTO3DfG1oxftptPpiajQV/Fsp6AfJiZczYgK4cqsWWQ=;
 b=w5PfsjCMxvqqbT/3F9vtEOTRWapHonae4sKVDIjkip/33y0sUpuqirOi0YpB7LSvhP
 pEBdkm/freJyTAsG3Vvwf8E2RE9SiaXXkJwgKDf8UB8O9M2iHwx9lisg9jcF6zw/0IVY
 tKWpAKEcM1LQSnPAdg+vFFGwDHR9dvE4gQBVdj/xtLeaibNvi9MvRWbOxaTIBNu4AoEN
 yOnIwSH0sQ4A3tMitWxAJR8VevaONK3nwMMNbCSKeia+KAvP8IF2XQ+f4ak8m7Jh97xr
 PGCdFrXFB3NKqMdIiEZ6jIeR75WAjhs0f/5ECs69We8PmMmNVddD27Dj0cCD5aIYkRAL
 uiGw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhleUrQHB5EZe6uSSIRH+7TdLAjShXWjNMCKfnTMJ7P7ZLCB2MkI+ncCjkGncizO9ZgHwR3JMeBg==@nongnu.org
X-Gm-Message-State: AFq9FYLL9o0roEetJZwhLxgem+ZdXfVum2aYP/hENKITQbL3srPEDDhk
 2UBw6ucE1cU2yDT92XjCMeEJX0Vu/eP7ZuPbl0x85+0Mq3Pfd0JN+cnMxunk9ytuWuYeF/EavbO
 ByPMPVrLtN0gKq8ZL7YjP/kxZ11QnrX0=
X-Gm-Gg: AYBFou2wJ7API+bGID2yb9V9e0XCmtsa3BXMGnL92HX1siA4OvG+T3WXNB6RlbecfUh
 nGqgSMeuIksby5zADUNyzR+pFPrGCJ+7/kTy7Aj+PzyiUZ4GW/KodBXdNUr2SlYjWB8CeUihDWl
 F+1SMAqrcC2xIZl67fQUzwIf84BDW7qd5dQ3jNzKKmdx/YzmtZ7UlDcVxOKMnan2+H3XLv2rxJ6
 HheWtHPz8cNAtcH0wuMLsmf1WGFOlntuRFfXf52F4pwsnkZ3Txne37D3RARQiktzMbg7Q43ngkW
 ZGUcGgNX+C3oy7QPA2yTDF95Hd+p2dBDSUmPeJtRR/Jo2zqGiEtpU9WeiLvjIN7d1AXJ79N6xCz
 RQV28ZDDn7rqhPA==
X-Received: by 2002:a05:690c:3481:b0:8ae:9448:14cf with SMTP id
 00721157ae682-8ae956db0admr15501977b3.88.1791128865861; Sun, 04 Oct 2026
 08:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-8-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-8-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:47:34 +0800
X-Gm-Features: AclHuK_rEvqBNv-BKynrvq7C3_TUg_Rcen7wtFQj8S0sIy9iKBQOZ3ccua6lA_0
Message-ID: <CAEUhbmXNFb49nObiiqL4QF3xDLWE=r1BfEgS11zOZ1rWN=NhRw@mail.gmail.com>
Subject: Re: [PATCH v2 07/30] tests/functional/arm: Add console test for
 `sabrelite` machine
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1130.google.com
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

On Sun, Oct 4, 2026 at 8:28=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:

nits: please add a simple commit body.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  MAINTAINERS                            |  1 +
>  tests/functional/arm/meson.build       |  1 +
>  tests/functional/arm/test_sabrelite.py | 46 ++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100755 tests/functional/arm/test_sabrelite.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1312bbd1bd..f31245716a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1054,6 +1054,7 @@ F: include/hw/usb/imx-usb-phy.h
>  F: include/hw/arm/fsl-imx6.h
>  F: include/hw/misc/imx6_*.h
>  F: include/hw/ssi/imx_spi.h
> +F: tests/functional/arm/test_sabrelite.py
>
>  SBSA-REF
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meso=
n.build
> index 61b00932db..761b371a8d 100644
> --- a/tests/functional/arm/meson.build
> +++ b/tests/functional/arm/meson.build
> @@ -24,6 +24,7 @@ test_arm_timeouts =3D {
>    'quanta_gsj' : 240,
>    'raspi2' : 120,
>    'replay' : 240,
> +  'sabrelite' : 240,
>    'tuxrun' : 240,
>    'sx1' : 360,
>  }

Missing adding an entry to 'tests_arm_system_thorough' otherwise the
test cannot be run automatically.

> diff --git a/tests/functional/arm/test_sabrelite.py b/tests/functional/ar=
m/test_sabrelite.py
> new file mode 100755
> index 0000000000..31a0a49eac
> --- /dev/null
> +++ b/tests/functional/arm/test_sabrelite.py
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
> +class SabreliteMachine(LinuxKernelTest):
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
> +         '20230607/images/device-tree/imx6q-sabrelite.dtb'),
> +        '3ad637c8ea55ebd058a67f686e050b82ccb0d1327bc283623c133c48ad87db4=
4')
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
> +        self.set_machine('sabrelite')
> +        self.vm.set_console(console_index=3D1)
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

