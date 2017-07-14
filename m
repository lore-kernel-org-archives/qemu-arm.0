Received: by 10.25.44.15 with SMTP id s15csp1148427lfs;
        Fri, 14 Jul 2017 09:31:32 -0700 (PDT)
X-Received: by 10.55.180.197 with SMTP id d188mr12862390qkf.181.1500049892766;
        Fri, 14 Jul 2017 09:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500049892; cv=none;
        d=google.com; s=arc-20160816;
        b=gdYB/ZgcsDqfGHoyVFf/+l7jwttI3jwwDjXntD9Wonfe96JglXKbmGmTqviw8PLume
         +GuC/gFs/qd3ewli+Rvu3LoVJZPWIUxNGS9iBuLmSAsLwNqVdDbjU//I4k9kjjpnmI9A
         IN9JFnNxQB7skx9sEVTtRBwKtuCYC+nhc2xvLy47ygiV33lALYJonaK+5pvdUOfbI9iP
         OeCpFeKDrM9RT8+uLd+9GgulYnHsqxn8XMIeaiZWb3wdXZn+rT+Ekx5PFBT1UITxLChP
         P7kVme5T553xgJN7oxAZDPvIDv6KZHfqN4lykD3YeNxaJlZoseo997tEGrqda+0ZpUgO
         cISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=utAUydxkcuqY4shnQS4l1577hmzsbOeV4se/xKeB4Pw=;
        b=pI7I2zBT/AKa2k1MFFiuUCg10UK+e785QWiP290fCFSjD9Y6BB21Ujv8Q9SURSZAHx
         OECpATYHXr9YahuhEk2IizQNvKghCVvIlcHjkumO3iZ3+ZpmrhNfump2H1U5dK/xjD1n
         if+P0OGpOcY0vb4G6jkHBKHAUcv7ZQt2oVmO09srEUrcCigPDOkmfu0DlxpBd+VGj3LO
         E5/fQYbcJXVV+Z6C8HiXmVyuT/jvi+UA0hrNqmViR3VfrvqFxZ2K84BzxbC061BFeePU
         vDn/91STieKl900XUmekO2n/WXVqxfonfRXmc6Fxf+dEcRnHzUivLu3rsZNQd6JhIyVW
         nTMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=a0NA1MmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si5871404qki.276.2017.07.14.09.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 09:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=a0NA1MmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW3V4-0007XM-1g
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 12:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dW3Uy-0007W8-BW
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dW3Ux-0001Qg-DO
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:31:24 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:36514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dW3Ux-0001QW-6o
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:31:23 -0400
Received: by mail-wr0-x233.google.com with SMTP id v60so3581129wrc.3
	for <qemu-arm@nongnu.org>; Fri, 14 Jul 2017 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=utAUydxkcuqY4shnQS4l1577hmzsbOeV4se/xKeB4Pw=;
	b=a0NA1MmTQa1FaSMrkwpb0gtbulWlZBJzyHZKM7SULq60lRiLD1jPlSsROIwF5A4EZd
	t5jpuQrh6Gjdreh5wEFhLtJK9zC5PrQmGyYP4vp4MhbSVeNk0+edYXTTTvD89AUMqw1u
	PP7v+eb2w7jGAWpK7KqIerG8pP3GozEw8WeMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=utAUydxkcuqY4shnQS4l1577hmzsbOeV4se/xKeB4Pw=;
	b=scdLBgcWDnzQpdCrO30iRglG9jT7rWKfdHNKqxNeH9GYfKEYxQmyCfzKJKKP50tk8E
	8uL0YhCf2VgxNBrJusVneNJgxFy79mB2M/EB8VmgESJxSXIL9r0qXpf1D6sT7lMUrQge
	NcNNFLg+MvwR3+GDVlbfew2asqa6P0ejIej+yJLzbv/t7hnbJcNmBRs2ppMhwHRYMk4F
	P5yQ0xulqQRpc9flboiLuXBu2hkHY/Cqyu+JxlwTTruKKVzglE0JJYuK90ggRyoFOzMr
	+VTjerMCqXzHe0RdVTkOtpqE9H7aAyO6Lr3Mi3eCzpRkRe005eyN1DFsjqRabYUqm8wb
	qTvg==
X-Gm-Message-State: AIVw111awcFLdlE8WGnKIPAVxnAOtsIMNPtefsyL7KO5vXdQHCePCR2F
	RPHhpZLDX1CY4RXXVMR1sS2pH15E01QS
X-Received: by 10.223.173.246 with SMTP id w109mr3262686wrc.113.1500049882009; 
	Fri, 14 Jul 2017 09:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 09:31:01 -0700 (PDT)
In-Reply-To: <5ffe6736-841e-a451-f0e6-c32b36302a0c@amsat.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
	<1500029487-14822-3-git-send-email-peter.maydell@linaro.org>
	<5ffe6736-841e-a451-f0e6-c32b36302a0c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 17:31:01 +0100
Message-ID: <CAFEAcA8KrH5yd9t+6AMo-kBNPs7kZP8fuzyfva_Gx2GJzJcrDw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-arm] [PATCH v2 2/9] hw/char/cmsdk-apb-uart.c: Implement
 CMSDK APB UART
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bc4C9YdQmS9L

On 14 July 2017 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> On 07/14/2017 07:51 AM, Peter Maydell wrote:
>>
>> Implement a model of the simple "APB UART" provided in
>> the Cortex-M System Design Kit (CMSDK).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/char/Makefile.objs            |   1 +
>>   include/hw/char/cmsdk-apb-uart.h |  78 ++++++++
>>   hw/char/cmsdk-apb-uart.c         | 402
>> +++++++++++++++++++++++++++++++++++++++
>>   default-configs/arm-softmmu.mak  |   2 +
>>   hw/char/trace-events             |   9 +
>>   5 files changed, 492 insertions(+)
>>   create mode 100644 include/hw/char/cmsdk-apb-uart.h
>>   create mode 100644 hw/char/cmsdk-apb-uart.c
>>
>> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
>> index 55fcb68..1bcd37e 100644
>> --- a/hw/char/Makefile.objs
>> +++ b/hw/char/Makefile.objs
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_DIGIC) +=3D digic-uart.o
>>   obj-$(CONFIG_STM32F2XX_USART) +=3D stm32f2xx_usart.o
>>   obj-$(CONFIG_RASPI) +=3D bcm2835_aux.o
>>   +common-obj-$(CONFIG_CMSDK_APB_UART) +=3D cmsdk-apb-uart.o
>>   common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_ser.o
>>   common-obj-$(CONFIG_ISA_DEBUG) +=3D debugcon.o
>>   common-obj-$(CONFIG_GRLIB) +=3D grlib_apbuart.o
>
> [...]> diff --git a/default-configs/arm-softmmu.mak
> b/default-configs/arm-softmmu.mak
>>
>> index bfd2a88..d128e9d 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -96,6 +96,8 @@ CONFIG_STM32F2XX_ADC=3Dy
>>   CONFIG_STM32F2XX_SPI=3Dy
>>   CONFIG_STM32F205_SOC=3Dy
>>   +CONFIG_CMSDK_APB_UART=3Dy
>
>
> I'd prefer:
>
> CONFIG_CMSDK_APB_UART=3D$(CONFIG_MPS2)

That would just need changing when we add the next
board that uses this UART. None of the other config switches
in this file set themselves based on a board config switch.

thanks
-- PMM
