Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp1234845pjl;
        Wed, 9 Oct 2019 12:04:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSOeA/QV26coQDLZ/m8+R/HzhdeQFndOFk8dl7mCsQI4/XARSRMS7E2KlZbEx5alq9faIW
X-Received: by 2002:ad4:5044:: with SMTP id m4mr5506932qvq.85.1570647897150;
        Wed, 09 Oct 2019 12:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570647897; cv=none;
        d=google.com; s=arc-20160816;
        b=T4BlCgYJvRk8qUTkVEhI1ToicnrxSJKrQMT2PRNz5RRPKta8XGel+EWhlsgK9Lxolg
         IExe24kLREJofTpFSssRIL7rTNINxal2Yw/TQt8owgKUs3aoBxiR0PV4MjUg/WDllea9
         1s5+nyzD4doSy81Cq1yV+9yC0Mm3k/0UINBzVg5eakroFfdKe3xnIpOMAXqgrqCDueQ1
         tWMb/0NcqV5bjCgv4Fyz4dyrExIxOCwzcslm6WuP0Nf+vOhgxObm5dDNTWCkZiQkR2yD
         DfEOZ0yUZF2N9CiFl0rooeSuNw0Lh53fP2QzowNGoD7/TxLxt8Az2GENKFE2y5ik7hRs
         vG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=NwzN4jAIXopgDO4TzRjC9BJq+bn6YhbAKINFJuo5yL4=;
        b=0aTGl5HDJVDc9Dg15S+rzFwWReUhT2IVymu2qjBENtK5HjHpKuVu53u+/RGtLBpvYe
         NvzYPHWAN/U16Jyrrx+9jilSZnwB9k5qI8jn4sk1K9SM5QoyJzOTXZ7nwbeQ7m1agYzR
         WmqL9ewl1O8U5Wixczv1hvme8UKslMJwJPqvkT1kKlRHERXXm6O+HF8s5PVDzPidbY4E
         tUXvjcfwp+t2E5qrHnmHZ2TgZqYjA8WzGPJzkI7Fw31N9Z13wCqJ/ZbSxoqxuATTD/T6
         tv5Tei1whKq5D2z0nyR5gK0qn0N9Qr2qFqQfz4M5+/sKxummxbZIbd+Btl7nFJPLBYGO
         qw5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l190si3003589qke.339.2019.10.09.12.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 12:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIHGZ-0004rC-E3
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 15:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIEIv-0002qZ-Qy
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 11:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIEIt-0005Re-GC
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 11:55:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIEIt-0005RR-81; Wed, 09 Oct 2019 11:55:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2F3B3086E2F;
 Wed,  9 Oct 2019 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E94DD5D9E2;
 Wed,  9 Oct 2019 15:54:52 +0000 (UTC)
Date: Wed, 9 Oct 2019 11:54:51 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 17/19] tests/boot_linux_console: Test the raspi2 UART1
 (16550 based)
Message-ID: <20191009155451.GD30349@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-18-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-18-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 09 Oct 2019 15:55:06 +0000 (UTC)
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
X-TUID: BqtGLcB8BKn1

On Thu, Sep 26, 2019 at 07:34:25PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The current do_test_arm_raspi2() case tests the PL011 UART0.
> Our model also supports the AUX UART (16550 based).
> We can very simply test the UART1 with Linux, modifying the
> kernel command line.
>=20
> Add few lines to expand our previous test and cover the AUX
> UART.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index 7eaf6cb60e..33e8f6c635 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -326,6 +326,7 @@ class BootLinuxConsole(Test):
>          """
>          serial_kernel_cmdline =3D {
>              0: 'earlycon=3Dpl011,0x3f201000 console=3DttyAMA0',
> +            1: 'earlycon=3Duart8250,mmio32,0x3f215040 console=3DttyS1,=
115200'
>          }
>          deb_url =3D ('http://archive.raspberrypi.org/debian/'
>                     'pool/main/r/raspberrypi-firmware/'
> @@ -336,7 +337,7 @@ class BootLinuxConsole(Test):
>          dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rp=
i-2-b.dtb')
> =20
>          self.vm.set_machine('raspi2')
> -        self.vm.set_console()
> +        self.vm.set_console(console_id=3Duart_id)
>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>                                 serial_kernel_cmdline[uart_id])
>          self.vm.add_args('-kernel', kernel_path,
> @@ -354,6 +355,14 @@ class BootLinuxConsole(Test):
>          """
>          self.do_test_arm_raspi2(0)
> =20
> +    def test_arm_raspi2_uart1(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:raspi2
> +        :avocado: tags=3Ddevice:bcm2835_aux
> +        """
> +        self.do_test_arm_raspi2(1)
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --=20
> 2.20.1
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
