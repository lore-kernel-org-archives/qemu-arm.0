Received: by 10.25.21.96 with SMTP id l93csp1661684lfi;
        Tue, 28 Jun 2016 07:17:39 -0700 (PDT)
X-Received: by 10.233.235.83 with SMTP id b80mr2250956qkg.83.1467123459016;
        Tue, 28 Jun 2016 07:17:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o126si22699060qkf.206.2016.06.28.07.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 07:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtpa-0003NE-C4
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 10:17:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtoO-0002JL-46
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtoL-0004H1-VP
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:16:23 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHtoL-0004Go-Hm
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:16:21 -0400
Received: by mail-vk0-x22a.google.com with SMTP id j3so23772315vkb.0
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/ajz9zJqI2D2woEC8hq4brJSTrRqGP5b+7pBrO0MqI8=;
	b=DVwhJYPk2T+5K+csS3fF86VX/Tu4fMpbQbrj8nw6vYJXCI1V/uxPmtw/sTLcAxYI27
	BQpZR0EyWnyu6w0l4VfXq63CMu15761q6L0PV4MHKOIofumwhrK5/SyQ8x5qx76TcJUJ
	X58my+JiihXEkdS0WHSyY+3WDbwOTUjvzHAI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/ajz9zJqI2D2woEC8hq4brJSTrRqGP5b+7pBrO0MqI8=;
	b=Dl4nv/CjYDDGZdrsoofzJXbP0Ca+SLHkogmAJD8pZMTlXVNAMXlScxudPxo5n7qsIP
	Cj1zn/8w9qxXWbHGUcNqnLcxACVxOLIhsFA5Wh6WpE3s44cvZGbJKP1auDaJa4U5Ih9m
	Qr8L4wnPCUBakoKeseqGhM95htWE9f0Avw9++OrIsbdmM9gtqvJaWXY+OzqIVs62FXgV
	1+kEdy1Cocofjk4PyNwjSzMLmaXVg/R5yNW4shDxQjdqeJv4Ad+loKY4Gcr5hpK4HdMu
	JDZHRhs+HKaG7LpODfQ3VJ5bHrGCimWJXJDvd24YLFY7jUUS2bVG42H7HWOIIU/Ojsgd
	HCNw==
X-Gm-Message-State: ALyK8tKGY05VBXGA5dbcJDiSBg6EOk4luDRJQeh8TtqakhVCawWGClPQNOqMryqG3SOEldXAZqSIZvjtvKQ+Q33r
X-Received: by 10.176.65.106 with SMTP id j97mr726097uad.64.1467123381053;
	Tue, 28 Jun 2016 07:16:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 07:16:01 -0700 (PDT)
In-Reply-To: <CAKv+Gu-1g4FYEaqUWnO25oZVnq9inX_jd7B2RjWd+uhs34CPpw@mail.gmail.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
	<CAKv+Gu-1g4FYEaqUWnO25oZVnq9inX_jd7B2RjWd+uhs34CPpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 15:16:01 +0100
Message-ID: <CAFEAcA-p9K+Xzp2KuqTKsP__ph9ZaXNG-pfGDGTyREJEBikDaQ@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>, Will Deacon <will.deacon@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aB57WJXluFiy

On 16 June 2016 at 14:58, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 2 June 2016 at 14:45, Alexander Graf <agraf@suse.de> wrote:
>> On 02.06.16 14:32, Peter Maydell wrote:
>>> This patch seems to change the property of the emulated PCIe controller
>>> based on the host PCIe controller even if we're not doing any PCIe
>>> passthrough at all. That seems definitely wrong to me.
>>>
>>> (Should the purely-emulated case be marked DMA-coherent anyway?
>>> I forget the fiddly details...)
>>
>> I do too, let's involve a few people who know :). Not exposing it as
>> coherent is definitely wrong, but whether "dma-coherent" is the right
>> choice I don't know.

> As far as I understand it, the purely emulated case should be marked
> DMA coherent, since otherwise, guest drivers may perform cache
> maintenance that the host is not expecting. This is especially harmful
> if the guest invalidates the caches after a device to memory transfer,
> which may result in data being lost if the data was only present in
> the caches to begin with (which is the case for devices that are
> emulated by the host)

So the consensus seems to be that:
 * emulated PCI devices definitely need dma-coherent
 * passthrough devices where the host controller is dma-coherent
   also need dma-coherent
 * passthrough devices where the host controller is not dma-coherent
   don't want dma-coherent, but we have to set things per-PCI-controller

Would somebody like to write a patch which just unconditionally
sets the dma-coherent property on our PCI controller dt node?
That seems a clear improvement on what we have at the moment.
We can look at whether we want to support passthrough from a
non-dma-coherent host pci controller (via a 2nd guest pci controller?)
later...

thanks
-- PMM
