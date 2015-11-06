Received: by 10.182.105.169 with SMTP id gn9csp1075659obb;
        Fri, 6 Nov 2015 05:49:10 -0800 (PST)
X-Received: by 10.66.148.67 with SMTP id tq3mr17848364pab.124.1446817750788;
        Fri, 06 Nov 2015 05:49:10 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com. [2607:f8b0:400e:c03::235])
        by mx.google.com with ESMTPS id e4si289262pas.138.2015.11.06.05.49.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) client-ip=2607:f8b0:400e:c03::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pabfh17 with SMTP id fh17so123688173pab.0;
        Fri, 06 Nov 2015 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=3NwH3yeURLA0R29qvKc2t5wzxOgmmuw7cd7gESVq/mU=;
        b=wIL/IoZIuomcSPFA8E0lrQOxJqzeg++kf3/17BjcoO/WjPUipWih503JJCj8Q4TfqS
         n42dKg0DuUS197spDCB61jI3FPfSdj8pBDmpPm4FY2UCFeD9E8VwHmXnbg8ttKggMjey
         DCo4HNvgnbhf2dfIo6WDl02YeGZwyvtmLcPvFJAaCa9vEN35YcydCodhrxiCx8YmlNnq
         76KBlPvBAxSW7+fIL3VFXU/dA48AcB8IoZCKu9yeaWTzHpPz4g41ECW5MX5K/aHHrK/c
         mzKopzkBUwU815E6hk/Xb7nXp/qoPhe7KDFqYoi56ia7HAktovQODcN80AIJE1NAYwYy
         PmTA==
X-Received: by 10.68.143.40 with SMTP id sb8mr17890501pbb.107.1446817750340;
        Fri, 06 Nov 2015 05:49:10 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id an5sm290192pbd.45.2015.11.06.05.49.08
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:49:09 -0800 (PST)
Date: Fri, 6 Nov 2015 14:49:05 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying
 AddressSpace to use
Message-ID: <20151106134905.GH13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
 <20151106132759.GC13308@toto>
 <CAFEAcA_SXyN1CxJd7CA-hkGXGoVkiPP3_wKo31KNZekjvNt0kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_SXyN1CxJd7CA-hkGXGoVkiPP3_wKo31KNZekjvNt0kw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: WJQmBDX+9H/2

On Fri, Nov 06, 2015 at 01:41:54PM +0000, Peter Maydell wrote:
> On 6 November 2015 at 13:27, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Thu, Nov 05, 2015 at 06:15:45PM +0000, Peter Maydell wrote:
> >> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
> >> to tell the core code which AddressSpace to use.
> >>
> >> The AddressSpace is specified by the index into the array of ASes which
> >> were registered with cpu_address_space_init().
> 
> >> --- a/exec.c
> >> +++ b/exec.c
> >> @@ -445,12 +445,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
> >>
> >>  /* Called from RCU critical section */
> >>  MemoryRegionSection *
> >> -address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr,
> >> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> >>                                    hwaddr *xlat, hwaddr *plen)
> >
> > Does it make sense to replace the CPUState argument with an AddressSpace *
> > and have the callers do the cpu->cpu_ases[asidx]?
> > It would be more consistent and eventually maybe eliminate the need for
> > address_space_translate_for_iotlb in favor of calling address_space_translate
> > directly?
> 
> We can't accept an arbitrary AddressSpace, it has to be one which is
> embedded in a CPUAddressSpace and which we can thus find the
> memory_dispatch for. So you could pass a CPUAddressSpace*, but not
> an AddressSpace*. But to pass a CPUAddressSpace we would have to
> expose the currently-private-to-exec.c layout of the CPUAddressSpace
> struct. I chose not to do that (and you can see the results elsewhere
> in the patch series, like the function that's basically just "do
> the cs_ases array lookup for me"); there's an argument for making
> the structure more widely available to avoid some of that.

Aha, I see.. Thanks for clarifying.

Cheers,
Edgar
