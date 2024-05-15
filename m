Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp787196ejl;
        Wed, 15 May 2024 09:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW8O+/eptQ8lrQc9oA+/fPpaMzxcKEzCc6YIseUOlsQmHQyJia+FIFX01uOQirQZuhCOfsdPdvCJ72yuwyQAvKPwKnIAUIL
X-Google-Smtp-Source: AGHT+IH4e8/HN/7v00xHXJDZg30LzsKMtoXpFhbqpN02zi4ee6t6x0VBRXlc6FLOtO80ym15/gDq
X-Received: by 2002:a17:902:eccf:b0:1eb:f263:d2fc with SMTP id d9443c01a7336-1ef43f51b80mr203971095ad.54.1715791648829;
        Wed, 15 May 2024 09:47:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715791648; cv=pass;
        d=google.com; s=arc-20160816;
        b=B91en80m4sjHsQ+snIXnvm6zjFR7QRz4CNKL6DNkKehjIHptfGCZfKUvfRNq8r/+lN
         hnIIrxNDvPe7TX8yd+UBOrmajWjF1DIGzCUfLQLv/QufGrf2astQdyXqbYJyVLJwaK5R
         wSHTf41UvF1EGj4SwhY/RX8Z6XXsB16rJMrUqjzk/gYDzYd1SDToeEc5psZ8Myf8l++W
         UvemFbic7gntQtbWSkleFOslkI1EsuFCbhQElkjEkG4kPvmwvC+/lLI6sDMGCwN82kBL
         ritgGm3fjfyMiQH5oE0dKtBqs9Y/pD8hjgIHxsCjJGiwpwYyHedB4Z1qYN4dLM0KmVEE
         Q9Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=gWEijKm6k78Xl/7UjceGkv/fNBkvskjud+VapspJi6Y=;
        fh=gbj3IL3gSre3K14K9WtWel/zIRuF/biEz8l+yzAE7V8=;
        b=nsq0A/5KLgDrwlxy5zHP8xbA6ZVJ+WLdFMBXR1subTpu3LPyytynQ5kh0KceyXikSM
         9370IvGvHYXcSNm7d5e/XKR6Pa9YTbliHt0GERBvmxMOuO4Sf/JMX765Gx+REsPuVa6u
         rtGBAGK1KpesScBFR4pINeXkqHNhowDPOAPceyHhOReOMuT0VEirnlbk26xQUogFvAhv
         xMEJ5DtJgoviDan/TXCiE/SbL7ikBFXy6z/QdYwSKi84JcqxjXsTymzzO6DJt4koqB2w
         zU4kKX9qeq06lATwRdpO7E6AWIrQo87myaCSBhAs6Tv5NoVpTAkLY8URP1QpTuZVZB/8
         SZRA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIX+aAK3;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-1ef0c26f787si143671325ad.614.2024.05.15.09.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 09:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIX+aAK3;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-17449-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426B6284F89
	for <alex.bennee@linaro.org>; Wed, 15 May 2024 16:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5CB13AF2;
	Wed, 15 May 2024 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIX+aAK3"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931593BBD8
	for <kvm@vger.kernel.org>; Wed, 15 May 2024 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715791647; cv=none; b=JJwbghZRhFUG6Koz+QCm77gIyVBJwpe8gMHryzwpMo/l3xfh0kS+0uHkgR6ROIP/U18BkuwiOfnmr+WSg5gu+gKmDxxWNq+UQIrS1LEa3q2wKdgUQhjUSviSBzlRE8GnpOwNSVrqUvyGOXYQjEiVLR0hZXiBCGCNvFXSU94Fe6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715791647; c=relaxed/simple;
	bh=+8+iWahEDIHjf7iwKJWp6WsAnJcZLWC3spDUIB9hPIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEws4/dLVbmM+W9PE+j5ro6FFjLu0dyzoZWF8ZRkAzWSk/c2uEWSVHtWEcw9DOUDDpZ2jPhwLmBFMkLSBsRtJD84hoWXW21cByXeEv8vbAO5aRZFK1lNreU+jpRuMno9BJRhF/ESbrc7jithKq6iNzC4D4EkNlf+oReHzO0G5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIX+aAK3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715791644;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=gWEijKm6k78Xl/7UjceGkv/fNBkvskjud+VapspJi6Y=;
	b=hIX+aAK3EO9Uri/iW/9pYpvXa/Mdh5pNWOd/ZhiEOwl+krN/EpsI0Lr4J0tZw9ZvyM7x0n
	PIqo4/z091DIwnvYk19eZifRc0camTHvXTsB1rjIb9I5m3EkDUWmSPw9B8M0ucQAdLMCxG
	BlxIHZNbTuu1n2yLsxnEWSZSlpDjA4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-4ga3eMuROa67FEAPzX01rg-1; Wed, 15 May 2024 12:47:21 -0400
X-MC-Unique: 4ga3eMuROa67FEAPzX01rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 771FD185A783;
	Wed, 15 May 2024 16:47:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCFAF200B4D6;
	Wed, 15 May 2024 16:47:18 +0000 (UTC)
Date: Wed, 15 May 2024 17:47:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
	Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZkTnFBNsGosNYuOj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240409024940.180107-1-shahuang@redhat.com>
 <Zh1j9b92UGPzr1-a@redhat.com>
 <Zjyb43JqMZA+bO4r@intel.com>
 <ZjyZ1ZV7BGME_bY9@redhat.com>
 <ZkG4nlwRnvz9oUXX@intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZkG4nlwRnvz9oUXX@intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-TUID: EcmoAz5Iy/yV

