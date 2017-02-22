Received: by 10.25.0.147 with SMTP id 141csp1186128lfa;
        Wed, 22 Feb 2017 14:59:45 -0800 (PST)
X-Received: by 10.55.153.130 with SMTP id b124mr28399358qke.82.1487804385767;
        Wed, 22 Feb 2017 14:59:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a63si1990338qkb.149.2017.02.22.14.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 14:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:55580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgfst-000056-8J
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 17:59:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cgfsp-0008WV-7N
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 17:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1cgfsk-0007RC-86
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 17:59:39 -0500
Received: from bee.antfield.fr ([188.165.75.195]:60126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1cgfsj-0007Pq-UA; Wed, 22 Feb 2017 17:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487804372; bh=SFl1JiITTm8UmG5+QoAhOUMQ7Cy3j33Cswf9LAENJMI=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=o1krssQIyg1CHPDbGkLNJ7dQHawWwjNBt15l8XUsOboDvZ+1rUlYCC2gMDw3ON3Vh
	lLK+kr3inNpmsYOo5lHnwEa91zP2ojeTfBHAF8FDeA/SVorBxkQ5zLIeUStoz5KljZ
	ew1y/grLTixYoOuyFT/prONpsm40iVuw72CfGrX4=
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
	<20170222112338.25492-4-clement.deschamps@antfield.fr>
	<DM5PR03MB2827C1EEB91C11DEF0FBE9D89E500@DM5PR03MB2827.namprd03.prod.outlook.com>
From: Clement Deschamps <clement.deschamps@antfield.fr>
Message-ID: <fd715c76-862b-2f05-bef7-bdc73275070d@antfield.fr>
Date: Wed, 22 Feb 2017 23:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <DM5PR03MB2827C1EEB91C11DEF0FBE9D89E500@DM5PR03MB2827.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: Re: [Qemu-arm] [PATCH v2 3/3] bcm2835: add sdhost and gpio
 controllers
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u9DgBCX1aqKV

Hello,


On 02/22/2017 07:27 PM, Andrew Baumann wrote:
> Hi,
>
>> From: Clement Deschamps [mailto:clement.deschamps@antfield.fr]
>> Sent: Wednesday, 22 February 2017 3:24
>> Subject: [PATCH v2 3/3] bcm2835: add sdhost and gpio controllers
>>
>> This adds the bcm2835_sdhost and bcm2835_gpio to the BCM2835 platform.=

>>
>> The bcm2835_gpio has a link to both the sdhci and sdhost controllers f=
or
>> supporting the alternate function of GPIOs 48-53 (SD controller select=
ion)
>>
>> Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
> [...]
>> +    /* SDHOST */
>> +    object_property_set_bool(OBJECT(&s->sdhost), true, "realized", &e=
rr);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +
>> +    memory_region_add_subregion(&s->peri_mr, MMCI0_OFFSET,
>> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhost), 0)=
);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhost), 0,
>> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>> +                               INTERRUPT_SDIO));
>> +    object_property_add_alias(OBJECT(s), "sd-bus-2", OBJECT(&s->sdhos=
t),
>> +                              "sd-bus", &err);
> Is this alias still meaningful / needed, or is it a relic from the prev=
ious version? Right now it doesn't appear to be used, and I'm thinking th=
at if someone did try to use it (e.g. at the board level by connecting an=
 SD card) then the new GPIO logic would allow swapping the two SD cards b=
etween the two controllers, which doesn't sound like a faithful recreatio=
n of the hardware.
>
> Otherwise,
> Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
>
> Cheers,
> Andrew

Thank you Andrew for your review.

You're right, we don't need to expose anymore the sdbus of the sdhost.
We can remove this alias.


Peter, do you agree with the sdcard reparenting function I implemented
in the GPIO controller (following your advices) ?


Best,
Cl=E9ment

