Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1342605wme;
        Tue, 22 May 2018 04:02:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZogCRV+o2OkhxHUUaQHXo9OdxHd9lXAN+C2XE1PAhpTIujhT4G3u9vSMKHs0BNmp+rBqE/H
X-Received: by 2002:a37:10c4:: with SMTP id 65-v6mr6647665qkq.31.1526986963674;
        Tue, 22 May 2018 04:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526986963; cv=none;
        d=google.com; s=arc-20160816;
        b=zu/TLR97IzNk/Y63GdyPrhu9wyQiBsQWrBUfespVXaw23YhJBX4mVkDQ/aki8cLvp4
         tHs9aTZqnGxOYhGUEM1AzZcGYsP2we9t0qGb6gohQMs9BcEPFlTjE+mmtmHVY6z62Cpi
         zDgZL/UdtIGNefXqO7z2Zj7rZOFnL7R0lTasGpYotT2lfgOWKSdg2xhFxdJ8c18LAHnV
         lyaLT3Uo+F3I7N8YqoqnVC6BqdXljZOT6O9cOrwp61oja1zTkLjTYAf++MfwkGOt+4GY
         O2MdvA7KYFhbFu1tDuEmestzwhT3IVtx2U+7F3HZTMV35Rnp7X8mBgnd+uynsqPQFEZY
         GwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=MRmgPNbqu9nkR4Qu0C5jVnFy4XcXOIumume/b7tz2tk=;
        b=kRW8ztxZaTC3E8c+osNuue4u35sxTCNcqWcS4I5Z4ip39sUbtZFP79GWj/XJO5NAwa
         fGRMMk11b3GQvtXxtaVqUmmeNS9ojN+hgamYgHzraWMtXfbRXLLGo50vKlq2E1WDCa/+
         326GB3cb9Pw6H7ApV00/YGjYLNHa6UnvplQVQ3GyuOM0Cw9om0FnDcAdZct6yDxfPMrm
         61dFptrbGrDeF0SB94s6Ro+uCgaWY4vc+R3l1BFiI0KtzJFUj9+7TFj7MtlFc9cok48b
         nVARGr/SIHJIlm3ruutlkuGBTHxw5zBwNdKuQrrSZT+2aojsNPDwY0oKmKP1iQ5Xem+e
         8Wiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id y9-v6si2213597qtk.215.2018.05.22.04.02.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 04:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FD2C40214E2;
	Tue, 22 May 2018 11:02:43 +0000 (UTC)
