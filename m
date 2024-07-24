Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3095158njc;
        Wed, 24 Jul 2024 06:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaUGtsJg2MXNwbTxD1xm+GN5g+u/FayDJfAYhIAde/IJdGMl3fK5FyVAbmJxJgCOZX8Hx9YWP97uxBfzPnHvejfuFuSllH
X-Google-Smtp-Source: AGHT+IFe0qxaZPhv1BMUg4XTdbWEsQYqNDSTpGYkaJdt5aMj/UnZ1zkf0DNDHKNJy2w+ew1HHijW
X-Received: by 2002:a05:622a:342:b0:444:f860:3b4b with SMTP id d75a77b69052e-44fd4108f69mr31853021cf.14.1721828845070;
        Wed, 24 Jul 2024 06:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721828845; cv=none;
        d=google.com; s=arc-20160816;
        b=FPNamwReBwIHh9YburKpDHL9bDNZTWVf+beErZztYhn8HyKiCEC/fZGlo5eUbN7I8p
         9snHvkgnOMPxTXW8y7CWjUw0y8sDlEwS0SPEJNWmlIRh1WF0rbdSol0XdCge3XxOTQOT
         pONpz0nP/Lv9azhn3iveTARYfqHzD+BdsgXgB+F7fV2CPsTzO6NCClbM+7hDr1oVtf65
         vexiqzrXrij6Rii3D2qL3hGYlYHiegmdgGEph0JmwE23vzP5Q4B+OfLRZo137j5Z6ffF
         GjUn3Ky0Hf6iMLO5yEaNRHC/bhk86pkPnGB9hWK5GyfB/sAdpP1lGRGmCX2aAsdBr3o/
         D4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gRt/cBJNuUyORhdiyG6XdtIxc9iN4fwkqTK3iCd8oAg=;
        fh=qs3xIMcIUebKEyvBPgLrBou7yCI89CRFWwKvey7kObI=;
        b=oEnoh6pLB+dBRrZ4EmUO5HJBLs0eZ35d1aS+NAyJkR4U/SsnsCU6uVkqitlyweZkiw
         ManOiysCW8Zs+IZBLjze81hihw8U6v9mmK7gzhXUCWmtiv7IOWHB1exIkSKRkd2l5v3y
         ycfQ4u+GrfZhezcNjqfQHVJ9CEeit2x/tqDYz9hWv5/PybmkWcw2tTR7Y0OWqsnIEcjU
         OR1NqqND4e6aBoNaYaE9tC0sLLZi7uxHDBcA6hiKIwB4hEpaA2yZiqez+sD9yw5Odc2n
         asI03B5lvTeOyg0mGuqspgRc9CEYBKphvLDBaEbwbNVxu4tkDzwPPOWrIkag/m+22u5v
         6MVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=juEAyLc7;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ce07370si125612431cf.622.2024.07.24.06.47.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 06:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=juEAyLc7;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721828845; x=1753364845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sxKpAl9rrbQ4Xx0Hyr/S+ZMPf6W0x+OqB+PPtAp9ArA=;
  b=juEAyLc7eYACGdTRhCG5A4W8U6bd/AONOhRv+NKno+OKix1624i4X9Xi
   yn4dWGtRMvf/TkxYn5zJUUvPuRTHhSfGXrR23Ch71vMyiz3p9cSvQPNh/
   EGAlq/C38W83CK51c72qAuaPx4tSBFfo0xjo8gnga2gYZWsuBvcoGMg3H
   LTxS4JvEh6v9IZPhkLLiIv0fXEsAukEftQOvCQtgAkUlzV4PN1HgH22mG
   If+VVZlR0B6gxaE76wsAvMILKoFMV5HUhmgnRVWP0TJGWeMTSvWxCD85f
   llZFBeW91AN5w896zTOHQNOhfvzfxTw7SZvTo4Bu1mm9eNqhI8cbr/p+R
   w==;
X-CSE-ConnectionGUID: 93lKY5CaRfm9J8qFfygkYQ==
X-CSE-MsgGUID: O8Pxsw06T5+0Mcm7LEo7Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19635303"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19635303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:47:23 -0700
X-CSE-ConnectionGUID: KcuozMCYQ2qc1TLMylTygw==
X-CSE-MsgGUID: SiPTLhqxQVi/C+OLS4Jj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52816196"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2024 06:47:18 -0700
Date: Wed, 24 Jul 2024 22:03:02 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
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
Message-ID: <ZqEJlmR3U6g8zq0z@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
 <87wmld361y.fsf@pond.sub.org>
 <Zp5tBHBoeXZy44ys@intel.com>
 <87h6cfowei.fsf@pond.sub.org>
 <ZqD31Oj5P0uDMs-I@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqD31Oj5P0uDMs-I@redhat.com>
X-TUID: QGh/NnZkOE2n

On Wed, Jul 24, 2024 at 01:47:16PM +0100, Daniel P. Berrangé wrote:
> Date: Wed, 24 Jul 2024 13:47:16 +0100
> From: "Daniel P. Berrangé" <berrange@redhat.com>
> Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
> 
> On Wed, Jul 24, 2024 at 01:35:17PM +0200, Markus Armbruster wrote:
> > Zhao Liu <zhao1.liu@intel.com> writes:
> > 
> > > Hi Markus,
> > >> SmpCachesProperties and SmpCacheProperties would put the singular
> > >> vs. plural where it belongs.  Sounds a bit awkward to me, though.
> > >> Naming is hard.
> > >
> > > For SmpCachesProperties, it's easy to overlook the first "s".
> > >
> > >> Other ideas, anybody?
> > >
> > > Maybe SmpCacheOptions or SmpCachesPropertyWrapper?
> > 
> > I wonder why we have a single QOM object to configure all caches, and
> > not one QOM object per cache.
> 
> Previous versions of this series were augmenting the existing
> -smp command line.

Ah, yes, since -smp, as a sugar option of -machine, doesn't support
JSON. In -smp, we need to use keyval's style to configure as:

-smp caches.0.name=l1i,caches.0.topo=core

I think JSON is the more elegant way to go, so I chose -object.

> Now the design has switched to use -object,
> I agree that it'd be simplest to just have one -object flag
> added per cache level we want to defnie.
> 

OK.

Thanks,
Zhao
