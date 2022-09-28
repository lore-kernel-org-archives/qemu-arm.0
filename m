Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp421343ocs;
        Wed, 28 Sep 2022 09:42:15 -0700 (PDT)
X-Received: by 2002:a17:903:11cc:b0:178:aec1:18c3 with SMTP id q12-20020a17090311cc00b00178aec118c3mr652272plh.91.1664383335150;
        Wed, 28 Sep 2022 09:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664383335; cv=none;
        d=google.com; s=arc-20160816;
        b=x/XdRtwTIMocbCl9bQTwe+fZdVmZg31iBRi3NjF6PpadCprLmOQ07EzBj8td0XS19T
         opp6q0YwtD2z3Kd/a7zYelaYMg4farSZGtwSVH4GAmMiDeK3bXQW7GSvww0GXgO0kgI/
         7lGm3c1BTz5ffMo0c+jlREHenmnVTYPGhfkrRp61euzMH6d6TyWh1J6Mhm/PwJiVC6zO
         +ExXKNvLIVNkS5j7A8avR4ATzv+bf6YB437GlKsnzan8ijOjrQN/nWq758gbZnObIxDH
         eD8YFAUoYU9ZlZxLoOpdikMzmk0N18UKbWDiqPutGC6YViPJknRp6rfQF0hz8pL2WoCC
         ikJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cxA/M8MpQOXnt1A+UOhleSOKD9SXff2wRWBRadO1iPc=;
        b=GSACegEXbufpQMnC/RrSH7zbcgE2XzLS7vmnwxR/DcPV947fcwM/z6fl9+UQUskuSR
         St6BhN4dK9C38QXurlPRBCuIAm7yHY5eFzWvSEUocjnYabSZMX5/xpOOaUPfy6nX8qWb
         5W+gqdx4E84tGN2icimeFO0qcGv188EuGI4Vz2fCQlUBD8HwZcjll19WFXhEI2MQwQeF
         ZMSv6IGaMY9OeXVYeovL7oG6BEFkAKKOHLyVQXNVsA8kZfG452QTtPfa/sEv+l1n2l3m
         0m9WfsHSTagSpwa9h23C8Wt8trCIFppSqnAEa8txIZMOqzBY6WkKF+HvYue14RgGYgZk
         vjEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGuowKAW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b8-20020a170903228800b0017890fb8cfasor2456224plh.179.2022.09.28.09.42.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGuowKAW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cxA/M8MpQOXnt1A+UOhleSOKD9SXff2wRWBRadO1iPc=;
        b=KGuowKAWES7OXef7SnGXL1qYeTYidQi6lXNApUf07Y3s6zD/cAUxpPoZHj7sM/I3/U
         11vZ6HP0ikpiyMbYGwowVIgaNPbnpqqsxXtALT0xKlktNM6ePVBSWjKKo+h5HOl54ok8
         OpL12/alGkOvfNB1yYo7XD+hGX/CM8VXkrzCn2JUu1BenR1Ip5SRw3SNczFD4BrbsztY
         cKP2XDRnvPJW01Dbr+7aGiqtScSP/CFce6un4ZsPxVfCVXb0oIbU7N+h7/9LjJz1IWW9
         HCIelUMBBmxXHsBt8gZeJBrP51mW6jUs4KJUNyqRswkPzUoscKarbOvUxISzIxEFSodI
         C35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cxA/M8MpQOXnt1A+UOhleSOKD9SXff2wRWBRadO1iPc=;
        b=as3L2QRvn3u5mozkS/mGWBAUPcAeUc8Yam59dRj68a3O+qt/brfquX2ZlBSWtHEDob
         iDpU+h5/30Sf6z11kF/s1NiPPDzOUlmLSXfawMZlMdp5i8wZ8R+s+lP8jJ13D/XmV4hN
         UqNQMqoeiH/KKwvZHe0+boUBAbwNN2bY+Y2D8P2R2Toaezk2JPjkseV0EQ9jxn3uLoYU
         CqlhZZRvk6ND4/7AOqmQh3jDg/POJ/Bo2ChD/7EzD0ZDPyB0i+Lv8gQalTjBhxj5HQr0
         otFwvLU9ZcyUHQmi7kAhogOUtgemmhnuf03t8SzYJVGIKng5P36SZMdeSSCpIRUh+zS3
         LATw==
X-Gm-Message-State: ACrzQf1gY+9O8DgQGOiIkMFV7SynAD8RAOax7953W/S3j3+rxR7JvWYV
	GKTepQiNfP1MbsY4xVGIm4r7YevtpNXscL1B
X-Google-Smtp-Source: AMsMyM5KTEr+kMPFQYGdC0VWP8O4iT3bXRb5qs9o79sBwM34a9a4929JlRL+WKyEp6MilQtWzMG5pA==
X-Received: by 2002:a17:902:e945:b0:179:ce23:dd4d with SMTP id b5-20020a170902e94500b00179ce23dd4dmr693429pll.68.1664383334779;
        Wed, 28 Sep 2022 09:42:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ce8400b00178b06fea7asm4054541plg.148.2022.09.28.09.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:42:14 -0700 (PDT)
Message-ID: <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
Date: Wed, 28 Sep 2022 09:42:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gAP7vIPTFQft

On 9/27/22 07:14, Alex Bennée wrote:
> +/*
> + * Every memory transaction comes from a specific place which defines
> + * how requester_id should be handled. For CPU's the requester_id is
> + * the global cpu_index which needs further processing if you need to
> + * work out which socket or complex it comes from. UNSPECIFIED is the
> + * default for otherwise undefined MemTxAttrs. PCI indicates the
> + * requester_id is a PCI id. MACHINE indicates a machine specific
> + * encoding which needs further processing to decode into its
> + * constituent parts.
> + */
> +typedef enum MemTxRequesterType {
> +    MTRT_CPU = 0,
> +    MTRT_UNSPECIFIED,
> +    MTRT_PCI,
> +    MTRT_MACHINE
> +} MemTxRequesterType;


I wonder if UNSPECIFIED should be zero, or even ILLEGAL, attempting to catch MemTxAttrs 
foo = { }, which is now ill-formed as it doesn't initialize .requester_id to match CPU.

Perhaps a preceeding patch, should introduce

#define MEMTXATTRS_CPU(cpu)  ((MemTxAttrs){ })

and modify all uses of "= { }", at least under target/.

> --- a/hw/misc/tz-msc.c
> +++ b/hw/misc/tz-msc.c
> @@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwaddr addr, uint64_t *pdata,
>           return MEMTX_OK;
>       case MSCAllowSecure:
>           attrs.secure = 1;
> -        attrs.unspecified = 0;
> +        attrs.requester_type = MTRT_CPU;
>           break;
>       case MSCAllowNonSecure:
>           attrs.secure = 0;
> -        attrs.unspecified = 0;
> +        attrs.requester_type = MTRT_CPU;
>           break;

This is surely incomplete.  You can't just set "cpu" without saying where it's from.

Since this device is only used by the ARMSSE machine, I would hope that attrs.unspecified 
should never be set before the patch, and thus MTRT_CPU should be set afterward.


r~
