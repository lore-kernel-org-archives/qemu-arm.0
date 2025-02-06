Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1562204njb;
        Thu, 6 Feb 2025 06:13:07 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXbig8un6sCytvT4ZZqwRM2dQK3q1KDQDDAbNED6leVuOqYAmtMxI7Ld8i2yBYYjeEK4lPiOTOvsSjCmA==@linaro.org
X-Google-Smtp-Source: AGHT+IEL57/hsAjQppZDiLzxADCO06JIvR9R3CCOZf/2quLZU4iGM1M0920/T8qgqp7u/i3kn6h7
X-Received: by 2002:a05:6871:8210:b0:29e:3484:ae1d with SMTP id 586e51a60fabf-2b805136281mr4862253fac.26.1738851186837;
        Thu, 06 Feb 2025 06:13:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738851186; cv=pass;
        d=google.com; s=arc-20240605;
        b=eLBSVRMCu6njc9yvaTUTNhKaFQvJ/mFraU2eMGrRGqC9v8EnBIccG0SJVUtZmuDB/u
         clGBPzrsVpzutPd7LLONSONj5BRyQt2K0P8Z/Y3eJeln749X379a2GV1w/34/Dzs54Nj
         AZBGeP5fKVXKSX6jita4vr5r9OMahV16iq7Zq8LXEVKz2mJMlYADUs7O1VThJVLQsOQn
         qUUkVbZv9pK32kfISXyKrnBRhvnCF3AM4NYTH/62Jyr8a+dtt3J1PSJMD4REqD7Abkfh
         gOtzwzsKBsf8TTjN0V7V1s0UIgKLV5ucBZ1fm6AxlESo5lA1KXwURw0OK3HlOVgq8asQ
         xOYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=YbXev9MD1M4dokUXn+5wlKeQhDVlD7FVYURbLCJYkFk=;
        fh=5YDLLJgO7dHw3UrwgK3PqKzoqhNi0WRWyfs5b9Zwmpw=;
        b=CJgjAoJyBSwVtjDqVM2pSY07tPdPxLNDcUFLza/cw3N7aj1udllOUdSU7u7qOjEOQC
         B9Xynz8+Ju9AzIEnXoWr3xsuE1kIBW57ZGUlHP/9LNqW8E+r6fWkWyIicYQCgeTh/wPb
         XfeVUWcKaXlrk/0AZoQ1/Qp8wRVJ9kMqJJkfbpimO/rccFz7qrOjMS/Csa8mIlc3VH/J
         DgFGdUy2KO0T22xTMT5DxIZsOglM9SpFI1YqEI11Cs3sdjignCG8E7KsHf3uaTGLiJ12
         3ofCDd7tgMlakvyCCQbt/8be6SkSnjxBBJr+rYVRG0VcZ7ZLL1dttnL6+HqLb4m2pltI
         s1xw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GNqtcr11;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 586e51a60fabf-2b82627218dsi1116057fac.218.2025.02.06.06.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GNqtcr11;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-37485-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0923A23B0
	for <alex.bennee@linaro.org>; Thu,  6 Feb 2025 14:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF791C7000;
	Thu,  6 Feb 2025 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNqtcr11"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884941EA7FD
	for <kvm@vger.kernel.org>; Thu,  6 Feb 2025 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851183; cv=none; b=QrUGeTBXsWxXL5Rol+bM6rtcy3xmsRTOaqmdQOxPBukxUJJjNok/zICfUk9zNgTuDl2UNHVRupL7clm4d2OBgj2U7MtFHGInmMP2GkR6lb1jsZipGOuCUuniDOOeDNBWwD/q63wBNpYT1Ft9Qy7jXybaaRq2vQ2UhAV4De9jKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851183; c=relaxed/simple;
	bh=ZMq35FrhEk5mDeRr7RJiv16EUshbu3LSB2bSHyn92zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5DpncQc8m7Rjd7KqFGsEyHO+BJeb3+NFRi89XWljeDNHwzXxG7g75OHfAfRWtdYAE7NxlfoZGCkIU8qV05RAc1AbG8MpSD7V0jOo5+oit/8Hu9Xd6r/z6TyteJVD7IGNOoZn9CdmW9Br7TZvG/KMONXQTvk7zhwEBi+XteI89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNqtcr11; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738851182; x=1770387182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZMq35FrhEk5mDeRr7RJiv16EUshbu3LSB2bSHyn92zU=;
  b=GNqtcr11CfJg7By4oLSYdkeYcHVT4SSUzd3BPD2VvjT3oQJk2iREPpIO
   OyvLmpf20lS/Wq01SkVYYhDuxdvAImYL/TL90Q7JUJiHK+3AN3IfaHKGJ
   D0gcnZysrDL7Uz4jf2o0w5aio/tYYfkVXj/dMSCZPNB+E35wEEyqi1Qws
   dSg6s1LZ0Kq7myn/wX2k4UBwsdhzBI5XrDmSkfwZD0sE9tuf7KVeLPUcp
   xiOZUSvmHfVvDWAkar/3NczBBby9E3BzSCWbU6mTiVc/eGFa0XAVdAoN6
   1hD2y2fDm0hS3KrUFIWXNaoGX81KL2X4tR/MpeEC65yGi3WTQX3S6VZqo
   Q==;
X-CSE-ConnectionGUID: LZ9nkyIPQO+dtgB47RUDUA==
X-CSE-MsgGUID: yizg1aC/T/a7S3EZJiXS6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38686408"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="38686408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 06:13:01 -0800
X-CSE-ConnectionGUID: dGmgrJBGSfyPuxx/edfiyg==
X-CSE-MsgGUID: 4Ek+cwODRZqo7tx2bSyBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116180151"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2025 06:12:57 -0800
Date: Thu, 6 Feb 2025 22:32:25 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
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
Subject: Re: [RFC v2 1/5] qapi/qom: Introduce kvm-pmu-filter object
Message-ID: <Z6TH+ZyLg/6pgKId@intel.com>
References: <20250122090517.294083-1-zhao1.liu@intel.com>
 <20250122090517.294083-2-zhao1.liu@intel.com>
 <871pwc3dyw.fsf@pond.sub.org>
 <Z6SMxlWhHgronott@intel.com>
 <87h657p8z0.fsf@pond.sub.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h657p8z0.fsf@pond.sub.org>
X-TUID: WztMiqPA8mEo

> Let's ignore how to place it for now, and focus on where we would *like*
> to place it.
> 
> Is it related to anything other than ObjectType / ObjectOptions in the
> QMP reference manual?

Yes!

> I guess qapi/kvm.json is for KVM-specific stuff in general, not just the
> KVM PMU filter.  Should we have a section for accelerator-specific
> stuff, with subsections for the various accelerators?
> 
> [...]

If we consider the accelerator from a top-down perspective, I understand
that we need to add accelerator.json, kvm.json, and kvm-pmu-filter.json.

The first two files are just to include subsections without any additional
content. Is this overkill? Could we just add a single kvm-pmu-filter.json
(I also considered this name, thinking that kvm might need to add more
things in the future)?

Of course, I lack experience with the file organization here. If you think
the three-level sections (accelerator.json, kvm.json, and kvm-pmu-filter.json)
is necessary, I am happy to try this way. :-)


