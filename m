Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp963535njb;
        Fri, 9 May 2025 02:14:37 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWDJo616Mc85dyb+H+cOH8JIX7/jPELtcvxzkQUqD/f4ElexKoMz7xE+MV/jWWjc+JBEhWOOD+1yP33jA==@linaro.org
X-Google-Smtp-Source: AGHT+IFcR5gVVRVavyQL+q5MVSEe+cYgeKJQQfWayZfet+r+2B//kuNa8w1aiFyq0wJmGX7KRTKy
X-Received: by 2002:a05:6402:1d55:b0:5fc:97e6:ec6a with SMTP id 4fb4d7f45d1cf-5fca075e288mr2025562a12.13.1746782077723;
        Fri, 09 May 2025 02:14:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746782077; cv=pass;
        d=google.com; s=arc-20240605;
        b=fod111pSWULEGrJwFlcG6VaJQLcxC+DkZajt3k2GdSbJoS5DuQ0OWXc6wtvWG6PbKy
         zYBnFJ5DxNZundSue2MNM/vR7hCc4jKgLVsHmz22XpADz8Ag3H0PoKc60XxLNf6AXrUI
         nVMRb7vVrzjM0DDnRVzb9wsJQJACM99yfpiR4wDqcd0rXdLx2hgrz67i3eZuWbEW07Ru
         UYnN1X3nkazPoSCkpUQNkVTgYSzNHRXB/Oig5WOclrJf+gWqS7hCjul6NqDQxPyYcwLR
         cCrHVIWTwzCz/sq1jqu8J7ygwXfTenSxg6r81IwaRNN3vJMrhaoJ6XEzDjNv2Wqzd+xp
         PFKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=F2B/5lWrB8lHdKj+3Qxqhu+6wHJOgCd8MLLOC8y2cJI=;
        fh=XwZ+SlKA2ObuTzjRd0BDrVQXnQFFQXDytsanjW2699w=;
        b=TYJIaHw6pVZtx3lszndLr1+A0UisObWI4uIq+e600Ezhpg3Wy/uf8FmjHg0Qlf35rl
         PUgo57l7Wvvv7IC2n1xoUBqZ0Pwv6fKOAW4gtOgW2NuD9gYMztLz4qoD/I2Tu0yKcYtM
         vwLprRAv5aLaUUE2XvydQRhf8pWh/tzIKyoBrHjGtkBVZNDeZm0raE7DuxCTHYQtwRVq
         gfEc4u8aaoEyRr8Jkc3B6yxPIzffrKyYGirsqLKIN9Ilksqu27RuJQCYq1cfYulQQH+L
         j6jefr1nGt821+7E4g5rRPqv/3SAxw6AurNScxpU+N6txomQRh6vrQ/6tiTcnFCqRsEl
         a0Lg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=FBFcofSf;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fc9d6c3954si1215048a12.211.2025.05.09.02.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=FBFcofSf;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46039-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069711C2367D
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 09:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D05D274664;
	Fri,  9 May 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBFcofSf"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870D73477
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782062; cv=none; b=pYK8VSvJMCbw10LTdFXG/gD5fFBN5Nd+uVfPebF2yVGG/zt4XwtXdHUp+xR3VmsQmQjQsA+NDKDTEfOWjHISZT1WR+oTOmoCFEpbBmwUNdBQRU+xsSoml46P3YWhXXdgZlclvWjqyOHaIp1vhUv3O7zLxGD/v/RDJLtVjCJ4cbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782062; c=relaxed/simple;
	bh=yOfR3/SCjW8m6LHYck+yUmtN9nPJnKBOsrhORO48N2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsp2Qd2T1L9mqQRFFG+GlcsVQKvIjgkOcnqqrwrwsEh9BIdjEqd1Z/wva2mh8J9z6WM8Hz3aBC/78Mv0O1JX4GsZRh1QeF9U5ECNwpWgCxGlCsfAYeGpFrXKChDeMFsrU046+75cISbSCdMwaM7sOGvssDCUQQEa+0sCUbgkr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBFcofSf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746782061; x=1778318061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yOfR3/SCjW8m6LHYck+yUmtN9nPJnKBOsrhORO48N2Y=;
  b=FBFcofSfvvjij+Iod+aGB6QaRx6cMBLLPipjqkCVQ1R9jXk3KIE9Nocz
   GIDxLpnHK8/5ewSHALAK8qsBSU1+LKMLVbxiyIuQ9+DDNSBMb1cOECgZ3
   hhMaitrN9hc2Na0D4tHby+SGkU9GCvxahngq2oHpIniA4k/MFi895Uo+Y
   QA7+76Iky/shrGFszwvYxS4fW3j4Vav9xq9EryzhoSASAIy2sSR05Ht0A
   VBQAU1FCwbQxBFuzVEVxSjVU73RgEnFqwNMxNnb0PDpqg7SjiRgnOrSSu
   MwERo5DfWiylbFun65jo3gQCE6J0Dv/tLCUSlCRgoj4tlM77k3ndhXxxo
   A==;
X-CSE-ConnectionGUID: SOQGHLaWSoiTdnWjJzbWJQ==
X-CSE-MsgGUID: sfgZ3qFiQ0ifuJrzQmmLOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66008400"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="66008400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:14:20 -0700
X-CSE-ConnectionGUID: Kyk8rOoGToSDu0vEaYOiAA==
X-CSE-MsgGUID: qXi3Pi5HRCyZIy7ZvkebgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141776520"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2025 02:14:13 -0700
Date: Fri, 9 May 2025 17:35:15 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 18/27] hw/i386/pc: Remove pc_compat_2_7[] array
Message-ID: <aB3MUyPaJkiotnvf@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-19-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-19-philmd@linaro.org>
X-TUID: YBnRG7w0iBtF

On Thu, May 08, 2025 at 03:35:41PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:41 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 18/27] hw/i386/pc: Remove pc_compat_2_7[] array
> X-Mailer: git-send-email 2.47.1
> 
> The pc_compat_2_7[] array was only used by the pc-q35-2.7
> and pc-i440fx-2.7 machines, which got removed. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/i386/pc.h |  3 ---
>  hw/i386/pc.c         | 10 ----------
>  2 files changed, 13 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