Received: from xz-mi (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AF55215CDA7;
	Tue, 22 May 2018 11:02:39 +0000 (UTC)
Date: Tue, 22 May 2018 19:02:36 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
Message-ID: <20180522110236.GB31932@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
 <20180522030333.GB17282@xz-mi>
 <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 22 May 2018 11:02:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 22 May 2018 11:02:43 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-TUID: rOA+Nd6ani24

On Tue, May 22, 2018 at 09:40:44AM +0100, Peter Maydell wrote:
> On 22 May 2018 at 04:03, Peter Xu <peterx@redhat.com> wrote:
> > On Mon, May 21, 2018 at 03:03:49PM +0100, Peter Maydell wrote:
> >> If an IOMMU supports mappings that care about the memory
> >> transaction attributes, then it no longer has a unique
> >> address -> output mapping, but more than one. We can
> >> represent these using an IOMMU index, analogous to TCG's
> >> mmu indexes.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>  include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
> >>  memory.c              | 23 +++++++++++++++++++
> >>  2 files changed, 75 insertions(+)
> >>
> >> diff --git a/include/exec/memory.h b/include/exec/memory.h
> >> index 309fdfb89b..f6226fb263 100644
> >> --- a/include/exec/memory.h
> >> +++ b/include/exec/memory.h
> >> @@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
> >>   * to report whenever mappings are changed, by calling
> >>   * memory_region_notify_iommu() (or, if necessary, by calling
> >>   * memory_region_notify_one() for each registered notifier).
> >> + *
> >> + * Conceptually an IOMMU provides a mapping from input address
> >> + * to an output TLB entry. If the IOMMU is aware of memory transaction
> >> + * attributes and the output TLB entry depends on the transaction
> >> + * attributes, we represent this using IOMMU indexes. Each index
> >
> > Hi, Peter,
> >
> > In what case will an IOMMU translation depend on translation
> > attributes?  It seems to me that we should always pass in the
> > translation attributes into the translate() function.  The translate()
> > function can omit that parameter if the specific IOMMU does not need
> > that information, but still I am confused about why we need to index
> > IOMMU by translation attributes.
> 
> The MPC implementation at the tail end of the patchset is
> one example -- it needs to look at attrs.secure, because
> "translation for secure access to address X" differs from
> that for address Y". The Arm SMMUv3 is the same when it supports
> TrustZone (the implementation in-tree does not), and it can also
> give different permissions for transactions with attrs.user = 0 vs 1.

Thanks for providing more context.

> 
> The reason for not just passing in the transaction attributes to
> translate is that
> (a) the iommu index abstraction makes the notifier setup simpler:
> rather than having to have some indication in the API of which
> of the transaction attributes are important and which the notifier
> cares about, we can just use indexs

Hmm, so here IIUC we'll have a new IOMMU notifier that will only
listen to part of the IOMMU notifies, e.g., when attrs.secure=true.
Yes I think adding something into IOMMUNotifier might work, but just
to mention that in IOMMUTLBEntry we have IOMMUTLBEntry.target_as
defined.  Until now it's hardly used at least on x86 platform since
all of the translations on x86 are targeted to the system RAM.
However it seems to be quite tailored in this case since it seems to
me that different attrs.secure value for translations should be based
on different address spaces too.  Then in the IOMMU notifiers that
would care about MemTxAttrs, could it be possible to identify that by
check against the IOMMUTLBEntry.target_as?

> (b) it means that it's harder to write an iommu with the bug that
> it looks at parts of the transaction attributes that it didn't
> claim were important in the notifier API

It is just confusing to me when I looked at current translate()
interface (I copied it from some other patch of the series):

@@ -252,9 +252,10 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      * @hwaddr: address to be translated within the memory region
      * @flag: requested access permissions
+     * @iommu_idx: IOMMU index for the translation
      */
     IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
-                               IOMMUAccessFlags flag);
+                               IOMMUAccessFlags flag, int iommu_idx);

The "iommu_idx" parameter is really hard to understand here at the
first glance.  Now I think I understand that it is somehow related to
the MemTxAttrs, but still it will take time to understand.

And if we see current implementation for this (still, I copied code
from other patch in the series to here to ease discussion):

@@ -498,8 +498,15 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
     do {
         hwaddr addr = *xlat;
         IOMMUMemoryRegionClass *imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
-        IOMMUTLBEntry iotlb = imrc->translate(iommu_mr, addr, is_write ?
-                                              IOMMU_WO : IOMMU_RO);
+        int iommu_idx = 0;
+        IOMMUTLBEntry iotlb;
+
+        if (imrc->attrs_to_index) {
+            iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
+        }
+
+        iotlb = imrc->translate(iommu_mr, addr, is_write ?
+                                IOMMU_WO : IOMMU_RO, iommu_idx);

Here what if we pass attrs directly into imrc->translate() and just
call imrc->attrs_to_index() inside the arch-dependent translate()
function?  Will that work too?

I had a quick glance at the series, I have no thorough idea on the
whole stuff, but I'd say some of the patches are exactly what I wanted
if to support MemTxAttrs in VT-d emulation one day (now DMAR of VT-d
is bypassing MemTxAttrs and IMHO that's incorrect).  If we can somehow
pass in the MemTxAttrs then that'll be perfect and I can continue to
work on that.  If we pass in iommu_idx now instead, it would take some
time for me to figure out how to further achieve the same goal for
VT-d in the future, e.g., I would still want to pass in MemTxAttrs,
but that's obviously duplicated with iommu_idx.

(Also CCing David and Alex)

Thanks,

-- 
Peter Xu
