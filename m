Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1354151wrm;
        Wed, 9 Oct 2019 12:51:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjCQec+K2As790Is1lbhTe4lq7CduI1AvbCv5QwjfzpQoUdHbrYBmd6ZyTvu4BPzlDDH6P
X-Received: by 2002:a17:906:6bcd:: with SMTP id t13mr4463856ejs.133.1570650661257;
        Wed, 09 Oct 2019 12:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570650661; cv=none;
        d=google.com; s=arc-20160816;
        b=YLeNCF44o+x/OolVT/touUeypH8+KL1WPn7RciyIajVMlyxFz9qg2BfoOI/x9dc7IE
         xDC1sIrrtsOpR6qAbLLDzpEA6hW57TQYX+HwgLcNNtS3uSPwuAACc0rTS66L2HGrQyJn
         ZWT8rHjRgG6PNpVXd0sArz5gtteQ7AaCOCuzupVBj9MO/nl49V9CuqA/u2cKt4zVVWTv
         cxHBZFOkCUsLjD5MPNV5bwoM8CkMP6CQJln3nqSk/ZmQPTjdOwgNUMqt3PGezfosviBg
         GWpS1JXFcU4any5T2EmeuNL7O+B7Jfssf0lUwdvtB7uppL05vLVqQ1HrsEX2Ywbt3YGW
         em8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=oyOfAKHawbzhqhBZInOvMurAb+eBS2Hbrzk9yIZIYvg=;
        b=LqtANDq4yb6qIJN1RG3mLseiZrh7wyUP+2DDBcuApwvfI+iYtfB9ByDyOp1cJUoLTE
         UmkvMaJ2x96MlPeb3dU/j6Ddp9jDS7F2F43tw44UNLgNh6rdK7beE5if5wW2LnE8a78P
         AezC1lWvbWFfr15oy+eTbXj2BVrgJhKQE7br3f/yO26NyGM4Ag9xeHBb00JNcp9maJOr
         KTSJzfRAgCT70iQIZsYuL/wbykbPPaGtKJj5QVt2jqblaYPs1zphkNHaBlPbzWYPX+0F
         3DpgNnC3slU4Qqb+K4R5kbFgZv6BizDQn+FdXjzQHRevxSae0tLSKzf2s6ZFwFGSFKtf
         TTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh3si1682399ejb.306.2019.10.09.12.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 12:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIHz9-0002DB-Q7
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 15:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIEZy-0003Zr-0j
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 12:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIEZv-0004R6-4O
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 12:12:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIEZu-0004Qk-Ra; Wed, 09 Oct 2019 12:12:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9381B806A7A;
 Wed,  9 Oct 2019 16:12:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A4F10013A1;
 Wed,  9 Oct 2019 16:12:34 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:12:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 18/19] tests/boot_linux_console: Boot Linux and run few
 commands on raspi3
Message-ID: <20191009161232.GE30349@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-19-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-19-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 09 Oct 2019 16:12:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 =?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GkPEUmBc1InO

