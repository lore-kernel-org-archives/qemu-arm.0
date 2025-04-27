Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5300113njd;
        Sun, 27 Apr 2025 00:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXbQUOuDXQswRkYm0ze8KRW0Rq693FEeezRhGQJC1G8Ef3npS4aKWsML6CkuHPM5eAzNNFpItbRIuVqHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGYvnI/TxY/15oOzgcRcGd4mdN+Uyu59umbcOhMGQ8reFzU2FmfTx4oQhrg/CGTBRVG82ZF
X-Received: by 2002:a05:6a21:3284:b0:1fe:8ffe:9809 with SMTP id adf61e73a8af0-2045b75d85dmr11023588637.20.1745738104211;
        Sun, 27 Apr 2025 00:15:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745738104; cv=pass;
        d=google.com; s=arc-20240605;
        b=T/DpIVCMDx9R0gkp0vkjg0qhL/FjSfXMcq8VvKmkohX0PW4CAlTDp2R3SQPe6/zYgE
         ilsrj4LIEAxGaQljZHbLbhhP+TYSIrB5esfNa67yAjC3fUKZGo6WJ81YaHEzvYIQEYaG
         T1fGulDmZXoy4jKC2BNm8K7b7AadoOg+RJS2KjaQxB/18CSMI/TdJlTSWdDIpuJL2vIu
         wUVyn190Mg8jdBcR3D/RCzVLWy8eaF6QGo6K7odvAzruPRvLUxALn8YcWEYmZ3soaUvh
         h1sOWufhR0pqlgeCeJ1LY61UIZJfDEb1962O17AE2OZe0eYXeTMt1vExGri+1Xf0UXci
         Fv1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=7BNa5DZhvg6wqR75lTLv2rFOYhlpY67xxARk9ubu9mQ=;
        fh=k3VoSLb1Hhp4mW5RQZKMbsew+7AUhBeIVwpR2jZKlPs=;
        b=R0y+vf2l1nIU+LYF/55i/gQ7wQrKoBf3oVzkkRPs9MX5ZhHEs1bkOyjUE1mkx04JoS
         jmT2/MzsDniseotiwxs7vxSRhJ3+w3ukk9EFn9UchwjRiU0av6MAxf3ZJlrifRJ9UMsg
         Z3U1dpUlJBYJA+bBK2UTsD3pKlf40PxcIGcHTaTMnts1EheG/fxklxtjsM6slXJRY17C
         dlcmAW046lBkZ2aStnXFHdP4Fba0Yt8EgWpBTKBEBVF7wkgoKnt2ezOB8d8PVUGkqCxv
         zClW5fxPtifIxxgVP2mqOezLECDzXDiSWyX2fnrRkIHKzUmwNq5Eb6bCemw35TVRDQBU
         cGag==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cgLtDra0;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73e2591d4a0si9774243b3a.34.2025.04.27.00.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cgLtDra0;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-44490-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341C65A34D5
	for <alex.bennee@linaro.org>; Sun, 27 Apr 2025 07:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E655D23F434;
	Sun, 27 Apr 2025 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgLtDra0"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAB173
	for <kvm@vger.kernel.org>; Sun, 27 Apr 2025 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745738099; cv=none; b=cbgRRe11usHLgI9/2l4fCiyE9e18LSxrU449jnrrnH5NNQmZWfqhkfw0OHRwerRmYRfLW2H43gynd979Xy2/Wc977g8qjSNBdp3fosYzea/lXUu9kcpCphP86sWxvxsv0KdQjMAh4ci1Tl0UqSRb0XnsaBzU6jXzQWlpVppFGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745738099; c=relaxed/simple;
	bh=aLKBRMi982qUAHpHdxX4Pn/tcuPuoLKos+FcQs/PFQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMHNxhIe2QllMN85boZ8Wivy+B3XPgHoFpMKL8eH9iELXnMA3e/RlIlwv9AEDBs+zVGUsJW9c7/aUtI4KRQ8cQFev9XK1AHzDRq4KvKI7E+ZAxcgtUQ5+fONVemdsJQYvonaHrTzjQtHZ5BCeLC41hCnk5j2npqVr1IGfWoK0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgLtDra0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745738098; x=1777274098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLKBRMi982qUAHpHdxX4Pn/tcuPuoLKos+FcQs/PFQ8=;
  b=cgLtDra0o1PIaQv1/vDw+/Fob9Xvz1P6+ZaCi0Jy4lqBaz0kzdywa3pW
   PrFRMvDEMfgxS0Dfb5myywMxJeicRinPLpSfZLxjUUvSyJxMuv/Vn9YrU
   +mWmi3FxHYsBMyjFRIhYhhHvXVDil5dAd6qDruQgEUdAxbRcZ9+g4siPW
   8L2CiNrt/b6zCKbtfCnpnF3nvli0oD8HpLf2DvUe0uFbJ/AW6GgUM5pRH
   RhvSsb+fVVeGGI17yBdkY1+5I7cT6BQ3T7krGU3fV8bCXlDK2Xu/y9Bbo
   5fhIMSSyqqIRq4u0W7rlRvFXvrzBhhW3JV7mpisUHQAR2Tf2ayD4nP9zA
   w==;
X-CSE-ConnectionGUID: cgFge1kCQbirABg2vv/I1w==
X-CSE-MsgGUID: VWTsc2+lRxWhMYHbEFz2fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47255933"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47255933"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 00:14:57 -0700
X-CSE-ConnectionGUID: yiYQh6xbR5mx5fsKnfCVjg==
X-CSE-MsgGUID: +JKhKX8pQWayxyAvjVHFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="156477006"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa002.fm.intel.com with ESMTP; 27 Apr 2025 00:14:53 -0700
Date: Sun, 27 Apr 2025 15:35:49 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
Subject: Re: [PATCH 5/5] i386/kvm: Support fixed counter in KVM PMU filter
Message-ID: <aA3eVdwujSmqKAKu@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-6-zhao1.liu@intel.com>
 <6a93fa6b-d38d-48ac-9cde-488765238247@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a93fa6b-d38d-48ac-9cde-488765238247@linaro.org>
X-TUID: jOEu8yjfP/bP

> >   static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)
> >   {
> >       object_class_property_add_enum(oc, "action", "KvmPmuFilterAction",
> > @@ -116,6 +139,14 @@ static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)
> >                                 NULL, NULL);
> >       object_class_property_set_description(oc, "events",
> >                                             "KVM PMU event list");
> > +
> > +    object_class_property_add(oc, "x86-fixed-counter", "uint32_t",
> > +                              kvm_pmu_filter_get_fixed_counter,
> > +                              kvm_pmu_filter_set_fixed_counter,
> > +                              NULL, NULL);
> > +    object_class_property_set_description(oc, "x86-fixed-counter",
> > +                                          "Enablement bitmap of "
> > +                                          "x86 PMU fixed counter");
> 
> Adding that x86-specific field to all architectures is a bit dubious.

Similarly, do you think that it would be a good idea to wrap x86 related
codes in "#if defined(TARGET_I386)"? Like I said in this reply:

https://lore.kernel.org/qemu-devel/aA3TeaYG9mNMdEiW@intel.com/

