Received: by 10.25.0.147 with SMTP id 141csp32414lfa;
        Mon, 20 Feb 2017 06:39:36 -0800 (PST)
X-Received: by 10.200.50.157 with SMTP id z29mr19093069qta.131.1487601575985;
        Mon, 20 Feb 2017 06:39:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si13045257qtf.199.2017.02.20.06.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 06:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfp7n-0005U0-EE
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 09:39:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfp74-00053l-Rc
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 09:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfp73-0003Cy-NQ
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 09:38:50 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:34041)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cfp73-0003CX-Fa
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 09:38:49 -0500
Received: by mail-wr0-x232.google.com with SMTP id z61so65209198wrc.1
	for <qemu-arm@nongnu.org>; Mon, 20 Feb 2017 06:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ANmIFrN/1SFW2nbJ9sYH0zGTeEwIHtHTA7hNS8AGtCg=;
	b=XjPbpQOrnBTeBMc2od5FagYfHArn/RlmWIZD3ulAnSqHA6DUtUA5fA8a1LhVT8EfiG
	AsFMj5f/AE+8qrpAe+ilBc5hQBYyp0xi/bUlZvJZbHIiLj5eLwwso6jtqj6gobpVrNnb
	U4ys77t0BaF8MLTfbkSCNGZ2ltlAayvN6VDMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ANmIFrN/1SFW2nbJ9sYH0zGTeEwIHtHTA7hNS8AGtCg=;
	b=boxq5aHxWirtYYS+j2Bk0708S2/aAWgmskzrV1oByTiHima4g+Z/588YlKfqfdrRRD
	GcOvMMHvIogMPHkXQBw1T6d8G5jA7hBvdyNbvIwB04HgR5OhCRI2ndcfxDYDlsM2z7tG
	lk2ONh51jRyyW1z4gvf0tYKNPNy2XdShU2QDE/P8v8Jga4lJRA/OB+lMjhdWth+jOrF6
	jPMBt/OzLvBMKToMXPgSTRehkvzwuYaulhTBRCkpNdJSAxGo3DcrkHsDi2fq+eeLxL46
	BIk6uveCwzLFArf30BAMcCKr5eIpAYMCUEav5gHy3S0JSN503RxtXf5/3x7UwTjofSOp
	BGYw==
X-Gm-Message-State: AMke39nfXoHY/AoWjd2QkT6zAt/mkSUBh5f28TpGniw1rzN8Ql+bUkVtw1YnoxUQgYYkmMvv/aaYXf3toeFNyr4A
X-Received: by 10.223.152.241 with SMTP id w104mr5849557wrb.151.1487601528246; 
	Mon, 20 Feb 2017 06:38:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 06:38:27 -0800 (PST)
In-Reply-To: <73cbda87-adc5-e97d-d46d-f1f3d29cd46c@kaod.org>
References: <1486997062-23227-1-git-send-email-clg@kaod.org>
	<1486997062-23227-2-git-send-email-clg@kaod.org>
	<CAFEAcA-q-VSup75PO-To9N11+0WCm=LNiFQ-SQXaTQMroyHFbw@mail.gmail.com>
	<73cbda87-adc5-e97d-d46d-f1f3d29cd46c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 14:38:27 +0000
Message-ID: <CAFEAcA-1tzbEJ-kLF6iBR8LeXq_iiMgr92zh_HAgO9jVkMhCDg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [PATCH 1/2] aspeed/smc: add a 'sdram_base' property
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qhl/FnmFgOsA

On 20 February 2017 at 14:30, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 02/20/2017 02:51 PM, Peter Maydell wrote:
>> On 13 February 2017 at 14:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>>> The setting of the DRAM address of the DMA transaction depends on the
>>> DRAM base address of the SoC. Let's add a property to give this
>>> information to the SMC controller model.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>> --
>>
>> This seems a bit weird -- what does it actually do in hardware?
>> (Does it really have the ability to dma anywhere in the
>> address space and just use an odd base address, or is it
>> DMA'ing to a more restricted address space?)
>
> For the AST2500, the valid address range for the DRAM side start
> address of the DMA is [ 0x80000000 - 0xBFFFFFFF ] which is the
> full 1024M SDRAM space. It will wrap back in case of overflow.
>
> For the AST2400, it is [ 0x40000000 - 0x5FFFFFFF ] which is the
> full 512M SDRAM space.
>
> And the length of the DMA goes from 4 bytes to 32MB [ O - 0x7FFFFF ]

So if I do a DMA access to 0x800000 that's the same as an
access at 0x0, or does it fail?

I ask because the other option for modelling this kind of thing
would be that you make the DMA controller device take a link
property which is a MemoryRegion*. Then inside the DMA device
you create the AddressSpace* which you use to do DMA accesses,
and in the board code you pass the DMA device a suitably
constructed MemoryRegion that contains the things that the
device can DMA to.

You don't have to do it that way (and I don't think we
have much in the way of examples of doing it like that,
except for the ARM CPU handling of secure and nonsecure
memory address spaces), but if it seems to fit better
with what the hardware's doing it might be worth the effort.

thanks
-- PMM
