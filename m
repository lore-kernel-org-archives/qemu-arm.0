Received: by 2002:a05:7022:140a:b0:7e:eb73:5b3b with SMTP id pd10csp443594dlb;
        Tue, 4 Jun 2024 08:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiUfMqaEgfTwzWYIuNPt9Rg8px0Sd6lxU0OzxZLw/8TCpLQzKjpdEKa9KJs/uUYSgkalLEyq7KFJDsxvLt3DwlzqvruZs7
X-Google-Smtp-Source: AGHT+IHtmJmtEMN6y+pHUQcypiBhmqoWHIH5CGm+3ymdmcFtIc6UXVyZRTtisLiqNoL9tFOhW4/C
X-Received: by 2002:a05:620a:21c4:b0:794:f22e:c171 with SMTP id af79cd13be357-794f5c73de5mr1386982785a.31.1717514152425;
        Tue, 04 Jun 2024 08:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717514152; cv=none;
        d=google.com; s=arc-20160816;
        b=BXvNQp6qDJDryy12XoCMDm1Wkpp7e0/U4DherDTNFrhOKT9/+rpjqw0Zg98BNoz7GM
         hJk6QA8Vi4t32WaYQkM/Ne0x3Qapl6jND99LiPY83fi0t0PCBLARG54YvMIaML1uPkhl
         m3L9z/+1ih6odvEk6lKcZiOluJdhKDYhPiwUt7QZ38M7hy42MO2MxburZFfq0h9G0Tb6
         qlEOvytonkulAzdwts8c+JtQT1s69ZJlp2zlYSrprH3AQMb9nylMt56IJyhqJfwQ9ggo
         ydUxykzZhYWblvYCul2Zp2jqiGwVve72/YCSGotfHO5J40FLxtC8lH6Qp0IdsVkZnm8A
         nWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oTKlBPYtaxivfRx0u4GFkPXAQx6rQ1dzroGiGynB4ek=;
        fh=LqC9Sx1JVFWep3wU1+tpDLYPkzvbVkXR8Gi7aFVs7SY=;
        b=qT5QZgkqzQT6DIXm2D6gC2PpbUpOX5TvjnnLrqQ9zik5T12LncEfnk7qDyzvppqOld
         GMmHQgvML9Q5RvFhm42c2nJpNKHUJeu6f/7DY2enB5n0igKqXrwCXquHIYNAQDz9YRBC
         MlMhAx8wzWz1YQznvqfdrMuVwNkgoOVn4AdIdYyis1vjjfwYyFWlC86CQpCbm+rX/scC
         xOQYL6pnWlEWkNazYfGC5JZqUPYPNDL87jGSm4D32+9BLzWh6kO/TXUBriVUOcZ8Z8HE
         FORMNthAAOSsyRvTa0u2akHNgRb986aBvZGqaz/tXCm1ngxca7AeUoRIoOwcGuxe2ArF
         Td9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n4odPniQ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.10])
        by mx.google.com with ESMTPS id af79cd13be357-795183eb40dsi174566185a.329.2024.06.04.08.15.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 08:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.10 as permitted sender) client-ip=192.198.163.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n4odPniQ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717514152; x=1749050152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qXPxwp4Krxnak53hDhODVhsVAD6HPOWoEFdGvkvs9S0=;
  b=n4odPniQvjg0zlaqRqywJeDdK9GWHeOz3+tppZ8T4HWVKlL2buuX86j6
   TRBhdUBqxBlCuljtjlBdeLRfUQVDxbu0+rIkXs5ZpPP2GRhkudZRwW8pF
   UWdypVpBWPbjmSDQNB+eyKv7OvA0YN4Mrb5ITqD9BZCcw90O3D3P2HE/B
   6Z1mJA1R66QAxFeQhBkXlxxo7fJvv2hkX9IO1HckSZ7hzWuLZvjw4Ge/b
   Bg6QDMxVkNsLvfT7D5eIsfvinhZea/ZOFqFIbL9OQUJeAzfcDM1ZoTOB2
   NKlykGWFVGEfRU24ZmY5B3rWH3lgv6kPSfDGemhfKdoHHXF66iyNEl3F2
   A==;
