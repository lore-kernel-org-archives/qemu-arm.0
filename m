Received: by 10.25.44.15 with SMTP id s15csp453525lfs;
        Thu, 13 Jul 2017 22:13:48 -0700 (PDT)
X-Received: by 10.55.132.135 with SMTP id g129mr9703167qkd.36.1500009228166;
        Thu, 13 Jul 2017 22:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500009228; cv=none;
        d=google.com; s=arc-20160816;
        b=E6uuiUQonAwBUlZUzev8Dxdgo27A+o0C7AkL3GfFuhGU235b8rXpKyKsgiqwJzSxEY
         3Qpc5zTs1nHANbdVvn+uN6+x5nKePcXYKypOJ/uou9rR/tb0xN6xH8KjvfYRMs5pzDZ/
         I4FxEnqaB79qAs7TOYbslk08D+kVBNyf8BKCvqRA3mGfhq0TxU3wByMPzD9+e+DzmcN7
         Wzl2bj5vaeD30o89RpNrFHo+BulmKG4KAOvMmq0nujYzxBzqkmn6Xlr3e3qkWJEfUWiD
         n33eGrHbAbXLg1ltSUKK0Y1pBAt65yS5ZX4cXnMqfwv3TBCGco047OK8XKrnrbeTvnxg
         6ehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=NQi2MP4T/FnNv85eZHHwW0+1L8JVz0LyWGrFZIzCksg=;
        b=NjZy2A/wB3YT5cuOJ/01hhu/cV6UznIWHIPLRX9z+xP5BZ6FG3vFmRvXGgKb2QPqA0
         CMIN3sIYtExmYKvG8FPXfm2wz+GelOz6v7JibmcX1oShqkdx3g5R9RwkgmdyUZ2qUEuC
         EyQhDOMbDf81zQK/hoc+vR2A1a+RVOF0QWfs9MsQVHa+y9k6TGIQgm2kJWrA9iAQ5wrZ
         8dVCRcR95wR4wpQUPgYdsC8Mj82GhzQuUzopA0cpYz+aV3n0G+bP8Xu5ESKZtT4T8Hab
         wMW6h2qoscHVaPw330mQZSuQUBZVfAReTgrbeS2+l/bUqFhFcUn7m5ybWEk3IfdNutRU
         v96A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K/QQ0zHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f28si7042900qte.360.2017.07.13.22.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 22:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K/QQ0zHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVsvB-0001IH-Ie
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 01:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsv5-0001Aa-SX
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 01:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsv4-0007UB-TE
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 01:13:39 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsv0-0007JR-F8; Fri, 14 Jul 2017 01:13:34 -0400
Received: by mail-qk0-x243.google.com with SMTP id v17so8569350qka.3;
	Thu, 13 Jul 2017 22:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NQi2MP4T/FnNv85eZHHwW0+1L8JVz0LyWGrFZIzCksg=;
	b=K/QQ0zHmNvYzHVIQpt8HEP0EANPgtQlPxydshjJuh+6iHuh58I7Pq47urVb7Uv2dC2
	8psdCxzJ/wjrmOJviGzeiz0R29XLhHijdG4Ugu+kdZBQT0HgAATKBLYLrJkA8O+1c3uR
	DtI04LPSUQnf9LL5hTg8T0eOq3BeUClq6zoy0x5evha2pZs3c+cmMHQbQwF9WxVT+LLI
	asyorxiI8QpgS7fBamm5tZwaI01CNhdwJti0jxGfaCliJeLotNYpLMK9/Jtxh/IC7ONp
	Tshi5ZPVY732QBIidShg+6yTHV20+ntpFhLxRRo/abqPpFzPub8Tgi23zvpMfYs3ldej
	vMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NQi2MP4T/FnNv85eZHHwW0+1L8JVz0LyWGrFZIzCksg=;
	b=TSHyMG7DDntcu5TIl0LI61A3eY55D19wI74V6sTqmHPKHCoX9YoWWkmoxB65RaCBXI
	xxkXkoDg8eUSI36zgn2pbOyH78P2eNgWK9rT0gibH90R0uStp2JrfeeRyQ6HYWUsQokR
	VCXc4waoV6izrhA4m/8bmvKaKPpvF8E68kByF2u5A8HvxcF1IEUpw/fGQQzr7rHe6Cm6
	KeGtFSp3mh74t1VnamKKxDKY8DW3FX5H5ZBKlTuJlHCu4xznbqwgkEvTTemJUNdK9mU6
	9JeH+HucYsn2KbX15/OpDfJvoAimyni/BplfgMIPWKxrbAuxP9EJmnVFypGywyNJrHqg
	UmuQ==
X-Gm-Message-State: AIVw111tgPQt41Usl7cC5135M3dKQkpKXMCEuqBKO8de/UlHxetYRd+A
	gVTG9UcfT/yycYKwnHY=
X-Received: by 10.55.81.198 with SMTP id f189mr9796437qkb.82.1500009213922;
	Thu, 13 Jul 2017 22:13:33 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	q40sm6173029qtf.42.2017.07.13.22.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:13:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <866ceb13-0f82-4bc7-b45d-4a48578f6919@amsat.org>
Date: Fri, 14 Jul 2017 02:13:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499771839-32518-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 5/7] hw/arm/mps2: Add timers
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56VRR8UkIBPv

On 07/11/2017 08:17 AM, Peter Maydell wrote:
> Add the CMSDK APB timers to the MPS2 board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/mps2.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 1b60b12..b1a0df9 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -33,6 +33,7 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/char/cmsdk-apb-uart.h"
> +#include "hw/timer/cmsdk-apb-timer.h"
>   
>   typedef enum MPS2FPGAType {
>       FPGA_AN385,
> @@ -294,6 +295,9 @@ static void mps2_common_init(MachineState *machine)
>           g_assert_not_reached();
>       }
>   
> +    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
> +    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
> +
>       system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> 
