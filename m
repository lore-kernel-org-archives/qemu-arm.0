Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp123794wrm;
        Tue, 8 Oct 2019 14:49:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhgHVoKIifcTvtSglL3iv7P5AjYV5/RNd6+d9tcf5LlWYynuitBQ25rFVPU1YcRQuOfaa5
X-Received: by 2002:a50:fd16:: with SMTP id i22mr187788eds.154.1570571380074;
        Tue, 08 Oct 2019 14:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570571380; cv=none;
        d=google.com; s=arc-20160816;
        b=j+qi+HUkGZFVt2CnZKS0Bi7jrDYPwzYM7T2wudhihVI+X2dwbu5+oedxbg2VBiaMQE
         zLj7ru5263l5BpjwnnKWHbWzqM6ayWgXYNbefz23wIMhgnGirHSEqzOJwitJZPvdl6Bd
         lpxCkLifPit0hcnhRB4D7wVu6iCJeXQzkJ76GBa/2SC9Qt6+zLhnUbvA865IMWZ9mrk3
         m9m1Qva7oIUS8r62temm2dxRIEaVqG7QtCFf5fkv0hRx8nZWj6PrPY25s/5cUNsF9M3m
         1IHBDwBsUPyGQ8XMM/qKEvQpDWe4nr6JouhXPnF0cumT0+IpiyzS17Yu+mpplpEz0MfO
         QNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=wd6xpHMMaduRoCfwm2i7nDnD6wR61XPSuLoMKkIJ3tw=;
        b=uRvZf3IE0XTuE15yDfAqIsqw4iqCtfx0feXUSdPCbXZbDYATmSHUvDbbuGJ5bDW/69
         PEHZPZ0vIXWobXnD0RWRzFNacVz864tAho5+T41f5Ya7ACoDtPPP974aMkEhsiZo/xKa
         Te55ZGnUD6m9uAhKIJY8SIEujwAS36LW4m9i7bNtQDv6UWBPhq5EyZ7UE/+vq2kN62nb
         F/5ago1kgX0/OizrwqVZ0LEZTyYkqSpCbDTtwuLxtOUL/NFRYPLJXNX2HuRecVaUJKk6
         qIc6nBOzy3D0Z6uT/gnhBYDD/vBMroEUfxkGWqWq0BqO7HlGloN4bEAigaA7/VHain4A
         XKxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si149313edj.354.2019.10.08.14.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 14:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHxMQ-0000WJ-Lp
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 17:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iHxM6-0000NT-0I
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 17:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iHxM3-0006bh-Vf
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 17:49:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iHxM3-0006bD-Mi; Tue, 08 Oct 2019 17:49:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCD8710C0946;
 Tue,  8 Oct 2019 21:49:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF366012A;
 Tue,  8 Oct 2019 21:49:09 +0000 (UTC)
Date: Tue, 8 Oct 2019 17:49:07 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/5] tests/boot_linux_console: Add initrd test for the
 Exynos4210
Message-ID: <20191008214907.GA28137@localhost.localdomain>
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-2-f4bug@amsat.org>
 <CAFEAcA8ME5U5=rNLRSvNx7LmanqHhn_KWj6qtgym_=W1M9WDoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA8ME5U5=rNLRSvNx7LmanqHhn_KWj6qtgym_=W1M9WDoA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 08 Oct 2019 21:49:14 +0000 (UTC)
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
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= Basse <contact@fredericb.info>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Maksim Kozlov <m.kozlov@samsung.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9nqw1uiZTH1

On Mon, Oct 07, 2019 at 05:28:49PM +0100, Peter Maydell wrote:
> On Sat, 5 Oct 2019 at 16:47, Philippe Mathieu-Daud=E9 <f4bug@amsat.org>=
 wrote:
