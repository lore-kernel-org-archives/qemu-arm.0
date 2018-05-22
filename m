Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1352623wme;
        Tue, 22 May 2018 04:11:59 -0700 (PDT)
X-Received: by 2002:aca:4b06:: with SMTP id y6-v6mr14267562oia.40.1526987519265;
        Tue, 22 May 2018 04:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526987519; cv=none;
        d=google.com; s=arc-20160816;
        b=HEJk5USpz6SQ8MYm0PCQCN2hXrqS92RHyKC0SyzUu5xegWLhInWtUdRkgq4iy404cC
         8E/LeajOVmKTwbS3Xau2JarmeMo5A9XGsQc5ptq4gaaEuQwXaYHgFnUv4tU4peBgOVKq
         yPz/uPhe5aFO51kJ/r5xarxSGQfCqLMmHKagtZjdVHdP6q7OBzER8zCsdldvf4MRD4zl
         k8LFcK04LonpTDXW2WIKyh6QtLjNCUSqH6U0I29iIfswEgBcSE3HnUhT7H1S+pmbyHOY
         hmoVQ+FwHZgkZiZHz1Z7OZm5IQydogbMSSRPvxR7SlNSf2zukQxIhWamA50AvhSPeAgk
         Navg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=8Iz81XYcHhaT+LsgD9XXb60x2qBag5l5yAfuZWnVDsA=;
        b=ZQ4cimIHdrozE/j3Q3QXLlBNAXAGPeCIrPqpI13pTa4mypSyisjaj45G+C9zC+i4G7
         jTV+RmlFHOAG6BrhSrbMlT7ye6zMM0GmwQbCnAIZyNk5v4HkEnI4K7Voxn9mHRN17GPG
         22UCLHnQ/oasYo0XRZ/SusRHIRlgv9KvKXk+yxtpgHP7qwyCLkFZECJqzEvVh6Viro3p
         WNIMRB0NGpnGMzgYHks64nY3JTcr0NVduZYuIqfJOcpDrhH8ErvUSK2wfeU9lHFB9LsH
         oKNG8CAWj1rhrUmy4BrCC6TgJEOSLjhtxvDHNz9WeRy8XrHBTCzmqsOoeGBQUWdSGahQ
         vscA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqP4ZU9o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p203-v6sor7800790oic.182.2018.05.22.04.11.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 04:11:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqP4ZU9o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8Iz81XYcHhaT+LsgD9XXb60x2qBag5l5yAfuZWnVDsA=;
        b=XqP4ZU9oMY+gacTuECArdJMSqoWhWXHzpOXy7f1gFi1FEpm0OqEF36+bjapmb2cOjd
         4ik49KjPR1D9/9YsRRuYG9qFpYCQoHnzSRy8zakkV0ki95GNATuxRRn2jNzg+NHASpKI
         SQBXkYnIeuRwsxF/s3k8pCabkFvDNjXU65X5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=8Iz81XYcHhaT+LsgD9XXb60x2qBag5l5yAfuZWnVDsA=;
        b=N/bbfE3DP2G1nUX/0ycjXfT6bxuFEz6GBdYE3WGA2k4CXfT5fal4WHEy9pnEeF/Nde
         CcLOkD6I1/kplDpI2wTjyEF4rAlks26ksxx2oy5h9WQLkLjiXDJbXbYPfojm4yeQ3bkI
         WvNreQzz57uIPOi+90V2rV58IZfeTP7ecFXbKjyIykB0XelYR6wHMR+0Ko3IlPdt1jrT
         w1Yfzs+GWQkWGOe37iNseB5/nC9M3C2MsmLSEFfA0lKcQtOaTr74/x2+U0y/dVfTf2Pd
         s6dXYO1wtbkh+mbhL4+pkTD0LwxFZXSj7JBE2QnGOrMSxuFeSyg70Yp1DAs71in4GPXu
         27+Q==
X-Gm-Message-State: ALKqPwdUUV5Lmj54ctSY6t+24JO+GV2Cc2+l9/twdvloj3DFwUnuMJ/5
	obidi1xieCiQiA944WuQNGz1PmvKibBl0pC78If1HYMR
X-Google-Smtp-Source: AB8JxZroM/i3kuvJQhVaKtfcDaYpzlH0it3Xth1uXZgEkuO0PJ2n9IKvwVk6RyEH+3Uhf+54dY4lFQZzlJGPaVYv934=
X-Received: by 2002:aca:cd0b:: with SMTP id d11-v6mr12979111oig.337.1526987518834;
 Tue, 22 May 2018 04:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 04:11:38
 -0700 (PDT)
In-Reply-To: <20180522110236.GB31932@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <20180522030333.GB17282@xz-mi>
 <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com> <20180522110236.GB31932@xz-mi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 12:11:38 +0100
Message-ID: <CAFEAcA9b6dmpj+B=SO2YsB5sXsh=UPjkjN_U0i-uJhiDn20HHw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: cvbzsBTNQcgV

