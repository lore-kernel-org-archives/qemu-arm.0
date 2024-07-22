Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1917644njc;
        Mon, 22 Jul 2024 06:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdhNhozWN4NkkQm8b/QsAlK42dG9AA9Na+uKYLBTSRCLDXDDolAHzSCqwwP50mJ5JBDwkOhOdGNfolWJRd98bSHI+6EiFw
X-Google-Smtp-Source: AGHT+IHbOgt1oHfsGOBSQESifoA918jhbkrMzOE1MPb3aw2U11FQIZ4DU3f1ZXb+XIKT3HbEFca9
X-Received: by 2002:a05:6830:65cb:b0:703:6496:b9ab with SMTP id 46e09a7af769-708fdadce2amr11046268a34.7.1721655203843;
        Mon, 22 Jul 2024 06:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721655203; cv=none;
        d=google.com; s=arc-20160816;
        b=eQeu2yApDhfdY7Vy/F8kAGIn/9RmBjOGFSf9z8O+FcKK5rU4RCep5ySceg2WuWuald
         H/+oUMJXnmsOoxKU7MMQ7Zsgm6QAN5FeBv/tKPQ8lMftewproo5Z1BOGwsIpDM7AxThL
         RrB3RbsK4IA7/QG/hrHiOH/amCPnWiyk1Pz+ZHrkxaDxZKefhXfQM5XPLfVgWwxYLd4b
         QeEXquSPnpPoExuaIH+YavgcaxT5CshwDmQnLUiqzXXPxK751N8tsLmzcIzdk19QgbQB
         ywPBQrEWXixFx7MEpRZtU/OOecj9UObOY56GeeJxikkMz4dtjTxXpaAnKRHkbGI9embM
         bQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=t5ATSMX9v/PfSEyb9CI3miOcPTYwn6/p6roca0fS5hg=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=RvuZ8TrZ8r8qF/dd29DRXIOroelKZrWCVeKuoPkZCtenaR9x4CA0FChP8s59KZPxeC
         SVVxtOLCMe+SX6rL7m7/oerKcj5HpQFTzlxnwTb4mZeBmVLujTup0HogOe7i+nn2VJ0m
         pTRojQST71NPSBevhuFJoyW1oRjd78TlbF3qn/p3QeJ/awDSSqvpKBK2vbdmCbP2VYqi
         62CU/nOzTTEft9t7zfh/ckKq8v2GcNYbWtAllW9wjOSdnROiS5hdwE12Z8Abe4MIGi2c
         K4Kj0HcCOGNXp5wKdU6RCpL3AN1J3/8hmErgR7yA/kPjjqnnINkacCia763gVMU811AC
         ZX0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hMwH4Qwa;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f5122493adsi524377e0c.243.2024.07.22.06.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 06:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hMwH4Qwa;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721655203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5ATSMX9v/PfSEyb9CI3miOcPTYwn6/p6roca0fS5hg=;
	b=hMwH4QwanoCyPz2Us3L7PNsZeqGhGhd3IZp5uGOVm827bmKQn5TEvF6EjAd3k4L7nHcopD
	LAGOlcy42ltHD+4I79tgnSI75+KFfvQfEzEfFAUPw9Ts+ZbJU0N9jBH8dak0rypPUk3fD8
	C7RXQTcDMw3+wdWSrd0lZXr5wN+t7WA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-WlUGx3PNMQO8Hopa8Eayvw-1; Mon,
 22 Jul 2024 09:33:20 -0400
X-MC-Unique: WlUGx3PNMQO8Hopa8Eayvw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B11C1955D4E;
	Mon, 22 Jul 2024 13:33:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4080C3000188;
	Mon, 22 Jul 2024 13:33:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EC23E21E669B; Mon, 22 Jul 2024 15:33:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
In-Reply-To: <20240704031603.1744546-3-zhao1.liu@intel.com> (Zhao Liu's
	message of "Thu, 4 Jul 2024 11:15:57 +0800")
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-3-zhao1.liu@intel.com>
Date: Mon, 22 Jul 2024 15:33:13 +0200
Message-ID: <87wmld361y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: X2KP2+C9RgFH

Zhao Liu <zhao1.liu@intel.com> writes:

> Introduce smp-cache object so that user could define cache properties.
>
> In smp-cache object, define cache topology based on CPU topology level
> with two reasons:
>
> 1. In practice, a cache will always be bound to the CPU container
>    (either private in the CPU container or shared among multiple
>    containers), and CPU container is often expressed in terms of CPU
>    topology level.
> 2. The x86's cache-related CPUIDs encode cache topology based on APIC
>    ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
>    relies on also requires CPU containers to help indicate the private
>    shared hierarchy of the cache. Therefore, for SMP systems, it is
>    natural to use the CPU topology hierarchy directly in QEMU to define
>    the cache topology.
>
> Currently, separated L1 cache (L1 data cache and L1 instruction cache)
> with unified higher-level cache (e.g., unified L2 and L3 caches), is the
> most common cache architectures.
>
> Therefore, enumerate the L1 D-cache, L1 I-cache, L2 cache and L3 cache
> with smp-cache object to add the basic cache topology support.
>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

