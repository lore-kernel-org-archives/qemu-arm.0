Received: by 10.25.21.156 with SMTP id 28csp1799061lfv;
        Tue, 26 Jul 2016 09:11:14 -0700 (PDT)
X-Received: by 10.55.66.73 with SMTP id p70mr31523627qka.9.1469549474586;
        Tue, 26 Jul 2016 09:11:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si911317qte.3.2016.07.26.09.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 09:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS4ws-0007JW-1a
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 12:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS4wn-0007IX-Ip
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS4wh-0000SD-S1
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:11:08 -0400
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:34806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bS4wh-0000S8-N6; Tue, 26 Jul 2016 12:11:03 -0400
Received: by mail-io0-x244.google.com with SMTP id g86so2315034ioj.1;
	Tue, 26 Jul 2016 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=y+UGtSRLmkFTpGPoTVs8dXWSuTkFuoHZK3G+QHRDYPU=;
	b=EzKfZXWPxSyK+RaBwYR2Q6Ey7gf998FVotmJfQj/LNUcwp9qLvx9oFo2k/F7bbZP4p
	pNytbdpIEDsD3DO6GcksTE1kluC9qPDxOKoxl1cx4DhZ1XvOFWlAYLpN3WhERqgtTgaz
	80RmtFmbE8Br0PtGzjRJNw5sKNRVtlUYxfBmWTqap9rKGyhaC8/BG+0QjaYUbeZGkF8C
	96epvSRDsHPu8Om+OE7/m6GNmK+jwf4OhGeeLfcfAdE1BjkzxhDxPVNu6NSRfIKTdREP
	lPY2ZA7ghW4unvw0QyivM2+9KbuNmYA/YXfUlTttGobBNUdiuFAHOUYru+5yhyqNJ8ev
	S8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=y+UGtSRLmkFTpGPoTVs8dXWSuTkFuoHZK3G+QHRDYPU=;
	b=ce7c98q95svxu2zMqUTLjqQVKzX7JLjc6gIRiSFo8LxY4zmZF/DL0AzorkukqJDwvL
	lntsck2IgnR5iuZu2rIo3OteeOdMH0joPuqvBdex4Jq1I7r4HE0rYRKjav6bHbVY7q6B
	czBzaU6b+HIx65eJDPXtKl42pPvMucB39e6HdoFKd4BaSvdUHFTOs/Wb/If2UXScK5BC
	OjYxpsDOoDmbH05wQZlZ5KYzN0JxecEOmn/ZgQtLzPIHEoUHjwXQ3of41auYVy/mgXbb
	6AiIsvUFC/oTdIEsC5tH6+oZPagFNVWI+8BLpSLZSdK10yRPOGrgxTxxk76a16wBCQc1
	ZEuQ==
X-Gm-Message-State: AEkoous2vDcRTceeffV+pc+CmQyr7AnJJMruRJEcHV0lei41DeiArXsP2cksKzEgbWqOcsjggRV+SYM6DzMbTQ==
X-Received: by 10.157.16.65 with SMTP id o1mr13844644oto.148.1469549463081;
	Tue, 26 Jul 2016 09:11:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Tue, 26 Jul 2016 09:10:33 -0700 (PDT)
In-Reply-To: <CAFEAcA_1-_+LmbMmZH3F7idZxfTerveUh8bQFHsUivMVP+ggqw@mail.gmail.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<5778bd2c8a0fe59682bf830c2c17ff7207b296d7.1469491920.git.alistair.francis@xilinx.com>
	<CAFEAcA_1-_+LmbMmZH3F7idZxfTerveUh8bQFHsUivMVP+ggqw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Jul 2016 09:10:33 -0700
X-Google-Sender-Auth: G-53fQ_FKoM9QalmbyOXfk0PCQA
Message-ID: <CAKmqyKOGuvjLzv0fmfg8W8_VKigEoALf68b=UQkSSDcgmUX61g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/6] cadence_gem: Add the
 num-priority-queues property
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ukxOM96BtIf

On Tue, Jul 26, 2016 at 4:47 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> The Cadence GEM hardware supports N number priority queues, this patch is a
>> step towards that by adding the property to set the queues. At the moment
>> behaviour doesn't change as we only use queue 0.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>
>> @@ -1218,7 +1220,7 @@ static void gem_realize(DeviceState *dev, Error **errp)
>>  {
>>      CadenceGEMState *s = CADENCE_GEM(dev);
>>
>> -    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
>>
>>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>
> At some point realize() needs to error-check the num-priority-queues
> property (ie check it isn't >8). Do you do that later in the series?
> (if so fine, if not, this patch is as good a place as any to put it.)

I'll add it in here.

>
>> @@ -1243,13 +1245,15 @@ static void gem_init(Object *obj)
>>  static const VMStateDescription vmstate_cadence_gem = {
>>      .name = "cadence_gem",
>>      .version_id = 2,
>> -    .minimum_version_id = 2,
>> +    .minimum_version_id = 3,
>
> You need to bump .version_id too.

Yep, I misread it and thought it was a a.b version format. I'll fix up
the other one as well.

>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

Alistair

>
> thanks
> -- PMM
>
