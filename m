Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp968378wme;
        Mon, 21 May 2018 20:03:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpNgNUcvjPMPufZYXF9B/ACsahVo5ZoI+2PirxB1ds9BMTlbMoH0IaCgkgwXA4h+j6UaemD
X-Received: by 2002:ac8:4611:: with SMTP id p17-v6mr19834343qtn.320.1526958220067;
        Mon, 21 May 2018 20:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526958220; cv=none;
        d=google.com; s=arc-20160816;
        b=B2l+RmLo0wHUC1VgMJlWx01Rp2ejUuA5lon4gIi+MUfdPini5XUot3hRiWS+Ca9Qc0
         qJxFZpDATuk8EGS6p+QVPpppyT9ZHOE6eeVmYU2E0k5afVTv2EnfyNXdbVupJHgIYlkh
         WXM9dKpF86jezZdHw4RnOzZzzXbkFdJBEyARXIiiAGWBtp08PLCI6XZx2twIFtCm8SQV
         4sh3JBuP/jSUAJeMVkL84tQOl2ShVBJfIXQnAogbReY9FwBXUik9quQQhs60n3WegHdh
         GQ/kTqZRsdBM37BNBcIT44NOoIGx4aInkOKBn2flLhyNFj7huAAswR2yU8DYcgtiJSfg
         H5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=STXbcRiEq2M3Ap4L21tt6kgIXzBaaMLZybe2FfZ3UGM=;
        b=Z4Gg2TCx42PFB4utS6F1/lb49zicEg050jf/BB64hTaAqU71npiMxAptYFaaCXkzdy
         xF0nKrbU9XMqpU1Ld8jccWLyY3zAl/zBEYE/Kxs6QNR5BtIdsi49bXkyv/15nOtI3/b+
         lyDPrtmi5q7tmCrDvGapU/23VTWiIlXx7Ta0LvaUL9iTFuT9f982JF6qHtbWowziG8YM
         lI2wdIcrVn8k6/VhwidebR1t3fDtwnALliEGOsiAIkwnSlXsp9EMadhD2BuI3Ox0TZM1
         HGFNJ4TgIXiEZmEOSw6FKzlJClF7+fkIcEMLsnAA5tebI2ytFB/ytb+GqjdRhNYcIFmK
         ZRqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id e11-v6si810384qtf.225.2018.05.21.20.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 20:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 771F340711B2;
	Tue, 22 May 2018 03:03:39 +0000 (UTC)
Received: from xz-mi (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C57F1215CDA7;
	Tue, 22 May 2018 03:03:36 +0000 (UTC)
Date: Tue, 22 May 2018 11:03:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
Message-ID: <20180522030333.GB17282@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180521140402.23318-15-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 22 May 2018 03:03:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 22 May 2018 03:03:39 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-TUID: +xnr2HvqA1Na

On Mon, May 21, 2018 at 03:03:49PM +0100, Peter Maydell wrote:
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
> + * to an output TLB entry. If the IOMMU is aware of memory transaction
> + * attributes and the output TLB entry depends on the transaction
> + * attributes, we represent this using IOMMU indexes. Each index

Hi, Peter,

In what case will an IOMMU translation depend on translation
attributes?  It seems to me that we should always pass in the
translation attributes into the translate() function.  The translate()
function can omit that parameter if the specific IOMMU does not need
that information, but still I am confused about why we need to index
IOMMU by translation attributes.

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

The num_indexes() definition is missing, and I saw that in the next
patch.  We'll possibly want to move it here.

Regards,

-- 
Peter Xu
