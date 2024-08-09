Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp852515njc;
        Fri, 9 Aug 2024 05:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmDzPRKGltIIi+szpv29ulyO7G/x7+xmM1oZiT5Vlw9iuv8oxrIE+nr/YOfyuhQOfoul2meuhe91rUCwUwBfu8iqecCjZA
X-Google-Smtp-Source: AGHT+IG7NGz4FdHxdxomyLhfE9kuMjujf1SgoogMeqGYtniP5Hceo66DfkR4vtrZ3zey8Pbd18Ii
X-Received: by 2002:a05:6214:4b01:b0:6b0:774b:38c2 with SMTP id 6a1803df08f44-6bd78d84bd2mr18143016d6.6.1723206299454;
        Fri, 09 Aug 2024 05:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723206299; cv=none;
        d=google.com; s=arc-20160816;
        b=BPgfA6GMECSVNgx6gjzul2dJM7rxYFmlQl5uGoiQtA7IYcCyDP7hiumzIaGEtm5/FU
         nfPs1jvXKv3eYOndNCmqKO3vaChAO8JgvpaAEFxM3Pf1xh4tud7jPdeSUOXO1CHNtoBD
         6FCE6dC/kys9yxHf1HdgWxfMLBnxbgJS9h6HqYI6UYJKY0uW+BXNSGkVWK/s46klCFXZ
         mfVqsvsr80DsrOZM5aFaYpmGcyDevhz8L54u9vsDR8SobSkStuBXfsRjGr7CO5ZisVwN
         JJx/ga4l6xhlnpS+hanleX1xlgRsNq/B/KzcCuKLeTI2lOZfavTFuQczme8iTwS7I3oq
         YovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=UOwA4QbVkDmvqf7etn9t7Ds166wZBQN7pf+VdSr6FkM=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=x5tKnxA73CPQ9s0IZItUXjoYe59k4Rayde6lRL/Z4fZ5igjjU9y1Fuw9sxZNwcvXvp
         GCG8IAo98QHuB18KR+NTqAkaWyixyZ8jOH5bduoXTzCnFRTTHaGzM1ZRdOG4kXnnfX3s
         S3ibIKj3IOZnsI4i/qMD9bd38aw3Q7rZfP36ZGQf9fuiOnXt5CBEyRCWUnyTrBOYIEeC
         2ZINb1Hm7e42TfvA+NhY/nPgDs0OdQDDPpIUAIMzsDrKEffL083g1Kemig9i0Hb2b3GA
         sHLkgHqq0Qj8TTkpV0s34X/hHFjUq85iOK+HBaDG2DEikhYAWbpR6mYBY3zjeRnb2lOU
         CYEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RpkMOJiq;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8f46bbsi70702486d6.412.2024.08.09.05.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RpkMOJiq;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723206299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOwA4QbVkDmvqf7etn9t7Ds166wZBQN7pf+VdSr6FkM=;
	b=RpkMOJiqvMmyWYgbk9jyTh2NbVlJAmJ0GAXNLv+I4sPJ9qNJ1Golgndxj8+4sktE9xLllV
	9K1/RNFXpI7gLTeG+xA3P50HZQOfFWO0nqk+DkqfrzYul4xZ6MU1gNJ/MrMwsiljuxxR1Q
	Dqo7YZZmeLiUaD15mxf6M216ib1AKkk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33--7dfJdlSNg-Vn4YmIjJ4nw-1; Fri,
 09 Aug 2024 08:24:56 -0400
