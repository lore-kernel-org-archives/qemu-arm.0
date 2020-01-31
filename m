Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp901757lfp;
        Fri, 31 Jan 2020 09:29:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzh8giJOAUyLoaYriRoD7Lu7kgKLhv/keRNipsk2mjXVtEwg1LsiSzi4ZEhNSxmUx4VxFXF
X-Received: by 2002:a25:ccc7:: with SMTP id l190mr8891755ybf.94.1580491783344;
        Fri, 31 Jan 2020 09:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580491783; cv=none;
        d=google.com; s=arc-20160816;
        b=pxr0nxnKwSQjNAYWA6PEihqko0dPKkkDxBaFA2T+FAx1y9RuzQxplEqyhBUqCDtoyD
         TFHBOOTrGaI5ETAxOqcVJaJ7AYkUS0JsOcs1SECsFtZ6DWbc4PJNFMlnzIUK1nyMXQCu
         7AVaKu7mYBjRPn9D8Gm86EAePvoUgNTZEW+MS67E8Vf4U4+by0kxJ0TO1244htwZ4vt3
         dXqdG0gR7lTNjgkzWeeWD+S1gGbS4R/yfkaRYnHEMuXjwlxCbnkJOHDj8Mot3kmqJmmI
         jHPDt7suHnzHo9F8buR9F3ZdfU5TZqTyi8ZVM5/o3lRybofSlhT/4FErywtIJZR4pBHH
         60+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=RiUUERfxtQIni726C2SFhdCH+wyDUGW8ag+xGhC92Uk=;
        b=TLhfIz3zHNunE9ExfLZa/FvNbObCClNKRnHTfkHTs5hltGFv/raLmttnXt7bvtBI+T
         jd5aNgA1BkMGlvZ3BJI4WjW2yq5wHW0dkLdyyZDWBzacytckHSXbitbi2Xog2yBqBxip
         1juXm5ZqSNf9kse7RjgOZAMyRSSKFereiu222Yd6OSvntYg1Ph21gjj5+Gy2mhnw2nw/
         tIj5ex9V1KsIE8CqEyO8OKu4zh3ksTbxZG6bF7tnLt0iD0SD0fRYv4P+QYTmHnRzYqEJ
         pwAWic3FRuTH+J62OfNLdFga346iZuLhW8qo2DzhXeH/zs+/e++LtYvsbLmWI3U8dlXB
         ihew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkelNtlN;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id z125si5230164ywb.150.2020.01.31.09.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 09:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkelNtlN;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580491782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiUUERfxtQIni726C2SFhdCH+wyDUGW8ag+xGhC92Uk=;
	b=dkelNtlNRHIkAQDqc8Z/AtVO+cGDOQJJi+wsIgIq+yhG+gNDKoNtu5jZKGdDZm84+uJMSQ
	RBb8nyYHBjQtAp5cGScBDJikjF+Idw+W80jU3nM6jGyGhUo9/hIBCazIgC17xWdhuq9Ulc
	zh70zREs3x2bpaGiAM5Dkc1WDC/5G4Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-1fiGFLQ3OY26ia5fYR8n4Q-1; Fri, 31 Jan 2020 12:29:40 -0500
Received: by mail-wr1-f70.google.com with SMTP id s13so3682361wrb.21
        for <alex.bennee@linaro.org>; Fri, 31 Jan 2020 09:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pyWs5en4emEbQSJRUh+L57NzcxSke7rDEsQR7e4lZLw=;
        b=sDdMOxmADFCxhZr24FFjMP34X+syLYyy5NhwiBqMFBVOlkn1563OXRRfbEcUIGvV34
         P4oBXg2mlZkapcYYJY97nqwQbfXgxST5Vdy/rR0OGxFBCA2tmPR02mrJma1f9s7hikFs
         hsCBWyO7WUT6gzbT9sf6JfigMBDZ9vzPWs4xfHmhZ/S+fWrfIuSqr1riun554Q8kY3ng
         eObwxTU7L3v1xLI+rXMjTOQCmPfHzQSPdMKtY19ElQuBtsPayegm0onV853SWQymMm1u
         fjx7CmFaHUZRzY+dbEI3RdcUzEip6ny7I3WSqv250auOv68xooRxceES5ap1CByt23N0
         gcpg==
