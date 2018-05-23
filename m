Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp645111wre;
        Wed, 23 May 2018 04:47:37 -0700 (PDT)
X-Received: by 2002:aca:c006:: with SMTP id q6-v6mr1334995oif.238.1527076057156;
        Wed, 23 May 2018 04:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527076057; cv=none;
        d=google.com; s=arc-20160816;
        b=NCO+TnqhiD+MqzLpav89pSvN6qn1Wdyv+zj2VWF0MstMb6Zr/CmXT5+IWmqZ6NYqP4
         6ixNQmD8ABxNimjxkhkhI/QrV8WrKPSZ/Du+gmV6ugmw3HKCCZL+A7+1rFat12xCEx42
         sJQXEtxxLYmZdV85zqFP3ASYeIIzhK5LDQnx18Wb4TZrXO0ybiOxSNFGNSYHqoVoc81R
         Px/w7nbVp/Q/LiHLWW90kec7nQ6dMIHFNmWFiyDrt3CY9eFM1hbZjWuoaNjINE9U0aex
         HcIVl0gA6wzmv+ULp0xhjJU0LASsk5tDptOuZsWs1brRnDve43SNkEoORmeE4twkTh9/
         wPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=jDqiavUXqia1jtxMAHtpOIdUTks5gvKf0QFhPvgBxso=;
        b=rDx930PEABqq6gLK8IZlZhdy+cY1Y2kNM997roPy3qiuzTWIkpsyVV3/Pk+vRmNbu5
         oBsnCBHWIVyupIU8DHr2pYU5g3wodOC9Evo2oft6itVuXPnCTlYuk47gycHdW5tY2nEm
         XlmcXUDm2pVZKe58zfmAtIzN848BfDXQHgiOoDOV1FvLmQ2skL3/C32agy8VaM3Fqfvr
         kghthfO8tqVMPtp34o2ewGFL/Ab0B4MswGZAMjtW4wctcK2qMEbIABtCOLsEfjzyUqHD
         Cz2AqfrTs1LevFpIRS8aOQFOed0gXt/xyZ1aazTmqv14DlTRSHint7n6EeDMPPdGgcec
         YfEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSvtrHNK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w49-v6sor8779638otb.300.2018.05.23.04.47.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 May 2018 04:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSvtrHNK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jDqiavUXqia1jtxMAHtpOIdUTks5gvKf0QFhPvgBxso=;
        b=BSvtrHNK9qYKq7TlSBrQJ7nDRbYZ0V0QEB6fXo8QvxF+kWK1PKBIh0Z/AXQo2A+0Nk
         9+c/gNsx9+PUBAB+aqSu0PS0xqObGNRucxDDF8zkO5ugHPZnyCf55jyGqwHfNB3l3kR3
         WS1XoMgB+gQwc9R2guccsJoKk+BhYtR4zLV4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=jDqiavUXqia1jtxMAHtpOIdUTks5gvKf0QFhPvgBxso=;
        b=g9ckXBoj+ChE9mk5C4B5n19msvk/PsunZF8gQxJa7+x+XiGjd5DknHouCiCLUnYlXi
         EQj9VEJyLiU2qArka2FEwJYQRldjfjIWm3plNs6n0it/lw8B22pETXGb+4nzF6RtAjkJ
         LaNBPFEzIvUotKGmTpSn6Bx3VmlN0stWiXYMF+XpKEmzfJ3W8Hvc2NyHp2kB2UPiwj4M
         8AYrJk2p0lc5v+nHGuWv2GlN8NDJVEliJ5mufzyCTUg+N9Z9hHMlv+pm1+2paqVDU062
         JmDS2olVkY6fkYfvZVJJtf9zST5kZNdAU3gcFSqgIlHP6cABwtOwRJfJA4rHQg8HnqSA
         WXMQ==
X-Gm-Message-State: ALKqPwcyW2S/7vCtqyrd8OXOnhZbfJAR4KhqB377cDNUoxBQBvGqX4LB
	tJy0Y2ctygep5dHYz3z4URjOqRoEF1fjR4xTmwIWVmEEG8A=
X-Google-Smtp-Source: AB8JxZrh0LWhBosy2N6jYEk0ldL0HuZkxtByt93/xR2kzTVoamj2BzuTFw7ul1KVBQNKoKvwMupSHLELfygfaMMrQjE=
X-Received: by 2002:a9d:2013:: with SMTP id n19-v6mr1413200ota.258.1527076056716;
 Wed, 23 May 2018 04:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 23 May 2018 04:47:16
 -0700 (PDT)
In-Reply-To: <20180523010636.GC31932@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <20180522030333.GB17282@xz-mi>
 <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
 <20180522110236.GB31932@xz-mi> <CAFEAcA9b6dmpj+B=SO2YsB5sXsh=UPjkjN_U0i-uJhiDn20HHw@mail.gmail.com>
 <20180523010636.GC31932@xz-mi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 May 2018 12:47:16 +0100
