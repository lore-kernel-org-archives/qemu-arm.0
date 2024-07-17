Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp898662njk;
        Wed, 17 Jul 2024 08:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVd0qrH6HN2+Tk0j6EVxJNVB0+MIGg1NAIPXJO6Fo0PwAS19J06YRMpV5tLRAsq+keb1iO492ErxLrm3aSBzSNT2+8B1EO
X-Google-Smtp-Source: AGHT+IF4A83pcU4sQ+0soorfkRg5tDj0L+8XkF1tPh3WpeBowJ2b79gsO2yzv23fLuMasaOWWRPa
X-Received: by 2002:a05:6122:a19:b0:4f3:734:38a with SMTP id 71dfb90a1353d-4f4df6ebd5dmr2722236e0c.7.1721231993093;
        Wed, 17 Jul 2024 08:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721231993; cv=none;
        d=google.com; s=arc-20160816;
        b=g7GeiepUQYOIyBH4iYUcWPhYte1hzDGm/s29u/mfj8/Fcc16h/q2CooDVXskSS5jf/
         vl6A8UpieAW2Nb4T1WjAF8VaXgTCtsrYwF1x3eqiw6vQDSn9AdSviplPKy8wV8ODahA3
         25GsRhoL811MOk/+5le1wcmLgx/UX/w8ix6alU3YuFe9ui6B8LXkHpxJHcbYVw3WesvP
         GYW1dO+kOU+WmcT5bDhhT884POn2hLF4fvnAYwGdn9y2ZfR1u68BgedFB1p4ydgP65Is
         lP49CvNczLbaA4t8KGdGKfT2mZorP3N8IwPtrZENpeT/7dpcVEDPYKQaS9XsO2G8vVOE
         hIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Cs9ZcroJdwtw+36hFuCqozA/bRksIR/Mx+j58P9MtJM=;
        fh=9FqP8MeHouDbLJ5dxzkJ481PgVANYQq1rjqDGC+vBL4=;
        b=KA7BR79hpC3ob2wZ0o4JHGIH3C2mOUgdOq9hklbjeP+ghvi5dGXX0BJaezXYr0TtcF
         2xhUeDERTyq/UVENRRhbymrVOcNOoX4Z1m0bq0CxjTYXmPU3LF9VNm0rp1yNdOHwba5c
         KxzFfPSKaCXWSOSn0n+ofODdjULFcWTXdKMoCgob+oDmFZK+5poYuGmlRQtKd1tr8Rg/
         UQ3SfkGMR8YJbAZ6eYmt5N52bq1yN0QwNyxXV/kZF3qQIbjyQydb0lPUYKoWMbdyjshG
         L5Ak9b3tUhoC4f2ceLMbC3KxUhlL+wRgdJtJ/chmIjS+nVxTF1e5bmFdsQfM79I+P88V
         czww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LbjB2WLf;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a63fa7si100540996d6.552.2024.07.17.08.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LbjB2WLf;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721231992;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs9ZcroJdwtw+36hFuCqozA/bRksIR/Mx+j58P9MtJM=;
	b=LbjB2WLfyWhMjFyG3g0BVSm47TYAP4eMzJ8BtQFJ+gzzEXMflheHLq6rmS5bnW57IWvOEv
	o1Gtaya+n2lElCN03wdfUGJXf0FhPAEUqHNUydx7iQsYneORAdrL4wdmw1RVPRufE2gCIv
	wXNDctfdTPfCTbc14NHJ6UFdCEqIrEM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-89yrANCCP7G_CQwVQ8-I9Q-1; Wed, 17 Jul 2024 11:59:51 -0400
X-MC-Unique: 89yrANCCP7G_CQwVQ8-I9Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36832c7023bso544040f8f.2
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721231990; x=1721836790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs9ZcroJdwtw+36hFuCqozA/bRksIR/Mx+j58P9MtJM=;
        b=DmgervylikDW9WwZtz3RihaRfzgjWHThtGbK3Pe5yCQ5mPvJ4tBcwA6bIMHaSNgKpF
         fBEJbZTi7HmGbwb3KqB7YKkSIrQeGcbSZQHYWshu6pQbal78/q1leQHaN6jY/uPXfAZx
         BphXF1pmpA5oxNJp9dn+zMWjO8VDVZuMwoLJzhr6vmu7TiSjlFUFK1YsTU2js9TacsRP
         zzeRWhw0QJJ2h9ZH0oYkQ1pBYpfu0cdlOhLr2JcPR22oqL+zb1wkgPauOtOCkBCethay
         8h6+etHRmpUlD3wkaCFpO4iPk2Y10oc8IAxOK1DEn3JHPooo3sSyXKoPfXc7QMz9wnRT
         Wl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGtEp5X+LX4X9l00IbzUM1HZjV4FjCBIUQ9mpA1dloTVWA2aVfxAwA0VgsU3bVIw/dNQKVTGrlGYI0MT1NHBfxLQmWJzlp
X-Gm-Message-State: AOJu0Yxk4T4yJF8cvNp0DbhDp8PfLhycF16P+7dUMuqFjhyLRee7Nhmc
	OldmTi5Y3RoGfUWJ8frlMXzkhfHC5NZYjrNWLfTppXCjAET298OQV5+tv+f0nZ+oGMsrvR/cKI4
	z2e00Urw8+IgUXb6B+8Eql4cZikT5AAW+rQBNpZmeY1ZIEWoTyJuYkA==
X-Received: by 2002:a5d:58cf:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36831745e31mr1792415f8f.56.1721231990257;
        Wed, 17 Jul 2024 08:59:50 -0700 (PDT)
X-Received: by 2002:a5d:58cf:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36831745e31mr1792401f8f.56.1721231989788;
        Wed, 17 Jul 2024 08:59:49 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3d37sm12157998f8f.14.2024.07.17.08.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:59:49 -0700 (PDT)
