Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1580391wro;
        Thu, 1 Nov 2018 19:52:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eU7N8iH4wkRBsVGxhMGI0ejbP3/uMd40Imoda2VQP4bID6HeLq8rPbFFGpydr2ULYF7Ao+
X-Received: by 2002:a37:3c9:: with SMTP id 192mr9181626qkd.113.1541127170763;
        Thu, 01 Nov 2018 19:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541127170; cv=none;
        d=google.com; s=arc-20160816;
        b=xM+m2HERNIQtszm0s+RG1OABrSrM6OcPvdV5wn2PNdOwisKRXDEVtSSa+B8aTT6Bb3
         uyuy81u6+NVIeYqqihNXYDtq+jVg9Zcy4BnVURGvkBEX5tVLPz1u6kc2/HWJyNNuMeGB
         cwgzE01glYOFIIEgqhiGAo/kOMVGJvnp0QGt95C0W1388bjJUHuCyp3PyZ1yWrJSOZkv
         F/JmOrMHT6r/+tBdusw/53levQidCXXg+t9zDz1u81ar05UBJ9typEpSmQm4f5W8K1jO
         B1ZMIYTsTeZ2H3gin1RyGZQfcnVNDnelYj3Bo0bHk8OmhXCRNkZp3gD3HPXlClH+oeaj
         fdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=7gOXUROybBczvox7hUsnDKTIaGPP0vmsEav0vGSzmn4=;
        b=qt3zHgCQu01rHO0DCDuYc1Ml5LGGlLY0RBisj01SB0tUHz9p5QPTrhsdOM7jfch2Rp
         zDNhpJB5ZRECEUA+QL9dJq+pOJia4mQl8pvGjxca3apqOmno6rYgH/4Ob3keU/HKzX++
         4fFAw8dSTf18jq1P5iw+x2D+uhAKfHLm+mBmybxds1sye8e9mdQ7RvY42g3q8ZAwjf7P
         pRg0pUIN51DzYgRFoTSXzpi/LoSUwx7KvcHeTMHv+XpQqdJVD0lkE58gSj0I4Yq+70Qn
         Z2j69HxmHhu3PEju8jnM/5ILqkcsaYoLi3Kk+caTJbCVeBrd8oIwOHfHLnpPlbc/VY74
         lfaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NOvX7s5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m60-v6si12261743qtd.187.2018.11.01.19.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 19:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NOvX7s5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIPZq-0003fw-BY
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 22:52:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIPZg-0003X7-H4
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 22:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIPZc-0004RC-TS
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 22:52:38 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gIPZY-0004Of-Vi; Thu, 01 Nov 2018 22:52:34 -0400
Received: by mail-pf1-x441.google.com with SMTP id z2-v6so310803pfe.2;
	Thu, 01 Nov 2018 19:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7gOXUROybBczvox7hUsnDKTIaGPP0vmsEav0vGSzmn4=;
	b=NOvX7s5k1Seex4QS+pBv6xjk/Ix9IpS4CKp6oAhciJD2Q/EBO6lyjowakh8CEoFj24
	TxFJg6dNZ3wR2Is/PHuYv0CstHQBPuhLzn+yNKAoNF5ZNE1gplr8Ln17e4Ha6YNOPode
	26MBBru2lU6j5P03CR2lerGZdF2MTw66kaO1ICgtkfgjj2KkvEca4BUjngwAXfYRKGHt
	z7flUZlX8aJf/RDJ1/6EJZByd04VQAWukBcTm965aAdAhLLCwvWarEgH7O8vEBq6q3qr
	uRFCrEi26iNCp2ACTAILWT5rTVubDpuuqFwO7VslCLHujtSTKh8nEtntM84pUZ5s5ArV
	4iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7gOXUROybBczvox7hUsnDKTIaGPP0vmsEav0vGSzmn4=;
	b=olK2D31TFe+R5m2C3zm/W5y9sT7RWjj4bvwZWSxFtFPZW+KyupNbXQecvaYOu/B3YZ
	FlNFYAGWKoypYhFi2Tc2ky1KJxWuFy2GYeA2WP/sYRUG4HIB02C84SGbtFpSqYAzJ34i
	e+jBqhaoH7YjU1ZOzn/NgFWNZgRGkZNyIxa+4i+Bmj5FKH5OjebKFIF9mxFoI0Oprq/e
	y/9ZNdHBIwUc8zbGaOy0vi7RY0LFhXf6tRDmJc2rNdccp8T+LoSPcPps/55g/T+HQeaS
	ZAqgEnM+Ba8c0E96FFD3KorK1lIUd822lGwgaCOIvIVxRmeF9cps9Yp6YEhuf9L3iUZT
	P92g==
