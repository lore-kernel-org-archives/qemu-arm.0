Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2831318wre;
        Fri, 25 May 2018 02:27:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJzbjSRTcJ+CWSxNnQqyipTeJCsDbxRv+2D4jue6AKkTRQa0d2Im0/o3cewUmfk6Keg/MNS
X-Received: by 2002:ac8:4058:: with SMTP id j24-v6mr1293927qtl.170.1527240471908;
        Fri, 25 May 2018 02:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527240471; cv=none;
        d=google.com; s=arc-20160816;
        b=w/vLImFLi3foB/R6Hryz91URwLJ7gD9MFytLwir9u9mdwISZo4fPval9oPIawD+Li/
         WK0cFsr5Rov2SPZwKBNlcMCINtVc9sMHN/ErJmF3Je/+I4Od5IOy7yt1lvGaQK1cAx5C
         FxIh4bCVAmXIqrKtgjT+WkvtERDzA+OvPQbsDbz6LL7e5OSrlHQ8RxXMtPYZR1SsXjXo
         2ISXl9qzzhK5droypcR7xMEMTMXBsqhf3WDIZCdmtW1cY8+yg79FiyeNqKm5OjWD+4dz
         60V5mKb8Tby5eUjJLDjab8c1jh8SFPLmSl/2P4LjsrPOQILIHmi0XbSXzt+3jpk+64wQ
         JbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=baja3FWw9LDq14f6hVr3dyk5XuDc+bE47gT6iv7sBqQ=;
        b=xGTBt4IdfNrNrNa2GW1GHbyz1VWxGly8esoamVG2rUb1MBmdEwvQnsBz3AZlFSv1dp
         uMqjcLE8WieqnmHmHun4pHLvVvUCfbBLRCMmXnQR103LHQ7T84rCPEECoGZ3edUh0B+s
         xoyYHRHJaKXzbjDGgD2TjBLW6nvVMaVbutU+skxuE4OuVwNCkBfim9wsgF/+yXsmFgLn
         vOqOiCr1He6qRmBcbl+ePTs9X8s4Movk++e9SsC4bn6gXHAe27MPGCVmqbfaGoD1N1Td
         CXHMI3ZoYI6oLUCVgFsH7+kITKChdGIulBk0I6r+cBk3jALmyteXU4dSOD+Ut+nmWF9T
         jhGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id h132-v6si488482qke.395.2018.05.25.02.27.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 02:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5623C40122B0;
	Fri, 25 May 2018 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D778610B0F5F;
	Fri, 25 May 2018 09:27:44 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>
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
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm
 <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5f966d9b-1eb9-f447-69bc-2d93df4c6d2b@redhat.com>
Date: Fri, 25 May 2018 11:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9SXirTw=H3wznVZDTmO1OB-LRNJAQ1MsyYm62SqvMqRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 25 May 2018 09:27:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 25 May 2018 09:27:51 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: wHYvHBDi4M7U

Hi Peter,

