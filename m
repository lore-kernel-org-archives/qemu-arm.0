Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3182541wrg;
        Mon, 13 May 2019 12:17:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgkhi2hA1dzm2GKiBy6LjoEZsFnVNAjAT8nwZzTLnhzT3/5vLc9zIHbGc/g9q5IMSW0gBW
X-Received: by 2002:ac8:1096:: with SMTP id a22mr25033930qtj.288.1557775026903;
        Mon, 13 May 2019 12:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557775026; cv=none;
        d=google.com; s=arc-20160816;
        b=K3em+a/tX9zf0GVVLpyuYdJFupLEZ4Pu+FGws3gJ2P7FVHN+YFCXCDeH1f7i1zwEZX
         /Cjy+381pZSx/eoaMwpGtq5ZL024nXO+MR2nQkQv/fKVbZN5cPSc89ktnTjkW5aDoBQj
         ++XjyKdCFUr7cqrGYqMa11vn15TrEeNAUOQNVn9hl5vO6WYAj66OYKaTL3zwN4WCGfiv
         xEgZEt9NDeO3iSjgsxAjmpU2sS8Dg7UFOY0UD1hQ1G0TsWKKb2qsA7WXQy+nrPkNYrbg
         EM0z7wfVGfLBtG999kW9oGO44h/jWQ2PLuRwK04DfjjJa7n843Zi1jYDy4AkPNex/4NZ
         UJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=LvxqFQ53LpGK36fL48H4/YtNaW9AYfi39DWGbSJYg2g=;
        b=UR3JwxlQQhrtBWEDuzXn8wp47A3IF8O/4SycGHpmOqg/WKUczoyVsU/lCUg+32qo53
         xYWVKDvGL1wOAtI1rz9aascG1SF+T1kshCQ6hR5LZGbZgYcb8YRhRl1QajHwTSWzejor
         fUhJa5hlvijpU/0lK6yWGXjNSLbRH1wljsNKEtMrZn/wmURl7llJNNy7j+SafJ4/xGt6
         p4x9g4diXnIQMcpPDDt14l+VRR+DI6zce93OOF1rP8857oI/ZYlOSe7EnjSv/Fk1wDdJ
         2+l4JxWN2c2PSFpxPFl4LN0ogEd2migVF1Zf6J0wbTFMDoxRuMaCPz3MjgmHibCxrakO
         wocA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p9si1744458qkg.174.2019.05.13.12.17.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 12:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8E0D3082E66;
	Mon, 13 May 2019 19:17:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB3C60856;
	Mon, 13 May 2019 19:17:02 +0000 (UTC)
Date: Mon, 13 May 2019 21:16:59 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
	Dave.Martin@arm.com, abologna@redhat.com
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513191659.2vmrw3act5qkudou@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa220ee2-b4bc-cdfa-ddde-90206e417cf3@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 13 May 2019 19:17:05 +0000 (UTC)
X-TUID: 1ujbPA/4UHTB

On Mon, May 13, 2019 at 11:46:29AM -0700, Richard Henderson wrote:
> On 5/12/19 1:36 AM, Andrew Jones wrote:
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
> 
> This doesn't seem right.  Why is -cpu host not whatever the host supports?  It
> certainly has been so far. 

-cpu host can support whatever the host (hardware + KVM ) supports, but if
a user doesn't want to expose all of it to the guest, then the user doesn't
have to. For example, the host cpu may have a PMU, but the guest doesn't
necessarily get one (-cpu host,pmu=off).

> I really don't see how -cpu max makes any sense for
> kvm.
>

It's already supported for kvm. This series just extends that support
to match tcg's sve support. The reason it's supported is that you can
then use '-cpu max' along with '-machine accel=kvm:tcg' in a command
line and it'll just work.
 
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
> > 
> > This may look redundant, but it's necessary to provide a future-
> > proof query, because while KVM currently requires vector sets to
> > be strict truncations of the full valid vector set, that may change
> > at some point.
> 
> How and why would that make sense?
> 
> Real hardware is going to support one set of vector lengths.

The guest's view of the hardware will be a single set. That set can be
different for different guests though, within the constraints of the
architecture and KVM or TCG implementations.

> Whether VQ=3 is
> valid or not is not going to depend on the maximum VQ, surely.

Exactly. That's why we need a way to explicitly state what is supported.
We can't assume anything from the max VQ alone. Additionally, while
strict truncation is required now for KVM, things may be more flexible
later. TCG is already more flexible. For TCG, all sets that at least
include all the power-of-2 lengths up to the maximum VQ are valid, as
the architecture states. Plus, all the sets that can be derived by adding
one ore more optional lengths to those sets are also valid. Listing each
of them allows management software to know what's going to work and what's
not without having to know all the rules itself.

> 
> I'll also note that if we want to support the theoretical
> beyond-current-architecture maximum VQ=512, such that migration works
> seemlessly with current hardware, then we're going to have to change the
> migration format.
> 
> So far I'm supporting only the current architecture maximum VQ=16.  Which
> seemed plenty, given that the first round of hardware only supports VQ=4.
> 

I agree. The changes won't be small to QEMU, but hopefully we can design
a QMP query that won't need to change, saving libvirt some pain.

Thanks,
drew
