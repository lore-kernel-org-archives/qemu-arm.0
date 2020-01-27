Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3873087lfp;
        Mon, 27 Jan 2020 07:19:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwN3nksOjFxfjI3pTfquvFVwhrOumIU8Obaw/5L6GpZls81fHVDCC+rIOFviEjWgpioN9rq
X-Received: by 2002:a81:2d6:: with SMTP id 205mr10711080ywc.14.1580138349433;
        Mon, 27 Jan 2020 07:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580138349; cv=none;
        d=google.com; s=arc-20160816;
        b=nB9628n0ZSXSP7gYPWSoUzgdlUbrsGCaCTRS5FVrtzfGLFbgJVf1xZuVBfTUXjqQuv
         +LYolbi0zqKaOCKwXFRROD+v1u60wvR2juV1eVUJj3rPFGDikRI5x/okSTR0KcoM5bpZ
         yu81hqmszQTkARQbFB60PXTltNNoQeuOxep/N4ELPb3b0nmPqqjLJ3iCYdFubTWAEkNv
         vwiGsCoy+cnhsl15C+dGU848N6SE30f82Io2V6a13CmVj40XRbkMZevqGt+6oeVGkHdn
         HgATV/AsnCIkX8+P1F7Sy1oH7I9dXGrOJLyCSoFkgcHI9sq6fYTT6JzKesFU2VcSsWNA
         xXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/Nm2UeblMIA5MtaE1a+vcuGDgp7ZqXVKbrFqL01t3ac=;
        b=lYfzvbN4jW7pfWgu/YeqdDteorcWswDRrElG4Aj0WysrwDX25OooJp3O7OuJCyIP6E
         jDeRLj0UoOUYlKDKwmrfi+/Rks+Uk7DByHQ71jq7XO2wHvkxZ4plxI4PCY+Z0z1d+EGV
         wWM/7gNlhVcWvPuIvZDDB80M05oUs9zcYuZwpbGWMyM8fqchhJwNaBfNfZkfzrZDtYvR
         tHfPpa9q7USeSv3fuQPSAcLGizb+pwaid5G6O7rf8GRrNEiRHm2blqM9WYISEniRmsft
         M4bFLTJqRHMv1lMeX5Q2E7DHrFqqM4vq3QoQ6kbuu1IhWlUkYSOFjaTJkupMv3C7w++o
         2yPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jr9fuLaf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p207si7991338yba.80.2020.01.27.07.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jr9fuLaf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580138348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Nm2UeblMIA5MtaE1a+vcuGDgp7ZqXVKbrFqL01t3ac=;
	b=Jr9fuLaflMowVhMqqR/rjromegfekRh6HVpZRr+FK2OXbLs1aIS83KNneRxBLygZhAfklQ
	vR64IyPrYPKA8kSzuQt9TflyOxGcT+7zoYnravS7pfEV42ib18QsBYz9hhF1wS/Dvv0N0E
	mj/tXoiDg/nGLEKXTr3AplKeCkEDFSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-bFsMPLjWPOiDfb652wZPCA-1; Mon, 27 Jan 2020 10:18:53 -0500
Received: by mail-wr1-f69.google.com with SMTP id k18so6239266wrw.9
        for <alex.bennee@linaro.org>; Mon, 27 Jan 2020 07:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hvcpOTXG4vCjHHRiFXVbAAlw33/h0LwmxeMkqtTzrU0=;
        b=Y6W3HzjZ5rotpTKqlSpV/cHQGyX6n+xGQxdeY5EFnJ6D8l1KUb3exNfdTIkHrybd11
         d0jJKN06Q/AM4dxs+eL6qUH+SmSoNfyxF6k1W118bMbln1o2IjFyxbbrPu9mZB+EN5q7
         eiDV9vaCUUNXoMtWC/Pj08IbClgl2YAo2Y/6SWcZCjWZZ6OnC3psVdBIhnKJl9lo2ItY
         AjCs/KMzY1D2H+qa/k7Qi77ijKjoayKvp5upFBQd34fQFaHH+X8qoxyLVOklzcrEYvnU
         IjNhFCMCLrsfysgljW8bOEqG+TmEIFeNnVgYpRvzFoiPNQgaMPzvA0gYA44oyAumJJjr
         KPpg==
X-Gm-Message-State: APjAAAWHRErbzou5GWcLpyhNNVFcEDLs1XiFooLcf2KLsHhEO0bmeHE3
	NhjZxTuHD1UqqW0ehqQrtVcp+Su3Ww0Bd7OOaRfAh2f5AAuX8YPBtAdd9aCdu1LWSZfzD5EO54G
	rYLgR6bZIXvQOR/Vg
X-Received: by 2002:adf:e591:: with SMTP id l17mr22878346wrm.139.1580138331460;
        Mon, 27 Jan 2020 07:18:51 -0800 (PST)
X-Received: by 2002:adf:e591:: with SMTP id l17mr22878322wrm.139.1580138331224;
        Mon, 27 Jan 2020 07:18:51 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id b16sm21319860wrj.23.2020.01.27.07.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:18:50 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200127144126.15515-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
Date: Mon, 27 Jan 2020 16:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127144126.15515-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: bFsMPLjWPOiDfb652wZPCA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: dxRhfrOVH7TF

On 1/27/20 3:41 PM, Thomas Huth wrote:
> The canon-a1100 machine can be used with the Barebox firmware. The
> QEMU Advent Calendar 2018 features a pre-compiled image which we
> can use for testing.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/acceptance/machine_arm_canon-a1100.py | 33 +++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 tests/acceptance/machine_arm_canon-a1100.py
>=20
> diff --git a/tests/acceptance/machine_arm_canon-a1100.py b/tests/acceptan=
ce/machine_arm_canon-a1100.py
> new file mode 100644
> index 0000000000..3888168451
> --- /dev/null
> +++ b/tests/acceptance/machine_arm_canon-a1100.py
> @@ -0,0 +1,33 @@
> +# Functional test that boots the canon-a1100 machine with firmware
> +#
> +# Copyright (c) 2020 Red Hat, Inc.
> +#
> +# Author:
> +#  Thomas Huth <thuth@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
> +
> +class CanonA1100Machine(Test):
> +
> +    timeout =3D 90
> +
> +    def test_arm_canona1100(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:canon-a1100

To the maintainer taking this, please add:

            :avocado: tags=3Dpflash_cfi02

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

console: Switch to console [cs0]
console: barebox 2017.02.0 #2 Mon Nov 12 09:28:33 CET 2018
console: Board: Canon PowerShot A1100 IS
console: digic-gpio c0220000.gpio: probed gpiochip-1 with base 0
console: cfi_flash f8000000.flash: found cfi flash at 0xf8000000, size 4 Mi=
B
console: malloc space: 0x00100000 -> 0x002fffff (size 2 MiB)
console: environment load /dev/env0: No such file or directory
console: Maybe you have to create the partition.
console: running /env/bin/init...
PASS (1.86 s)

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        """
> +        tar_url =3D ('https://www.qemu-advent-calendar.org'
> +                   '/2018/download/day18.tar.xz')
> +        tar_hash =3D '068b5fc4242b29381acee94713509f8a876e9db6'
> +        file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-bios',
> +                         self.workdir + '/day18/barebox.canon-a1100.bin'=
)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'running /env/bin/init')
>=20
