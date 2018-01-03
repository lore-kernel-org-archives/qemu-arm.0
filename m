Received: by 10.223.134.117 with SMTP id 50csp12293133wrw;
        Wed, 3 Jan 2018 11:37:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBouj1sbmeAUn5Cn2Sm/RvX5iUHEoA8BS1viFgnE1x6HxAWwMLZ/Ek8nvV4sJfOksXdsoYr63
X-Received: by 10.13.252.71 with SMTP id m68mr2289418ywf.293.1515008253094;
        Wed, 03 Jan 2018 11:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515008253; cv=none;
        d=google.com; s=arc-20160816;
        b=el/NRq1mgJ/KByWzdLoKr/5xpKHW/s8EW/DJ/fsfo8bdYiKvOhCttLMoCXPJABUmVQ
         bLAf0b2WxqBQaqR7Pfd+A68xLnH57v1s+6WXp6e/c+q+iJ49iAhrrumxfbF5i8hZe+dN
         pkFMBNB+HjMte/2QC1EgpeGE6vs18OynibA588P+KJR3/JEMt14UHlJ1rN+Ml9+mZaNE
         F6RAPGqTvNM8Ej55Z1C2b27RcGD1ZkamyHH9xSbt8/TunQJEExfJI+rsCk/0dtIKlvkI
         g2Jpc3P3CpBY3ZOXV9Qq/K8RrXR9sPBqHFqjlHIo349/PQ00iA1xWVkipCUMcKqEGGB0
         sYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DPkMeSJ8y5qoHRRKFGhLZnoP3ZDZo9Fowmq4C/P9vmI=;
        b=vjlnu1shmk50aYOPTJ6PdFYL014HiZtKBSdV+eQxKVbrNPCYxXwZYHpft172WL3HoA
         SBhrMKD/Mx3x/TAM/s3psmX4/E2MrBoid862f6wWX2UWaJ42ica2ieL5Z35wUJRUpLUM
         0/QYcWp6zYUd2s0ZCN+DORUUZ0YbxjzWJMUVcTXIrpg8aGeopaV0T7+A8eYGfO3CCzgG
         WdqR+YVRo8fmMR2Ckn+x8R370EuK0FhRxcdhG+a4KNvTu2sbHsagDIDTcIkDvBWUEy65
         5QdqX+DzqCj+gDomaK9ph87IIA8NhOcdC07mk8PWJu6oKzGnMPmjbaetjiq6JZRRpciZ
         cg+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=byXIRG9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j84si360656ybc.261.2018.01.03.11.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 11:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=byXIRG9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWoqy-0005BQ-HB
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 14:37:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWoqp-00059v-N3
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 14:37:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWoqo-0003VQ-Gy
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 14:37:23 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eWoql-0003R9-SH; Wed, 03 Jan 2018 14:37:20 -0500
Received: by mail-wm0-x241.google.com with SMTP id y82so21406154wmg.1;
	Wed, 03 Jan 2018 11:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=DPkMeSJ8y5qoHRRKFGhLZnoP3ZDZo9Fowmq4C/P9vmI=;
	b=byXIRG9Q6IntbKyDd6Pbfb+AOtMq1FDup152kuRlf8zuSXS/VHnndmvJEDaiUwI8dv
	vr3pE/os/mrtmJHIh+7M5mUPeQrSO1LmPK4w+kdTZDBFnDz9GZejaLPKImXGl617yk28
	CrKadWohDFDYXH/ESlscblGyYJEO+gFwpBAPs3bw6rRb2kvsn80FE9lTQ8W10xswrTuF
	HXhvuguxLr9XDdlpHCG5Kecrq9vnyvVlHfQOWigR2/0Aaw3xfuwLU4u0kJOcH7lV2wMk
	gO14MMebn4M+DMpyV3VJ/VypPphb3D3VtqprKPjBKiyWRjMwdhE2Asr+VNG5+Tt4zlbn
	xSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=DPkMeSJ8y5qoHRRKFGhLZnoP3ZDZo9Fowmq4C/P9vmI=;
	b=DO8DnM8oxTofLw8KcyblP37Mdl+rdOxa8rPHxZUVjRhgNLB0FCefugqblH7LgtVMmb
	2awG3OGL3uteTAnBBtEq413EbrXDMBplQYXDk6B7fI7hu8ZyLKb9c1A6hcFZSAXPHfxy
	/ySOHcZO2BA92jZ+xZyzRqlq4e66fB+6+/EJmmEwhVlvVYbCQDYUlv2izyNh87ytbG+K
	SuaaeDzAkGbLUngbFJ4IpV50X71iNHhRydPnCVfB6KIrWQpCu3iGLM2EV9qmAsk5U3cl
	YV3/AOPCPWAoQqjNXvb8GdfibNtJy3YcSV5vh7+VYxpAxYdmZ8SsFeJ82UlWcOhv1pdj
	G4PA==
X-Gm-Message-State: AKGB3mItYzgzhWPCdh8pIuG1ZAtfy+n27Xq3HhSHsDMrXSCrJhyuNYm4
	yldBk7Qy1UegWbjzedzT2weS0vYm7MgOsIjMS3w=
X-Received: by 10.28.136.66 with SMTP id k63mr2337850wmd.50.1515008237974;
	Wed, 03 Jan 2018 11:37:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Wed, 3 Jan 2018 11:36:47 -0800 (PST)
In-Reply-To: <f261cae0-9026-9ef0-65c5-fb24076564d8@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-5-f4bug@amsat.org>
	<CAKmqyKM-Ar=Ld=6KBvJ1D1T0z2wPhvFR52tvKXKp=SEWoFJ=XQ@mail.gmail.com>
	<f261cae0-9026-9ef0-65c5-fb24076564d8@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jan 2018 11:36:47 -0800
