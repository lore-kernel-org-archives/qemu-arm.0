Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15864129lff;
        Mon, 30 Dec 2019 12:52:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqx54NUfFnPJJwIEbXARMHkhNPqAJkggSKgbogWbejCNexM0gaJvMoOkkflPF0976elHqfQ3
X-Received: by 2002:a05:620a:14bc:: with SMTP id x28mr55531478qkj.494.1577739168332;
        Mon, 30 Dec 2019 12:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577739168; cv=none;
        d=google.com; s=arc-20160816;
        b=DqiD091lcDX+0Dyn9UQUxcLSuQh+qarfvFvjvlhfwIfhxDg0mhJQxwGiQjLiuMlNaJ
         9P308py23+mOctzDzvcBU4Qw1kXbyipSpuYOUSkYU2nm5LzKC0KrKCM+kSY4PHwOokox
         abQryglRFzXjKYOCZEkPOm4Td+hhiDt0RIJjaVfjAOIc9jcgNzXpQIkQQ5dU16rpXl1c
         BnAbD+G+ZxprRdmEvlbt3fKa8J71p9y07su+3FmKUDhofkT1EPk+B3CV7OmcqGeRvvOM
         WcrjNEhKyIKjBGi6+BLX3PD0B8K4Zv+3Bd+6YLMOZWlIfN7mUltoOCd0+FKNXGK6GkWt
         KWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Zc0FTPmlN/eRAhViCLUrPsRLUXsok9bOT2zdMSbRLgQ=;
        b=iWd0pG7RxbfAP6+zFZ1aWN98cV4vMlm3osNWLvPpfxMR1m9e7+eQaqLcrFYHIyVcX1
         e6SOEGbZS4cTDij45x8zw+fv88WULchxS/+8EJDj4S9THaLi463OBtAUF29ey/U9YMUU
         tLG2jdh5K+Um+Djpdws1EpSNpZ5em244zSR3cWlmRIfeOY/9dxpTkyqN1uyBoWJ/tbiz
         mHWSyYcnCDFTl4Jr4xxwQ8PkmG6iQ4d4WZoh2fn6+abZWPM5Us+TyMG5Fn9NEnhziAiY
         HqRGtG4zwl9Q1A8czjp0xx7QjOmt3ESPjUozDy7CZynI7dyGeGzh6z4mEdM7kWIMBJlJ
         5Z9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R8X1ijzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si17666387qtm.60.2019.12.30.12.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 12:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R8X1ijzz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1im21s-00043a-VR
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 15:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1im21f-00043O-3Q
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 15:52:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1im21c-0000I4-5I
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 15:52:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34234
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1im21b-0000GE-Io
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 15:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577739146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc0FTPmlN/eRAhViCLUrPsRLUXsok9bOT2zdMSbRLgQ=;
 b=R8X1ijzzwhP2BLHQXQe7+C7Ec4lqGlZV+KePHM+EzWmQ+aRsmT1+jbEn43b0dVmGog84bW
 gBr5li2m2Z+o5WwlKbuuVU7lN+iDB8m7ZbKwfI/pTrJulTj2M6w//qzELlyvnlznhvtA31
 Qh3j1sm7cjWWhsWQQ9+23Xmyab7h9lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-NjHmOij-PCKjhle4dijyog-1; Mon, 30 Dec 2019 15:52:21 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 797B2107ACC5;
 Mon, 30 Dec 2019 20:52:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-92.gru2.redhat.com
 [10.97.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BF778E81;
 Mon, 30 Dec 2019 20:52:15 +0000 (UTC)
Subject: Re: [PATCH 1/6] tests/boot_linux_console: Add initrd test for the
 CubieBoard
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <31147d48-2f31-9fce-b8a4-1a270f114a45@redhat.com>
Date: Mon, 30 Dec 2019 18:52:13 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191230110953.25496-2-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: NjHmOij-PCKjhle4dijyog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wyPsLYNDG2fY


On 12/30/19 9:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> This test boots a Linux kernel on a CubieBoard and verify
> the serial output is working.
>
> The kernel image and DeviceTree blob are built by the Armbian
> project (based on Debian):
> https://docs.armbian.com/Developer-Guide_Build-Preparation/
>
> The cpio image used comes from the linux-build-test project:
> https://github.com/groeck/linux-build-test
>
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>
> Alternatively, this test can be run using:
>
>    $ avocado --show=3Dconsole run -t machine:cubieboard tests/acceptance/=
boot_linux_console.py
>    console: Uncompressing Linux... done, booting the kernel.
>    console: Booting Linux on physical CPU 0x0
>    console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.=
2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 201=
9
>    console: CPU: ARMv7 Processor [410fc080] revision 0 (ARMv7), cr=3D50c5=
387d
>    console: CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing ins=
truction cache
>    console: OF: fdt: Machine model: Cubietech Cubieboard
>    [...]
>    console: Boot successful.
>    console: cat /proc/cpuinfo
>    console: / # cat /proc/cpuinfo
>    console: processor      : 0
>    console: model name     : ARMv7 Processor rev 0 (v7l)
>    console: BogoMIPS       : 832.51
>    [...]
>    console: Hardware       : Allwinner sun4i/sun5i Families
>    console: Revision       : 0000
>    console: Serial         : 0000000000000000
>    console: cat /proc/iomem
>    console: / # cat /proc/iomem
>    console: 01c00000-01c0002f : system-control@1c00000
>    console: 01c02000-01c02fff : dma-controller@1c02000
>    console: 01c05000-01c05fff : spi@1c05000
>    console: 01c0b080-01c0b093 : mdio@1c0b080
>    console: 01c0c000-01c0cfff : lcd-controller@1c0c000
>    console: 01c0d000-01c0dfff : lcd-controller@1c0d000
>    console: 01c0f000-01c0ffff : mmc@1c0f000
>    [...]
>    PASS (54.35 s)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 9c6aa2040a..4643f60e37 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -400,6 +400,47 @@ class BootLinuxConsole(Test):
>           self.wait_for_console_pattern('Boot successful.')
>           # TODO user command, for now the uart is stuck
>  =20
> +    def test_arm_cubieboard_initrd(self):

Unless you have two tests, one with and without initrd (not the case=20
though) the suffix '_initrd' is useless. So I suggest to remove it.

> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:cubieboard
> +        """
> +        deb_url =3D ('https://apt.armbian.com/pool/main/l/'
> +                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.=
deb')
> +        deb_hash =3D '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-4.20.7-sunxi'=
)
> +        dtb_path =3D '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboar=
d.dtb'
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +        initrd_url =3D ('https://github.com/groeck/linux-build-test/raw/=
'
> +                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> +                      'arm/rootfs-armv5.cpio.gz')
> +        initrd_hash =3D '2b50f1873e113523967806f4da2afe385462ff9b'
> +        initrd_path_gz =3D self.fetch_asset(initrd_url, asset_hash=3Dini=
trd_hash)
> +        initrd_path =3D os.path.join(self.workdir, 'rootfs.cpio')
> +        archive.gzip_uncompress(initrd_path_gz, initrd_path)
> +
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200 '
> +                               'usbcore.nousb '
> +                               'panic=3D-1 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                                'Allwinner sun4i/sun5i')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> +                                                'system-control@1c00000'=
)
> +        exec_command_and_wait_for_pattern(self, 'reboot',
> +                                                'reboot: Restarting syst=
em')


I ran this test case with success, so:

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

With the comment regarding the _initrd suffix:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> +
>       def test_s390x_s390_ccw_virtio(self):
>           """
>           :avocado: tags=3Darch:s390x

