Received: by 10.25.21.156 with SMTP id 28csp1273183lfv;
        Mon, 25 Jul 2016 09:55:33 -0700 (PDT)
X-Received: by 10.200.35.44 with SMTP id a41mr31673019qta.25.1469465732935;
        Mon, 25 Jul 2016 09:55:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p31si18465266qtb.49.2016.07.25.09.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRjAC-00006X-DT
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjA6-00005q-8K
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjA5-0001ln-5T
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:55:26 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjA4-0001lc-Jp
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 12:55:25 -0400
Received: by mail-vk0-x22e.google.com with SMTP id n129so206305167vke.3
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hnOQCEEAi9IQ92QHC/83i9Oi1Em/q6ptItWPbio04a0=;
	b=KsW8Qzt9Ug1BzaaCfpGmTo4IqO30GxzvG0or9es6Y50CsBIYBO/5kCzOXP8lyOWbp/
	2rhfm947S/raNX3plpdxjj4nZPt1+5rfBAC8AF1zjeMu4XFUI/1+JA/eXKlRR8VhfWq0
	dSfdjXB28fsz+xLqqctv2PNCCrkT479eFsmIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hnOQCEEAi9IQ92QHC/83i9Oi1Em/q6ptItWPbio04a0=;
	b=I1MWnFphlao2tToT3jf6unle7vrbeJVUuIoHTa/luAFEAJx+JVqQgfZngox1Xpa+N/
	PIK3oQONari8QXnbF47zpXzniFvH5yrf8VHGofTHss7pPFHHDhw0B5D+ftr12AsykA81
	TzBGs/MGJw+wqOcyX8ubSvLyRkUwuAWIEBRY/veNCrEzPv5/8yLz9Xo3BXFKmSFABTIG
	XHhU2Cq1V1mLkZD2hHpwX91mb8Emp+Y3+l3IjpPA2ux9OgPN3xLXM77kOiJiimxgtXXl
	fYb6lJl0q+jQT1hbsgmzNgAZArmB7kmO6XbsgeRLUiCr3HnNoLWWdIMeoVF7RfxyFT7o
	kJ6Q==
X-Gm-Message-State: AEkoous0ApMLY0EF3okNf8JtKoo6T4O+CMvyFHe1YMrrzKmtgpPxvstdj+SzsnuX/bwkdBPkuJtr2oY3BxlAyvPu
X-Received: by 10.176.69.180 with SMTP id u49mr8842763uau.24.1469465724009;
	Mon, 25 Jul 2016 09:55:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 09:55:04 -0700 (PDT)
In-Reply-To: <CAKmqyKNFekP+i7z5HUhyAhoWYit4zCDKG3taonOYe1n=KiayJg@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA922w7iDEorKb7aRH_V5LH8VnMGCrtiKoGa1RtKLLw5eQ@mail.gmail.com>
	<CAKmqyKOVDGVRaPZ6-MUuaowe60ro3c14x7hqD-BZxyQrr4X9Sw@mail.gmail.com>
	<CAKmqyKNFekP+i7z5HUhyAhoWYit4zCDKG3taonOYe1n=KiayJg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 17:55:04 +0100
Message-ID: <CAFEAcA_TxR5TehaTQayzRTP6LbRGADdj5wUhYuGE_e_VKyO61Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nl+DI+nlJghI

On 25 July 2016 at 17:42, Alistair Francis <alistair.francis@xilinx.com> wrote:
> On Mon, Jul 25, 2016 at 9:38 AM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Mon, Jul 25, 2016 at 8:20 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>>> ---
>>>>
>>>>  hw/net/cadence_gem.c | 27 ++++++++++++++++-----------
>>>>  1 file changed, 16 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>>> index 8a4be1e..9d64644 100644
>>>> --- a/hw/net/cadence_gem.c
>>>> +++ b/hw/net/cadence_gem.c
>>>> @@ -1214,24 +1214,29 @@ static NetClientInfo net_gem_info = {
>>>>      .link_status_changed = gem_set_link,
>>>>  };
>>>>
>>>> -static int gem_init(SysBusDevice *sbd)
>>>> +static void gem_realize(DeviceState *dev, Error **errp)
>>>>  {
>>>> -    DeviceState *dev = DEVICE(sbd);
>>>>      CadenceGEMState *s = CADENCE_GEM(dev);
>>>>
>>>> -    DB_PRINT("\n");
>>>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>>>>
>>>> -    gem_init_register_masks(s);
>>>> -    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>>>> -                          "enet", sizeof(s->regs));
>>>> -    sysbus_init_mmio(sbd, &s->iomem);
>>>> -    sysbus_init_irq(sbd, &s->irq);
>>>>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>>>>
>>>>      s->nic = qemu_new_nic(&net_gem_info, &s->conf,
>>>>              object_get_typename(OBJECT(dev)), dev->id, s);
>>>> +}
>>>> +
>>>> +static void gem_init(Object *obj)
>>>> +{
>>>> +    CadenceGEMState *s = CADENCE_GEM(obj);
>>>> +    DeviceState *dev = DEVICE(obj);
>>>> +
>>>> +    DB_PRINT("\n");
>>>>
>>>> -    return 0;
>>>> +    gem_init_register_masks(s);
>>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
>>>> +                          "enet", sizeof(s->regs));
>>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>>>>  }
>>>
>>> I don't understand the logic behind which things are
>>> in init and which in realize here -- why is
>>> sysbus_init_mmio() in init but sysbus_init_irq() in
>>> realize ?
>>
>> That was just a mistake. I have moved all of the *_init_* functions to
>> the main init function.
>
> As soon as I sent that mail I remembered why it was like that.
>
> Eventually the sysbus_init_irq() function depends on the number of
> queues, which is a property so it can't be set in the init.
>
> Do you think the sysbus_init_mmio() should be moved to the realise as well then?

Oh, I see. This is fine, then, but put a note in the commit message
about why the sysbus_init_irq() is where it is.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
