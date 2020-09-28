Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3854218lfq;
        Mon, 28 Sep 2020 11:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9skJ/Q+/zLvqvEyJBv+5zEUejve1b7axE7MeonkzoSKBSl+JeGykzycGIBfxjGiMhCjZ+
X-Received: by 2002:a9f:2684:: with SMTP id 4mr1657617uay.94.1601316103622;
        Mon, 28 Sep 2020 11:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601316103; cv=none;
        d=google.com; s=arc-20160816;
        b=RbXBWZS9986sipfJcfwKEZnOLJBm7K3zke8ESH9aGO32hLO9Cs766gB867gpBNQVqz
         ku9PoDuqJv9yEXnTV4Br9+54Zfjd6ma6ea8BcduOZo0eu9hST3TAhVIZEVwKpKZrZulE
         WKnn3JTImmMu3wmKaaEXNuPcPtF6X9RKq1O4mxgvvCNuoNliqzWMj3NiA/zRz3Y8Oj08
         wTLjcCvjHn6COuit3qtunIZHaVGdoioQqsU1cwKCk8jhOytZLz+DFr3RMbwk8k44XSRh
         Z5TqeQgdx8dz905UjQUSThAT6wxtmUVLuqLZKxrCgVs3tBlNDeSSvnECiB8lUkZPilB1
         ofHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=N+wk5azjipVwb/ehom8hAby13QOSHxndVwpdQUEw6bY=;
        b=Qn3Shgl2mZB2X0j4Gv1OSVO7Jgf97qIfzhzqF4wQn3O7qgqgXWNTxpSBkQoUWutDz+
         AkxxL23QuCkBL4d0vQs++1MCko3z435Y8e1iEcpOxZOgblLoDSe7dJKzTuuSz6N8Mdii
         LvXhclaXmYVRHlcYYIxwvBzQNEi8Dnr/IV6QZHsYj/GV/yd7NIn8R7611mx/OusuQQdv
         XvijcVzUqBWUNzsovqdCbiGv4sPskJNjvUEugo751uAEjKd3l+fESOW3AvKYNlWiTVrU
         OXqY0zMCiZh9ePicumQ4mcaefuo1f/YnmpoZAVXPvfcJUXweZPjtXQlPBK/qHZljs+gS
         ayRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WVSxO5PO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si865728ual.79.2020.09.28.11.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 11:01:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WVSxO5PO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMxT4-0006JF-SD
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 14:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kMxIN-0003El-Mi
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 13:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kMxIL-0002aQ-W4
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 13:50:39 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601315435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+wk5azjipVwb/ehom8hAby13QOSHxndVwpdQUEw6bY=;
 b=WVSxO5POUaWm9YZ1NKDSE3szQ2Ls2TbvAI3K9/LlbYXrp/v75BBKFxhhUoemv2wwZurMR2
 t+LCzatNmYVPHbtddESQTi1J5zS2BjVygzYTZSnCAjYKCWKeR4++KQ0l7jzdtZfCu/6gug
 QyxxhwQIRdsTVhrqQMrxeNFFcFoOkiw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-NxeqomcZPVOBbRUc6W3b0A-1; Mon, 28 Sep 2020 13:49:01 -0400
X-MC-Unique: NxeqomcZPVOBbRUc6W3b0A-1
Received: by mail-qv1-f70.google.com with SMTP id ct11so1054077qvb.16
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 10:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=N+wk5azjipVwb/ehom8hAby13QOSHxndVwpdQUEw6bY=;
 b=bnvpCroBt2pZcMC36PNcf+exQMRtRMQL9aGeQdAU7m6N7gvhTYZRPq8xNImmU3kgEF
 6fTlEqqrNwCNOuNIfnHI3a98jJqXRbV72U6B4t5noq3F/t0+1f1L+HKavLxeSeNcyH7p
 xO6A9QnerOFods3hFe6vAz/h0Hqf1vOt3wXhz1CdSa0XkENysHF5Nwe1xb1EHypaNCkV
 5d1XdpmYRDDeeI3WNYUQUOQBaW9kZsPkNNz7wsxjbuVTgAO2x+dEAF4EKmm6CkU99cW8
 kvlT8FUmScRTN+CgE0lHo4NHDUPu7evUWfOM5kWI1lurx+whAdtOyGrlV/d/YwN6t4nK
 6ZRQ==
