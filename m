Received: by 10.25.21.156 with SMTP id 28csp1267998lfv;
        Mon, 25 Jul 2016 09:43:26 -0700 (PDT)
X-Received: by 10.13.194.3 with SMTP id e3mr16121138ywd.50.1469465006511;
        Mon, 25 Jul 2016 09:43:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p28si18436655qte.44.2016.07.25.09.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiyU-00052N-0F
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:43:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRiyP-00050w-2l
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRiyN-0007TI-5F
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:43:20 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bRiyN-0007TE-0W; Mon, 25 Jul 2016 12:43:19 -0400
Received: by mail-oi0-x244.google.com with SMTP id d204so17153666oig.3;
	Mon, 25 Jul 2016 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=XJAABGJbc6TAQQJPuzTChwdYGrnzoZd72/cbmJ14Bw4=;
	b=GWtUpdSxplNlXMT50W5U6g+ywwIJXnPCIXwUudObRDhraODpJNLSTpgPSUTlRSf+Qn
	UPe/rB6cmSwASEZ1M6kAsBnzUnFcwnF31VffQVMAMxl+actDw0zrrO+oueTywP+qujZ7
	nAryWjFHQIa+76//PoZK/MbZS4UfzcMhM3At7eYRts1FNeSq7k6ACZQCDuC1sP7GsTsW
	9KGZ0dxVd/WEPYEBQM0hjHq9sjrdN+95sgIEVaRrJ6exl1YCcvy8rqeTsbmyjnm3w/A1
	AY+C8YHgSYT4xD13COFd4AT2lo3Ag8hmMim0bLTyLCJTfd3WdBedwVeuKOU9JEB4yfyM
	FFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=XJAABGJbc6TAQQJPuzTChwdYGrnzoZd72/cbmJ14Bw4=;
	b=dCSZdMB65jMzDKEv0mBffyHZqGrtaZgQsrGCFmPEfoDUSN4XEyBXqZ/too9/9dUbxB
	+Or1gzBeVRuN/QCLTzdQWfvzWewY0biE9IWVMW0eqQ4x1J2akJzQ6EAkoI3J3lCR57fH
	YQEUzTwpGYK6bp8DYtSK5wfs+cBayuQQdko6pKCdwMaQVhGJvgHaSPaXkWH/Yo47AOPp
	OeOq7BdVriq2dGWM2al++NuEcHA0O+5SDqpK3yyCmoBWjotl3Cdkv9kdag8cUUYtDvxh
	vefHd7criE1yhLWZHGnaO1WJCrYY7znrWkeJ/9A9lYEuFVaz4j+wWNFRR9vqywpF7Kqb
	tXZw==
X-Gm-Message-State: AEkoouuHOHH0mp83/alKV3hDPusLH7lo1WBhGxipj1fPdX2qvQ5yL28ssTueI8zj5wKrqOD1BqiJQVu8Q4vIFw==
X-Received: by 10.157.29.7 with SMTP id m7mr11025318otm.194.1469464998423;
	Mon, 25 Jul 2016 09:43:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Mon, 25 Jul 2016 09:42:48 -0700 (PDT)
In-Reply-To: <CAKmqyKOVDGVRaPZ6-MUuaowe60ro3c14x7hqD-BZxyQrr4X9Sw@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA922w7iDEorKb7aRH_V5LH8VnMGCrtiKoGa1RtKLLw5eQ@mail.gmail.com>
	<CAKmqyKOVDGVRaPZ6-MUuaowe60ro3c14x7hqD-BZxyQrr4X9Sw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 25 Jul 2016 09:42:48 -0700
X-Google-Sender-Auth: T_8HaneeNH6Mncbiyx1IeYmmfF4
Message-ID: <CAKmqyKNFekP+i7z5HUhyAhoWYit4zCDKG3taonOYe1n=KiayJg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wk6K+Nbautnu

On Mon, Jul 25, 2016 at 9:38 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Mon, Jul 25, 2016 at 8:20 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>
>>>  hw/net/cadence_gem.c | 27 ++++++++++++++++-----------
>>>  1 file changed, 16 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>> index 8a4be1e..9d64644 100644
>>> --- a/hw/net/cadence_gem.c
>>> +++ b/hw/net/cadence_gem.c
>>> @@ -1214,24 +1214,29 @@ static NetClientInfo net_gem_info = {
>>>      .link_status_changed = gem_set_link,
>>>  };
>>>
>>> -static int gem_init(SysBusDevice *sbd)
>>> +static void gem_realize(DeviceState *dev, Error **errp)
>>>  {
>>> -    DeviceState *dev = DEVICE(sbd);
>>>      CadenceGEMState *s = CADENCE_GEM(dev);
>>>
>>> -    DB_PRINT("\n");
>>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>>>
>>> -    gem_init_register_masks(s);
>>> -    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>>> -                          "enet", sizeof(s->regs));
>>> -    sysbus_init_mmio(sbd, &s->iomem);
>>> -    sysbus_init_irq(sbd, &s->irq);
>>>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>>>
>>>      s->nic = qemu_new_nic(&net_gem_info, &s->conf,
>>>              object_get_typename(OBJECT(dev)), dev->id, s);
>>> +}
>>> +
>>> +static void gem_init(Object *obj)
>>> +{
>>> +    CadenceGEMState *s = CADENCE_GEM(obj);
>>> +    DeviceState *dev = DEVICE(obj);
>>> +
>>> +    DB_PRINT("\n");
>>>
>>> -    return 0;
>>> +    gem_init_register_masks(s);
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>>> +                          "enet", sizeof(s->regs));
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>>  }
>>
>> I don't understand the logic behind which things are
>> in init and which in realize here -- why is
>> sysbus_init_mmio() in init but sysbus_init_irq() in
>> realize ?
>
> That was just a mistake. I have moved all of the *_init_* functions to
> the main init function.

As soon as I sent that mail I remembered why it was like that.

Eventually the sysbus_init_irq() function depends on the number of
queues, which is a property so it can't be set in the init.

Do you think the sysbus_init_mmio() should be moved to the realise as well then?

Thanks,

Alistair

>
> Thanks,
>
> Alistair
>
>>
>> thanks
>> -- PMM
>>
