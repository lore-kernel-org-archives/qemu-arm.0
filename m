Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp208583wrt;
        Wed, 2 Jan 2019 06:42:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ts5By22NHYsx4mskY5SnD3xUsLlhj2nTmEshOHRImZJfAXwlLQTX23tGTq35ru6nOxLpn
X-Received: by 2002:a37:bf81:: with SMTP id p123mr5422320qkf.125.1546440158675;
        Wed, 02 Jan 2019 06:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546440158; cv=none;
        d=google.com; s=arc-20160816;
        b=rSHWkczCJt74tzStsZCMKTlKMw2J1u1Ci3pcAuxR74xuq4sm7isaNvgyKYsH/uWBkS
         j2FV9emgazfMu0FMQmQ4JyMWEvp8ol7G8UqRLJF1sMa5wOSjCwLft5eSx9Vj8GjNU8f9
         bit4l4SAiozgdE8GGBW2XEFAG2mJEAKdLG05s3bh1XsvW5loc/7UdPtgeepw+c1gQ/Nf
         jMQ3NaadEi9oduaYYJu+NeI9VAWGudUmJxR4x7rZmEDlaAb3eyKEueaVYpHIO1RTci9X
         Vok8pYWtZvRoqipZPJqpPgrBppHsCPW8FOGSMm9M7nxaodbaLmej3RJ9cgLZ3HoMAn3I
         /z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ul8clbLHyGKs0+nCYS3U6SmOn7iqTBkE1WFP6uarbZk=;
        b=0qkqtC55Qw99sE1fv7LKkBeQDI1rvaVH2AhfJoEN+0RoYj4ofXHYGBe0ELkuNQATjd
         /2j0PvBXI+LvJUeRQ5FsOUiPaARqlnQWnUVoDCDAAQO8vx1xckyv7WgalrTW66Cxk9gV
         eBY5cJ07jrN7VvqxMx8NU0pSuAwHYH5rG/35tuYfj9O1AYQDCoUVlXciyXqRD9IIIkWO
         +g+YJEkPLoDPgx0SLY0v2JfHWwb+Wl7xKmy+upXHonorgh5DrryvjNVsa00mVHT2rrOR
         QaztNkQIJztH3TcZbpMWBDAh/aBQWkB6mejk1vpYXV9G0UOYX7MB0Bw/38Lglqk7u5W7
         6bZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si6365242qvq.61.2019.01.02.06.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Jan 2019 06:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gehjC-0006WH-94
	for alex.bennee@linaro.org; Wed, 02 Jan 2019 09:42:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gehiy-0006W7-22
	for qemu-devel@nongnu.org; Wed, 02 Jan 2019 09:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gehiu-0000wA-TT
	for qemu-devel@nongnu.org; Wed, 02 Jan 2019 09:42:23 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gehiu-0000vc-Mk
	for qemu-devel@nongnu.org; Wed, 02 Jan 2019 09:42:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id d15so26818229wmb.3
	for <qemu-devel@nongnu.org>; Wed, 02 Jan 2019 06:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ul8clbLHyGKs0+nCYS3U6SmOn7iqTBkE1WFP6uarbZk=;
	b=GJimqM8WEOTXL/kEhhYuO6hMrTV00S8PsYTZA23ZmmdpLojEt1WftJ5ApZTZcKp4zj
	uypKu+B01AyfLqU1hUWV6w+Gb9nk9GNCsHVOO+P7HO5sTIVC4rzttcgVvUpuRyMDrwqN
	Pvt5zlOHu7J5PpasrAcbCxhgfpZaLz0mJPYNi7HJbsncPLOYKxVcxzvi0glNgPe5UBCu
	giHWJsW/LqkXnW39yaGT5GO2kwQ87WV5/JB89tJeJXL1wKCH2QKYOTOIGMrBaS/hgAFJ
	Blz0f3k6sOg+bwjmzyQI4RwwVnEfzteWV4OrpP6+eCTPJR7rPKXwuaI8HcmTTQKOv2Zg
	3/mA==
