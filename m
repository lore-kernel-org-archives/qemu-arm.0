Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2753225wrg;
        Mon, 13 May 2019 05:39:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCz+m5QctBRu5o/AedmfheaxvSPoNVD59uifp2YqnfrXnXTiwNOzfQAnP4KGasnY5Y2R+1
X-Received: by 2002:a37:b3c5:: with SMTP id c188mr22290374qkf.97.1557751144392;
        Mon, 13 May 2019 05:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751144; cv=none;
        d=google.com; s=arc-20160816;
        b=OaIs0/faWwauEuypoa8ybQc9uZLRux6TzabgvixYbkkZyJG140hXUbMYWOUEh38TED
         l5ut2TcODmk7YYxY/X32uJowgxEag4zjm2kvBusOBJhYz0wbbYVPYHo7Vl9IOMs7X/eO
         x82t7BnD/XCZMpDpNq1PXBd4dL1+2cjkjHJPLdkxrIC6FFlUO/jEkOolihKNn0Zf5HMM
         tL64jTPP+NZg5+pbwoIi7DP698O8TJlGMgU/ZVtAnzH0TTenlpmUwFFIEr/jS4QNby6w
         T+mHx6F2qVuiTTdAUAVzA3eRnOI+Fc4zrkHae26d+lugqvWeVz0/CEjhVByWzwaqnK+Z
         18GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=RT1N5iRmPS2HVu8zpJqJD4aoplArRyG/2fXwdtv7y2s=;
        b=O09KiDJbo46ghj17Ln6GJhKRqoAoHwya6OrGdekuXzQPqG7AWEAVxV0Au6yiXUqDWr
         P2kq7I2wliRKupAJCjC+cODLEeoEBqCsNkMbMto4bu9ZL1SY6hujqmbmaxoGDPD1eGo2
         c61FK1FU9swJ494owwHVR4i3ZMcbfrinwlxRhnoLqMRFmLHoGAIiHFqVWBY4LWFMj6gU
         RKEkcb+3gEGe5tTWWoL8MI22KLkcjrdZagZ35n7S+ahYziA8+sbKWuKpqntABti9CfnZ
         IhpsnL8P9qoevdBTupTxHyVDSjrNGZBXS9gdcQBUn6BXbXeb8V992gtkVKXMD11b6Wwt
         kGoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n66si1489653qkc.251.2019.05.13.05.39.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C40C30821FF;
	Mon, 13 May 2019 12:39:03 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F2D1001E7D;
	Mon, 13 May 2019 12:39:00 +0000 (UTC)
Date: Mon, 13 May 2019 14:38:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513123857.xjgwnkdlizdunlpz@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513111555.GC28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513111555.GC28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 13 May 2019 12:39:03 +0000 (UTC)
X-TUID: bC19hBMbMCZk

On Mon, May 13, 2019 at 12:15:56PM +0100, Dave Martin wrote:
> On Mon, May 13, 2019 at 10:32:46AM +0100, Andrea Bolognani wrote:
> > On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:
> > [...]
> > >    CPU type | accel | sve-max-vq | sve-vls-map
> > >    -------------------------------------------
> > >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> > >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> > >  3)    host | kvm   |  N/A       |  $VLS_MAP
> > > 
> > > Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> > > all supported when $VLS_MAP is zero, or when the vqs are selected
> > > in $VLS_MAP.
> > 
> > I'm a bit confused by the nomenclature here. VL clearly stands for
> > Vector Length, but what does VQ stand for? You seem to be using the
> > two terms pretty much interchangeably throughout the cover letter.
> 
> From the Linux end, "vector length" or VL refers to the size of a vector
> register, either in no particular unit or in bytes.
> 
> "VQ" refers specifically to the vector length in 128-bit quadwords.
> 
> In some situations, neither terminology is obviously better than the
> other, such as in the way KVM_REG_ARM64_SVE_VLS is encoded.
> 
> > [...]
> > > There is never any need to provide both properties, but if both
> > > are provided then they are checked for consistency.
> > 
> > I would personally just error out when both are provided.
> > 
> > > The QMP query returns a list of valid vq lists. For example, if
> > > a guest can use vqs 1, 2, 3, and 4, then the following list will
> > > be returned
> > > 
> > >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> > > 
> > > Another example might be 1, 2, 4, as the architecture states 3
> > > is optional. In that case the list would be
> > > 
> > >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> > 
> > I think the proposed QMP command is problematic, because it reports
> > the valid vector lengths for either KVM or TCG based on which
> > accelerator is currently enabled: it should report all information
> > at all times instead, similarly to how query-gic-capabilities does
> > it.
> 
> I wonder if this is premature flexibility?
> 
> The size of these lists is going to get cumbersome if the architecture
> is ever extended.  Even today, we might need over 100 items in this
> (nested) list.  If this is to be presented to the user this will be
> far from friendly, it could get much worse if the architecutre changes
> in future to allow larger vectors or more flexible virtualisation.
> 
> Could we just have a list of supported vector lengths and a possibly
> empty list of additional capabilities that describe what kinds of
> flexibility are allowed?
> 
> So, for example, we might support vector lengths of 1, 2, 4 and 8
> quadwords, with the the ability to clamp the max vector length the
> guest sees: the kernel ABI guarantees that you can do this, even
> if you can't disable/enable each individual vector length independently.
> 
> So, [ 1, 2, 4, 8 ] seems sufficient to describe this in a forwards
> compatible way.
> 
> Some day, we might report { "independent", [ 1, 2, 4, 8, 16, 32, ... ] }
> 
> I'm guessing about the data representation here.
> 

I think that could work, and something along those lines even crossed my
mind. Let's see what libvirt folk say. I'm not overly concerned about
user friendless here though, as users aren't running QMP commands and
parsing json by hand too much.

Thanks,
drew
