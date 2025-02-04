Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp126325njb;
        Tue, 4 Feb 2025 02:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmgBmA4YKHQ+eYv/Cb0kPv5h5w9z/ymqS5DZlHiOq6Mz62VP55QrI9k25OYOAAQaL32ea828Et7Z8RrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGB02dNaj0BCt+7RlS4Mva5GbFdyc+VEShUMXgrmlNPkSh8yIT+WV5HibfqVvv7FIdsbw3k
X-Received: by 2002:a05:620a:3723:b0:7b6:cb66:ad74 with SMTP id af79cd13be357-7bffccdfa82mr4405452585a.18.1738666334542;
        Tue, 04 Feb 2025 02:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738666334; cv=none;
        d=google.com; s=arc-20240605;
        b=K2WLckJy6KITI3jlTjO20n6LfVLyEUjXv6td84nuqFmCOVmhrL6vHkg4TC86K10TTk
         dZsVV49qeNAV4fnDun4hKdLHXWoU4crRdrb6WZQI3pC789rcXjg/S8P3e+18TgwwaVK0
         /mwNyRUpDMjbfRzuHEEUCUh5jXdtIE6uZVeVwfee+04I0NIU0ywYot3iurcqYApIQwPj
         IXrQOKTuLFeGtccV701Kd6Y7jkxy1i9LHvqW/Ow0j5/TcFw+p1qbPPm+5nlz9B3w3auW
         HyLp1PtEv5TClzWB+0ck8NZzNpUQgQfUP8I0Sp7OUeySPBhzOX4jpJ1tIuKyZi0cbqnU
         +zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=4GlSCs3CxU85WJ5JTuwL2PiTF6MIOBHntqrOayzb2jw=;
        fh=lu773w75w/i7TjQdWbJVklPn2lP29lCMkAzFx2pRSiI=;
        b=fPusseFaGRxo250c+qxYDnPmy5o5QYchldUxQpSfM++eNe4Vj6cC93eTWCq7xAXuaQ
         wTxWGjgrBlo4ERoMpguJUYTn8nkei/YLoYABUgUAkDpSAW2VlDVBovJDylnsFVIKRYtu
         uw401Dy8sV7iZArO7A/Z72FeVmRYwmlc6UHsPiZOfw/UhKyHYqhVkg2gB8Os0TP831iu
         BuB7XJtJ2X423fhjFR5d4a0CEQI1S2pMHEdvucKtxeOVmBFBWZG6AlcHgKA9tVmwXjUv
         ZM19NMFGdG9p57AoWVmfNUXgI0fHvgP7wrhJXOKgzIl8eh5pd8FrOU2pfSo8gYiwPij9
         /1/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7OKuEuG;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4bbc8si267567085a.45.2025.02.04.02.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7OKuEuG;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738666334;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GlSCs3CxU85WJ5JTuwL2PiTF6MIOBHntqrOayzb2jw=;
	b=O7OKuEuGpOpDRrZBBxWsCs9FlkuzPfTEvoo+URvKKEtDITMR71rkGquBI1D7ae+kKvfsrn
	6xMyNH9d+M5rfuBxLnNZmZtJfsJPQpTahS83qyKF9q9/6D382OOOm2kl355bkUU2apG2Bw
	JTDtfmbxAYwmiQ1Nu6pMfJGrFX1Vq0U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-TmxiyW06NlGpR9t9lPfZgA-1; Tue,
 04 Feb 2025 05:52:11 -0500
X-MC-Unique: TmxiyW06NlGpR9t9lPfZgA-1
X-Mimecast-MFC-AGG-ID: TmxiyW06NlGpR9t9lPfZgA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E35D1800269;
	Tue,  4 Feb 2025 10:52:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3749318008C8;
	Tue,  4 Feb 2025 10:52:02 +0000 (UTC)
Date: Tue, 4 Feb 2025 10:51:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
Message-ID: <Z6HxT6cHJTUNwRbB@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
 <Z6HklNsu0Mzgh7bC@redhat.com>
 <18ebe0c3-7ae6-4ba4-92f1-452a613d2c8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18ebe0c3-7ae6-4ba4-92f1-452a613d2c8d@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: jxscSDqugzut

On Tue, Feb 04, 2025 at 11:48:10AM +0100, Philippe Mathieu-Daudé wrote:
> On 4/2/25 10:57, Daniel P. Berrangé wrote:
> > On Tue, Feb 04, 2025 at 10:51:04AM +0100, Philippe Mathieu-Daudé wrote:
> > > On 4/2/25 10:22, Peter Maydell wrote:
> > > > On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > > > 
> > > > > All previous raspi machines can be created using the
> > > > > generic machine. Deprecate the old names to maintain
> > > > > a single one. Update the tests.
> > > > > 
> > > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > 
> > > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > > index 4a3c302962a..c9a11a52f78 100644
> > > > > --- a/docs/about/deprecated.rst
> > > > > +++ b/docs/about/deprecated.rst
> > > > > @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
> > > > >    Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
> > > > >    CPUs. Big endian support is not tested.
> > > > > 
> > > > > +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
> > > > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > > > > +
> > > > > +The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
> > > > > +which takes the model as argument.
> > > > > +
> > > > > +    - `raspi0`` is now an alias for ``raspi,model=Zero``
> > > > > +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
> > > > > +    - `raspi2b`` is now an alias for ``raspi,model=2B``
> > > > > +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
> > > > > +    - `raspi3b`` is now an alias for ``raspi,model=3B``
> > > > > +    - `raspi4b`` is now an alias for ``raspi,model=4B``
> > > > 
> > > > This is not how we typically handle "we have a bunch
> > > > of different devboards in one family". What's wrong with the
> > > > existing set of machine names?
> > > 
> > > Zoltan and you don't want to add more machine names, then you
> > > don't want a generic machine. This is very confusing.
> > 
> > IMHO we can have distinct machines for each model, but
> > *NOT* have further machines for each RAM size within a
> > model.
> 
> Got it. Unfortunately I spent more than my hobbyist time credit
> doing this, so if I find the motivation to revisit, it'll be later.
> 
> Still, having machine memory size depending on the host config was
> a bad design choice IMHO, as we test different setup depending on
> the host being used, so not really a "reproducible" setup.

Yeah that one is a bit ugly. IMHO it would be valid to just leave
it defaulted to 2GB and ensure we get a nice error message on
32-bit hosts, letting users override RAM size if they desire. Or
its just another reason to kill 32-bit hosts

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
