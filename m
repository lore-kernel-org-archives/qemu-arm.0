Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3647093njc;
        Thu, 25 Jul 2024 03:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCBltbeZQ3roxSpt8klqDLQhjJZ0zkqhT57+oNMR1cWfCF1yWWBF9LNDvJtBCInMziUVIR41LheuGExzA29UxHl3FZiALc
X-Google-Smtp-Source: AGHT+IHdgY08WkhH0CSG0pCm/gsnKi51n0gsQ0vzhjZzvE0Mzu1KWWaAiUc+rCCdvN7PVywtePVq
X-Received: by 2002:a05:600c:314c:b0:426:6364:c2c4 with SMTP id 5b1f17b1804b1-42806b807dfmr12379535e9.14.1721904663326;
        Thu, 25 Jul 2024 03:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721904663; cv=none;
        d=google.com; s=arc-20160816;
        b=j/7FQqpoczbtQYebPWHkO3y+Xl3lakeniVNc5z/zULohOpYUvyKDBCl4epUcAwdqlV
         3krUa3tcNdWy4vGXNuyYqKhIASw8jjRKFFRpEQYE0Ww6eSqcM1m50W7FVsFaZa1HZtK5
         CVsGtVhAcft9xltFtIimN+h+fVs7KTGY2wTAQe/IvdDR5KaYyfc0XT+glC5lasX9N6C6
         QcyeHEnDOxJCXW/t0glNa6GFw1DOjK00a7z3U2SU/0Mvl3mvtb/er2SEiiUxKthKcCbu
         nkR/Hqm49Qf6+hf9A8IhV0iNdqV894CSQYR/S9kfOYMIprHvjpvd8a6MaAiiJnpa/Zcy
         PKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=W4h2Egc9GVRZm3fAy6LKhC0PZTuXLRpOBI+hbqgJzVE=;
        fh=0PkekBxlnaault1zumeIA0tbeL3wwTb78D2ynX8nhKA=;
        b=pv8ui3//V23QdiUDrWhXXyw36rDcCMqT9xNNfADRf12lDjZ/iXjinTJ9H4AYMKSzVh
         gt/VGzxQnzP5KCX/dagYLaXik+8I9KOE3Eybu/tcUIgv/9cQ5Ti0ZlcqyJMzByccXhCD
         nl/ae9/VuKj3zGHUbgcCb1U2DUKUunObQxJeFlw5AuCgIMDi6I27JZbcA6GrXp8rd5gJ
         OkvT5zH2NsqevzDjAWqcPapN7Lc/HOuIoN959Nmgu7vuz+pwJQmUlrUwciEVKVR7LRmi
         wYkO6uJUyHtVBSfjXzanar79hsvu3Uhf/q0uhgbLNKiukzm6/HNSif2/USmNuaYZIVO7
         cWyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36b36865dd4si537629f8f.608.2024.07.25.03.51.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2024 03:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WV70d2yxZz6K6Ys;
	Thu, 25 Jul 2024 18:48:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 4138A140B67;
	Thu, 25 Jul 2024 18:51:02 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 25 Jul
 2024 11:51:01 +0100
Date: Thu, 25 Jul 2024 11:50:59 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Zhao Liu <zhao1.liu@intel.com>,
	"Daniel P.\" =?ISO-8859-1?Q?Berrang=E9?=  <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=  =?ISO-8859-1?Q?aud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex  =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell  <peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,  qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi  <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <20240725115059.000016c5@Huawei.com>
In-Reply-To: <871q3hua56.fsf@pond.sub.org>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-3-zhao1.liu@intel.com>
	<87wmld361y.fsf@pond.sub.org>
	<Zp5tBHBoeXZy44ys@intel.com>
	<87h6cfowei.fsf@pond.sub.org>
	<ZqEV8uErCn+QkOw8@intel.com>
	<871q3hua56.fsf@pond.sub.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: s8/bVV/XJqw3


Hi Markus, Zhao Liu

=46rom the ARM server side this is something I want to see as well.
So I can comment on why we care.

> >> This series adds a way to configure caches.
> >>=20
> >> Structure of the configuration data: a list
> >>=20
> >>     [{"name": N, "topo": T}, ...]
> >>=20
> >> where N can be "l1d", "l1i", "l2", or "l3",
> >>   and T can be "invalid", "thread", "core", "module", "cluster",
> >>                "die", "socket", "book", "drawer", or "default".
> >>=20
> >> What's the use case?  The commit messages don't tell. =20
> >
> > i386 has the default cache topology model: l1 per core/l2 per core/l3
> > per die.
> >
> > Cache topology affects scheduler performance, e.g., kernel's cluster
> > scheduling.
> >
> > Of course I can hardcode some cache topology model in the specific cpu
> > model that corresponds to the actual hardware, but for -cpu host/max,
> > the default i386 cache topology model has no flexibility, and the
> > host-cpu-cache option doesn't have enough fine-grained control over the
> > cache topology.
> >
> > So I want to provide a way to allow user create more fleasible cache
> > topology. Just like cpu topology. =20
>=20
>=20
> So the use case is exposing a configurable cache topology to the guest
> in order to increase performance.  Performance can increase when the
> configured virtual topology is closer to the physical topology than a
> default topology would be.  This can be the case with CPU host or max.
>=20
> Correct?

That is definitely why we want it on arm64 where this info fills in
the topology we can't get from the CPU registers.
(we should have patches on top of this to send out shortly).

As a side note we also need this for MPAM emulation for TCG
(any maybe eventually paravirtualized MPAM) as this is needed
to build the right PPTT to describe the caches which we then
query to figure out association of MPAM controls with particularly
caches.

Size configuration is something we'll need down the line (presenting
only part of an L3 may make sense if it's shared by multiple VMs
or partitioned with MPAM) but that's a future question.


>=20
> >> Why does that use case make no sense without SMP? =20
> >
> > As the example I mentioned, for Intel hyrbid architecture, P cores has
> > l2 per core and E cores has l2 per module. Then either setting the l2
> > topology level as core nor module, can emulate the real case.
> >
> > Even considering the more extreme case of Intel 14th MTL CPU, where
> > some E cores have L3 and some don't even have L3. As well as the last
> > time you and Daniel mentioned that in the future we could consider
> > covering more cache properties such as cache size. But the l3 size can
> > be different in the same system, like AMD's x3D technology. So
> > generally configuring properties for @name in a list can't take into
> > account the differences of heterogeneous caches with the same @name.
> >
> > Hope my poor english explains the problem well. :-) =20
>=20
> I think I understand why you want to configure caches.  My question was
> about the connection to SMP.
>=20
> Say we run a guest with a single core, no SMP.  Could configuring caches
> still be useful then?

Probably not useful to configure topology (sizes are a separate question)
- any sensible default should be fine.

Jonathan

