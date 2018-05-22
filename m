Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1550297wme;
        Tue, 22 May 2018 07:11:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp2MHN6KakjtNwsQRHZRmTbE66TxxruNwc1VL5Ro1HUSU6NCDKkFzEf4F5FX9OhQqhsWlrg
X-Received: by 2002:ac8:194c:: with SMTP id g12-v6mr2942132qtk.53.1526998313681;
        Tue, 22 May 2018 07:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526998313; cv=none;
        d=google.com; s=arc-20160816;
        b=I2a3vQCVhaxK5LcZfWkn0PGzVJj8ELbK8xMZyNbkuoWnHgsdXw34ydeXhe4CmD3v3y
         AMH0ZmmtCmcqnUbR1NucL7rKEWmPlKKG/9fZZykNAlsJsgNBl1wtUyeK12aSJ2DcTYhM
         jjBBG6wWdx9GXwLgJNgf4oUgR0FVMmN+p/1wlSVkY3xy+/WNsTLTAZzcz5/wFFKhQ0F+
         L7zkAMTqsFjEt1LVDVZ2h+d7JrXJ/fGpWHzxyf+nsbYgJWoO+pVqOKBkytUnqG09AjSu
         d9BsLwioHfry0nLikKXCxvRC1LZGB7KJ4KKm76h6O/Nwjjlhc9gF/rTKahQbZYnEF+ZI
         jdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=DpKgljne/e9QSmbIskryyGgbJVde3xYuSB7kuxjflu4=;
        b=dSAA5nyo2SDB9RmVdzaQexxLvNfZ4OkPdSWPRvAV0B5Bg7LQCK/TF2+3OE+9IpXYdV
         oS/I5DVhi1qkI8jML35Xgitq/JYdf9Y++iRyPwtQCH2Mbo+d1BhsKEVuP5d9PlsBramj
         VqzHTFpk/ujY25MCdfqOn1vN2H50Cr2UkDYCDYZfMED6bVQFjwZMhXUycKFjklM0CsjC
         lZjVmDDZK7hdmpk0PnaAkNReL3OFOcZptGydUb8hpPQovAPg69hRbLcarvNt5BtMBSHR
         fwmBTCxWvlU2BkL4tWKCZQxh+qmusM+rpkwcLquXHcs+ks+sBcD3t5w3YPdhPxbYLxUM
         bTFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id r17-v6si206120qvm.9.2018.05.22.07.11.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 07:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2484E81FE14A;
	Tue, 22 May 2018 14:11:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E21215CDA7;
	Tue, 22 May 2018 14:11:51 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
 <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
 <CAFEAcA-R9t4K488viYM9ipmfArA=ijMMJn+FD1wekPdAbNOHvQ@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <595dcb89-3856-3755-e8db-7791c1374284@redhat.com>
Date: Tue, 22 May 2018 16:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-R9t4K488viYM9ipmfArA=ijMMJn+FD1wekPdAbNOHvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 22 May 2018 14:11:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 22 May 2018 14:11:53 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: kU0H9oemu3pK

Hi Peter,

On 05/22/2018 03:22 PM, Peter Maydell wrote:
> On 22 May 2018 at 13:58, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>>> If an IOMMU supports mappings that care about the memory
>>> transaction attributes, then it no longer has a unique
>>> address -> output mapping, but more than one. We can
>>> represent these using an IOMMU index, analogous to TCG's
>>> mmu indexes.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
>>>  memory.c              | 23 +++++++++++++++++++
>>>  2 files changed, 75 insertions(+)
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index 309fdfb89b..f6226fb263 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
>>>   * to report whenever mappings are changed, by calling
>>>   * memory_region_notify_iommu() (or, if necessary, by calling
>>>   * memory_region_notify_one() for each registered notifier).
>>> + *
>>> + * Conceptually an IOMMU provides a mapping from input address
>>> + * to an output TLB entry.
>> actually it takes a source identifier too (ARM streamid + substreamID,
>> this latter is not yet supported).
>> At the moment we have 1 IOMMUMRRegion per sid on ARM. For each
>> IOMMUMRRegion we would now have 2 indexes (1 for secure and 1 for
>> unsecure). How do you see the implementation of PASIDs (substreamids).
>> Would that be based on indexes or not?
> 
> Good question. I guess we would set that up so that the
> substream ID is in the memory transaction attributes as the
> requester_id and then use that as part of the IOMMU index ?
> Or you could use the indirection between tx attrs and indexes
> to allow you to map down a potentially large space of substream
> ID values to a smaller set of actually different configurations.
> 
> How many substream IDs do we expect to see in practice?

Spec says max 20 bits, matching the max size of the PASID

Thanks

Eric

> 
>>> +/**
>>> + * memory_region_iommu_attrs_to_index: return the IOMMU index to
>>> + * use for translations with the given memory transaction attributes.
>>> + *
>>> + * @iommu_mr: the memory region
>>> + * @attrs: the memory transaction attributes
>>> + */
>>> +int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
>>> +                                       MemTxAttrs attrs);
>>> +
>>> +/**
>>> + * memory_region_iommu_num_indexes: return the total number of IOMMU
>>> + * indexes that this IOMMU supports.
>> is it IOMMU wide characteristics or per IOMMUMRRegion (SID)?
> 
> I generally in this API document have been treating "IOMMU" and
> "IOMMURegion" as synonymous, since from the perspective of the API
> we don't care whether there's a bigger underlying thing in common
> between IOMMURegions.
> 
> thanks
> -- PMM
> 
