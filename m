Received: by 10.28.71.155 with SMTP id m27csp57017wmi;
        Thu, 22 Mar 2018 01:09:26 -0700 (PDT)
X-Google-Smtp-Source: AG47ELucclcHXTHwtaAx08ydpab2tV5vdT3mpvBUiNGS7vmS+xQIfT64TpAWz3kg7/bRrrPcuZZM
X-Received: by 10.237.49.43 with SMTP id 40mr33994072qtg.260.1521706166229;
        Thu, 22 Mar 2018 01:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521706166; cv=none;
        d=google.com; s=arc-20160816;
        b=dZdif1zRWFPCe0htDXS7UlJCcLMCTTAtM5/atFj+f/EMI7H+LpXhOru96kbJ9+a0O2
         zmv6qGnNi4+qZqA4Bwroy9aVeufmpIz5rEbvq7dnF2XE631tvvg3f9HRuZNFyiKneOFU
         FsK8F6a57RarWWIt4oIDk+jPPTPM0WnsUniiW85xjHE+L6BhyxqGGizdH4gjHPXP+CqO
         Bz5pmYXNF9kvNU/p+TBHwzZJSb8qme5bdup7Su2J6D7z6bdZJPTCV/v5bGuulb9SObPS
         Wmi+MIkqShMVpewZr6qsyVbTd45Bq4OCIbkydRHYbKLLeQ2hXGvp5Y5FPilWtmWRjZRd
         wGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
        b=ktgbs5MMSFLJ4BTcgW8dC8INQN0JveAYaRkvF5ioA7biR+dhYmW67pMtntmUR6/orL
         pKgvfCi3JkHq62Vqc1SeDUUJ+jXPFj2bRraHZV5dvzkHnJc+0M6vyNU42OOSUuGQGxCX
         kqkIjQd9RhoBiD9Bh+IKzBSljc/7QikO03In0lb9sYuAgIWJP+Jdh/NmlU2a9D4lPn5F
         Xj3nwXPh1//JNxw9PJxA35YKU3cs4gGgU8kr7YxlpMMfKhcwltzmLJFclMeDXI5bi9oE
         4nAvNpxHSdfN1BCyoH49C6Jpb7YCPDFch8rV07jf2CDNp5xqTFxx8e762jd+NcB++1WM
         szZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rVYZ3S5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si2236423qtn.198.2018.03.22.01.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 01:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rVYZ3S5X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyvHp-0005Kg-NG
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 04:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHe-0005JN-39
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHc-0002hj-Sj
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 04:09:14 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:32950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvHY-0002b3-52; Thu, 22 Mar 2018 04:09:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id i8so8032598qtj.0;
	Thu, 22 Mar 2018 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
	b=rVYZ3S5XRI2K0Q5O8XxqK4ZjFZYse2InFOjfrcWsC0DrnNnYZ7LXYVjlLoHedJ9KjM
	8QwMV2dMAeYddcG9BpgHCXYBaeVrN8xLY4r6LuYXMUktPOjeQ9mPEMCYP73rumj8QOHV
	cQww+H0ilxthGsvjiKyrqnCF2cWGkGYTr4kggjN5MlidiBqFYoThvbwAZUeF+mmlOV4p
	6COF+Toq2dkgrFith7QdkwyDk7ppweslVaN39C1W8lcBDNpy9d6sbzSS5ARJRsL39L9f
	uVXnfdvNCl2eih+ULPvWM4pS7z+6k/X7b7tAkCzsP2dztYpc+3NQ96K/nLqG1tdUmMWk
	Q10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
	b=d3Zfa5H6YuNGSnOUrXiBadLWL8p+477+/PEKWFXbDWgItbdC+YSfqFDOBaJ/X7OWj4
	hrH4XDKdSFzrGhc6wn8tEG/+DunF9wThMNMxK8ucxiSn9XrHzsP4h633k/UzMs1QPOZb
	dY0zXgx4klsNL5thwM/xacr4jZ+ltqbtbS9Hg7WPgIec1K5+HsmNRQVmen1s6RKoZLvC
	hz99RIwcOUvAYjzYmaWGFCUzL2J/qE+l7LagL/b/9DIh448U/xUdXlJGZUF2Ezkttx7M
	TPs+lP2KmOkE2F+7eSLZBYxZaJHSOn4C4fY/VRy6htEAS+PiIl+oRiuGY4vQPvwrJKpd
	gyeQ==
X-Gm-Message-State: AElRT7HxBwIg0X7JsjiDRUtoWLqCswd5lQjl+3ouvtEqWUSV3Ihd1NvT
	MdqQulWfeG8UUr0yk1xanSs=
X-Received: by 10.200.69.131 with SMTP id l3mr34871526qtn.50.1521706147655;
	Thu, 22 Mar 2018 01:09:07 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157])
	by smtp.gmail.com with ESMTPSA id f6sm5083842qkh.13.2018.03.22.01.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:09:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180319110215.16755-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <10801632-985c-b6cd-8bf0-83cf4922b7f7@amsat.org>
Date: Wed, 21 Mar 2018 23:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319110215.16755-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/arm/bcm2836: Use the Cortex-A7
 instead of Cortex-A15
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+WneBVBX3Iu

On 03/19/2018 12:02 PM, Peter Maydell wrote:
> The BCM2836 uses a Cortex-A7, not a Cortex-A15. Update the device to
> use the correct CPU.
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
> 
> When the BCM2836 was introduced (bad5623690b) the Cortex-A7 was not
> available, so the very similar Cortex-A15 was used. Since dcf578ed8ce
> we can model the correct core.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> This was originally done by a patch from Alistair:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00311.html
> 
> The refactor of bcm2836 means the code is different, but I'm using
> the same commit message.
> 
> Based-on: <20180313153458.26822-1-peter.maydell@linaro.org>
> 
> ---
>  hw/arm/bcm2836.c | 2 +-
>  hw/arm/raspi.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 25e74b67d9..8c1e707d9c 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -32,7 +32,7 @@ struct BCM283XInfo {
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> -        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
>          .clusterid = 0xf,
>      },
>      {
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 06f1e08ca9..955a7c4e80 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -226,7 +226,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> 
