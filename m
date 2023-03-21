Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4169542ejb;
        Tue, 21 Mar 2023 08:07:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9L7kGBjOXPCQnvhbPvUH9XC5InjmEFgUftUHsofFexdeeAXvXdeMysFNOHa0nkKP8ZAp/J
X-Received: by 2002:a1c:7717:0:b0:3e2:2467:d3f5 with SMTP id t23-20020a1c7717000000b003e22467d3f5mr2584169wmi.25.1679411227837;
        Tue, 21 Mar 2023 08:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679411227; cv=none;
        d=google.com; s=arc-20160816;
        b=rprk2+gbc6/G/h5tnfPBpcDa0GL/Tm1WgI9zbU+1BSgTDtuWUW0h87iBoFey9INFsn
         sBTbaP9h3pTTCy/NCiwL2g5pBMeAuj+sFa4bC0JOhkZ8Y5H0Ax9SkZkG0XV9k9fPPHZH
         deoKlpbMFgHHpKGSxBV2xDXXndwWDCWpvEhScE/P13k+mvArBrprS2kJAbIl2cP/kC14
         Gf7wcFZ7mzUD9zeCChlUXORzXdBNHM2Dn+khiha63WejKPUu6OYLJaZJ99332U0KNper
         Sn0a8Oj5+qagOIdHt3MURvCJ5kF6F2FBIAYKIaSpIEUo5HeoiQCjTiQkGAp8LloOgn52
         9tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date;
        bh=TCnOwZ5hK6OX/UZaD9F4u+bgFnj3TwRoGBE0/NR556w=;
        b=EcYBMuvMkI+fHj/WADSqtIrRG7nHbMNiG4J6zdxmjDvtNRNyZ54BiqrKwld4DK+5R3
         CK7G1kGX4Z3nd1mW9ZAnIgnJPzLZ2tWeAHuyV/vyDmOZH3/vVdIPnth9JAro6RJcmkj7
         Bu3GkULIx4uoe2BiOa+S1B4O+dC9a6moZBPGKoPBOwtJZ3XVe3QAgYCQCifFz8NqAtyG
         IpTX2Eu1KJj+3ENn9wogzQnundoWlTCicjvxEoCIdegG350RrPAnUd+b3Tnezc2GW5Mv
         9GK/6l3vDv1W1BPI6glON/R1FVD4HOUKb69ay2N3kinvd+OXSj3WXshZpc6dqhdeCPrN
         jRaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Ymo8+QYq;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-9.mta0.migadu.com (out-9.mta0.migadu.com. [2001:41d0:1004:224b::9])
        by mx.google.com with ESMTPS id y16-20020adfe6d0000000b002ce72194d77si10382989wrm.5.2023.03.21.08.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:07:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) client-ip=2001:41d0:1004:224b::9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Ymo8+QYq;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 21 Mar 2023 16:07:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679411227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCnOwZ5hK6OX/UZaD9F4u+bgFnj3TwRoGBE0/NR556w=;
	b=Ymo8+QYqFSqHQ+6WBTBV3WvX91V42Ky1ooU6lNKH4ddKTJvN5VmYQtVYqD05Xlq2nNKPly
	ddhvR8MIP+0Th/SFf2nYwbxevwr2PF9N8g4K6T/lQidnOvv9Rch0i1ad/jGAb8D5pHYA77
	vnUUTWwzXY5jk5fI68MBKmOag0Blq90=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Message-ID: <20230321150706.6njowkadyp3vpb44@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321150220.mfrvgxg3ebju5e6k@orel>
X-Migadu-Flow: FLOW_OUT
X-TUID: OpEOVTB3YE38

On Tue, Mar 21, 2023 at 04:02:21PM +0100, Andrew Jones wrote:
...
> > +
> > +# TLB Torture Tests
> > +[tlbflush-code::all_other]
> 
> It's better to use '-', '_', '.', or ',' than '::' because otherwise the
> standalone test will have a filename like tests/tlbflush-code::all_other
> which will be awkward for shells.
> 
> BTW, have you tried running these tests as standalone? Since they're
> 'nodefault' it'd be good if they work that way.
> 
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::page_other]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'page'
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::all_self]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'self'
> > +groups = nodefault mttcg
> > +
> > +[tlbflush-code::page_self]
> > +file = tlbflush-code.flat
> > +smp = $(($MAX_SMP>4?4:$MAX_SMP))
> > +extra_params = -append 'page self'
> > +groups = nodefault mttcg

Shouldn't these also be in something like a "tlb" group?

Thanks,
drew
