Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4982486lfm;
        Tue, 14 Apr 2020 06:16:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKUuHPZNRlIRDtYY81Pnbu2kHiai+U85osVsAICDqT07xsXTbBoiIjayp+0Sg2odM7I1O8v
X-Received: by 2002:a0c:f74b:: with SMTP id e11mr21919055qvo.196.1586870204566;
        Tue, 14 Apr 2020 06:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586870204; cv=none;
        d=google.com; s=arc-20160816;
        b=QCh4k3t+TdAlLSg+1HN/AT22s806Qm0iG7hEszyvO3tbHGkv+gtLAze667Yj49i5RT
         1f2S+psM++OU1ekv/VXrFSDCcOan3s/+/PhFa6wsouJb+TtMB7T1kcIeJ02BF1uDuXl/
         TceseTOmnzbBxs1B6DtbOzVwAFeU2ivITsO/eaTl9TfVRoIacGcMbshqlJ/Gg5dUqAGx
         sGSKGpTn90R4EzqiVCh0tQB62A03s2bfENmWA9RNaQZ2DGlqOTOc4/wkho/QvWKYP3ag
         Y6QhE2aY387qgYU9W3SjSC48+tTBQfr+Z62FinY7YK3tfIkcd1RylBO4YzLyr/cFT2dX
         SyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sp7hGbvHRsSJq4vwR/WoGaL4OZPwo5wV8RDt+uMdw2E=;
        b=Ti3cqrTwYKD5zNpeJnAMWaGR2Cx3u0cgMBopQ5U/+hlRnjCywGH1PlaQk48ltFMTcc
         4sZvMK7Wgd9CWAVhaXZTeEp/PkGfLfssRp3a46uXElCyE73maFuzllplF0KzZSdieTTU
         d/oankBnhMtysg5EXVALWiaZ8K1hFtkWo7H2Wkcgk0TXA/AqAnk5eV6l283SLhncXdWd
         PDJsEOAzMrUMLchcGfFqkWSKmh4mBnd+I5OiFUwyrLH7dSZH59Wx3aCX6vtN5ahYqKV6
         CI+z65Yphqa0YasENJm3IGalNsHGqTzTbAxi1w96RJJCSYZycp1liJaTApWo0qpFoWP1
         n21Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KIho+dz2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si7174648qtp.366.2020.04.14.06.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 06:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KIho+dz2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOLQi-0008GD-1q
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 09:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOLOJ-0005gJ-FQ
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOLOH-00014w-5s
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:14:15 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:36166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jOLOH-000147-06; Tue, 14 Apr 2020 09:14:13 -0400
Received: by mail-il1-x144.google.com with SMTP id t8so7199767ilj.3;
 Tue, 14 Apr 2020 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sp7hGbvHRsSJq4vwR/WoGaL4OZPwo5wV8RDt+uMdw2E=;
 b=KIho+dz2OXmxMMTYDiZAk5VSian0zqjOQ0vVPiGcYPtUhpF9SHihp366joW+c55lgM
 v3l22IiVq9ZZoqFK8q2WYMztXwX4b2L7E9nGyaeWsvcn9Iu/YTk+0J9QxbqgSatlnOnO
 c5E/Hkws50Mnjg6kheA2gWSgicXJX05N0Dp86QZ4LvxdEHAglrm7FdSd49toQnEYUc18
 oI2CvUR5WQF0uOOgWWi+RpTCADrmsB+maOg0oJ81F7lf2frNKj7us4gaKxyg1cZukE7O
 LjblZsYytwuJeV04KDPQlBvnaRyIk/hT5sMEEDFJqB55Hg2Zb9lLqfdqTyoo98Cy5lXH
 ErjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sp7hGbvHRsSJq4vwR/WoGaL4OZPwo5wV8RDt+uMdw2E=;
 b=mnCyrRZ1ItaWLxQngpCqA7JHlfdVUrnvFOe7MyddhJrHeP2k6XTOPbTxYqUlkMncIG
 ApBGfwwjPgrfmKGBp9memm9FhUuP4WngTC5SxxKVjhkF479aQfmDObUv4NY8YPh4r3k0
 Lb3vchh2E1ylb0frU0nAftzU/ZbJuJzs9BQ6ZrGTgKS6EL0IO/hV+0i6rid1wormspZ8
 kPQRgVXJz2xEZhOJLPWydOXX9wHGQrq4Y3H8eNsYmMYwpqMjDXb8qO+tGPOZeB1dR0Th
 2yUvJY2Av/LBlTp56OxuyfznP7VS9EyNvQBWpKyKcorMyVavTaDJWnv0QtTpqWDtYUGJ
 /yKA==
