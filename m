Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2159230njb;
        Mon, 3 Feb 2025 06:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/kkYH/Nno0KU0OKPx4giKbErucRHuLa5SZksOyMJZuBGZ/Sezs0usm66cURLy6wZmDq05
X-Received: by 2002:a05:620a:2586:b0:7b6:c4c7:ece5 with SMTP id af79cd13be357-7bffcd91fc9mr3209335485a.43.1738594215890;
        Mon, 03 Feb 2025 06:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738594215; cv=none;
        d=google.com; s=arc-20240605;
        b=BouDm+rrZSyKbwEBx3bVKM/5nuBvlS5PChPdhgHN8TYLJr6dI2WazJ207jsOjq67hG
         sI4KSWZxS8t/B5IKeUs5s2XsQsKwmd5ceok3Tf+vR+APaPOcpPJ8/8wunknMc1jh1DjI
         H/mQ7zVc4oJ/YOaHQgLmuQ60+tcLEzl8LgleGY+GQ4XOwSzta8j7ldHz70J8Skz8CTk9
         3nD4wZOb7g1L4BTXT2ryS3/Lv5TxFIRWScAf/S8gRNi2GQggwtcnkE4wufDxV+LSX1t5
         2wkMkgkNeC+4m44PlzKOkmRQo6TQanXkZFvSvQYYuAZx/R6O3NKxoufvbdiGiqshd1pY
         Eq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mRdVTiz2dg/Lm02eYt2/LxZKD8DauGBX6v2e41VDF4o=;
        fh=4mdCusmU7KXX9aeICkTohodhVJVdGFcvxmHPToAtZsw=;
        b=Pk8LsjluL0WP5Z96cXybVRzVeMym8Y1FJPe2TkqxpK48Uhgj3j3QdpxHR6POEgf7uE
         3Jnz31uoSWDUJ8q9GNdZiflo0kJYGB2TUBiMXaedVQp2SOgEkla33RGsQ+4VQtAgmtCT
         TabXhZRGgQojHuqlOEauBd1p+idxbqQF1DEDMvCVbSRUJV5QiGSLF5zaDpj2pa20zRVM
         QFoc9+S55yBvkakP1HJXKALEuySCVg8b27wmYFS8SFvFpo54wj4Q88LGyceqZzl0Q7pp
         pw0fpp/xUbRf/Wpl9pDNRv/b34IxJTWw6w7aqrGWYpwbbZm2VlF6xwdTXVoMlQgVk617
         KmRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ky4/YOJF";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4dcbdsi30450585a.36.2025.02.03.06.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ky4/YOJF";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738594215;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRdVTiz2dg/Lm02eYt2/LxZKD8DauGBX6v2e41VDF4o=;
	b=Ky4/YOJFqYejw9vuhxgnKcHHQg3Hg11CMIfsRNZkR2C3wcTh/ufQae0LFMxiWuepjYGDBR
	6zUFUaSf7e+Ql9sbavflovySdklXOx6sgOh67/tpwmQpIVKxCXTlsRb7H1f20/5ZSXtwux
	SJoJnVcHEB/+Hp1af3JuCtrMgQPYtNs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-s-B3xsWRP3K4OiVP8404KA-1; Mon,
 03 Feb 2025 09:50:11 -0500
X-MC-Unique: s-B3xsWRP3K4OiVP8404KA-1
X-Mimecast-MFC-AGG-ID: s-B3xsWRP3K4OiVP8404KA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADFD818009B7;
	Mon,  3 Feb 2025 14:50:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.64])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A655E180035E;
	Mon,  3 Feb 2025 14:50:03 +0000 (UTC)
Date: Mon, 3 Feb 2025 14:50:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>,
	qemu-arm@nongnu.org, devel@lists.libvirt.org
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
Message-ID: <Z6DXmN-ROswsaDAi@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250201091528.1177-1-philmd@linaro.org>
 <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
 <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
 <87ed0fayoy.fsf@draig.linaro.org>
 <Z6DTsdf35ApQ0qLU@redhat.com>
 <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: D1OxBbtz2xrg

On Mon, Feb 03, 2025 at 02:45:06PM +0000, Peter Maydell wrote:
> On Mon, 3 Feb 2025 at 14:33, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Feb 03, 2025 at 02:29:49PM +0000, Alex Bennée wrote:
> > > Peter Maydell <peter.maydell@linaro.org> writes:
> > >
> > > > On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> > > >>
> > > >> On Sat, 1 Feb 2025, Philippe Mathieu-Daudé wrote:
> > > >> > - Deprecate the 'raspi4b' machine name, renaming it as
> > > >> >  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
> > > >> > - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
> > > >> >  respectively 4GB and 8GB of DRAM.
> > > >>
> > > >> IMHO (meaning you can ignore it, just my opinion) if the only difference
> > > >> is the memory size -machine raspi4b -memory 4g would be better user
> > > >> experience than having a lot of different machines.
> > > >
> > > > Yes, I think I agree. We have a way for users to specify
> > > > how much memory they want, and I think it makes more sense
> > > > to use that than to have lots of different machine types.
> > >
> > > I guess for the Pi we should validate the -memory supplied is on of the
> > > supported grid of devices rather than an arbitrary value?
> >
> > If the user wants to create a rpi4 with 6 GB RAM why should we stop
> > them ? It is their choice if they want to precisely replicate RAM
> > size from a physical model, or use something different when virtualized.
> 
> The board revision code (reported to the guest via the emulated
> firmware interface) only supports reporting 256MB, 512MB,
> 1GB, 2GB, 4GB or 8GB:
> 
> https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#new-style-revision-codes

I think it would be valid to report the revision code for the memory
size that doesn't exceed what QEMU has configured. eg if configured
with 6 GB, then report code for 4 GB. 

> For Arm embedded boards we mostly tend to "restrict the user
> to what you can actually do", except for older boards where
> we tended not to write any kind of sanity checking on CPU
> type, memory size, etc.

If we're going to strictly limit memory size that's accepted I wonder
how we could information users/mgmt apps about what's permitted ?

Expressing valid combinations of configs across different args gets
pretty complicated quickly :-(


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
