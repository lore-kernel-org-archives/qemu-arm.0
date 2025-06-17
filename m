Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2511282njc;
        Tue, 17 Jun 2025 06:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXX2ww85dvxoHegyeSp+qaRllyVuuRUJqL4jxy9YoZf4co+uz43kkKXJ5s2dKiScnDLN3fjt2zHHeeVTw==@linaro.org
X-Google-Smtp-Source: AGHT+IHG27MoVsaGfyGH/YzN766GRWkZZvr6exxAxanvqWoXjlqiJEHLfPt9aMo9zHBQdMD1YQo6
X-Received: by 2002:ac8:5a0c:0:b0:4a7:1460:33e9 with SMTP id d75a77b69052e-4a73c5ee220mr192997411cf.51.1750166802456;
        Tue, 17 Jun 2025 06:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750166802; cv=none;
        d=google.com; s=arc-20240605;
        b=SQMxUrZGNeGvxAKOQKo9aWsEKkPv8sqAqsSNykI1THzNvjKFZWi9JJ1MI9BACzCCYb
         aO5pndr8Yu3ZTXr/8BWuIkcZheXZGJZw1/qAlOqOOQ92BA3M/3juQKdFeD3/Lw7/6wm3
         fN3ZkdtWW4Go5yn+lHtkrXJ7EFOa+lSq5LFajLAPHMJmVgHTKRkVZriiVmnOUXDnk++0
         OmM+rrdj2b9ILPeUB+wpzuRAMfxUgmiBriEe7rkqHMFgNS59lKFqK+/pG645rpM2X761
         eIVUM/6oJO80fDX/hieSiziCoEDi7t6sKEohUjzwb09Cryzgc3M3VqzSBjl4CXL2lBOM
         gbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=CN5hHjMIPHO/GMteEkHH8lxx5y/cl+D15tG5+ZrsW+k=;
        fh=+qw/+PvktzSnPIobmvsLJfO4ehOb35a112R4+I6He1M=;
        b=RrurqSqnIZbwwUIbP/LSmZBfutibD9gtyt5+fZr4xgxo2EVxHYKKnUFdwyySJIHQeZ
         xBH8JzW/+98NeukkRH6f/OiTvtkDs+Qh777DpoZLXZmN8dn9iJopdjZm1iBG+EOKgcLs
         JMalF+lvCRnEE0/zV1k1ebfwZXnZGQ4p03n9eA7SWadpc+7us2AWWx+mnx68WcFEx7xx
         ODap0ZxqB93z4YqZudbzqbM/RlAUqFRV2SBhCCznBnCTN4rBffekikv325FZpG2C01zA
         RgAEnLCy3cRJ0EtYPff4/EMBAxnUMjGKpJsQXkQ4of5+brPh5rhIIKVrhP2J3POzo+YY
         8AXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZqGuMI1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b8bffsi128382981cf.20.2025.06.17.06.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZqGuMI1;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750166802;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CN5hHjMIPHO/GMteEkHH8lxx5y/cl+D15tG5+ZrsW+k=;
	b=KZqGuMI12F3CxdCDCDoWR0fb4LPYj11o7f7tQXtCZ0RVBfMLIkT8iUzRmZJ/ry0OtlBi/f
	Eri/XpZYS15oY1b0eky8LWQwWm+7TdlGeD5hzylySjvsytqZqtS6jnJScfu1xdFgG13Ocd
	EJU1hJA91W72z1e+idfX4mMac/z7P1o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-_3r-Dhr4MHacy5m9-3fC-w-1; Tue, 17 Jun 2025 09:26:40 -0400
X-MC-Unique: _3r-Dhr4MHacy5m9-3fC-w-1
X-Mimecast-MFC-AGG-ID: _3r-Dhr4MHacy5m9-3fC-w_1750166799
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so2140525f8f.0
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 06:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166799; x=1750771599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CN5hHjMIPHO/GMteEkHH8lxx5y/cl+D15tG5+ZrsW+k=;
        b=avj9ezQwx6T3hj0+H9MQBqKx4JGsAaVfph6w7CRFptob1BIKELaFmmpZUkUnelg9+X
         W4AoPBZbwX7OqawB3x2/OL+upilp1MGqe1qqustUjLNGJpIqfPF14o+S10kdBc/XK09s
         RrKDy4Iy+p5Z3HHLlTrfjXv33TGkfFA3V/ejeA+E2AuLvn7nGLtUSQD5I//VQAUwMHTP
         vSX1qnRlWm0FVAF0JuFUe5sBd95qyIHyeZv285xfGHr4nWcvRXXA9e2aFn6jT/4KGMo+
         BunwT0QhrzHXn5UEi+cI7DjOSgji2qoXPGvTHYZxHC/7IFtFT35OJELk3J6kvDJE1LG4
         SHRg==
