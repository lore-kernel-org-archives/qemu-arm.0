Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2818130ejs;
        Tue, 4 Jun 2024 02:32:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBRtOk+uB02gkQ38IONidA9Cjj+FtTYKqidtxiMK3NjNJkSYiO/d2CCZnBDttu2kJt2uZiPaRbgy1AJQLIGZlHVDT2OUx2
X-Google-Smtp-Source: AGHT+IEA+1s4ZRu/dVQAfFYQxft6uEKvjt6ewS63au7xrTUHokesOU1ynG7jh4jAfej0PVLDDMqU
X-Received: by 2002:a05:6870:a113:b0:250:7f2b:7092 with SMTP id 586e51a60fabf-2508bb70337mr14166499fac.50.1717493546418;
        Tue, 04 Jun 2024 02:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717493546; cv=none;
        d=google.com; s=arc-20160816;
        b=wc2jYeCpTJKYY71N407yjI7cMypHnsL0G24zofqwoGAKe4Cu1c4cKI2B00oOpZePOA
         vyG80GB1NhlukQALAS9V17fHkOPP2V563KBqkh6MiWe6xOKXUidI9rW6jkR5aYUXBFwa
         1tOj7mbsW1JztucKdP2SqZV4KHN74q9jHI4S+MzNRVu8WO4NZJH1hVDJqrwk35Wwsdz3
         ahpXTvIPX8szR/7sl1x8Cvc/fhGcmmmjqLyk56Uw4I5tZj2S28Md5BhAS0QitPk3COOV
         H00UGOh9WYh1PiHK30jO+gEv4LZFJwLuq9HkMoihFfagZTHMEhbSwhG9cpQEHZ2+e2wt
         RXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Kj3Af50YVLKSXNM5eVa3oxycaL5wmFR39UMS4qGQoVk=;
        fh=tHM4Ocb87HkmWl0ytoMQdJZ1cm2UNDbycyfFtFOQmvY=;
        b=pxSGatCW4vH6mOEJEVmomDexAwbv18wkCATWwbssR9qXfdBnQlPRjQEFM2/bjlPPsR
         1s7/me3bglAZ1yZSvViCRjF6mGq6eVei6Rr5z2kStC14Ogc2hcz6Z8iYxGtnlMzg87ia
         g/7k7ySLL2vKTvx8Vx1gTLHfHVpQs2HB/iwk/kYBMK174NhsiXpNnwhEyBHii9soA42h
         udt77ZO5LBAA5WdQkhMyREj/+VKJ6hQvKjVcUFnCPWoHVCGdjrMD/DFZUcyXjaORn3If
         BteU2IRgpTmrfJYbXEYRN9OtYblx6LZAyvE9HxkFshrn1X2dRyGxNlhNvCNCOezqVBVn
         aOhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzMuIKd0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f318a3e0si1144247485a.510.2024.06.04.02.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzMuIKd0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717493545;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Kj3Af50YVLKSXNM5eVa3oxycaL5wmFR39UMS4qGQoVk=;
	b=PzMuIKd0zkF95JqUpyK36Q42TuAV/lFjOltyYBKQAKV1rhkrxkWiW8O4IlcNkZX4Wpjwh3
	adaJeTCVBG2lshBPHMC1J2Sm6FQ1aODJo+jCVaguoCss44RaZaMSuhX6A+pIDO2wGf+6By
	KK7pmBfb1cm1vKT166HlsrJkPPl+Ylg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-CB9fc94iPDG0jTlRbq3LXQ-1; Tue,
 04 Jun 2024 05:32:20 -0400
X-MC-Unique: CB9fc94iPDG0jTlRbq3LXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9057B29AB3E0;
	Tue,  4 Jun 2024 09:32:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C559320230B7;
	Tue,  4 Jun 2024 09:32:16 +0000 (UTC)
Date: Tue, 4 Jun 2024 10:32:14 +0100
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
Subject: Re: [RFC v2 3/7] hw/core: Add cache topology options in -smp
Message-ID: <Zl7fHop_GaiJt6AE@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <20240530101539.768484-4-zhao1.liu@intel.com>
 <87sext9jfo.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sext9jfo.fsf@pond.sub.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-TUID: Bgfe/bZ2e1xP

On Tue, Jun 04, 2024 at 10:54:51AM +0200, Markus Armbruster wrote:
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> > -smp to define the cache topology for SMP system.
> >
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> [...]
> 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 7ac5a05bb9c9..8fa5af69b1bf 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1746,6 +1746,23 @@
> >  #
> >  # @threads: number of threads per core
> >  #
> > +# @l1d-cache: topology hierarchy of L1 data cache. It accepts the CPU
> > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > +#     topology container share the same L1 data cache. (since 9.1)
> > +#
> > +# @l1i-cache: topology hierarchy of L1 instruction cache. It accepts
> > +#     the CPU topology enumeration as the parameter, i.e., CPUs in the
> > +#     same topology container share the same L1 instruction cache.
> > +#     (since 9.1)
> > +#
> > +# @l2-cache: topology hierarchy of L2 unified cache. It accepts the CPU
> > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > +#     topology container share the same L2 unified cache. (since 9.1)
> > +#
> > +# @l3-cache: topology hierarchy of L3 unified cache. It accepts the CPU
> > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > +#     topology container share the same L3 unified cache. (since 9.1)
> > +#
> >  # Since: 6.1
> >  ##
> 
> The new members are all optional.  What does "absent" mean?  No such
> cache?  Some default topology?
> 
> Is this sufficiently general?  Do all machines of interest have a split
> level 1 cache, a level 2 cache, and a level 3 cache?

Level 4 cache is apparently a thing

https://www.guru3d.com/story/intel-confirms-l4-cache-in-upcoming-meteor-lake-cpus/

but given that any new cache levels will require new code in QEMU to
wire up, its not a big deal to add new properties at the same time.

That said see my reply just now to the cover letter, where I suggest
we should have a "caches" property that takes an array of cache
info objects.

> 
> Is the CPU topology level the only cache property we'll want to
> configure here?  If the answer isn't "yes", then we should perhaps wrap
> it in an object, so we can easily add more members later.

Cache size is a piece of info I could see us wanting to express

> Two spaces between sentences for consistency, please.
> 
> >  { 'struct': 'SMPConfiguration', 'data': {
> > @@ -1758,7 +1775,11 @@
> >       '*modules': 'int',
> >       '*cores': 'int',
> >       '*threads': 'int',
> > -     '*maxcpus': 'int' } }
> > +     '*maxcpus': 'int',
> > +     '*l1d-cache': 'CPUTopoLevel',
> > +     '*l1i-cache': 'CPUTopoLevel',
> > +     '*l2-cache': 'CPUTopoLevel',
> > +     '*l3-cache': 'CPUTopoLevel' } }
> >  
> >  ##
> >  # @x-query-irq:
> > diff --git a/system/vl.c b/system/vl.c
> 
> [...]
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