Message-ID: <CAFEAcA840qn7Ms9hph9zzZgMbL8C7kN=cs4esGO9kxGXsgBg1A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +FuGb7KA5TEP

On 23 May 2018 at 02:06, Peter Xu <peterx@redhat.com> wrote:
> On Tue, May 22, 2018 at 12:11:38PM +0100, Peter Maydell wrote:
>> On 22 May 2018 at 12:02, Peter Xu <peterx@redhat.com> wrote:
>> > On Tue, May 22, 2018 at 09:40:44AM +0100, Peter Maydell wrote:

>> > And if we see current implementation for this (still, I copied code
>> > from other patch in the series to here to ease discussion):
>> >
>> > @@ -498,8 +498,15 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
>> >      do {
>> >          hwaddr addr = *xlat;
>> >          IOMMUMemoryRegionClass *imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
>> > -        IOMMUTLBEntry iotlb = imrc->translate(iommu_mr, addr, is_write ?
>> > -                                              IOMMU_WO : IOMMU_RO);
>> > +        int iommu_idx = 0;
>> > +        IOMMUTLBEntry iotlb;
>> > +
>> > +        if (imrc->attrs_to_index) {
>> > +            iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
>> > +        }
>> > +
>> > +        iotlb = imrc->translate(iommu_mr, addr, is_write ?
>> > +                                IOMMU_WO : IOMMU_RO, iommu_idx);
>> >
>> > Here what if we pass attrs directly into imrc->translate() and just
>> > call imrc->attrs_to_index() inside the arch-dependent translate()
>> > function?  Will that work too?
>>
>> You don't always have the attributes at the point where you want
>> to call translate. (For instance, memory_region_notify_iommu()
>> doesn't have attributes.)
>>
>> I started off with "pass the tx attrs into the translate method",
>> which is fine for the code flows which are actually doing
>> memory transactions, but breaks down when you try to incorporate
>> notifiers.
>
> Could you elaborate a bit more on why IOMMU notifier failed to
> corporate when passing in MemTxAttrs?  I am not sure I caught the idea
> here, but can we copy the MemTxAttrs into IOMMUTLBEntry when
> translating, then in IOMMU notifiers we can know the attrs (if that is
> what MPC wants)?

(1) The notifier API lets you register a notifier before you've
called the translate API
(2) An IOMMUTLBEntry can be valid for more than just the txattrs
that it was passed in (for instance, if an IOMMU doesn't care
about txattrs at all, then the resulting TLB entry is valid for
any txattrs; or if the IOMMU only cares about attrs.secure the
resulting TLB entries are valid for both attrs.user=0 and
attrs.user=1).
(3) when the IOMMU calls the notifier because the guest config
changed it doesn't have tx attributes, so it would have to
fabricate some; and the guest config will invalidate transactions
with some combinations of tx attributes and not others.

As Paolo pointed out you could also implement this by rather
of having an iommu_index concept, instead having some kind
of "here is a mask of which txattrs fields matter, and here's
another parameter with which txattrs fields are affected".
That makes it awkward though to implement "txattrs.unspecified
acts like txattrs.secure == 1" type behaviour, though, which is
easy with an index abstraction layer. It also would be harder
to implement the default 'replay' method, I think.

Plus I think that handling this the same way TCG does is a
reasonable approach -- we know that it's a usefully flexible
concept.

>> > I had a quick glance at the series, I have no thorough idea on the
>> > whole stuff, but I'd say some of the patches are exactly what I wanted
>> > if to support MemTxAttrs in VT-d emulation one day (now DMAR of VT-d
>> > is bypassing MemTxAttrs and IMHO that's incorrect).  If we can somehow
>> > pass in the MemTxAttrs then that'll be perfect and I can continue to
>> > work on that.  If we pass in iommu_idx now instead, it would take some
>> > time for me to figure out how to further achieve the same goal for
>> > VT-d in the future, e.g., I would still want to pass in MemTxAttrs,
>> > but that's obviously duplicated with iommu_idx.
>>
>> The idea is that you should never need to pass in the MemTxAttrs,
>> because everything that the IOMMU might care about in the tx attrs
>> must be encoded into the iommu index. (The point where the IOMMU
>> gets to do that encoding is in its attrs_to_index() method.)
>
> For the DMAR issue I would care about MemTxAttrs.requester_id.  Just
> to confirm - do you mean I encode the 16bits field into iommu_idx too,
> or is there any smarter way to do so?  Asked since otherwise iommu_idx
> will gradually grow into another MemTxAttrs to me.

It will only need to do so for IOMMUs that care about that field.

(See also the other thread with Eric Auger talking about
maybe caring about requester_id like that. Needing to look
at requester_id is an area I haven't thought too much about,
and it is a bit of an odd one because it's a much larger
space than any of the other parts of the txattrs. In some
cases it ought to be possible to say "requester_id lets
us determine an iommu index, and there are a lot fewer
than 2^16 actual iommu indexes because a lot of the requestor_id
values indicate the same actual iommu translation", I suspect.)

thanks
-- PMM
