Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2561347wre;
        Thu, 24 May 2018 19:50:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIUcYYel33oRmLf4RYMWz84/IEdp0SPFSPGHyrKMuyWviIxdIsYLyg7HiQS+s7+tqhtKREa
X-Received: by 2002:ac8:514a:: with SMTP id h10-v6mr492096qtn.115.1527216655333;
        Thu, 24 May 2018 19:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527216655; cv=none;
        d=google.com; s=arc-20160816;
        b=nLXV7uMwndedfKFiVUkVnM2AwUpqEGw7Ewb402jF+sJsjBdBr7b/G++9meyvv/KV9b
         Mx80a12SaUz1knU2Ya65unT6An2pTKpKSEHT4WO7yjM7ARDqcwX8Iu/EVe8BfP3diKcj
         ac5hTzwp5eW4gqrTwQT0ZqOFQ+j45IFEIIq8Xzv2Dfl0G4aBW7OynqB5KtBZA2e16chb
         YocljpGJSI1M4/HW4YOgTDIiCjMny4uw1STnPttXEsE2ZpqLSyiNs4xkn2gUO2DzS0ng
         nNLoIzo4zckb5sykXsjVRS2xql9aqIjWoeXnIgL8GIOxm9zA3AXk1LTmBL0ugxQGv7YD
         0yNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=OX9tVhVSuRNBX0c/4xr0qJJ5zPMKYBwmFNKnOYVm6yQ=;
        b=VtwdQsOTqef5RHnYqy0zIrpROXDL7kNd+rAWQ10Bbf2rZ/sJDUxHMMIHdneN4kUFv6
         Hhi8w9yMTF54on47ED6eDkiAmqS0nNb1oenGEq63STtMPxrT85nuzmzWFtRm9B4Nxbj1
         YCnBhgn3tjD3ebf3r5d0Y8nMqG9ANjbPmDoDvUgWgdGk0m3CFXNUU/WWpZejOnpxE+FV
         sTjZ95C3AwHbgUWVFKTvIgWp15T3yTMQkdLQOuRKB2gDhkyVtyYfjq69bJFa5sO/i1Su
         /gT16NCR1Eomh7VHEJxer9C9kxw5qc221GoQalH2eQi5kofCLj37GDH4rXQTJwbI7W7b
         TkHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id b20-v6si744279qvd.78.2018.05.24.19.50.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 May 2018 19:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC51A40BC064;
	Fri, 25 May 2018 02:50:54 +0000 (UTC)
