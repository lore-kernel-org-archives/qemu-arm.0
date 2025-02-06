Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1683611njb;
        Thu, 6 Feb 2025 09:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBE/S41ce2SIc5AcVwTz13VDBNXaelcifD670PlNwd6/ra4fr4qfO/XPiM03aHhETEWPOqn2sjlNAayA==@linaro.org
X-Google-Smtp-Source: AGHT+IFT0GTeLT7+nyiUlnmmQlGPpslj//pp/BG6lp5OAMTb5r5Wn7lI817fnQvWTCTjoJ8BMVmW
X-Received: by 2002:a05:620a:2a11:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7c039fa59a6mr996483285a.2.1738861976174;
        Thu, 06 Feb 2025 09:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738861976; cv=none;
        d=google.com; s=arc-20240605;
        b=TDT6/lsa/fAdt0Mp5YEavFt2a16203XivFdAxSeDEirSBngs2tMTqIOkGiUeru9No4
         aoSZNJm9GWlGTpaBW9PV/5QcJd0rn1PmBTDgn9QCiLJTqJPeRBHnq1V3S1ws4xoBjqtP
         oyylT/5C4N2hEnqy/v7en9+QACxw9jUOmH5lK8HTpNPk5eYlEcASIpU6cluOkj5os7rh
         Bm9H/+Bx8qRaVA5/cWewBcmzEzY5CW2xC+S5aBpoKv/dbTAAieXgCMJMfO6DYjD0oNkP
         mK+8Fnm6ANB0yBCH+0MaUqOTwRNsrV9yaORw2hbcghfM5OoixDaBMwiKfRKu2h7poqMo
         l2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=a9D14+ttmEpbIjxxs+8RIc6XcrX92xYxztdX0W95HbA=;
        fh=7Aa77BkrXCfbXSFuDdK6Vchd4euXH9xiaaJ+EUUQuLk=;
        b=V151WVbn+0s1Z5TiamPLVsVH9xUaNv4Qc8pAsHAP0+UMp7uAtMPh/j6TP55dCQKqbi
         G5FrCcZd06/b/qWpKHnEuQvrvIj+typDm2FecvccWU+54cRWqQuNuDrloIAwnA5psy1N
         cUzkej7HGIFK9ruAGFrDcUFre3dh7S+rL1kbbdLONXLKMKYBOTzPq0Fl4inaJ4vgZLPC
         nU7FawygOH16W8AzOJnqzfzYYLh0Tswty1SFoWE+xBxW3/LcS1cFTPmhD53C8H/piGbF
         /7Q1gJWLUtdIrWm1t+EGfdwlFo1YeJrZf0VtAM2fF5YJcKUb6BNmtPhbmyCSGIuk+Ibp
         RVzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6p+S+nx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee5450si140044385a.608.2025.02.06.09.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K6p+S+nx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738861975;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9D14+ttmEpbIjxxs+8RIc6XcrX92xYxztdX0W95HbA=;
	b=K6p+S+nxed3dtBDDT2ryJo5qzHZqmGMOrgIW75HhWjej4YvXwVCMmdEV8pRBOBWL2SJsK+
	e4wK39sOjM9zDyqc1n+u+iUqplZ6hznNh+qWFd/Om16hVYdIPKeI5UjYHn2NVQBzSTaAMm
	aDjx4WrKtR9x3mmkNe2ECALndkitlng=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-cxgIoaijOxOqJSkwXVbYJA-1; Thu,
 06 Feb 2025 12:12:52 -0500
X-MC-Unique: cxgIoaijOxOqJSkwXVbYJA-1
X-Mimecast-MFC-AGG-ID: cxgIoaijOxOqJSkwXVbYJA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82551195604F;
	Thu,  6 Feb 2025 17:12:50 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7D721800360;
	Thu,  6 Feb 2025 17:12:45 +0000 (UTC)
Date: Thu, 6 Feb 2025 17:12:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Anton Johansson <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Message-ID: <Z6TtisO7JGAMGILH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org>
 <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 5A1Kn+QlHHzq

On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/25 15:31, Daniel P. Berrangé wrote:
> > On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
> > > Hi Daniel,
> > > 
> > > On 6/2/25 14:20, Daniel P. Berrangé wrote:
> > > > On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > Introduce an abstract machine parent class which defines
> > > > > the 'little_endian' property. Duplicate the current machine,
> > > > > which endian is tied to the binary endianness, to one big
> > > > > endian and a little endian machine; updating the machine
> > > > > description. Keep the current default machine for each binary.
> > > > > 
> > > > > 'petalogix-s3adsp1800' machine is aliased as:
> > > > > - 'petalogix-s3adsp1800-be' on big-endian binary,
> > > > > - 'petalogix-s3adsp1800-le' on little-endian one.
> > > > 
> > > > Does it makes sense to expose these as different machine types ?
> > > > 
> > > > If all the HW is identical in both cases, it feels like the
> > > > endianness could just be a bool property of the machine type,
> > > > rather than a new machine type.
> > > 
> > > Our test suites expect "qemu-system-foo -M bar" to work out of
> > > the box, we can not have non-default properties.
> > > 
> > > (This is related to the raspberry pi discussion in
> > > https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
> > > 
> > > My plan is to deprecate 'petalogix-s3adsp1800', so once we
> > > remove it we can merge both qemu-system-microblaze and
> > > qemu-system-microblazeel into a single binary.
> > > 
> > > If you don't want to add more machines, what should be the
> > > endianness of the 'petalogix-s3adsp1800' machine in a binary
> > > with no particular endianness? Either we add for explicit
> > > endianness (fixing test suites) or we add one machine for
> > > each endianness; I fail to see other options not too
> > > confusing for our users.
> > 
> > We would pick an arbitrary endianness of our choosing
> > I guess. How does this work in physical machines ? Is
> > the choice of endianess a firmware setting, or a choice
> > by the vendor when manufacturing in some way ?
> 
> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
> (wired to a CPU pin which is sampled once at cold reset).

That makes me thing even more it is just a machine type property.

None the less, since you've already taken this pattern of
dual machine types for BE & LE on  MIPS/SH4/XTensa, I think
we should stick with your precedent. Consistent modelling
of endian handling across all machine types is most important
IMHO


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
