Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2600233njd;
        Tue, 1 Apr 2025 00:33:46 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW7cxMDU/lG4UFE8eXH/wj4es33SUHhT4iMJ5lylrc8oz8dSfKR5t4UqX1dyUhNzk90k3miATm6XlysUA==@linaro.org
X-Google-Smtp-Source: AGHT+IEsIKszhitWt5cIQXY+dcif4u57L3jyvih5k9WwXstYmkWkJt6fX6x3it+yxQIA5dlvM629
X-Received: by 2002:a17:906:1718:b0:ac7:391b:e684 with SMTP id a640c23a62f3a-ac7391beac4mr897058166b.58.1743492825942;
        Tue, 01 Apr 2025 00:33:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1743492825; cv=pass;
        d=google.com; s=arc-20240605;
        b=XCeCEWOJ0s786oXrxzs+30rMncgDh3FqUiydfnvB8+tthbKSJgI2oN9slEo4sGcmJ9
         ruVzVAL8kccFNfRhaEQnMA32I0CilZlzPlGyKtQCBCLo0JGYtaZXTi0J9Cjqam4T0SUD
         0k1xqG4/SZ7uNrLpIn+qdqrvrCELvbyswG9gJ9PbIOcnfhfFnWhZiIxnkEk5RJyKf885
         Yuk8zX6VVYXn6Cu5HyCLIGxdS1+7Dt6uMMO9G0CKjXZ+SrDp33bWFdQKm2LNd6/rJo3G
         obDKPbTTFWz3XKQwYi/1sjI2OsPIvcgm8ZdxU/W3nMoIfVOO23VDH3efyHUsKomwoP6Y
         7sdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=5MxYsTAuniJ2CaEG7bAnjCWtQlN5WLZBifKKNbfvKKQ=;
        fh=kl017cYkAIK8V3D5cgL4MskJ6IKJHHH98eH9ObhZkIU=;
        b=d+ocuR8EnV/ribKe9XuLgujIYPVlFuHQZnRcZUTmFJGNmklD16t1FXJhs+UzWF0qMN
         VdFkRirX5FOsloPjyVTZK8CPtCuT5U8INsYYTsZsmjEVKD2l6KzhSMSeFrpUcy6eddrp
         fmuHVVIsAORFax/yIw9lI/IPMtbmS1xjBih3FP2my4sKc+uNbm/jr/snothSQsoKcVeP
         m9OjfL3LtteMZUrFso2fMznObD9VC+QqZ3fJkqQpmd4UZ/OGUISFHh48NgTHHA8nH4u+
         pb1dIee/oTwuiSQmkakCVUS0JgPJ5i5JQynxc89dUUCu0zIbUNGgARAc8Ind9v/sAcv3
         1ZXA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bUDuehkk;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ac71921d190si643003966b.32.2025.04.01.00.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bUDuehkk;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-42294-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 214CA188AA5A
	for <alex.bennee@linaro.org>; Tue,  1 Apr 2025 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB50126BFA;
	Tue,  1 Apr 2025 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUDuehkk"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA6F4ED
	for <kvm@vger.kernel.org>; Tue,  1 Apr 2025 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492820; cv=none; b=EBNSrthgqQuV3A8NHetjS9hvziTpShgE2rI6o9myvL7yJRlOBDeM2W3mHpdSMmf4A20V09wkSNwRe+NK2F1eqvlPpz0DZwzd9aVhQAM7OBslZmDYoQ6QdAG85Tb/J2hdYd63Hbb25psL5UkJFPT0GAV5sDr0HkDl1nnN8M9tkzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492820; c=relaxed/simple;
	bh=sS4rHhY6syIz0P638wU0Dc52eTVGG8/lD+UZkHM565c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPuM4b7/dyIbBoV0K729fBKC3JUEQX6Bmpgwd4kZNz9l0epXSBgmnPMAXMD4GBveF06jpvp/TxLr9OP3GLDVIDyv5PZrY1tZGsHvajzFjNoEnANPkc/UCRShvSfMedd2BHPsh43CTVv4sCckEq4hmvKO2ioEHqOXzYPLrNjPr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUDuehkk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743492818; x=1775028818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sS4rHhY6syIz0P638wU0Dc52eTVGG8/lD+UZkHM565c=;
  b=bUDuehkkGOkDC/aWVqIUpZd3vs29vA2qhoPDrIRNEWcRHFzuciMHnLiO
   wdzixUdYU5dWQGMuTbD2/JOnWRVkBQFBGmX07lyMHaJCpgrPzzn3p7FI0
   mhImDn/aQks3ASgducS+HoXl6wOul/8ATW6h0ynxMgxBwkgCPwfYRSfpg
   Bo93M3eqhX72DUcvzL+1Hs6SfNaS/CfaYiqvHkSz2seHMxZh0jTISnt0G
   MSF06Yr7VMmXwhn+4xANWZhSF0AgypE+CABIHynX0J1w5DgyqwXz8Blwx
   IkDCS/Wg8GjRcNbERRrZYEYScWF6XnS3mGKVTKWzes5fw72cjJ4brl6fu
   g==;
X-CSE-ConnectionGUID: /PN8HPxHQTGtmBKzO1qvFA==
X-CSE-MsgGUID: vAX57gA2TuGTjGo6bJEX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44928855"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="44928855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:33:37 -0700
X-CSE-ConnectionGUID: AR3XhP4ATMWtzCG8fT0big==
X-CSE-MsgGUID: 8DDo80f7Tx+XNRe1i+nFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="131023314"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 00:33:33 -0700
Date: Tue, 1 Apr 2025 15:53:53 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ++/vQ==?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC v2 3/5] i386/kvm: Support event with select & umask format
 in KVM PMU filter
Message-ID: <Z+ubkUrUMgvo2y/h@intel.com>
References: <20250122090517.294083-1-zhao1.liu@intel.com>
 <20250122090517.294083-4-zhao1.liu@intel.com>
 <87zfj01z8x.fsf@pond.sub.org>
 <Z6SG2NLxxhz4adlV@intel.com>
 <Z6SEIqhJEWrMWTU1@redhat.com>
 <878qqjqskm.fsf@pond.sub.org>
 <Z6TFr49Cnhe1s4/5@intel.com>
 <Z6TNMZbonWmsnyM7@intel.com>
 <87o6zdhpk7.fsf@pond.sub.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6zdhpk7.fsf@pond.sub.org>
X-TUID: 4x37HkJqmsLp

> > +##
> > +# @KVMPMUX86SelectUmaskEvent:
> > +#
> > +# x86 PMU event encoding with select and umask.  Using the X86_PMU_RAW_EVENT
> > +# macro, the select and umask fields will be encoded into raw foramt and
> > +# delivered to KVM.
> 
> Doc comments are for the QMP reference manual, i.e. for users of QMP.
> Explaining the QMP interface in terms of its implementation in QEMU is
> not nice.

Thank you! I could add doc comments in kvm-pmu.h and delete redundant
comments from QMP reference manual.

Regards,
Zhao

