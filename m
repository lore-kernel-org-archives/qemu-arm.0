Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1354491njm;
        Thu, 6 Mar 2025 01:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVht4asjJAxJRg4uTUadBBtVYfjG97co5zEA861Chp3n8UJgYVg7Kj6PS50kwbZzT0KG38Q0SbHJM03Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHD+15MDDL8bYoFFZeenVmWG+PTcQgFkdIgHXi85aYo6ZSz0aQCXrcejoknIdbifV2x2ZfU
X-Received: by 2002:a05:690c:9b0f:b0:6fd:4849:62da with SMTP id 00721157ae682-6fda2f87dd1mr102397357b3.22.1741252907911;
        Thu, 06 Mar 2025 01:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741252907; cv=none;
        d=google.com; s=arc-20240605;
        b=DR/p9WGoIwaZUK2RDNWW9+91FOBx+SsQ/DHgUrp2Jp1XyVgbIpOY3rvKo350SLujdZ
         lYqGZrDQT2eZqUJBK14fqPHjQO+G4yTG2rh9RSk4MZwKH/14kRdmEzm93+m9tV/AGaG6
         Rtzi0WlaPShpXBTqt2fKz3PrM+hWoTS28B4fBkbSdmESDfQxafPaI5rLGDbLWsMaeBcL
         fQs/eyDGGrG2115QNym4s6AeLPifeXE9bzJ+SoNdpPWLlp8NrY6gh+pURMv7QC6jFZYe
         QnLq7VdiaygiWDhRM1XYP4AiYUbieLn5NWfaC+kf7xxLVcHVR+9txtEQLYCONtqXT+u5
         O7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=+fE7ocxEBIWLDJiLQCiXw6MUiosAmWceyhwxWZUHTzM=;
        fh=SnT0fizqs/La+VRtqVXAmYUBOKuPB2xmIK/FkphvlPo=;
        b=Wkg04MupdzZ7OREsH0+etbQ6S9gAeJncJYdu9+uGlXWBMmTBQW9CcfQ6umJYQFQvBi
         TQefPmwRRoXW5y7Q5Fo+FS9zlvDNx9fDcPatcffxdHXtIFmWiCwJpVRA6aJGawv1uIy0
         wMmeoMDRg/SpdnELJHV/D1YlMk7hCeO8tbXQalTpwc1TIHNEvZDq+JJsMe22y2zC0pqB
         hggbNc2kb5BQUwsEHVTcK/bTwchHiX7DHPHXNDHzsA+2+i09hcS/UPFaEzXon+0SE+ck
         X70Ollmfb7b4a9i0K+Eed728jk7BMsfkcUugvI/m3aKe+sVciGRBXswCfv1qWBGvg4zZ
         qz3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QgS7PXh/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-6feb2c11ca6si6526957b3.353.2025.03.06.01.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QgS7PXh/";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741252907;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fE7ocxEBIWLDJiLQCiXw6MUiosAmWceyhwxWZUHTzM=;
	b=QgS7PXh/5RUUjt/tqZ1ivPZNZLgtS1ZNvKQlVvLXR3VMsac9Wqnlt4VUr0IiCAFR5T0ofm
	otwcx80R+2v0MtIVbWWiGXHAkMVMfnH1wp0DHszDgxrButxvc3Qv+/DRSYVOIFXh7HdnFp
	opW3cLdqWWzW12X/I8vjgtQetxW8Zww=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-xgyO-kMTN9GtFWtkMS4LtQ-1; Thu,
 06 Mar 2025 04:21:21 -0500
X-MC-Unique: xgyO-kMTN9GtFWtkMS4LtQ-1
X-Mimecast-MFC-AGG-ID: xgyO-kMTN9GtFWtkMS4LtQ_1741252880
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1BBD1800361;
	Thu,  6 Mar 2025 09:21:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.112])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9719B300019E;
	Thu,  6 Mar 2025 09:21:15 +0000 (UTC)
Date: Thu, 6 Mar 2025 09:21:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
Message-ID: <Z8lpB6XdNPT8zyTa@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305161248.54901-3-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: +GONmYbv4aoz

On Wed, Mar 05, 2025 at 05:12:46PM +0100, Philippe Mathieu-Daudé wrote:
> For legacy ARM binaries, legacy_binary_is_64bit() is
> equivalent of the compile time TARGET_AARCH64 definition.
> 
> Use it as TypeInfo::registerable() callback to dynamically
> add Aarch64 specific types in qemu-system-aarch64 binary,
> removing the need of TARGET_AARCH64 #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/bcm2836.c | 6 ++----
>  hw/arm/raspi.c   | 7 +++----
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 95e16806fa1..88a32e5fc20 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c


> @@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] = {
>          .name           = TYPE_BCM2836,
>          .parent         = TYPE_BCM283X,
>          .class_init     = bcm2836_class_init,
> -#ifdef TARGET_AARCH64
>      }, {
>          .name           = TYPE_BCM2837,
>          .parent         = TYPE_BCM283X,
> +        .registerable   = legacy_binary_is_64bit,
>          .class_init     = bcm2837_class_init,
> -#endif
>      }, {
>          .name           = TYPE_BCM283X,
>          .parent         = TYPE_BCM283X_BASE,

So historically we have a subset of machines that are only exposed in
the qemu-system-aarch64 binary, and not qemu-system-arm.

You're attempting to build a single binary to cover both 32 & 64 bit
arm, so need to be able to filter what machines are available to
create when the symlink indicates invokation of the 32-bit binary.

If we extend your approach into the future, we may eventually have
a qemu-system-any with all targets, and symlinks from the legacy
binary names, so need to filter based on target as well as on
32/64-bit.


The reason you want the .registerable callback is so that we can
have a single static list of all machine types passed into
DEFINE_TYPES in bulk, instead of implementing a manual constructor
to do type registration and conditionally calling type_register()
for each type.

So I can understand why you took this approach, but conceptually I'm not
comfortable with the semantics of 'type_register' being a method that
registers a type, except when it doesn't register a type. That feels
like dubious semantic design.

If I step back a level, I would ask why do we need to skip the registration
of machine types at all ?

It is because existing code blindly assumes that if a machine class is
registered, then it is valid to instantiate that machine class. IMHO this
is where the current design limitation is.

No matter what we do the code will exist in  memory in the binary. If we
register a type that's a tiny bit of memory to hold the "Class" instance
and ought to be logically harmless if we never instantiate a type.

IMHO we should always unconditionally register all types for which we
have code in memory. If there are types like machine types, where some
Classes should be blocked from instantiation based on certain criteria,
we should instead represent that with a check at that class level in
some manner.

i.e, we could have a helper

    bool machine_is_available(MachineClass *mc)

which we use as a filter when querying machine types that are available to
instantiate (-M help, query-machines), and as a pre-condition prior to
instiating a machine type (-M <name>).

That may in turn imply a callback

   bool (*is_available)(void)

on the MachineClass, for which your legacy_binary_is_64bit() method would
serve as an impl.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
