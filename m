Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5620679wrw;
        Wed, 14 Nov 2018 03:57:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5dRblzaI70fXBO1cCATo0lhcw6xj6Mh8CYnXHWvAGNHvsVmj5loYS+iI9IkWMRi17Fy8efH
X-Received: by 2002:ac8:7153:: with SMTP id h19mr1310203qtp.92.1542196675332;
        Wed, 14 Nov 2018 03:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542196675; cv=none;
        d=google.com; s=arc-20160816;
        b=I9kP0BtPGV/oEoZUs6Pap79fqBqnveVkac5m/RcWO/itHFk+56b/cJSNAd0Onr5on0
         joUwYcHopFWO6yOxPsCXXtrr19X4B4HdEOume8g/GJVHRwSLQFYI9Ln4UkqLhv/RxLRx
         a/sADnQzToXYKhl/0T+6GMTZcBXJ3T49liRxQcP/5bdKD5lHSTXagOIl7URj486lC6b/
         4banf50d7vr7IjTO0a8bP3pkoyQ5yx0m2FmEyKg1VKK2HRbH3P2kCtkK5+PGHj9bOOyn
         Lr2403h9x/61+G5P+AIy/jG8DNLdzdtrvpYmL6TPnnqgB9waR6/Y6tqpAXb89aeUtQE0
         aeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=oKmE8CBtkqOsKcCVVbiT7YOYFsZWIzNDau65WFzKq+o=;
        b=xBrAM7YIY1EO7NGPo4psGdoUinu/x/dxyxAec0GHhdElFRMFVUPfIsBQOs/qlzfmnc
         x1Bzhdkqcct3ShDXMk5JJPYlkpDz2PvdEZpmuV3cLlqY3uGUkklLtA260Or/g3E8VNn3
         zFPQFdgKgYf7Qgloe2lXR8vjNqM4nsAIAFSjGRQc6wpfzlJYQ6+hWJt7drsSwU6/cD8C
         JHhPAJBaMgI6SMK8BdASBIGYTBVbsl+xKRcv8JXzHJBnuNkDf4bcaT4Y9oVUl0UnPzDW
         /XiLgvFlRpmbCJPnqYvoMuRrV7dUe+0obAN05R/qYqQld29f5zdnfL7MB2ojjTBK3vD0
         4Vaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si12875120qvh.120.2018.11.14.03.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 03:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMtnu-0006L7-R2
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 06:57:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMtnb-0006HP-EX
	for qemu-devel@nongnu.org; Wed, 14 Nov 2018 06:57:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMtnQ-0000nT-6O
	for qemu-devel@nongnu.org; Wed, 14 Nov 2018 06:57:29 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36885)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gMtnO-0000m2-UL
	for qemu-devel@nongnu.org; Wed, 14 Nov 2018 06:57:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id j10so2755054wru.4
	for <qemu-devel@nongnu.org>; Wed, 14 Nov 2018 03:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oKmE8CBtkqOsKcCVVbiT7YOYFsZWIzNDau65WFzKq+o=;
	b=Y2Uv77RwDBR/PzKbCERx0NMZuV03owqH1gA5pHbTdz8ybE83YjbWcciDkdvBYYVCaO
	27xY09IC4EXeTRtQaOFhA6JKiMPOdzVUInwCF+Xg8or/p28C0Jb3LV7GBh/nWS3q1JjX
	ghW5TF03+3As3BNdeUZTwsRzaJXGtqS9xwznPWJKlE63EhwRZNXqqk9X2oFql6bPusRW
	xNOpR3mgHpQIDfQU6vYaEto3LISJaZy3p4IMpvLSyVVrUA+2xl/D+8us8cN9jlt5yDxC
	E4X+52P0OPJGrryLKXkO2FYYCZx+6keqJDAHt6onfaM1zisAoEn3ajrW7l64ejdsKjS0
	e4Ng==
X-Gm-Message-State: AGRZ1gLXNclpwwZ1+ySlUVCuibHTmuFj5DjyKAXOA/rP8V3OrZqal1gg
	MSrKBENJFZWfb5GnWq14BMZI/A==
