Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1241882wrw;
        Tue, 6 Nov 2018 10:50:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5e+HN4c8AxmFby3m27KPzJhZNQ1YvYdnpfC5C/QrOuGHoBp7QXUGCfY+HVboHJKuZVeTTMV
X-Received: by 2002:ac8:12cc:: with SMTP id b12mr26347338qtj.90.1541530200990;
        Tue, 06 Nov 2018 10:50:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541530200; cv=none;
        d=google.com; s=arc-20160816;
        b=e1T5Z159fWHQFwhrj2xSGay7506Mdn1xq92wonUhwqwBBsaSMTMIhWikFVT+Htkbet
         UCG74h2uHd0WrtAsuZuPd/Jm4VEngipc+P4Esi7HWu9EDMklzqsHZdj6Bu1k839M9S/O
         XTzM3oqdHM8jVES0iDdUReQzjy6KlHFIWQyJXsqSAB/bReRrNARzjETknFY/+4Uez/m3
         PmKCoYCGSHcS8E5SYnWkRoUAN7mkz+oDilrIP9ypKF1jQoxpOnnhGvjR4qmn2s+SPVKh
         /EriRDJYTg4ULCdH+JKO1LFQswgtY/4rp802Q/UA/LdltPYMK4V35YV2u+ayvMcDlEVo
         C26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=46qg5aXDiv7PjdmU6UfoMMpfKC2IRJ3mC45xhsOxMgA=;
        b=ASR2B7LfUXHWd/KV0uSzZwvBpBYm6eDYLZdiLi7lZIkTd2oofxxbsVkTXMKm+YNreb
         E6XRCrRDRQjNHDpzI9GEVPhaiCN9CBxeK8GmLv/GRieaxBFGXvOdf+i8/Boa1E91qiO1
         ZkT7yWXt5inVXycXh5SfUFgS/cLqypzntYdXPIvh+RgHt/M1fc3hwMIdpZ4TZsmZotY1
         fkMSZCCi2kxHqYZd2hx/erYw46cEBeOHwzfmiktClwAzv6uUdZg2itYW27JpmOiSmU7d
         2J5+LWpMTXtL9kT5dLfRXAkdSbJ1wjoc5gnGABW713vVMhm2WuOU1/YxfhyUCj9s293F
         DaMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g53si7374623qvd.37.2018.11.06.10.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 10:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK6QK-0006K9-6p
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 13:50:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gK6QA-0006Jy-2m
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:49:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gK6Q6-0001UC-Fc
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:49:49 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gK6Q5-0001EU-UK
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 13:49:46 -0500
Received: by mail-wm1-f66.google.com with SMTP id r63-v6so12014892wma.4
	for <qemu-arm@nongnu.org>; Tue, 06 Nov 2018 10:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=46qg5aXDiv7PjdmU6UfoMMpfKC2IRJ3mC45xhsOxMgA=;
	b=kjYW7AAOc1eL1nczN0aCcMSeW6RLU6LUINJzgWXbSPuyrIMp8/iTz3ZIg5qXic+UlF
	kfyL5U4kk68ITqfs1QPE7dBbc8Mn/jD0EwQugXrYTwQABekwdKd9alEI8YctVCIlqP3m
	gI+8yB05ccVZGcMttfh34MSOzkO/qZWGJMr0I+Rgf3ru+mq4yyzeJap7z7dh5S8GfIY/
	LLCOvCmgM/iHdTOWRQ5uEmhZLxOlJzdtW3poS4r8yaY2icRn6ys30WnCW1+Eo/TVKCSr
	9zIDiNSf7FRcweyzoE5bkuurDnnpY2ubkCYPAEk31khL9UCIAV+hfwsDCVp9JzirU3Nw
	iUGQ==
X-Gm-Message-State: AGRZ1gLoYB+IskZHzc28YL+xq084VSsMS/Mxm4/OYu2nh2fFRT9d4qR0
	iDsaTq1mYad1ocgduDwAgtYQ0w==
X-Received: by 2002:a1c:aacf:: with SMTP id
	t198-v6mr3135354wme.108.1541530174594; 
	Tue, 06 Nov 2018 10:49:34 -0800 (PST)
Received: from [192.168.1.74] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	t2-v6sm2355573wrr.12.2018.11.06.10.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 10:49:33 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
Date: Tue, 6 Nov 2018 19:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541528230-31817-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for
 the 'collie' machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JuEjb0FJPLCh

On 6/11/18 19:17, Thomas Huth wrote:
> There is no active maintainer, but since Peter is picking up
> patches via qemu-arm@nongnu.org, I think we could at least use
> "Odd Fixes" as status here.

This looks more as "Orphan" to me...

Regardless the one choosed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0499e11..471cf72 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -592,6 +592,12 @@ F: hw/*/pxa2xx*
>   F: hw/misc/mst_fpga.c
>   F: include/hw/arm/pxa.h
>   
> +Sharp SL-5500 (Collie) PDA
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/collie.c
> +F: hw/arm/strongarm*
> +
>   Stellaris
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> 
