Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5531302ejc;
        Tue, 28 Feb 2023 01:00:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9kci8vhD65lXIdiyQ5iHQrYZneKXBa/zD03Eeipkkg2+vG+nlsYExTiqP3boqhX0NeWAb8
X-Received: by 2002:a05:6214:e8f:b0:56b:ff69:7df8 with SMTP id hf15-20020a0562140e8f00b0056bff697df8mr4211257qvb.51.1677574801354;
        Tue, 28 Feb 2023 01:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677574801; cv=none;
        d=google.com; s=arc-20160816;
        b=LKx4sn9RcGYcIjv3Rq4XMzQqMNpwg5mBrVwDGYyFZTRQQE46hgp0UE6O6WCgXLOQBd
         oWsHk//RyGe8xO82EaXmK+tOyvWtybkGIN/oZiQYzrtACQyAM0o8C+AAmF6gvt3uHyXb
         o2B9wYGJcqE/j8PEjRHE0NiV/cgof5M9kXeDNJPYIXL+C/mLJIDJFXP7G5xezNngC6Hw
         pPiW3aOqawu6QC3ecgU3shwNOkHdBCSN4Jnz5u7tDh7w+FV2hO0tbgU3/V/B7x9Woofo
         eI+W8P20SxDME/uljcsZeO1wx5gFE1odCsKNIt99e2DQtZAk/VGocbWlloN3Kbqnk9fC
         jE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0EF5YmrVTXup8974t3suecxHHmZbvsS2aqdc5XTi5Ek=;
        b=hih5CcsgrgPvV9b68eZ7rW7CUtcXP/zCGvaJ5jARbPHPoMhdEbVv4XGaN4XqK/DZGF
         4udzo5T+jLZNo1QcJfWCRwVMk4YpYdT1GUI1SeL2NPXtYptxLrlcxl7/pHMGHtwWHwns
         vzyVjJ8UlBOlLOObpSEPjqOzAnGYm3JGVy1rBKK4q87lW+ZWvuodIswQNq6CAnEsbD9v
         v2mpQu+sxYSuMO2HwgWxox1CGyzck/76vLwnQPtusJzD4AGmGwI9DF5Bx0mx8n28+RKQ
         UBHmv6S3olwHzyFYatq9NoceXipaS5oEwTMGM6+CzTOgVr9dQMVrtqnM8FMt+xK9XLVa
         qhcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFeIbr+E;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n7-20020a05622a040700b003bfd9eaed1csi4488913qtx.675.2023.02.28.01.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFeIbr+E;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574800;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EF5YmrVTXup8974t3suecxHHmZbvsS2aqdc5XTi5Ek=;
	b=TFeIbr+E02sglU+6eQ+p6KSHvdM5aYW4bedHT0OcqZKOtR1hC+1NHWfE+0GjpXmVHRvjz1
	2Eb1a2h1QJVXRKEv86gGUxbxXA523Ge25/H3KfwQIpB6gPdDIXOTrtzlKOu2OVFf1jxnOM
	lqCiYcFSpX7y58/0PeQ9ybuXUywj1Jc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-unzHq4k8NrGaRGqkhunq0A-1; Tue, 28 Feb 2023 03:59:57 -0500
X-MC-Unique: unzHq4k8NrGaRGqkhunq0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02EC9299E747;
	Tue, 28 Feb 2023 08:59:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF2A2026D4B;
	Tue, 28 Feb 2023 08:59:54 +0000 (UTC)
Date: Tue, 28 Feb 2023 08:59:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3CiEKKoG06t9rr@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228031026-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: azaZ65uUmRsG

On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > I feel like we should have separate deprecation entries for the
> > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > although they're related they are independant features with
> > > > differing impact. eg removing qemu-system-i386 affects all
> > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > can explain the impact more clearly if we separate them.
> > > 
> > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > a superset.
> > > 
> > > Removing support for building on 32 bit systems seems like a pity - it's
> > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > and the maintainance overhead is quite small.
> > 
> > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > someone is still using QEMU usermode emulation
> > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> 
> I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> I think 32 bit x86 environments are just more common in the cloud.

Can you point to anything that backs up that assertion. Clouds I've
seen always give you a 64-bit environment, and many OS no longer
even ship 32-bit installable media. I would be surprised if 32-bit
is above very very low single digits usage compared to x86_64.

> > > In fact, keeping this support around forces correct use of
> > > posix APIs such as e.g. PRIx64 which makes the code base
> > > more future-proof.
> > 
> > If you're concerned about PRIx64 and friends: We still continue to do
> > compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> > cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> > run in the CI.
> > 
> >  Thomas
> 
> Yes - fundamentally 32 bit does not seem that different from e.g.
> windows builds - we presumably support these but AFAIK CI does not
> test these.

We do compile test windows in CI via mingw, and we also do build
and unit tests via msys.

Even Windows has dropped 32-bit support though, and so the only
reason we keep 32-bit Windows around is because of Windows 10.
Once a Windows 12 comes along, we'll not need to support 32-bit
Windows either.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
