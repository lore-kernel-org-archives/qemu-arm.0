Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3772077njd;
        Thu, 24 Apr 2025 08:14:59 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVrQKQPMhYdxf1x2j6XoI1JMeH3ubp3snCQ0Zx3ceXl/upYHXW/6OulvehZ/5+6frN99XVEjdjlUqRmrg==@linaro.org
X-Google-Smtp-Source: AGHT+IEFthripWGwszNIs4ja9Koq9lOZQyXmocO/EzDa6Bc9R3EA3e3lDDtYChQxb80LFUzmT5C7
X-Received: by 2002:a05:6402:3495:b0:5e7:2871:c137 with SMTP id 4fb4d7f45d1cf-5f6de694a72mr3139157a12.14.1745507698957;
        Thu, 24 Apr 2025 08:14:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745507698; cv=pass;
        d=google.com; s=arc-20240605;
        b=EOghRFmKMqXeFuqLwtQ39gpBEXYoJr1px2bAkWCsVp9XkGUM5bKkJlbrzoLDWdvG9f
         fUSMq9tYA9DmnVfL8NarE0ZIGxdsurOXlIyOGExL7M/0wCpX30zovWAVrpDFmToauiEL
         2D+y56dnE15orDFj22Pzor9VJ45giaOIeUQoni3TzXzzXe8Pyg8Hv+5XWa9dxiwf/9pP
         N+rETrLxJztJpSjtZTYrmYRwxkhdgE0gw9t3+sSUprH/KiSY0kvvFmco821R6Vso9tI4
         pEIBXSkL9BLCcXY5Cw5pAi2b1bQAnAOQ1quBr9p5KSRGB2ebHUHCe+8WXVcgk+NXbFpm
         2LXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Rupd+50IXd2DlUedmPBYnCNIb6BMkvEUXK/bm9dkBXQ=;
        fh=rXpxx2i5iv7WjVS4tGZZ/yGhBL3yg+6gmpyLQd0Ut6k=;
        b=O/Px7r/6o3uptd0FR8/Krh73JAkq42V/LD/GMMuBPns50CLCBKpYM7KOfHda2enAAy
         mVVyBBZCyATB+NTzxxYPHhE52ZNAaT9rlE1F7jPajwvOrenpk9Ij6GB+M/Pblok2eJ0C
         cDNU2ZvgmM3GVLYL/aozQjVd32u5GGjBJSIBCjqtKj6sfcaTW2apUlWZbf9LL4EWTzcY
         KdhFXbWt/RgZzbtUUF2EzufIhd19AKFKLWvw/brf0ALCqfKkGHZGUnqp24T0fIgXaHVS
         6rwdW48FflAfB0lUW7R1LeAVhU8C0OyFr2P3qNkzxt6RB8NMSoyrelsZyobddOW13Avb
         ByfA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GJmENsSR;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5f6ee18d969si1281428a12.382.2025.04.24.08.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GJmENsSR;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-44183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1431B8262A
	for <alex.bennee@linaro.org>; Thu, 24 Apr 2025 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F7C1A841C;
	Thu, 24 Apr 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJmENsSR"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6014F9EB
	for <kvm@vger.kernel.org>; Thu, 24 Apr 2025 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507694; cv=none; b=OIU8tpq8xYgDwbrGT2JsbE5n3EhQABXDZqro6eM+aesSrXS+CRHY8yGszDtq/vu/Tsk2JxlkMzmdG8qZ//BQWTxPMMLAxc75cBhNN/PibSORCi2Js2t9Se1Mgo0lwcZI8qQP0lrVWdejG1iMRrxfuJJpFj93i6vfz8bxlmbuszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507694; c=relaxed/simple;
	bh=NnaqS19Vj5IEgZGuniBgVWHY2Bm3xNzNuM4PHOb+jI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvQUq910mcz2Yi6EECjJ4vGu9X+cfTRY1jE5G2ZfxOhPTXKnWBDMQZzGpCctqz+Z1ZpqEKSXtjTI0EHPw/rOHS+Qpi5IqPbPX4Z0QCC5VL9G78c7yVoxfJDxM7Z1+qSuQJOKmgRFHOLaN0cMrIxxRNYsba+kxiOkRQedEFw+zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJmENsSR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745507693; x=1777043693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NnaqS19Vj5IEgZGuniBgVWHY2Bm3xNzNuM4PHOb+jI0=;
  b=GJmENsSRVF6gJsHFFhv3HB9GcLa0BnHPUhhLlRZKGB4LRb109CznPJKF
   5Ml6GLXTtxImbL/zHXkiDYC33sAB2CMtBn/vIrSOLZsuFxE0Y+aeBQg8Y
   gEhTHiRioEsAabNZvz/9HqnFq+rmVUBg58BrrT/rPB2CBU6jud3gbLn45
   6lOCMvyrqZuSZMgwiBU9m5ZRs4BGEEcXSQqhEygTJvyQbOrr31WeiAABa
   u4tR8g69Lu+RlEkv5XUuHT1cY7sm7VwTD/AMzBFATDc+XCcMfRXP8CJtR
   sYH893tyFrKfcnQ8rnCJBP4U5zcYUDasBvEFoQJYW+7Rf95A+uxwoDJ2a
   g==;
X-CSE-ConnectionGUID: jGnqJW8VTBW9gLanfpdZNg==
X-CSE-MsgGUID: Ofwl94LiQT+rjnn7uZve4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47035262"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="47035262"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 08:14:52 -0700
X-CSE-ConnectionGUID: gU9yJX50QmeV2dpOjNeazQ==
X-CSE-MsgGUID: Oy1pJe+FTEGiowulyfquZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132637484"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 08:14:47 -0700
Date: Thu, 24 Apr 2025 23:35:43 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
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
Message-ID: <aApaT9Tj4ycdtNLH@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-6-zhao1.liu@intel.com>
 <c800f523-2b1e-4f0a-b553-eb5a717e617b@linux.intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c800f523-2b1e-4f0a-b553-eb5a717e617b@linux.intel.com>
X-TUID: Cpeg2ZIY3i6R

> >  /**
> >   * KVMPMUFilter:
> > - * @action: action that KVM PMU filter will take for selected PMU events.
> > + * @action: action that KVM PMU filter will take for selected PMU events
> > + *    and counters.
> 
> Maybe more accurate "fixed counters".

Yes, will fix.

Thanks,
Zhao

