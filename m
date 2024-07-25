Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3671782njc;
        Thu, 25 Jul 2024 04:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmANoSZdcXi2u4olpvFIUqgP2S5efjHwvwRvRdL/HUetUB8Lk/nHsDoG8ME90wVsP6uY4zoHh44/ZQSOecRPWKvY29H+Ue
X-Google-Smtp-Source: AGHT+IF61JihIvPzKZVq8O07WMAotAaXINGpWq3ieS6IMWkSqctbtzwgfFoJMS6E5HpTLf93cM9O
X-Received: by 2002:a05:620a:1729:b0:79f:108e:249d with SMTP id af79cd13be357-7a1d4584c7cmr346460085a.60.1721907653029;
        Thu, 25 Jul 2024 04:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721907653; cv=none;
        d=google.com; s=arc-20160816;
        b=g9M0jdhZ2XtDEvElFSa7deK1bzkZ2MHuG+ezgNklnFy0RtBDcyd6QF2HjrSFN/XXYj
         5RA8LybM7JoQsg+BteVNY+BYjycon6QsFg+0vg0ZLPOU4ZAVtCSbZw5B2vYEssfPehq6
         /5EZOgRwQvkDt9sb2Ryp0d3DGJ5lV2+BuDPrkfdqbMrwJN0ybSZI4O7Ksm7GuCqQPeOz
         IGsMzemzriZj8iNFooLforJw0HD1j5KgXUZlIet2kwvV2O3AbkRZDo59AbwN6UhgftKT
         hAu+4P61IN0BZzNDWbYJoZaPzz6fbgc2z+hXTfEjNRcRlLXk+PflEQOIrGpexnooh0d4
         4vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=y5iuNP8gsxFicyye8bLqy2hDthoJDzJagqQ5tVVgOis=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=0/Bz/T+4d+ENhBCJbqTpzYJicI00U+6sFUkO5hMATITds138Lb7SF3jkZvckzPLcMV
         VyoumGae6Im3KPhofhzQQlUn9ONtSPiwRoKMNZ7evd1rlSz7ISXOa0ZGBmB69lrwFI9m
         Cv1S6hc7k9ZddDDgzCYtAkEpKFZk1Dyn43LZZZ5Y7hPZnTMfPYKJ6eBwEts71ZrXZ1t3
         LYNRujklYMXMIRGWS0xmf3/xGC64KetVKjxZMvHCg1LfYwJmErJRC2+YnHkmyuzqBpfc
         tVmPFhrFX+XJa9104Nt2zF3Iv9iyVaBFcUTK3LXZFZU5tm1evtQm6ocewa3fxWnDISZ9
         mwwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=i3p3zVvT;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7446650si134585485a.365.2024.07.25.04.40.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 04:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=i3p3zVvT;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721907653; x=1753443653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MUHoDV+o+BAqrEJb2hWev0rKEyLw15W/zcIr7FnVd4=;
  b=i3p3zVvTqfQOaXCV/x7datia+FVkW+EtqugaPgVJbhWIzOtPE+gu0nYg
   Hs/a5WdMfECIUTNkLhqhqmozxWX6OcIi9SBu/FbfrEjmmAvt6NxqBSJZo
   yLNPTGaHfEgTQEqaqUUlWG0YWe0zzDfyZl31OdATK0EywdyJTFR55z4aG
   dX4Fh+LWwOon8WFc2EA44jEhMOYNYgPRoHKQhgKF3EWII6/xEH3jJnx6i
   xSbbBU+1ovGN9Tl5KXa5GXnt9ZybE918RLVQIMQDCUQiap2Rpv6DBQRAP
   qpfLJWaQzCfst+h424qpQn3m/OZM1SADYHbpkWEiStSDT6AA0xK8TX4F6
   A==;
X-CSE-ConnectionGUID: XtU25DlHSMWDMykfFmrRGg==
X-CSE-MsgGUID: 2sr8kJKoRzGfm5agt7kHaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19512931"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19512931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 04:40:51 -0700
X-CSE-ConnectionGUID: IvbzGUkuRsqjmtEJqj5HHA==
X-CSE-MsgGUID: OUEK940ySL6fN9WTOTAudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53664396"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa008.jf.intel.com with ESMTP; 25 Jul 2024 04:40:46 -0700
Date: Thu, 25 Jul 2024 19:56:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <ZqI9bqQDVUU7liW1@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
 <87wmld361y.fsf@pond.sub.org>
 <Zp5tBHBoeXZy44ys@intel.com>
 <87h6cfowei.fsf@pond.sub.org>
 <ZqEV8uErCn+QkOw8@intel.com>
 <871q3hua56.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q3hua56.fsf@pond.sub.org>
X-TUID: VjqKwbqg4TOC

Hi Markus,

On Thu, Jul 25, 2024 at 10:51:49AM +0200, Markus Armbruster wrote:

[snip]

> >> What's the use case?  The commit messages don't tell.
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
> > topology. Just like cpu topology.
> 
> 
> So the use case is exposing a configurable cache topology to the guest
> in order to increase performance.  Performance can increase when the
> configured virtual topology is closer to the physical topology than a
> default topology would be.  This can be the case with CPU host or max.
> 
> Correct?

Yes! That's x86 use case. Jonathan also helped me explain his ARM use case.

> >> Why does that use case make no sense without SMP?
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
> > Hope my poor english explains the problem well. :-)
> 
> I think I understand why you want to configure caches.  My question was
> about the connection to SMP.
> 
> Say we run a guest with a single core, no SMP.  Could configuring caches
> still be useful then?

No, for this case the CPU topology (of x86) would be 1 core per module, 1
module per die, 1 die per socket.

Then this core actually owns the l1/l2/l3.

> >> Can the same @name occur multiple times?  Documentation doesn't tell.
> >> If yes, what does that mean?
> >
> > Yes, this means the later one will override the previous one with the same
> > name.
> 
> Needs documenting.
> 
> If you make it an error, you don't have to document it :)

OK!

> >> Say we later add value "l1" for unified level 1 cache.  Would "l1" then
> >> conflict with "l1d" and "l1u"?
> >
> > Yes, we should check in smp/machine code and ban l1 and l1i/l1d at the
> > same time. This check I suppose is easy to add.
> >
> >> May @topo be "invalid"?  Documentation doesn't tell.  If yes, what does
> >> that mean?
> >
> > Yes, just follow the intel's spec, invalid means the current topology
> > information is invalid, which is used to encode x86 CPUIDs. So when I
> > move this level to qapi, I just keeped this. Otherwise, I need to
> > re-implement the i386 specific invalid level.
> 
> I'm afraid I don't understand what is supposed to happen when I tell
> QEMU to make a cache's topology invalid.

Currently this series doesn't allow users to set invalid, if they do, QEMU
reports an error.

So this invalid is just for QEMU internal use. Do you think it's okay?

[snip]

> > Ah, I also considerred this. I didn't use "type" because people usually
> > uses cache type to indicate INSTRUCTION/DATA/UNIFIED and cache level to
> > indicate LEVEL 1/LEVEL 2/LEVEL 3. The enumeration here is a combination of
> > type+level. So I think it's better to avoid the type term.
> 
> SmpCacheLevelAndType is quite a mouthful.

Better name! Thanks!

Regards,
Zhao
