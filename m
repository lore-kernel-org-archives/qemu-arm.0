Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1730499njb;
        Thu, 6 Feb 2025 10:29:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3r8ZxEO9DSFFwLIJijeGWID7svWLhA+r7vs5gVBtwn46buGGNcBlLY8DbSYhEsOHQ8o+5i4pIYtI3Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IG5nc3MrhLhkz9W1Bym7lviszlY/v9vbuMnEfSQh3nvvKqO3FlxQIlbeJlHTGJbXeyyeOtt
X-Received: by 2002:a05:620a:f06:b0:7b6:cef9:4f10 with SMTP id af79cd13be357-7c04021b323mr580940685a.3.1738866580960;
        Thu, 06 Feb 2025 10:29:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738866580; cv=none;
        d=google.com; s=arc-20240605;
        b=gSyS3cPNr+7EqslyQp5HL2+4AyGOVGFXZq/P2rioWasNq+eJtbMSXOMqFMaSOIN2be
         +Ft/FTp0klXGQsQ1gogNohzexvkSEXgF/VEGPprIV6CFaXUYtPUEQZOhoAHJ3QtrpZDY
         /CpwfDJbj/b1RE0hRsqNMERwbu2/ANEonu5f9i8ix99P3vu5eQDndJaL4XPwxC7EQ9yb
         9NC/I2rNA8t2p4ndTjdCzqz42Q0yI5ldxV5mTfw76Gq4ApJQPO3L1ZE+ZAs2LDDI87Pa
         sax85K5D/VtuG4h0sbg9jJ5KM0klrmAngCVjuO1HPdGg1D4MrVRkCgLW49nh8UMNe7bd
         aEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=KI2DOOaV3dbeEITFxz4B1KXfKreqQWBTvBq5BN6IjXQ=;
        fh=pwDYXay3Yt2BO8Ms+4fJIH6BI8j97dz/KZoD4fkcruA=;
        b=b+sD8VV1ou6df6JX7a/5g3v/sPNi6cy2U/KPLbabm7ILNy0ED+ekFwdr/0eHmS0ib8
         nl6k7d6s6SNj1ZMjy9UVi3Df9RNQmyOBRRHQB1Nem/Fc4gjFa8Ko8RFEtmxkQlHBza8D
         2k/YCaJY1pFDMZ2DO+tnrZexH51GS4qJifRUNup9xfABfs+5ranifSkj7ZHKDkDuHIHQ
         WNGZFayzwiSclzJIiGP8QVVj2wSVJ9NkEGOAUrE+0qd1vuZipJCnqip2hm6QMl3GgHgo
         pGG098O1tcYtV/tqb4l6ImrTvEZjLMvBn6d3MAc2m2gxDPolI+j2IvlpEoKvaUh7ulYd
         abOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B4JvTa4m;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed0c1dsi155955085a.578.2025.02.06.10.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:29:40 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B4JvTa4m;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738866580;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KI2DOOaV3dbeEITFxz4B1KXfKreqQWBTvBq5BN6IjXQ=;
	b=B4JvTa4mZtQPTiY/WvpGtS37ZBrH0st2eFl+RgWzSmTQKXIgDAZVkOJsdfkotu4OSxaRYP
	6MZ7aYUxjOG8Q3LFZdpQEih+t5YsDC7djGKQYLyUkTaFnDLD8Bz0NwCBOXZrdveK94sD2G
	vAM7hd6qy/dEZC49gtFWuTjU7WH42Mk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-Xiw8yKdDO9idB-ydvzM4qg-1; Thu,
 06 Feb 2025 13:29:37 -0500
X-MC-Unique: Xiw8yKdDO9idB-ydvzM4qg-1
X-Mimecast-MFC-AGG-ID: Xiw8yKdDO9idB-ydvzM4qg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 480E7195605B;
	Thu,  6 Feb 2025 18:29:35 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E0731800570;
	Thu,  6 Feb 2025 18:29:30 +0000 (UTC)
Date: Thu, 6 Feb 2025 18:29:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Message-ID: <Z6T_hq21zjtU43bC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org>
 <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
 <Z6TtisO7JGAMGILH@redhat.com>
 <63f1130e-a30d-4416-ae74-374f1fd94dbe@linaro.org>
 <Z6T6CiL_F-LvLGel@redhat.com>
 <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce653340-1375-41b5-bebb-c7089d3ab2bb@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: VO6ThoVhnnjY

