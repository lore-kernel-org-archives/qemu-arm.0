Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4168094wrg;
        Tue, 14 May 2019 09:03:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5tK4BCz6Mqr4oHR1tGbLWlsuHqD+wVI5IorH6xtm0JQx42GooR/BShqOkWVw8KcAVGdAa
X-Received: by 2002:a37:481:: with SMTP id 123mr27562105qke.118.1557849807931;
        Tue, 14 May 2019 09:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557849807; cv=none;
        d=google.com; s=arc-20160816;
        b=GA7zgmbi5dtbJGhMX6sEBFgHmq8DrJbPCkJSLzMkcT6E6oBM3h8/ZBwRUXB7dx5zLn
         2o0gDXhsGPi5fExS1V9phCZmIPSqkD6KX8BC/x24wMtj7C5emGXcQ/gNAO/j2SKQo6tf
         pygrXPe0cGMYMO2/h5+Pu8LebVnwFpy7fTzakizuq09agtfHmopupzA1QYOSpYK9wdHf
         z/CpGeAmUSxvZ7CWW6lYpy/SwUlQhp8CBAbZahneSmtZFWzX4cQry8fYhY7vj6kxGIk6
         OGdYMyJMWG4vmO8JZOGIwFu+9UFK3/LQklojfMfE88yVXzoxEnLx8lodKiDuHiqRYsqw
         u5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=ikrR8UgcG689BYLUSYObdhSFBdRSgNE05fRR6nVlli8=;
        b=XurSAf0cYSp/zuCFmm8vatKvqeRVtkFfWghLuhRHgMCLPwxGsFpw3IVPtU1D8X9xr5
         MedCdDP8EMoe684Sj9RKeB0mXRkrtL/zpUkZkqxGVMxBJJwgr4CRUKpLW3gg/7cgaqwQ
         iFzMWxtHWgiOg4gsfirs817c4ccLFWcecWvFowQD+mev8aV7gP4N6VwmQyJUSUMiuqC2
         1Nw0j37roALkh/Bcxj0Ep4g0IcNrGHhY9qZSuZJdS2WzgpITikj2chOFrP6glnqXQOub
         JYJ+Bjl4f4xIfv/HdNZPnZ2SreYcuwUjeOuxhCIyFCde9jF0yibx2ri+BC+nwKMLAO2k
         gUhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <abologna@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e18si1492447qkg.90.2019.05.14.09.03.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2CAE81E0F;
	Tue, 14 May 2019 16:03:13 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7912B9E4;
	Tue, 14 May 2019 16:03:10 +0000 (UTC)
Message-ID: <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, 
	qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org, 
	alex.bennee@linaro.org, Dave.Martin@arm.com
Date: Tue, 14 May 2019 18:03:09 +0200
In-Reply-To: <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
	 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
	 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
	 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 14 May 2019 16:03:22 +0000 (UTC)
X-TUID: uZ9TYA9saQcr

On Tue, 2019-05-14 at 14:53 +0200, Andrew Jones wrote:
> On Tue, May 14, 2019 at 02:29:51PM +0200, Andrea Bolognani wrote:
> > Since we expect management applications to use QMP to discover what
> > vector lengths are supported and then provide an explicit map, I
> > think it's fair to say that the ability to specify a single maximum
> > vector length is going to be exclusively used as a convenience for
> > command line users.
> > 
> > In that light, I think it would be reasonable for the usage to look
> > along the lines of
> > 
> >   -cpu host,sve-vl-map=0xd # machine-friendly variant
> >   -cpu max,sve-vl-max=512  # user-friendly variant
> 
> We already have sve-max-vq, so I'm not sure we want to rename it.

Oh, I didn't realize that was the case. And of course it already
takes a number of quadwords as argument, I suppose? That's pretty
unfortunate :(

Perhaps we could consider deprecating it in favor of a user-friendly
variant that's actually suitable for regular humans, like the one I
suggest above?

[...]
> > > Dave points out
> > > we may want to reduce the list to a single set and then add flags
> > > to indicate what can be done with it in order to derive other sets.
> > > What do you think about that?
> > 
> > So right now all that can be done is truncating the list by removing
> > an arbitrary number of elements from the end, right? Eg. if you have
> > [ 1, 2, 4 ] you can use either that or [ 1, 2 ] or [ 1 ]. But in the
> > future you might also be able to mask single elements in the middle
> > of the list, thus enabling things like [ 1, 4 ].
> > 
> > That doesn't sound very complicated to support in libvirt, though I
> > have to say that I'm not a big fan of this proposal because as far as
> > I can see it basically means implementing the very same logic twice,
> > once in QEMU and then once more in libvirt.
> 
> So if big tables of bits aren't a problem for QMP queries, then I'll
> just leave the design as it is.

I thought about it a bit more and perhaps the simplified design is
better after all.

Whatever the interface looks like on the QEMU side, we're going to
want to offer libvirt users two options for configuring vector
lengths: listing all desired vector lengths explicitly (basically
sev-vl-map but more verbose and readable) and providing just the
biggest desired vector length (like in sev-max-vq).

In the latter case, we'll want to expand the user-provided value
into an explicit list anyway in order to guarantee guest ABI
stability, and doing so when a single bitmap has been obtained via
QMP seems like it would be more manageable.

Sorry for the flip-flop, but after all isn't this exactly what
upstream design discussion is supposed to be all about? :)

[...]
> > If the size of the bitmap on the KVM side is 512 bits, why don't we
> > just make it that size on the QEMU side too from the start?
> 
> I'd still only want to input 64-bits on the command line, otherwise
> we get into inputting arrays, which isn't easy. KVM's interface is
> meant for expansion, but it won't be using most of those bits for
> quite some time either.

I'm probably missing something entirely obvious, but couldn't you
just have a single, possibly fairly massive (up to 128 hex digits if
I'm not mistaken) value on the command line and just work with that
one, no arrays necessary?

-- 
Andrea Bolognani / Red Hat / Virtualization
