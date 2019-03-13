Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1062791wrs;
        Tue, 12 Mar 2019 17:24:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv0GAkKY3te8lVT02Ddz8q/MG33GZ9Aoe1CGuuhmhN364ffoavcB3eF772YDIEna5lFimx
X-Received: by 2002:a0d:e613:: with SMTP id p19mr10751509ywe.96.1552436656804;
        Tue, 12 Mar 2019 17:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552436656; cv=none;
        d=google.com; s=arc-20160816;
        b=GvIiKJWATZbEOmJOUK4Pc6AYVhnywKAYMpVN9UgLMpn90xzR1vfd3O3/8Mi4fagfb8
         MRhBl8VqQ5lMt3s9cFE/X04whNgMJlu+DaUtTsrsJbE05I5En/3vqdmr8EEPBkkKz34L
         bVLywSD4yH6n1xY54WNjTP8v2aZAiIBNfyhRi2kxzY76b5Ghtt3JPoF1qbqqJds2cAxP
         7K0T22tS5n/q2Q1ciX1it9EZDyZ8wtf026zr6x/tXD/8hTeWlynhAnBnAa0zHZh+w1Xj
         mCh1BhVfvdc8LzuqJViddnllmeY1/7Ypf2jOnTrqslDkKt8ETwXBI65T8nSS7zkKmRtA
         6ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=NblytQcjQbOHLgqLyHJGrI5wbLf/EX5n8h5cA+0tTtQ=;
        b=knU0HkJVhLPYs7SxfSyhM3/NpXLzsRHYDcpC2BflG5fS+yppH64ko86mIgkRIetxl+
         RdfNA5N786FasJXj3Qk93ixxCuNVpn7lqF0/bjK/o/qXqPqpNO0i2AFlo/+ifHekI9hf
         nMgwvmvxuzACwb75ydyc0ofx7NPuRaapn4e6v4SPJiiajputgMqrlg78MV/HlywUR6Cm
         buLtAuSbZkl+JJuB/jx5cRDHaQWWM2QyDaAK0yrzmQR33YgSVZsRMD/FnAxLlND4QZT1
         bWxPszWzZacCtmL3b0TBjM2RxYU9au51ZTVNl2e4dHPGJWsA4Ofxu8b90Sn7Z5CEeNl/
         SZoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p188si1549477ywd.346.2019.03.12.17.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 17:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3rgu-0004dO-AD
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 20:24:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1h3rgT-0004YL-Je
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 20:23:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1h3rSO-0001bO-QO
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 20:09:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1h3rSN-0001XO-6Z; Tue, 12 Mar 2019 20:09:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA913308FBAE;
	Wed, 13 Mar 2019 00:09:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-71.rdu2.redhat.com
	[10.10.121.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC9911973B;
	Wed, 13 Mar 2019 00:09:10 +0000 (UTC)
Date: Tue, 12 Mar 2019 20:09:08 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190313000908.ya5knaxnv5gp57ct@localhost.localdomain>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190312234541.2887-3-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 13 Mar 2019 00:09:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test: add a test
 for the Raspberry Pi 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IT2n85V5GB4l

On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
> board and verify the serial is working.
>=20
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>=20
> Alternatively, this test can be run using:
>=20
>     $ avocado run -t arch:arm tests/acceptance
>     $ avocado run -t machine:raspi2 tests/acceptance
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 29 ++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index 0936589fd8..dd2733b55f 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -197,6 +197,35 @@ class BootLinuxConsole(Test):
>          console_pattern =3D 'Kernel command line: %s' % kernel_command=
_line
>          self.wait_for_console_pattern(console_pattern)
> =20
> +    def test_arm_raspi2(self):
> +        """
> +        The kernel can be rebuilt using the kernel source referenced
> +        and following the instructions on the on:
> +        https://www.raspberrypi.org/documentation/linux/kernel/buildin=
g.md
> +
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:raspi2
> +        """
> +        deb_url =3D ('http://archive.raspberrypi.org/debian/'
> +                   'pool/main/r/raspberrypi-firmware/'
> +                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
> +        deb_hash =3D 'cd284220b32128c5084037553db3c482426f3972'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        print("deb_path: ", deb_path)

This looks like a left over you forgot to remove.

> +        kernel_path =3D self.extract_from_deb(deb_path, '/boot/kernel7=
.img')
> +        dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rp=
i-2-b.dtb')
> +
> +        self.vm.set_machine('raspi2')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyAMA0')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command=
_line
> +        self.wait_for_console_pattern(console_pattern)
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --=20
> 2.20.1
>=20

Other than that, it looks good.

- Cleber.
