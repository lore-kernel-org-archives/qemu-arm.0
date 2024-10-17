Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp264870njb;
        Thu, 17 Oct 2024 08:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvGb8kA7YPF1AJI8KUw863wqqTcb0PXgH6Dn12wn51EdwsQ2Nj+wM9HBn6xiHLI813D/KFdXHS/1ocUA==@linaro.org
X-Google-Smtp-Source: AGHT+IEFX2PyS+/jBHwIZYz4gB/buacJvpObiGg/qUA9BIkSAkDXJdMNMPYWqnTK7VGW86q848ua
X-Received: by 2002:a05:620a:7209:b0:7ac:c359:f132 with SMTP id af79cd13be357-7b11a37a38bmr3369877185a.26.1729178862954;
        Thu, 17 Oct 2024 08:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729178862; cv=none;
        d=google.com; s=arc-20240605;
        b=JyBedSZJudEQbgXyWg/VzSx+5scNwYLNubJiENaw9hZqY6C0f1KbOsdgNATCxastqN
         oUajypGJzWb/onAmlyRkRQKGwGWJ97qCym9qecJmmY7rxuvcFMxxqlm8APpkVUS1K0DO
         UJORLAkiyiED+RLxvOKGC3ku941C6g0t9DJKLbKGZuQnp2Y4ZeYYvQ7SMeg27zJ9ruxJ
         Kd527ytTO2/O/3a7HseXar0Uz2jBt4aXLLe1OpUucFPxYb57m9c28ojO1/zbPHTa2vPf
         jOcs0kXlbpLu33GWOubci8/O8OuYpjqn9cCN0Lmq00wp2xpF1oUFWjthuG1N3v2m3mK1
         EZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=2hqjuI+0DE4xj9nC242F59bUCqjvPn6E1OOsFI7D9lQ=;
        fh=uLhyhLRRukOpnVfM6/k5PvqMGWdfc4a2doIncLxt/dQ=;
        b=XdJsSyKt8x03LCR0TUAZDaGJSSb3BGUr9yfctOMB8WvdW4Gv4hpGg5regqKH4yVCgj
         AOZUCR+t0n7d5y70ujGZ9jUCGjCIxWz46Hqv7yXawzfSBwGKcEoJ32p6KjhwP095GhwY
         mDk6YaM1kLCds1aUVhEijNoPe4GM0dTOquRJVROU9qvjOY1UtBhL4sAtFK8wD4/drTyt
         t+JkA4Lcr5SFfp2go9av+NWsKpm0PsIfLO+Modc6QKT7GTwan4LhhIXuKA88MO2mhgWo
         IzDbJFHx7uByDkVtDedcgCCpOx9NjYC4TyOasqTc+8j1NS8Ptlfgkcbxw2MLn1Z30Nh6
         psnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cLYkUI+A;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b14ddef1e4si216143185a.110.2024.10.17.08.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cLYkUI+A;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729178862;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=2hqjuI+0DE4xj9nC242F59bUCqjvPn6E1OOsFI7D9lQ=;
	b=cLYkUI+A7nqeEBehTKC+kl+maAGG3mC86UUIpsiEWGWLd0bWWZLSAZnWqoJachtIwdIvCf
	+Rcick64m5bEj0hZKtP5HcKU+b59fpQbip4Uk+vZ+FmY1kalNPoRXACn5gHMZGMSt8rIzI
	mhSsbSVbMFBWcdDIZ2yhl/JUFHQfaK0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-28IWBqzCPGeLoyD-s9Kbew-1; Thu,
 17 Oct 2024 11:27:39 -0400
X-MC-Unique: 28IWBqzCPGeLoyD-s9Kbew-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 515DB1955F41;
	Thu, 17 Oct 2024 15:27:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DB31300018D;
	Thu, 17 Oct 2024 15:27:27 +0000 (UTC)
Date: Thu, 17 Oct 2024 16:27:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v3 6/7] i386/pc: Support cache topology in -machine for
 PC machine
Message-ID: <ZxEs3DGGgCqGT5yK@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-7-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012104429.1048908-7-zhao1.liu@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: fv0Vj6cen0aZ

On Sat, Oct 12, 2024 at 06:44:28PM +0800, Zhao Liu wrote:
> Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
> machine.
> 
> Additionally, add the document of "-machine smp-cache" in
> qemu-options.hx.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> Changes since Patch v2:
>  * Polished the document. (Jonathan)
> 
> Changes since Patch v1:
>  * Merged document into this patch. (Markus)
> 
> Changes since RFC v2:
>  * Used cache_supported array.
> ---
>  hw/i386/pc.c    |  4 ++++
>  qemu-options.hx | 26 +++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
>              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> +
> +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> +        Define cache properties for SMP system.
> +
> +        ``cache=cachename`` specifies the cache that the properties will be
> +        applied on. This field is the combination of cache level and cache
> +        type. It supports ``l1d`` (L1 data cache), ``l1i`` (L1 instruction
> +        cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified cache).
> +
> +        ``topology=topologylevel`` sets the cache topology level. It accepts
> +        CPU topology levels including ``thread``, ``core``, ``module``,
> +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> +        value ``default``. If ``default`` is set, then the cache topology will
> +        follow the architecture's default cache topology model. If another
> +        topology level is set, the cache will be shared at corresponding CPU
> +        topology level. For example, ``topology=core`` makes the cache shared
> +        by all threads within a core.
> +
> +        Example:
> +
> +        ::
> +
> +            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core

There are 4 cache types, l1d, l1i, l2, l3.

In this example you've only set properties for l1d, l1i caches.

What does this mean for l2 / l3 caches ?

Are they reported as not existing, or are they to be reported at
some built-in default topology level. If the latter, how does the
user know what that built-in default is, and avoid nonsense like
l1d being at socket level, and l3 being at the core level ? Can
we explicitly disable a l2/l3 cache, or must it always exists ?

The QAPI has an "invalid" topology level. You've not documented
that as permitted here, but the qapi parser will happily allow
it. What semantics will that have ? 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
