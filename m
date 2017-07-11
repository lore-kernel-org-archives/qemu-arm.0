Received: by 10.25.44.15 with SMTP id s15csp5125241lfs;
        Tue, 11 Jul 2017 10:21:40 -0700 (PDT)
X-Received: by 10.200.54.181 with SMTP id a50mr1298560qtc.66.1499793700238;
        Tue, 11 Jul 2017 10:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499793700; cv=none;
        d=google.com; s=arc-20160816;
        b=PbIg8UOEhpKBVSs7HgZnJD3vvLL/97LOhTTIiyrp7XUafGFVqLro87NhykCKqShCjg
         tk83j6LCSxnn+XjEEqn2rHU5bNXM50V2gtcZOAjChWIGqGE/N/gfNLFv4yu5gd/5SiVt
         typbdBDezuAsc+vQ/Jbl0nwCmomB1WjuLZfSQWQ6ZGoDmIzqiRe9iKZrk9Ps9S1XhmuH
         GVKLuPGrDCIpjxUuzXFPwGonQKSOynWWMFoFc+mOZHz0Xprp3I8Em3IpG1YRj2hK9iGn
         7RV48r1KZu2euK6CxvQKFkJ3QmJuok7eyQlAqiSCg7+cY0mLbDWiNhvnjF820y5udxY5
         RFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RllY8YkwwYKyvKUVlnJRYc+luIBP3R0B1Dvy+Kbwiss=;
        b=LbwZGpFEU8RMWX9g42ZEsoOhrEphW9idVBbQEJ8fAbZifn/6r899rfILC8HLxrKqwC
         scK12WQLgFP9XAXwZRQGBmrxHRWTV0LLf9QZbcGADbto4aGnHZc++GDsuR7HHOt5flF6
         bKXdCqvxj+2xOxA9sYFoQLCb8ZzIjURIIcX8jhaKOkk4P60Y5FT34Kjas51sQft66U72
         aocskW7NZ/b7K7liA+eS94Uj1UF6bXv5W+4tAS70KUsWfy1AbPmzdcdObVPClkVi/pYU
         +UXRxlSuSeVRnDBGC5U8Yw0R6berFhlofK9i8KbxS6S3M3nCjXQDXmbE+MOmCPiUMQV+
         te5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=UdPqIgeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 91si456723qta.132.2017.07.11.10.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=UdPqIgeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUyqv-0008K5-D1
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:21:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUy9T-00076m-1g
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 12:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUy9P-0001Xz-Td
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 12:36:43 -0400
Received: from mail-wr0-f177.google.com ([209.85.128.177]:33602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUy9P-0001Xh-NW
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 12:36:39 -0400
Received: by mail-wr0-f177.google.com with SMTP id r103so6462954wrb.0
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RllY8YkwwYKyvKUVlnJRYc+luIBP3R0B1Dvy+Kbwiss=;
	b=UdPqIgePzwQN478jBguj+BSuIm+HZ+S8BLBw/sT1tplE/sqJT/Qs4v2x90S/Tm3esc
	NYoCteYFKnc1OAtxLJAmU5inzDA2y6Q49kD2GwJBAWoIGklVqeAnnGFCyKyUikpXGnZ7
	y6uU+i1A3HBWGZlAA8zVdO61jHX15MEgOIWyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RllY8YkwwYKyvKUVlnJRYc+luIBP3R0B1Dvy+Kbwiss=;
	b=s6r6Bx2JKJJ35zTuqaNy8SuE/QCbI0eYSQoCue/WIBKetneyx2OrEAb7CD1TDEwrcD
	Gtd4pxVAvnhWjoJrwSrvQzWvxuljhuR0RqlNwFeTmdSmgWFIKxnCVwPWOkoldFmGkN6C
	+iFg3zALJrBw2h/ivvpEQr8fXqnIfEaOIZM+bQRA1rsO/ORF5/JPGIpKTunuA9vav8dE
	iNeKi2am8A9X31rQ7CAB9IbQT41v2JHvcvSo/q2fXjG2n8CTr8dBPULDUESw07t603bZ
	GEPbv8b8nnLb++J5mbRWS10sYoa0eYAlZr4yReRotDX+YMAEzCZVc3JRcru60jAtsR7w
	uMPA==
X-Gm-Message-State: AIVw113H5C53oG7iecbv94Yt7zivtPUdVn/rPGGY5gczRTnh45HNmnOb
	wED/Agyc9kQDU0F8AGgfRJDxoqn/fxKx
X-Received: by 10.223.133.239 with SMTP id 44mr447694wru.177.1499790938493;
	Tue, 11 Jul 2017 09:35:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 09:35:17 -0700 (PDT)
In-Reply-To: <CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-2-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMO4GQB1Cgy5rZw8pJawO_kWFZ7PiLGzWPch5CqkOKp=Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 17:35:17 +0100
Message-ID: <CAFEAcA9xOEX3p0H2=GfYbGXwJkfYYXkVfZH=h0GbM_-bZ4auSA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.177
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
X-TUID: TMFKkeKVkFdL

On 11 July 2017 at 15:33, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Model the ARM MPS2/MPS2+ FPGA based development board.
>>
>> The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
>> FPGA but is otherwise the same as the 2). Since the CPU itself
>> and most of the devices are in the FPGA, the details of the board
>> as seen by the guest depend significantly on the FPGA image.
>>
>> We model the following FPGA images:
>>  "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
>>  "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511
>>
>> They are fairly similar but differ in the details for some
>> peripherals.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/Makefile.objs            |   1 +
>>  hw/arm/mps2.c                   | 273 ++++++++++++++++++++++++++++++++++++++++
>>  default-configs/arm-softmmu.mak |   1 +
>>  3 files changed, 275 insertions(+)
>>  create mode 100644 hw/arm/mps2.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 4c5c4ee..a2e56ec 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>> +obj-$(CONFIG_MPS2) += mps2.o
>
> Is this file name possibly too generic? Should it be arm-mps2 instead.

