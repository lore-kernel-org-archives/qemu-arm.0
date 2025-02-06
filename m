Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1430782njb;
        Thu, 6 Feb 2025 02:03:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWm6O2G/EzE805O4V/Nmm+k1LXTuubnMK13k3dz1L5vhzCia8f6FxNe/k9/lpsnt2jydhkWkR2sniiZRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHhZvQ8aZuIHi8HoyMX/eoMet5qfxO9HZdL/bGAPY6lpTHqIx+nj5JPgjEG09foXxI8gN94
X-Received: by 2002:a05:6808:309a:b0:3e7:b644:e4ec with SMTP id 5614622812f47-3f37c1799c7mr3991366b6e.26.1738836232332;
        Thu, 06 Feb 2025 02:03:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738836232; cv=pass;
        d=google.com; s=arc-20240605;
        b=LhLn+X6qSBc//wxJGBU4kYunRs3SEUcYGbpoGyBnyFFhDt+aQHuX8WsdnCK/51foRG
         8zwICcALh5qTkwxZloHZtqzE6H5wiAzsDn51RVYX1xSRL9ZhTFyOCKlNNuUbIYqnGSGb
         RnqZKduxGO8XeKf2msMtr3Nvaff0hXR3omhPYeMoXXdlSaxUGoQSPjtVsJHG0ggu+euc
         13o8B+JGy5lF89rBGLCyu+zJvICKeb2yzy5CX+lhelB6nShpMkdMYawZdQYV2TxpURU6
         +dcQdnmM/YoItgGW9TH2/lXl4xWNTuU1Tz2+Jk06IasVecN5lBt7nUedrhPfHzaMmgr6
         w+xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=W4eW4rwvw++p/Nr/LmjSrgwS+G+EOuTk9uUcRTir+yc=;
        fh=wCNsF9dOYdlXL2V64ahdPNmewQSTUUd7MlUNaKx6ge4=;
        b=DZMHTSMOyOx4Pspq7jgGCpFkcn9bpZ6nOGJ3nTiPhRtudAshzyNdM6nOhpg1DpA6W0
         MBcVrFCwNZCJrk0mGqqMD3Y8I81eSHUxsYIfciXVTYJ6pkT/sVq4KXTRaWUR8busUgut
         4Enr66+b48gGhMUwSk2fimNxj5xthuvagKmzvMPVDnpgzJZLX+JY9Q7bGUaf5MnUy3SV
         ye7n6q2eI8hKQJMSdb1fNBZZJZLb0KxcZsFLtZqPVo6XZVESHwbM3Jgx8LARt4uYIuB5
         252UwA1x1bQ31klQtTCnkrgdmBcpOcvVwGpizoNqI/6gG87djdNE+8PIoG7T4hPeYaHe
         JWsQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dMNrmckI;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 5614622812f47-3f38a020123si533167b6e.294.2025.02.06.02.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:03:52 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dMNrmckI;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-37471-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6489C3A12E5
	for <alex.bennee@linaro.org>; Thu,  6 Feb 2025 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F2D22652D;
	Thu,  6 Feb 2025 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMNrmckI"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24222331F
	for <kvm@vger.kernel.org>; Thu,  6 Feb 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836228; cv=none; b=GNxXCSTBm/f15yi6CBLJCefCy0Mi7LHrgQSQxcfxeBFKkEdf8FXYCbSzyJJoMektKasN/Ausrue2lGt6GCwp12TR6PYbIJKkAZ8OikGj8Y1P1ZtSzseTA67c2C1tEaT3x9sfa5DakkMK15VEy8sZ6Gpz7rqFdmpy/EcBUEXdLeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836228; c=relaxed/simple;
	bh=7pDNFxNaET2eGasSL540VZ+DJEMvoRrgCBkaR20O+b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNMUjxpjXnKF3pKm2GV2abKAC2l0v4TqHhzapAhNrYOFA7UogWfyzpceqrfcpMeynKLWkacLPlvCpCy/pyvmHKpDixnRemAeqxB8GufyHX9ZA1SEk8qqFe2/KyZg/bpycnNRg+ejzTLqDKuJq02U9k+7UxqxYBFE/8qHaehsLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMNrmckI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738836227; x=1770372227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7pDNFxNaET2eGasSL540VZ+DJEMvoRrgCBkaR20O+b4=;
  b=dMNrmckIF0xJP6LgMVEj4cLyn7nPWpcSaub+AFH1xfa93cyMFA3jk75R
   suTxiCP8pdp/Ead/Wl9NmgZBtT/iQYLObGd4ZhOPanOVXMEnkwo4Epgnw
   eVr6L9mvzSFdAmhjmWDlIeFiHSmi3vV1dtKzL+36l5lLq9zdeopLm+PUm
   JUymkQExUtpJJba3j9LOqco70e6eQECVJkF3pCYuXLhfSwtvb1Di+4wEC
   kEpVHby+dH6LqDjvPnrZYNV25MFdpDnax6JLVLfBojJzSZIfHbfHSBUD+
   c8jksrAgIi3IOomzY2K/7Rg5WHC/I9dmtVxJRyVp3eXEwyoYgLIW3OGnc
   g==;
