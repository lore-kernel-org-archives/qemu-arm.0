Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp340578lff;
        Sat, 18 Jan 2020 03:22:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1e06FAQiDL4LTHUrrJZf5kdb3dlZVzN9/DeFMQA5e+JnssMrxXWQODwhGsxfTvxz1sVg2
X-Received: by 2002:a17:906:f0d6:: with SMTP id dk22mr11684703ejb.307.1579346563623;
        Sat, 18 Jan 2020 03:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579346563; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnPmJAsRVcdR3y/QiuZTrUALfVJquFqnt0xE0dsgqU4I+/5Sm1yAO0FOSPQk/qR8QD
         QYIeYhWgmM9gQju4LKcEwepgtc1/PWBTueD84DbMBfQ78AKhrQ1IFCRXTYVP6FZfQP2F
         +Qob4MGDar0uyYE/A5B2mJfgKSQyFHLkTZt1/PrpyeZla94iBepTru2IOLX7siRP5WKm
         lxy1lc/k8ifDhPsz6lC7WndewpPkIKmtJjfktrfSpOb4mLqyTMlxLYLjfHAFnCcWNxFW
         TLn6RifPGD4QQgpXbcJRFzP/8S7LRk8PHuhtsR5kKsSURiiI2MmNhDb9DwNGy20gu6hi
         XPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=33jlVoydYg/HEI+WdV72NSyntZE0fgO13cZjCkZu4n0=;
        b=JIx6b4muR8ZPW63kTTFXLGk1hCj61EzBeAryRax+xu7H0+Wf2srmjyHn0XeyxxC/PI
         RfLUulFHyYWWx2X9G/FkwTk2U+lXvBTtsfezB+sARF6o34NQhXZfdvLpVKHQNPPfkEF8
         0cu3mYC48ObK4z1Fceu52oq70ecfsoTRDsVn1a8fcnU6Q++4ZfD7OOvx5m60ufg7AhcY
         9neXD3BQlUDOwYCwgRz8b3rrkZ2+rDQuFH9LFh/cF5bqnZmMlEcUTFFNgBplVWgg2/64
         AJD3JS/7ugukqBkgH/M5O95pJOZqoKiF1dWHzc7JCX6I1jwVGIj7jaZXFZU4qmKxln4b
         CpgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iqJ7EbZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j27si17333280ejb.366.2020.01.18.03.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 03:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iqJ7EbZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ismBe-0002Gd-Ep
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 06:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ismBV-0002GR-CO
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 06:22:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ismBT-0000NV-4f
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 06:22:32 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54478
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ismBT-0000NJ-1F
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 06:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579346550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33jlVoydYg/HEI+WdV72NSyntZE0fgO13cZjCkZu4n0=;
 b=iqJ7EbZkDNGZ2+OKpcUanKeV70otbw30mOkwxI4/50oBsDW4GP1GcZ/H2hQWQ90mgTlb08
 caNCSRro/ATo2f57itJbwrJ7lF9I3c167EHi6KHqVwsqthq2kwc31861lbgWjrk+U3xDba
 memX/ImE1bYK/jgT+xZ4AktGx5tfLZ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-8b14wc2ANfCzsffXriSd9A-1; Sat, 18 Jan 2020 06:22:23 -0500
Received: by mail-wr1-f69.google.com with SMTP id v17so11608079wrm.17
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 03:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nE0+vwvyzy3SC6fckVMOmInDDbmnTIQ9SvhnqGGIULo=;
 b=cTRW9Gy/MazTOt6svgEQ6E8EKuegGhlRpF0eqMsEC4GFg0+hao+MU1Oi9/3mJeXSNg
 zObOD8ohGGPX86jTRDmSKxrqf/myqCa4k/5nUa3Dn/ugRM8tVl4l7X4eCx602E3ztTAH
 no0SQWxkBrZgfcBG+Vtqx3cZTYmsFAghMITMQ8GviC8wOe2U+GFDwAgmTZ539AF25am+
 mSJE16+p1B7EJx3kUn45ceDkq268Rv2sYTmpHgAF6ao7FZBrZv+ePib7qgK4YcOeczO9
 h14Tv1BO1oz+1QefOWXnyt3GMLzHgdh57kbmnv+wo3zF+KeGUP6RDnx5YaSKwyU7WDlN
 ZITg==