> >
> > This test boots a Linux kernel on a smdkc210 board and verify
> > the serial output is working.
> >
> > The cpio image used comes from the linux-build-test project:
> > https://github.com/groeck/linux-build-test
>=20
> Thanks for putting this test case together, very helpful.
>=20
> > +        initrd_url =3D ('https://github.com/groeck/linux-build-test/=
raw/'
> > +                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/root=
fs/'
> > +                      'arm/rootfs-armv5.cpio.gz')
>=20
> Do our other acceptance tests download random third-party
> (ie "not a well-known distro") binaries for the tests ?
> It seems a bit hazardous for reproducability and trustability
> reasons...
>=20
> thanks
> -- PMM

A quick and dirty grep shows (excluding comments and docs):

   boot_linux_console.py:        kernel_url =3D ('https://archives.fedora=
project.org/pub/archive/fedora'
   boot_linux_console.py:        deb_url =3D ('http://snapshot.debian.org=
/archive/debian/'
   boot_linux_console.py:        deb_url =3D ('http://snapshot.debian.org=
/archive/debian/'
   boot_linux_console.py:        deb_url =3D ('http://snapshot.debian.org=
/archive/debian/'
   boot_linux_console.py:        initrd_url =3D ('https://github.com/groe=
ck/linux-build-test/raw/'
   boot_linux_console.py:        kernel_url =3D ('https://mipsdistros.mip=
s.com/LinuxDistro/nanomips/'
   boot_linux_console.py:        kernel_url =3D ('https://mipsdistros.mip=
s.com/LinuxDistro/nanomips/'
   boot_linux_console.py:        kernel_url =3D ('https://mipsdistros.mip=
s.com/LinuxDistro/nanomips/'
   boot_linux_console.py:        kernel_url =3D ('https://archives.fedora=
project.org/pub/archive/fedora'
   boot_linux_console.py:        kernel_url =3D ('https://archives.fedora=
project.org/pub/archive/fedora'
   boot_linux_console.py:        uboot_url =3D ('https://raw.githubuserco=
ntent.com/'
   boot_linux_console.py:        spi_url =3D ('https://raw.githubusercont=
ent.com/'
   boot_linux_console.py:        kernel_url =3D ('https://archives.fedora=
project.org/pub/archive'
   boot_linux_console.py:        kernel_url =3D ('http://archive.debian.o=
rg/debian/dists/lenny/main/'
   boot_linux_console.py:        kernel_url =3D ('https://archives.fedora=
project.org/pub/archive'
   linux_initrd.py:        kernel_url =3D ('https://archives.fedoraprojec=
t.org/pub/archive/fedora/li'
   linux_initrd.py:        kernel_url =3D ('https://archives.fedoraprojec=
t.org/pub/archive/fedora'
   linux_ssh_mips_malta.py:        'be': {'image_url': ('https://people.d=
ebian.org/~aurel32/qemu/mips/'
   linux_ssh_mips_malta.py:        'le': {'image_url': ('https://people.d=
ebian.org/~aurel32/qemu/mipsel/'
   linux_ssh_mips_malta.py:        kernel_url =3D ('https://people.debian=
.org/~aurel32/qemu/mips/'
   linux_ssh_mips_malta.py:        kernel_url =3D ('https://people.debian=
.org/~aurel32/qemu/mipsel/'
   linux_ssh_mips_malta.py:        kernel_url =3D ('https://people.debian=
.org/~aurel32/qemu/mips/'
   linux_ssh_mips_malta.py:        kernel_url =3D ('https://people.debian=
.org/~aurel32/qemu/mipsel/'
   machine_m68k_nextcube.py:        rom_url =3D ('http://www.nextcomputer=
s.org/NeXTfiles/Software/ROM_Files/'

I find it hard to judge precisely how much of a third-party some of
these are.  I remember Philippe mentioning that one of them, I guess
the images used on linux_ssh_mips_malta.py, were "as official as it
gets" (my words, from my often misleading memory).

Reproducibility is definitely an issue, in the sense given that some
of these can indeed go away, but as long as they're available the hash
recorded in the test should guarantee that we're running the same
images.

Do you think we should do something different here?

Thanks!
- Cleber.
