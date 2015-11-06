Received: by 10.182.105.169 with SMTP id gn9csp1089647obb;
        Fri, 6 Nov 2015 06:13:21 -0800 (PST)
X-Received: by 10.68.233.134 with SMTP id tw6mr11113968pbc.46.1446819201905;
        Fri, 06 Nov 2015 06:13:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22a.google.com (mail-pa0-x22a.google.com. [2607:f8b0:400e:c03::22a])
        by mx.google.com with ESMTPS id qh12si308694pab.145.2015.11.06.06.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:13:21 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22a as permitted sender) client-ip=2607:f8b0:400e:c03::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22a as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pacdm15 with SMTP id dm15so100026256pac.3;
        Fri, 06 Nov 2015 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=RoRAsQgjZapOU9me89gqOAo8OMLPorZOVFKRJdRB6sE=;
        b=h4KF8UYgNjhzOkKpr1bX5LyX9JJZonk5eQPrbQnOMyFVD9/9OefIsFm8KqP+DAc+eq
         +nLJcpsYnoYnEtRaG27j8gyWKz/CpsqLnSeFkFpGxoHYsjCdg3Kk5YZrglKNoO4JS+5Q
         bBLp8CrXAA/AxBvC+eLnBtZRkssWzZzA44TLaIPwFIRq0FcnW1MIPsH0I/XGrYCgtcVt
         g6BmNIMn5qIVa3DwTQmb37ZGH9lmdSYrHPtL+SCooxPQj8oKO4kLGJ3N8VimlDuWwpj0
         3AM2kCapFb/o9G1hPMh9buHZzUCGQ3hA6uwBZyvuLqdET9a7YP6XrwtKNvojy4Xn5Afi
         bUwA==
X-Received: by 10.68.226.41 with SMTP id rp9mr18220524pbc.55.1446819201494;
        Fri, 06 Nov 2015 06:13:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id bs3sm357167pbd.89.2015.11.06.06.13.19
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:13:20 -0800 (PST)
Date: Fri, 6 Nov 2015 15:13:17 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 04/16] exec.c: Add address space index to CPUIOTLBEntry
Message-ID: <20151106141317.GK13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-5-git-send-email-peter.maydell@linaro.org>
 <20151106133448.GD13308@toto>
 <CAFEAcA_4Euo5vFnjwvBDYuOE28E6kpi22WPPFZjzwpt_sPR2+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_4Euo5vFnjwvBDYuOE28E6kpi22WPPFZjzwpt_sPR2+g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: sagFDw+uuQlH

On Fri, Nov 06, 2015 at 01:45:29PM +0000, Peter Maydell wrote:
> On 6 November 2015 at 13:34, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Thu, Nov 05, 2015 at 06:15:46PM +0000, Peter Maydell wrote:
> >> Add the address space index to CPUIOTLBEntry, and use this to pass it
> >> to iotlb_to_region(), so that we use the correct AddressSpace when
> >> doing IO path lookups.
> >
> > Hi Peter,
> >
> > I think this works but eventually when we add support for CPUs behind
> > IOMMUs I think things will be easier if we store a pointer to the
> > AS instead of an index in the IOTLB. address_space_translate_for_iotlb()
> > with IOMMU support may be implemented so that it returns a different
> > address space as it walks tha memory hierarchy and translate things.
> >
> > Do you see any issues with storing pointers to the AS instead of an
> > index?
> 
> Yeah, we can't deal with arbitrary AddressSpaces here. We need a
> CPUAddressSpace, because we use the cached RCU-protected memory_dispatch
> pointer. Once you know that you have to be dealing with one of the fixed
> CPUAddressSpaces, then you might as well just keep the index rather than
> an arbitrary pointer.

OK, I think we'll have to have another look once we do the IOMMU stuff. My
view has probably been to simplistic.

Best regards,
Edgar