On Thu, Feb 06, 2025 at 07:24:55PM +0100, Philippe Mathieu-Daudé wrote:
> +Michal
> 
> On 6/2/25 19:06, Daniel P. Berrangé wrote:
> > On Thu, Feb 06, 2025 at 06:49:38PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 6/2/25 18:12, Daniel P. Berrangé wrote:
> > > > On Thu, Feb 06, 2025 at 04:04:20PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > On 6/2/25 15:31, Daniel P. Berrangé wrote:
> > > > > > On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > > > Hi Daniel,
> > > > > > > 
> > > > > > > On 6/2/25 14:20, Daniel P. Berrangé wrote:
> > > > > > > > On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
> > > > > > > > > Introduce an abstract machine parent class which defines
> > > > > > > > > the 'little_endian' property. Duplicate the current machine,
> > > > > > > > > which endian is tied to the binary endianness, to one big
> > > > > > > > > endian and a little endian machine; updating the machine
> > > > > > > > > description. Keep the current default machine for each binary.
> > > > > > > > > 
> > > > > > > > > 'petalogix-s3adsp1800' machine is aliased as:
> > > > > > > > > - 'petalogix-s3adsp1800-be' on big-endian binary,
> > > > > > > > > - 'petalogix-s3adsp1800-le' on little-endian one.
> > > > > > > > 
> > > > > > > > Does it makes sense to expose these as different machine types ?
> > > > > > > > 
> > > > > > > > If all the HW is identical in both cases, it feels like the
> > > > > > > > endianness could just be a bool property of the machine type,
> > > > > > > > rather than a new machine type.
> > > > > > > 
> > > > > > > Our test suites expect "qemu-system-foo -M bar" to work out of
> > > > > > > the box, we can not have non-default properties.
> > > > > > > 
> > > > > > > (This is related to the raspberry pi discussion in
> > > > > > > https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
> > > > > > > 
> > > > > > > My plan is to deprecate 'petalogix-s3adsp1800', so once we
> > > > > > > remove it we can merge both qemu-system-microblaze and
> > > > > > > qemu-system-microblazeel into a single binary.
> > > > > > > 
> > > > > > > If you don't want to add more machines, what should be the
> > > > > > > endianness of the 'petalogix-s3adsp1800' machine in a binary
> > > > > > > with no particular endianness? Either we add for explicit
> > > > > > > endianness (fixing test suites) or we add one machine for
> > > > > > > each endianness; I fail to see other options not too
> > > > > > > confusing for our users.
> > > > > > 
> > > > > > We would pick an arbitrary endianness of our choosing
> > > > > > I guess. How does this work in physical machines ? Is
> > > > > > the choice of endianess a firmware setting, or a choice
> > > > > > by the vendor when manufacturing in some way ?
> > > > > 
> > > > > Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
> > > > > (wired to a CPU pin which is sampled once at cold reset).
> > > > 
> > > > That makes me thing even more it is just a machine type property.
> > > 
> > > I'm happy with a machine property, this was even my first approach
> > > using OnOffAuto until I ran the test-suite and have qom-introspection
> > > failing.
> > > 
> > > What should be the default?
> > > 
> > > Per the SH4 datasheet:
> > > 
> > >    Bit 31—Endian Flag (ENDIAN): Samples the value of the endian
> > >    specification external pin (MD5) in a power-on reset by the
> > >    RESET pin. The endian mode of all spaces is determined by this
> > >    bit. ENDIAN is a read-only bit.
> > > 
> > > There is no default per the spec, and I believe using one is
> > > a mistake.
> > 
> > If it is left as an unspecified choice in the spec, then I would
> > presume HW vendors are picking an option based on what they
> > expect "most" common usage to be amongst their customers. IOW,
> > if we know of typically used guest OS prefer big or little, that
> > could influence our choice.
> 
> Please have a look at this thread:
> https://lore.kernel.org/qemu-devel/d3346a55-584b-427b-8c87-32f7411a9290@amd.com/

That seems to give a pretty clear choice for qemu defaults

 "I am not aware about anybody configuring MB to big endian"

so in that particular case, defaulting to LE would be most sensible.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