X-MC-Unique: -7dfJdlSNg-Vn4YmIjJ4nw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AEC91956058;
	Fri,  9 Aug 2024 12:24:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAA9019560AE;
	Fri,  9 Aug 2024 12:24:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AFCA821E668B; Fri,  9 Aug 2024 14:24:48 +0200 (CEST)
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
Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache object
In-Reply-To: <ZqyRik4UHHz3xaKl@intel.com> (Zhao Liu's message of "Fri, 2 Aug
	2024 15:58:02 +0800")
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-9-zhao1.liu@intel.com>
	<87r0bl35ug.fsf@pond.sub.org> <Zp5vxtXWDeHAdPok@intel.com>
	<87bk2nnev2.fsf@pond.sub.org> <ZqEN1kZaQcuY4UPG@intel.com>
	<87le1psuv3.fsf@pond.sub.org> <ZqtXP9MViOlyhEsu@intel.com>
	<87mslweb38.fsf@pond.sub.org> <ZqyRik4UHHz3xaKl@intel.com>
Date: Fri, 09 Aug 2024 14:24:48 +0200
Message-ID: <8734ndj33j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: cPzaY3VeKLAC

I apologize for the delay.

Zhao Liu <zhao1.liu@intel.com> writes:

> On Thu, Aug 01, 2024 at 01:28:27PM +0200, Markus Armbruster wrote:

[...]

>> Can you provide a brief summary of the design alternatives that have
>> been proposed so far?  Because I've lost track.
>
> No problem!
>
> Currently, we have the following options:
>
> * 1st: The first one is just to configure cache topology with several
>   options in -smp:
>
>   -smp l1i-cache-topo=core,l1d-cache-topo-core
>
>   This one lacks scalability to support the cache size that ARM will
>   need in the future.

-smp sets machine property "smp" of QAPI type SMPConfiguration.

So this one adds members l1i-cache-topo, l1d-cache-topo, ... to
SMPConfiguration.

> * 2nd: The cache list object in -smp.
>
>   The idea was to use JSON to configure the cache list. However, the
>   underlying implementation of -smp at the moment is keyval parsing,
>   which is not compatible with JSON.

Keyval is a variation of the QEMU's traditional KEY=VALUE,... syntax
that can serve as an alternative to JSON, with certain restrictions.
Ideally, we provide both JSON and keyval syntax on the command line.

Example: -blockdev supports both JSON and keyval.
    JSON:   -blockdev '{"driver": "null-co", "node-name": "node0"}'
    keyval: -blockdev null-co,node-name=node0

Unfortunately, we have many old interfaces that still lack JSON support.

>   If we can not insist on JSON format, then cache lists can also be
>   implemented in the following way:
>   
>   -smp caches.0.name=l1i,caches.0.topo=core,\
>        caches.1.name=l1d,caches.1.topo=core

This one adds a single member caches to SMPConfiguration.  It is an
array of objects.

> * 3rd: The cache list object linked in -machine.
>
>   Considering that -object is JSON-compatible so that defining lists via
>   JSON is more friendly, I implemented the caches list via -object and
>   linked it to MachineState:
>
>   -object '{"qom-type":"smp-cache","id":"obj","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"}]}'
>   -machine smp-caches=obj

This one wraps the same array of objects in a new user-creatable object,
then sets machine property "smp-caches" to that object.

We can set machine properties directly with -machine.  But -machine
doesn't support JSON, yet.

Wrapping in an object moves the configuration to -object, which does
support JSON.

Half way between 2nd and 3rd:

  * Cache list object in machine

    -machine caches.0.name=l1i,caches.0.topo=core,\
             caches.1.name=l1d,caches.1.topo=core

> * 4th: The per cache object without any list:
>
>   -object smp-cache,id=cache0,name=l1i,topo=core \
>   -object smp-cache,id=cache1,name=l1d,topo=core
>
>   This proposal is clearer, but there are a few opens:
>   - I plan to push qom-topo forward, which would abstract CPU related
>     topology levels and cache to "device" instead of object. Is there a
>     conflict here?

Can't say, since I don't understand where you want to go.

Looks like your trying to design an interface for what you want to do
now, and are wondering whether it could evolve to accomodate what you
want to do later.

It's often better to design the interface for everything you already
know you want to do, then take out the parts you want to do later.

>   - Multiple cache objects can't be linked to the machine on the command
>     line, so I maintain a static cache list in smp_cache.c and expose
>     the cache information to the machine through some interface. is this
>     way acceptable?
>
>
> In summary, the 4th proposal was the most up in the air, as it looked to
> be conflict with the hybrid topology I wanted to do (and while hybrid
> topology may not be accepted by the community either, I thought it would
> be best for the two work to be in the same direction).
>
> The difference between 2nd and 3rd is about the JSON requirement, if JSON
> is mandatory for now then it's 3rd, if it's not mandatory (or accept to
> make -machine/-smp support JSON in the future), 2nd looks cleaner, which
> puts the caches list in -smp.

I'd rather not let syntactic limitations of our CLI dictate the
structure of our configuration data.  Design the structure *first*.
Only then start to think about CLI.  Our CLI is an unholy mess, and
thinking about it too early risks getting lost in the weeds.  I fear
this is what happened to you.

If I forcibly ignore all the considerations related to concrete syntax
in your message, a structure seems to emerge: there's a set of caches
identified by name (l1i, l1d, ...), and for each cache, we have a number
of configurable properties (topology level, ...).  Makes sense?

What else will you need to configure in the future?

By the way, extending -machine to support JSON looks feasible to me at a
glance.
