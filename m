Received: by 10.28.4.212 with SMTP id 203csp2899508wme;
        Mon, 16 Apr 2018 10:26:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/EPMDVMb3JgV6oAq7DYbdrzeitjxnKnvibBoef+ntmHbtYY2qfz0DBbQghnIF/W9jWoX3o
X-Received: by 10.55.157.139 with SMTP id g133mr5732467qke.57.1523899618298;
        Mon, 16 Apr 2018 10:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523899618; cv=none;
        d=google.com; s=arc-20160816;
        b=MGL5u9z4kKJDFNJIxEdLq//eqk/VNpv95mGCiz6+j4FOyqXbyUbwp5d5tx9P0xvXUp
         XO7NSKESrNSuVW3yQ/pG6PYc4qAHHKQHrTliNT95TsDRY94R47OOeYnqlXpF/A+/iHnb
         5r7cL4t87Zoc0K4+REAUytMwLjmvYhTTQOHlOPOFlNP5REvLQnoaNbeUSVBGE11jyOrv
         1XtoRAY0Zx4fCMhAk7LJBB7a9spu/CvQGLBYTlB8WOAVnq8Q/HN7B7cbEkjDRaOyASeF
         bfBrLxeBQaQZ56O5hEPUX19w5QjEXDmXCFs1yI0rva/bMnRoMEJcf92abpaepVhGX+2k
         Bjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fCeN3rIUmzi1eE1SXKsm9vwaJaSqxV4eS2vUA8MiZSY=;
        b=uF8WlkyFvpZoM09hFxkvVAdqI1U2Gz2acD79bPX1rs2UJUiQZ4Uj8J+3rz+XAx0aeh
         l1OmIC5+XWTRRj5//YvHmGk5Wxi1RbsjjutYzEXCd6yNY45HPr12rDieQDH2YEx6PwsQ
         9jVcULF7au2cgFwDxeJYIdWbW56EwirkyTK6p2NOyQu0kpXq0HXOPy+/lV7AqsfICqAe
         U7b+7DhNckdvKczXjicFPkbYoYRE8olxJzTr66i0971ohJqhq21SYVJFo9gRNFmS/sl5
         u/hGVOkwnpoqLXW3W01P/qrftIDzutmbr+wZV45i4NO7kUgCybr9JlOyDR8MSqXUEAGS
         K4QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YepTAUP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f74si657437qke.204.2018.04.16.10.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 10:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YepTAUP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87u5-0003YQ-OJ
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 13:26:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87tH-0003G3-KS
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 13:26:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87tG-0008LV-FQ
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 13:26:07 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:36387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87tG-0008KZ-6a
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 13:26:06 -0400
Received: by mail-ot0-x231.google.com with SMTP id p2-v6so1454246otf.3
	for <qemu-devel@nongnu.org>; Mon, 16 Apr 2018 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fCeN3rIUmzi1eE1SXKsm9vwaJaSqxV4eS2vUA8MiZSY=;
	b=YepTAUP7JuHpR8MYBPZpNae+TlU/zQobz8RXkmvgR5N95zRjtfg/UwoSZUx9V5bFvj
	7PPoKjD+wWrv5jR83Cb5p7ZSc67GIZy4ITR72T0bHK2mg2GwFopqTsma2Xzgr54cZi01
	U7q41dQwiZxmlcBUiXAORqMlHD9XmCR47mfLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fCeN3rIUmzi1eE1SXKsm9vwaJaSqxV4eS2vUA8MiZSY=;
	b=fUFw0/o/4Bs7z1BdBGGIi5BZHv+BkCYK469E/uDCPjVDaEXyqlqsdTv/T89pmr9Brk
	aUTkkpQrdU/30S7N0ZLszjQK6xkt/ogobPVWYEpQsYDFgPKogi5B/BUNJU4RuFBvIFQ1
	tHz5d9BPjPsfK9/ZPVXKUwRpqCOKPu4e2tMbnZd5bg5Zo8jmteRAJoQg6aLceLbO/47E
	VYjZyAL9wBNoFBp7y8y6kHy9ivCSH93K/GLS9i1Ublnj4UPfNbZtKz5l4TEhjTFJNgoS
	YSDDg2NyHrmi9wohaj3Wf4bp19PQoE2T2J709U6Kj2qjysgW8jxw8DG5/JYAETthZa6g
	64dA==
X-Gm-Message-State: ALQs6tAdIuhDBsWviTPM54UBrzCovHIGVIZCAOLjMrhp2AJS1OjkrZPF
	9vi4sd6o1Y3i4IB2Ha32vejsWIviwAASM2WYLrDTww==
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr4970814otf.294.1523899565539; 
	Mon, 16 Apr 2018 10:26:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 10:25:45
	-0700 (PDT)
In-Reply-To: <1523551221-11612-3-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-3-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 18:25:45 +0100
Message-ID: <CAFEAcA8zH6OyELbYGScXBjDTZZYgV5D-WQBeZOy4iUu0MwSr+A@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-devel] [PATCH for-2.13 2/4] platform-bus-device: use
 device plug callback instead of machine_done notifier
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sIBPTP5jMibk

On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> platform-bus were using machine_done notifier to get and map
> (assign irq/mmio resources) dynamically added sysbus devices
> after all '-device' options had been processed.
> That however creates non obvious dependencies on ordering of
> machine_done notifiers and requires carefull line juggling
> to keep it working. For example see comment above
> create_platform_bus() and 'straitforward' arm_load_kernel()
> had to converted to machine_done notifier and that lead to
> yet another machine_done notifier to keep it working
> arm_register_platform_bus_fdt_creator().
>
> Instead of hiding resource assignment in platform-bus-device
> to magically initialize sysbus devices, use device plug
> callback and assign resources explicitly at board level
> at the moment each -device option is being processed.
>
> That adds a bunch of machine declaration boiler plate to
> e500plat board, similar to ARM/x86 but gets rid of hidden
> machine_done notifier and would allow to remove the dependent
> notifiers in ARM code simplifying it and making code flow
> easier to follow.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

> +static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> +        if (vms->platform_bus_dev) {
> +            platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
> +                                     SYS_BUS_DEVICE(dev));
> +        }
> +    }
> +}
> +
> +static HotplugHandler *virt_machine_get_hotpug_handler(MachineState *machine,
> +                                                       DeviceState *dev)

Nit: typo in function name, should be "hotplug".

Will let others review the meat of the patch.

thanks
-- PMM