Message-ID: <8bc7d848-dcf8-4d12-ad2e-8e077732a592@redhat.com>
Date: Wed, 17 Jul 2024 17:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 03/18] hw/arm/smmuv3: Fix encoding of CLASS in events
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-4-smostafa@google.com>
 <cb687788-4bf4-4bc1-94e1-5f023b731b9c@redhat.com>
 <20240717155838.GA4073279@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240717155838.GA4073279@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dwk5pX0VM9UG



On 7/17/24 17:58, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Wed, Jul 17, 2024 at 05:07:57PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 7/15/24 10:45, Mostafa Saleh wrote:
>>> The SMMUv3 spec (ARM IHI 0070 F.b - 7.3 Event records) defines the
>>> class of events faults as:
>>>
>>> CLASS: The class of the operation that caused the fault:
>>> - 0b00: CD, CD fetch.
>>> - 0b01: TTD, Stage 1 translation table fetch.
>>> - 0b10: IN, Input address
>>>
>>> However, this value was not set and left as 0 which means CD and not
>>> IN (0b10).
>>>
>>> Another problem was that stage-2 class is considered IN not TT for
>>> EABT, according to the spec:
>>>     Translation of an IPA after successful stage 1 translation (or,
>>>     in stage 2-only configuration, an input IPA)
>>>     - S2 == 1 (stage 2), CLASS == IN (Input to stage)
>>>
>>> This would change soon when nested translations are supported.
>>>
>>> While at it, add an enum for class as it would be used for nesting.
>>> However, at the moment stage-1 and stage-2 use the same class values,
>>> except for EABT.
>>>
>>> Fixes: 9bde7f0674 “hw/arm/smmuv3: Implement translate callback”
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>>  hw/arm/smmuv3-internal.h | 6 ++++++
>>>  hw/arm/smmuv3.c          | 8 +++++++-
>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>>> index e4dd11e1e6..0f3ecec804 100644
>>> --- a/hw/arm/smmuv3-internal.h
>>> +++ b/hw/arm/smmuv3-internal.h
>>> @@ -32,6 +32,12 @@ typedef enum SMMUTranslationStatus {
>>>      SMMU_TRANS_SUCCESS,
>>>  } SMMUTranslationStatus;
>>>  
>>> +typedef enum SMMUTranslationClass {
>>> +    SMMU_CLASS_CD,
>>> +    SMMU_CLASS_TT,
>>> +    SMMU_CLASS_IN,
>>> +} SMMUTranslationClass;
>>> +
>>>  /* MMIO Registers */
>>>  
>>>  REG32(IDR0,                0x0)
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 9dd3ea48e4..3d214c9f57 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -942,7 +942,9 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>              event.type = SMMU_EVT_F_WALK_EABT;
>>>              event.u.f_walk_eabt.addr = addr;
>>>              event.u.f_walk_eabt.rnw = flag & 0x1;
>>> -            event.u.f_walk_eabt.class = 0x1;
>>> +            /* Stage-2 (only) is class IN while stage-1 is class TT */
>>> +            event.u.f_walk_eabt.class = (ptw_info.stage == 2) ?
>>> +                                         SMMU_CLASS_IN : SMMU_CLASS_TT;
>> does it match your expectations. While reading your previous comment I
>> have the impression what you had in mind was more complicated than that
>>
>> * s2 walk that encounters EABT on S2 descriptor while translating
>>   non-descriptor IPA is reported as class=IN, even when doing s2-only.
> At this point we only support single-stage, so I believe this is correct:
> 	"A stage 1-only table walk that encounters EABT ... CLASS == TT"
> 	"translation of ... in stage 2-only configuration, an input IPA...
> 	 CLASS == IN"
>
> Later in the series this code changes in order to support nesting, but I
> think it's still correct, because the EABT class works similarly to
> translation errors, except for stage-1 faults which have CLASS==TT

OK thank you for the confirmation!

Eric
>
> Thanks,
> Jean
>
>> Thanks
>>
>> Eric
>>
>>>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>>>              break;
>>>          case SMMU_PTW_ERR_TRANSLATION:
>>> @@ -950,6 +952,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>                  event.type = SMMU_EVT_F_TRANSLATION;
>>>                  event.u.f_translation.addr = addr;
>>>                  event.u.f_translation.addr2 = ptw_info.addr;
>>> +                event.u.f_translation.class = SMMU_CLASS_IN;
>>>                  event.u.f_translation.rnw = flag & 0x1;
>>>              }
>>>              break;
>>> @@ -958,6 +961,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>>>                  event.u.f_addr_size.addr = addr;
>>>                  event.u.f_addr_size.addr2 = ptw_info.addr;
>>> +                event.u.f_translation.class = SMMU_CLASS_IN;
>>>                  event.u.f_addr_size.rnw = flag & 0x1;
>>>              }
>>>              break;
>>> @@ -966,6 +970,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>                  event.type = SMMU_EVT_F_ACCESS;
>>>                  event.u.f_access.addr = addr;
>>>                  event.u.f_access.addr2 = ptw_info.addr;
>>> +                event.u.f_translation.class = SMMU_CLASS_IN;
>>>                  event.u.f_access.rnw = flag & 0x1;
>>>              }
>>>              break;
>>> @@ -974,6 +979,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>                  event.type = SMMU_EVT_F_PERMISSION;
>>>                  event.u.f_permission.addr = addr;
>>>                  event.u.f_permission.addr2 = ptw_info.addr;
>>> +                event.u.f_translation.class = SMMU_CLASS_IN;
>>>                  event.u.f_permission.rnw = flag & 0x1;
>>>              }
>>>              break;