X-CSE-ConnectionGUID: eNYTtccUSSCSUJT1XUxEzA==
X-CSE-MsgGUID: hjApLhaaTUSIsowd4QhX9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25468254"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="25468254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:15:50 -0700
X-CSE-ConnectionGUID: zIy4auewSF6TmnhNZjiSLg==
X-CSE-MsgGUID: rDc0TgSUTsGt7J+8QTX8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="42379247"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 04 Jun 2024 08:15:45 -0700
Date: Tue, 4 Jun 2024 23:31:11 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 0/7] Introduce SMP Cache Topology
Message-ID: <Zl8zP4pXjRmVs3VP@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <Zl7ea2o2aaxXMj9X@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zl7ea2o2aaxXMj9X@redhat.com>
X-TUID: 0o57ize2AeUr

Hi Daniel,

On Tue, Jun 04, 2024 at 10:29:15AM +0100, Daniel P. Berrang¨¦ wrote:
> Date: Tue, 4 Jun 2024 10:29:15 +0100
> From: "Daniel P. Berrang¨¦" <berrange@redhat.com>
> Subject: Re: [RFC v2 0/7] Introduce SMP Cache Topology
> 
> On Thu, May 30, 2024 at 06:15:32PM +0800, Zhao Liu wrote:
> > Hi,
> > 
> > Now that the i386 cache model has been able to define the topology
> > clearly, it's time to move on to discussing/advancing this feature about
> > configuring the cache topology with -smp as the following example:
> > 
> > -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
> >      l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> > 
> > With the new cache topology options ("l1d-cache", "l1i-cache",
> > "l2-cache" and "l3-cache"), we could adjust the cache topology via -smp.
> 
> Switching to QAPI for a second, your proposal is effectively
> 
>     { 'enum': 'SMPCacheTopo',
>       'data': [ 'default','socket','die','cluster','module','core','thread'] }
> 
>    { 'struct': 'SMPConfiguration',
>      'data': {
>        '*cpus': 'int',
>        '*drawers': 'int',
>        '*books': 'int',
>        '*sockets': 'int',
>        '*dies': 'int',
>        '*clusters': 'int',
>        '*modules': 'int',
>        '*cores': 'int',
>        '*threads': 'int',
>        '*maxcpus': 'int',
>        '*l1d-cache': 'SMPCacheTopo',
>        '*l1i-cache': 'SMPCacheTopo',
>        '*l2-cache': 'SMPCacheTopo',
>        '*l3-cache': 'SMPCacheTopo',
>      } }
> 
> I think that would be more natural to express as an array of structs
> thus:
> 
>     { 'enum': 'SMPCacheTopo',
>       'data': [ 'default','socket','die','cluster','module','core','thread'] }
> 
>     { 'enum': 'SMPCacheType',
>       'data': [ 'l1d', 'l1i', 'l2', 'l3' ] }
>      
>     { 'struct': 'SMPCache',
>       'data': {
>         'type': 'SMPCacheType',
>         'topo': 'SMPCacheTopo',
>       } }
> 
>    { 'struct': 'SMPConfiguration',
>      'data': {
>        '*cpus': 'int',
>        '*drawers': 'int',
>        '*books': 'int',
>        '*sockets': 'int',
>        '*dies': 'int',
>        '*clusters': 'int',
>        '*modules': 'int',
>        '*cores': 'int',
>        '*threads': 'int',
>        '*maxcpus': 'int',
>        'caches': [ 'SMPCache' ]
>      } }
> 
> Giving an example in (hypothetical) JSON cli syntax of:
> 
>   -smp  "{'cpus':32,'sockets':2,'dies':2,'modules':2,
>           'cores':2,'threads':2,'maxcpus':32,'caches': [
> 	    {'type':'l1d','topo':'core' },
> 	    {'type':'l1i','topo':'core' },
> 	    {'type':'l2','topo':'core' },
> 	    {'type':'l3','topo':'die' },
> 	  ]}"
 
