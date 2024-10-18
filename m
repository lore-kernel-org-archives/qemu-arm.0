Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp659481njb;
        Fri, 18 Oct 2024 00:58:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFDAAU3WTnsfG6iLQ7xc7LcIgXn3nT0resvBnVWUIUIeugF6/VJKYLwZt2DAf3mLbEjv8rqS8+IgfjYw==@linaro.org
X-Google-Smtp-Source: AGHT+IHkXDXQtol2m67wDU9BLfI1kZnL0Ij90vZDAQpTvjPQWeS9Yj34GpkG15gy6hb5nopfEU2B
X-Received: by 2002:a05:620a:4046:b0:7b1:1cb8:1a56 with SMTP id af79cd13be357-7b157b5a69cmr164992685a.14.1729238302143;
        Fri, 18 Oct 2024 00:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729238302; cv=none;
        d=google.com; s=arc-20240605;
        b=PhiUD9aR/mjwCXI6lP5FTYh4FUEmTF3p+uiE38YhIoK1zdb7RrpqgX+77RlkjRX+W3
         DH6yVt+zUJDWVSAM9DKvM8hnUEPEN9/PFQZRlVA7iEg9jits+j7SGXMFbXnct4DWYFtp
         WOdZqbXH1qaxy3j79RrMnVuHevmI6TIlH8yWMItx86VWJ7Bsz0+VomwuDiM5F0U3Sbeb
         1Ua90BgXEq17UfoGHyaUWPJ8cnVlGGdacUa+c3l2Lp/XwYglu0sosUHlXzapdbPD0tLh
         q+q38ZaoGFTV4SPCmPy9O16F6ClNiTTrJFHR1PqSPrhH8b+dR2p4fx0GopQm7CjeVPCp
         omgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=DTTMNicW4OjRcXbKL4oqTcLX63sd7nExpwbEaCF2IcE=;
        fh=8o6MdM69yW7KnUpp0LF0iA+MU8ridrpH5X1tqzzP+yc=;
        b=Uz4cCXfiUVVQfMFmo66AVIMcIod/+BEf+oJQXcDhf3+J1QiVCHm6XLXZAgfukTJHHk
         TvRIfBipDIhywJZV17Ipfv24/s1e/SvPZT9y/nIUMsq/thqtt8EAKcH/84KOghIM+iDx
         A0QvLuV/A5YSN+ILIF/qFicn32Eu7kejW73h5FOGviueIiyS+Rq38DD/JF4Ei2FYsWAG
         NQs/NNJ+HMWPuT4HFWWO3bjRIYfs+kkqXNogA88sKrMwnhYn66BkkNsNex5hDbrzyADG
         dKtw83KBKb5uNmBNZri58MgLmSN5b5/6Lp1nTelmHkdSbUIpwuX/a7rpSk/jvjzgzWzH
         GVkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i5kW1Ljg;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b156f869e5si127558685a.186.2024.10.18.00.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i5kW1Ljg;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729238301;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=DTTMNicW4OjRcXbKL4oqTcLX63sd7nExpwbEaCF2IcE=;
	b=i5kW1LjgzT1cmu5ZlTKyLQu1oJ5BIyrQFps7HGrXwtuMVe+nMG/3/T8ZdDA6CusZLZ5bAk
	2EYKB81BklB8yYkci07yaG2WmfaBBqYjXA/ZZjM4tdCZ5FBuZIZk931BwFuSPefrXFfptY
	BQmxuW64oZ+lMa7Q8LYs9MQrC+lCW2Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-7mvuoKwiMHmr0nwGMQ75mg-1; Fri,
 18 Oct 2024 03:58:18 -0400
X-MC-Unique: 7mvuoKwiMHmr0nwGMQ75mg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 253291954227;
	Fri, 18 Oct 2024 07:58:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6EABD19560A3;
	Fri, 18 Oct 2024 07:58:06 +0000 (UTC)
Date: Fri, 18 Oct 2024 08:58:03 +0100
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
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v3 6/7] i386/pc: Support cache topology in -machine for
 PC machine
Message-ID: <ZxIVC-XQaMqOy6Fw@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-7-zhao1.liu@intel.com>
 <ZxEs3DGGgCqGT5yK@redhat.com>
 <ZxHcsPyqT6MLJ9hG@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZxHcsPyqT6MLJ9hG@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: R8k6Uco/NJo1

On Fri, Oct 18, 2024 at 11:57:36AM +0800, Zhao Liu wrote:
> Hi Daniel,
> 
> > > +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> > > +        Define cache properties for SMP system.
> > > +
> > > +        ``cache=cachename`` specifies the cache that the properties will be
> > > +        applied on. This field is the combination of cache level and cache
> > > +        type. It supports ``l1d`` (L1 data cache), ``l1i`` (L1 instruction
> > > +        cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified cache).
> > > +
> > > +        ``topology=topologylevel`` sets the cache topology level. It accepts
> > > +        CPU topology levels including ``thread``, ``core``, ``module``,
> > > +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> > > +        value ``default``. If ``default`` is set, then the cache topology will
> > > +        follow the architecture's default cache topology model. If another
> > > +        topology level is set, the cache will be shared at corresponding CPU
> > > +        topology level. For example, ``topology=core`` makes the cache shared
> > > +        by all threads within a core.
> > > +
> > > +        Example:
> > > +
> > > +        ::
> > > +
> > > +            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core
> > 
> > There are 4 cache types, l1d, l1i, l2, l3.
> > 
> > In this example you've only set properties for l1d, l1i caches.
> > 
> > What does this mean for l2 / l3 caches ?
> 
> Omitting "cache" will default to using the "default" level.
> 
> I think I should add the above description to the documentation.
> 
> > Are they reported as not existing, or are they to be reported at
> > some built-in default topology level.
> 
> It's the latter.
> 
> If a machine doesn't support l2/l3, then QEMU will also report the error
> like:
> 
> qemu-system-*: l2 cache topology not supported by this machine

Ok, that's good.

> > If the latter, how does the user know what that built-in default is, 
> 
> Currently, the default cache model for x86 is L1 per core, L2 per core,
> and L3 per die. Similar to the topology levels, there is still no way to
> expose this to users. I can descript default cache model in doc.
> 
> But I feel like we're back to the situation we discussed earlier:
> "default" CPU topology support should be related to the CPU model, but
> in practice, QEMU supports it at the machine level. The cache topology
> depends on CPU topology support and can only continue to be added on top
> of the machine.
> 
> So do you think we can add topology and cache information in CpuModelInfo
> so that query-cpu-model-expansion can expose default CPU/cache topology
> information to users?
> 
> This way, users can customize CPU/cache topology in -smp and
> -machine smp-cache. Although the QMP command is targeted at the CPU model
> while our CLI is at the machine level, at least we can expose the
> information to users.
> 
> If you agree to expose the default topology/cache info in
> query-cpu-model-expansion, can I work on this in a separate series? :)

Yeah, lets worry about that another day.

It it sufficient to just encourage users to always specify
the full set of caches.

> > Can we explicitly disable a l2/l3 cache, or must it always exists ?
> 
> Now we can't disable it through -machine smp-cache (while x86 CPU support
> l3-cache=off), but as you mentioned, I can try using "invalid" to support
> this scenario, which would be more general. Similarly, if you agree, I
> can also add this support in a separate series.

If we decide to offer a way to disable caches, probably better to have
a name like 'disabled' for such a setting, and yes, we don't need todo
that now.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
