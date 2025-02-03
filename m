Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2148082njb;
        Mon, 3 Feb 2025 06:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBrM8/60yTPk7TEu6q8bKk2LOpbnabBmekQJ2EJaLNmZXsjRmQr9kLv0B3TSSOcaBlKwx4
X-Received: by 2002:a05:6122:d87:b0:518:81aa:899b with SMTP id 71dfb90a1353d-51e9e4e2f3cmr15941840e0c.6.1738593217112;
        Mon, 03 Feb 2025 06:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738593217; cv=none;
        d=google.com; s=arc-20240605;
        b=Hwal1ahVCfRbDrWqS2BtbwMl4Rxc0nhB3wZnDkTAT8CLjRGrqH+A4/QRpHMyL6q72a
         6uGfoONQIaeRQ5YNnW9UzwDnrXt8sdk9/tuq4eCMhujyS9M24xzq0ODLRZO2apFRgiQ9
         kgiA+oigU0VNed2VEVC/LzGHPmVAqeF7SMgB8mXIASLvC397B9X6vBZzkWsv7ZHlJM3C
         uCrOO1OPiCR0kSOy/wN3vzPM2auJoUikHLiQHosFxjCfTglMdtJkquX5MYNB3wiG6+20
         jc1ry1XGjZREFqMN5rW8uRm8jWaAwADtNXQNH9qdmTQCocBcpfyxzZasYSqjibcbe7KD
         TBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=B/8lBcAxko77k2JXvwd14R3PdPpTHUsEvPGEv7+BpP0=;
        fh=MoJSz1pmkjN8PmIZYaJY6hadZ5SasLo2Y4mRFrXcnls=;
        b=G4kipeHxx+IyrLXGgiiMht/0BMyHmBbO6Q8CakLE1WQHgkzac6cWWSGTIv3MNDTuC9
         S6DLAxOw7L2e/DaM4h8jqVVUivMzcb/zOR7gqjurqjyygLAWTVZD61we+hhN3M2Xv5q0
         gt04aOUZ4+V3iWIqJcHbsha0v2fsvroa08JKWZVsHulKz01E9FApQU3N4BtdvoYjh+ik
         UQhekCAzx8C5mGoogREYc4aagkRGszxB2jQvatBu+yiyUpGAv+X8i8WQiFwHGX18ZI8K
         NteoIx8+2k+tvnGHxnMjnN6m56Mplj++jYclbeRSoLqWJQji7SQODSK5C52eBN2jcuBU
         GylQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8Rb5H+k;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51eb1e36b9csi2311286e0c.188.2025.02.03.06.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:33:37 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8Rb5H+k;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738593216;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/8lBcAxko77k2JXvwd14R3PdPpTHUsEvPGEv7+BpP0=;
	b=g8Rb5H+kt6FtNyQFR4czJhYfGo3tpIFmhOHSGHxlK4FoeAf/mrfhdAAms3EE/c8Jh3Ucsu
	nY5RVS/QQ77bibqgCrLjpqeXT2lZMfOqNLp+cMJDE6JhWwr7GpdxR7ZCseLiCs5xlP838p
	FT6tk5ZhOXc1LrDfSQ3cyvM5RuAQJyU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-_ZEzzofhMEqaSxQEspyoFg-1; Mon,
 03 Feb 2025 09:33:31 -0500
X-MC-Unique: _ZEzzofhMEqaSxQEspyoFg-1
X-Mimecast-MFC-AGG-ID: _ZEzzofhMEqaSxQEspyoFg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A30519560B2;
	Mon,  3 Feb 2025 14:33:28 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.64])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 491F5180035E;
	Mon,  3 Feb 2025 14:33:25 +0000 (UTC)
Date: Mon, 3 Feb 2025 14:33:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>,
	qemu-arm@nongnu.org, devel@lists.libvirt.org
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
Message-ID: <Z6DTsdf35ApQ0qLU@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250201091528.1177-1-philmd@linaro.org>
 <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
 <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
 <87ed0fayoy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed0fayoy.fsf@draig.linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: WafVS9IJWPz+

On Mon, Feb 03, 2025 at 02:29:49PM +0000, Alex Bennée wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >>
> >> On Sat, 1 Feb 2025, Philippe Mathieu-Daudé wrote:
> >> > - Deprecate the 'raspi4b' machine name, renaming it as
> >> >  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
> >> > - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
> >> >  respectively 4GB and 8GB of DRAM.
> >>
> >> IMHO (meaning you can ignore it, just my opinion) if the only difference
> >> is the memory size -machine raspi4b -memory 4g would be better user
> >> experience than having a lot of different machines.
> >
> > Yes, I think I agree. We have a way for users to specify
> > how much memory they want, and I think it makes more sense
> > to use that than to have lots of different machine types.
> 
> I guess for the Pi we should validate the -memory supplied is on of the
> supported grid of devices rather than an arbitrary value?

If the user wants to create a rpi4 with 6 GB RAM why should we stop
them ? It is their choice if they want to precisely replicate RAM
size from a physical model, or use something different when virtualized.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
