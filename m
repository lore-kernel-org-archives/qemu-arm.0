Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp1223487pjl;
        Wed, 9 Oct 2019 11:54:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytD7xYKGrkW1GXtIGOwsIapC9RWLSiFUjgphDllNWdSpYsOHM1BOhV9UzNxfoRzNAyQlJN
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr4431942edy.278.1570647290707;
        Wed, 09 Oct 2019 11:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570647290; cv=none;
        d=google.com; s=arc-20160816;
        b=FPltYmH+jlHBMFTKjwpBT8Fi7fbIbYX0zu+ilPVS4ard/RmBtSOYentmr2jm6DEwBD
         CJXQDBobFltEyAcKAPOs+dl7huj/aCvUqwJ26BemE+Zw/6+4cVCWh1cvlOCIXNFxuOsR
         nn/ydodjpVubDsAmx0YW6ZwEVIfwPd3nrW0teyjq4RkGd1rbu7San+yfIENzKlJXP/6c
         pl+jFjxIC/kdR92OkmkCBp59RLq+nKbn+KldD3QNHI1DkScXoekynFQBytA+DCcOHrsE
         niIbX/NrdN2ZeQs01OFwHTMqztWoIqGzLCbR6QkvklYwB+iPuceXcJsqxVZGpCiTc27+
         EAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=yyeMXj1Oc8VmRT6IHLKnsD17mofIkMy503oBULfN89I=;
        b=mafqp9cbpT8iTgxZ1YXHFI80I1W6GdtGJo4VdyYKdxKKt+xZ7eReoa34AgHkKGkoXR
         3jazynqJI3qkr/+TXJp6wi49MuOU4p+YLaODL8ddOE+yWBhAJvB9V0QqdLNR9qg3Rnzl
         +M5BMR1Pbr6hzETBzPu8+dSlrO7olbIGXaFOdB1OqkVD/hIoVLyGEsMzEuE9N0P74lFA
         omeQXaI6o0aKTPecrZwf8vrMRDmfS7qNLcDVZfcVLjRnUK+DYEo02ccMyD5IdYRPa/qq
         cpsD4ZYtmWRmZ/rDD7Uv1CD1mR8jeTYABKKyYzq1WGACWBp312zwyHbqEAUaOm3ookuz
         PJFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j28si2269422eda.161.2019.10.09.11.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIH6m-00026K-RX
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIE8O-00028q-2X
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 11:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIE8L-0001M6-BB
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 11:44:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIE8K-0001Kq-U9; Wed, 09 Oct 2019 11:44:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D352301D678;
 Wed,  9 Oct 2019 15:44:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05EFD5D713;
 Wed,  9 Oct 2019 15:43:58 +0000 (UTC)
Date: Wed, 9 Oct 2019 11:43:57 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 16/19] tests/boot_linux_console: Add a test for the
 Raspberry Pi 2
Message-ID: <20191009154357.GA23685@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-17-f4bug@amsat.org>
 <20191009154304.GC30349@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191009154304.GC30349@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 09 Oct 2019 15:44:11 +0000 (UTC)
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
X-TUID: SiAO+aaCKror

On Wed, Oct 09, 2019 at 11:43:15AM -0400, Cleber Rosa wrote:
> On Thu, Sep 26, 2019 at 07:34:24PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
> > board and verify the serial is working.
> >=20
> > The kernel image and DeviceTree blob are built by the Raspbian
> > project (based on Debian):
> > https://www.raspbian.org/RaspbianImages
> > as recommended by the Raspberry Pi project:
> > https://www.raspberrypi.org/downloads/raspbian/
> >=20
> > If ARM is a target being built, "make check-acceptance" will
> > automatically include this test by the use of the "arch:arm" tags.
> >=20
> > Alternatively, this test can be run using:
> >=20
> >     $ avocado run -t arch:arm tests/acceptance
> >     $ avocado run -t machine:raspi2 tests/acceptance
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> > v3: removed debug printf (Cleber)
> >     use serial_kernel_cmdline dict
> > ---
> >  tests/acceptance/boot_linux_console.py | 36 ++++++++++++++++++++++++=
++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptanc=
e/boot_linux_console.py
> > index 079590f0c8..7eaf6cb60e 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -318,6 +318,42 @@ class BootLinuxConsole(Test):
> >          self.vm.launch()
> >          self.wait_for_console_pattern('init started: BusyBox')
> > =20
> > +    def do_test_arm_raspi2(self, uart_id):
> > +        """
> > +        The kernel can be rebuilt using the kernel source referenced
> > +        and following the instructions on the on:
> > +        https://www.raspberrypi.org/documentation/linux/kernel/build=
ing.md
> > +        """
> > +        serial_kernel_cmdline =3D {
> > +            0: 'earlycon=3Dpl011,0x3f201000 console=3DttyAMA0',
> > +        }
> > +        deb_url =3D ('http://archive.raspberrypi.org/debian/'
> > +                   'pool/main/r/raspberrypi-firmware/'
> > +                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
> > +        deb_hash =3D 'cd284220b32128c5084037553db3c482426f3972'
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash=
)
> > +        kernel_path =3D self.extract_from_deb(deb_path, '/boot/kerne=
l7.img')
> > +        dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-=
rpi-2-b.dtb')
> > +
> > +        self.vm.set_machine('raspi2')
> > +        self.vm.set_console()
> > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> > +                               serial_kernel_cmdline[uart_id])
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-dtb', dtb_path,
> > +                         '-append', kernel_command_line)
> > +        self.vm.launch()
> > +        console_pattern =3D 'Kernel command line: %s' % kernel_comma=
nd_line
> > +        self.wait_for_console_pattern(console_pattern)
> > +
> > +    def test_arm_raspi2_uart0(self):
> > +        """
> > +        :avocado: tags=3Darch:arm
> > +        :avocado: tags=3Dmachine:raspi2
> > +        :avocado: tags=3Ddevice:pl011
> > +        """
> > +        self.do_test_arm_raspi2(0)
> > +
> >      def test_s390x_s390_ccw_virtio(self):
> >          """
> >          :avocado: tags=3Darch:s390x
> > --=20
> > 2.20.1
> >=20
>=20
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

I also meant:

Tested-by: Cleber Rosa <crosa@redhat.com>
