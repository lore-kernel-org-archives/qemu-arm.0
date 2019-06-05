Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3389074wrg;
        Wed, 5 Jun 2019 09:09:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpaAeMc16D/bdGORV4hhFepxNE0Ngp26YzIEBJ4wgKpRje8VEgL44CVSQUlcNg5sqly1rC
X-Received: by 2002:aed:382a:: with SMTP id j39mr34384865qte.94.1559750942011;
        Wed, 05 Jun 2019 09:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559750942; cv=none;
        d=google.com; s=arc-20160816;
        b=yNR1I2sSXPgjN3Ax8hlggc8t7ENlpLS2yAfOnjpk5NRYSMtUoADFV6MVaX9MdOXvmw
         NO58dgj2tkFaL2Yb1sh5Dp9/oMaCN+EICqaUxBT5belm04Mku5Zc2SUAfFUqvuqcq7+I
         9GWggt5mu1QUl16Jsn/5mYivuHnfL1UtP4cwkiQx2pByMEwoczdKZ7d+ln0Epo4gyYWb
         GMe/lK0yak9PU7YY3AMtnvJVulb868eDPekKNQSfASh2We9+27YWBQtdS/bOGpFeN54T
         zt8Fbg3s9sn6GfTU23syhOmUvY7oGokmMIF6XRcJDymshOFRH+evfwpIDW0Od8cLhq/v
         Pk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=c8o0fuPKlnwDXc35TdVqF/w8QctNYgxMCLoG39itXQY=;
        b=aN67Xxhrn8+OsGOqIW9Yk51AuyU+DEfJIGBWKOsvej4POsJ7gJB0o0camboBkZYdV+
         8khnxyjV2sHSDWUKJEykBBVloadlSAxIDge1dH9Yx8UdmnvcPwEm7An+hjAb1SFltfXU
         PnJu5IPKcOidxr0kanSG7iJzU+8tR0kJp8ATba5Pt2IXlgEoHj5JwK6zDiO0W8t7O1fc
         QxTB+sPH2/TuHcaIKaz+i1EmxESvdh+PseWTKwUCJv3wjBJE8bbhIXaC8GQEmR0Pfs9T
         WLd6uo5GzaHVXvcjP7apT4dD4p2DM5Rkot3iCn6viFi1uZeT/VN0q9VCNO53NMJ9xyWq
         68Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w43si4858788qta.166.2019.06.05.09.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 09:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYYTF-00050R-HY
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 12:09:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hYYRg-0004EC-H7
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:07:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hYYRe-0002YM-Qr
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:07:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1hYYRZ-0002LI-Lb; Wed, 05 Jun 2019 12:07:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D1B23007408;
	Wed,  5 Jun 2019 16:07:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-163.rdu2.redhat.com
	[10.10.121.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3C860BC3;
	Wed,  5 Jun 2019 16:07:01 +0000 (UTC)
Date: Wed, 5 Jun 2019 12:06:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190605160659.GB7080@localhost.localdomain>
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190520220635.10961-3-f4bug@amsat.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 05 Jun 2019 16:07:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] BootLinuxConsoleTest: Test the
 SmartFusion2 board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	Caio Carrara <ccarrara@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pH05vzYup8bx

On Tue, May 21, 2019 at 12:06:35AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Similar to the x86_64/pc test, it boots a Linux kernel on an
> Emcraft board and verify the serial is working.
>=20
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>=20
> Alternatively, this test can be run using:
>=20
>   $ avocado run -t arch:arm tests/acceptance
>   $ avocado run -t machine:emcraft-sf2 tests/acceptance
>

The pattern accepted as a tag currently doesn't include a dash, see:

   https://avocado-framework.readthedocs.io/en/68.0/ReferenceGuide.html#d=
ocstring-directives-rules

My suggestion is to replace the dash for an underline.  This was done
on the s390 test:

   :avocado: tags=3Dmachine:s390_ccw_virtio

> Based on the recommended test setup from Subbaraya Sundeep:
> https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index f593f3858e..844cb80bb5 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -178,6 +178,33 @@ class BootLinuxConsole(Test):
>          console_pattern =3D 'Kernel command line: %s' % kernel_command=
_line
>          self.wait_for_console_pattern(console_pattern)
> =20
> +    def test_arm_emcraft_sf2(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:emcraft-sf2

As per the previous comment, this would become:

    :avocado: tags=3Dmachine:emcraft_sf2

> +        :avocado: tags=3Dendian:little
> +        """
> +        uboot_url =3D ('https://raw.githubusercontent.com/'
> +                     'Subbaraya-Sundeep/qemu-test-binaries/'
> +                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot'=
)
> +        uboot_hash =3D 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
> +        uboot_path =3D self.fetch_asset(uboot_url, asset_hash=3Duboot_=
hash)
> +        spi_url =3D ('https://raw.githubusercontent.com/'
> +                   'Subbaraya-Sundeep/qemu-test-binaries/'
> +                   'fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin')
> +        spi_hash =3D '85f698329d38de63aea6e884a86fbde70890a78a'
> +        spi_path =3D self.fetch_asset(spi_url, asset_hash=3Dspi_hash)
> +
> +        self.vm.set_machine('emcraft-sf2')
> +        self.vm.set_console()
> +        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE
> +        self.vm.add_args('-kernel', uboot_path,
> +                         '-append', kernel_command_line,
> +                         '-drive', 'file=3D' + spi_path + ',if=3Dmtd,f=
ormat=3Draw',

Nitpick:

   '-drive', 'file=3D%s,if=3Dmtd,format=3Draw' % spi_path,

> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('init started: BusyBox')
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --=20
> 2.19.1
>=20

Other than that, it looks good to me.
