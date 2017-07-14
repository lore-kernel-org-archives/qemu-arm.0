Received: by 10.25.44.15 with SMTP id s15csp1147285lfs;
        Fri, 14 Jul 2017 09:30:47 -0700 (PDT)
X-Received: by 10.55.91.70 with SMTP id p67mr12979401qkb.237.1500049847297;
        Fri, 14 Jul 2017 09:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500049847; cv=none;
        d=google.com; s=arc-20160816;
        b=PCyornP/nGiX0JehJKpz3Kry1cjpfFAH6cMhr55weU0izgbpGlWR0ATloVcTNKLgHx
         oO9yNMlp6Ma3r7cH1+Hh0OiPAXzsYQkFZPKXvEu1RGLONNtWOlVvtLp33a1Fk+hBwXnP
         t8UIcJIWOVTzTbAkEWGKQNSgknZTWFHpKK5nc7Yj821gMEmUtevo+sisHs3iS6rQsTjv
         3cZLROn20BR4IJLm9wOffNq+FTRIr9dkntaCIvJJnItUAzUeJJ5m4Fxu/yZcF1E8w5Zj
         KummELKGH0BRcMaJuihvqFVA7aIYJFiiLRophX0+GEmqN7dSy8zKVc7Evq672HDbePHn
         9okA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=OXWHlg9vdI8Ys5727VHFIcJtL+eu7PcUhKHW+aTChKQ=;
        b=YiOqhUNutqHSzMAi2UczhJ6XIyPy68k+6/PVYKxT2E8zVxekUgCr+eQXuBmsX9HGqx
         t0ADZrCBJfNMtFa64lm44MxJWBqIpAkJsP9h+1tgl9cPZX8El9mFDx22+jZEAuozprC2
         ABM1gTTyJcHa9qXp+1BAH2RFFoo4pCtVn9JOb9LdS9/OZC5MHG2fDLv3+AO2rTiK+GOM
         jJ1Ua2VT2QdmBqA2PMvzHmW/D5JaMPFsJloPlodyl7fV1MlhCX2u7YH0XPSHlFwM5FA8
         9w67VnDz/VZAAotbtrUZgmDO0EeNTu5Qid0giGuFZrbbsOj8TgmhXzDRqyjXiGouJ1ls
         Kl8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=a8T5y8hk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g206si8121238qkb.258.2017.07.14.09.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 09:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=a8T5y8hk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW3UK-0007A1-Jh
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 12:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3UC-00074D-PD
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3U9-0000qe-Gm
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:30:36 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3U7-0000q8-Er; Fri, 14 Jul 2017 12:30:31 -0400
Received: by mail-qt0-x244.google.com with SMTP id v31so10531762qtb.3;
	Fri, 14 Jul 2017 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OXWHlg9vdI8Ys5727VHFIcJtL+eu7PcUhKHW+aTChKQ=;
	b=a8T5y8hknbg5ESe0tIJjzoidLgvXn5YRt3RpFjOTHTyZtRH88HAMIglwFCO61xNycb
	GzzdYP/iJV3DsK+REUQuzjQkRN2hqiA6XUPnRG6e8XJLQuOEfYiRAm4yPUAYvkabNos0
	1I+ldiYw/Dv6+rXBTiCvxoWJUcjjn1zZwyCPNhKaxfjM4Lp6lFUjU1F3ajQEPGDuRwv4
	JsDPrZZ1h8H3fD+uuYhxtOzzq4y4CKup0woJh7HuCO7WD1xiX0Xzmgho7f4LVWEXOskg
	KlSziQXvdDhZB2Uo4/IJCACnpne0gL02sABom5A2tpGYR9cNeXwZMyHP/XoXrW5y8hAK
	OYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OXWHlg9vdI8Ys5727VHFIcJtL+eu7PcUhKHW+aTChKQ=;
	b=pxXsIRxjAX6N30tejKSQ74+DpixY+HHDaIV8oac48JK7Kt7cQDycdsiZgHr7CpF4OP
	NA0h0lqMtesnRM869HbNSt3gc1KhXGwTWdtb1d0lefdPJjzNRmnBjbuduz9yCuTzmVJP
	0oQE3roS6ObwJ5en+9FfdwUwyXDow7KiJAvqJ0tVc/NkYHKhy7JW6bfOnJmxuCyIsGsd
	DNXrClTn4zT/PDtTUDawjgC6lmLw04FhWWXnN8Qkdm2L15uz7u95siNvEKmgKq1UQAUq
	6gai2z0SJGYtJNcZ96VJoqtEzkVPTEkcytGRg0BoWsDfWoO2kN4fkn42gnm5m56gxF0B
	xdkQ==
X-Gm-Message-State: AIVw110MXMajJdawhUlH6YQ3t86ArzPqnOa2beSc30HJuEFWX7X9Ve9e
	YrbHVrSJ0IicL5O9uHc=
X-Received: by 10.237.35.174 with SMTP id j43mr13033713qtc.215.1500049830805; 
	Fri, 14 Jul 2017 09:30:30 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id s6sm6585447qki.44.2017.07.14.09.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 09:30:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
	<1500029487-14822-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4eea5d43-b770-f543-b8f7-bce12378498a@amsat.org>
Date: Fri, 14 Jul 2017 13:30:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500029487-14822-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v2 4/9] hw/char/cmsdk-apb-timer: Implement
 CMSDK APB timer device
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
X-TUID: DunS47RkPKpc

On 07/14/2017 07:51 AM, Peter Maydell wrote:
> Implement a model of the simple timer device found in the CMSDK.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/timer/Makefile.objs             |   1 +
>   include/hw/timer/cmsdk-apb-timer.h |  59 +++++++++
>   hw/timer/cmsdk-apb-timer.c         | 253 +++++++++++++++++++++++++++++++++++++
>   default-configs/arm-softmmu.mak    |   1 +
>   hw/timer/trace-events              |   5 +
>   5 files changed, 319 insertions(+)
>   create mode 100644 include/hw/timer/cmsdk-apb-timer.h
>   create mode 100644 hw/timer/cmsdk-apb-timer.c
> 
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index dd6f27e..15cce1c 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>   common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>   
>   common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> +common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
[...]
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index d128e9d..c75f52c 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -96,6 +96,7 @@ CONFIG_STM32F2XX_ADC=y
>   CONFIG_STM32F2XX_SPI=y
>   CONFIG_STM32F205_SOC=y
>   
> +CONFIG_CMSDK_APB_TIMER=y

and here:

CONFIG_CMSDK_APB_TIMER=$(CONFIG_MPS2)

>   CONFIG_CMSDK_APB_UART=y
>   
>   CONFIG_VERSATILE_PCI=y
[...]