X-Gm-Message-State: AGRZ1gLCtZ3UsroKWH9XaUzjgbOhAnDzOQQmhEtrcuui7VKBlX8sPF6Q
	uYwHZGk25PWsk5krHcnj7/1gNBP1
X-Received: by 2002:a63:9742:: with SMTP id
	d2-v6mr9493319pgo.278.1541127148835; 
	Thu, 01 Nov 2018 19:52:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	y71-v6sm46798769pfk.70.2018.11.01.19.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 19:52:27 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b32bf2a0-08ac-6b16-6372-455f9a239f9f@roeck-us.net>
Date: Thu, 1 Nov 2018 19:52:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 0/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Md+K2uHAONb

On 11/1/18 5:12 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is a mix of a previous work I had for the raspi, and a patch from
> Guenter: https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.html
> 
> The final patch keep Guenter ideas and comments, but is mostly a rewrite.
> I dropped the A2W code from this work, it doesn't seems unuseful to me.
> 
> Guenter can you test this series?
> 

arm/raspi2 works, but aarch64/raspi3 stalls.

[   45.683302] Run /sbin/init as init process
[   50.745961] random: dd: uninitialized urandom read (512 bytes read)
[   77.478266] Writes:  Total: 2074828  Max/Min: 0/0   Fail: 0

... then nothing else until I abort the session.

This is with the series applied on top of master.

Guenter

> I kept Guenter S-o-b and (C), is that OK? (Guenter?, Peter?)
> 
> - patches 1, 7: obvious updates in MAINTAINERS
> - patches 3, 4: simple cleanups
> - patches 2, 5: add UNIMP code
> - patch 6: add the cprman (KISS init values from Guenter)
> 
> Peter: can you take patch #1 for 3.1?
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (7):
>    MAINTAINERS: Add an entry for the Raspberry Pi machines
>    hw/misc/bcm2835_property: Handle the 'domain state' property
>    hw/arm/bcm2835: Use 0x prefix for hex numbers
>    hw/arm/bcm2835: Rename some definitions
>    hw/arm/bcm2835: Add various unimplemented peripherals
>    hw/arm/bcm2835: Add basic support for cprman (clock subsystem)
>    MAINTAINERS: Volunteer to review Raspi patches
> 
>   MAINTAINERS                          |   7 +
>   hw/arm/bcm2835_peripherals.c         |  42 +++-
>   hw/char/bcm2835_aux.c                |   2 +-
>   hw/intc/bcm2836_control.c            |   4 +-
>   hw/misc/Makefile.objs                |   1 +
>   hw/misc/bcm2835_cprman.c             | 277 +++++++++++++++++++++++++++
>   hw/misc/bcm2835_property.c           |   8 +-
>   hw/misc/trace-events                 |   8 +
>   include/hw/arm/bcm2835_peripherals.h |  11 ++
>   include/hw/arm/raspi_platform.h      |   6 +-
>   include/hw/misc/bcm2835_cprman.h     |  28 +++
>   11 files changed, 387 insertions(+), 7 deletions(-)
>   create mode 100644 hw/misc/bcm2835_cprman.c
>   create mode 100644 include/hw/misc/bcm2835_cprman.h
> 