On Thu, Sep 26, 2019 at 07:34:26PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Add a test which boots Linux and run basic commands using the serial
> port console.
>=20
> The kernel image is built by the Debian project:
> https://wiki.debian.org/RaspberryPi
>=20
> The DeviceTree blob comes from the official Raspberry Pi project:
> https://www.raspberrypi.org/
>=20
> The cpio image used comes from the linux-build-test project:
> https://github.com/groeck/linux-build-test
>=20
> This test can be run using:
>=20
>   $ avocado run --show=3Dconsole,app run -t machine:raspi3 tests/accept=
ance
>   console: [    0.000000] Linux version 4.14.0-3-arm64 (debian-kernel@l=
ists.debian.org) (gcc version 7.2.0 (Debian 7.2.0-18)) #1 SMP Debian 4.14=
.12-2 (2018-01-06)
>   console: [    0.000000] Boot CPU: AArch64 Processor [410fd034]
>   console: [    0.000000] Machine model: Raspberry Pi 3 Model B
>   console: [    0.000000] earlycon: pl11 at MMIO 0x000000003f201000 (op=
tions '')
>   console: [    0.000000] bootconsole [pl11] enabled
>   [...]
>   console: Starting network: OK
>   console: Found console ttyAMA0
>   console: Boot successful.
>   console: / # cat /proc/cpuinfo
>   console: processor      : 0
>   console: BogoMIPS       : 125.00
>   console: r      : 0x41
>   console: CPU architecture: 8
>   console: CPU variant
>   console: : 0x0
>   console: CPU part       : 0xd03
>   console: CPU revision   : 4
>   console: / # uname -a
>   console: Linux buildroot 4.14.0-3-arm64 #1 SMP Debian 4.14.12-2 (2018=
-01-06) aarch64 GNU/Linux
>   console: reboot
>   console: / # reboot
>   console: / # Found console ttyAMA0
>   console: Stopping network: OK
>   console: Saving random seed... done.
>   console: Stopping logging: OK
>   console: umount: devtmpfs busy - remounted read-only
>   console: umount: can't unmount /: Invalid argument
>   console: The system is going down NOW!
>   console: Sent SIGTERM to all processes
>   console: Sent SIGKILL to all processes
>   console: Requesting system reboot
>   console: kvm: exiting hardware virtualization
>   console: reboot: Restarting system
>   PASS (11.08 s)
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
> some chars are scrambled on the console...
> ---
>  tests/acceptance/boot_linux_console.py | 47 ++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index 33e8f6c635..2a1a23763e 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -363,6 +363,53 @@ class BootLinuxConsole(Test):
>          """
>          self.do_test_arm_raspi2(1)
> =20
> +    def test_arm_raspi3_initrd_uart0(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:raspi3
> +        """
> +        deb_url =3D ('https://snapshot.debian.org/archive/debian/'
> +                   '20180106T174014Z/pool/main/l/linux/'
> +                   'linux-image-4.14.0-3-arm64_4.14.12-2_arm64.deb')
> +        deb_hash =3D 'e71c995de57921921895c1162baea5df527d1c6b'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-4.14.0-3-ar=
m64')
> +
> +        dtb_url =3D ('https://github.com/raspberrypi/firmware/raw/'
> +                   '1.20180313/boot/bcm2710-rpi-3-b.dtb')
> +        dtb_hash =3D 'eb14d67133401ef2f93523be7341456d38bfc077'
> +        dtb_path =3D self.fetch_asset(dtb_url, asset_hash=3Ddtb_hash)
> +
> +        initrd_url =3D ('https://github.com/groeck/linux-build-test/ra=
w/'
> +                      '9b6b392ea7bc15f0d6632328d429d31c9c6273da/rootfs=
/'
> +                      'arm64/rootfs.cpio.gz')
> +        initrd_hash =3D '6fd05324f17bb950196b5ad9d3a0fa996339f4cd'
> +        initrd_path_gz =3D self.fetch_asset(initrd_url, asset_hash=3Di=
nitrd_hash)
> +        initrd_path =3D self.workdir + "rootfs.cpio"
> +        gunzip(initrd_path_gz, initrd_path)
> +
> +        self.vm.set_machine('raspi3')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'earlycon=3Dpl011,0x3f201000 console=3D=
ttyAMA0 ' +
> +                               'panic=3D-1 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> +                                               'BogoMIPS')
> +        self.exec_command_and_wait_for_pattern('uname -a',
> +                                               'Debian')
> +        self.exec_command_and_wait_for_pattern('reboot',
> +                                               'reboot: Restarting sys=
tem')
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --=20
> 2.20.1
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>

And even though you mentioned some trouble with the console, I've run
this 100 times and had no issues that disturbed the test, so:

Tested-by: Cleber Rosa <crosa@redhat.com>
