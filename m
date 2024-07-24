Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3059005njc;
        Wed, 24 Jul 2024 05:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTBoSxRtO1f4udjwCwR+8JVl0RP9K/ZYMehrjKwj8En1JFeOveQaVZd4SY9/mO0GbLCpsZYU9mmMDMmqVlHAFFdn4M8JLA
X-Google-Smtp-Source: AGHT+IFJKkEiczGmw/1lOLLC1UFBnqf1TnGkoNIKw+qnvXwo3EuynEaGT25P5aacoqp6l3jD/q6L
X-Received: by 2002:a05:622a:190a:b0:447:ed6d:db73 with SMTP id d75a77b69052e-44fa517c4b1mr169142751cf.0.1721825254058;
        Wed, 24 Jul 2024 05:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721825254; cv=none;
        d=google.com; s=arc-20160816;
        b=L+8yyAdgHBeFCtI1cswVqjDUA2zEYVn3RPNkqf3wsYlfCRc67KYTaBiyZoHc+u2375
         /DOunkmVdYuRFc/HOYWZHWytbtHI250LgrUUmUmpJOybSVHT19Fg8beQSIJ30fZu1wvU
         eMn2AmjqbrsCGsmw0naWrvmEq8AJH9GEqzsAFS2YCCS2VTH1mWBcj5RsiRWAdkLSJmNX
         PUVFb+QieWxBk0N3Xl1vHpNeE0Kgxl9cWHSCPYFin2/pFP1VdC/dS03zkD0EZc4E2GW0
         1mxbA+ktz9dygJzHw2SqNK4hvzOiUkhIMWQDPAsAOl2oFpJ99WRf4aMpsMUOWlYnvPF4
         rShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=mK4f87H4NY9/71BRSRerJJDAo9/63WdDPrXjfZ2Qy1M=;
        fh=tHM4Ocb87HkmWl0ytoMQdJZ1cm2UNDbycyfFtFOQmvY=;
        b=pQT6PQj9DJo6L0QKrzKSgtCNtv+WV3IbtY6YVNcxL7N9gc+vtVTchgZmdgGn86WwCD
         eXkduxpaNcQYJpVy8jztkNqrceZrJhdBebkXP53DtS9YQJbcSDFszAtgsHwp0083J0O5
         VrybK5TqI5XpQBl8A0aHnhE/R3WGIVsAviHNm5W77M6SqdaSHBJbwEP4z5QsJoz2bd1a
         ytS7OhCE0a9osr1AqmxDHIuyeJsBc0vBLlJkz0bd40X1X6IZusLY4quD34H+0lwZrEof
         ohwaX8SfhhLTKjv591rxyfl8WriA498qM2PQhXJx9Y0T8TdXM5z2AqdwP8YLG/Krexv0
         71Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y6N2ItR+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdb7a56si126359881cf.258.2024.07.24.05.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 05:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y6N2ItR+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721825253;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=mK4f87H4NY9/71BRSRerJJDAo9/63WdDPrXjfZ2Qy1M=;
	b=Y6N2ItR+/JhXWAEhx/s6qZsrR9UZHlg3WRkt8fYtPyv2OqiPn9RI7oMf3QZeZW2gT8RVb3
	VXENEtihhs4EqN/levUc4xsbcq3NgDXSIvGAC+m9FqLOufBI6XZ+DMC6sUa5YXNNnDnJce
	bEURmk2xJYvsgeW5l7a54wtMwjrL1mo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-tIJwzxVHPJu-ibIE437_Ow-1; Wed,
 24 Jul 2024 08:47:32 -0400
X-MC-Unique: tIJwzxVHPJu-ibIE437_Ow-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A70071955F06;
	Wed, 24 Jul 2024 12:47:29 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.141])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1737019560AE;
	Wed, 24 Jul 2024 12:47:19 +0000 (UTC)
Date: Wed, 24 Jul 2024 13:47:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <ZqD31Oj5P0uDMs-I@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
 <87wmld361y.fsf@pond.sub.org>
 <Zp5tBHBoeXZy44ys@intel.com>
 <87h6cfowei.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h6cfowei.fsf@pond.sub.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 0AtyPqLkJ1Lx

On Wed, Jul 24, 2024 at 01:35:17PM +0200, Markus Armbruster wrote:
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Hi Markus,
> >> SmpCachesProperties and SmpCacheProperties would put the singular
> >> vs. plural where it belongs.  Sounds a bit awkward to me, though.
> >> Naming is hard.
> >
> > For SmpCachesProperties, it's easy to overlook the first "s".
> >
> >> Other ideas, anybody?
> >
> > Maybe SmpCacheOptions or SmpCachesPropertyWrapper?
> 
> I wonder why we have a single QOM object to configure all caches, and
> not one QOM object per cache.

Previous versions of this series were augmenting the existing
-smp command line. Now the design has switched to use -object,
I agree that it'd be simplest to just have one -object flag
added per cache level we want to defnie.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
