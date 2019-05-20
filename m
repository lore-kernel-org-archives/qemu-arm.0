Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp707263wrg;
        Mon, 20 May 2019 15:38:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvoChrQyjOFW8LERPvaUjb8q3uJwvCCmXxaTuBq/Nth2abqEhWg0WDtD0KQp+6/f0kwWx7
X-Received: by 2002:a50:be42:: with SMTP id b2mr80637229edi.228.1558391896569;
        Mon, 20 May 2019 15:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558391896; cv=none;
        d=google.com; s=arc-20160816;
        b=YmQmQrbPRmQWs+OhmT516W1r9VZpRYvjMYOwJ7DgXEadbJyYJs9KIf47ebJm6/rM1U
         n5qbLP/sskKT88rroNL3ueBhKdgWBbtekpVpqJHa9ipzTPUFxkAkCsCwDaUX8jzZm8P2
         z/kkQBJ0qBH9oA0e8cdP/86asxsuaK0g8nRcDIdTkEvk7q8fGCWnwodJchJjrlcbMxvd
         dvqSs8nwzancl2qAdBAlj6GN8MNdAYjPxRaL3UQoDjGJIXCTv2sO3Jt5HYXf7pYZBiUx
         s3iN/n6k5AZMpoyByrKqzj+85J6I9yWYp7AtPEca5ih12lj33wXwbbJzWHierhfxWQQN
         GT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=PY+CsTSh8GPctl9g5Hg+Op4ObYrj5XAFUZbl6/vgehY=;
        b=Zan2QkZLHJQvM5jWafgHlhR7lGxrFbnPmPGUkuJBvQmyYTK2RBDtcKiYBDLa9hb3uj
         VRrC2zfoZgkvOQjcuxqdJz4ibMCDgD7LgCpCuZFSZdB7T5bjqM4iSkRVMNK4chhnoPr4
         xA+VlhOfcRivoH/sQkKG70l6V/4C1EsV/Kg8tKVdXiTczRDY/1/OJuP6pzToCG23hUBG
         Qi0DGSElxpPqrxatWv9Uvp45FJVQnohqcBEQdx+kIzpai286HhXTGRS/ai/oRNDR2bTM
         +TY6vM+bwN+Ygf3ostiGZ1ae0KV74ACLy7wJdOcRwYHHed3epxtMA2R7i5uyHS9HSL0A
         C25g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q7yrwjEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y36si2066354edb.207.2019.05.20.15.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 15:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q7yrwjEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqv5-0003t1-II
	for alex.bennee@linaro.org; Mon, 20 May 2019 18:38:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSquo-0003pk-BH
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:37:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqun-0001tW-7U
	for qemu-arm@nongnu.org; Mon, 20 May 2019 18:37:54 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hSquk-0001pe-Hq; Mon, 20 May 2019 18:37:50 -0400
Received: by mail-lf1-x142.google.com with SMTP id h13so11516104lfc.7;
	Mon, 20 May 2019 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PY+CsTSh8GPctl9g5Hg+Op4ObYrj5XAFUZbl6/vgehY=;
	b=Q7yrwjEjcsduDgJCtw54glcG/sGGBm0t3Zxfc0dSesXxtHPDmNUdfXrEHCLj/2xOgF
	sdwFijhvQ4pHFXvgUn/+KNm87pnEAoNhMab5wiY8PH2lSCc/By8/RVyQBrGnmmJ0BaRb
	SdQiesyVH7MJc/uqMFagRb+oFhrPbiqsquVHV3xJ0PSAIb9NcqfPDUnfJ5eqDNL7KtSM
	V8tRvetyucO7x+k92wVZrseCNh3qW26m+0D4Dw4rjk2Zp9jdJBM+VGhasTaTnqJTInDC
	Z5dw2sdmLmZqjcl3CULi/3Cby6GGysIGtJsJqh7vlcF/OCAp+JGCmPsPHEvlkt0pASfv
	jwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PY+CsTSh8GPctl9g5Hg+Op4ObYrj5XAFUZbl6/vgehY=;
	b=WSSeCqVIvw6aYmnGHHbYqq2KkOnSFmtZmZxH/pl4iAdJ9AwwftfX7JvxuA1etlKQCt
	7WFiFsCCTs+IEgPfcjDh3kKF/93WQJPYMudPq6tgG2EDBPexz+dFZt5iH0KUe14iCKOb
	8p/KxL7kHj29muhItkAlpfv9Y6Sv0XOskM1zGb0N24UAzIrstizExtIHVVR/5LtNX0aG
	fjJkzHgEHuBcGwo2q9F/TTHjSxu0tPyBoTZB5wsJfM7cApF34tTnNeO9+eAQ0hCwUWJ9
	O2ni2fDq5s3LILAjw+nyWIa2PhwVbU2o6aSIJpBsCox7hT8Xb6ie2ca9xgjRUl5iJsGP
	/Uiw==
X-Gm-Message-State: APjAAAX6PyFgj0RfwuaP2FRhyY4o8JQUBmuXEuN4J0T7DHI7jGcd38KP
	X9Ym4ZcLNnS/Zzf3NYz3Xxnn2Zo+Nht6JnNq1qI=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr39051168lfa.25.1558391868543;
	Mon, 20 May 2019 15:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-3-f4bug@amsat.org>
In-Reply-To: <20190520220635.10961-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 May 2019 15:35:33 -0700
Message-ID: <CAKmqyKMsVgy-f4oPZ9UaFZHqt5Q+D7=2sr=5tFqY_eU-Jws2Jg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] BootLinuxConsoleTest: Test
 the SmartFusion2 board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Cleber Rosa <crosa@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Caio Carrara <ccarrara@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8YXD1X8LoAv

On Mon, May 20, 2019 at 3:09 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Similar to the x86_64/pc test, it boots a Linux kernel on an
> Emcraft board and verify the serial is working.
>
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>
> Alternatively, this test can be run using:
>
>   $ avocado run -t arch:arm tests/acceptance
>   $ avocado run -t machine:emcraft-sf2 tests/acceptance
>
> Based on the recommended test setup from Subbaraya Sundeep:
> https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/acceptance/boot_linux_console.py | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index f593f3858e..844cb80bb5 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -178,6 +178,33 @@ class BootLinuxConsole(Test):
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
>          self.wait_for_console_pattern(console_pattern)
>
> +    def test_arm_emcraft_sf2(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:emcraft-sf2
> +        :avocado: tags=3Dendian:little
> +        """
> +        uboot_url =3D ('https://raw.githubusercontent.com/'
> +                     'Subbaraya-Sundeep/qemu-test-binaries/'
> +                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot')
> +        uboot_hash =3D 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
> +        uboot_path =3D self.fetch_asset(uboot_url, asset_hash=3Duboot_ha=
sh)
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
> +                         '-drive', 'file=3D' + spi_path + ',if=3Dmtd,for=
mat=3Draw',
> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('init started: BusyBox')
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --
> 2.19.1
>
>
