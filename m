Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1080394wrt;
        Tue, 20 Nov 2018 13:44:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5dx8n0MCuBTE14DCeK7CP0fbviadUEcqdicew27secyQEyOJZ7SZLOlGh3muPAISU0T3lk7
X-Received: by 2002:a25:4cca:: with SMTP id z193-v6mr3655422yba.279.1542750261847;
        Tue, 20 Nov 2018 13:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542750261; cv=none;
        d=google.com; s=arc-20160816;
        b=jd7Q96wVb5YwXZKCwErgeWTkmVxpDd/S2WO5gaULaLRSL4i970nfZ8A0z8o1qfEwQx
         mkVXr4IEFa2NzzmMVsFboBzoXfZ1aul0F/fzgJssZiirFEhKslw5MTSSEFCEtSNPfZzi
         LVnc5iPwNNnytFRQC7dF1/mmfnj37qN178C45D2oYa6S5qBSLz7RXEWg100m2i+aL+eW
         s+5UC/iJFXaguooRQ/VvIiVdCv/gBBUxqVuxAfXX75qaUihiok7yDZ4JgmAhss6co0cw
         Ulb6mm5bN85xrMR3Brmjyjc+EEhfWhnCAPICA3aT63jsi9Ea3JC7YoateqVFGtIQiTD+
         +uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=prG+D6+wkLc8LyAG4pEQY0GYwm60KylvdypHCo04iwo=;
        b=J96ZD+oNxCMFdmJsYmyCTKnU0qek/2mH7chz0VFK8YsLodk7MfLFgmNn4pDiwT97EX
         TzlBzUb6S60XxbICpy++c901//EKIgCecaxSXLVCCXXL7EtBg/BNKFQjlYoIN3JtRnMF
         B2Kce99GDIFymrnCMRI8cSgHWLELlMJ9zgC324MDh2TsaUYmdVIqENtc+oOLACIJX6O2
         MNHZLMLKM8Ugo+7G5ga1l3/5AQ5h6FuEUKotHFuD8uIi4hCdMvdX7Ot6XSGQlP1iPIrn
         9z/gqtk4KU2GQXhZqclVnXpa4i6rgqODI72V9/Cs1pd/HOXtZDdR+DHEoEy34SZykTLG
         ZbQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si7432008ywf.353.2018.11.20.13.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDoj-0007Ny-88
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:44:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPDoE-0007Hz-6Z
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 16:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPDo9-0004XN-Fj
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 16:43:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45291)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPDo9-0004Vi-7e
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 16:43:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id v6so3517840wrr.12
	for <qemu-devel@nongnu.org>; Tue, 20 Nov 2018 13:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=prG+D6+wkLc8LyAG4pEQY0GYwm60KylvdypHCo04iwo=;
	b=bCYO4QDZdnAEaXRfVOJrnue1mGx3bevo8NbmZFryAYqSOhCzl9cw09iYxFrLEqs2it
	hjv4/c+LpiwneTO1Co3qkU4OoemIKKHuNqUPezLmHTX0Mjz+XCT1AcQ3eZfCBXqx8uF7
	HctRmT5olSkx9GbSxAoUGPTMeX4elkUcygAiUYzcJpRyBkmkv8SPaDMbkwLy3MmWYhSE
	PRWF1W8iGuM1kkQtukMbbTDTYu2cjR3I7noRL4pOuGbsflnwiaHGRB/bEBDBQB0oHBZJ
	5BxCjzrm4lRaByUVH0um+Ln9uAyfEKNQ9X3zO2647HzUVZypbFBHskpFbidyKGMbhzkb
	1maA==
X-Gm-Message-State: AA+aEWbMDyxF8SA38yZHLJt3fUEpsThI89GxXPTi+VOUucynsy821zPS
	HymBplOqqL19cvzWlTJ6QQXnT9HpCek=
X-Received: by 2002:adf:ee06:: with SMTP id y6mr3499662wrn.261.1542750224272; 
	Tue, 20 Nov 2018 13:43:44 -0800 (PST)
Received: from [192.168.1.36] (35.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.35]) by smtp.gmail.com with ESMTPSA id
	3-v6sm26262106wrs.44.2018.11.20.13.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 13:43:43 -0800 (PST)
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
	<20181119120820.29878-2-maozhongyi@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b623909-c4f1-e939-417d-b711e7ab8150@redhat.com>
Date: Tue, 20 Nov 2018 22:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181119120820.29878-2-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 01/22] musicpal: Convert sysbus init
 function to realize function
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de,
	Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hm0da66oIoxz

On 19/11/18 13:07, Mao Zhongyi wrote:
> Use DeviceClass rather than SysBusDeviceClass in
> mv88w8618_wlan_class_init().
> 
> Cc: jan.kiszka@web.de
> Cc: peter.maydell@linaro.org
> Cc: qemu-arm@nongnu.org
> 
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   hw/arm/musicpal.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9648b3af44..7ffcdbb097 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1147,14 +1147,13 @@ static const MemoryRegionOps mv88w8618_wlan_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -static int mv88w8618_wlan_init(SysBusDevice *dev)
> +static void mv88w8618_wlan_realize(DeviceState *dev, Error **errp)
>   {
>       MemoryRegion *iomem = g_new(MemoryRegion, 1);
>   
>       memory_region_init_io(iomem, OBJECT(dev), &mv88w8618_wlan_ops, NULL,
>                             "musicpal-wlan", MP_WLAN_SIZE);
> -    sysbus_init_mmio(dev, iomem);
> -    return 0;
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), iomem);
>   }
>   
>   /* GPIO register offsets */
> @@ -1720,9 +1719,9 @@ DEFINE_MACHINE("musicpal", musicpal_machine_init)
>   
>   static void mv88w8618_wlan_class_init(ObjectClass *klass, void *data)
>   {
> -    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>   
> -    sdc->init = mv88w8618_wlan_init;
> +    dc->realize = mv88w8618_wlan_realize;
>   }
>   
>   static const TypeInfo mv88w8618_wlan_info = {
> 
