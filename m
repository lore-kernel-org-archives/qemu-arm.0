Received: by 10.25.21.156 with SMTP id 28csp1265928lfv;
        Mon, 25 Jul 2016 09:38:41 -0700 (PDT)
X-Received: by 10.13.206.3 with SMTP id q3mr15455275ywd.139.1469464721655;
        Mon, 25 Jul 2016 09:38:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si18390388qtd.154.2016.07.25.09.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRitt-0001wP-3S
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRito-0001w7-H6
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRitn-0006aA-1t
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:38:36 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bRitm-0006Zb-SA; Mon, 25 Jul 2016 12:38:35 -0400
Received: by mail-oi0-x244.google.com with SMTP id d204so17141524oig.3;
	Mon, 25 Jul 2016 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zIjhpmLw7Hj5EncisTqPQ/CEX7iyUKyHqGItIXHMMuI=;
	b=JZf3HtqLpqsXZ57YrOhfw9b1+rzeqSFrOubEgOK2i6eV5Mw6p+0881uTV1Dj9gBONJ
	yxO4gS3yRf2m7hyrQKha0y5TVVsIn8VqpvDuJeqRvaBKf7VAXQuqSxjusDQTGAF+IP6W
	yPoNsNmeX1/ksIceBDMDtmdlaxKLytiHKyLiNXCWHb+1mrCqvodK1gPNLT6HbVdd/U1F
	DwqtMtT8g51RQ+F0nmT7ARgOT1BRoytf8P0fIHUx9Fyi3zMsmzrz7IOPttEIn8rYVTKP
	q4nyVw0arILCGU9uYfaaePRB7GU8W8CWVpx34MYVOIXN7vDnnEgUGiBFzx07bq9pF73i
	pCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zIjhpmLw7Hj5EncisTqPQ/CEX7iyUKyHqGItIXHMMuI=;
	b=W5w/Qmz0Jhhz+SzIIUSfEGxARG1hssGuOkmaMmJnzgiWH7lz1m68DLP4MzolB4ahRP
	/5GTTcuW+FEvFqneFrGrEFRYFZROeetFNSSYc3KCqUU3hd8noi2TTtQTTEREMWHp5ZEY
	OrGbsR4f/JqOFF2wjY3fmaYjNb0wx0DM261N/VORslnl4tIpduSm3kim8efv9xCb3SlJ
	sREAExmlw/5m1NKf8oGSB3rTx8IlB+/df6nGXCWNL1yrzyeLn6d/7UzJkx3CaEg316KZ
	UN1ZJ48tmVMTwM9Asc8eg3WwCrxFMyiupaaHf89LMglTdaA/DP6WqblMfQ4IuxyShwso
	koOQ==
X-Gm-Message-State: AEkoouvX4UFC5b4Usqxm8PXYvZAYyHP4o3iILVF9pnTLVo03KJo2aJUPDo8CUzkJ0pCSkrCXsOzG6D4oTvMnYg==
X-Received: by 10.202.206.66 with SMTP id e63mr8937404oig.136.1469464714323;
	Mon, 25 Jul 2016 09:38:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Mon, 25 Jul 2016 09:38:04 -0700 (PDT)
In-Reply-To: <CAFEAcA922w7iDEorKb7aRH_V5LH8VnMGCrtiKoGa1RtKLLw5eQ@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA922w7iDEorKb7aRH_V5LH8VnMGCrtiKoGa1RtKLLw5eQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 25 Jul 2016 09:38:04 -0700
X-Google-Sender-Auth: oRUh66ZbgCuiod4FzmgC0IJODWA
Message-ID: <CAKmqyKOVDGVRaPZ6-MUuaowe60ro3c14x7hqD-BZxyQrr4X9Sw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/5] cadence_gem: QOMify
 Cadence GEM
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
X-TUID: t9FUJLE6moxT

On Mon, Jul 25, 2016 at 8:20 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  hw/net/cadence_gem.c | 27 ++++++++++++++++-----------
>>  1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index 8a4be1e..9d64644 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -1214,24 +1214,29 @@ static NetClientInfo net_gem_info = {
>>      .link_status_changed = gem_set_link,
>>  };
>>
>> -static int gem_init(SysBusDevice *sbd)
>> +static void gem_realize(DeviceState *dev, Error **errp)
>>  {
>> -    DeviceState *dev = DEVICE(sbd);
>>      CadenceGEMState *s = CADENCE_GEM(dev);
>>
>> -    DB_PRINT("\n");
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>>
>> -    gem_init_register_masks(s);
>> -    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>> -                          "enet", sizeof(s->regs));
>> -    sysbus_init_mmio(sbd, &s->iomem);
>> -    sysbus_init_irq(sbd, &s->irq);
>>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>>
>>      s->nic = qemu_new_nic(&net_gem_info, &s->conf,
>>              object_get_typename(OBJECT(dev)), dev->id, s);
>> +}
>> +
>> +static void gem_init(Object *obj)
>> +{
>> +    CadenceGEMState *s = CADENCE_GEM(obj);
>> +    DeviceState *dev = DEVICE(obj);
>> +
>> +    DB_PRINT("\n");
>>
>> -    return 0;
>> +    gem_init_register_masks(s);
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>> +                          "enet", sizeof(s->regs));
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>  }
>
> I don't understand the logic behind which things are
> in init and which in realize here -- why is
> sysbus_init_mmio() in init but sysbus_init_irq() in
> realize ?

That was just a mistake. I have moved all of the *_init_* functions to
the main init function.

Thanks,

Alistair

>
> thanks
> -- PMM
>
