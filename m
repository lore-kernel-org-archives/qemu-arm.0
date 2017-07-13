Received: by 10.25.44.15 with SMTP id s15csp1811036lfs;
        Thu, 13 Jul 2017 00:28:11 -0700 (PDT)
X-Received: by 10.237.45.3 with SMTP id h3mr3070736qtd.110.1499930890980;
        Thu, 13 Jul 2017 00:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499930890; cv=none;
        d=google.com; s=arc-20160816;
        b=bSUXydRxXRNOMSb9ad/RwUTSdU1hVPwKw/wYXKU3uKCLeiqBYC3WKSKFdsbDPBYHAS
         PteOS7LjYG4nc3TIcQz1CbbPxzpz7kXRARqn3datJUqDR8N7616Xk2zvbhLtMQex3xgP
         SloSK9/l0maHn9UPM61877DB+CGxQ2uQtP3D8ny40Jr5mvqMEI4YTntG/9EG9RqerFPW
         LVVosmMQJkxeN8se5y6JFFWLDMbFZJDw+0/jSl27V4FHoTBfkWT2BLuMF2Q8xyXeXFW1
         18tfIgdWV/IH2Iejr5yxeK6VF9oxgwz0VbU/IRXMKiGEb3OXRCsoCT3Raq9FjTLYdp7I
         2A5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=y/cIoNeTdm5XL3E98tGaSw59jnXqOGh1ZHx6m8SQAxU=;
        b=eWLvbLxKEXmcNDk5wgZpLtkPuxPc7Uf/CADIfddLTDo6pwczC6Z/8Z3Vu2qiRxdTpL
         4fZ8NFOoO9Ypb51u3DtjAiqmVVE0SoDKtSD1e8GkcfG7RpfL3DOF6TJ2oe2FMbUNpcD+
         4+FhmLPNGbIVNxO5giqXdNjoLhfXx+j9vOW8bImlFdhzjiohFf8nTtVst1bfQPs6PjoT
         Ul6o463Aa/Wdpp8/Zl80sn3eljGVdvIZp159SjZlemalFnaLp5gQslXE2iPqZiYKB8vd
         qmQXHuxJgVhw6NoL//cF6rd9OUb/ZFfiZqx1xYjPYgvvC55r+UgZGFm96Zkz3Vr/uFhW
         PR4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cTXnXeSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o31si4501961qko.202.2017.07.13.00.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 00:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cTXnXeSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVYXg-0007zF-5y
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 03:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYXV-0007z8-7Y
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:27:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dVYXU-0001JF-0j
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 03:27:57 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dVYXT-0001J9-Nb; Thu, 13 Jul 2017 03:27:55 -0400
Received: by mail-wm0-x22e.google.com with SMTP id 62so14678520wmw.1;
	Thu, 13 Jul 2017 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y/cIoNeTdm5XL3E98tGaSw59jnXqOGh1ZHx6m8SQAxU=;
	b=cTXnXeScu7LxzrJcgREJf3bm+lVXPiMwFCz20fiOGm2CNTeGiucReAjAAUfYoPos6p
	UbywtQUVuVsqnCyFwx/qZdVHlMRNKVRYYVng4jI67dRFKyUvgAEWGnA510VZb8l/u/ko
	s8L3J2sue0ZWKBKBN6PCbFeqWjL6H12KxSxhedbA0nuQpbML7Nyt++uuGAqWbxY7XW8n
	XvpdYnpTwzkXaOpPDX3v/d+Felwlpc/LVk3iLj5Pq8Mi6HyoppVSCjAn6K2XkkscYrBa
	IRsogTTglq4weo0XlkLIpFY9RUYwdm3CdVh+IKCDHHsjAcHg6L2cl2+DzuA3Pfh5oNtx
	OLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y/cIoNeTdm5XL3E98tGaSw59jnXqOGh1ZHx6m8SQAxU=;
	b=Yv7DSU8IPDR+0obW9FYxLPFor3i5USzQsTbp+RnTfJl0tU7v90ZkdDOxFUMXmX1zBM
	ez0ly1IrH5qPPFiyX5BDvpbucO8wSx+ZiJh31jDqIQnMufBhBRRb65KzdyJOCpkoT8hA
	ve3UrQA776pd9HzulgVmWXVSliJrGdc7ABHvcMsBILY/ZHNLJVqF8HZt3A77MVZtKWkG
	/GcLMxURDrFRa3YSiFkYSmd2a62/+EbOeH/UxY4nNq/xV/kDnqe7jN2Frr9KWR9JqS+B
	7L6aSrelqWEqpdH+/u4ACJ2/jYIcCVhj/swXBM3HCA09io8KQFe8di99rQS2azdsLA4l
	y7KA==