X-Gm-Message-State: APjAAAXeR/JkPsSAUv0330Iee8AcrJ9OonzxSY9g6ljT3BO/Ppa4acjV
 FgMOF+A6q8vOtenYQydkr8hXWMwc4KbiZbu8bf7jlykKY/HWdzgrAEEvfhmJKHcwpY7LhJmYbeY
 niUyAQTh9RkTg
X-Received: by 2002:a1c:6605:: with SMTP id a5mr8908256wmc.112.1579346542208; 
 Sat, 18 Jan 2020 03:22:22 -0800 (PST)
X-Received: by 2002:a1c:6605:: with SMTP id a5mr8908233wmc.112.1579346541828; 
 Sat, 18 Jan 2020 03:22:21 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id j12sm41160847wrw.54.2020.01.18.03.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 03:22:20 -0800 (PST)
Subject: Re: [PATCH v3 13/17] tests/boot_linux_console: Add a quick test for
 the OrangePi PC board
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-14-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5b20d022-f3f8-4913-b157-73f42808a4c0@redhat.com>
Date: Sat, 18 Jan 2020 12:22:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-14-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: 8b14wc2ANfCzsffXriSd9A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 724xd3qSKyIk

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> This test boots a Linux kernel on a OrangePi PC board and verify
> the serial output is working.
>=20
> The kernel image and DeviceTree blob are built by the Armbian
> project (based on Debian):
> https://www.armbian.com/orange-pi-pc/
>=20
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>=20
> Alternatively, this test can be run using:
>=20
>    $ make check-venv
>    $ ./tests/venv/bin/avocado --show=3Dconsole,app run -t machine:orangep=
i-pc tests/acceptance/boot_linux_console.py
>    JOB ID     : 2e4d15eceb13c33672af406f08171e6e9de1414a
>    JOB LOG    : ~/job-results/job-2019-12-17T05.46-2e4d15e/job.log
>    (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi:
>    console: Uncompressing Linux... done, booting the kernel.
>    console: Booting Linux on physical CPU 0x0
>    console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.=
2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 201=
9
>    console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50c5=
387d
>    console: CPU: div instructions available: patching division code
>    console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instru=
ction cache
>    console: OF: fdt: Machine model: Xunlong Orange Pi PC
>    console: Memory policy: Data cache writealloc
>    console: OF: reserved mem: failed to allocate memory for node 'cma@4a0=
00000'
>    console: cma: Failed to reserve 128 MiB
>    console: psci: probing for conduit method from DT.
>    console: psci: PSCIv0.2 detected in firmware.
>    console: psci: Using standard PSCI v0.2 function IDs
>    console: psci: Trusted OS migration not required
>    console: random: get_random_bytes called from start_kernel+0x8d/0x3c2 =
with crng_init=3D0
>    console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308 u=
73728
>    console: Built 1 zonelists, mobility grouping on.  Total pages: 32480
>    console: Kernel command line: printk.time=3D0 console=3DttyS0,115200
>    PASS (8.59 s)
>    JOB TIME   : 8.81 s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [NL: rename in commit message Raspbian to Armbian]
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 9c6aa2040a..b58308d724 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -400,6 +400,32 @@ class BootLinuxConsole(Test):
>           self.wait_for_console_pattern('Boot successful.')
>           # TODO user command, for now the uart is stuck
>  =20
> +    def test_arm_orangepi(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:orangepi-pc
> +        """
> +        deb_url =3D ('https://apt.armbian.com/pool/main/l/'
> +                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.=
deb')
> +        deb_hash =3D '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-4.20.7-sunxi'=
)
> +        dtb_path =3D '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-p=
c.dtb'
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +
> +        self.vm.set_machine('orangepi-pc')

Please remove the vm.set_machine() calls.

> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200n8 '
> +                               'earlycon=3Duart,mmio32,0x1c28000')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> +        self.wait_for_console_pattern(console_pattern)
> +
>       def test_s390x_s390_ccw_virtio(self):
>           """
>           :avocado: tags=3Darch:s390x
>=20

