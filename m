Received: by 10.223.172.38 with SMTP id v35csp384197wrc;
        Tue, 19 Sep 2017 23:56:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB7hsdo8ytxPR2Ks8LcxBj4nwxLPL6bdNhxvmeYbAEiKzuG3yKCNRgkiz0+UFUwusrrs4CC
X-Received: by 10.55.7.22 with SMTP id 22mr5314539qkh.43.1505890564853;
        Tue, 19 Sep 2017 23:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505890564; cv=none;
        d=google.com; s=arc-20160816;
        b=Ni2gZOWNe0a0Okprc8tmCs8e12vXn/kiLZnOHe5CfidAXVYJR7uvEH+CwtnIDNAnUK
         x4ca4dpoAssgUkfRBb/BmKJ1nbKHt8woCHFddU4wCGeG9qlRyA9DhbmAa7zp0hsQfguK
         /xVHyMZVE3TfJ4uOGKLCRV5Jw+iuzjr71bw7W9x6CJ/MFio6r7NY0GxT6Z9+TMru3FBz
         sujHhwLzGo8ucYJ6IL2RDmsdLGvbjNjnjeYADrFWfr4oEVQbSmEiAaAkxULxImKFl2Xb
         2TU7JVyIcbx9RcJzvTys2qT1ovLUiEUAKnVhKQHHso/v8vNi2HOQLwfkLsy3dI1sxmTq
         fClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=KeBKpppc1gZq/Cs5jcnx7Wi/s2EgUCVeS+/KCgFFYKg=;
        b=rIkwZ8/8QbhFbLN49I4H54jqjvNOrYuzCBD3uDWvMHt+5LPAT54MFdeCT8y6hfxy1i
         +w6zozW7zRm7FVM8coB/3k+cg1cV2Xfv9OejwqVaCG85A+KmdruWcUvBbpB+4fjQU1uZ
         yXXwhAg/IpUM1TCz91I2Y5n+v6FoNtYozpJHWICl+8ApVJ0qqI5mMKnvwR/bsTI1e/bB
         /SCqU2r9Z6/Pc9ENnnJzcA8tLFkn3/33a136MiIXUGb5P9ReTPorNoVx86HgOapznYf+
         KkHpkN/jpUMdVjqttHM3/9Cadilu0WQ5NiO86KZQ0Yyeh50qaNa76cQ3jvQQeErjhDP7
         2eUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w51si336667qth.374.2017.09.19.23.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 23:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duYvS-0000xp-Mj
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 02:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duYvG-0000xI-PP
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 02:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duYvC-0002MJ-8u
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 02:55:50 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:44332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duYvB-0002Kp-Tm
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 02:55:46 -0400
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 5DB5DAC966
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 08:55:44 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id C821650009E;
	Wed, 20 Sep 2017 08:55:37 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170919112645.8574-1-clg@kaod.org>
	<20170919112645.8574-5-clg@kaod.org>
	<3bb3924d-a7c9-26b3-50a2-8a10ef2585e5@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ad7f410e-2eff-278e-a767-2a6600e1601e@kaod.org>
Date: Wed, 20 Sep 2017 08:55:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <3bb3924d-a7c9-26b3-50a2-8a10ef2585e5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1220194025043430355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.63.121
Subject: Re: [Qemu-arm] [PATCH 4/5] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jCJGR8WpoXhL

On 09/19/2017 03:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 09/19/2017 08:26 AM, C=C3=A9dric Le Goater wrote:
>> Specs are available here :
>>
>> =C2=A0=C2=A0 https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
>>
>> This is a simple model supporting the basic registers for led and GPIO
>> mode. The device also supports two blinking rates but not the model
>> yet.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>> =C2=A0 default-configs/arm-softmmu.mak |=C2=A0=C2=A0 1 +
>> =C2=A0 hw/misc/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 hw/misc/pca9552.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 212 ++++++++++++++++++++++++++++++=
++++++++++
>> =C2=A0 include/hw/misc/pca9552.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 32 ++++++
>=20
> I'd rather move it to hw/display/

The device is not related to displays. It is just an I2C expander=20
chip. I would leave it under misc/

C.=20

>=20
>> =C2=A0 4 files changed, 246 insertions(+)
>> =C2=A0 create mode 100644 hw/misc/pca9552.c
>> =C2=A0 create mode 100644 include/hw/misc/pca9552.h

