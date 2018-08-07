Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4447202wru;
        Tue, 7 Aug 2018 10:21:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfAap+1RDgA0XzqGlCXbPIA1t6rRN0yxmk96kUroy3vD5lOTcEoFG3ucxqMyJvJUfw9a7KL
X-Received: by 2002:ac8:5289:: with SMTP id s9-v6mr18807152qtn.311.1533662510586;
        Tue, 07 Aug 2018 10:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533662510; cv=none;
        d=google.com; s=arc-20160816;
        b=VeXayTn0/c6UGk/HtHwAoA2Rfjzc5JvSWxMaRjLCZRt5CcijLP18n8bro+kOz83kva
         VR+gjAUxI1vkHkmlW76qDSp4q/NPuE4rh/QJfKCC3+iZu59lllrBqpmuN8qfj46PpCsP
         Uv9PkVKXuE9qC/7uKphha1EOqvccp4OqdlsKD43JDEoYfFl2Gep67PkT/Z15Yxx/PFSN
         8V+7OPS84da7MrLQGvFDRuCu1+oErqB496iHgvt/5mVFSQc93TSnxkWWEqyomu9H4VUn
         ha0Pys0XC2aj3er4JVmyEjDEuwQTdzP/PesietQEEvRB+vtLTP2zLswmf3Kvz0eu7lHQ
         XQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=uaPM43ZLLgMj1GsuwpGOa8nriYf8jOV2i52VvxGhhqM=;
        b=Jw7Hw9H8ZPEPHBRjllhflIdeyvnea2AznFjiEKwowMCPg4oXY0KcbMI28muo1P7Nkn
         wn+SvaVjqP2O41O+DHj2K/6RFUcuSRK2MynQWh+YuCas1rtpIwQyLhE2ZXMCe/R4KKAD
         oqR36x2T5hHDi0++yN3zu/PoJPZCvC+W6ynYh6UQRELqxoPQnKULzjkH0NEqBcww1YWT
         b8kyHHeP/G1S6eWpbHn65EDgl3zSCRtwsLYaLXd5nOZg8AoVXZps0TOoDDmf3bYLVCYu
         tAlVX9O4+ubQErRcS1u7HDwArr7PYQ7jcXj0O2j7EKdMyz/9fMB3dr6Z3myGitZ8KUI5
         vT+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51-v6si1797067qvv.164.2018.08.07.10.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 10:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn5g6-0001Gw-2E
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 13:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn5fn-0001CO-E2
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 13:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn5fk-0002ov-6q
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 13:21:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50064 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn5fj-0002o6-Vy; Tue, 07 Aug 2018 13:21:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26A354021FC2;
	Tue,  7 Aug 2018 17:21:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B06BD2026D66;
	Tue,  7 Aug 2018 17:21:17 +0000 (UTC)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-5-geert+renesas@glider.be>
	<e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
	<CAMuHMdUuHcoZxFVFivBwD3LveeE8yQ+AnaWFr76kATG+rCzd=w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9305142a-8b88-8beb-dd95-02dd84881aa8@redhat.com>
Date: Tue, 7 Aug 2018 19:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUuHcoZxFVFivBwD3LveeE8yQ+AnaWFr76kATG+rCzd=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 07 Aug 2018 17:21:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 07 Aug 2018 17:21:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/4] hw/arm/sysbus-fdt: Add
 support for instantiating generic devices
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ysrNrNl+J3AF

Hi Geert,

