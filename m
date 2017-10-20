Received: by 10.223.197.9 with SMTP id q9csp7579100wrf;
        Thu, 19 Oct 2017 23:15:51 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SUlZd2303+xqeXFMG8qezlUhQYZuHvJhJjew83bOIcq3gZg5uhr4KGyxVvNYinEkJ9o+Fe
X-Received: by 10.200.41.19 with SMTP id y19mr5744182qty.300.1508480151322;
        Thu, 19 Oct 2017 23:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508480151; cv=none;
        d=google.com; s=arc-20160816;
        b=uFEwuig3DdHeal3kMdm8CMAhcuB3ZpAy8N79YjASCXnBzbkG13hRrk23jpGC1/vaMQ
         nAUzLq3jueP5jjqmGgYWuSJJQFNAyz42UAbXxru5vZcSLau0kghmpTluILGA+rG8FYVX
         EgkYdE6thrz33bMrsIevasvE5JwEqGK6CJF/SGOa+lruStQoPDrW8d+webCSDQ0Im904
         tt20+5E4yj5HWEqyvkPVHIT6fBVce+JScmmMmrUsv1JFymGNfOy4SsTMUIk/FNfYaTRX
         ymJb2gnAMDXhrvTr+LpfaoOYvO0zYjrQqMhz1KfNn7A3kWfukCBJaptmhKJChm4mxWIQ
         JuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ylJdGfJkCiLGSWX1oRgpXlCzggcfh83v6ZvLktCrY10=;
        b=Ao6hwDALNFHGmrTtkIdXxOtRjFTkDhO8vc9NgNcRQyZDR0w9sdH9oIpdGFTZYfD2ZP
         VNn1bsyYG3aKuxasIzM9Cd+8eCTT4geNaQH1khOCAJLIfw/l/lFfTXx1qX7V6lQxx/y1
         yQCXFdyur6sOn4oFzm1hQbkvYfKEjUxWlT28s0Fz/yUyAT9/6odf1Kod9BpYaTI0nr5Z
         Xq804B0sfQHl9k/L4wARzwKHDcCipRZtBIK8B0RjVAMVZjzCBoibcpozvgsYW4d2gVKl
         Usw/X2FzpJG5MRe8T01cdMDM/7XrkSIV7sB0zIq/A5DVPc0MWCmU+xgi2akGKhCevYXE
         n1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si194498qki.156.2017.10.19.23.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 23:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Qaz-0005Mp-7I
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 02:15:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Qan-0005Lh-KF
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Qak-0008Hq-D7
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:15:37 -0400
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:53096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Qak-0008HF-7I
	for qemu-arm@nongnu.org; Fri, 20 Oct 2017 02:15:34 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id E49D814652F
	for <qemu-arm@nongnu.org>; Fri, 20 Oct 2017 08:15:32 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id A314180084;
	Fri, 20 Oct 2017 08:15:27 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171019163546.2039-1-clg@kaod.org>
	<20171019163546.2039-9-clg@kaod.org>
	<2348bd8d-3247-c0f8-8a75-59b9ea0b2732@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5aed53e6-f649-a3b4-a672-a08758482766@kaod.org>
Date: Fri, 20 Oct 2017 08:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <2348bd8d-3247-c0f8-8a75-59b9ea0b2732@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10701678616444570579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudelgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.132
Subject: Re: [Qemu-arm] [PATCH v6 8/8] aspeed: add the pc9552 chips to the
 witherspoon machine
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
X-TUID: EjD3YvfudadF

On 10/20/2017 04:59 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/19/2017 01:35 PM, C=C3=A9dric Le Goater wrote:
>> The pca9552 LED blinkers on the Witherspoon machine are used for leds
>> but also as GPIOs to control fans and GPUs.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  hw/arm/aspeed.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index df7f266800ba..0e2a4fa62c26 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -397,6 +397,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSt=
ate *bmc)
>>      AspeedSoCState *soc =3D &bmc->soc;
>>      uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
>> =20
>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca95=
52", 0x60);
>=20
> TYPE_PCA9552 ?

I expect one day that the full "pca9550,1,2,3" device family will=20
exist and I am not sure there is much point in adding a define for=20
each. I should probably remove the TYPE_PCA9552.

Thanks,

C.=20

>> +
>>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp42=
3", 0x4c);
>>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp42=
3", 0x4c);
>> =20
>> @@ -409,6 +411,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSt=
ate *bmc)
>> =20
>>      smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), =
0x51,
>>                            eeprom_buf);
>> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9=
552",
>=20
> ditto
>=20
>> +                     0x60);
>>  }
>> =20
>>  static void witherspoon_bmc_init(MachineState *machine)
>>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20

