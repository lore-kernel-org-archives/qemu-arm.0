Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2811478njb;
        Mon, 8 Jul 2024 10:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfypWw/m2aRHfOTkJpFqT8ezuNYRIJs7EFbV07DdRK+rz2PRobAnWizj8iBA90grclqpRRqcsF4BmwttVObOyMFCEct7Pl
X-Google-Smtp-Source: AGHT+IH33IyU930AjAzp34M7vhMyugBaNybfeTTZWcluYxVAMhLkzBibyyVF7CPKVTQuWLn5sNhl
X-Received: by 2002:a05:6358:d3a4:b0:1aa:bde7:5721 with SMTP id e5c5f4694b2df-1aade0df247mr24225555d.20.1720458549483;
        Mon, 08 Jul 2024 10:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720458549; cv=none;
        d=google.com; s=arc-20160816;
        b=jU9bhG8eSHcA8HjTOheGQzCpEtnaQbxEZaLrdaq56/2oxBCMbf3Z4/imsgWZ86oVQi
         b9gFjJUhOnDnQZx9aoK4tE+D14/CHcPDO1JKDnog/leFOO9/DZtHTdkS/VLxo3AfkRJs
         bBl9R3zuqygxTTMszt85+Wsl1ZMfnNO+UM8bbz+6vondWrf6RFQ45bbL9aK0CsytWO0r
         b1kNQD3+feNI+LxuRHWeCe0uo/BxJNH9OImODskbrkGUVPcIsV5IfZnj51thaCvcx92q
         C9ZMAOHIEQjDwDZIaGp58WMoVRW+RGXMJS7N5B8WsDCwqIo5UicX8FWETKZ71EjNQqkD
         Y8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/wI4dcONFNpTlPb+n+mVHHHm9UMhgB4awWZCFEdENkw=;
        fh=smXTXSzFDwHWYfrzgIr0ZjsUA5vDFRA3DF/b6dgKh9Q=;
        b=ftCxslLHXcmn31swpfosW8DrvO4LJkg3kiqHSFAZBv4cVZxJiWw9s50n6ObUx6eqa4
         NkeiEyivov1+xknw1ufCypwxjqxNqKWTAvwol8Kpvy8LHyQrqUPrIeGHuMELkB4iB8lo
         lVUpDb9DXkEOqytDJXmsnTgTKKqJDxdy/0GkQ2sneOUc1Ylgo/CWjVHFuchB6v00AjF4
         WNzxpoIRXApvlKNwS3YmLGls0vTlbFf4LanoH4KcNhh75pTnz5cgEyIXJwvA25QTp6yj
         +MFxBB8h3feQsuuFdOwFKjoqkyuh3ks/5pFJNXt507k9l+za7cNW/f8sxQyKd4TbNxGp
         viqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APwsJHJy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-490317181f7si38981137.378.2024.07.08.10.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=APwsJHJy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720458549;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wI4dcONFNpTlPb+n+mVHHHm9UMhgB4awWZCFEdENkw=;
	b=APwsJHJy9AGASWsj8yMA0n5hmQb0ViFeslq/NRblySF/yoXNhg9c+62/rmoTtFsKX0GcRY
	w8wUfKo/o6m4yHrwrpsJ4qJ6EqCm09ASeqKpCPCRcrCDEbaGDYyMG4Le8R7b5X79WPv0TW
	s7R9cgw5u+HVjWo7ah3JrREL9Hbg5R8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-FyXn7qs3OyW_bjAa0CdYmQ-1; Mon, 08 Jul 2024 13:09:07 -0400
X-MC-Unique: FyXn7qs3OyW_bjAa0CdYmQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7035dca44c2so2290213a34.3
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 10:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458547; x=1721063347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wI4dcONFNpTlPb+n+mVHHHm9UMhgB4awWZCFEdENkw=;
        b=VC/UkuA7t7rnO0OTtt6Qtj+RWM3A3e6gGX+CJV/rA7jp5hHzTiyqQSStfEuGQZPLAD
         bnzqa17MX4h6KcMv/W9/z1fp2S0dstarV40pa+pzqTuQaBH0OrLbiJDjqcffUtqGTXWe
         4aMBF6vdgQ8pi4TwYNYaajxIXRTkSN1hMHJsAemAPJo4wPG8hVtREuM+kAaZxmHnP13v
         3wQqxLcosIb/DCZ5DTI2IvJKZTJ/BQPhvvvwcsj0paNKdP2Ml5qUTM/sWNYY2p8qGr2+
         i/UAg0AeVjbmdI+POgbQLESRLI90ssVo11FraAfanR+wda2lfHSBt6miwacQGy82fQif
         wraQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfGasJIBE2/tWAKJdE3m3jfIUsWhI4lCFGop2i/kq3DreDnt8cd9UPnPktqT505NT6e94FV/rZEO0tkMiYOfBtvhCFgxtJ
X-Gm-Message-State: AOJu0YzfKRsm9IsMTV+lxSxt5gpijM687qFyIULQQwBXSnmrJOLQ720D
	YQl6Th4oM9RUddnEHzBebrrlcGxtL0HJGHwT1USbH0bj9qwH+Iiz+2SWLJTY7IglP3TnCF8fD8h
	ReGtQFDcAFZzWJWwhk9zCGrlwOGHN7DLd0ltRmwnbMrtFE+BnMxGWGQ==
X-Received: by 2002:a9d:784d:0:b0:703:5d05:9291 with SMTP id 46e09a7af769-70375a17aa3mr65718a34.18.1720458546760;
        Mon, 08 Jul 2024 10:09:06 -0700 (PDT)
X-Received: by 2002:a9d:784d:0:b0:703:5d05:9291 with SMTP id 46e09a7af769-70375a17aa3mr65690a34.18.1720458546381;
        Mon, 08 Jul 2024 10:09:06 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba73dfbsm1118386d6.96.2024.07.08.10.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 10:09:05 -0700 (PDT)
Message-ID: <f2a17216-1a03-4c84-85af-8c3145f305ae@redhat.com>
Date: Mon, 8 Jul 2024 19:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 18/19] hw/arm/smmuv3: Advertise S2FWB
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-19-smostafa@google.com>
 <20240704183658.GO1693268@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240704183658.GO1693268@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ymOh6tvaxfo2

Hi Mostafa,

On 7/4/24 20:36, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:40AM +0000, Mostafa Saleh wrote:
>> QEMU doesn's support memory attributes, so FWB is NOP, this
>> might change in the future if memory attributre would be supported.
attributes here and below as reported along with v3
>>
>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> ---
>>  hw/arm/smmuv3.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 807f26f2da..88378e83dd 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
>>          /* XNX is a stage-2-specific feature */
>>          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
>> +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
> Why is this check needed?
>
>> +            /*
>> +             * QEMU doesn's support memory attributes, so FWB is NOP, this
> doesn't
I have just seen your reply on my v3 comments. I still do not understand
why we expose this bit at this stage.

Thanks

Eric
>
> Thanks,
> Jean
>
>> +             * might change in the future if memory attributre would be
>> +             * supported.
>> +             */
>> +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
>> +        }
>>      }
>>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>> -- 
>> 2.45.2.803.g4e1b14247a-goog
>>