On 08/07/2018 05:32 PM, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Tue, Aug 7, 2018 at 4:19 PM Auger Eric <eric.auger@redhat.com> wrote:
>> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
>>> Add a fallback for instantiating generic devices without a type-specific
>>> or compatible-specific instantation method.  This will be used when no
>>> other match is found.
>>>
>>> The generic instantation method creates a device node with "reg" and
>>> (optional) "interrupts" properties, and copies the "compatible"
>>> property and other optional properties from the host.
>>> For now the following optional properties are copied, if found:
>>>   - "#gpio-cells",
>>>   - "gpio-controller",
>>>   - "#interrupt-cells",
>>>   - "interrupt-controller",
>>>   - "interrupt-names".
>>>
>>> More can be added when needed.
>>>
>>> This avoids having to write device-specific instantation methods for
>> instantiation
> 
> Thanks, will fix.
> 
>>> each and every "simple" device using only a set of generic properties.
>>> Devices that need more specialized handling can still provide their
>>> own instantation method.
> 
> Arghl, one more.
> 
>>> --- a/hw/arm/sysbus-fdt.c
>>> +++ b/hw/arm/sysbus-fdt.c
>>> @@ -415,6 +415,99 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>>>      return 0;
>>>  }
>>>
>>> +static HostProperty generic_copied_properties[] = {
>>> +    {"compatible", false},
>>> +    {"#gpio-cells", true},
>>> +    {"gpio-controller", true},
>>> +    {"#interrupt-cells", true},
>>> +    {"interrupt-controller", true},
>>> +    {"interrupt-names", true},
>>
>> I think we would need to enumerate the other source properties which
>> were not copied to the guest fdt and either warn the userspace those
>> were omitted or fail. We may end up generating an incomplete guest dt
>> node that may not work properly.
> 
> The list above is quite generic, so it is expected that some of the optional
> properties (marked "true") cannot be copied. Hence warning about them
> will be noisy, and confuse users.  Failing is definitely the wrong thing
> to do.
I was not talking about those listed here and optional. Those ones are
taken care of. I was rather talking about potential other ones, present
on host side and not copied on guest side. For instance, let's say your
host dt node has a clocks property. You will attempt to create a guest
dt node without this property and obviously the device will not work
properly on guest side. The end user attempting this assignment does not
get any warning on guest launch. Maybe the driver on guest side will be
cool enough to issue a warning but we cannot really rely on this
assumption. So from a maintenance point of view, it looks not
manageable. I think we should checl all props found in the host dt node
are considered and copied into the guest node. Otherwise this means the
host dt node does not belong to the category of a "simple" one and thus
cannot use this creation function.
> 
> If the host lacks a property that is mandatory for a specific device, the
> device won't have worked on the host before neither, right?
> 
> The major issue remains that an incomplete guest DT node may be generated
> if the list above lacks certain needed properties, or if subnodes are
> needed.
> I expect the guest OS driver would complain about the missing parts, though.
> In that case, either the list should be extended, or a device-specific
> instantiation method should be written.
> 
>>> +/**
>>> + * add_generic_fdt_node
>>> + *
>>> + * Generates a generic DT node by copying properties from the host
>>> + */
>>> +static int add_generic_fdt_node(SysBusDevice *sbdev, void *opaque)
>>> +{
> 
>>> +    /* Copy interrupts (remapped) */
>>> +    if (vbasedev->num_irqs) {
>>> +        irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
>>> +        for (i = 0; i < vbasedev->num_irqs; i++) {
>>> +            irq_number = platform_bus_get_irqn(pbus, sbdev , i)
>>> +                             + data->irq_start;
>>> +            irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
>>> +            irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
>>> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>>
>> I think this part is not generic enough. How can you assume the IRQs are
>> level or edge? Can't you copy the source interrupt properties and just
>> overwrite the IRQ number?
> 
> I have to check that. I wouldn't be surprised if the virtualized GIC supports
> only a subset of all possible flags and/or remaps interrupt types too.
> 
> I see the AMD XGBE driver looks at VFIO_IRQ_INFO_AUTOMASKED to choose
> between GIC_FDT_IRQ_FLAGS_LEVEL_HI and GIC_FDT_IRQ_FLAGS_EDGE_LO_HI.
> The VFIO_IRQ_INFO_* don't seem to provide more details.
Yep it tells you whether this is edge or level. That's why I initially
suggested to keep the copied values for the type.

Thanks

Eric
> There are also no users of GIC_FDT_IRQ_FLAGS_LEVEL_LO and
> GIC_FDT_IRQ_FLAGS_EDGE_HI_LO in the Qemu sources...
> 
> So probably following the AMD XGBE example is the way forward?
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
