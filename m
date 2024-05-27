Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3073668ejb;
        Mon, 27 May 2024 03:09:48 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU3M7Fpi89EXAATD5OzsaVygHNfGVe4nr96N981pdmJFloluFz3kspwGdWSw3EsYlobVjzwtDKEWg/lYyGjL5xiKVl/zQxe
X-Google-Smtp-Source: AGHT+IEfclPeV7pyBct/ZR1LRuB4gFtcICPqDNzwlN3onENM7jJdQActagcuse37dlWwAsFoaPXZ
X-Received: by 2002:a17:903:1c8:b0:1ee:1fcf:e19a with SMTP id d9443c01a7336-1f4499010c4mr105263475ad.59.1716804588435;
        Mon, 27 May 2024 03:09:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716804588; cv=pass;
        d=google.com; s=arc-20160816;
        b=OzXl6fmIqk058w/C4uJxTOHzjVeeKTX/PaeVEQ/4gdW+tiCUMmUisOvS/7p2BLcaKn
         gAttSjKawgzHlSP6rn0FZTtRws/dFs8aRG54zeZ8shqh629MjrduWLlWTcwMCCGy8xyk
         Tb7FV/lPpUXVkRHfyIhTI36Tve5fmk4+VmL8zev3zat682XA87AxxqrM1qB2sHWJfuwb
         IuCQ4jfrfOMLkI50dJv5NL0aVStKobcj1zo7Ud6g6gXhE42hFLVRT8/qbnNIs/ikvhsX
         aITy2omV//p+tQ4tAfFktYzTqs5y136LudPNV5iLDR1+FP14Hl3U5fVKqRZRQENiW93+
         XTHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=20QoxCQaTC3p1vb/lYfCfKnwhyfEuGXg5cw0m/CuMYM=;
        fh=3GR4+MCgfsMbFzCI2skOjY2AiG8d+xko4b8Ap+dnQ+o=;
        b=F2kU3ieIT7h84y1RtRyA7U+moox0LL2qJue7UhuNVsRdEQtG9t8G6US3JVEk+ftLkw
         gb7N9nKy+z1l2RekwoUu2If8mDOANDUp7caa2EobqyuDhPFzOF/S7WiUkloCuFcUqtES
         99WgVA7FVR8mSTgZt3wR/U9gbH9ofy4L811ZfK6OfjC06o4ap68VDGkO00ScCNo5gHka
         zSngxGW4RqfUzln88Aa5l0DV/X3tpeAcKFoGwVA+r7I31R2HReD2Jo7o3O53kCm3Weuo
         TtCV5bIOWtw5BCOAOdIEcGiEHMeXj/lVFX0Q/efdtaoMlvFuDIkTbzl/HOR8VzQ7RFxH
         sNWQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=S1A8kgmV;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1f4b859dbbasi2453635ad.439.2024.05.27.03.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=S1A8kgmV;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-18175-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DBD8B22C26
	for <alex.bennee@linaro.org>; Mon, 27 May 2024 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7DC13AA4C;
	Mon, 27 May 2024 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1A8kgmV"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AC8830
	for <kvm@vger.kernel.org>; Mon, 27 May 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804583; cv=none; b=hFvWB4nCS+TnFgR7G6JRrcSaoo207z3WT7GEeMCWyJM5f2dHGwjQ9BdqScRLLCWc/2XVEIm17dpcCvkzDpDRdiPm7wK0QuFRyjbk7ejRn33ZWaDX8NcR1+m7/Hj1NfWyyqgJMcYwkvU193a9IXKj3OW56HE4rGOXz+6IRLIOfKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804583; c=relaxed/simple;
	bh=5J8dHaMU3LQO+Etnmc1tE5Tep1M6eKHy+YAZCgxJqxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9pSJP1IYYdDoIIuXcZdZ/YPCivnfp6xlcxyLEYBKZ0vJS2eQUMqufexMfVNVn2Z0ohtN0usIEUa8sr3BwwdgokA3cZfxbxgHanq6p44YH4Whqujf0Ej9OEMeBqzh/ix8Kq0wgQZMCgFFkOnpl60sUXW2izdwgB3XdAT5QzaRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1A8kgmV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716804582; x=1748340582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5J8dHaMU3LQO+Etnmc1tE5Tep1M6eKHy+YAZCgxJqxA=;
  b=S1A8kgmVGhw2zC1IuGodIVFZp3d312oBg/0iAv1PH4eFQ5oZ4Fvmzt66
   CCSgWNaKuuXktzd9xMCh33VTaHIXYPtMWWnyXYVXpgFbngCZlXy4EXHWx
   AmGzuTpIoFBCKdF8ypm+tNrEWC/h6AxHCEUqTYe1CdFHciaT8UicO9cj8
   iiT5IijCrGfEULT/Ut9zTRDRoLyDOVe/njraAZPGVjvsqJuw7Tqj95k+p
   n4XS1jTaoe6rk2raGeLpI2yHFfeQlHvPmpY81RiW8HmPNorG7mqhymHMa
   uDBV78jxLzvD93HxahGuCK9tLYKLBiTiXJAh9Bvf/5BkBTUMESa2JDSmn
   A==;
X-CSE-ConnectionGUID: F71jyVFERAOt7nj/Oj33/A==
X-CSE-MsgGUID: qU/DEyYESNq8wtBJEkyXaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="30625312"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="30625312"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 03:09:36 -0700
X-CSE-ConnectionGUID: M48rnGhUScyrvvdsO0jQuA==
X-CSE-MsgGUID: M+HxXaNOQ9KGLkbl3BaYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="35324709"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 27 May 2024 03:09:21 -0700
Date: Mon, 27 May 2024 18:24:43 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZlRfawZPkuAZCtIy@intel.com>
References: <20240409024940.180107-1-shahuang@redhat.com>
 <Zh1j9b92UGPzr1-a@redhat.com>
 <Zjyb43JqMZA+bO4r@intel.com>
 <ZjyZ1ZV7BGME_bY9@redhat.com>
 <ZkG4nlwRnvz9oUXX@intel.com>
 <d3733e25-eb1e-4c19-b77f-d68e871c9f0f@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3733e25-eb1e-4c19-b77f-d68e871c9f0f@redhat.com>
X-TUID: Sc0Vuj9tP9L2

On Mon, May 27, 2024 at 02:41:01PM +0800, Shaoqin Huang wrote:
> Date: Mon, 27 May 2024 14:41:01 +0800
> From: Shaoqin Huang <shahuang@redhat.com>
> Subject: Re: [PATCH v9] arm/kvm: Enable support for
>  KVM_ARM_VCPU_PMU_V3_FILTER
> 
> Hi Zhao,
> 
> Thanks for your proposed idea. If you are willing to take the PMU Filter
> Enabling work, you can do it. I won't update this series anymore due to the
> QAPI restriction. I really appreciate if you can implement that.
>

Welcome Shaoqin, I'll cc you when I'm done with the first version (it'll
take some time).

There are also some issues that I might take up and revisit, such as
whether to place the kvm-pmu-filter in -cpu or in -kvm.

Anyway, hopefully eventually we can implement this feature for QEMU and
users can benefit from it!

Thanks,
Zhao

