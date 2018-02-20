Received: by 10.28.71.27 with SMTP id u27csp1398225wma;
        Tue, 20 Feb 2018 10:27:44 -0800 (PST)
X-Google-Smtp-Source: AH8x224K3o5raJKnP3vCSDsNfOSsSkVDDms/GNHSTebrPuvAThLPVTm3Mh4UTkaS2Sv7M3hTFntc
X-Received: by 10.13.235.143 with SMTP id u137mr470334ywe.423.1519151264407;
        Tue, 20 Feb 2018 10:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519151264; cv=none;
        d=google.com; s=arc-20160816;
        b=HkkadL1diszJh7rjLXccbqV7c4E89qP+tfoxcTa10tBb9aTqKjAVRcUGKIytIz+3Eq
         ckVrgjKYCqVxEJ1Yw/5/XEBRWMlkRxWpUPsosefUo71BV5El7yZ/0nJcOf6Ag7ln5UYa
         UGSl52+SmU5xZAucsHplMfsB1eak9xWe1f8bzYI72SLQcrnSFveZjm0Zq4E+er8a+517
         YAJXdaJs3wA43zKSpUn2i0T2hVw2mmzbT+90O4Jf8f8k/hs01/VAX7ziZMyM1JAq3r6W
         +DEKv6c/rYOxZzd6hUiLMd/B3J5bjeY2g8EGulN9L5+mAhN5y676+kgKbVNnbBmOHr/h
         lgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=3Rcaq+gERT6r3fPFaxnYDw8Vi+oEHL8GRPXKrOFgwps=;
        b=YqrfervarbEnVxFVZjdLM7xy44EgaaPsv2fHvkabkVhp0VTplqddnXx5Gojlkk1gkC
         l5w0V+NA89SHH9ry0687/054OvATUHJvFC6+nmKARz/RLnIvBWNavS0RF6M2lZlfMs33
         LqcesZIHanJOTKDRTYc3qaq0oL/ZmMUgBp4rZIIMBI6zIZe74BFCON7379L9oPw0lQFI
         BCSRtf/1w5YYwLCmlQenKqGbYMfrmmJ1fAQOiAQ3vmZOIEDQx9Anm3+0iEIxrPy9lLl6
         gCo4yyFgnMh4BiENCzHFFrKe040aDNI0OLSI1xLN7ltEiotfOVX7pnmeSHGDlkoHEknD
         ViFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s94y+pF8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j63si3059046ywf.540.2018.02.20.10.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:27:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s94y+pF8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCdj-0003zY-QQ
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:27:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCdD-0003xK-77
	for qemu-devel@nongnu.org; Tue, 20 Feb 2018 13:27:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCd9-0008TS-FQ
	for qemu-devel@nongnu.org; Tue, 20 Feb 2018 13:27:11 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:33053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eoCd9-0008T3-8b; Tue, 20 Feb 2018 13:27:07 -0500
Received: by mail-wr0-x241.google.com with SMTP id s5so17157023wra.0;
	Tue, 20 Feb 2018 10:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3Rcaq+gERT6r3fPFaxnYDw8Vi+oEHL8GRPXKrOFgwps=;
	b=s94y+pF81geqSGq+uOS7MQmpfKWLZfR8uJ9KAw8gV356kXyAzbjXN7fTbSHtn4r1XA
	xs8zxXP+R7u48YqkvYJ0zVjZd1HD4XKSe9vpJ3LtHqcMfWcbYdfjflKkIqQpolRfSUBc
	/vBTBiXaABot/WKb0PUoKqE2uaniLJQ2xclroF2duwERM1bjU6jbHmZkRxVjDby02SX1
	HuI9A3nD7Na/494GQQWRvIL/q1s04rtFomm3eO6hLxAYWQZAW5BrFo5KRTyKKE7B2Sjm
	wbjxAnpjg8mcdM07TnhoRbUnXaqaoVxCW8+N+gNvulvFAvDnLGYCxVuKav0IfZ3aC8dT
	FvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3Rcaq+gERT6r3fPFaxnYDw8Vi+oEHL8GRPXKrOFgwps=;
	b=s4lyzLQ2vbXbPlDo9xr8HJd1arXunlTUCftooLsatxCAUAQX36NxhRAQE7JBUU1Soi
	hZlYRJa8pUgw3fmov7xfU0n0MTE7MjNCPAW1vrw2vAtwGrz5pdcop/6AFW+CkCn5JS2r
	jTZk0oaaUbgedVyEOhp95NWb17bAjFc/d+DgctG03odQL9KMM0oR0Q/WldU/hREUFElK
	/7XXQbEGqsfLlg/XH+DvzBZ4m4FC6JnSoETYMpXGZXV9GP4p4M9gGAs/CZnVftQsY3z2
	V5YNl7d+24bMWax2Ja++iRmW1RNRqGYk5hA9UFTf2LsFEAoD5ByhlI+S3P75/1teOdHh
	/XEA==
X-Gm-Message-State: APf1xPDHydIP96trKJxHrUaKxgXKOnmqyR2gJ/YsFNacq1y3zUUW28gn
	RTTLobH0qDGq66m0P+Hp8W7AyLmI
X-Received: by 10.223.201.133 with SMTP id f5mr474046wrh.99.1519151226211;
	Tue, 20 Feb 2018 10:27:06 -0800 (PST)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	u63sm18404873wrc.26.2018.02.20.10.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:27:05 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9d59a47f-9b5b-f49d-c19b-7c10a7b8e8cc@amsat.org>
Date: Tue, 20 Feb 2018 15:27:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 09/19] hw/misc/unimp: Move
 struct to header file
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bttKLWpCvgn/

On 02/20/2018 03:03 PM, Peter Maydell wrote:
> Move the definition of the struct for the unimplemented-device
> from unimp.c to unimp.h, so that users can embed the struct
> in their own device structs if they prefer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/misc/unimp.h | 10 ++++++++++
>  hw/misc/unimp.c         | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
> index 52e068ec3e..2a291ca42d 100644
> --- a/include/hw/misc/unimp.h
> +++ b/include/hw/misc/unimp.h
> @@ -12,6 +12,16 @@
>  
>  #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
>  
> +#define UNIMPLEMENTED_DEVICE(obj) \
> +    OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    char *name;
> +    uint64_t size;
> +} UnimplementedDeviceState;
> +
>  /**
>   * create_unimplemented_device: create and map a dummy device
>   * @name: name of the device for debug logging
> diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
> index bcbb585888..1c0ba2f0a7 100644
> --- a/hw/misc/unimp.c
> +++ b/hw/misc/unimp.c
> @@ -18,16 +18,6 @@
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  
> -#define UNIMPLEMENTED_DEVICE(obj) \
> -    OBJECT_CHECK(UnimplementedDeviceState, (obj), TYPE_UNIMPLEMENTED_DEVICE)
> -
> -typedef struct {
> -    SysBusDevice parent_obj;
> -    MemoryRegion iomem;
> -    char *name;
> -    uint64_t size;
> -} UnimplementedDeviceState;
> -
>  static uint64_t unimp_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      UnimplementedDeviceState *s = UNIMPLEMENTED_DEVICE(opaque);
> 
