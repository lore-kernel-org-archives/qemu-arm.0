Received: by 10.25.44.15 with SMTP id s15csp1145851lfs;
        Fri, 14 Jul 2017 09:29:36 -0700 (PDT)
X-Received: by 10.55.176.133 with SMTP id z127mr13237526qke.233.1500049776306;
        Fri, 14 Jul 2017 09:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500049776; cv=none;
        d=google.com; s=arc-20160816;
        b=ZiTyDQwpEj8hyAns3mgEC58U9KahZFrrx6njcbJs3XxF7MBJDf9nBlPP5C0CntkrRh
         HhZPjjVs2yvvOPb3w/aa7n8N5LV2E1svdlubz8z9fzJ6k5AwTgoxtNjhzQ18EqvdZF7e
         R/Vlar9DF7yrAY5iu6Yox+X5be+kQyxv4qPiw2N9v3yxO4VE2RYQP6W5ap6oil+qHRs2
         H0Cuyk7kv+jmuVYJ2NtHuWSnngZd//y4iPNqWm+7Wkvb5k9W5tfW6waTG9kXgUQeWkVC
         IPXr7d4SCKiKa/Yfbmdjs30DWEIbtHrWSaD4fmd/Hp8ngYsTtLr6LfsNHlUt3sCYvsRF
         gFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=kZCFcsHIpixQb6ZlMsIrjl9ILL/RlmK9DZoSWZD/h0E=;
        b=gOAOPW7W/KwOnp1KM4qjJQjX1PfZM9WcMKLYD4HV4+7nwaFeRwrdBO4m/fPDyZhhhL
         rCM0Qo91VhP0A8rOSGv/Gaw2JPs6qQ0eXA7nJSdjzpMOu9tcnu9VnDtaAEhPVyaBkM7+
         zCGA3/CEWXELAPwf008/YyjhnskQMoEaciYdFLA7RQeR6KyJ58Uy/qvXCtirZEQ1F0rn
         6xwBLXquiHdN0vOnLUfkZQlktqsPimKgqaUO193EYnm4hY8PqN93Tp9PB/zQrZOdyVj5
         WzqQNKnRNIno3KGNBKhpYRuxzuP6rLy3jBWh0YxHWn/bAlycqmP2z4yB6a5PbLCg8HML
         9I9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GG0Un5wE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q55si8539999qtf.382.2017.07.14.09.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 09:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GG0Un5wE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dW3TB-0005z3-HI
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 12:29:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3T6-0005xo-L2
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3T5-0000US-PP
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 12:29:28 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dW3T2-0000Tv-1M; Fri, 14 Jul 2017 12:29:24 -0400
Received: by mail-qt0-x241.google.com with SMTP id m54so10544490qtb.1;
	Fri, 14 Jul 2017 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kZCFcsHIpixQb6ZlMsIrjl9ILL/RlmK9DZoSWZD/h0E=;
	b=GG0Un5wEE0QPrgatVd06eFvjkZt7lNsYB6i9Jcsq1UVX2MDQvmTGSqV/xuU1CGh3XL
	Bg6Ya5b6Wy3jX65IdnFGCRBMvbxRdpCUI3efVor7pLrVnXYeFzFl0iCYG97Rfr45VsuK
	7Bdjv+pZIWLZhUPYN15oweSwMiJKPxTJVksKENYQvdpm+0EQ6V7ZSMSryy1minuNQ97c
	f0BW9LgmxYt68myGP4yH5j4mV6HiaTxs9aB56LiS86ThCWZ8tKpe9/9TiiUkGwgQLwJ2
	s9gkxs7/sBDDEi3VBCGZYudx93OoBU0+Yz1+qyRWng5GhU+08lF8s+AIuopHXIhbMc7E
	A76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kZCFcsHIpixQb6ZlMsIrjl9ILL/RlmK9DZoSWZD/h0E=;
	b=rDyv4zjWiScgA9+y790xJpIJ87NjOIdQQJhNw8a5hO4HfNtouTQII1PdqaP7yneFpQ
	Bx0dbw+uK7BQ5Q0utxyBRdoIAhmPo6lIaA5Ny99nNRzB6GasHRM+if59kWLOzakgnIFr
	nBEKMffKiaKmkkEGNp8VZGRMoJihbIebjHwxCiPg2CEIMotkYoBNvCo/8pitV6qOESmf
	/0n35O0EsELOocoBts9okMpG2us6qTDbD1yUm6BETuQbo0l5ToIKygDlzGuAMS/oU05p
	ar73bP88Nx7jG6TSQNhZCh2GTWJjIAPpmre90SvqALsWYMimZQUbK6bHAlz2fM9RdTRS
	99AA==
X-Gm-Message-State: AIVw111nLWp0UuqONc5A+LDzpAmHqvEHXRKY1r2TJVASdYTuokS1HJ2m
	5IkgujvU/tu5PA==
X-Received: by 10.200.8.29 with SMTP id u29mr13054554qth.233.1500049763291;
	Fri, 14 Jul 2017 09:29:23 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	n21sm6795917qkl.51.2017.07.14.09.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 09:29:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
	<1500029487-14822-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ffe6736-841e-a451-f0e6-c32b36302a0c@amsat.org>
Date: Fri, 14 Jul 2017 13:29:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500029487-14822-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
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
Cc: Alistair Francis <alistair.francis@xilinx.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VE8awMcMPAWG

Hi Peter,

On 07/14/2017 07:51 AM, Peter Maydell wrote:
> Implement a model of the simple "APB UART" provided in
> the Cortex-M System Design Kit (CMSDK).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/Makefile.objs            |   1 +
>   include/hw/char/cmsdk-apb-uart.h |  78 ++++++++
>   hw/char/cmsdk-apb-uart.c         | 402 +++++++++++++++++++++++++++++++++++++++
>   default-configs/arm-softmmu.mak  |   2 +
>   hw/char/trace-events             |   9 +
>   5 files changed, 492 insertions(+)
>   create mode 100644 include/hw/char/cmsdk-apb-uart.h
>   create mode 100644 hw/char/cmsdk-apb-uart.c
> 
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 55fcb68..1bcd37e 100644
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DIGIC) += digic-uart.o
>   obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
>   obj-$(CONFIG_RASPI) += bcm2835_aux.o
>   
> +common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
>   common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
>   common-obj-$(CONFIG_ISA_DEBUG) += debugcon.o
>   common-obj-$(CONFIG_GRLIB) += grlib_apbuart.o
[...]> diff --git a/default-configs/arm-softmmu.mak 
b/default-configs/arm-softmmu.mak
> index bfd2a88..d128e9d 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -96,6 +96,8 @@ CONFIG_STM32F2XX_ADC=y
>   CONFIG_STM32F2XX_SPI=y
>   CONFIG_STM32F205_SOC=y
>   
> +CONFIG_CMSDK_APB_UART=y

I'd prefer:

CONFIG_CMSDK_APB_UART=$(CONFIG_MPS2)

> +
>   CONFIG_VERSATILE_PCI=y
>   CONFIG_VERSATILE_I2C=y
[...]
