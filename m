Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1344606A32D
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ovq1T8UV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWzdW-00011s-JT; Fri, 27 Nov 2026 12:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWzdU-0000zQ-SU
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:21:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWzdS-0006bg-Ip
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:21:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so67984145e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 09:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795800081; x=1796404881; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DmB8Ngrm60cArqmJc2FvpzPwFdkZqNBDPG+fqVqHD4c=;
 b=ovq1T8UVqo7KyV/YQDG0ID9+7EFaRI4qlNDSlS6XisBMeO0OXU7n5eqiyQH4pdjSjr
 syKNvEkDIOwD7Exg04JUo+7weae1fv7Pf6Z23eUFugeLMgQnSuaAUoIyYxs1/x+PfY6F
 ROzWCMcyq0jR330vH3Pt337+tUVzrCfbYJF3S7KoTbfbpc8lJbotM5AooZPhM3F/4viG
 puWzQy8XJT2XGggYzwXx7o8+f4CPg+Wpk6ByEpUSO9Lqlf4/GpbhducQI4XfCAdorQui
 sTyGMupFwtUOjjsvNTa+GKgtK88rmTMGsWv/zEAFd33v5Qp0JNl/1yGcWUocUcdRGmyt
 OYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795800081; x=1796404881;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DmB8Ngrm60cArqmJc2FvpzPwFdkZqNBDPG+fqVqHD4c=;
 b=qWZF6wT1ZLdZBVB7xQhO3YJxWous2Cio4UezHTgnjaFF3jENsVdlykOJNvNeeAQZC4
 ngRLjw5mlvRdBkiaorJBjdtxpGKBnzdA5xw6lQXHp3KOa/NqcAn+wmn+MUlMSrCOMfEq
 CnESwm5Dc6SnnFkA7CjLxFKd4JGcACev2eJKIASoq0rWIag3X1ZnoKoSTTEErzD3IQ1O
 Uf3oQ5PsCX/o7k1WrGzcf1f+yMAYswZ6TIWBD9ijaZrmoPlLMC2kFb5uyaUr3oqgiGff
 TuLhKsJFaJorJpLMpq3QxCzRuP8Y1y4WQEnKQJ+hgzryn0F5TChRAysfChlR27uM+/kr
 GJEQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE5PHxOEfCrisMxM/yspM4bgVVe7lxuiWJm6GTr8UsUFGo2QhYBHBbVrqlRv01/3j7czXujzpFmmQ==@nongnu.org
X-Gm-Message-State: APuU4Z9UeeadIq6Z2N3DUs1HDXug9WLuNv+1Qqd8A/gLAaJ6MviYsI+U
 jO9sWB1GyDWdSti5yfzY/p/P9432UWcSjTBn6iLrZkjMA5/bazrGk+PAII9DG6BUo4s=
X-Gm-Gg: AZFdTZdqqsxSR4A2ppz00ew3OLhgbcsuQZp5zHy26gpuW7cXiiURDlLUaoHu1KNdKXV
 vLDkxiofhbV5vcqTQOt4z9DsmgYuIRkM8+ntaXANT4CPc8R4JQms0QktA8avseio+8WZIBvA41g
 VPcJRk+WGl0LzEiDq2jT3n0N+EBGsUEKntTRdqTybS/AUChrOZ58nghlGQYN1+ehti2b2bl++2b
 +mFdHeXRiE07C/OMi+SC9KDL6duN2pDqSNtsE8LDMy52U0Z5tul13xKUNX8sNR3XZ6HjEqJbXjo
 JSkCAY11SbNx4JoqFTmoB+yubD61iA2IkADaI27ZX55RRwxWWdF5jpAVeall1d4+26NFKQrA1UL
 agp+0zMIEwP9psdu/MMCj6xr1Oqi+vWZMjWLbOpVnzFzTA5Wlgyl2mTaptL5VIYzt/soHo2pN1b
 068sJj4Frx+G6ZT5OJRG4EzFUW0Dpcq6IPo0seEMLva3QURZWxG6cLbgg+HfTreuZrPaYjgQV9E
 EGn83mS/I3fRnGkTyXC0ocjFpQmrb3AqyAtwa4WFEdOaD4PKLSovmodCrCTUwOKmVr7Eg6DBi5s
 YTzb4fs6cx4SO50azBgm96trs4Rnx0RXpn07W29G+MD2Wx5eRQ==
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4bb888120famr517529795e9.16.1795800080792; 
 Fri, 27 Nov 2026 09:21:20 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865a2sm735619755e9.3.2026.11.27.09.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 09:21:19 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B766F5F8CD;
 Fri, 27 Nov 2026 17:21:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Maximilian Zimmermann <maxz@spacecubics.com>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 3/3] tests/functional/arm: Add SC-OBC Module A1 test