X-Gm-Message-State: AOAM533SACb2LcXDSW52jouhNurU3vKmPZNry0FkDLTMy2Q5DRJFCLBF
 jA7O0a5+DXh1tWUI73Cnr/6ZadaDD9OcLJ2w6K583hMWpwBVf9Dt4GMr3whkWRNTNwgq+JBCZPN
 S9pzuysxkH8I+
X-Received: by 2002:a05:6214:1225:: with SMTP id
 p5mr687489qvv.29.1601315341035; 
 Mon, 28 Sep 2020 10:49:01 -0700 (PDT)
X-Received: by 2002:a05:6214:1225:: with SMTP id
 p5mr687448qvv.29.1601315340679; 
 Mon, 28 Sep 2020 10:49:00 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id u10sm1191583qkk.14.2020.09.28.10.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:48:59 -0700 (PDT)
Date: Mon, 28 Sep 2020 13:48:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Message-ID: <20200928174857.GC59869@xz-x1>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200903161446.29615-1-eperezma@redhat.com>
 <20200903161446.29615-6-eperezma@redhat.com>
 <d3e2098d-e150-7f99-a1ee-4a997daf4a5c@redhat.com>
 <CAJaqyWfwGP7_Ex=NhG_po+A1BkN3OCV=+3Vwi8uhLJ_e4UA5NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfwGP7_Ex=NhG_po+A1BkN3OCV=+3Vwi8uhLJ_e4UA5NQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 qemu-level <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Avi Kivity <avi@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a8G5dNFr9oKb

On Mon, Sep 28, 2020 at 11:05:01AM +0200, Eugenio Perez Martin wrote:
> On Fri, Sep 4, 2020 at 6:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > On 2020/9/4 上午12:14, Eugenio Pérez wrote:
> > > Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
> > > the memory region or even [0, ~0ULL] for all the space. The assertion
> > > could be hit by a guest, and rhel7 guest effectively hit it.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > > ---
> > >   softmmu/memory.c | 13 +++++++++++--
> > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index 8694fc7cf7..e723fcbaa1 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> > >   {
> > >       IOMMUTLBEntry *entry = &event->entry;
> > >       hwaddr entry_end = entry->iova + entry->addr_mask;
> > > +    IOMMUTLBEntry tmp = *entry;
> > >
> > >       if (event->type == IOMMU_NOTIFIER_UNMAP) {
> > >           assert(entry->perm == IOMMU_NONE);
> > > @@ -1908,10 +1909,18 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> > >           return;
> > >       }
> > >
> > > -    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
> > > +    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> > > +        /* Crop (iova, addr_mask) to range */
> > > +        tmp.iova = MAX(tmp.iova, notifier->start);
> > > +        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
> > > +        /* Confirm no underflow */
> > > +        assert(MIN(entry_end, notifier->end) >= tmp.iova);
> >
> >
> > It's still not clear to me why we need such assert. Consider
> > notifier->end is the possible IOVA range but not possible device IOTLB
> > invalidation range (e.g it allows [0, ULLONG_MAX]).
> >
> > Thanks
> >
> 
> As far as I understood the device should admit that out of bounds
> notifications in that case,
> and the assert just makes sure that there was no underflow in
> tmp.addr_mask, i.e., that something
> very wrong that should never happen in production happened.
> 
> Peter, would you mind to confirm/correct it?

I think Jason is right - since we have checked at the entry that the two
regions cross over each other:

    /*
     * Skip the notification if the notification does not overlap
     * with registered range.
     */
    if (notifier->start > entry_end || notifier->end < entry->iova) {
        return;
    }

Then I don't see how this assertion can fail any more.

But imho not a big problem either, and it shouldn't hurt to even keep the
assertion of above isn't that straightforward.

> 
> Is there anything else needed to pull this patch?

I didn't post a pull for this only because I shouldn't :) - the plan was that
all vt-d patches will still go via Michael's tree, iiuc.  Though at least to me
I think this series is acceptable for merging.

Though it would always be good too if Jason would still like to review it.

Jason, what's your opinion?

Thanks,

-- 
Peter Xu

