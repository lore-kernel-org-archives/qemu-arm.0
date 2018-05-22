Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1460630wme;
        Tue, 22 May 2018 05:58:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp80+pBd5qIkBYlXu5LHRc2/V5gh7yJltrOQrCyquJM4iKaYuLYM27DpPniQf26omFbP7BM
X-Received: by 2002:ac8:7159:: with SMTP id h25-v6mr22039220qtp.206.1526993890968;
        Tue, 22 May 2018 05:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526993890; cv=none;
        d=google.com; s=arc-20160816;
        b=PpZkFquEKbcX7Ajkuq9iOXSyo2oanBS8qaUFKdhVbKGE5UhvTcRLEK6rIQgcUCxyDZ
         gLO0G5FDkfg2Yryy8EkduBHw3FjOkFWjl1E0LGbXCJh1NR8PfD+NRSM4apUsZ8Jhp314
         JlZM7GvAAOUBFEvm9aseDh7fs/QrKysH9kbEiSaLYmMz4HFQjjJf9eoaT0KLeFbZpthC
         ivwfjR+lTSwSQ/uwRlWcgNBcWtZyc/WUQ7YKT1nGC4OA5stnapr+e+WZV1KqnZpwB3/M
         Kw8tg9mLuWZQ5xqLaoK/orUuwgrRfAYgaE7U+i6XQ0Cq9Wttn99yj81OgQ+t2lSV+rP2
         msGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=hbPyrdh9/4u6ODUlPZYYb9xKiqEbrmMMxvqL8J+Ge48=;
        b=FMi/4OsXb/vdFa7Jy1v0qYfeVB3IKitoYlQQvcPzQDS9WlharQEJ7SsQnkuqKGS+XS
         cWZyCWnuCWKKWdwMx4aFpMrCgSJVq/sM3yauBcZLnekm2k//BPIDRxmjRkG7fza91svE
         JMLIzuEtzFx+pc7S+RCYqI2nG5m3wPFH/XwOe/0A1VddIn37nhSXLPHEwOsRbi/rFIW6
         R16wBjT2Mq1FpUSRVyZwQzojBoleZ1W4DiUNqQTWTjdgYL05BOE50ynJw9K0en7ibfVu
         KihvudnzfUsfrAcFkO0XElZ/67RnZdHMNSl+NXaGN4E/v7KtRdj5g2uoHj8EzfjSgcjr
         GDvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id q11-v6si412149qvh.26.2018.05.22.05.58.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 05:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92C1281663C7;
	Tue, 22 May 2018 12:58:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5931C906AD;
	Tue, 22 May 2018 12:58:08 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
Date: Tue, 22 May 2018 14:58:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 22 May 2018 12:58:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 22 May 2018 12:58:09 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: +JUqANQZ9vqZ

Hi Peter,
On 05/21/2018 04:03 PM, Peter Maydell wrote:
> If an IOMMU supports mappings that care about the memory
> transaction attributes, then it no longer has a unique
> address -> output mapping, but more than one. We can
> represent these using an IOMMU index, analogous to TCG's
> mmu indexes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
>  memory.c              | 23 +++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 309fdfb89b..f6226fb263 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
>   * to report whenever mappings are changed, by calling
>   * memory_region_notify_iommu() (or, if necessary, by calling
>   * memory_region_notify_one() for each registered notifier).
> + *
> + * Conceptually an IOMMU provides a mapping from input address
> + * to an output TLB entry.
actually it takes a source identifier too (ARM streamid + substreamID,
this latter is not yet supported).
At the moment we have 1 IOMMUMRRegion per sid on ARM. For each
IOMMUMRRegion we would now have 2 indexes (1 for secure and 1 for
unsecure). How do you see the implementation of PASIDs (substreamids).
Would that be based on indexes or not?
 If the IOMMU is aware of memory transaction
> + * attributes and the output TLB entry depends on the transaction
> + * attributes, we represent this using IOMMU indexes. Each index
> + * selects a particular translation table that the IOMMU has:
> + *   @attrs_to_index returns the IOMMU index for a set of transaction attributes
> + *   @translate takes an input address and an IOMMU index
> + * and the mapping returned can only depend on the input address and the
> + * IOMMU index.
> + *
> + * Most IOMMUs don't care about the transaction attributes and support
> + * only a single IOMMU index. A more complex IOMMU might have one index
> + * for secure transactions and one for non-secure transactions.
>   */
>  typedef struct IOMMUMemoryRegionClass {
>      /* private */
> @@ -290,6 +304,26 @@ typedef struct IOMMUMemoryRegionClass {
>       */
>      int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr attr,
>                      void *data);
> +
> +    /* Return the IOMMU index to use for a given set of transaction attributes.
> +     *
> +     * Optional method: if an IOMMU only supports a single IOMMU index then
> +     * the default implementation of memory_region_iommu_attrs_to_index()
> +     * will return 0.
> +     *
> +     * The indexes supported by an IOMMU must be contiguous, starting at 0.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     * @attrs: memory transaction attributes
> +     */
> +    int (*attrs_to_index)(IOMMUMemoryRegion *iommu, MemTxAttrs attrs);
> +
> +    /* Return the number of IOMMU indexes this IOMMU supports.
> +     *
> +     * Optional method: if this method is not provided, then
> +     * memory_region_iommu_num_indexes() will return 1, indicating that
> +     * only a single IOMMU index is supported.
> +     */
>  } IOMMUMemoryRegionClass;
>  
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> @@ -1077,6 +1111,24 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
>                                   enum IOMMUMemoryRegionAttr attr,
>                                   void *data);
>  
> +/**
> + * memory_region_iommu_attrs_to_index: return the IOMMU index to
> + * use for translations with the given memory transaction attributes.
> + *
> + * @iommu_mr: the memory region
> + * @attrs: the memory transaction attributes
> + */
> +int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
> +                                       MemTxAttrs attrs);
> +
> +/**
> + * memory_region_iommu_num_indexes: return the total number of IOMMU
> + * indexes that this IOMMU supports.
is it IOMMU wide characteristics or per IOMMUMRRegion (SID)?

Thanks

Eric
> + *
> + * @iommu_mr: the memory region
> + */
> +int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
> +
>  /**
>   * memory_region_name: get a memory region's name
>   *
> diff --git a/memory.c b/memory.c
> index 10fa2ddd31..07d5fa7862 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1918,6 +1918,29 @@ int memory_region_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
>      return imrc->get_attr(iommu_mr, attr, data);
>  }
>  
> +int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
> +                                       MemTxAttrs attrs)
> +{
> +    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> +
> +    if (!imrc->attrs_to_index) {
> +        return 0;
> +    }
> +
> +    return imrc->attrs_to_index(iommu_mr, attrs);
> +}
> +
> +int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr)
> +{
> +    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> +
> +    if (!imrc->num_indexes) {
> +        return 1;
> +    }
> +
> +    return imrc->num_indexes(iommu_mr);
> +}
> +
>  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>  {
>      uint8_t mask = 1 << client;
> 
