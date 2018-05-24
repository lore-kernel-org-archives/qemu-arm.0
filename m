Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2092842wre;
        Thu, 24 May 2018 10:03:52 -0700 (PDT)
X-Received: by 2002:a9d:5990:: with SMTP id u16-v6mr4841345oth.370.1527181432478;
        Thu, 24 May 2018 10:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527181432; cv=none;
        d=google.com; s=arc-20160816;
        b=KxrDVI/VUDJIsMXBiL1xeSZY9YFH3MdTzQ0OJEWyl0DeCCLXeP5kvoanW/rUA3JKFg
         w+JVPztQgRZl36FI86z8PaMsr6k/P0Whm+u4aeln4W93W6rJuWVAY2UWaBvgDZuZn4mh
         jA8JXOaGL/jc3fwzOGqubw/SAC4UsdWSbJHQrKGgX0s84f17NhngvZOfgZ1MwiFwcUdI
         eXIP1oOSP9tNx923RLiUjMP11sF5bkUXLJZQOOmxj/FcAM+VUyiTJ4hm3MErAuXl3XWS
         ahs9T7WziJ8RLruSDw/p8mTTeJsGaRxPBIrdzZ2hCyXs6mH+S9BO3xMBTnRWeBycxlnb
         7/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ooSu6JVusfRVeYs1O7F05G3vI1n8tfAWtiAlA51yTVE=;
        b=bL17gFYxOWrsHk6N6PF2JAwKPO5TJNtX9u96/G1XpzvlyUdZyZodt8Tfs+O5hXqaGo
         FajPOnocN363aYbum2HUeqnBBvfW6DaOD0QdD///XeQ6kzzADwGRHNbrVzcybUzP77ok
         /+42F4iCbMr/mmniuv+sbHxwjcbrUTTgbROPMvs5/pKiOuHkP15JgHRe3hwv5szRhfq1
         NgS6Vx/Y0a92aYjNJY/AfeEnd9iKOUmAoHl9DgWsn4/Mackmj2eNGUFk5T5vwy04k8ng
         FkhqWWC9A6v1zWtd5nA9DCkPgQVPLXJ6mlkh5+Sni3fs4sLu0O4FCeEvhvBBqcX4uNbG
         Lsbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8ztw2Eh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b56-v6sor11602955otd.182.2018.05.24.10.03.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 24 May 2018 10:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8ztw2Eh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ooSu6JVusfRVeYs1O7F05G3vI1n8tfAWtiAlA51yTVE=;
        b=P8ztw2EhvjAGSdBTMA4QSpp1oWiyktLzAETUpscQOhtmZkUvmxZFzcV2ZPIkMuWabo
         dv5CDE9Mrg/5U0W6mvTg62zONdW8OUVGbW/zjLD0WPgpQjhxYQ6dlPy0xT3XycqgQuAz
         t7e79Nok7bLZFkyMtbvhFBds5awE5U6wYqUMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ooSu6JVusfRVeYs1O7F05G3vI1n8tfAWtiAlA51yTVE=;
        b=haRuaDZkeu4FAE0HNdZ/0Ikgl7VO6s5f1w4YtShdNQtM6CTMR+mVJQaLXGIFwOgXWR
         hZb5FVjYXp48JvozX1NhAA13UtFb0WJSiMLncexEoFIPVXkkPbNiJInuPkGmQj5vjX6W
         uDwvI5rFA/MqAQOMwcLmYrsbka1cY/taIkiiHW06IvTV8N1UTHBBjhRxa4meiO5I6LY9
         BEj4n6WNJBl1ih1jiWLhCDx1XI5EeSQ1soe5zNLovfQKvniL0nTwH7lPl4fTBInuMuz2
         IQwNiF0qALMYFsHmee6aq/o/pDY155qRhMW2vU0e7NmT6ZxqQkNI1CA0pYcIHgAcTyfV
         5C7Q==
X-Gm-Message-State: ALKqPwdF04TcolJk5ssLXdUXPzirWKPh7tOIspK8A+ysieCtkotcNlIP
	HhlvTPl2TxZdSqI/+rHtIJk6MpjWv5wOHfgxT3LlODsvLt4=
X-Google-Smtp-Source: AB8JxZokepJNE9SfaObCe9bEbANqwq3oaAjm8R0fqNtLoarDbq4/zTK3qVXtwn91FJY2a8fuww0c4X+3T0svOb+K5R4=
X-Received: by 2002:a9d:5014:: with SMTP id a20-v6mr4791306oth.205.1527181432100;
 Thu, 24 May 2018 10:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 10:03:31
 -0700 (PDT)
In-Reply-To: <0774094d-d3e1-5983-ccb8-3d3412bf44fc@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org> <0774094d-d3e1-5983-ccb8-3d3412bf44fc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 18:03:31 +0100
Message-ID: <CAFEAcA95XD7_4q0p0Q6aPCxHHxHoRrVaKc+Nq+niZp-4PV8JLw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 15/27] iommu: Add IOMMU index argument to
 notifier APIs
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5brGK80WxMG6

On 24 May 2018 at 16:29, Auger Eric <eric.auger@redhat.com> wrote:
> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index f6226fb263..4e6b125add 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -71,6 +71,7 @@ struct IOMMUTLBEntry {
>>      hwaddr           iova;
>>      hwaddr           translated_addr;
>>      hwaddr           addr_mask;  /* 0xfff = 4k translation */
>> +    int              iommu_idx;
> I don't get why ne need iommu_idx field here. On translate the caller
> has it. On notify the notifier has it?

I think this is an accidental leftover from some earlier draft;
nothing in the patchset actually reads or writes this field, and
it should be deleted.

>>      IOMMUAccessFlags perm;
>>  };
>>

>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 8e57265edf..fb396cf00a 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -507,6 +507,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>      if (memory_region_is_iommu(section->mr)) {
>>          VFIOGuestIOMMU *giommu;
>>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
>> +        int iommu_idx;
>>
>>          trace_vfio_listener_region_add_iommu(iova, end);
>>          /*
>> @@ -523,10 +524,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>          llend = int128_add(int128_make64(section->offset_within_region),
>>                             section->size);
>>          llend = int128_sub(llend, int128_one());
>> +        iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>> +                                                       MEMTXATTRS_UNSPECIFIED);
> In that case VFIO ideally wants to be notified for any guest update
> (whatever the page set) to reprogram the physical IOMMU corresponding
> entries and doesn't want to register a notifier per iommu_idx. Also it
> does not know which ones are supported. Is there a corresponding
> iommu_idx value? MEMTXATTRS_ANY?

If VFIO is actually dealing with an IOMMU that needs to handle
multiple possible transactions for different tx attributes, then
it needs to know about all of them, because how it programs
the physical IOMMU needs to be different for "map X to Y for
Secure transactions" versus "map X to Y for NonSecure" (say).
(This would require new kernel APIs, I assume.)

If, as is currently the case, the VFIO infrastructure assumes that
the IOMMU will always translate any transaction from a device
identically regardless of its transaction attributes, then it
should just use MEMTXATTRS_UNSPECIFIED, and trust that the
emulated IOMMU will translate those correctly. (There might be
scope for VFIO checking that the IOMMU really does, eg that
it is only using one iommu index?)

Basically, VFIO is shadowing the behaviour of the emulated
IOMMU to reflect it into the kernel; if the IOMMU it's shadowing
is complicated then VFIO is going to need to be similarly
complicated, and "merge updates for different page tables
down into one" is not going to be the right behaviour.

thanks
-- PMM
