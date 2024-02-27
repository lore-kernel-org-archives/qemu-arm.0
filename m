Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2555215ejf;
        Tue, 27 Feb 2024 01:12:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEsJGPA3Pgli0uB65CPIQzI7pP/6mapb9RX7QhXFPjNf1sIOkb4tRZw03b3IP+zVCxMstVsMmq2pf3FrTMg3p9ruKhVptj
X-Google-Smtp-Source: AGHT+IH/pwCCFJSv2x1+NtOzT8wWRq8X7g1RRTowuBcWi9RiwMFKN+C1hx3YPpjh1NhDwTmzKOHF
X-Received: by 2002:a05:620a:2105:b0:787:3aee:32dd with SMTP id l5-20020a05620a210500b007873aee32ddmr1665606qkl.57.1709025153246;
        Tue, 27 Feb 2024 01:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709025153; cv=none;
        d=google.com; s=arc-20160816;
        b=O0hqoJ5YwLDHU/uIap+s4DJ9PftvE9tDk6gTJUEwX9syc1jGWQzTfpf5R1BisFYTLX
         go/8mcqW+8u2hKV7Z05hyxC0+CTHjLs4wdYu5dm95GHWjuDETjJTu3lR3Eq79IVW0zq1
         5SOBH4TCu4hExCSBHDY9UFSaw9xwkFopT0tU/lPXrEvSJtDlkXVMfA1INX9yT2RuSl+K
         RBB30lJyU/CIX/nglypMqbSlBkAgrPIqrDNYKlOnt/9XhmupDSZQgfN9Y52mSuzCkKF2
         UJ0gn8/9rP1fGlwzLVQBMIBkA9bZKI37BKuUBPlyM2HvXWkCf9hYwZQwvQjwKK2+TZtM
         V2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=v+RdFPWoEi4G0dpITK5HWGkYzQ6cUrxSrSkxlO/IF04=;
        fh=eKD2jaVNvffZiH/aRfEdAEdKtGl/Codgzrrgvjsy+t8=;
        b=qi3g+/gZwY4BN6S1d7TTVbtuxfCHe34sxZjQrj+FnvnEx3Qg2yEi9lCadEJHthvT+O
         Ok5HCws+sSF4D/gHE2DT9acL8ILfgd+8smTVO2UIMv6DecRW+Y5C17hFjC4TDq1SvL+N
         d8EP5DpyulCYB2oH7cJ7SzM16V1mebta/qGZjMKhzHynU9T4Z2cvMCoLIB0vRy8m/W+m
         SqK8WSXWbqmrKLLxiUGkV0aNxjb7i+mbDpy/aD1B1YqBLt4WePSRnmdPcWxli4zed7fi
         imoUohV1JQlfKhD4ImnV1GfnFWWNP8wlZ32uBg1b3RQF1hVqE5Odo41kXEs3GLhnXW8Q
         MAAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGrHI5Sr;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j13-20020a05620a146d00b00787a63f79d5si7007646qkl.657.2024.02.27.01.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 01:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGrHI5Sr;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709025152;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=v+RdFPWoEi4G0dpITK5HWGkYzQ6cUrxSrSkxlO/IF04=;
	b=OGrHI5Srox1GXWOWWws0vClww2irdcDRP5EXMH2BBozf2lui7Zblry+rGPqQ6+ageRe0SL
	t86beuXcjOXh+bZQDaByAO/mDTf9gfC5fBnKDurzdegSTwtdRAMyFo1elJl7OAKoEojOcY
	pOGrw6fBSc9jZww5qSqkJZrwc2o4YuA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-TdEwwMHjOVWUMPyxAOmaHA-1; Tue, 27 Feb 2024 04:12:28 -0500
X-MC-Unique: TdEwwMHjOVWUMPyxAOmaHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 567DA106D1AC;
	Tue, 27 Feb 2024 09:12:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0941BC185C0;
	Tue, 27 Feb 2024 09:12:22 +0000 (UTC)
Date: Tue, 27 Feb 2024 09:12:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <Zd2ndJghXbmMHzBn@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <20240226153947.00006fd6@Huawei.com>
 <Zd2pWVH4/eo3HM8j@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zd2pWVH4/eo3HM8j@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: MM4KPFJU7UmR

On Tue, Feb 27, 2024 at 05:20:25PM +0800, Zhao Liu wrote:
> Hi Jonathan,
> 
> > Hi Zhao Liu
> > 
> > I like the scheme.  Strikes a good balance between complexity of description
> > and systems that actually exist. Sure there are systems with more cache
> > levels etc but they are rare and support can be easily added later
> > if people want to model them.
> 
> Thanks for your support!
> 
> [snip]
> 
> > > +static int smp_cache_string_to_topology(MachineState *ms,
> > 
> > Not a good name for a function that does rather more than that.
> 
> What about "smp_cache_get_valid_topology()"?
> 
> > 
> > > +                                        char *topo_str,
> > > +                                        CPUTopoLevel *topo,
> > > +                                        Error **errp)
> > > +{
> > > +    *topo = string_to_cpu_topo(topo_str);
> > > +
> > > +    if (*topo == CPU_TOPO_LEVEL_MAX || *topo == CPU_TOPO_LEVEL_INVALID) {
> > > +        error_setg(errp, "Invalid cache topology level: %s. The cache "
> > > +                   "topology should match the CPU topology level", topo_str);
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (!machine_check_topo_support(ms, *topo)) {
> > > +        error_setg(errp, "Invalid cache topology level: %s. The topology "
> > > +                   "level is not supported by this machine", topo_str);
> > > +        return -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static void machine_parse_smp_cache_config(MachineState *ms,
> > > +                                           const SMPConfiguration *config,
> > > +                                           Error **errp)
> > > +{
> > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > +
> > > +    if (config->l1d_cache) {
> > > +        if (!mc->smp_props.l1_separated_cache_supported) {
> > > +            error_setg(errp, "L1 D-cache topology not "
> > > +                       "supported by this machine");
> > > +            return;
> > > +        }
> > > +
> > > +        if (smp_cache_string_to_topology(ms, config->l1d_cache,
> > > +            &ms->smp_cache.l1d, errp)) {
> > 
> > Indent is to wrong opening bracket.
> > Same for other cases.
> 
> Could you please educate me about the correct style here?
> I'm unsure if it should be indented by 4 spaces.

It needs to look like this:

        if (smp_cache_string_to_topology(ms, config->l1d_cache,
                                         &ms->smp_cache.l1d, errp)) {

so func parameters are aligned to the function calls' opening bracket,
not the 'if' statement's opening bracket.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
