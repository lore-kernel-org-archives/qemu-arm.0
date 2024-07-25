Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3649963njc;
        Thu, 25 Jul 2024 03:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLE9T1PgG2iPO6Uzpsty6e7Yzk23Vy1p/WgEbvLWVobjG6p9ma8xMMoPPXSYFe+IIh4HeBzrl0pOJ6TVK0PIEWQKYOvvtE
X-Google-Smtp-Source: AGHT+IE9gp4Juqe8hhWQHSQOgnQqIfWYM2JBkVnUHHU0Qcj5UsUiw8cD6Ex5PuebhtP7j7Bs2wEs
X-Received: by 2002:a17:903:187:b0:1f6:e4ab:a1f4 with SMTP id d9443c01a7336-1fed90b8d0cmr21846495ad.12.1721905147914;
        Thu, 25 Jul 2024 03:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721905147; cv=none;
        d=google.com; s=arc-20160816;
        b=YT2w+2Ymfn21ygh7DlHaFtwo4T4yDjX/FEBN6jQnATcEBNIh+4DVhAIVUu34Ozatpt
         wnlpDrGXR1PMEYD3p9I7k4uoONtHi4iic5KiocY8m06jwdFA0Nrus5eGVRiryFfXGcxy
         +QJvbNDGGVkrzhWv2Up4StvE5XgziUr4WtovMx91PdOFmBrkYkQ6QLMHd4i3Jruep/bq
         5UlsV6t/eZdh9qDR8gDa0TT4P9QyFOjFcVKGZ1SkymG4qV6JBpYfsbsH0vw/r6qi4QUW
         S9YgNnOHx7HNFqQwzYKZU7aYZgEDl4/lk+D5p/WyLxnF71te17f7ArTiion5Zqdh1WD0
         v4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=vYVOFzUslyzt28Iu1TynYyRvOfAbCTSg/TdPYNK7oAc=;
        fh=zcUuJCkBkjph9Ce4tYnAihNNA4MsJnk4nvkIvl4tQic=;
        b=iUFzhaEq/GXmeVkQqwK/35osLjWeqnyhYHJ4QlwUOoLirxrpj1lekylGrTLmz31YyG
         0y0v9dEbvl/6z2QdYW+MFPtIF7dbG5RGpgltSjmIRebPvvgogkze78dzuLlYG77qBrZ7
         8LCzH6YoXxU8Uj3aMAXDOMkX6Q6T40TX0o4rodVFIz1axImtmCD0bB7IzumzAjyklpOO
         f+4sfaW3qGy8D2r64nw4H4fXEbgc+Q7C3B0fiVlkUkqYq99e1BQdXt+9kegq6EUFX5Vr
         zw6RGkvNrHkkQL77V5gKfl9WTG4gMCl1kA/Gi4QVFbp2aKq9+yAUOOr8yWbBB9kY4cKk
         Tg3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7cff15dsi13451765ad.159.2024.07.25.03.59.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2024 03:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WV79d5jBwz6K9Gq;
	Thu, 25 Jul 2024 18:56:37 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B2103140594;
	Thu, 25 Jul 2024 18:59:03 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 25 Jul
 2024 11:59:03 +0100
Date: Thu, 25 Jul 2024 11:59:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Zhao Liu <zhao1.liu@intel.com>, <berrange@redhat.com>, Eduardo Habkost
	<eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Marcelo
 Tosatti" <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Sia Jee
 Heng" <jeeheng.sia@starfivetech.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <20240725115902.000037e4@Huawei.com>
In-Reply-To: <20240725115059.000016c5@Huawei.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-3-zhao1.liu@intel.com>
	<87wmld361y.fsf@pond.sub.org>
	<Zp5tBHBoeXZy44ys@intel.com>
	<87h6cfowei.fsf@pond.sub.org>
	<ZqEV8uErCn+QkOw8@intel.com>
	<871q3hua56.fsf@pond.sub.org>
	<20240725115059.000016c5@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: WLp5EdgTNPgZ

On Thu, 25 Jul 2024 11:50:59 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

Resending as this bounced due (I think) to an address typo.

> Hi Markus, Zhao Liu
> 
> From the ARM server side this is something I want to see as well.
> So I can comment on why we care.
> 
> > >> This series adds a way to configure caches.
> > >> 
> > >> Structure of the configuration data: a list
> > >> 
> > >>     [{"name": N, "topo": T}, ...]
> > >> 
> > >> where N can be "l1d", "l1i", "l2", or "l3",
> > >>   and T can be "invalid", "thread", "core", "module", "cluster",
> > >>                "die", "socket", "book", "drawer", or "default".
> > >> 
> > >> What's the use case?  The commit messages don't tell.    
> > >
> > > i386 has the default cache topology model: l1 per core/l2 per core/l3
> > > per die.
> > >
> > > Cache topology affects scheduler performance, e.g., kernel's cluster
> > > scheduling.
> > >
> > > Of course I can hardcode some cache topology model in the specific cpu
> > > model that corresponds to the actual hardware, but for -cpu host/max,
> > > the default i386 cache topology model has no flexibility, and the
> > > host-cpu-cache option doesn't have enough fine-grained control over the
> > > cache topology.
> > >
> > > So I want to provide a way to allow user create more fleasible cache
> > > topology. Just like cpu topology.    
> > 
> > 
> > So the use case is exposing a configurable cache topology to the guest
> > in order to increase performance.  Performance can increase when the
> > configured virtual topology is closer to the physical topology than a
> > default topology would be.  This can be the case with CPU host or max.
> > 
> > Correct?  
> 
> That is definitely why we want it on arm64 where this info fills in
> the topology we can't get from the CPU registers.
> (we should have patches on top of this to send out shortly).
> 
> As a side note we also need this for MPAM emulation for TCG
> (any maybe eventually paravirtualized MPAM) as this is needed
> to build the right PPTT to describe the caches which we then
> query to figure out association of MPAM controls with particularly
> caches.
> 
> Size configuration is something we'll need down the line (presenting
> only part of an L3 may make sense if it's shared by multiple VMs
> or partitioned with MPAM) but that's a future question.
> 
> 
> >   
> > >> Why does that use case make no sense without SMP?    
> > >
> > > As the example I mentioned, for Intel hyrbid architecture, P cores has
> > > l2 per core and E cores has l2 per module. Then either setting the l2
> > > topology level as core nor module, can emulate the real case.
> > >
> > > Even considering the more extreme case of Intel 14th MTL CPU, where
> > > some E cores have L3 and some don't even have L3. As well as the last
> > > time you and Daniel mentioned that in the future we could consider
> > > covering more cache properties such as cache size. But the l3 size can
> > > be different in the same system, like AMD's x3D technology. So
> > > generally configuring properties for @name in a list can't take into
> > > account the differences of heterogeneous caches with the same @name.
> > >
> > > Hope my poor english explains the problem well. :-)    
> > 
> > I think I understand why you want to configure caches.  My question was
> > about the connection to SMP.
> > 
> > Say we run a guest with a single core, no SMP.  Could configuring caches
> > still be useful then?  
> 
> Probably not useful to configure topology (sizes are a separate question)
> - any sensible default should be fine.
> 
> Jonathan
> 
> 