X-Gm-Message-State: APjAAAXEprHB9E/NR8hckXiH4B3xyBTvIhZAhagjyIUZyCdt2BEROMs+
	ncZYxEf23+Qh9YD9EL9QDThs5jVsxFMpvqXeiN3eAoI7Uo8NG0j8ECzvtOt/w+8z2puPNHpsPZc
	y1ru9PT515NYEoKXm
X-Received: by 2002:adf:f401:: with SMTP id g1mr12906762wro.129.1580491779548;
        Fri, 31 Jan 2020 09:29:39 -0800 (PST)
X-Received: by 2002:adf:f401:: with SMTP id g1mr12906744wro.129.1580491779258;
        Fri, 31 Jan 2020 09:29:39 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id r3sm13207724wrn.34.2020.01.31.09.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 09:29:38 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Add a test for the integratorcp arm
 machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200131170233.14584-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0919c227-fcf6-44ae-c3de-2ce2ce13ea3d@redhat.com>
Date: Fri, 31 Jan 2020 18:29:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200131170233.14584-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: 1fiGFLQ3OY26ia5fYR8n4Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: B+IId6rjd5YD

On 1/31/20 6:02 PM, Thomas Huth wrote:
> There is a kernel and initrd available on github which we can use
> for testing this machine.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS                                  |  1 +
>   tests/acceptance/machine_arm_integratorcp.py | 43 ++++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 tests/acceptance/machine_arm_integratorcp.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e4976d366..6a03835037 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -599,6 +599,7 @@ S: Maintained
>   F: hw/arm/integratorcp.c
>   F: hw/misc/arm_integrator_debug.c
>   F: include/hw/misc/arm_integrator_debug.h
> +F: tests/acceptance/machine_arm_integratorcp.py
>  =20
>   MCIMX6UL EVK / i.MX6ul
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/accepta=
nce/machine_arm_integratorcp.py
> new file mode 100644
> index 0000000000..4f9ab40f2f
> --- /dev/null
> +++ b/tests/acceptance/machine_arm_integratorcp.py
> @@ -0,0 +1,43 @@
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
> +class IntegratorMachine(Test):
> +    """Boots the Linux kernel and checks that the console is operational=
"""
> +
> +    timeout =3D 90
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_integratorcp(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:integratorcp
> +        """
> +        kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
> +                      'arm-test/kernel/zImage.integrator')
> +        kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
> +        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
> +
> +        initrd_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
> +                      'arm-test/kernel/arm_root.img')
> +        initrd_hash =3D 'b51e4154285bf784e017a37586428332d8c7bd8b'
> +        initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitrd=
_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', 'printk.time=3D0 console=3DttyAMA0')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Log in as root')
>=20

Nice. I see the framebuffer is also working.

I'd add a test on the CPU, and device listed:

Log in as root with no password.
qemu login: root
login[724]: root login  on `ttyAMA0'



BusyBox v1.1.2 (2006.05.04-15:30+0000) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

# cat /proc/cpuinfo
Processor       : ARM926EJ-Sid(wb) rev 5 (v5l)
BogoMIPS        : 930.61
Features        : swp half thumb fastmult edsp java
CPU implementer : 0x41
CPU architecture: 5TEJ
CPU variant     : 0x0
CPU part        : 0x926
CPU revision    : 5
Cache type      : write-through
Cache clean     : not required
Cache lockdown  : not supported
Cache format    : Harvard
I size          : 4096
I assoc         : 4
I line length   : 32
I sets          : 32
D size          : 65536
D assoc         : 4
D line length   : 32
D sets          : 512

Hardware        : ARM-IntegratorCP
Revision        : 0000
Serial          : 0000000000000000
# cat /proc/io
/proc/iomem     /proc/ioports
# cat /proc/iomem
00000000-07ffffff : System RAM
   00022000-0020431f : Kernel text
   00206000-002670db : Kernel data
15000000-15000fff : mb:15
16000000-16000fff : mb:16
   16000000-16000fff : uart-pl011
17000000-17000fff : mb:17
   17000000-17000fff : uart-pl011
18000000-18000fff : mb:18
   18000000-18000fff : kmi-pl050
19000000-19000fff : mb:19
   19000000-19000fff : kmi-pl050
1c000000-1c000fff : mb:1c
   1c000000-1c000fff : mmci-pl18x
24000000-25ffffff : armflash.0
c0000000-c0000fff : mb:c0
   c0000000-c0000fff : clcd-pl11x
c8000000-c800000f : smc91x.0
   c8000000-c800000f : smc91x
#

Anyway this can be done in another patch on top, so:

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
