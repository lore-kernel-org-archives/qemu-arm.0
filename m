Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1852841wru;
        Thu, 2 Aug 2018 04:08:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeNu6lELv66OX9ov2vDsbkHO5XtdizkhxXXA9RxqjGp3iw+CxRIOdFFfXQTZTWYFiRL9PUS
X-Received: by 2002:a37:9f90:: with SMTP id i138-v6mr1900739qke.113.1533208129435;
        Thu, 02 Aug 2018 04:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533208129; cv=none;
        d=google.com; s=arc-20160816;
        b=fE7Dy3fU33REKdsCyogQr5sET8jJPI6FCCBuwsn9d1FLoEqyrxrwkUmOOTn+KdnEQm
         MrSrtnkHKwxP6LNHunJ4IQHva5UekvtRc8Mo/+MNyh0rMBDDt1MwcDTD7FmtFVrdfgPA
         xpafiFVK6P5omFhlpquMdT2bTGKUMKfjY77wohshaM1QOT5L6VPjy5s9y+nE/2YLsrqJ
         EkeW62pWshmAmG6UuDvQ06Wb16eF5vRWSTh6lstFPdY2++KmaY50qHf9t+uyKNtF3Jr8
         I2mrHtRfrsXtYjUssZcHfRvPfVHsFfQdY2eAkDCDu6TZSl0u7C1U1tyjwUzeyIzysh5E
         cJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=qbCWMPTDgkbA/G47fCa7OYKVE0b4NH/1K8YoWtoKptI=;
        b=FNWv0M0Te7y2U1i4e2Mt4wL2BFb37XJJWYrLQbViuxjbTkkDV2ps15hfeIkybe8qE2
         3lxjyTcUAVO9zzZsa/Sr1CDKGqh/NePRZ0NE2pdrPN8yIjgpJwvUEXbzO6VpYLNp+ook
         L8ek64QBFdG1oeJZfvAYpCz+ZQYBnOiEe2l0MMqezvRXB1CRN6NceC4kk3EPk1oHL5UX
         XU+hAddt6p89gU76AmJvgS7SNezepztg2nYyIJHbRaYGxKYhQVDtiAP+i7NaxFjPh+Vn
         fTgzYsCOQW0FLb/M3TmE+fZvlEEXdFCrEwC8CjzY6otmwp8rj02bROpdB7fcaqhf1FRx
         Ormg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=V5IPe5I0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Kn7dpBHt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Kn7dpBHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s21-v6si1200011qke.62.2018.08.02.04.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 04:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=V5IPe5I0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Kn7dpBHt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Kn7dpBHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flBTM-0000v5-Va
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 07:08:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1flBRy-0000Hi-PW
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 07:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1flBRt-0001uu-R3
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 07:07:22 -0400
Received: from greensocs.com ([193.104.36.180]:54221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1flBRt-0001sq-DC; Thu, 02 Aug 2018 07:07:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BAA11DFFFF;
	Thu,  2 Aug 2018 13:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1533208026;
	bh=HhlB0wMO3hsGRAFD3noO/10DiCaNjZDJV/vktnHbU54=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=V5IPe5I08dQ7mcl2d18pA6d8dTuF9GvU3lap6ZlhSscPagE9FZrkRX6IocdfYrr/N
	rylMWfAgl+Bd3GSbWiDYCkuTKfCdc1g4xHe6TByQdQu6mcwn52TmNyGj0tnV3J43eS
	IPXizmxiN/T0F7acg2BIVp6l1jlebKTKvpqw9TdM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Kn7dpBHt;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Kn7dpBHt
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4-nQuI888up; Thu,  2 Aug 2018 13:07:06 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E2F97DFFFA; Thu,  2 Aug 2018 13:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1533208025;
	bh=HhlB0wMO3hsGRAFD3noO/10DiCaNjZDJV/vktnHbU54=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Kn7dpBHtzGWqZfI6AsKp3GNIwHvXb4dpbqdMg6VN+YwS1jJM0L2pnB0VPZ1Nouciu
	UZ3F72wIhWjsFYrUkVj8CEEBiSDiwGl/aLYBAUWlsup/sXzZCW3IQUq2nWWw/4yf0J
	r6Vi/zBp8LPzqOaeaUYj48f1pmw+IninjDHNx37U=
Received: from [192.168.1.12] (LFbn-1-9447-246.w86-237.abo.wanadoo.fr
	[86.237.76.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 63F9CDFFF8;
	Thu,  2 Aug 2018 13:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1533208025;
	bh=HhlB0wMO3hsGRAFD3noO/10DiCaNjZDJV/vktnHbU54=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Kn7dpBHtzGWqZfI6AsKp3GNIwHvXb4dpbqdMg6VN+YwS1jJM0L2pnB0VPZ1Nouciu
	UZ3F72wIhWjsFYrUkVj8CEEBiSDiwGl/aLYBAUWlsup/sXzZCW3IQUq2nWWw/4yf0J
	r6Vi/zBp8LPzqOaeaUYj48f1pmw+IninjDHNx37U=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<2b92ae960dfc47149945c9e47f90b4433d8eee35.1532701430.git.damien.hedde@greensocs.com>
	<155529c9-2847-0f30-9277-6b2c8bb31b78@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <4210d2d7-1ad5-ccc6-d2ab-1a633e1f12e4@greensocs.com>
Date: Thu, 2 Aug 2018 13:07:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <155529c9-2847-0f30-9277-6b2c8bb31b78@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 2/6] qdev: add power/clock
 gating control on bus tree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bHJfYiw9Sd8i

Hi,

On 07/27/2018 06:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Damien,
>=20
> On 07/27/2018 11:37 AM, Damien Hedde wrote:
>> Add functions [qdev|qbus]_set_[power|clock]_all(_fn).
>> Theses allow to control power and clock gating along a bus hierarchy.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  include/hw/qdev-core.h | 20 +++++++++++++++++
>>  hw/core/qdev.c         | 51 +++++++++++++++++++++++++++++++++++++++++=
+
>>  2 files changed, 71 insertions(+)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 659287e185..607c367738 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -464,4 +464,24 @@ void device_set_power(DeviceState *dev, bool en);
>>   */
>>  void device_set_clock(DeviceState *dev, bool en);
>> =20
>> +/**
>> + * qdev/qbus_set_power_all(_fn)
>> + * Enable/Disable the power of a tree starting
>> + * at given device or bus
>> + */
>> +void qdev_set_power_all(DeviceState *dev, bool en);
>> +void qdev_set_power_all_fn(void *opaque, bool en);
>> +void qbus_set_power_all(BusState *bus, bool en);
>> +void qbus_set_power_all_fn(void *opaque, bool en);
>=20
> I think we don't need the _fn() functions, most of the current codebase
> directly use DEVICE(x) or BUS(x) to casts.

Ok, I will remove them.

>=20
>> +
>> +/**
>> + * qdev/qbus_set_clock_all(_fn)
>> + * Enable/Disable the clock of a tree starting
>> + * at given device or bus
>> + */
>> +void qdev_set_clock_all(DeviceState *dev, bool en);
>> +void qdev_set_clock_all_fn(void *opaque, bool en);
>> +void qbus_set_clock_all(BusState *bus, bool en);
>> +void qbus_set_clock_all_fn(void *opaque, bool en);
>> +
>>  #endif
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index bb6d36eab9..24b90bd45f 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -1138,6 +1138,57 @@ void device_set_clock(DeviceState *dev, bool en=
)
>>      }
>>  }
>> =20
>> +static int qdev_set_power_one(DeviceState *dev, void *opaque)
>> +{
>> +    device_set_power(dev, *((bool *)opaque));
>> +    return 0;
>> +}
>> +
>> +void qdev_set_power_all(DeviceState *dev, bool en)
>> +{
>> +    qdev_walk_children(dev, NULL, NULL, qdev_set_power_one, NULL, &en=
);
>> +}
>> +
>> +void qdev_set_power_all_fn(void *opaque, bool en)
>> +{
>> +    qdev_set_power_all(DEVICE(opaque), en);
>> +}
>> +
>> +void qbus_set_power_all(BusState *bus, bool en)
>> +{
>> +    qbus_walk_children(bus, NULL, NULL, qdev_set_power_one, NULL, &en=
);
>> +}
>> +
>> +void qbus_set_power_all_fn(void *opaque, bool en)
>> +{
>> +    qbus_set_power_all(BUS(opaque), en);
>> +}
>> +
>> +static int qdev_set_clock_one(DeviceState *dev, void *opaque)
>> +{
>> +    device_set_clock(dev, *((bool *)opaque));
>> +    return 0;
>> +}
>> +
>> +void qdev_set_clock_all(DeviceState *dev, bool en)
>> +{
>> +    qdev_walk_children(dev, NULL, NULL, qdev_set_clock_one, NULL, &en=
);
>> +}
>> +
>> +void qdev_set_clock_all_fn(void *opaque, bool en)
>> +{
>> +    qdev_set_clock_all(DEVICE(opaque), en);
>> +}
>> +
>> +void qbus_set_clock_all(BusState *bus, bool en)
>> +{
>> +    qbus_walk_children(bus, NULL, NULL, qdev_set_clock_one, NULL, &en=
);
>> +}
>> +
>> +void qbus_set_clock_all_fn(void *opaque, bool en)
>> +{
>> +    qbus_set_clock_all(BUS(opaque), en);
>> +}
>> =20
>>  Object *qdev_get_machine(void)
>>  {
>>
>=20