X-Gm-Message-State: AJcUukflO0UEThDCFXbhzwKczJwz00BvfgqZIr62XxVL4Wu3/TvTZU5z
	zZHvxz9pru1GAhFwf66m/7yZog==
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr34893400wmf.77.1546440139528;
	Wed, 02 Jan 2019 06:42:19 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	k135sm63546015wmd.42.2019.01.02.06.42.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 06:42:18 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1546433583-18397-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <10359753-9573-629b-5c76-7c148e66cb91@redhat.com>
Date: Wed, 2 Jan 2019 15:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1546433583-18397-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add ARM-related files for
 hw/[misc|input|timer]/
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2jx0c4WkbM0

On 1/2/19 1:53 PM, Thomas Huth wrote:
> Some of the files in hw/input/, hw/misc/ and hw/timer/ are only
> used by one of the ARM machines, so we can assign these files to
> the corresponding boards.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 180695f..693abdf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -510,6 +510,7 @@ F: hw/intc/arm*
>  F: hw/intc/gic_internal.h
>  F: hw/misc/a9scu.c
>  F: hw/misc/arm11scu.c
> +F: hw/misc/arm_l2x0.c
>  F: hw/timer/a9gtimer*
>  F: hw/timer/arm*
>  F: include/hw/arm/arm*.h
> @@ -582,6 +583,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/integratorcp.c
>  F: hw/misc/arm_integrator_debug.c
> +F: include/hw/misc/arm_integrator_debug.h

OK

>  
>  MCIMX6UL EVK / i.MX6ul
>  M: Peter Maydell <peter.maydell@linaro.org>
> @@ -601,7 +603,9 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/mcimx7d-sabre.c
>  F: hw/arm/fsl-imx7.c
> +F: hw/misc/imx7_*.c
>  F: include/hw/arm/fsl-imx7.h
> +F: include/hw/misc/imx7_*.h
>  F: hw/pci-host/designware.c
>  F: include/hw/pci-host/designware.h

OK

>  
> @@ -635,6 +639,10 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/nseries.c
> +F: hw/input/lm832x.c
> +F: hw/input/tsc2005.c
> +F: hw/misc/cbus.c
> +F: hw/timer/twl92230.c

OK

>  
>  Palm
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> @@ -642,6 +650,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/palm.c
> +F: hw/input/tsc210x.c

OK

>  
>  Raspberry Pi
>  M: Peter Maydell <peter.maydell@linaro.org>
> @@ -678,6 +687,7 @@ F: hw/display/tc6393xb.c
>  F: hw/gpio/max7310.c
>  F: hw/gpio/zaurus.c
>  F: hw/misc/mst_fpga.c
> +F: hw/misc/max111x.c
>  F: include/hw/arm/pxa.h
>  F: include/hw/arm/sharpsl.h

OK

>  
> @@ -688,10 +698,10 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/arm/sabrelite.c
>  F: hw/arm/fsl-imx6.c
> -F: hw/misc/imx6_src.c
> +F: hw/misc/imx6_*.c
>  F: hw/ssi/imx_spi.c
>  F: include/hw/arm/fsl-imx6.h
> -F: include/hw/misc/imx6_src.h
> +F: include/hw/misc/imx6_*.h
>  F: include/hw/ssi/imx_spi.h

New models for the MCIMX6UL EVK might eventually match here.

>  
>  Sharp SL-5500 (Collie) PDA
> @@ -802,7 +812,9 @@ R: Joel Stanley <joel@jms.id.au>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/*aspeed*
> +F: hw/misc/pca9552.c
>  F: include/hw/*/*aspeed*
> +F: include/hw/misc/pca9552*.h
>  F: hw/net/ftgmac100.c
>  F: include/hw/net/ftgmac100.h

OK

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
