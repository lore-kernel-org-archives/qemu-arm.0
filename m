Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp980198njb;
        Fri, 9 May 2025 02:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUKthIppJgUmC4xM6wFBNpl1OHIUXVOjqipFIaagCCrzc2CIKVmvn+FKz0KJ+V3ZO+F6xBMreHdYhA4Rg==@linaro.org
X-Google-Smtp-Source: AGHT+IFT+BHCoqB0xpld1Dk/mYTOjR3AruD5x9ocBHHZUliV+BdV/ikEK3gvX+gkx9ZN/6/ynWNR
X-Received: by 2002:ad4:5742:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6f6e47a7653mr35720406d6.6.1746784755657;
        Fri, 09 May 2025 02:59:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746784755; cv=pass;
        d=google.com; s=arc-20240605;
        b=N+E8wcbEBORmD0yybq6fCFgkYXHrsAeLVhj2xyIH6fE2zCrfxfP5+GLIzMTJyk1Qrq
         DiStx99WejoA3mZm9fk2GkTkY/Tfb6mB2KDxZmId3yuBXQBaSMCxCWWJ6xOh2bgn1P0F
         137jWkbEhmCQ7S5qPihPUgRl4YYcDr9/PC1HgvbuDKLouMgJRpYzyuKSeiq3bpBxzAOJ
         cLoieza1V1mp/KfILLyy1UUB1YMvse6zDfh6U3Ywvl2RA947Y4Lk8sZeIZEn8Iu3Aqik
         ymRjRSdXtCypS0KQ7H7cQy5dvulu70Pwd0yOfO9SM9lX+q1bLPPbTDcuyX8mTOsbhRtd
         51sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=DQ76rNrxRWlJSgmmmbf6aZu/43Iu9QVrFi8sTvZQQnM=;
        fh=XwZ+SlKA2ObuTzjRd0BDrVQXnQFFQXDytsanjW2699w=;
        b=G7/zHGlMy7sNe0QEJgL+Imw+YuElw5wjRJo8xSsX1pfBF3zp9yP3INADPqz+ZShrp3
         5OG2R3sX1OD85eTYUaui/tEKTpo2DccrQobzE6jnIey6yftbIw+MisSd1UnSWEF6HCDd
         t0N/I9v0mFZc8ngo+eCNyPcYgBzqKNPSm34xZoctIbPC8FMufZAYEAdsW4EkxMjnHoRQ
         CoOJxfcEGl0iC86MQeaOzZ0pu+eAmMcqD9Qe+t9euPf7bdNbR+hYPuxb3XZEUNbfxhuK
         xSSMwnghF84s5DkWl2tcB5AqcDwYIz3krM+ZZvi+8qs9daTxCUsVD7oUZEiiVuYWrqhA
         zSQA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jldv0FcS;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e7267si19252156d6.10.2025.05.09.02.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=jldv0FcS;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46052-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74FDB4A3963
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 09:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9E2269AEE;
	Fri,  9 May 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jldv0FcS"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107B2676FE
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784744; cv=none; b=RaAoZsII5avZCDtVBJ++AFatidWJ5UP8rZ9uGXluXSPwDeDw0MQWWZ9Zgz5n0pbjfeYU8YqOACxaY4SjtzycrcY5/yQ5SqxoeSoihPB4PEyOgzQ6NMZMu1hkIq8Z/qvc4GzjrOib7CV3fO5B+oZMZ3MeVB2P7RmeWFwLxhnujZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784744; c=relaxed/simple;
	bh=FrtgzPushvTfBtYzrA4xryV0T5y0Ofrk1OzBI442UsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/vsY8JEBDxn1Su/So+mJl9G1szJBB7npemFTPFFzXBlW2Lldm2SzvxfVpq8m0C/+QwK/RxgJiWMfDpYvnphJpfWVAL3rvuTv7OnkjLFXHGi/RILNq6wQgA678bg/y9KO8TvHV7X3b88/5J5B45HGPKpiROuDCmu3qErGryE4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jldv0FcS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746784743; x=1778320743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FrtgzPushvTfBtYzrA4xryV0T5y0Ofrk1OzBI442UsA=;
  b=jldv0FcSLqdkk2+miLitmlcBvWS8wf1fU4fcyUqdh0fSLfPaiI7qy8kK
   ZG44hDoP7qCwJ/IN37C5ID1xNa1zIJ309mWsrlzST2KBWETbR6GuUg4So
   u619UFar3d7F620baRGzT16Dk3C643pJSuQsC3EWOmOamVqecox5FhZSa
   aAMgev9pe/3o+xBrd1sooQD92KtmuYFUs1Zth+iEnlnxzLHbSWRayg4Hi
   EL5GqvSnvebsgUX2b5aAd1sv9ltRArsjoDnG1Nhqr8CS2+nMZ6X0sqA5O
   OPgDaugrEQMWc+kpTn2zDQIytsaZlNrG41sqqyi+BBAu+PdBl/6Krh/Os
   w==;
X-CSE-ConnectionGUID: 0fX4TXi/RFKpfD5hTqJRaQ==
X-CSE-MsgGUID: 80WK1V5sQm2CHp3s+tZ5Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51263050"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="51263050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:59:02 -0700
X-CSE-ConnectionGUID: QWtv1rnXQuKrD0DM8sgCQA==
X-CSE-MsgGUID: iX3VjJpPSQSoXwK10eontg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141524192"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2025 02:58:54 -0700
Date: Fri, 9 May 2025 18:19:56 +0800
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
Subject: Re: [PATCH v4 27/27] hw/virtio/virtio-pci: Remove
 VIRTIO_PCI_FLAG_PAGE_PER_VQ definition
Message-ID: <aB3WzIjvBmE1SjI9@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-28-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-28-philmd@linaro.org>
X-TUID: JSkNbx+sE+15

On Thu, May 08, 2025 at 03:35:50PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:50 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 27/27] hw/virtio/virtio-pci: Remove
>  VIRTIO_PCI_FLAG_PAGE_PER_VQ definition
> X-Mailer: git-send-email 2.47.1
> 
> VIRTIO_PCI_FLAG_PAGE_PER_VQ was only used by the hw_compat_2_7[]
> array, via the 'page-per-vq=on' property. We removed all
> machines using that array, lets remove all the code around
> VIRTIO_PCI_FLAG_PAGE_PER_VQ (see commit 9a4c0e220d8 for similar
> VIRTIO_PCI_FLAG_* enum removal).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/virtio/virtio-pci.h |  1 -
>  hw/display/virtio-vga.c        | 10 ----------
>  hw/virtio/virtio-pci.c         |  7 +------
>  3 files changed, 1 insertion(+), 17 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