In-Reply-To: <20261127-add-scobc-a1-board-v1-3-b572280dcde1@spacecubics.com>
 (Maximilian Zimmermann's message of "Fri, 27 Nov 2026 11:13:36 +0900")
References: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
 <20261127-add-scobc-a1-board-v1-3-b572280dcde1@spacecubics.com>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Fri, 27 Nov 2026 17:21:18 +0000
Message-ID: <87a4mutckx.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Maximilian Zimmermann <maxz@spacecubics.com> writes:

> Add a functional test for the scobc-a1 machine, so that regressions in
> the board or its console UART are caught.
>
> The test boots the Zephyr v4.5.0 hello_world sample built for the
> scobc_a1 board directly into HRMEM and waits for the boot banner and the
> greeting on the console UART.
>
> Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
> ---
>  MAINTAINERS                           |  1 +
>  tests/functional/arm/meson.build      |  1 +
>  tests/functional/arm/test_scobc_a1.py | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc02f6e1be..3bea382cf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1104,6 +1104,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/scobc_a1.c
>  F: docs/system/arm/scobc-a1.rst
> +F: tests/functional/arm/test_scobc_a1.py
>=20=20
>  Stellaris
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meso=
n.build
> index 72c7afc84a..88e567e90e 100644
> --- a/tests/functional/arm/meson.build
> +++ b/tests/functional/arm/meson.build
> @@ -70,6 +70,7 @@ tests_arm_system_thorough =3D [
>    'realview',
>    'replay',
>    'sabrelite',
> +  'scobc_a1',
>    'smdkc210',
>    'stellaris',
>    'sx1',
> diff --git a/tests/functional/arm/test_scobc_a1.py b/tests/functional/arm=
/test_scobc_a1.py
> new file mode 100755
> index 0000000000..41d18cfef0
> --- /dev/null
> +++ b/tests/functional/arm/test_scobc_a1.py
> @@ -0,0 +1,30 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots Zephyr on the Space Cubics SC-OBC Module A1
> +#
> +# Copyright (c) 2026 Space Cubics Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import QemuSystemTest, Asset, wait_for_console_pattern
> +
> +
> +class ScobcA1Machine(QemuSystemTest):
> +
> +    ASSET_HELLO_WORLD =3D Asset(
> +        'https://downloads.spacecubics.com/development/scobc-a1/qemu/'
> +        'zephyr-v4.5.0-hello_world.elf',
> +        '1578aebe742e4b3fc10af22994de4cd7feda3b54be19486a2efe42c099734c6=
0')

It would be useful to include a manifest/config in the directory and the
reference hash of the zephyr checkout in case people want to
re-create/expand the binary.

But otherwise thanks for providing an image for the board model :-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +
> +    def test_scobc_a1_hello_world(self):
> +        self.set_machine('scobc-a1')
> +        kernel_path =3D self.ASSET_HELLO_WORLD.fetch()
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '*** Booting Zephyr OS build v4.5=
.0 ***')
> +        wait_for_console_pattern(self, 'Hello World! scobc_a1')
> +
> +
> +if __name__ =3D=3D '__main__':
> +    QemuSystemTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