X-Gm-Message-State: AIVw110yOYEcRofaIjkUM+zT62k+DtF1+6Ozx8iDXbtRF4FjB6ueIzwa
	W9wEj1ZVybN29d4LLj1ZUbH+Ic8V4Q==
X-Received: by 10.28.217.3 with SMTP id q3mr967875wmg.115.1499930874392; Thu,
	13 Jul 2017 00:27:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Thu, 13 Jul 2017 00:27:23 -0700 (PDT)
In-Reply-To: <CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
	<CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jul 2017 09:27:23 +0200
Message-ID: <CAKmqyKNR269fZpVz5zqyMbkU7JDKGswnyq10+zud0FxA5_m4Qg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] hw/arm/mps2: Implement
 skeleton mps2-an385 and mps2-an511 board models
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 46mlnldIlVWO

On Tue, Jul 11, 2017 at 6:35 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 11 July 2017 at 15:33, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Model the ARM MPS2/MPS2+ FPGA based development board.
>>>
>>> The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
>>> FPGA but is otherwise the same as the 2). Since the CPU itself
>>> and most of the devices are in the FPGA, the details of the board
>>> as seen by the guest depend significantly on the FPGA image.
>>>
>>> We model the following FPGA images:
>>>  "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
>>>  "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511
>>>
>>> They are fairly similar but differ in the details for some
>>> peripherals.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  hw/arm/Makefile.objs            |   1 +
>>>  hw/arm/mps2.c                   | 273 ++++++++++++++++++++++++++++++++++++++++
>>>  default-configs/arm-softmmu.mak |   1 +
>>>  3 files changed, 275 insertions(+)
>>>  create mode 100644 hw/arm/mps2.c
>>>
>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>> index 4c5c4ee..a2e56ec 100644
>>> --- a/hw/arm/Makefile.objs
>>> +++ b/hw/arm/Makefile.objs
>>> @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>>>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>>>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>>>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>>> +obj-$(CONFIG_MPS2) += mps2.o
>>
>> Is this file name possibly too generic? Should it be arm-mps2 instead.
>
> It's already in hw/arm/, and we don't ever do anything that
> confuses foo.o in one directory with foo.o in another.
> (Also none of the other board or SoCs have 'arm' prepended.)
>
>> I don't see any other boards with the same name from a Google search,
>> but it just seems a bit vague having a three letter acronym.
>
>>> +#define TYPE_MPS2_MACHINE "mps2"
>>
>> This public name seems too common as well. I am just worried it'll
>> conflict with something one day.
>
> I can see the issue, but on the other hand the type name is not
> external ABI, so we can always rename it later if we have to.

That's true, but it's still not ideal to be changing device names willy nilly.

> The board names themselves (mps2-an385 and mps2-an511) on the
> other hand we have to get right from the start. I'm not sure
> tacking an arm- on the front of those helps; they're already
> pretty ungainly.

I think the boards are already long enough to be unique and probably
don't need an 'arm-'. Although I think having the vendor name does
clarify what the board is. Imagine a user is querying QEMU for what
boards it supports and sees a board name they don't recognise. It will
be a lot easier to figure out what board this is is you search "ARM
MPS2" instead of just MPS2.

>
> The other possible name floating around here is "v2m-mps",
> which at least some of the docs refer to as the name of
> the motherboard. There's a lot of just of just plain "MPS2", though.

I guess what we generally do is copy the spec/datasheet. So if it is
in there then the name is fine.

>
> (I note that we've had 'kzm' and 'z2' since forever and they
> haven't ever conflicted with anything despite being pretty short.)

Good point.

>
> I dunno; I'll have a think about it. Naming is hard...
>
>>> +
>>> +    MemoryRegion *system_memory = get_system_memory();
>>> +
>>> +    DeviceState *armv7m;
>>
>> These should be at the top of the function.
>
> Fixed (along with the 'sccdev' added to the DeviceState
> line in a later patch).
>
>>> +    create_unimplemented_device("CMSDK APB peripheral region @0x40000000",
>>> +                                0x40000000, 0x00010000);
>>> +    create_unimplemented_device("CMSDK peripheral region @0x40010000",
>>> +                                0x40010000, 0x00010000);
>>> +    create_unimplemented_device("Extra peripheral region @0x40020000",
>>> +                                0x40020000, 0x00010000);
>>> +    create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
>>> +    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>>> +    create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>>
>> I did not know this was an option, this is pretty cool.
>
> Yeah. It's really nice for bringing up a board model because
> you can just add -d unimp to your command line and get the
> info about what devices the guest is prodding that you need
> to implement next.

Yeah, this is great!

Thanks,
Alistair

>
> thanks
> -- PMM
