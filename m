Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp195758njc;
        Thu, 10 Apr 2025 20:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUo//NDhaIU7SxRDV1S7QQSpbALYTAVVlYjyP+y+GjBgM/q8vLMeM/+FgA4zt7ywvTHbqsTz1KH1u6xHg==@linaro.org
X-Google-Smtp-Source: AGHT+IHtNC/+aWgfn3aphW/MBiEbeBytZLGht2PYF9kwBCgc94gSZ94vrEfmbYI3ym0MXyT7pliD
X-Received: by 2002:a17:902:f690:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-22bea495238mr13324855ad.9.1744342961114;
        Thu, 10 Apr 2025 20:42:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744342961; cv=pass;
        d=google.com; s=arc-20240605;
        b=Mob0L4IWRHs+aHdo5j4rE3iD2JZmwF/WYXDQyL8NS4+Ax84zP63ZqC+CzDK3d9mwie
         SsUiv9ENNjamDEPzFcZa4kBTsEaKUQg+N+gmqU5TmwiZfCwtyIFVt83cdRdsuQ0AwleM
         xeWtIqqcmKch2+kiQytSQP4vtxBdA6/edwhg06njR/gYzrDclmAK3SSeNbmIkICmXMuf
         CtrwHsjllaKt0r3+p9JovwWyeuY2g1bPdgdqxvj5GsjNhlVylSKQ4cK7SRTGHKQZZ1f2
         6cEzdPqFk+aH+XqXNeAe9qWI/+buBLLMlWm8Q+PEsyBUkgUwhn/AmbbZsVjLh6bYUGqb
         e2TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=q82FJputHk/BxXruXs5qsOBz3xNz4htLOcQ76AgfrWQ=;
        fh=5YDLLJgO7dHw3UrwgK3PqKzoqhNi0WRWyfs5b9Zwmpw=;
        b=DrtvV3yQSaUZCfWW0HcSe1cKqyvQK1wosKkNghMQuHnI5PvLP0qKUuwy6x2rLm7QE3
         oIBVBt9FAApS8nhOu69B36nrVAd60LZu12M7LKCF6YmapfIJEhMMp8dvivgp+ZAVl2KA
         n7Og+SvNb+UAEiTvkf1HxmGq9OjIHIcrzXs8d7n/QE+sRBuqYqL1WsgV3WCef7vqIIfB
         yv+KclrLKE/k+sGv2o4APkMez9E3/cRrXeDCPsJdPQMvVyjKILFkPzWUUBMW8NAI5hu/
         ny7VEW1qgIugk5UplRj+SnEByJcaudOz3MJ6JQaxyiG/1u0NMckuxOYnVc81S/414t2I
         ebgw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=OrKMkxgp;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-22ac7c87f94si60826535ad.204.2025.04.10.20.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=OrKMkxgp;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-43127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4978C55C7
	for <alex.bennee@linaro.org>; Fri, 11 Apr 2025 03:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8739427C87E;
	Fri, 11 Apr 2025 03:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrKMkxgp"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA24192D66
	for <kvm@vger.kernel.org>; Fri, 11 Apr 2025 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744342957; cv=none; b=VYq/BklkgdVXN3XZz2oJYxsVnzv9YDPeYd7AYTFpjSDP3nb6fZbwNfSsDfBBHRqOaOaUGibmnVZ+oV+bDQfNMWaJBgKofr29uA6Bq9wMW09HB9/qz5VsMA/0xbVn+iIS3SLjbwWkNbxXXPb3XnFKi/P+ro9HxWyIBnGF7M/iRfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744342957; c=relaxed/simple;
	bh=Unn0HrY1GqhIzLNRhYl27mv1Bs3adfSbtXgW1AwiTPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7kxIqlt0EN16t8BuCVKErcPGFenkUepGEhkrE8SzoEHlPNUc/wJpc4W8xQmOWIbN7Mm9Of0XVpwiW1gN12ENU5GsrgIACHE0EhARHJVeGH26ZzT5vHR6uNAUciI4D8YaDMgd6QM+NEk8QQ5Nh+xUyv5Zj816EdKqqYiDsWgxnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrKMkxgp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744342955; x=1775878955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Unn0HrY1GqhIzLNRhYl27mv1Bs3adfSbtXgW1AwiTPM=;
  b=OrKMkxgpknbFiO0zbg3fkmkkNLP+Nn4B32j7gxfenYv+oAS+YCTMAWVF
   /4kim9sEQ2oT5qVE5UgmVF0O1+GeY4ZN7z0BoKZefj7PBnjs9h/t87Gwx
   1A+fDtxXaDtvIF5yKwab6W4N7YwyaFrnCfRPlpm/Fbq2RRZhm0qez6gO+
   PTr++XgNVVVk8L9dD5CYRD9dgNWlMZOuuHpgF49r+0aU1aBOGprVcxN3z
   nWgUj7wh5dB2kbaDQxYHMLCKlQKaQROwB3QLZfKWIGlxPgBvqYb2QWToK
   WynHG7tj0BE2UV1KiRiFZjRAfleaCNAhNyb8mNG+hLSe5trbM+nrZsqvC
   A==;
X-CSE-ConnectionGUID: z3/8hUWtT4G+Q6c0SZ2UEA==
X-CSE-MsgGUID: 9cp0z3PBQquROrhep9hJSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57267118"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="57267118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 20:42:34 -0700
X-CSE-ConnectionGUID: w7dsJle3QNShfhjz9E7PMQ==
X-CSE-MsgGUID: QRKgM4I6QYGyCZcOaNygPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="152270786"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2025 20:42:31 -0700
Date: Fri, 11 Apr 2025 12:03:20 +0800
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
Subject: Re: [PATCH 1/5] qapi/qom: Introduce kvm-pmu-filter object
Message-ID: <Z/iUiEXZj52CbduB@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-2-zhao1.liu@intel.com>
 <878qo8yu5u.fsf@pond.sub.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qo8yu5u.fsf@pond.sub.org>
X-TUID: 6JFCQ+zhloL7

Hi Markus

On Thu, Apr 10, 2025 at 04:21:01PM +0200, Markus Armbruster wrote:
> Date: Thu, 10 Apr 2025 16:21:01 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 1/5] qapi/qom: Introduce kvm-pmu-filter object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Introduce the kvm-pmu-filter object and support the PMU event with raw
> > format.
> 
> Remind me, what does the kvm-pmu-filter object do, and why would we
> want to use it?

KVM PMU filter allows user space to set PMU event whitelist / blacklist
for Guest. Both ARM and x86's KVMs accept a list of PMU events, and x86
also accpets other formats & fixed counter field.

The earliest version uses custom parsing rules, which is not flexible
enough to scale. So to support such complex configuration in cli, it's
best to define and parse it via QAPI, and it's best to support the JSON
way.

Based on these considerations, I found "object" to be a suitable enough
choice.

Thus kvm-pmu-filter object handles all the complexity of parsing values
from cli, and it can include some checks that QAPI cannot include (such
as the 12-bit limit).

Thanks,
Zhao

