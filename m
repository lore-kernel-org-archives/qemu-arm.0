Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp530530njc;
        Fri, 19 Jul 2024 08:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwQt+f5gf9sxRlAGex88o+vcYsrsKnfeAkWbXwRPBK5ByUVgAQZnZnv2kWdiA9KvDkSp//StT0Ae2gg/dgoUh+Kgf73yGU
X-Google-Smtp-Source: AGHT+IHourDl6WrIQsQgZOPdKSN6bWjTwbVYx1rAQRN8fCcER3DI/M/MvXQysCidG4Ih2y2UqP4v
X-Received: by 2002:a05:6808:1389:b0:3da:b3b3:17f with SMTP id 5614622812f47-3dae5ffb8e1mr254648b6e.25.1721403374811;
        Fri, 19 Jul 2024 08:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721403374; cv=none;
        d=google.com; s=arc-20160816;
        b=wu7pPLUrnvACId184w4B8vGwi2wZ7VrZb74eHnkdMTMYvq385qnHLgHI+fgYxJoa/0
         Dyi3UOB6KdhV2LBQaBd3xiBH1+2KPq1/s90vQYa/asHFMeerjJKdYJ4cqNTTV7wXZtZc
         XlTitv48h4VKF382cpc1R8BEeXeZA281W4qNw/yxRxwSwSTn3e235ADjjgWqq7DjdrTb
         ygmIDkXmVtSVPBtyOx6je3zAGt2hxFsuWBu8GfvAcOypnQ0Ns3Pl6DSiNYwzvW/Cm2c0
         8ePETAbTA9Z4HgjjAXCcEPEk/M3PQcWXnzRySM0i2x9lfo387aO/UId+iFR0EzZg+MPp
         Hbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EGwBDir1HFkW0R57zz8qujLsfzl9SnvvzNrI0wVSoSY=;
        fh=FTErQpYFaYm0rZ1Ymq4ZtxEQFN8mMgBPfI9hhlQ5qcg=;
        b=zdhpo4iMCoqy6/+4UNJohKjdydzg0C/1jDZr0UKVAY0dj+w0NSTnEZfJgUV0QHuUT+
         N2Q3zAE909Mv3U6ebOofTNk0NNkWW22hgXYbjmN2JawsHbIh9PA/eG8TjBKEoMYbtb5a
         Mj7D8SQ6jYbMp70Dv/vIc03mVa1thCVEZ3e3E2Njeq2xbuv0rKXSR/1UNl/QUaUbcSlK
         eVJ5KiBbEBU4hICeR95BkX4MWrGkUuzfzrBpLsz0+p60Y1NhdSO2GWzs2X+HG5dg0oVa
         /ZCOO1+zfD5rDHvtglw0yDkG4F2sZG2Vmsla2v4XTmlFE+Ljh8MKmXe+3BXV4Wr/hno2
         6qqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=BvaFxajr;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id 46e09a7af769-708f60b160esi844687a34.89.2024.07.19.08.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 08:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=BvaFxajr;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=EGwBDir1HFkW0R57zz8qujLsfzl9SnvvzNrI0wVSoSY=; b=BvaFxajrUA5j2ri+PoAHlXb898
	oN/NvFqqPbs7vHXwfAW8LVfuPcfcWilyFicgsUdzkmryz5oFPEgSi/YBhiFJ50gUgHxJ0mx7V6Oz9
	Mas9136wJfpkf7SWJFfklOOxlYGE73mo1TKeMEf+DCIGwihb1S6oprSOjGwPGXg1QVTQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sUpeT-0003GK-3K; Fri, 19 Jul 2024 15:36:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sUpeS-00010r-Tv; Fri, 19 Jul 2024 15:36:09 +0000
Message-ID: <a0ee8ba3-174f-4d00-807f-31584cba42d4@xen.org>
Date: Fri, 19 Jul 2024 16:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: eric.auger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
 <5684927d-d890-42be-841c-ece681502503@xen.org>
In-Reply-To: <5684927d-d890-42be-841c-ece681502503@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sWYWUCb4JwAs

Hi,

On 18/07/2024 10:43, Julien Grall wrote:
> Hi Eric,
> 
> On 17/07/2024 18:43, Eric Auger wrote:
>> Hi Peter, Richard,
>>
>> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
>>> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
>>>> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
>>>> but not nested instances.
>>>> This patch series adds support for nested translation in SMMUv3,
>>>> this is controlled by property “arm-smmuv3.stage=nested”, and
>>>> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
>>> For the whole series (3-9, 11, 12, 15, 16, 18):
>>>
>>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>
>>> (and I think patch 16 is missing Eric's R-b)
>>
>> Jean-Philippe and I have followed up the progress of this series,
>> Mostafa took into account all our comments and all the patches were
>> reviewed. It seems to be in a pretty decent state so if you don't have
>> any objection, please consider pulling it for 9.1.
>>
>> On my end I did some testing in non nesting mode with virtio-net/vhost
>> and I have not noticed any regression.
>> Would be nice if someone could send his T-b for the nested part though
>> (Julien?).
> 
> I haven't yet tried the latest version. I will do that in the next 
> couple of days.
I see this is already merged. If this still matters:

Tested-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall
