Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2844874lff;
        Thu, 19 Dec 2019 14:55:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOoYtZX2KvCflEI2nx2mVx/niJ6MjoZboRpfwI5my4+FpduGAX5GRp4ZATjDYhY3wOM0W4
X-Received: by 2002:a37:6287:: with SMTP id w129mr10515864qkb.381.1576796107766;
        Thu, 19 Dec 2019 14:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576796107; cv=none;
        d=google.com; s=arc-20160816;
        b=OGhF27e5s0wws/5hiZpkD3bUH1LbaKE4g3u7lb0DOcH7Vx307FMfkHya2i5wwZ5ELP
         2N9e7DkjL63Ph7Ptyd8X9FJDJW/ad+K/y6hb/Q77Y12LaaWzeikuilaJPykPqpXoJ7uZ
         JCvDAmMbJvUOPBjpL3uCE3Zrk13i7lgEO4aTKF2Zj3ncOWQh5/4fgos34pqFWKoGYosm
         BDfKjZiZdA6lbKP1B+52ljHHSEC/CC4nOF9ejpV39rZrf/f0my2hfUgpA+dlUE355FqO
         /ybmXSkjiCLgMaQrr+99LhNpnFgJFsAYwP1zZs5YLQM6hhDn66HoPdJ9z/EGM2xsPIhT
         //FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=A03OQWvwtY1YMWfx6msRqrki4ud0DkqE7Ww37rYfCdU=;
        b=1LItu4YhTEPHyC5t5qt4jIHM43YNSlupWEyuJaQzazP77p+SdEtkI9+w2fQUA2ebxd
         ZWc3zKFgyJrVWgb8D8RTzQ76hCTCqhPixPry8z1Z9tKUqIQ4bBWAhJJwB22SBw5QNyUy
         /aJNwYk2aHOh09/EV9RTqweQcJM1J9h5d+blQVI/Txlh98urYqa5GuOGR87QcTmr0fwb
         p7fVaONZJNPQNtsIHDeaREr7n9t4C1OzEeZ92rnJceZhSzzps3LPIWPezkfRfsUqfy6e
         4t3wRpCS6dpOGEnGfG6y0e2LNyRFWRRVd3mjSGygotmWU5Tz6zErtfAT2F/OIuskaLMQ
         MstA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B2gNKRCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si4378791qvl.75.2019.12.19.14.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 14:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B2gNKRCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii4hG-0003c3-W4
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 17:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1ii4h3-0003bN-Qa
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 17:54:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1ii4h1-0001jV-Dk
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 17:54:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25945
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1ii4h1-0001YW-5E
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 17:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576796089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A03OQWvwtY1YMWfx6msRqrki4ud0DkqE7Ww37rYfCdU=;
 b=B2gNKRCWZHtZ2RZEUsi0/AmbObZExo1/xhfCKxqSY4Mnwqb3qDYZTsO6un40tLaRPY7uR5
 tHT3X21mc7jH0R5Ryioa/qt7+ruYDn5qXa7gzSTJ9NE9K6hqTLkuw9+0O6u7TiZZMM68kG
 Ddmu98HuR8siUeOArcvT6r34fKcSaWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-hLHPCOmKOSOMh7M0vxkLVA-1; Thu, 19 Dec 2019 17:54:32 -0500