On Mon, May 13, 2024 at 02:52:14PM +0800, Zhao Liu wrote:
> Hi Daniel,
> 
> > Please describe it in terms of a QAPI definition, as that's what we're
> > striving for with all QEMU public interfaces. Once the QAPI design is
> > agreed, then the -object mapping is trivial, as -object's JSON format
> > supports arbitrary QAPI structures.
> 
> Thank you for your guidance!
> 
> I rethought and and modified my previous proposal:
> 
> Let me show the command examples firstly:
>   * Add a single event:
>     (x86) -object kvm-pmu-event,id=e0,action=allow,format=x86-default,\
>                   select=0x3c,umask=0x00
>     (arm or general) -object kvm-pmu-event,id=e1,action=deny,\
>                              format=raw,code=0x01
>  
>   * Add a counter bitmap:
>     (x86) -object kvm-pmu-counter,id=cnt,action=allow,type=x86-fixed,\
>                   bitmap=0xffff0000
>  
>   * Add an event list (must use Json syntax format):
>    (x86) -object '{"qom-type":"kvm-pmu-event-list","id"="filter0","action"="allow","format"="x86-default","events=[{"select"=0x3c,"umask"=0x00},{"select"=0x2e,"umask"=0x4f}]'
>    (arm) -object '{"qom-type":"kvm-pmu-event-list","id"="filter1","action"="allow","format"="raw","events"=[{"code"=0x01},{"code"=0x02}]'
> 
> 
> The specific JSON definitions are as follows (IIUC, this is "in terms of
> a QAPI definition", right? ;-)): 
> * Define PMU event and counter bitmap with JSON format:
>   - basic filter action:
> 
>   { 'enum': 'KVMPMUFilterAction',
>     'prefix': 'KVM_PMU_FILTER_ACTION',
>     'data': ['deny', 'allow' ] }
> 
>   - PMU counter:
> 
>   { 'enum': 'KVMPMUCounterType',
>     'prefix': 'KVM_PMU_COUNTER_TYPE',
>     'data': [ 'x86-fixed' ] }
> 
>   { 'struct': 'KVMPMUX86FixedCounter',
>     'data': { 'bitmap': 'uint32' } }
> 
>   - PMU events (total 3 formats):
> 
>   # 3 encoding formats: "raw" is compatible with shaoqin's ARM format as
>   # well as the x86 raw format, and could support other architectures in
>   # the future.
>   { 'enum': 'KVMPMUEventEncodeFmt',
>     'prefix': 'KVM_PMU_EVENT_ENCODE_FMT',
>     'data': ['raw', 'x86-default', 'x86-masked-entry' ] }
> 
>   # A general format.
>   { 'struct': 'KVMPMURawEvent',
>     'data': { 'code': 'uint64' } }
> 
>   # x86-specific
>   { 'struct': 'KVMPMUX86DefalutEvent',
>     'data': { 'select': 'uint16',
>               'umask': 'uint16' } }
> 
>   # another x86 specific
>   { 'struct': 'KVMPMUX86MaskedEntry',
>     'data': { 'select': 'uint16',
>               'match': 'uint8',
>               'mask': 'uint8',
>               'exclude': 'bool' } }
> 
>   # And their list wrappers:
>   { 'struct': 'KVMPMURawEventList',
>     'data': { 'events': ['KVMPMURawEvent'] } }
> 
>   { 'struct': 'KVMPMUX86DefalutEventList',
>     'data': { 'events': ['KVMPMUX86DefalutEvent'] } }
> 
>   { 'struct': 'KVMPMUX86MaskedEntryList',
>     'data': { 'events': ['KVMPMUX86MaskedEntryList'] } }
> 
> 
> Based on the above basic structs, we could provide 3 new more qom-types:
>   - 'kvm-pmu-counter': 'KVMPMUFilterCounter'
> 
>   # This is a single object option to configure PMU counter
>   # bitmap filter.
>   { 'union': 'KVMPMUFilterCounter',
>     'base': { 'action': 'KVMPMUFilterAction',
>               'type': 'KVMPMUCounterType' },
>     'discriminator': 'type',
>     'data': { 'x86-fixed': 'KVMPMUX86FixedCounter' } }
> 
> 
>   - 'kvm-pmu-counter': 'KVMPMUFilterCounter'
> 
>   # This option is used to configure a single PMU event for
>   # PMU filter.
>   { 'union': 'KVMPMUFilterEvent',
>     'base': { 'action': 'KVMPMUFilterAction',
>               'format': 'KVMPMUEventEncodeFmt' },
>     'discriminator': 'format',
>     'data': { 'raw': 'KVMPMURawEvent',
>               'x86-default': 'KVMPMUX86DefalutEvent',
>               'x86-masked-entry': 'KVMPMUX86MaskedEntry' } }
> 
> 
>   - 'kvm-pmu-event-list': 'KVMPMUFilterEventList'
> 
>   # Used to configure multiple events.
>   { 'union': 'KVMPMUFilterEventList',
>     'base': { 'action': 'KVMPMUFilterAction',
>               'format': 'KVMPMUEventEncodeFmt' },
>     'discriminator': 'format',
>     'data': { 'raw': 'KVMPMURawEventList',
>               'x86-default': 'KVMPMUX86DefalutEventList',
>               'x86-masked-entry': 'KVMPMUX86MaskedEntryList' } }
> 
> 
> Compared to Shaoqin's original format, kvm-pmu-event-list is not able to
> enumerate events continuously (similar to 0x00-0x30 before), and now
> user must enumerate events one by one individually.
> 
> What do you think about the above 3 new commands?

I don't know enough about KVM PMU to give feedback on the specific
choices, but in terms of how to do QAPI design, this looks like a
good start.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