X-CSE-ConnectionGUID: YC2zhPzNRs+YyP+4AWD2AQ==
X-CSE-MsgGUID: U9T319yWTZOXnuEb2hJseg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39128496"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39128496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:03:47 -0800
X-CSE-ConnectionGUID: GSllaTxxSPq4BmXigMPvrQ==
X-CSE-MsgGUID: ZZoAHGUYR1GRPioCuYhj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111693786"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2025 02:03:42 -0800
Date: Thu, 6 Feb 2025 18:23:11 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
Subject: Re: [RFC v2 3/5] i386/kvm: Support event with select & umask format
 in KVM PMU filter
Message-ID: <Z6SNj4HZ4+k1uXhr@intel.com>
References: <20250122090517.294083-1-zhao1.liu@intel.com>
 <20250122090517.294083-4-zhao1.liu@intel.com>
 <87zfj01z8x.fsf@pond.sub.org>
 <Z6SG2NLxxhz4adlV@intel.com>
 <Z6SEIqhJEWrMWTU1@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SEIqhJEWrMWTU1@redhat.com>
X-TUID: nrpnwseJFov3

> > > > +##
> > > > +# @KVMPMUX86DefalutEventVariant:
> 
> Typo   s/Defalut/Default/ - repeated many times in this patch.

My bad! Will fix!

> > > > +#
> > > > +# The variant of KVMPMUX86DefalutEvent with the string, rather than
> > > > +# the numeric value.
> > > > +#
> > > > +# @select: x86 PMU event select field.  This field is a 12-bit
> > > > +#     unsigned number string.
> > > > +#
> > > > +# @umask: x86 PMU event umask field. This field is a uint8 string.
> > > 
> > > Why are these strings?  How are they parsed into numbers?
> > 
> > In practice, the values associated with PMU events (code for arm, select&
> > umask for x86) are often expressed in hexadecimal. Further, from linux
> > perf related information (tools/perf/pmu-events/arch/*/*/*.json), x86/
> > arm64/riscv/nds32/powerpc all prefer the hexadecimal numbers and only
> > s390 uses decimal value.
> > 
> > Therefore, it is necessary to support hexadecimal in order to honor PMU
> > conventions.
> 
> IMHO having a data format that matches an arbitrary external tool is not
> a goal for QMP. It should be neutral and exclusively use the normal JSON
> encoding, ie base-10 decimal. Yes, this means a user/client may have to
> convert from hex to dec before sending data over QMP. This is true of
> many areas of QMP/QEMU config though and thus normal/expected behaviour.
>

Thanks! This will simplify the code a lot.

