Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1492370wme;
        Tue, 22 May 2018 06:22:37 -0700 (PDT)
X-Received: by 2002:aca:cd4e:: with SMTP id d75-v6mr14610737oig.291.1526995357879;
        Tue, 22 May 2018 06:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526995357; cv=none;
        d=google.com; s=arc-20160816;
        b=lUC7LQt4JFB8SBroc5iJBNrV7MxFUHYEk+xFfHqRNT9K7qdAl0nAtlwSaBWKkeO+2Y
         uxgbKEKWfszC6ru3Q0KT/sg4IAbSkZ8tFjZ5zYGqYwiYrDGnltdP1gF5GotFLIiewK73
         sac8bO0R4EyMLGmNn9iTwtzHYQhcHEgpBERrQrF2nS/TE2HyeS34ySjo0Z934Zv3npKE
         cAYBLgZF7W8gsvC0Ck8bY9oOGeUBEJGIbaLaONrbmZegat86innU9oB78QEvaPi9Xfzf
         oEzIcRaIMocoV6BTUpkDCCyHtC8ceNuyZcE7LvY3MckuriZjMPEiElORtgF+gRI+jPgA
         vg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=bHmNUlzkw1uEgjOVC7Ew3zbX4YwnvOel3D4eQHjgXAg=;
        b=PJB3VldacvLii+CnYHzTK39JHF0FuvJyNhmwty2b2sXpmC+TpePpYWA7ImJW98oa77
         Oz9L+MQVOUO6fCl+2+f6rW/BC5dL6lCPT3YB8E0y7cY0htmrbME+xQOPV12zcHUEeJjz
         IFL1InEg1ILg6gi0DOscijYdI4kwBOUEJR0NgnBMJGlaDyEmj/Eb65NLdjsGEUbVSKz2
         h8gCJjrNECzFEeLQMVR1fPRb4nFe+jqnMEjBIKC7q0/jSQ4epq9NcSmN8P4TY6ehwnxq
         Jk6efWdsHGKVrWDacqZrQ3C74zkv1aFto7ffmmDjzonqJ5I8HgI32DpspDX1FJwg3lVk
         zF2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T2Sv2td0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d3-v6sor7299980oig.114.2018.05.22.06.22.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 06:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T2Sv2td0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=bHmNUlzkw1uEgjOVC7Ew3zbX4YwnvOel3D4eQHjgXAg=;
        b=T2Sv2td0VVS30Y1lBGpxuKd9HUAnUMEuK6fK/g/umrhiYsK4dQax959yXrwjJw1ipa
         g1eEigCdYSisE4/jOCF+/qNzLnnFDdMyDKksBkzlpY6/NrB33u/vjKf92W706wJ1HvB7
         E5CIFKVjjIBZPoB3PbQ/pP//dAZ42HWwlbUrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=bHmNUlzkw1uEgjOVC7Ew3zbX4YwnvOel3D4eQHjgXAg=;
        b=eOwiEuUUkXJ2aDzzF1SpPKwWph96acBVs0f5Qk+c9uzxSqV9/k5M0es/DTnWDNRNtn
         8PnDWowCjWXS+T/G7dvAuyLHzovvosrX+Cr69/2Z8owVZDvo+9/RbxIh4/wH4MNAD1aq
         qacmt9qRr+6xl3fgkQT4xBbD9f681cbRJK+XerrV8l9CZq/8ivbw+TqzRWHrpYN64D83
         qjJyfkhsZerHgat/d3WGCGHPifK6rwrAsAEQILFXAgKfPeorQUBEgT9OiQ5xJS7/Qnj0
         tyHUTDeNY5bYc52iTLKqtHUH52WrkXAM3lB+tgQKn+P/hSoUcNe3pwXy53SJAuVrx33Z
         AE5Q==
X-Gm-Message-State: ALKqPweBGwpa++I0OLiGf0KIkvwHf7e7uvHwI/sE+YrCfMaWFZKxGIzB
	gN48YxSqPCeXeFDBBTOsFVpbss0emjKmYXADl3lIRMqE
X-Google-Smtp-Source: AB8JxZqVmPW+jTOLjBUgwd4xkKKFZXyfy9lvQD2qyl3wL3YZy0uk/HKhjGobDMdu4erWcwjL+v5zIRqjYIMH/wAUBmM=
X-Received: by 2002:aca:cd0b:: with SMTP id d11-v6mr13231351oig.337.1526995357532;
 Tue, 22 May 2018 06:22:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 06:22:17
 -0700 (PDT)
In-Reply-To: <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 14:22:17 +0100
Message-ID: <CAFEAcA-R9t4K488viYM9ipmfArA=ijMMJn+FD1wekPdAbNOHvQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: mEuCX2Yeck+6

On 22 May 2018 at 13:58, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>> If an IOMMU supports mappings that care about the memory
>> transaction attributes, then it no longer has a unique
>> address -> output mapping, but more than one. We can
>> represent these using an IOMMU index, analogous to TCG's
>> mmu indexes.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
>>  memory.c              | 23 +++++++++++++++++++
>>  2 files changed, 75 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 309fdfb89b..f6226fb263 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
>>   * to report whenever mappings are changed, by calling
>>   * memory_region_notify_iommu() (or, if necessary, by calling
>>   * memory_region_notify_one() for each registered notifier).
>> + *
>> + * Conceptually an IOMMU provides a mapping from input address
>> + * to an output TLB entry.
> actually it takes a source identifier too (ARM streamid + substreamID,
> this latter is not yet supported).
> At the moment we have 1 IOMMUMRRegion per sid on ARM. For each
> IOMMUMRRegion we would now have 2 indexes (1 for secure and 1 for
> unsecure). How do you see the implementation of PASIDs (substreamids).
> Would that be based on indexes or not?

Good question. I guess we would set that up so that the
substream ID is in the memory transaction attributes as the
requester_id and then use that as part of the IOMMU index ?
Or you could use the indirection between tx attrs and indexes
to allow you to map down a potentially large space of substream
ID values to a smaller set of actually different configurations.

How many substream IDs do we expect to see in practice?

>> +/**
>> + * memory_region_iommu_attrs_to_index: return the IOMMU index to
>> + * use for translations with the given memory transaction attributes.
>> + *
>> + * @iommu_mr: the memory region
>> + * @attrs: the memory transaction attributes
>> + */
>> +int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
>> +                                       MemTxAttrs attrs);
>> +
>> +/**
>> + * memory_region_iommu_num_indexes: return the total number of IOMMU
>> + * indexes that this IOMMU supports.
> is it IOMMU wide characteristics or per IOMMUMRRegion (SID)?

I generally in this API document have been treating "IOMMU" and
"IOMMURegion" as synonymous, since from the perspective of the API
we don't care whether there's a bigger underlying thing in common
between IOMMURegions.

thanks
-- PMM