X-MC-Unique: hLHPCOmKOSOMh7M0vxkLVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C57800EB8;
 Thu, 19 Dec 2019 22:54:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-70.gru2.redhat.com
 [10.97.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C42A95D9E2;
 Thu, 19 Dec 2019 22:54:28 +0000 (UTC)
Date: Thu, 19 Dec 2019 17:54:25 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [RFC PATCH 5/5] tests/boot_linux_console: Add a SLOW test
 booting Ubuntu on OrangePi PC
Message-ID: <20191219225425.GB28892@localhost.localdomain>
References: <20191217182730.943-1-f4bug@amsat.org>
 <20191217182730.943-6-f4bug@amsat.org>
 <CAPan3WrgL-ULAMQPTHj7zbNMS_xaTuNprp1W4GzhryQbMcPQOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPan3WrgL-ULAMQPTHj7zbNMS_xaTuNprp1W4GzhryQbMcPQOA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJs4oMIjtfV0

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 10:26:08PM +0100, Niek Linnenbank wrote:
> Hi Philippe,
>=20
> This test has some problems on my host (Ubuntu 18.04.3 LTS, avocado 73.0,
> python 3.6.9):
>=20
>  (4/4) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_bionic:
> ERROR: Input format not supported by decoder (3.25 s)
> RESULTS    : PASS 3 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> | CANCEL 0
> JOB TIME   : 46.22 s
>=20
> I suspect it didn't download the image correctly.
>

I don't think it's download related, because the
"archive.lzma_uncompress(image_path_xz, image_path)" line is not
capable of uncompressing that 7z archive.

> Regards,
> Niek
>=20
> On Tue, Dec 17, 2019 at 7:27 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.org=
>
> wrote:
>=20
> > This test boots Ubuntu Bionic on a OrangePi PC board.
> >
> > As it requires 1GB of storage, and is slow, this test is disabled
> > on automatic CI testing.
> >
> > It is useful for workstation testing. Currently Avocado timeouts too
> > quickly, so we can't run userland commands.
> >
> > The kernel image and DeviceTree blob are built by the Raspbian
> > project (based on Debian):
> > https://www.raspbian.org/RaspbianImages
> >
> > The Ubuntu image is downloaded from:
> > https://dl.armbian.com/orangepipc/Bionic_current
> >
> > This test can be run using:
> >
> >   $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes \
> >     avocado --show=3Dapp,console run -t machine:orangepi-pc \
> >       tests/acceptance/boot_linux_console.py
> >   console: Uncompressing Linux... done, booting the kernel.
> >   console: Booting Linux on physical CPU 0x0
> >   console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version
> > 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 C=
ET
> > 2019
> >   console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50c=
5387d
> >   console: CPU: div instructions available: patching division code
> >   console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> > instruction cache
> >   console: OF: fdt: Machine model: Xunlong Orange Pi PC
> >   [...]
> >   console: sunxi-mmc 1c0f000.mmc: initialized, max. request size: 16384=
 KB
> >   console: NET: Registered protocol family 10
> >   console: mmc0: host does not support reading read-only switch, assumi=
ng
> > write-enable
> >   console: mmc0: Problem switching card into high-speed mode!
> >   console: mmc0: new SD card at address 4567
> >   console: mmcblk0: mmc0:4567 QEMU! 932 MiB
> >   console: Segment Routing with IPv6
> >   console: NET: Registered protocol family 17
> >   console: NET: Registered protocol family 15
> >   console: bridge: filtering via arp/ip/ip6tables is no longer availabl=
e
> > by default. Update your scripts to load br_netfilter if you need this.
> >   console: 8021q: 802.1Q VLAN Support v1.8
> >   console: Key type dns_resolver registered
> >   console: Registering SWP/SWPB emulation handler
> >   console: mmcblk0: p1
> >   [...]
> >   console: Freeing unused kernel memory: 1024K
> >   console: Run /sbin/init as init process
> >   console: random: fast init done
> >   console: systemd[1]: System time before build time, advancing clock.
> >   console: systemd[1]: systemd 237 running in system mode. (+PAM +AUDIT
> > +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT
> > +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2
> > default-hierarchy=3Dhybrid)
> >   console: systemd[1]: Detected architecture arm.
> >   console: Welcome to Ubuntu 18.04.3 LTS!
> >   console: systemd[1]: Set hostname to <orangepipc>.
> >   console: random: systemd: uninitialized urandom read (16 bytes read)
> >
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> > RFC because this is not the definitive test, but it is helpful so
> > for for testing Niek work.
> > ---
> >  tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py
> > b/tests/acceptance/boot_linux_console.py
> > index 8179b45910..663290e0c7 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -520,6 +520,47 @@ class BootLinuxConsole(Test):
> >          exec_command_and_wait_for_pattern(self, 'reboot',
> >                                                  'reboot: Restarting
> > system')
> >
> > +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage
> > limited')
> > +    def test_arm_orangepi_bionic(self):
> > +        """
> > +        :avocado: tags=3Darch:arm
> > +        :avocado: tags=3Dmachine:orangepi-pc
> > +        """
> > +        # This test download a 196MB compressed image and expand it to
> > 932MB...
> > +        deb_url =3D ('https://apt.armbian.com/pool/main/l/'
> > +
> >  'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > +        deb_hash =3D '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> > +        kernel_path =3D self.extract_from_deb(deb_path,
> > +                                            '/boot/vmlinuz-4.20.7-sunx=
i')
> > +        dtb_path =3D
> > '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
> > +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> > +        image_url =3D ('https://dl.armbian.com/orangepipc/archive/'
> > +                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.=
7z')
> > +        image_hash =3D '196a8ffb72b0123d92cea4a070894813d305c71e'
> > +        image_path_xz =3D self.fetch_asset(image_url, asset_hash=3Dima=
ge_hash)
> > +        image_name =3D 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.=
9.img'
> > +        image_path =3D os.path.join(self.workdir, image_name)
> > +        archive.lzma_uncompress(image_path_xz, image_path)

I'm not sure what magic Philippe was able to do here, but I can not
uncompress this file with lzma_uncompress.  I'm looking into adding
proper 7z support to avocado.utils.archive module, by means of either
the 7z library or the py7zr Python module.

- Cleber.

> > +
> > +        self.vm.set_machine('orangepi-pc')
> > +        self.vm.set_console()
> > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> > +                               'console=3DttyS0,115200 '
> > +                               'root=3D/dev/mmcblk0p1 rootwait rw '
> > +                               'systemd.mask=3Ddev-ttyS0.device '
> > +                               'systemd.mask=3Darmbian-zram-config.ser=
vice '
> > +                               'systemd.mask=3Darmbian-ramlog.service'=
)
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-dtb', dtb_path,
> > +                         '-drive', 'file=3D' + image_path +
> > ',if=3Dsd,format=3Draw',
> > +                         '-append', kernel_command_line,
> > +                         '-nic', 'user',
> > +                         '-no-reboot')
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern('Welcome to Ubuntu 18.04.3 LTS!'=
)
> > +        self.wait_for_console_pattern('Started Armbian filesystem
> > resize.')
> > +
> >      def test_s390x_s390_ccw_virtio(self):
> >          """
> >          :avocado: tags=3Darch:s390x
> > --
> > 2.21.0
> >
> >
>=20
> --=20
> Niek Linnenbank

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl37/54ACgkQZX6NM6Xy
CfMEvQ/+PsiPjMkjihxXJCuq45EIl8L+BOQhHzZ/wEO3GJZFg/Isq4w3BSlwgf5C
W3HZU7BC0nPIZ7SCyQF7wq39Y9+8KiziiM0TxtgOs3UhR9JsFCZNu5RAXND36Tkn
oWuq0WTneYTFXsCTlVzTxXwQfCaMYzbO+m699oE561EN91OL61uQqlq1pV/MpVKm
lTyuNIR4ssyO7mtH/IF+EiFbLzN+XefyhzxCLmFChbRcmobn3CGuwdec7oHu9V5o
FkJfAkOHtR6WuVS6DdYyymSHQmMwJjwzuWqJIBrFVikLNaoV0lxeoOxSUHPBrgtC
iy61IqHEuJWT4JnKoVAff8ciS8t8vt2VMbs/f4ijSVj0N40bkxnQghJwDVrDCSZ0
NSZN2ezS+OnpgnMJFCfqyuHOxBbhmSlf4VApxrdxd/phEmHvaAnz8QhfUDWPLNhO
BQ99C2+EDm+Mah9i+vndO4fYjNRgyhaQF2ro4++31cHunEUFODnV5OkKzlgfo7gf
unAs/cjHEt10lND+Mqdoq7smc/zwnN1SU3u3xsdlRGjiT+mUSGuszl3sS4mpVbcR
BDYBA/r2PR+e/iH8IPBKljRIcDpmXqswmj0tGKqBq0HjXGsY4CHph1nrRf3mD2Ml
nJrbqA/FjHRJZv6+26Bvu5H3J29PoFi/H58Ur+waz3u+Vim5CUQ=
=0fgK
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--