It's already in hw/arm/, and we don't ever do anything that
confuses foo.o in one directory with foo.o in another.
(Also none of the other board or SoCs have 'arm' prepended.)

> I don't see any other boards with the same name from a Google search,
> but it just seems a bit vague having a three letter acronym.

>> +#define TYPE_MPS2_MACHINE "mps2"
>
> This public name seems too common as well. I am just worried it'll
> conflict with something one day.

I can see the issue, but on the other hand the type name is not
external ABI, so we can always rename it later if we have to.
The board names themselves (mps2-an385 and mps2-an511) on the
other hand we have to get right from the start. I'm not sure
tacking an arm- on the front of those helps; they're already
pretty ungainly.

The other possible name floating around here is "v2m-mps",
which at least some of the docs refer to as the name of
the motherboard. There's a lot of just of just plain "MPS2", though.

(I note that we've had 'kzm' and 'z2' since forever and they
haven't ever conflicted with anything despite being pretty short.)

I dunno; I'll have a think about it. Naming is hard...

>> +
>> +    MemoryRegion *system_memory = get_system_memory();
>> +
>> +    DeviceState *armv7m;
>
> These should be at the top of the function.

Fixed (along with the 'sccdev' added to the DeviceState
line in a later patch).

>> +    create_unimplemented_device("CMSDK APB peripheral region @0x40000000",
>> +                                0x40000000, 0x00010000);
>> +    create_unimplemented_device("CMSDK peripheral region @0x40010000",
>> +                                0x40010000, 0x00010000);
>> +    create_unimplemented_device("Extra peripheral region @0x40020000",
>> +                                0x40020000, 0x00010000);
>> +    create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
>> +    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>> +    create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>
> I did not know this was an option, this is pretty cool.

Yeah. It's really nice for bringing up a board model because
you can just add -d unimp to your command line and get the
info about what devices the guest is prodding that you need
to implement next.

thanks
-- PMM
