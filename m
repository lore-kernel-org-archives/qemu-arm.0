Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2530011njc;
        Tue, 15 Apr 2025 02:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUHKgswBuFkPPyB2OqYZepW8H4HwqzN6k3oqdH5+0bYRqEWy/dHgXcKtwk/rc/twgIXIJDQCXxbAHoDuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHV9uKDcLVdho74LE52RWntnFgPSuvDrkcKH3BbSUzd03X81S3Z1ad7QraCD9bKb8suNQZr
X-Received: by 2002:a05:6a20:2d07:b0:1f5:59e5:8ada with SMTP id adf61e73a8af0-20179780a96mr21321391637.4.1744709965363;
        Tue, 15 Apr 2025 02:39:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744709965; cv=pass;
        d=google.com; s=arc-20240605;
        b=LOQqQS8ZFQZt6nGCBgAA7je46fr1X3rgDcsjNEPn9fdJTcQct5ja441Uhko7j0ieIh
         hvy4HjIFZLb47p+cBnHkd0rmDD/mEdl/2hKzpA4wWZWRZBIJJ5yLUi7PivSRjN5SwndR
         DvaN4TP6sxzh2gq4iPF5EhCSUzTm8X3kGl4cXoSbJ5pilb6iRbXAvijF8LrwptZ845Td
         +gHi4zK72YE3nPoTqWRJplbr8iA1BLkQwFnqjEddhfYy69Sg7HVZMEq4Un6dU2ysu0Vz
         n/iM2FVwjoCTGhVzIGsIF1ZUGPCNQloYnd1Jth+WwrZnovPoFcjDKUXGqvAY1sMzH4qF
         SW0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=FHhzfjXBoT4Ze68a4CoQXQs61yrw62QFj0rBfVSu9l8=;
        fh=RYtkOQT6yUy7Go0JSXbTvllVes1s/NFsS2YbUgfC25A=;
        b=bW2Hf2+bKuTYOJVibVK/u7GP5WtZTB77QUx5jCyRAhDyLu7pBO6xTMJuZv8v1PL6uY
         gCjGZ4cqnJJpHPxVGJlHc0I5C3HfAVqEsI0NBaGFap1XWJD+YK7YIQzotrPWFMR60RNm
         M3JbDFhvhGNoi4v/3JjHPC0EdNi/D+nltfZprXtt6ZHTvznMzZ43EGSy4rGfKRJFVnZZ
         f4rN7s5u3VUQBtNfbCHrlCNC1PQnLneOgyyr8OXWWr3/2l504vGCEQUYtdbwBc4+f1uI
         WAOm2lTaPhFAXvY+FOrJMXJH5e5KIo6dRbjnwsCHv3TChaCSRw96qe/AaIZ28LWy8KaW
         LzDA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=lxXKnFwo;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73bd219ce75si12490797b3a.16.2025.04.15.02.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=lxXKnFwo;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43335-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC27F3B2E8F
	for <alex.bennee@linaro.org>; Tue, 15 Apr 2025 09:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6138B288C8B;
	Tue, 15 Apr 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxXKnFwo"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B56289372
	for <kvm@vger.kernel.org>; Tue, 15 Apr 2025 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709922; cv=none; b=s36RXkr/vJ2QmjDa45n/ZyN5z/t/NI2dGwaO+gjxslI3F31FFD04pm3f1A6zFaajcA8Ttiav7iW42nl6vb4vdCeR7NSb64GUE0rVbhpvYFFg+13yScE9JZcJv8ZL9Eq0Iba2NpKcwvGVE674wbi4gPdy1kBLPAHNKeDjoaR/BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709922; c=relaxed/simple;
	bh=DIFM4eqQu01Zbc5fSSrZIkWVfd0JHiP4PmzdSxbGFGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnlHvI71bunUE+TBRdTTG1jiKJyJf8EETLl0cnp896eieS8zFsHxYLcUiGiDBTbT3ZIQb4IqISI78Dy03in28eVL3q5yYbkC5UhCCBfcZ4Tw3hOqqdxtoS7Dic9sUZxFiBLpF0zWTEO2keQ8hXkZDplchQixj0+VkMoKrvB5hT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxXKnFwo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744709920; x=1776245920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DIFM4eqQu01Zbc5fSSrZIkWVfd0JHiP4PmzdSxbGFGs=;
  b=lxXKnFwopSQysx3XJaed9bTHxITMWv2NUGFhDSKm+0YATqIqArxSoNoo
   TNVC3OGLzNyFUjV0uXU/pYbqzwHvsEYIBBTQiMNfux4wF1URHonFpkyKN
   WRc3IaMQywJ7d/qsLSxrtEf/tGdIIBlbCBVZ7x+CfKX+Y6h0zauxVEqUX
   mLWuSX6b5uu0o8Z6guUpNW+wkliodnsR6Bm2j1liuUqN8P273jJjpkOFS
   5JdvCffym8h5t4mRPei/5HznzC0AxNQeOodSRIi464bEWWk8bbbS1w4me
   kjYTAPk3RzAdYODpFTr2JYCS9pDYJA10Vi7SiwsHm2kB3QlvLrZjVsOtZ
   w==;
X-CSE-ConnectionGUID: jLHO18ceQCSrUzTsO3GfSA==
X-CSE-MsgGUID: 9rgsgpirRFGznEKUFmxzEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56847393"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56847393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:38:39 -0700
X-CSE-ConnectionGUID: Kqa946dMR6KG/menuDGeCw==
X-CSE-MsgGUID: Fn+ryVDoRseBGNiN5UVZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161113285"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2025 02:38:35 -0700
Date: Tue, 15 Apr 2025 17:59:27 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
Subject: Re: [PATCH 0/5] accel/kvm: Support KVM PMU filter
Message-ID: <Z/4t/zxQzp4Wxdm9@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <21f3fedd-274e-4e81-87f8-369deefa8c1a@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f3fedd-274e-4e81-87f8-369deefa8c1a@redhat.com>
X-TUID: LAAae31YUoXu

On Tue, Apr 15, 2025 at 03:49:59PM +0800, Shaoqin Huang wrote:
> Date: Tue, 15 Apr 2025 15:49:59 +0800
> From: Shaoqin Huang <shahuang@redhat.com>
> Subject: Re: [PATCH 0/5] accel/kvm: Support KVM PMU filter
> 
> Hi Zhao,
> 
> I've added some code and test it on ARM64, it works very well.
> 
> And after reviewing the code, it looks good to me.
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

Thank you Shaoqin for your support!

Regards,
Zhao

