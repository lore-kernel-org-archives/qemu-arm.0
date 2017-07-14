Received: by 10.25.44.15 with SMTP id s15csp1138558lfs;
        Fri, 14 Jul 2017 09:23:25 -0700 (PDT)
X-Received: by 10.200.43.123 with SMTP id 56mr13341395qtv.6.1500049404949;
        Fri, 14 Jul 2017 09:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500049404; cv=none;
        d=google.com; s=arc-20160816;
        b=s58zJgx1j+kQbK5hmAVIgRl+M6cPUmNbCbg0KSU5GRnnN9vmmOXsKURbWfVRow3fkC
         R9O3TbfwthPZNH368WbFCW5teahhVjFQ9V2UjZo3QMI3MoypnOlSXbewjI2TneKw2LD9
         knipEQ+oKi2+P9TbTT3EqQ+pK3uVEgDmPFnxIO4PFWvzkIpl7kwZ9KKIfji1ZqX/3Juh
         vj8nua35CcRELeODuHWtEaffXu033SlJemhY1YvVLbEB76CpVsxcAXOtZULq1BgVvfQS
         bIntkp0oUFp39gM6QGub6rGv3UhSOMQxDvnrRQIfMDogVWJPhyrvt8Y6W88Crr3krdCm
         1DoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UqzAZPmEOPSBhYEo7VV+jk3w8ijWyOtl8UNJ7Ze9uNc=;
        b=b08piriIvyPpN7N+rQ6aCL32f6KjHmptkDak40k+I2xns1MsECcE8ueFGaV3+1myF3
         4o4RgYG6Cmo0ipeZHIx93aQXtAbr4cfpp8orZHke6Wo2vM3QmwpIrYIutSfFV1gK1bAX
         Uh+3g6ScwpKk+9KGm8WeOR8cnQZp239IwXapoMDuE+wQmnIz5NrGjBTfGkFs+VhotqTF
         f2ApluztHucusKve8Ua7+dfwppaTcfyxwAUis6fqgRWiaGolz3C75sGKqVeLfkeMtcYW
         Y8VIfxpnhmd2H9yzGyOnybUpvsYuRIGjog0oDlPyWr9CFlTwDEgPafrBJ2M594TgPLL6
         687w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FcSCS+zL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s55si8142317qtb.326.2017.07.14.09.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 09:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FcSCS+zL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW3NC-0000wG-4R
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 12:23:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3N8-0000vD-9J
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:23:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3N7-00071R-64
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:23:18 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3N3-00070J-Di; Fri, 14 Jul 2017 12:23:13 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so12690513qki.1;
	Fri, 14 Jul 2017 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UqzAZPmEOPSBhYEo7VV+jk3w8ijWyOtl8UNJ7Ze9uNc=;
	b=FcSCS+zLbCfVvgskBcr6o73cHbBrOYCY8giPbAKwFaktusM3hps8FXvxqo8niNQ7wb
	Eas/ZKHzsMb1RtJ5i4/eB3IeLrE5OiBCd5i1Zue2G7/67O4H3s3hMSiWZv2bkXZiio2m
	UtQEpAMCFzAHgrKrPXhZkw3QOM4GW8E/DfYwudmlwwZc8EmVMnbHyZknJJU+vPY/r9L2
	602ovREeS1uObi4pw9lAC/kbHTr3Qe0bWxj5g7oe9mnh3qjQT48/rlcwG6cjldx+pVax
	l6aJhFd0kEcLCHN8O1CIXkvKtVIrNxngYiSIBDb70Kr/FEu6q+8H3L8+baxhPoXhYXgc
	IVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UqzAZPmEOPSBhYEo7VV+jk3w8ijWyOtl8UNJ7Ze9uNc=;
	b=CiLDcneaEfsYyUw8puEoLIcwtvwEp3CM7heCLDOmcVczV47SBmLb2rUNEac/VOOP0b
	l4XMg9CSliT2IIQB1htoD7pxqoW3kqlKReXbi1HksN0E151Xe5P3YSICwM6mu7aOjCN6
	Ue/iLEE4lrxNToMobfGltKHE4vttp8E6V9GlmZK+0WxSj2h3ohE30Mhz+S4HgFjW+4Ob
	z7xDHkGFtPlR6Cp9h8niFeuKMwroww3+cLJLcOPwIKwAZ2S4gK9UAAjnP9uFy4xnHS6B
	14j+ebAAVulfrWyOb/1ZLBqGB8UToZC0AmYJVocDVMVb2Va5am9tLhleKBjL5mQL3Hpi
	XDNw==
X-Gm-Message-State: AIVw112vFgOwD6Bl/pIhZgDFfdUq8RC4KXMeYgWZhPRXvZzA3S06ecLV
	CVo9IA8w0uVcjQ==
X-Received: by 10.55.78.85 with SMTP id c82mr12059701qkb.154.1500049392778;
	Fri, 14 Jul 2017 09:23:12 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id r25sm165733qki.42.2017.07.14.09.23.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 09:23:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
	<1500029487-14822-9-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4526aa49-b018-5331-2c2a-61f0ae684ec4@amsat.org>
Date: Fri, 14 Jul 2017 13:23:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500029487-14822-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 8/9] hw/arm/mps2: Add ethernet
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
Cc: Alistair Francis <alistair.francis@xilinx.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 71nbcGV+RSem

On 07/14/2017 07:51 AM, Peter Maydell wrote:
> The MPS2 FPGA images support ethernet via a LAN9220. We use
> QEMU's LAN9118 model, which is software compatible except
> that it is missing the checksum-offload feature.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/mps2.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index bdc631a..6adfb22 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -35,6 +35,8 @@
>   #include "hw/char/cmsdk-apb-uart.h"
>   #include "hw/timer/cmsdk-apb-timer.h"
>   #include "hw/misc/mps2-scc.h"
> +#include "hw/devices.h"
> +#include "net/net.h"
>   
>   typedef enum MPS2FPGAType {
>       FPGA_AN385,
> @@ -210,7 +212,6 @@ static void mps2_common_init(MachineState *machine)
>       create_unimplemented_device("Extra peripheral region @0x40020000",
>                                   0x40020000, 0x00010000);
>       create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
> -    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>       create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>   
>       switch (mmc->fpga_type) {
> @@ -309,6 +310,13 @@ static void mps2_common_init(MachineState *machine)
>                                &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
>   
> +    /* In hardware this is a LAN9220; the LAN9118 is software compatible
> +     * except that it doesn't support the checksum-offload feature.
> +     */
> +    lan9118_init(&nd_table[0], 0x40200000,
> +                 qdev_get_gpio_in(armv7m,
> +                                  mmc->fpga_type == FPGA_AN385 ? 13 : 47));
> +
>       system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> 
