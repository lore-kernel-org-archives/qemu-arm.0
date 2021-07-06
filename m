Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2100091lfk;
        Tue, 6 Jul 2021 05:14:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO8LuX0WKJQj24U6yIkcLMqcM7ddjGedtLZEpqGuzXgmmOoguPjqG24jwyFVlXQfMq6O0d
X-Received: by 2002:aa7:c34a:: with SMTP id j10mr14359614edr.86.1625573649488;
        Tue, 06 Jul 2021 05:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625573649; cv=none;
        d=google.com; s=arc-20160816;
        b=TRlYccBOi0BI6UkMHULuJ/g+3py+zyxq5uERL/VFX3NQc+ziKOAZxl/+JsSXoHOw9x
         S+5SMFYLFaL8DoSHiZIKLoS7hnaG98KsKVWaVjaJgg/wxXYyZn+6zrntmQ/EVWiGLPw3
         MFO7FzbuDLKcePztNA4ZZZbZwrXKfAePv2nZHqmb9VsKiidrW0HyIkt2c7Azv0Tf36KP
         tKehf5Dqczllns/NShA2E1aUG8PxFi2YkVKUxo40Hip+MHm5XkwnAd7Wl/gIRTPVwECm
         bcxUVkxnP0UcOXI7kC3whs5zJr1IY+EVN0Ku6kDV4kMwtuQjnKtskJYcTSuZ6ZzXauKI
         jRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FZSJ5yDtmPrUJoJ7TeNVxDqQ5Ol+eC5DmPRhJA7vhbs=;
        b=DK5O8SUp3+aENz1qFxDpDf2S0duCWYiN3IHxlZlV4aXbYgRMeG8g+HGaDcFQiYYdkq
         18JJ3EVj5qfaJNM45fEOSRQZcR11fAIR14OL3RozWiUjXUEfhm5yFjI/YpskBVMlfCBV
         w6o8lPnfAebjnZLbXUbd7AeO5cXvdOcy9awGtC2kyM+5jS/CJ6G7MOTSSEpUux9pVtfi
         A3/vNC2nYDDovZSofcwoxlL5O5Ec616syxccp8JdlmxU3vocuU6Lf7qKM6OKvxwCHs+t
         x/fmUVGRZp34gqSIWhsIlaT1OZOCAIHtrMV08VMkLWhyiVkBMfs6GKwFdVRNWAhYnBZi
         Yk1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c+NI/3Xu";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id en10si14444177ejc.118.2021.07.06.05.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jul 2021 05:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c+NI/3Xu";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625573648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZSJ5yDtmPrUJoJ7TeNVxDqQ5Ol+eC5DmPRhJA7vhbs=;
	b=c+NI/3Xutb0Hf0kzbnFTMb5nDnNBxq67tfobyxl4HGPbOHn9EfgvFSgALqooGXRkdTw5Y2
	C9J+sDAN3C7BogU9zTSKsLo0mfsNDwc0c4X696jreoXaMqn6qhdYsdxFKGl04FZ3uCFtUH
	p9Sw8bkxClk4jhLZZe/0tFXxIJKCxB4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-ZbtrEjQ1OzaqgGnY3yJJ_Q-1; Tue, 06 Jul 2021 08:14:07 -0400
X-MC-Unique: ZbtrEjQ1OzaqgGnY3yJJ_Q-1
Received: by mail-wm1-f71.google.com with SMTP id k16-20020a7bc3100000b02901d849b41038so1007957wmj.7
        for <alex.bennee@linaro.org>; Tue, 06 Jul 2021 05:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FZSJ5yDtmPrUJoJ7TeNVxDqQ5Ol+eC5DmPRhJA7vhbs=;
        b=JTcXYL3KVfaFwzSYDQWEBQyl6I4frre+PsqPNsF3FAwdnBW39TSaeITZl+7OA1cgsZ
         XwdmplUDUJI56v3CK3+DuN4VxG9y1EKh0ysqk5mGd14HBHhIyu0+FwkzVumEA3XdaBKS
         C7pE6ff5IRPtn305e7d6g2eCocy4OwyN8w2GwwJJi6TrAIb5PhisynzVioOGDBVaz0WB
         tSJwAu2/RH5ALIiFIqt/l4pdiRVXaP7NJLhwSjwVZ8FYZ1/B6JFSJF4/YIBCQeTpKMhZ
         wjsXkd6qiuGLydsV7gIF2ReUP03QMNMbyJg83DMOZnEFCQB0FkvXQ0r4CM528YBQhoqV
         3HYA==
X-Gm-Message-State: AOAM533eDFaxsUSBzkv8sporF0Sm+guKwtGBAZAkcHph8FoO/kOa1FDY
	k+ZZcTZOAzoP59A4XfgIDFmPWAlvW+tV/OzlvF4p0412vJxQGO6yUZ4Pwj7MdLDd2RSOmduHtwr
	3ZT6wSXy7GsqHbZiM
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr19801533wmq.140.1625573646167;
        Tue, 06 Jul 2021 05:14:06 -0700 (PDT)
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr19801525wmq.140.1625573646036;
        Tue, 06 Jul 2021 05:14:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id b12sm12441008wrx.60.2021.07.06.05.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 05:14:05 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cb956777-828c-0b29-66ca-f356d6495fa8@redhat.com>
Date: Tue, 6 Jul 2021 14:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8vELc4NwwCL2

On 6/21/21 5:21 PM, Alex Bennée wrote:
> We currently select CONFIG_V7M for a bunch of our m-profile devices.
> The last sticking point is translate.c which cannot be compiled
> without expecting v7m support. Express this dependency in Kconfig
> rather than in default devices as a stepping stone to a fully
> configurable translate.c.
> 
> While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
> as that is implied for M profile machines.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vconfigs
>   - cherry pick from re-factor
>   - minor tweak to subject line
> ---
>  default-configs/devices/arm-softmmu.mak | 3 ---
>  hw/arm/Kconfig                          | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
