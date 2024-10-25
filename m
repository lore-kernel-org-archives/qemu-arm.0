Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1042427njx;
        Fri, 25 Oct 2024 06:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOTHqUI7nNowvmOO5hfRg8Z55yrSOnSp/EmItE2SXFIDeSK4We7arhNPq7HcrMkYi9v7VRYsvif7MG+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEurLWE/MKEVaQg2mLO3h/Q3iWOI2NCRwsYaoC8tQzqvaN1U7gMGpiZbT+PAm8LDb0O7Lpx
X-Received: by 2002:a05:6358:60ce:b0:1c3:7b8e:c35b with SMTP id e5c5f4694b2df-1c3d818f7c7mr634858855d.19.1729862047250;
        Fri, 25 Oct 2024 06:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729862047; cv=none;
        d=google.com; s=arc-20240605;
        b=fOIua3hPgVbJ61nJ0CnhdANUkH5JeqwCYbOkXuNjuXSwxNdJz8niQdsFkwLiwmh1iB
         ASgRJLgUJQQyyA8M/xR0NAL7d/Jbjr7C9bVex7QzleODpL2GblUbgl44PzMEcK/syZe6
         7h7qwhGVw2Lfxo7w5NVtEyln2HU66phpTggcT9KhbEVQyI/rLyeVYR3Swzpgxg7VYwZM
         wU00JTHiykeEJ1SuqiNmIRzGg9BVycyDjdNmIU742QZKkbFxW5Uv5hBnxuAqIb949XLM
         sy2/BJwHuSyeQZ/z8kw1FvaiadQXHXrfSNLSydc5wFywuYsUa9bJ+1VGhgQZCg7oUpnV
         rOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=utmRzVQoxVVn0L+FQtdN5VmsyzaSJviEhgivbzjdJxU=;
        fh=xvAnbKHZqn/QIdcyEcvWukR35/6Gm2tQ0V5YAjW0SGw=;
        b=fDuUee3wCLgH9JKf4cxgnuZXhUunLQCXEc+E58Qz/R+DO88i/8rLmWFrzOFTOBtDzD
         CGrvKqEpgstMjZwM0pm5lVIiOIhenqxmM5ncrrKYFxFChjeJLJ4xWBmK4gMehmb5qSPl
         zdgByFXkJwqxBCAbjWAX/+ccqhweDI8nd1HALFafSZZsc1yc+nsEInVELB41k33Tx5+z
         Fs7rQ+JfadWe6oSblxleTp9H1OcWZxpTbPv9nKhDEq8PZRnC6lR8B9JIUTXFY3eviNQc
         WtoNTYTrg2RQsMIykXDta2efbP2yH3haRo3ftn4HmHt2p67NohlUBw3OY3x8M0OZ0rl+
         qHGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGTFVeU2;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51004749558si243695e0c.163.2024.10.25.06.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGTFVeU2;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729862046;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=utmRzVQoxVVn0L+FQtdN5VmsyzaSJviEhgivbzjdJxU=;
	b=RGTFVeU2ApkdMj+1Lye7cYP1EE7NOeLwT5xPZsFGDGaQbJLWvq4DqF0r2asigxsN00gCl3
	fkhliofFAbs4tbKi6mXRq188PekQi8XoncK9T6nP99ABhWBCbMvPODZe+IZIYKBpl59KOa
	UCOqtwl4OGQFJ1KjaAEWMWDB5nrQx+U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-ec0_NatpMH6YYRXoxfo7ag-1; Fri,
 25 Oct 2024 09:14:03 -0400
X-MC-Unique: ec0_NatpMH6YYRXoxfo7ag-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80FB91956080;
	Fri, 25 Oct 2024 13:14:01 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.164])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA92C196BB7D;
	Fri, 25 Oct 2024 13:13:56 +0000 (UTC)
Date: Fri, 25 Oct 2024 14:13:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <ZxuZkUFz_bwAA1pf@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025101959.601048-22-eric.auger@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: Yn1s8gTWGcoM

On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
> From: Cornelia Huck <cohuck@redhat.com>
> 
> Add some documentation for the custom model.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 8 deletions(-)


> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
>  properties have special semantics (see "SVE CPU Property Parsing
>  Semantics").
>  
> +The ``custom`` CPU model needs to be configured via individual ID register
> +field properties, for example::
> +
> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> +
> +This forces ID_AA64ISAR0_EL1 DP field to 0.

What is the "baseline" featureset implied by 'custom' ?

On x86 we have the named CPU models each setting a baseline that matches
some corresponding real world silicon. Arm has that too, with TCG at
least. So that way you know what the baseline is that you're toggling
features against.

Experiance on x86 was that making arbitrary feature changes on top of the
named models could often backfire, as there are too many scenarios where
code will check for feature "Y", and assume that existance of "Y" implies
existance of "A", "B" and "C" too. So if you invent custom models where
Y is set, but B is missing, there's decent risk of things going wrong in
horrible to debug ways.  With that in mind, best practice is to try to
just the vanilla named CPU models to the greatest extent possible, and
keep feature toggling to an absolute minimum.  This 'custom' model does
not seem to give us such ability for arm.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
