Received: by 10.182.105.169 with SMTP id gn9csp1077426obb;
        Fri, 6 Nov 2015 05:52:40 -0800 (PST)
X-Received: by 10.66.124.165 with SMTP id mj5mr17547433pab.97.1446817960077;
        Fri, 06 Nov 2015 05:52:40 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com. [2607:f8b0:400e:c03::22e])
        by mx.google.com with ESMTPS id ia2si334524pbb.85.2015.11.06.05.52.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) client-ip=2607:f8b0:400e:c03::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so127930860pas.2;
        Fri, 06 Nov 2015 05:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=dpye2Llox2RiB7OR/2mx4XszRZTepDkJamVoLpDkp9A=;
        b=a4WxVbIi144434dUop9eJWVSgrEWevrZjdz1aNG3fJmGENj8whbGNC/jvWzXe/xsv2
         jDVjJWIdW49tdssxFNeTZ/b1wN9WyOqnFDIpyFxLDmWn0UEZb4g2MInKvxntqcOOervq
         V1rTfGpEKr1HrmSSdVRez6P/7KgaAbA2VjZWO7/z4GM/EnPdyxfURkUpt9OiIFOWseV9
         qeffbsmq7NXgm6gU/8bpFs3MD7BMrgmQjAD5gJywIpr9V7B5XzHlSJIKwVwsyHxG90MG
         SYOhwNg1oslQQvWhfTyPDrA/3m0GKSzBUv06RzSKm1pN5/OgCvaHx0DR+gGiythtX4bb
         oSSQ==
X-Received: by 10.66.249.201 with SMTP id yw9mr17887750pac.90.1446817959652;
        Fri, 06 Nov 2015 05:52:39 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id y3sm325099pbt.23.2015.11.06.05.52.37
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:52:38 -0800 (PST)
Date: Fri, 6 Nov 2015 14:52:35 +0100
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
Message-ID: <20151106135235.GJ13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
 <20151106132759.GC13308@toto>
 <CAFEAcA_SXyN1CxJd7CA-hkGXGoVkiPP3_wKo31KNZekjvNt0kw@mail.gmail.com>
 <20151106134905.GH13308@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151106134905.GH13308@toto>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: F6nPwD2+Bs7I

On Fri, Nov 06, 2015 at 02:49:05PM +0100, Edgar E. Iglesias wrote:
> On Fri, Nov 06, 2015 at 01:41:54PM +0000, Peter Maydell wrote:
> > On 6 November 2015 at 13:27, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > > On Thu, Nov 05, 2015 at 06:15:45PM +0000, Peter Maydell wrote:
> > >> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
> > >> to tell the core code which AddressSpace to use.
> > >>
> > >> The AddressSpace is specified by the index into the array of ASes which
> > >> were registered with cpu_address_space_init().
> > 
> > >> --- a/exec.c
> > >> +++ b/exec.c
> > >> @@ -445,12 +445,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
> > >>
> > >>  /* Called from RCU critical section */
> > >>  MemoryRegionSection *
> > >> -address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr,
> > >> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> > >>                                    hwaddr *xlat, hwaddr *plen)
> > >
> > > Does it make sense to replace the CPUState argument with an AddressSpace *
> > > and have the callers do the cpu->cpu_ases[asidx]?
> > > It would be more consistent and eventually maybe eliminate the need for
> > > address_space_translate_for_iotlb in favor of calling address_space_translate
> > > directly?
> > 
> > We can't accept an arbitrary AddressSpace, it has to be one which is
> > embedded in a CPUAddressSpace and which we can thus find the
> > memory_dispatch for. So you could pass a CPUAddressSpace*, but not
> > an AddressSpace*. But to pass a CPUAddressSpace we would have to
> > expose the currently-private-to-exec.c layout of the CPUAddressSpace
> > struct. I chose not to do that (and you can see the results elsewhere
> > in the patch series, like the function that's basically just "do
> > the cs_ases array lookup for me"); there's an argument for making
> > the structure more widely available to avoid some of that.
> 
> Aha, I see.. Thanks for clarifying.
>

That was the only comment I had so:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
 