X-Forwarded-Encrypted: i=1; AJvYcCWj5KL9gUV/t+QOtdsDD59EJcQJzM2tHFKTmoBkVIuOrABC822rwrYuNU9FWfwN5RZV+qRmN+2mwjnshg==@linaro.org
X-Gm-Message-State: AOJu0YwMW/H/TM3QUkh+epqcdIhoIrB8ZP/xbfolBlFaT6HwzQdBdBgB
	m+pqDfLb3X5FaZPVo1g2YYXUdgQokIL2emJLf+s/Vr7B4B5Nuhtx75e1eU2EWVumBcwUL2B9eun
	Sba0IIXz/SIitmexf3xIWwr4KNob1lK3PG45ExZ0PLtclcjXW11xX1IAPPw==
X-Gm-Gg: ASbGncuLQydaO0wE8I6L/+NdPnpLXrCXJnSyj/fA07aXSYPvQQUFzA1cy+QNLLif2Z1
	Ab3KtTNbzFZI66nIIjusKIAATQchsnI9PZVAoJJrHOWX5CTKlkHLguOyKgdh32RJc5wi8RwXttd
	MiCzWzTEMVb1MOffLM8wQIfKKL31PQJcl9IbElELCmNfM2qOJZFMuZxi5tgbbMlWJJLClNHGfyL
	ye/sL3ugyApGvcIIPVQV1g+0NGmPHAbzlvWI0MphyjYT/L1ulLS0Aybp313+snB3jQYk0wSeLgC
	pGDk5nO6ZfYa6y2QN3vJK2UJDeMSWDooX5JfGVvrZtlXJeGxz7IMfRfToFWEZVL1zpB6wg==
X-Received: by 2002:a5d:64cc:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a56d7cd56bmr12345024f8f.8.1750166799294;
        Tue, 17 Jun 2025 06:26:39 -0700 (PDT)
X-Received: by 2002:a5d:64cc:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a56d7cd56bmr12344992f8f.8.1750166798808;
        Tue, 17 Jun 2025 06:26:38 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b62ba7sm14314490f8f.91.2025.06.17.06.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:26:38 -0700 (PDT)
Message-ID: <cd38280c-6f5e-4c58-b40c-3391d121e557@redhat.com>
Date: Tue, 17 Jun 2025 15:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v4 0/8] hw/arm: GIC 'its=off' ACPI table fixes
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <5b0f2250-e521-4172-870c-0384c5ef2382@redhat.com>
 <36ac7f90-d946-439f-ab20-123f542291b6@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <36ac7f90-d946-439f-ab20-123f542291b6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IrEgVHCpQassoMvAdkV2LpaqcwMz5QC9Ywr67y-rEt8_1750166799
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YNRTA33AUw3w

Hi Gustavo,

On 6/17/25 3:01 PM, Gustavo Romero wrote:
> Hi Eric,
>
> Thanks a lot for doing a first pass on this series!
>
> On 6/17/25 06:35, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>>> Since v2:
>>> - Fixed no_tcg_its inverted logic (rth)
>>>
>>> Since v3:
>>> - Fixed remappings in the IORT table when ITS is no present
>>> - Rebased on master and resoled conflics, like no more "no_its"
>>>    flag in VirtMachineClass
>>> - Dropped patch 1/9 because we actually want the instance flags,
>>>    not only the class flags, and the instance flags are the ones
>>>    to be used often when deciding about the presence/absence of a
>>>    machine feature, instead of the negated class flags ("no_*")
>>> - Adapted the other patches that depended on 1/9
>>> - Dropped patch 4/9 in favor of using the instance flag for
>>>    checking if ITS is on or off
>>> - Simplified VM options for the new "its=off" test
>>>
>>> v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
>>> v2:
>>> https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html
>>> (Patches 6/14 -> 14/14 in the series)
>>> v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
>>>
>>> Fix ACPI tables for '-M its=off' CLI option and resolve the issue:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/issues/2886
>>
>> One first comment is that this series will collide with Shameer's SMMU
>> multi instance series which has been lunder review for quite some time
>> (adding him in TO):
>>
>> I think it may be more future proof if you could rebase on it - I know
>> it is a pain ;-( -. Or if sbdy objects for Shameer's series please raise
>> your voice now.
>>
>> [PATCH v4 0/7] hw/arm/virt: Add support for user creatable SMMUv3
>> device
>> <https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/#r>
>>
>> https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/
>>
>
> ayayay, life is never that easy! :)
>
> Thanks for point that out. Sure, I can rebase it on Shameer's series,
> but also
> I'd like to have this ITS fix for 10.1, so I think it's a matter of
> understanding
> if Shameer's series will make the 10.1 release (thanks for asking the
> reviewers if they
> have any current objection so we have an idea if it's close to get
> accepted
> or not)?
Peter was the most annoyed by the usage of -device arm-smmuv3 option
line. We'd better ask him.

On my end I don't see how we can achieve this more elegantly.
>
> Meanwhile, I'm pretty keen on if I'm correctly generating the IORT
> table pruned from ITS
> (patch 7/8 in this series), like, are the remappings for the RC and
> SMMU nodes correct? That
> would make me more comfortable to start working on a rebase.
sure looking at it...

Eric
>
>
>> Also I understood Shameer intended to write some new bios-tables-test.
>
> I see.
>
>
> Cheers,
> Gustavo
>