Received: from xz-mi (ovpn-12-42.pek2.redhat.com [10.72.12.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A935111765C;
	Fri, 25 May 2018 02:50:48 +0000 (UTC)
Date: Fri, 25 May 2018 10:50:45 +0800
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
Message-ID: <20180525025045.GJ12122@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org>
 <20180522030333.GB17282@xz-mi>
 <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
 <20180522110236.GB31932@xz-mi>
 <CAFEAcA9b6dmpj+B=SO2YsB5sXsh=UPjkjN_U0i-uJhiDn20HHw@mail.gmail.com>
 <20180523010636.GC31932@xz-mi>
 <CAFEAcA840qn7Ms9hph9zzZgMbL8C7kN=cs4esGO9kxGXsgBg1A@mail.gmail.com>
 <20180524062352.GA12122@xz-mi>
 <CAFEAcA9SXirTw=H3wznVZDTmO1OB-LRNJAQ1MsyYm62SqvMqRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9SXirTw=H3wznVZDTmO1OB-LRNJAQ1MsyYm62SqvMqRQ@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 25 May 2018 02:50:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 25 May 2018 02:50:54 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-TUID: k0U59yjwzk+y

On Thu, May 24, 2018 at 11:54:17AM +0100, Peter Maydell wrote:
> On 24 May 2018 at 07:23, Peter Xu <peterx@redhat.com> wrote:
> > On Wed, May 23, 2018 at 12:47:16PM +0100, Peter Maydell wrote:
> >> On 23 May 2018 at 02:06, Peter Xu <peterx@redhat.com> wrote:
> >> > Could you elaborate a bit more on why IOMMU notifier failed to
> >> > corporate when passing in MemTxAttrs?  I am not sure I caught the idea
> >> > here, but can we copy the MemTxAttrs into IOMMUTLBEntry when
> >> > translating, then in IOMMU notifiers we can know the attrs (if that is
> >> > what MPC wants)?
> >>
> >> (1) The notifier API lets you register a notifier before you've
> >> called the translate API
> >
> > Yes.
> >
> >> (2) An IOMMUTLBEntry can be valid for more than just the txattrs
> >> that it was passed in (for instance, if an IOMMU doesn't care
> >> about txattrs at all, then the resulting TLB entry is valid for
> >> any txattrs; or if the IOMMU only cares about attrs.secure the
> >> resulting TLB entries are valid for both attrs.user=0 and
> >> attrs.user=1).
> >
> > [1]
> >
> > Yes exactly, that's why I thought copying the txattrs into IOTLB
> > should work.
> 
> I'm a bit confused about why the IOMMUTLBEntry is relevant here.
> That's the thing returned from the translate method, so there's
> no point in copying txattrs into it, because the caller by definition
> already had them. At the point where the IOMMU notices a guest
> changed the config, it doesn't have an IOMMUTLBEntry or a set of
> tx attrs.

Yes the txattrs is not for the translate() callers, but for IOMMU
notifiers only.  Thanks for the pointer below [1], I think it's very
similar to what Paolo mentioned there at [1], the major difference is
that Paolo suggested to put txattrs into both IOMMUNotify and
memory_region_notify_one(), while my above suggestion is that we can
directly copy it into IOMMUTLBEntry - note that both IOMMUNotify and
memory_region_notify_one will have a IOMMUTLBEntry parameter.  Though
I am not 100% clear on Paolo's suggestion on why to add two txattrs
parameters for each function (since I thought all the values in
txattrs to be passed to either IOMMUNotify or memory_region_notify_one
should be valid, so I am not sure why we need to "indicate which
attributes matter (0 = indifferent, 1 = matter)").

> 
> >> (3) when the IOMMU calls the notifier because the guest config
> >> changed it doesn't have tx attributes, so it would have to
> >> fabricate some; and the guest config will invalidate transactions
> >> with some combinations of tx attributes and not others.
> >
> > IMHO it doesn't directly matter with what we are discussing now.  That
> > IOMMU_NOTIFIER_[UN]MAP flag tells what kind of message would the
> > notifier be interested in from "what kind of mapping it is".  IMHO
> > it's not really related to some other attributes when translation
> > happens - in our case, it does not directly related to what txattrs
> > value is.  Here as mentioned at [1] above IMHO we can still check this
> > against txattrs in the notifier handler, then we ignore messages that
> > we don't care about.  Actually the IOMMU_NOTIFIER_[UN]MAP flags can be
> > removed and we can just do similar things (e.g., we can skip MAP
> > messages if we only care about UNMAP messages), but since it's a
> > general concept and easy to be generalized, so we provided these
> > MAP/UNMAP flags to ease the notifier hooks.
> >
> > In other words, I think we can also add more flags for SECURE or not.
> > However I still don't see a reason (from above three points) on why we
> > can't pass in txattrs directly into translate(), and at the same time
> > we copy the txattrs into IOTLB so that IOMMUTLBEntry can contain some
> > context information. [2]
> 
> I'm afraid I really don't understand the design you're proposing
> here. But overall I think the point of divergence is that
> the mapping from "transaction attributes" to "translation contexts"
> (ie, effectively different page tables) is not 1:1. So for instance:
> 
> Our current IOMMUs which don't care about txattrs:
> 
>   [any txattr at all] -> the one and only translation context
> 
> An IOMMU which cares about attrs.secure, and also treats
> attrs.unspecified like secure:
>   [any txattr with attrs.secure = 1]  \-> 'secure' context'
>   MEMATTRS_UNSPECIFIED                /
> 
>   [txattrs with secure = 1] -> 'nonsecure' context

(This part is a bit interesting - the "secure" bit is actually flipped
 between txattrs and the context...)

> 
> An IOMMU which cares about attrs.secure and attrs.user:
>   [secure=1,user=1]   -> 'secure user' context
>   [secure=0,user=1]   -> 'ns user' context
>   [secure=1,user=0]   -> 's priv' context
>   [secure=0,user=0]   -> 'ns priv' context
> 
> The IOMMU index captures this idea that there is not a 1:1
> mapping, so we have a way to think about and refer to the
> actual set of translation contexts that the IOMMU has.

Yes.  I'd say I am not really against this iommu_idx idea.  My only
worry is that I'm not sure whether that'll be good enough for the
future usage of IOMMU, e.g., the requester ID issue to be discussed
and solved.  My understanding is that the txattrs is already a
superset of the iommu_idx concept.  Meanwhile, the iommu_idx concept
is not easy to understand.  So it'll be nice if we can solve the
problem with what we already have now (no new concept like iommu_idx),
easier to understand, meanwhile it even covers more possibilities in
the future (we can easily generate iommu_idx by txattrs, but not other
way round).

> 
> >> As Paolo pointed out you could also implement this by rather
> >> of having an iommu_index concept, instead having some kind
> >> of "here is a mask of which txattrs fields matter, and here's
> >> another parameter with which txattrs fields are affected".
> >> That makes it awkward though to implement "txattrs.unspecified
> >> acts like txattrs.secure == 1" type behaviour, though, which is
> >> easy with an index abstraction layer. It also would be harder
> >> to implement the default 'replay' method, I think.
> >
> > Please refer to my above comment at [2] - I am still confused on why
> > we must use this iommu_idx concept.  How about we just introduce
> > IOMMU_NOTIFIER_SECURE (or something similar) and let TCG code register
> > with that?  Though for the rest of notifiers we'll need to touch up
> > too to make sure all existing notifiers will still receive all the
> > message, no matter whether it's secure or not.
> 
> I think I would definitely prefer not to have the secure/nonsecure
> specific thing in the API. We've got good experience with TCG
> where we abstract away the specifics of what an MMU cares about
> into an mmu_index, and I'd like to keep that approach. Otherwise,
> you immediately get into "and now we need to change the API again
> to handle IOMMUs which care about attrs.user"; and then again
> for attrs.requester_id; and now what about IOMMUs that care
> about both secure and user... Better to have an abstraction so
> that we don't need to keep changing the core code. In particular,
> TCG doesn't know whether it's secure/nonsecure that matters -- that
> is mostly handled by the target-specific parts, and TCG core code
> just passes attributes around.

IMHO the notifier flags are of course extra - we can introduce new
flags, or we can just handle them in the notifier hooks without
touching that part (especially if we copy the txattrs into
IOMMUTLBEntry we don't even need to touch the notifier API).  IMHO the
thing that matters more is what we need to pass to the translate() and
whether the iommu_idx concept is a must.  I am really fine with either
way to implement the IOMMU notifiers when we can make sure whether
iommu_idx is a must.

Again, I am totally not against the iommu_idx concept - I am just
afraid one day that'll be not enough for us and we still need to
rework on that part.

> 
> > I'd also appreciate if you could paste me the link for Paolo's
> > message, since I cannot find it.
> 
> This is the one I had in mind:
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03522.html

[1]

Really sorry to chime in so late no matter what; I didn't noticed the
RFC series.  These comments are for sure more suitable for RFCs.

> 
> >> It will only need to do so for IOMMUs that care about that field.
> >>
> >> (See also the other thread with Eric Auger talking about
> >> maybe caring about requester_id like that. Needing to look
> >> at requester_id is an area I haven't thought too much about,
> >> and it is a bit of an odd one because it's a much larger
> >> space than any of the other parts of the txattrs. In some
> >> cases it ought to be possible to say "requester_id lets
> >> us determine an iommu index, and there are a lot fewer
> >> than 2^16 actual iommu indexes because a lot of the requestor_id
> >> values indicate the same actual iommu translation", I suspect.)
> >
> > AFAIK requester_id will only be the same in very rare cases, for
> > example, when multiple PCI devices (no matter whether it's PCI or
> > PCIe) are under the same PCIe-to-PCI bridge, then all these devices
> > will use the bridge's requester ID as their own.  In most cases, each
> > PCIe device will have their own unique requester ID.  So it'll be
> > common that requester ID number can be at least equal to the number of
> > devices.
> 
> I haven't looked at this, but my understanding is that at the moment
> we do per-device requester_id by having each PCI device get its own
> IOMMUMemoryRegion mapped into its address space. So we'd only need
> to look at requester_id for the case of devices with multiple
> subfunctions(?), and presumably most devices only have a handful
> of those.

Not sure I fully understand this, do you mean that requester ID can
actually be bound to the DMA address space (and the IOMMU memory
regions) for the device?  I am not sure, maybe yes...

Though ppassing txattrs (and requester ID) from the translate()
function still seems more reasonable. I assume that looks more like
what the real hardware does - the requester ID should be embeded in
the PCIe packet when sending the DMA request (or page translation
request).  And for me the translate() emulates the page translation
requests, that's why passing in txattrs is very easy to understand at
least for me (while the iommu_idx is not easy to understand;
especially the "index" let me think about "which IOMMU is responsible
for this").

Thanks,

-- 
Peter Xu
