Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2751242wrg;
        Mon, 13 May 2019 05:37:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzla9RbnLEduRQ6OtOvYX6j2nuS9Yfqf+rCtxllD/NFTxOGf/zFcR0OSOsix+wRmO9hTprq
X-Received: by 2002:ac8:3783:: with SMTP id d3mr21323697qtc.293.1557751024333;
        Mon, 13 May 2019 05:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751024; cv=none;
        d=google.com; s=arc-20160816;
        b=0PrEg1uoGIiGzzqMP5iAW6z/FuhQCdkYPmqsIvw18ht52mehPHKnDJxEprNRxYzUAi
         ingsSWL7GR7FEVz6AKPgrT1zbdNstu184SmgQpPovqo0EQC41wlgmUBVFuTqSI+wdYms
         LEaxZKkm3ogykDt0zvBTz5bobusWEDzQmqjNXV6+46UW+2j16pWFjVSbfuNKkE9wYMXq
         USQCydjhyN+eqo+VqGiFvROba89SdnlxCdJx/Ssfcy84WecqExOtibgwzsKlAk4wJgEN
         1Fj+eZQbsBkOa0u+Hc1HEJ902UjowRhG0rfud+AQc9ASs3QFuxMwAcaDptKNTk8zYYVM
         LJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=gO9yT/Jw6nn/Rt6xdZ3G8E3Y2vVe0KIFKWaM8CJveKE=;
        b=aWZKrSFo02a0+ZIKLCbC9N1XEueAHhjGVEScKbV3S4aFQ2L0fsF2qpnGIxzdrFgGp5
         ysk6X9s/i7aekvmhurQCv2inHDhwwkx+B6UOEDJbz03oGsz1MicUjPEIYs8hn56dTCWV
         YhirjSLiH8DSB5uIlf57y9ab5Ur3JbsYGm2aBqZh/f7f5yA/6F7CZRqDuC2cdjEDF2Pv
         2IF3MsN4PkwChfUhPjqoZGL++WF52sU+Whr7xwdutldKcCEBCGeHdjsyKTKvqDE9xaZ2
         2tniBiY3g8S6oTMjFdjEVrQ5FBwVxNKDBZBh43J02O9I9DshBa3eBvxfp7NKrZqz7xYO
         CkVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g34si604183qve.192.2019.05.13.05.37.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6130CC057F32;
	Mon, 13 May 2019 12:37:03 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB0F419C67;
	Mon, 13 May 2019 12:36:59 +0000 (UTC)
Date: Mon, 13 May 2019 14:36:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 13 May 2019 12:37:03 +0000 (UTC)
X-TUID: PG4MB/9Rgkb9

On Mon, May 13, 2019 at 11:32:46AM +0200, Andrea Bolognani wrote:
> On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:
> [...]
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
> > 
> > Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> > all supported when $VLS_MAP is zero, or when the vqs are selected
> > in $VLS_MAP.
> 
> I'm a bit confused by the nomenclature here. VL clearly stands for
> Vector Length, but what does VQ stand for? You seem to be using the
> two terms pretty much interchangeably throughout the cover letter.

As Dave pointed out, they're both lengths, but VQ specifically points
out that the unit is 'Q'uadwords. We could use VQS instead of VLS,
"Vector Lengths" sounds better.

> 
> [...]
> > There is never any need to provide both properties, but if both
> > are provided then they are checked for consistency.
> 
> I would personally just error out when both are provided.

I'm fine with that if nobody else objects.

> 
> > The QMP query returns a list of valid vq lists. For example, if
> > a guest can use vqs 1, 2, 3, and 4, then the following list will
> > be returned
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> > 
> > Another example might be 1, 2, 4, as the architecture states 3
> > is optional. In that case the list would be
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> 
> I think the proposed QMP command is problematic, because it reports
> the valid vector lengths for either KVM or TCG based on which
> accelerator is currently enabled: it should report all information
> at all times instead, similarly to how query-gic-capabilities does
> it.

OK, and then with a flag stating which is when then. Dave points out
we may want to reduce the list to a single set and then add flags
to indicate what can be done with it in order to derive other sets.
What do you think about that?

> 
> [...]
> > And now for what might be a bit more controversial; how we input
> > the valid vector set with sve-vls-map. Well, sve-vls-map is a
> > 64-bit bitmap, which is admittedly not user friendly and also not
> > the same size as KVM's vls bitmap (which is 8 64-bit words). Here's
> > the justification:
> > 
> >  1) We want to use the QEMU command line in order for the information
> >     to be migrated without needing to add more VM state.
> >  2) It's not easy/pretty to input arrays on the QEMU command line.
> >  3) We already need to use the QMP query to get a valid set, which
> >     isn't user friendly either, meaning we're already in libvirt
> >     territory.
> >  4) A 64-bit map (supporting up to 8192-bit vectors) is likely big
> >     enough for quite some time (currently KVM and TCG only support
> >     2048-bit vectors).
> >  5) If user friendliness is needed more than migratability then
> >     the 'max' cpu type can be used with the sve-max-vq property.
> >  6) It's possible to probe the full valid vector set from the
> >     command line by using something like sve-vls-map=0xffff and
> >     then, when it fails, the error message will state the correct
> >     map, e.g. 0xb.
> 
> I don't have a problem with having to use a bitmap internally,
> though libvirt will clearly want to expose a more approachable
> interface to users.
> 
> However, QMP reporting the information in the current format means
> we'd have to build an additional parser on top of the bitmap handling
> and conversion routines we'll clearly need to make this work; plus it
> just feels weird that the information reported by QMP can't be used
> on the command line without going through some tranformation first.
> 
> Wouldn't it make more sense to both accept and report bitmaps?

If we eventually need more than one word for the bitmap then it'll
require parsing and bitmap composition code in libvirt anyway. I
was thinking by pointing out each bit separately that we could
boundlessly grow the list without having to change anything in
libvirt later.

Thanks,
drew
