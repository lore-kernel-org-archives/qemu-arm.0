Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2508924lfp;
        Thu, 30 Jan 2020 15:46:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUWuLlaEQ+iKuZLZTSuGW/VytNT3uV5iK3YB01N80fep7iMOE7BcoL4cMovatQ6+6YaX8b
X-Received: by 2002:a50:ed18:: with SMTP id j24mr6345923eds.124.1580428007689;
        Thu, 30 Jan 2020 15:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580428007; cv=none;
        d=google.com; s=arc-20160816;
        b=JTmXQg+0ntoJHYpCY4/N/tT3xwMC2Lehz42FYdeGq7qrasP/9pTucDnjAqvHdSOk8H
         GFVsV55OmtIPq/sgsj8tRU5njDrcU5PHufzPx3oJAYzzsZxQJ2zU6RFlwvJ6YVddlviN
         wXT1hSM3FaT2FSoP5trBz63u4KCEXWWTwRf0tAUlFBW7TY8wV1jdOG6g+LwX4hVaLD9f
         jZ9tSIrOuptezsjWkFv3/ZoykH/HKAZ1LlmXwaHZxTeKh3tzqkjWcMXIRVL2Z3/AjPhH
         Vg7W2T8WqkgloTtgZUJU2U/aI4NaVEwJw9g58BS3yG8ABNsyMDEoobD8v5D4hl8GrM+F
         JxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=E/1/fpM+uIvTTGLaInPwc2lQDzHE5KcORyzhWhPzClE=;
        b=P+wrzaxM3+6lNGJkmM/5H30Y88FlSrefNYoOJ6pcFhUFV7KQc4iBYVCY6STlChc2PD
         9a66rQWUZ03Rb3HxsnucVsIm0cZEfWkQdAn1qBG6LabkBXaowC94qyvPB6FFskZI0uf8
         oaZtpU/9LfkUIgYGOnrCVT2m51qGz+kKTPKQb5pfZTEf7px8b1tMdCgfypEFB+rnd2iT
         o2uA9CbKyhR0BHyNGcyHBkuVkuitpy8s+TRRKZzLOK9oV+IrcFMWtO3jhZ244WXyC4/B
         gNOj/CL8gev2f2y2rAqktt9XRdMkRBeg4xWeT0rst8mRY6NRytvgwe2ah0ypQmj/WPi9
         vJcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dGAl9LD+;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id p14si3878848edr.17.2020.01.30.15.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 15:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dGAl9LD+;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580428006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/1/fpM+uIvTTGLaInPwc2lQDzHE5KcORyzhWhPzClE=;
	b=dGAl9LD+rJQDaaweNX/STkFFRHG7807PCBVddImyLBIstF2+wm9qJW50gu9uc20MmbTwoJ
	RSQqmXTsp4qnoI9DOvOEsyOKcrLiHrBeWcX4wxEXqK+IoWFVAHx4YMWFAUrVV+gcby2U7q
	yO+/bwkUDJ7oWTdn42Ga2QCiyqrJU7M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-uNx4ssIsN2-9MLx2EQGiMw-1; Thu, 30 Jan 2020 18:46:43 -0500
Received: by mail-wm1-f72.google.com with SMTP id b133so1376263wmb.2
        for <alex.bennee@linaro.org>; Thu, 30 Jan 2020 15:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dLEGO8KYRWQaQYVfnRG/qPNSgEXfE58ncEinyGY2FMY=;
        b=aaD0YfJyRpN4gayMq/KfmWeYifukFcQHQqK6/ilPSF+920ElsDCl+27CXYZ6M60pKy
         W01LYdQql9JiCeJkHMHUPDxoxyw9Qela6Tj7s5T0Lpxip37CSinq+p2e5U9Ir5RnTT3Q
         bwk6DA7Jx5ncQq4Pu0lRkBEVQufTqOhpfRwhypVh13ypPvVW5L3GBNFiEjHWvHs3RjOj
         5BCIvbDJviaMOMKtlP4IQ42smnumsYV7DIcp/Y6evGO8Ac6JmG5xgZZ6wgP427LbOfvn
         +lwqX+01h6M75FgdYBID6btRs2SiGze2evPTV8dHkfguzqkwyLFnbir/vebfO0M2FE79
         lh7Q==
X-Gm-Message-State: APjAAAXEPSgTzEjAEWR53qv03Lo/KBUixWPEZZ6LDoC6sjZWpYlkNSpN
	SZg2J7gDwEu8tIugLXz4Ngo076BwAuZumJrjYQdjqdHbDymacHR3G+Lgb3h8PGQzKzvv73CBFQB
	vCjh9D9+tJ+rLxurR
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr8094144wru.173.1580428001385;
        Thu, 30 Jan 2020 15:46:41 -0800 (PST)
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr8094123wru.173.1580428001129;
        Thu, 30 Jan 2020 15:46:41 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id t9sm7884427wmj.28.2020.01.30.15.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 15:46:40 -0800 (PST)
Subject: Re: [RFC PATCH] tests/acceptance: Add a test for the N800 and N810
 arm machines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200129131920.22302-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <647b2004-4b56-7322-72ba-abb0309938de@redhat.com>
Date: Fri, 31 Jan 2020 00:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200129131920.22302-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: uNx4ssIsN2-9MLx2EQGiMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: mlrP0A8328Iy

On 1/29/20 2:19 PM, Thomas Huth wrote:
> Old kernels from the Meego project can be used to check that Linux
> is at least starting on these machines.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   The serial console is written to the second UART, so this needs Phil's
>   "Allow to use other serial consoles than default" patch as a prerequisi=
te:
>   Based-on: <20200120235159.18510-5-f4bug@amsat.org>
>=20
>   MAINTAINERS                          |  1 +
>   tests/acceptance/machine_arm_n8x0.py | 49 ++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 tests/acceptance/machine_arm_n8x0.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddf6fe0794..560507e821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -672,6 +672,7 @@ F: hw/rtc/twl92230.c
>   F: include/hw/display/blizzard.h
>   F: include/hw/input/tsc2xxx.h
>   F: include/hw/misc/cbus.h
> +F: tests/acceptance/machine_arm_n8x0.py
>  =20
>   Palm
>   M: Andrzej Zaborowski <balrogg@gmail.com>
> diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/mach=
ine_arm_n8x0.py
> new file mode 100644
> index 0000000000..e5741f2d8d
> --- /dev/null
> +++ b/tests/acceptance/machine_arm_n8x0.py
> @@ -0,0 +1,49 @@
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# Copyright (c) 2020 Red Hat, Inc.
> +#
> +# Author:
> +#  Thomas Huth <thuth@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class N8x0Machine(Test):
> +    """Boots the Linux kernel and checks that the console is operational=
"""
> +
> +    timeout =3D 90
> +
> +    def __do_test_n8x0(self):
> +        kernel_url =3D ('http://stskeeps.subnetmask.net/meego-n8x0/'
> +                      'meego-arm-n8x0-1.0.80.20100712.1431-'
> +                      'vmlinuz-2.6.35~rc4-129.1-n8x0')
> +        kernel_hash =3D 'e9d5ab8d7548923a0061b6fbf601465e479ed269'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> +
> +        self.vm.set_console(console_index=3D1)
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', 'printk.time=3D0 console=3DttyS1')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'TSC2005 driver initializing')
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_n800(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:n800
> +        """
> +        self.__do_test_n8x0()
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_n810(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:n810
> +        """
> +        self.__do_test_n8x0()
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