X-Google-Sender-Auth: ow10Jd1cD38rg-O-Hs7pM-DyRcI
Message-ID: <CAKmqyKNmr8WcQ1X3aWe4rhRQxwtz68Pm1RicqPdT=2PEqnmnXw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/20] sdhci: refactor same
 sysbus/pci properties into a common one
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Xiaoqiang Zhao <zxq_yx_007@163.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NlpfWOHAibl1

On Fri, Dec 29, 2017 at 9:21 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Alistair,
>
> On 12/18/2017 10:13 PM, Alistair Francis wrote:
>> On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
>>> add sysbus/pci/sdbus separator comments to keep it clearer
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> I'm still unsure about this. Won't this leave us with properties that
>> have no impact on the device? That seems very confusing to me.
>
> (from previous series)
>> [...] but aren't we now going to
>> have device properties that aren't actually connected to anything?
>
> I'm also confused :)
>
> My understanding is the "pending-insert-quirk" worries you.

Exactly, my worry is having properties that aren't connected. As a
user I expect that if I set a property that will have some effect on
how QEMU runs. A un-connected property is just confusing.

> This property is dependent of the HCI IP, so regardless the HCI is
> accessed through a MMIO sysbus or a PCI bus the quirk might exists (for
> this property, only the BCM implementation).

So it has always been configuration dependent?

Alistair

>
> With v3 series applied, the monitor 'qtree' output is:
>
> $ qemu-system-aarch64 -M xlnx-zcu102 -monitor stdio -S
> (qemu) info qtree
>   dev: generic-sdhci, id ""
>     gpio-out "sysbus-irq" 1
>     sd-spec-version =3D 3 (0x3)
>     timeout-freq =3D 0 (0x0)
>     freq-in-mhz =3D true
>     clock-freq =3D 0 (0x0)
>     max-block-length =3D 512 (0x200)
>     dma =3D true
>     sdma =3D true
>     adma1 =3D false
>     adma2 =3D true
>     suspend =3D true
>     high-speed =3D true
>     3v3 =3D true
>     3v0 =3D false
>     1v8 =3D true
>     64bit =3D true
>     slot-type =3D 0 (0x0)
>     bus-speed =3D 7 (0x7)
>     driver-strength =3D 7 (0x7)
>     maxcurr =3D 0 (0x0)
>     pending-insert-quirk =3D false
>     dma-memory =3D ""
>     mmio 00000000ff170000/0000000000000100
>     bus: sd-bus
>       type sdhci-bus
>       dev: sd-card, id ""
>         drive =3D ""
>         spi =3D false
>
> Are you worried about this output?
>
>>> ---
>>>  hw/sd/sdhci.c | 21 ++++++++++-----------
>>>  1 file changed, 10 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>>> index 2823da00da..dbdfd54350 100644
>>> --- a/hw/sd/sdhci.c
>>> +++ b/hw/sd/sdhci.c
>>> @@ -1265,13 +1265,17 @@ const VMStateDescription sdhci_vmstate =3D {
>>>
>>>  /* Capabilities registers provide information on supported features of=
 this
>>>   * specific host controller implementation */
>>> -static Property sdhci_pci_properties[] =3D {
>>> +static Property sdhci_properties[] =3D {
>>>      DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>>>              SDHC_CAPAB_REG_DEFAULT),
>>>      DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
>>> +    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_inser=
t_quirk,
>>> +                     false),
>>>      DEFINE_PROP_END_OF_LIST(),
>>>  };
>>>
>>> +/* --- qdev PCI --- */
>>> +
>>>  static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
>>>  {
>>>      SDHCIState *s =3D PCI_SDHCI(dev);
>>> @@ -1304,7 +1308,7 @@ static void sdhci_pci_class_init(ObjectClass *kla=
ss, void *data)
>>>      k->class_id =3D PCI_CLASS_SYSTEM_SDHCI;
>>>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>>      dc->vmsd =3D &sdhci_vmstate;
>>> -    dc->props =3D sdhci_pci_properties;
>>> +    dc->props =3D sdhci_properties;
>>>      dc->reset =3D sdhci_poweron_reset;
>>>  }
>>>
>>> @@ -1319,14 +1323,7 @@ static const TypeInfo sdhci_pci_info =3D {
>>>      },
>>>  };
>>>
>>> -static Property sdhci_sysbus_properties[] =3D {
>>> -    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>>> -            SDHC_CAPAB_REG_DEFAULT),
>>> -    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
>>> -    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_inser=
t_quirk,
>>> -                     false),
>>> -    DEFINE_PROP_END_OF_LIST(),
>>> -};
>>> +/* --- qdev SysBus --- */
>>>
>>>  static void sdhci_sysbus_init(Object *obj)
>>>  {
>>> @@ -1359,7 +1356,7 @@ static void sdhci_sysbus_class_init(ObjectClass *=
klass, void *data)
>>>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>>>
>>>      dc->vmsd =3D &sdhci_vmstate;
>>> -    dc->props =3D sdhci_sysbus_properties;
>>> +    dc->props =3D sdhci_properties;
>>>      dc->realize =3D sdhci_sysbus_realize;
>>>      dc->reset =3D sdhci_poweron_reset;
>>>  }
>>> @@ -1373,6 +1370,8 @@ static const TypeInfo sdhci_sysbus_info =3D {
>>>      .class_init =3D sdhci_sysbus_class_init,
>>>  };
>>>
>>> +/* --- qdev bus master --- */
>>> +
>>>  static void sdhci_bus_class_init(ObjectClass *klass, void *data)
>>>  {
>>>      SDBusClass *sbc =3D SD_BUS_CLASS(klass);
>>> --
>>> 2.15.1
>>>
>>>
>
