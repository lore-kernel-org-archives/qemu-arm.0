Received: by 10.25.44.15 with SMTP id s15csp1478937lfs;
        Sat, 8 Jul 2017 10:13:23 -0700 (PDT)
X-Received: by 10.55.98.17 with SMTP id w17mr68423541qkb.106.1499534003424;
        Sat, 08 Jul 2017 10:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499534003; cv=none;
        d=google.com; s=arc-20160816;
        b=YkctxztiXj//hli42CB27BkGXU3EM+6qO9B8+TyPTqc4AUcLYKKFzj0h7364nu1id3
         Q/2GISPF/PaY1KATbt4CyLTY9DbO7eIWayZxtYQQD7o22N16/rh0tLTzHza2RkG6ard8
         jFqZpNOOGdoADjxPNSQNAdPIp7lhGE7Kh25PB5wvMtq4lFy08sEYv1jvFBuTSL4vozEp
         qlYJuSAAZGwQ+TqNC5xJ6wR8ueTZnRJnHeFsDgLjCYjLkoHNx0/77Dt9wFHP1nuYy0t7
         m2LiudrYIIGagnnRAdWYEeZ39EqmLfTZGpWfhHbNtBqu5ewMZlQnXNt1J1vwzmdzfxdV
         WzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8JKQgrIuA3Q40rQhQ8l3U2zIRrYBj0zzlvF1gEAXmXg=;
        b=FuQPf2CqreMjp1XQvsUKfZBIm9VDRz48mGeHGDCQmRWpxGmZgkCfW9QBOe1aUWK1ZV
         FYAH5+ZFiqocojXB1LO5TjA/aqspiPRzBIv8AOX6+Xtl1ljdiw9s1NQ5NpwGXpaSFCn1
         cdID9uXrrxj94HMJRnrarjMgLwtQ10hrpGBGKgTmbGOtrTiUU6rQrDLulW7ifyjaqMer
         goaM5p6VLEQuREhYuAaF62J0JWD6qjYmpgcNsGO3dlfjX1NAuwkbkW6XS2FhsEqapBd1
         E77IQnLeyc85rBuTwewmFthfWJKKNLoUTJOpQVN+YPfJ0xBdwJEzUHm+phFrgQgMnyso
         bxPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=mHDH855r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f97si6563308qkf.386.2017.07.08.10.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Jul 2017 10:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=mHDH855r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTtIG-0007iN-Sw
	for alex.bennee@linaro.org; Sat, 08 Jul 2017 13:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtIC-0007iF-Oq
	for qemu-arm@nongnu.org; Sat, 08 Jul 2017 13:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtI9-0007Z7-LF
	for qemu-arm@nongnu.org; Sat, 08 Jul 2017 13:13:16 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dTtI9-0007Yb-GS; Sat, 08 Jul 2017 13:13:13 -0400
Received: by mail-qt0-f194.google.com with SMTP id m54so7928869qtb.1;
	Sat, 08 Jul 2017 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8JKQgrIuA3Q40rQhQ8l3U2zIRrYBj0zzlvF1gEAXmXg=;
	b=mHDH855r2Z0heLS5w5TDrCiaWvbpo09xfUfErm7K3JyZqDLQiEHC5i1JDPIq0mEyZC
	xs7hTXw06fnbpzpak96lIBZEyB7Qsbp35xwkVogH5RojegSNLrKGpvPUEDyWen0fZEAL
	wKws5Jg7cnpdpkpe6NTpQEBZCSPIrQXFrSDESBdWYveYhbk3+MTBl9U0AsMx0ZD5RFqW
	FXUL74r10GvtEbE/hQhQwtmHax7gBF8wMywA+JQ/cAQa5EFAu1O/VRq5AUCFAhFga9p+
	55IrOYQW8pIUH7ZDhw60gpPeXI9r5sFpmpCIn/L7WeFY7KRgUv9k8oSvP91T5lDIdFFi
	XkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8JKQgrIuA3Q40rQhQ8l3U2zIRrYBj0zzlvF1gEAXmXg=;
	b=An7j2tHWFQTTdOLOPp10nSu+wPv17jbQ0006VAV2iXGZfjMhvv7REZb9OTI5IoULrQ
	CWVM2Vlo8hgRpPEZZFg6OpBksTnzcDQExVOUFVDDLEqgnnHuzYrkdmyYGypTytXJQHpU
	gHb5gJMN756IF3dPzbPKh3cmkl2JzKOnylpUyTqu13zvIq7Hu2BeCeBTjOvgCzbiTZNi
	FQnldn051S2BvJZaVlx7BZpHTECmFECMkJlLtEWFDbxAscAQH2kUjCiAPnWDwZWmfB5/
	Y91hksFYD5F390phYWHPilF9IViv1P3/V4wGOuCtnQrk6HJ1vsboRxe9/xPsASufrqOz
	Pw5A==
X-Gm-Message-State: AKS2vOxAY+kW3TRnznoHOF0DUaRANnkgLRbPVAb1mPjMoehS/3eyAzrJ
	FPCY5mWk6ejzlb//kpo=
X-Received: by 10.200.42.81 with SMTP id l17mr81842547qtl.32.1499533931957;
	Sat, 08 Jul 2017 10:12:11 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id e15sm5327228qte.3.2017.07.08.10.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 10:12:11 -0700 (PDT)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <20170708025030.15845-1-rth@twiddle.net>
	<20170708025030.15845-4-rth@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2ea7f49-10f3-520c-4a0e-456a11934410@amsat.org>
Date: Sat, 8 Jul 2017 14:12:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170708025030.15845-4-rth@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.194
Subject: Re: [Qemu-arm] [PATCH 3/3] linux-user/sh4: Reduce
 TARGET_VIRT_ADDR_SPACE_BITS to 31
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
Cc: riku.voipio@iki.fi, qemu-arm@nongnu.org, laurent@vivier.eu,
	aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQc5btrhzWqh

On 07/07/2017 11:50 PM, Richard Henderson wrote:
> The real kernel has TASK_SIZE as 0x7c000000, due to quirks with
> a couple of SH parts.  But nominally user-space is limited to 2GB.
> 
> Signed-off-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/sh4/cpu.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index e3abb6a..3121d1e 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -45,7 +45,11 @@
>   #define TARGET_PAGE_BITS 12	/* 4k XXXXX */
>   
>   #define TARGET_PHYS_ADDR_SPACE_BITS 32
> -#define TARGET_VIRT_ADDR_SPACE_BITS 32
> +#ifdef CONFIG_USER_ONLY
> +# define TARGET_VIRT_ADDR_SPACE_BITS 31
> +#else
> +# define TARGET_VIRT_ADDR_SPACE_BITS 32
> +#endif
>   
>   #define SR_MD 30
>   #define SR_RB 29
> 
