Received: by 10.223.159.82 with SMTP id f18csp3962609wrg;
        Wed, 29 Nov 2017 01:58:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMatm0G+lQYtis6EAQyZvSIyKe75da7C3FOY+K13vU89imZF4lXVvpVGG2qZm7diTEdLSGbY
X-Received: by 10.129.46.203 with SMTP id u194mr1369897ywu.143.1511949504010;
        Wed, 29 Nov 2017 01:58:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511949504; cv=none;
        d=google.com; s=arc-20160816;
        b=aBMnPW0uIZMjKRLXaS2L5SCkbp/Ghc75tz5SgNroRQ6S+ZJzg4EEsO8md4ZUTuaZdR
         KZnLS0Hu6qr8/6jh9Uh8Kh12FNGH8S1Fqb8tvXA4mhc0ug1dPqR+J8eNrQuIyEj5+1JY
         Gjdo77or7geO2H1ZJKv9xdEwNtPYBjtUJQmw6zg4wml3eMgbOtxP4C55CErn5X+DRe0r
         v2qBQebPGnYQBvFM1ewatqGee82KLxVnHWBthp7wXwUKU3mxWgu8vxy3NqzmPZwa0orY
         wr9vLC1clzR40zGVNjnWpdGeAc1hdb1Mf9NkflhL24e+xB+EM1+LVlgOUOte5GUXd7xg
         VLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=k5TQaeKPJGvUZjE2WTF8ehOX7RjoJyz++8gCOCj8sBk=;
        b=r+VhD6n0kD3I9ttD4JzDmoPujUFZ3QEtV8rYi75pBlviOX17Uo5vcWFFAfMVEBOgd7
         v9GlkLI/AHYVQ3b+FV6nLnr3k3Y7rt4UEbPH+uBnVfihn1ueT30dmMOa4vkwa7inCd0H
         gl8Oa6FYarBirXtOFvo2lXimmmMOhTEcviuOGal2N7OOFtTDS5TEkpXIsHoENO0reeVS
         FYJs/FxPXyxfc5aAVq19YQ7LP8Du3RbpljeddV0s0Z93sxlgxZ9fTbdxcgqnHC7sqHJM
         6NrjVgaSvj8jxbMSLLmwB1QRb+faqSPJpG3leRgiW7ii3b8FJiXJpN1vkWa7nEBYN7iU
         Pm6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l15si253667ywa.329.2017.11.29.01.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Nov 2017 01:58:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJz8J-000531-Fi
	for alex.bennee@linaro.org; Wed, 29 Nov 2017 04:58:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eJz87-00052o-Nx
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 04:58:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eJz84-0003pf-MW
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 04:58:11 -0500
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:43293)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1eJz84-0003nP-GV
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 04:58:08 -0500
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 78143D3F80
	for <qemu-arm@nongnu.org>; Wed, 29 Nov 2017 10:58:06 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player731.ha.ovh.net (Postfix) with ESMTPSA id 0DD7C4200A0;
	Wed, 29 Nov 2017 10:58:00 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171019151249.13663-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <17d7270b-9016-face-5fba-c6e321e92d88@kaod.org>
Date: Wed, 29 Nov 2017 10:58:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9560579060078578628
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtuddrtddvgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.165.38
Subject: Re: [Qemu-arm] [PATCH v5 0/8] aspeed: add a witherspoon-bmc machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdI9VteMFnQ5

On 10/19/2017 05:12 PM, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> This series adds a new Aspeed machine to emulate the BMC of a
> Witherspoon system. It also extends the other Aspeed machines with I2C
> devices and adds a simple model for the pca9552 LED blinker present on
> the witherspoon board.
>=20
> Thanks,
>=20
> C.
>=20
> Changes since v4:
>=20
>  - use a ROM memory region
>=20
> Changes since v3:
>=20
>  - introduce a dummy ROM device to catch invalid writes
>  - removed 'ignore_memory_transaction_failures' on all Aspeed machines

So that was a bad idea because old firwmares run load/store loops
beyond the address space to guess how much RAM the SoC has. =20

I am wondering if it is possible to model the same behavior with
a MMIO region (of a correct size depending on the max ram size of=20
the SoC) and mapped beyond the RAM region to catch such accesses=20
and keep 'ignore_memory_transaction_failures' to false.=20
 =20
Thanks,

C.


>  - reworked PCA9552 device :
>    . simpler I2C handles
>    . auto-increment support
>    . unit test
>=20
> Changes since v2:
>=20
>  - removed comments on the I2C buffer size pf the PCA9552 device.
>  - removed 'ignore_memory_transaction_failures' flag on the
>    witherspoon machine.
>   =20
> Changes since v1:
>=20
>  - introduced smbus_eeprom_init_one()
>=20
> C=C3=A9dric Le Goater (8):
>   aspeed: use a ROM memory region to catch invalid writes
>   aspeed: remove ignore_memory_transaction_failures all boards
>   aspeed: add support for the witherspoon-bmc board
>   aspeed: add an I2C RTC device to all machines
>   smbus: add a smbus_eeprom_init_one() routine
>   aspeed: Add EEPROM I2C devices
>   misc: add pca9552 LED blinker model
>   aspeed: add the pc9552 chips to the witherspoon machine
>=20
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/aspeed.c                 | 110 ++++++++++++++++-
>  hw/i2c/smbus_eeprom.c           |  16 ++-
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/pca9552.c               | 259 ++++++++++++++++++++++++++++++++=
++++++++
>  include/hw/i2c/smbus.h          |   1 +
>  include/hw/misc/pca9552.h       |  33 +++++
>  tests/Makefile.include          |   2 +
>  tests/pca9552-test.c            | 131 ++++++++++++++++++++
>  9 files changed, 544 insertions(+), 10 deletions(-)
>  create mode 100644 hw/misc/pca9552.c
>  create mode 100644 include/hw/misc/pca9552.h
>  create mode 100644 tests/pca9552-test.c
>=20