[...]

> diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> index 82413c668bdb..8b8c0e9eeb86 100644
> --- a/qapi/machine-common.json
> +++ b/qapi/machine-common.json
> @@ -64,3 +64,53 @@
>    'prefix': 'CPU_TOPO_LEVEL',
>    'data': [ 'invalid', 'thread', 'core', 'module', 'cluster',
>              'die', 'socket', 'book', 'drawer', 'default' ] }
> +
> +##
> +# @SMPCacheName:

Why the SMP in this name?  Because it's currently only used by SMP
stuff?  Or is there another reason I'm missing?

The more idiomatic QAPI name would be SmpCacheName.  Likewise for the
other type names below.

> +#
> +# An enumeration of cache for SMP systems.  The cache name here is
> +# a combination of cache level and cache type.

The first sentence feels awkward.  Maybe

   # Caches an SMP system may have.

> +#
> +# @l1d: L1 data cache.
> +#
> +# @l1i: L1 instruction cache.
> +#
> +# @l2: L2 (unified) cache.
> +#
> +# @l3: L3 (unified) cache
> +#
> +# Since: 9.1
> +##

This assumes the L1 cache is split, and L2 and L3 are unified.

If we model a system with say a unified L1 cache, we'd simply extend
this enum.  No real difference to extending it for additional levels.
Correct?

> +{ 'enum': 'SMPCacheName',
> +  'prefix': 'SMP_CACHE',

Why not call it SmpCache, and ditch 'prefix'?

> +  'data': [ 'l1d', 'l1i', 'l2', 'l3' ] }

> +
> +##
> +# @SMPCacheProperty:

Sure we want to call this "property" (singular) and not "properties"?
What if we add members to this type?

> +#
> +# Cache information for SMP systems.
> +#
> +# @name: Cache name.
> +#
> +# @topo: Cache topology level.  It accepts the CPU topology
> +#     enumeration as the parameter, i.e., CPUs in the same
> +#     topology container share the same cache.
> +#
> +# Since: 9.1
> +##
> +{ 'struct': 'SMPCacheProperty',
> +  'data': {
> +  'name': 'SMPCacheName',
> +  'topo': 'CpuTopologyLevel' } }

We tend to avoid abbreviations in the QAPI schema.  Please consider
naming this 'topology'.

> +
> +##
> +# @SMPCacheProperties:
> +#
> +# List wrapper of SMPCacheProperty.
> +#
> +# @caches: the SMPCacheProperty list.
> +#
> +# Since 9.1
> +##
> +{ 'struct': 'SMPCacheProperties',
> +  'data': { 'caches': ['SMPCacheProperty'] } }

Ah, now I see why you used the singular above!

However, this type holds the properties of call caches.  It is a list
where each element holds the properties of a single cache.  Calling the
former "cache property" and the latter "cache properties" is confusing.

SmpCachesProperties and SmpCacheProperties would put the singular
vs. plural where it belongs.  Sounds a bit awkward to me, though.
Naming is hard.

Other ideas, anybody?

> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..25394f2cda50 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -64,11 +64,11 @@
>  { 'include': 'compat.json' }
>  { 'include': 'control.json' }
>  { 'include': 'introspect.json' }
> -{ 'include': 'qom.json' }
> -{ 'include': 'qdev.json' }
>  { 'include': 'machine-common.json' }
>  { 'include': 'machine.json' }
>  { 'include': 'machine-target.json' }
> +{ 'include': 'qom.json' }
> +{ 'include': 'qdev.json' }
>  { 'include': 'replay.json' }
>  { 'include': 'yank.json' }
>  { 'include': 'misc.json' }

Worth explaining in the commit message, I think.

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 8bd299265e39..797dd58a61f5 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -8,6 +8,7 @@
>  { 'include': 'block-core.json' }
>  { 'include': 'common.json' }
>  { 'include': 'crypto.json' }
> +{ 'include': 'machine-common.json' }
>  
>  ##
>  # = QEMU Object Model (QOM)
> @@ -1064,6 +1065,7 @@
>        'if': 'CONFIG_SECRET_KEYRING' },
>      'sev-guest',
>      'sev-snp-guest',
> +    'smp-cache',
>      'thread-context',
>      's390-pv-guest',
>      'throttle-group',
> @@ -1135,6 +1137,7 @@
>                                        'if': 'CONFIG_SECRET_KEYRING' },
>        'sev-guest':                  'SevGuestProperties',
>        'sev-snp-guest':              'SevSnpGuestProperties',
> +      'smp-cache':                  'SMPCacheProperties',
>        'thread-context':             'ThreadContextProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