On 05/24/2018 12:54 PM, Peter Maydell wrote:
> On 24 May 2018 at 07:23, Peter Xu <peterx@redhat.com> wrote:
>> On Wed, May 23, 2018 at 12:47:16PM +0100, Peter Maydell wrote:
>>> On 23 May 2018 at 02:06, Peter Xu <peterx@redhat.com> wrote:
>>>> Could you elaborate a bit more on why IOMMU notifier failed to
>>>> corporate when passing in MemTxAttrs?  I am not sure I caught the idea
>>>> here, but can we copy the MemTxAttrs into IOMMUTLBEntry when
>>>> translating, then in IOMMU notifiers we can know the attrs (if that is
>>>> what MPC wants)?
>>>
>>> (1) The notifier API lets you register a notifier before you've
>>> called the translate API
>>
>> Yes.
>>
>>> (2) An IOMMUTLBEntry can be valid for more than just the txattrs
>>> that it was passed in (for instance, if an IOMMU doesn't care
>>> about txattrs at all, then the resulting TLB entry is valid for
>>> any txattrs; or if the IOMMU only cares about attrs.secure the
>>> resulting TLB entries are valid for both attrs.user=0 and
>>> attrs.user=1).
>>
>> [1]
>>
>> Yes exactly, that's why I thought copying the txattrs into IOTLB
>> should work.
> 
> I'm a bit confused about why the IOMMUTLBEntry is relevant here.
> That's the thing returned from the translate method, so there's
> no point in copying txattrs into it, because the caller by definition
> already had them. At the point where the IOMMU notices a guest
> changed the config, it doesn't have an IOMMUTLBEntry or a set of
> tx attrs.
> 
>>> (3) when the IOMMU calls the notifier because the guest config
>>> changed it doesn't have tx attributes, so it would have to
>>> fabricate some; and the guest config will invalidate transactions
>>> with some combinations of tx attributes and not others.
>>
>> IMHO it doesn't directly matter with what we are discussing now.  That
>> IOMMU_NOTIFIER_[UN]MAP flag tells what kind of message would the
>> notifier be interested in from "what kind of mapping it is".  IMHO
>> it's not really related to some other attributes when translation
>> happens - in our case, it does not directly related to what txattrs
>> value is.  Here as mentioned at [1] above IMHO we can still check this
>> against txattrs in the notifier handler, then we ignore messages that
>> we don't care about.  Actually the IOMMU_NOTIFIER_[UN]MAP flags can be
>> removed and we can just do similar things (e.g., we can skip MAP
>> messages if we only care about UNMAP messages), but since it's a
>> general concept and easy to be generalized, so we provided these
>> MAP/UNMAP flags to ease the notifier hooks.
>>
>> In other words, I think we can also add more flags for SECURE or not.
>> However I still don't see a reason (from above three points) on why we
>> can't pass in txattrs directly into translate(), and at the same time
>> we copy the txattrs into IOTLB so that IOMMUTLBEntry can contain some
>> context information. [2]
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
> 
> An IOMMU which cares about attrs.secure and attrs.user:
>   [secure=1,user=1]   -> 'secure user' context
>   [secure=0,user=1]   -> 'ns user' context
>   [secure=1,user=0]   -> 's priv' context
>   [secure=0,user=0]   -> 'ns priv' context

I fail to understand the PRIV attribute usage in SMMUv3.
My understanding is the STRW (ie. stream world, kind of indication of
the exception level the SID is used along) in the STE is used to
determine the correct TTB*. Isn't PRIV checked against the page table
attributes only?

So would be expose 4 indexes for SMMUv3 or only 2 (S and NS)?

Thanks

Eric
> 
> The IOMMU index captures this idea that there is not a 1:1
> mapping, so we have a way to think about and refer to the
> actual set of translation contexts that the IOMMU has.
> 
>>> As Paolo pointed out you could also implement this by rather
>>> of having an iommu_index concept, instead having some kind
>>> of "here is a mask of which txattrs fields matter, and here's
>>> another parameter with which txattrs fields are affected".
>>> That makes it awkward though to implement "txattrs.unspecified
>>> acts like txattrs.secure == 1" type behaviour, though, which is
>>> easy with an index abstraction layer. It also would be harder
>>> to implement the default 'replay' method, I think.
>>
>> Please refer to my above comment at [2] - I am still confused on why
>> we must use this iommu_idx concept.  How about we just introduce
>> IOMMU_NOTIFIER_SECURE (or something similar) and let TCG code register
>> with that?  Though for the rest of notifiers we'll need to touch up
>> too to make sure all existing notifiers will still receive all the
>> message, no matter whether it's secure or not.
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
> 
>> I'd also appreciate if you could paste me the link for Paolo's
>> message, since I cannot find it.
> 
> This is the one I had in mind:
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03522.html
> 
>>> It will only need to do so for IOMMUs that care about that field.
>>>
>>> (See also the other thread with Eric Auger talking about
>>> maybe caring about requester_id like that. Needing to look
>>> at requester_id is an area I haven't thought too much about,
>>> and it is a bit of an odd one because it's a much larger
>>> space than any of the other parts of the txattrs. In some
>>> cases it ought to be possible to say "requester_id lets
>>> us determine an iommu index, and there are a lot fewer
>>> than 2^16 actual iommu indexes because a lot of the requestor_id
>>> values indicate the same actual iommu translation", I suspect.)
>>
>> AFAIK requester_id will only be the same in very rare cases, for
>> example, when multiple PCI devices (no matter whether it's PCI or
>> PCIe) are under the same PCIe-to-PCI bridge, then all these devices
>> will use the bridge's requester ID as their own.  In most cases, each
>> PCIe device will have their own unique requester ID.  So it'll be
>> common that requester ID number can be at least equal to the number of
>> devices.
> 
> I haven't looked at this, but my understanding is that at the moment
> we do per-device requester_id by having each PCI device get its own
> IOMMUMemoryRegion mapped into its address space. So we'd only need
> to look at requester_id for the case of devices with multiple
> subfunctions(?), and presumably most devices only have a handful
> of those.
> 
> thanks
> -- PMM
> 