Thanks! Looks clean to me and I think it is ok.

Just one further question, for this case where it must be expressed in a
raw JSON string, is there any requirement in QEMU that a simple
command-line friendly variant must be provided that corresponds to it?

> > Open about How to Handle the Default Options
> > ============================================
> > 
> > (For the detailed description of this series, pls skip this "long"
> > section and review the subsequent content.)
> > 
> > 
> > Background of OPEN
> > ------------------
> > 
> > Daniel and I discussed initial thoughts on cache topology, and there was
> > an idea that the default *cache_topo is on the CORE level [3]:
> > 
> > > simply preferring "cores" for everything is a reasonable
> > > default long term plan for everything, unless the specific
> > > architecture target has no concept of "cores".
> 
> FYI, when I wrote that I wasn't specifically thinking about cache
> mappings. I just meant that when exposing SMP topology to guests,
> 'cores' is a good default, compared to 'sockets', or 'threads',etc.
> 
> Defaults for cache <-> topology  mappings should be whatever makes
> most sense to the architecture target/cpu.

Thank you for the additional clarification!

> > Problem with this OPEN
> > ----------------------
> > 
> > Some arches have their own arch-specific cache topology, such as l1 per
> > core/l2 per core/l3 per die for i386. And as Jeehang proposed for
> > RISC-V, the cache topologies are like: l1/l2 per core and l3 per
> > cluster. 
> > 
> > Taking L3 as an example, logically there is a difference between the two
> > starting points of user-specified core level and with the default core
> > level.
> > 
> > For example,
> > 
> > "(user-specified) l3-cache-topo=core" should override i386's default l3
> > per core, but i386's default l3 per core should also override
> > "(default) l3-cache-topo=core" because this default value is like a
> > placeholder that specifies nothing.
> > 
> > However, from a command line parsing perspective, it's impossible to
> > tell what the ¡°l3-cache-topo=core¡± setting is for...
> 
> Yes, we need to explicitly distinguish built-in defaults from
> user specified data, otherwise we risk too many mistakes.
> 
> > Options to solve OPEN
> > ---------------------
> > 
> > So, I think we have the following options:
> > 
> > 
> > 1. Can we avoid such default parameters?
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > This would reduce the pain in QEMU, but I'm not sure if it's possible to
> > make libvirt happy?
> 
> I think having an explicit "defualt" value is inevitable, not simply
> because of libvirt. Long experiance with QEMU shows that we need to
> be able to reliably distinguish direct user input from  built-in
> defaults in cases like this.

Thanks, that gives me an answer to that question!

> > 
> > It is also possible to expose Cache topology information as the CPU
> > properties in ¡°query-cpu-model-expansion type=full¡±, but that adds
> > arch-specific work.
> > 
> > If omitted, I think it's just like omitting ¡°cores¡±/¡°sockets¡±,
> > leaving it up to the machine to decide based on the specific CPU model
> > (and now the cache topology is indeed determined by the CPU model as
> > well).
> > 
> > 
> > 2. If default is required, can we use a specific abstract word?
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > That is, is it possible to use a specific word like ¡°auto¡±/¡°invalid¡±
> > /¡°default¡± and avoid a specific topology level?
> 
> "invalid" feels a bit wierd, but 'auto' or 'default' are fine,
> and possibly "unspecified"

I prefer the "default" like you listed in your QAPI example. :)

> > Like setting ¡°l3-cache-topo=invalid¡± (since I've only added the invalid
> > hierarchy so far ;-) ).
> > 
> > I found the cache topology of arches varies so much that I'm sorry to
> > say it's hard to have a uniform default cache topology.
> > 
> > 
> > I apologize for the very lengthy note and appreciate you reviewing it
> > here as well as your time!

Thanks,
Zhao