X-Gm-Message-State: AGi0PubN4fjNVuYu2uIQd3WJqaSAb3X1QNOPzCya+JEqHozQjCpzxg5n
 kLrnQWfDb7i1cCgs/BRn1NknS9nPiWywqh6hwRg=
X-Received: by 2002:a92:aa0f:: with SMTP id j15mr105749ili.211.1586870052227; 
 Tue, 14 Apr 2020 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
 <1586529926-11441-4-git-send-email-sundeep.lkml@gmail.com>
 <b3d5a33f-150c-bfd8-ee78-40738ffe6b65@amsat.org>
In-Reply-To: <b3d5a33f-150c-bfd8-ee78-40738ffe6b65@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 14 Apr 2020 18:44:00 +0530
Message-ID: <CALHRZur9zavhQX_M0Bw0XHJwX8z39btsKgyhyGvDNoeZVdEj4g@mail.gmail.com>
Subject: Re: [Qemu devel PATCH v4 3/3] tests/boot_linux_console: Add ethernet
 test to SmartFusion2
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +jyDoV01oC6n

Hi Philippe,

On Sun, Apr 12, 2020 at 11:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 4/10/20 4:45 PM, sundeep.lkml@gmail.com wrote:
> > From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >
> > In addition to simple serial test this patch uses ping
> > to test the ethernet block modelled in SmartFusion2 SoC.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  tests/acceptance/boot_linux_console.py | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> > index f825cd9..c6b06a1 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -336,13 +336,13 @@ class BootLinuxConsole(Test):
> >          """
> >          uboot_url =3D ('https://raw.githubusercontent.com/'
> >                       'Subbaraya-Sundeep/qemu-test-binaries/'
> > -                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot'=
)
> > -        uboot_hash =3D 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
> > +                     'fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot'=
)
> > +        uboot_hash =3D 'cbb8cbab970f594bf6523b9855be209c08374ae2'
> >          uboot_path =3D self.fetch_asset(uboot_url, asset_hash=3Duboot_=
hash)
> >          spi_url =3D ('https://raw.githubusercontent.com/'
> >                     'Subbaraya-Sundeep/qemu-test-binaries/'
> > -                   'fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin')
> > -        spi_hash =3D '85f698329d38de63aea6e884a86fbde70890a78a'
> > +                   'fe371d32e50ca682391e1e70ab98c2942aeffb01/spi.bin')
> > +        spi_hash =3D '65523a1835949b6f4553be96dec1b6a38fb05501'
> >          spi_path =3D self.fetch_asset(spi_url, asset_hash=3Dspi_hash)
> >
> >          self.vm.set_console()
> > @@ -352,7 +352,12 @@ class BootLinuxConsole(Test):
> >                           '-drive', 'file=3D' + spi_path + ',if=3Dmtd,f=
ormat=3Draw',
> >                           '-no-reboot')
> >          self.vm.launch()
> > -        self.wait_for_console_pattern('init started: BusyBox')
> > +        self.wait_for_console_pattern('Enter \'help\' for a list')
> > +
> > +        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 10.0.2.=
15',
> > +                                                 'eth0: link becomes r=
eady')
> > +        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
> > +            '3 packets transmitted, 3 packets received, 0% packet loss=
')
>
> Very nice (and smart) :)
>

Thank you :)
Sundeep

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> >
> >      def do_test_arm_raspi2(self, uart_id):
> >          """
> >
