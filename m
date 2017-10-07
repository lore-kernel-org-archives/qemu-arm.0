Received: by 10.223.197.9 with SMTP id q9csp845743wrf;
        Sat, 7 Oct 2017 09:44:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCEUqfSu5wG1zSsIBC6ZXZxAGHZEmvxmKE2Hi8enbKCqsoWbXsl87Eylm/r4L4E70hwncil
X-Received: by 10.200.42.46 with SMTP id k43mr8366444qtk.273.1507394693363;
        Sat, 07 Oct 2017 09:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507394693; cv=none;
        d=google.com; s=arc-20160816;
        b=VfSJcntcL8FJS75lCbf8hO9ng3QtP7it71hZdzbBmqBjNqhL9SzhXh6RoBe4U2wBvI
         WcdNzjlzuoVLI0NA8eiiEh0oKRVie7Bjr9zAX2XoKPHn5Wq4W2jwxmkoPQSTgFo7QSDs
         u6F/vxizWGMPkg9YHl707/F0mweT6p8aIqkTIV3C0wnC9uPldWDGse8ajHE7bY7RWPxW
         OeBKf5S3ZvT4hDA9YZE0TorMcvpIhxdpR34P8e784F/JrQuo8pnWp29hKy9hvk6UjCny
         GCL7+EJGGkZconeAu9eSV6+7pu1ZSz9S+kEGYWEgfeMY6xKn4cDExJ1m9nuZ0QP6OOAX
         zE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=c8nesrGYcjtq1vTL4tHfw2l25BdlUiCe+6jKjbmBtp4=;
        b=dVfhbYpETS1lR2wUFQe0xwzJDISGrsZ3cce40DSN1HxDyN1KjoUvMyVBSGSEZPn4ns
         q6WOkGqK7ass3P66FWUGLyJZsCZk83EuHwZj35YUgkCko6Hl5nF8BAXE7geEDetJ2iz0
         hFls69J/wIYGeGB2MvxjlphLavc4WOMUQGNuyU5fDhdLtgEfvSWxlY5Y4ik+dbTaNPsh
         Fe0Bx4QUVR2n5Eflby09rJhnOPMl/11fEEiSTI78bCmuoK1mXsLBk08IkBSK82GpmYq9
         RDeMBFoqzddjdYKWEvRSoCAW12+kBQjYvfgGz0+toLXHxl+ny4uJukNRI5yGJTApDM+U
         F9MA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g21si3386094qtb.129.2017.10.07.09.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Oct 2017 09:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0sDc-0008Kp-N4
	for alex.bennee@linaro.org; Sat, 07 Oct 2017 12:44:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sDO-0008IP-He
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e0sDL-0005aD-E7
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:44:38 -0400
Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238]:45123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e0sDL-0005Zf-7M
	for qemu-arm@nongnu.org; Sat, 07 Oct 2017 12:44:35 -0400
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id D40EF80819
	for <qemu-arm@nongnu.org>; Sat,  7 Oct 2017 18:44:33 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
	[31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id 573B77C0082;
	Sat,  7 Oct 2017 18:44:28 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<CAFEAcA9Avqgbm7sZTKuex9dOp-1wzw0Moa8XVvXw5GZjSeC5Xw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7fb02e55-68dc-8509-7c2b-d049eca19d9e@kaod.org>
Date: Sat, 7 Oct 2017 18:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Avqgbm7sZTKuex9dOp-1wzw0Moa8XVvXw5GZjSeC5Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 320037050905562052
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.238
Subject: Re: [Qemu-arm] [PATCH v2 0/6] aspeed: add a witherspoon-bmc machine
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7ao78nG2s5z

On 10/06/2017 05:13 PM, Peter Maydell wrote:
> On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> Hello,
>>
>> This series adds a new Aspeed machine to emulate the BMC of a
>> Witherspoon system. It also extends the other Aspeed machines with I2C
>> devices and adds a simple model for the pca9552 LED blinker present on
>> the witherspoon board.
>>
>> Thanks,
>>
>> C.
>>
>> Changes since v1:
>>
>>  - introduced smbus_eeprom_init_one()
>>
>> C=C3=A9dric Le Goater (6):
>>   aspeed: add support for the witherspoon-bmc board
>>   aspeed: add an I2C RTC device to all machines
>>   smbus: add a smbus_eeprom_init_one() routine
>>   aspeed: Add EEPROM I2C devices
>>   misc: add pca9552 LED blinker model
>>   aspeed: add the pc9552 chips to the witherspoon machine
>=20
> Hi -- I've made a couple of review comments and nothing else
> leapt out as obviously wrong, but I'm hoping that somebody more
> familiar with the aspeed devices will do review...

Joel,=20

Now that we have updated the DTs, could you please take a look=20
to make sure that the I2C busses in the models have devices=20
which makes sense with the real boards.

Thanks,

C.  =20
