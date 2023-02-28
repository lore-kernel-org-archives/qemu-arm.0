Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5534481ejc;
        Tue, 28 Feb 2023 01:03:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9rBODdL79EH7uZdBh5kLfWJs+nejKGGDiR/ZrbhO+NTa1io/4gVXL5qeQYYzdI5raHTGye
X-Received: by 2002:a05:622a:64c:b0:3b8:2175:fcff with SMTP id a12-20020a05622a064c00b003b82175fcffmr3158720qtb.31.1677575026998;
        Tue, 28 Feb 2023 01:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677575026; cv=none;
        d=google.com; s=arc-20160816;
        b=M/RnUheICknv678Gb/1Duf0k/6NSQ2DEOtuFXq5H2a8KgooGh6j5Pucm23fwG9zMgG
         xx6ZsHSB8weA4ROfek+w++38rbSnzeZAQaLoLaM3t7Ss1UIF3vAQpjKmIiRfC926Jz8F
         cmpfLn3e756T+pFiBljzkwPMx9+t6490PTD9aXO1QEYEB5YraZ8plA95vguDssDAe+Wh
         /bOeHJCStvXZbRFCZKHLpu5rqTLM4Y7uUJriOCnGbNBHgayLMNwxXhfzuU6iOqi0gdSB
         1FSCIwnpDhgPHo/ehRUVnTkcXvJ+fqboUuDrKeYC3FTImvwn5gmhSutEXarfubcZJd9e
         T3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
        b=CS97x3+ZIzPBB9YtH2bdkEv3yKAuyts6pCePa+vV1zrGGgZxlam9jIWQHcZA/awtOM
         XuUiS8jcL5p/0CzGG90g+h8PLb3udbqCOG5LLGHSy3A/YwNeB0fiz4zJBUjnqttC5cVm
         IaAldBmJmvhHTJ6rUNvujIAMQ02o0v/friI+aVjOEEvPyDJl7GoAMwHslExl6v+KQYyx
         8VYwxlGWjUlTFHi+ZkbFyAvMvLBLHwvCtY0jYOvYWC4tbirwyBiJg1At2XqZqnjeCwMM
         JpboJAFzi0BJ92KCH9qMIxmGUmNJ5v7nZbwZIHE2yXsc2u8WuO9ASX/wp9/a6TNUEeju
         pdrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fo5LSnkf;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w11-20020a05622a134b00b003a546627acesi8108199qtk.376.2023.02.28.01.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:03:46 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fo5LSnkf;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677575026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
	b=fo5LSnkfs6JQaYj+NOsTSolyflqlvkdwL2ggNJm8VIuL9NM/50dFiY+kSv624zRYxiJPWL
	0e1gqIPLT2/yntkN2wr5KUALTdRSOnzO8WPz6NgMVblLZ1eYgzyRu0apUt+mCs2k8PTYC4
	KPJr0Yp4qf0atnTmz0MtVfUa6fFo0mM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-8lgS3TS_M8W42bZ3UXGFFg-1; Tue, 28 Feb 2023 04:03:45 -0500
X-MC-Unique: 8lgS3TS_M8W42bZ3UXGFFg-1
Received: by mail-wr1-f72.google.com with SMTP id l14-20020a5d526e000000b002cd851d79b2so202362wrc.5
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 01:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677575024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
        b=dvKEyNrbeEVyiBqLZoZglSpUYy479whvKglQYvj4FlCGWIBoxeSmboUAVJL8NoB+vi
         I9GbDSryGXVarg0l4waIzLRsvLZnoH2nLY5xpXFmX9Ow3YfRt+L7g8GPepal4L9o1zvx
         yAUKzmMqB1okzw78ptPog9v/GlQ+QsMDOsupUeRaq93n2/Zj2f16rbJ0nMGcBgT/oEfe
         tgKPR96uNX6uqug6w+DRrQgGMGOTWIYUb5ntBiaRJe3TobJ7K/nCaviGFN66p6mzcl1k
         giujxE1YriyhxsT8FIhE97mWEyY4dK/PCszLhurB55F9UyiMpZri6D8iPkCiMLFtMJgZ
         3RDw==
X-Gm-Message-State: AO0yUKUlOZcPJ3zB8qCvPjLHnoHYt86nOs+7TMWhGzaqD7fIdSzMbbJx
	WHVpP1zPHTf45BWaEOdff/xXjdEdLra/ovIWB2vmbhLcnJ76tzr+x2zRHBBADEmMn74/+fu09+2
	RbEKHLp3Ju042x/Fg
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id b40-20020a05600c4aa800b003eb394741eamr1323183wmp.37.1677575024175;
        Tue, 28 Feb 2023 01:03:44 -0800 (PST)
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id b40-20020a05600c4aa800b003eb394741eamr1323163wmp.37.1677575023825;
        Tue, 28 Feb 2023 01:03:43 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id bi13-20020a05600c3d8d00b003e204fdb160sm15217479wmb.3.2023.02.28.01.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 01:03:43 -0800 (PST)
Date: Tue, 28 Feb 2023 04:03:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228040115-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3CiEKKoG06t9rr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: buXefHwJaBXE

On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > I feel like we should have separate deprecation entries for the
> > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > although they're related they are independant features with
> > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > can explain the impact more clearly if we separate them.
> > > > 
> > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > a superset.
> > > > 
> > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > and the maintainance overhead is quite small.
> > > 
> > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > someone is still using QEMU usermode emulation
> > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > 
> > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > I think 32 bit x86 environments are just more common in the cloud.
> 
> Can you point to anything that backs up that assertion. Clouds I've
> seen always give you a 64-bit environment, and many OS no longer
> even ship 32-bit installable media.


Sorry about being unclear. I meant that it seems easier to run CI in the
cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

> I would be surprised if 32-bit
> is above very very low single digits usage compared to x86_64.

Absolutely.

> > > > In fact, keeping this support around forces correct use of
> > > > posix APIs such as e.g. PRIx64 which makes the code base
> > > > more future-proof.
> > > 
> > > If you're concerned about PRIx64 and friends: We still continue to do
> > > compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> > > cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> > > run in the CI.
> > > 
> > >  Thomas
> > 
> > Yes - fundamentally 32 bit does not seem that different from e.g.
> > windows builds - we presumably support these but AFAIK CI does not
> > test these.
> 
> We do compile test windows in CI via mingw, and we also do build
> and unit tests via msys.
> 
> Even Windows has dropped 32-bit support though, and so the only
> reason we keep 32-bit Windows around is because of Windows 10.
> Once a Windows 12 comes along, we'll not need to support 32-bit
> Windows either.
> 
> With regards,
> Daniel

Or maybe we'll just rely on WSL.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