X-Received: by 2002:adf:fec3:: with SMTP id
	q3-v6mr1520845wrs.313.1542196640232; 
	Wed, 14 Nov 2018 03:57:20 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	h127sm1573828wmd.31.2018.11.14.03.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 03:57:19 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1542184999-11145-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ba66e6c-2eeb-2352-252b-75487ad91916@redhat.com>
Date: Wed, 14 Nov 2018 12:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542184999-11145-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add entries for missing ARM
 boards
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGQ09QOa43A2

Hi Thomas,

On 14/11/18 9:43, Thomas Huth wrote:
> Add entries for the boards "mcimx6ul-evk", "mcimx7d-sabre", "raspi2",
> "raspi3", "sabrelite", "vexpress-a15", "vexpress-a9" and "virt".
> While we're at it, also adjust the "i.MX31" section a little bit,
> so that the wildcards there do not match anymore for unrelated files
> (e.g. the new hw/misc/imx6ul_ccm.c file).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 65 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b8db61..dd8ac65 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -521,14 +521,15 @@ L: qemu-arm@nongnu.org
>   S: Odd Fixes
>   F: hw/arm/gumstix.c
>   
> -i.MX31
> +i.MX31 (kzm)
>   M: Peter Chubb <peter.chubb@nicta.com.au>
>   L: qemu-arm@nongnu.org
> -S: Odd fixes
> -F: hw/*/imx*
> -F: include/hw/*/imx*
> +S: Odd Fixes
>   F: hw/arm/kzm.c
> -F: include/hw/arm/fsl-imx31.h
> +F: hw/*/imx_*
> +F: hw/*/*imx31*
> +F: include/hw/*/imx_*
> +F: include/hw/*/*imx31*
>   
>   Integrator CP
>   M: Peter Maydell <peter.maydell@linaro.org>
> @@ -537,6 +538,28 @@ S: Maintained
>   F: hw/arm/integratorcp.c
>   F: hw/misc/arm_integrator_debug.c
>   
> +MCIMX6UL EVK / i.MX6ul
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/mcimx6ul-evk.c
> +F: hw/arm/fsl-imx6ul.c
> +F: hw/misc/imx6ul_ccm.c
> +F: include/hw/arm/fsl-imx6ul.h
> +F: include/hw/misc/imx6ul_ccm.h
> +
> +MCIMX7D SABRE / i.MX7
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Andrey Smirnov <andrew.smirnov@gmail.com>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/mcimx7d-sabre.c
> +F: hw/arm/fsl-imx7.c
> +F: include/hw/arm/fsl-imx7.h
> +F: hw/pci-host/designware.c
> +F: include/hw/pci-host/designware.h
> +
>   MPS2
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> @@ -570,6 +593,17 @@ L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/palm.c
>   
> +Raspberry Pi
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Andrew Baumann <Andrew.Baumann@microsoft.com>
> +R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/raspi_platform.h
> +F: hw/*/bcm283*
> +F: include/hw/arm/raspi*
> +F: include/hw/*/bcm283*
> +
>   Real View
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> @@ -591,6 +625,19 @@ F: hw/*/pxa2xx*
>   F: hw/misc/mst_fpga.c
>   F: include/hw/arm/pxa.h
>   
> +SABRELITE / i.MX6
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/sabrelite.c
> +F: hw/arm/fsl-imx6.c
> +F: hw/misc/imx6_src.c
> +F: hw/ssi/imx_spi.c
> +F: include/hw/arm/fsl-imx6.h
> +F: include/hw/misc/imx6_src.h
> +F: include/hw/ssi/imx_spi.h
> +
>   Sharp SL-5500 (Collie) PDA
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> @@ -604,6 +651,12 @@ L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/*/stellaris*
>   
> +Versatile Express
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained

Shouldn't this be 'Supported?'
"Someone is actually paid to look after this."

> +F: hw/arm/vexpress.c
> +
>   Versatile PB
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> @@ -611,6 +664,13 @@ S: Maintained
>   F: hw/*/versatile*
>   F: hw/misc/arm_sysctl.c
>   
> +Virt
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained

This one is certainly 'Supported'.

> +F: hw/arm/virt*
> +F: include/hw/arm/virt.h
> +
>   Xilinx Zynq
>   M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>   M: Alistair Francis <alistair@alistair23.me>
> 
