Received: by 10.223.172.38 with SMTP id v35csp7309419wrc;
        Tue, 12 Sep 2017 09:22:57 -0700 (PDT)
X-Received: by 10.200.46.209 with SMTP id i17mr20980967qta.235.1505233377610;
        Tue, 12 Sep 2017 09:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505233377; cv=none;
        d=google.com; s=arc-20160816;
        b=FPP6oa1MdiXCuKiVCFvdI/zHIsh0XbSCC1dMXT9LCmJqRr24vWbVvPGXauZqsE5rrd
         PHufmtG/ebPDo8NLu7RrKhVu5RoCTMRmTHADInIVot3um4sRaGMN/kOO/HD89vB803dp
         3HCJ8JL4l1u5KBl5zm+pGZw68jjjkjm5nT7wtCCQjFnms3RxDkpbvXLvggHcahkC/He+
         yaGFLi4+MvOWzA2nF4lEq6wTVZNhknCDk7R9sSorEmn9NyabORauIHHX4NBvc8Lb+qtH
         XDDQSuPaoYKQKkkmVJ+2ArrU2yzCCURmCXQJ28tzy4mOkGDGEjQW6qtkngjGvg/Rtrfv
         92iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=dqKC/Zi0niYYvZhcNekl7Mg65PjF+ll8TgjbJZ9/S+I=;
        b=xvxrEnDVlLhq9FzGqeIiGYdt2MaGcuq5UcIa8ilBHBn3QRxIZf1pYfWB5Upxe5EqnH
         xqv5rAx6eUd0/87D4USHv3pipitZXBnrCR03eFqmsMLeazwcsLtSDj+Q8RPBuE1N5PWV
         34vtWXhqXteiHVyjwKN4C5/CnxlHJelQPKE3/xlI7XNWeKTuRdmYuTvK+c7XBxC46GPj
         dJ7HQVFm7hHBVG75AhDFTWZbcdXpYoI7E9M8SYGcuQvHJ3xLFb3V0QbCLcVLOYtbJVuT
         4XO/orotdCrmCSsZlOs31/gzjTTvYUNXuU5qmC+fIp0m8NekFG9Y/fOKJmvbN1P3Lqnz
         G62A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ps2y/jb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w70si12254308qkb.151.2017.09.12.09.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 09:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ps2y/jb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drnxf-0007yu-BE
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 12:22:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drnxC-0007dh-L2
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 12:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drnx9-0005Nc-D2
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 12:22:26 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33624)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1drnx9-0005Mw-8Y; Tue, 12 Sep 2017 12:22:23 -0400
Received: by mail-qt0-x243.google.com with SMTP id b1so5289162qtc.0;
	Tue, 12 Sep 2017 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dqKC/Zi0niYYvZhcNekl7Mg65PjF+ll8TgjbJZ9/S+I=;
	b=ps2y/jb7Nu5Zo3vi7fjiyjJR3yWHx0HL1fgkpESU94p25ovbQ72/Cjm8Ety3NX1ioA
	1zD3DSeekdAOVz9pYQEqPjKAM9MWef245FCAi3krnlPNUx+vUWuYihDaYH8BSU5wU1uz
	V60U4jvoVVcnAOVxBPtPZw2r+Gpgdkw32X2t3YXwwb+5D3IcuknsEVHqYLuM6K8BoEVV
	gc49gAnbmFU6l3Z32zVZ8FO0oER3QbbOXnMiB/WqluGN6GoEP4+W9yqW7UbNeP7kCehs
	vkhpUFbYtChA0XY23AUPwv7LVk13fGG+CY/8P0AAn4DnkLQnOl89/OrQhYQtJ21DPXw6
	heIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dqKC/Zi0niYYvZhcNekl7Mg65PjF+ll8TgjbJZ9/S+I=;
	b=VBBbkN/JRLyl0JpEaIj1TTQTRiAe9wDkTqfWKCxSHpDHqENtYrzM/2TMAEJen5esCt
	vYa/9l59RO+2UzZK09yoCjmlkcfRywq4S5LmIEUrYJq5k8oFcFG+ICP0+0p1GfkH81kF
	t7c1iqlSLtPR6chP1Ei2AHmRwtVTorhMtSO6gAVrwxHKcZAnPfrYo3TJiu5/YuwvbFJS
	hCJHZZceYageyEfq8hldQiyOIOV4/RMDuY49ovEBtcqWxRQ8tYw0TN6PAiWIElZaQHAe
	68kSfZlBFh1YXUVs5JDnrjV4YsYu8tpuGZq8W9MoBZOXjkaPxh0O0r4ITskwZ7JepFjy
	4iFQ==
X-Gm-Message-State: AHPjjUhCgV68/VImtDsduAj7rjIxOVpbqq5p96yadogKz/KN51Y50vL+
	8crReVCxDtU0L5LcNqufbQ==
X-Google-Smtp-Source: AOwi7QAXnw+s3xSafkz6SunS2UX1gy5s59siJuLMSuo3rnFlJCd4wQewzp9f+4eJPprI10eawgK5oQ==
X-Received: by 10.200.53.216 with SMTP id l24mr21375632qtb.7.1505233342502;
	Tue, 12 Sep 2017 09:22:22 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	s69sm7697112qka.95.2017.09.12.09.22.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 09:22:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1505232834-20890-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca218563-0789-f11d-fa7b-895998a1a84d@amsat.org>
Date: Tue, 12 Sep 2017 13:22:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505232834-20890-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] mps2-an511: Fix wiring of UART
 overflow interrupt lines
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
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sb//mSSTzit6

(CC'ed qemu-arm)

Hi Peter,

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> Fix an error that meant we were wiring every UART's overflow
> interrupts into the same inputs 0 and 1 of the OR gate,
> rather than giving each its own input.

oops tricky to catch

> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/mps2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index abb0ab6..769cff8 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c

         /* The overflow IRQs for all UARTs are ORed together.
          * Tx and Rx IRQs for each UART are ORed together.
          */

can you update this comment?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> @@ -287,8 +287,8 @@ static void mps2_common_init(MachineState *machine)
>               cmsdk_apb_uart_create(uartbase[i],
>                                     qdev_get_gpio_in(txrx_orgate_dev, 0),
>                                     qdev_get_gpio_in(txrx_orgate_dev, 1),
> -                                  qdev_get_gpio_in(orgate_dev, 0),
> -                                  qdev_get_gpio_in(orgate_dev, 1),
> +                                  qdev_get_gpio_in(orgate_dev, i * 2),
> +                                  qdev_get_gpio_in(orgate_dev, i * 2 + 1),
>                                     NULL,
>                                     uartchr, SYSCLK_FRQ);
>           }
> 
