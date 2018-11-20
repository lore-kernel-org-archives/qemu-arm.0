Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1008450wrt;
        Tue, 20 Nov 2018 12:24:10 -0800 (PST)
X-Google-Smtp-Source: AJdET5epaMRowAJ6OeDTACQaoBSQXk9E3aLiqHT3IIC0j9Biy5mfI4fWF/UvRbNs7wSIY82AKUI/
X-Received: by 2002:a81:85c5:: with SMTP id v188mr3546257ywf.51.1542745450723;
        Tue, 20 Nov 2018 12:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542745450; cv=none;
        d=google.com; s=arc-20160816;
        b=BsY9fcgM8eeZLnXjyYZ1ahA8zCJijedxzhut+KzfsuwKT1+xJTXz3cSA4MMyRUMo6S
         FRc/EpLgEOKC50OUSRkQ2e8vFEpsvkDtt5XOYiyXeiP+i1L3VCw82YX64k1E+I0djx38
         9tHEGq8gjawf3jTcpH2dkAFrOGUe1A1ufZXerUcu7ZXEBS5KSKbNXCinv6O1sNQsBgJs
         ujeE8uCS6PnysMoRe/fx8LZJCqwA0Nm+WFGucC4ObV9e+OZOxePPtwYAtVO3pCqjiFlD
         ivh6M2sK8E6Dz6OJ3gr2NN8z+AcytWsOS76qVtpLHmHi3ZjJ6REixMcxgNKo4h8xi51r
         OiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=MPNAAPvqXle01eElIROUXvsazRGLtnCxktUzOgbxkEs=;
        b=mtKwLkmUhOvaN3XU3O1PB6zronTF6Tt7imI/lRVjKL4mVHZ48Ddt+VbZqlKwzwo7Qw
         3BsCvr7e5oPwdg+LikIgDzVHFyZbJNrbRmcxSTGJvjm/0K753uWsRKMQTHt6KFePrtoZ
         5APBvEiDRPu9yQZT3wsgF59HMn9FKSAwpBfBlmusuOjx1CvBtv85WI+4n2D6RMJ+nwCa
         A9iYzsVF6IzZwfwlqnETXuhC8+FPfn6CGf1k17MftoL5SjLHRgcyD7O0Y6Rs5iCjXhLc
         eaCYscxtJzkCzVg6vpoSdTXc2nBu+kqIZlQ9DhhlzhPWlkdhi+VWEi91HbgS20QxVQxr
         /atg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k189si11973472ywc.301.2018.11.20.12.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 12:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPCZ8-0005l4-6E
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 15:24:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPCYu-0005kN-7w
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 15:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPCYr-0005do-H2
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 15:23:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPCYr-0005cA-9r
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 15:23:53 -0500
Received: by mail-wm1-f65.google.com with SMTP id 125so3396369wmh.0
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 12:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MPNAAPvqXle01eElIROUXvsazRGLtnCxktUzOgbxkEs=;
	b=mkHKdMEj90XormqWBmw48FVWWdiJEqN4Yo7+PITCZzP/LotyUF4KMD1Ck0dhIOZiCH
	X4NUtmyeN0mOY5U5+7fmt3h1ZWYGnh1qcPjPthZWisomm5MQYxYYSHg1f51PEEuLGFAv
	+oDxeHmv9qVyxCXdOTVhnY24P2BPNk5lhCOGVoYCGI68A7pBbiT7j48hyXwsEcrjA1lq
	qhuU1GkPDF2PtZ+9rW6HaqxSx35C9ByuSNjFznESsPNpUdyvSjUkYXZtWk3LXG+mxz5A
	J6LlMTAqIStN+1pde2FyQID8hX/mYKtCtjAln+9A8wIiu4gWwJUc8J+IT/ulpW5M5IdZ
	YZDw==
X-Gm-Message-State: AGRZ1gJo4gbPgyI1HMMbJTdazelKyP7vc5vmyEBoJZtBjLRYrM++Jfrd
	X5aq4ABBccEBTiNSl9eVLW1Qsw==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr3279145wmg.17.1542745432189; 
	Tue, 20 Nov 2018 12:23:52 -0800 (PST)
Received: from [192.168.1.36] (35.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.35]) by smtp.gmail.com with ESMTPSA id
	125-v6sm40095796wmm.25.2018.11.20.12.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:23:51 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1542735761-16176-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3bfff029-f88a-ef68-846c-1cacd0800d26@redhat.com>
Date: Tue, 20 Nov 2018 21:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542735761-16176-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] MAINTAINERS: Assign some
 more files in the hw/arm/ directory
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
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ffPSilIJb4Y/

On 20/11/18 18:42, Thomas Huth wrote:
> I apparently missed some more files and even a complete machine (the
> "imx25-pdk") in my previous patch... but now we should hopefully have
> a completely coverage for all available ARM boards.
> 
> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Dropped smmu* files from this patch
> 
>   MAINTAINERS | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406..36ffc01 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
>   S: Odd Fixes
>   F: hw/arm/gumstix.c
>   
> +i.MX25 PDK
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/fsl-imx25.c
> +F: hw/arm/imx25_pdk.c
> +F: hw/misc/imx25_ccm.c
> +F: include/hw/arm/fsl-imx25.h
> +F: include/hw/misc/imx25_ccm.h

> +F: tests/ds1338-test.c

This last entry is weird alone (at least without the hw/timer/ds1338.c 
device listed).

This RTC is also used by the aspeed/realview/versatilepb boards.

> +
>   i.MX31 (kzm)
>   M: Peter Chubb <peter.chubb@nicta.com.au>
>   M: Peter Maydell <peter.maydell@linaro.org>
> @@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   L: qemu-arm@nongnu.org
>   S: Odd Fixes
> +F: hw/arm/raspi.c
>   F: hw/arm/raspi_platform.h
>   F: hw/*/bcm283*
>   F: include/hw/arm/raspi*
> @@ -641,6 +654,7 @@ F: hw/arm/z2.c
>   F: hw/*/pxa2xx*
>   F: hw/misc/mst_fpga.c
>   F: include/hw/arm/pxa.h
> +F: include/hw/arm/sharpsl.h

I think hw/gpio/zaurus.c goes there too.

>   
>   SABRELITE / i.MX6
>   M: Peter Maydell <peter.maydell@linaro.org>
> 

Regards,

Phil.