On 22 May 2018 at 12:02, Peter Xu <peterx@redhat.com> wrote:
> On Tue, May 22, 2018 at 09:40:44AM +0100, Peter Maydell wrote:
>> On 22 May 2018 at 04:03, Peter Xu <peterx@redhat.com> wrote:
>> The reason for not just passing in the transaction attributes to
>> translate is that
>> (a) the iommu index abstraction makes the notifier setup simpler:
>> rather than having to have some indication in the API of which
>> of the transaction attributes are important and which the notifier
>> cares about, we can just use indexs
>
> Hmm, so here IIUC we'll have a new IOMMU notifier that will only
> listen to part of the IOMMU notifies, e.g., when attrs.secure=true.
> Yes I think adding something into IOMMUNotifier might work, but just
> to mention that in IOMMUTLBEntry we have IOMMUTLBEntry.target_as
> defined.  Until now it's hardly used at least on x86 platform since
> all of the translations on x86 are targeted to the system RAM.
> However it seems to be quite tailored in this case since it seems to
> me that different attrs.secure value for translations should be based
> on different address spaces too.  Then in the IOMMU notifiers that
> would care about MemTxAttrs, could it be possible to identify that by
> check against the IOMMUTLBEntry.target_as?

No, because you can have a single address space that receives
transactions with various attributes. (Again, the MPC is an
example of this.)

>> (b) it means that it's harder to write an iommu with the bug that
>> it looks at parts of the transaction attributes that it didn't
>> claim were important in the notifier API
>
> It is just confusing to me when I looked at current translate()
> interface (I copied it from some other patch of the series):
>
> @@ -252,9 +252,10 @@ typedef struct IOMMUMemoryRegionClass {
>       * @iommu: the IOMMUMemoryRegion
>       * @hwaddr: address to be translated within the memory region
>       * @flag: requested access permissions
> +     * @iommu_idx: IOMMU index for the translation
>       */
>      IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
> -                               IOMMUAccessFlags flag);
> +                               IOMMUAccessFlags flag, int iommu_idx);
>
> The "iommu_idx" parameter is really hard to understand here at the
> first glance.  Now I think I understand that it is somehow related to
> the MemTxAttrs, but still it will take time to understand.

The part of the documentation where I try to explain the general
idea is in this patch, in the comment at the top of the struct:

+ * Conceptually an IOMMU provides a mapping from input address
+ * to an output TLB entry. If the IOMMU is aware of memory transaction
+ * attributes and the output TLB entry depends on the transaction
+ * attributes, we represent this using IOMMU indexes. Each index
+ * selects a particular translation table that the IOMMU has:
+ *   @attrs_to_index returns the IOMMU index for a set of transaction
attributes
+ *   @translate takes an input address and an IOMMU index
+ * and the mapping returned can only depend on the input address and the
+ * IOMMU index.
+ *
+ * Most IOMMUs don't care about the transaction attributes and support
+ * only a single IOMMU index. A more complex IOMMU might have one index
+ * for secure transactions and one for non-secure transactions.

Do you have suggestions for how to improve on this?

> And if we see current implementation for this (still, I copied code
> from other patch in the series to here to ease discussion):
>
> @@ -498,8 +498,15 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
>      do {
>          hwaddr addr = *xlat;
>          IOMMUMemoryRegionClass *imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
> -        IOMMUTLBEntry iotlb = imrc->translate(iommu_mr, addr, is_write ?
> -                                              IOMMU_WO : IOMMU_RO);
> +        int iommu_idx = 0;
> +        IOMMUTLBEntry iotlb;
> +
> +        if (imrc->attrs_to_index) {
> +            iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
> +        }
> +
> +        iotlb = imrc->translate(iommu_mr, addr, is_write ?
> +                                IOMMU_WO : IOMMU_RO, iommu_idx);
>
> Here what if we pass attrs directly into imrc->translate() and just
> call imrc->attrs_to_index() inside the arch-dependent translate()
> function?  Will that work too?

You don't always have the attributes at the point where you want
to call translate. (For instance, memory_region_notify_iommu()
doesn't have attributes.)

I started off with "pass the tx attrs into the translate method",
which is fine for the code flows which are actually doing
memory transactions, but breaks down when you try to incorporate
notifiers.

> I had a quick glance at the series, I have no thorough idea on the
> whole stuff, but I'd say some of the patches are exactly what I wanted
> if to support MemTxAttrs in VT-d emulation one day (now DMAR of VT-d
> is bypassing MemTxAttrs and IMHO that's incorrect).  If we can somehow
> pass in the MemTxAttrs then that'll be perfect and I can continue to
> work on that.  If we pass in iommu_idx now instead, it would take some
> time for me to figure out how to further achieve the same goal for
> VT-d in the future, e.g., I would still want to pass in MemTxAttrs,
> but that's obviously duplicated with iommu_idx.

The idea is that you should never need to pass in the MemTxAttrs,
because everything that the IOMMU might care about in the tx attrs
must be encoded into the iommu index. (The point where the IOMMU
gets to do that encoding is in its attrs_to_index() method.)

thanks
-- PMM
