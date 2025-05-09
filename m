Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp962171njb;
        Fri, 9 May 2025 02:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXLcHV2P/QnQvXwuqrCaqk0VJ4ns0lSWl7uxsRHFXmy72IVEcZv+Ze15qsOxz0ENyia6JLfSCCLrR8m/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHYRxRRKnyKfVgCZ1p7bDRBzF/UpyccMzceH68T1dEkLAeGweAWTAT7UBsBItAJuMHevage
X-Received: by 2002:a05:6a00:17a1:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-7423ba88b17mr3305005b3a.1.1746781873190;
        Fri, 09 May 2025 02:11:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746781873; cv=pass;
        d=google.com; s=arc-20240605;
        b=h/paASdwhEace7qAzDJl8WOW60FNqVslHB7AIodEIpxdxCPk6K7TI++65ZMxv2My1v
         YzhFQaA0DoTHudmm6VrKlSekPqYqdRI8caH4MfPIbo9xxR2x5jqmDWHxcEK5Oao3bzi2
         UYmZ0D+e5J3GRF0gwdKKGy0CdBlgOF3zI9pMkkIVs24rsmk4JASXsfvJdvzbj+WlKAmv
         MnR9dhViqh/hEbpQj7HnniVKCT9b1rNViHboZ3Hr1Vl54seC5QEjkOgdnQKCc+XLOcGV
         z/mK7j1k2aeQjD4ha2BengL5akHEoWSAhD6/PSt377wH75SPJPp//CWm7RgDLHiNstrb
         W/QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=fVidkUReupXkYXeUBaJy5RbMmvFLHsDxJdskVaNJb+8=;
        fh=y1fwdwYJ+ybi/Gz9eikWWAo4cmx9n1IS5+H12IBZSDg=;
        b=gdSsAA/46tVHmMwGBBdfZCjGB3BqL5AHhmAKDzqIQ0JFK/tigwr+TZvLzDAH2G8/cw
         BOLpuECJMzumbuupIWmmhExFYj/yVxJ/A5QZbeVykO/usBsqU+HECr8E7HUDuEXiv6U9
         a6mxoyCdcP0CIx3S0a8AIHqvgr0T5WZiU5LqUlidgVFSRUtsC4Zx5ELpN0OHr0f7Hjap
         EIqGXZptdZviACRHTsXoAP7Bq7AjPqyl+Hz4b6GQ5DqxV96y0gzp0jqY+gDpaK5t1Ydf
         pwfgto5LWghHCnE+FEa4hwiUAZm7q4HrD9+TWo5hnrUs5oyClczB1K+bnpGUUUeHiCRl
         YxSw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EPPwu0oZ;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74237a404eesi2250319b3a.234.2025.05.09.02.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EPPwu0oZ;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-46036-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A44B37B58DC
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 09:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC69A2750EA;
	Fri,  9 May 2025 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPPwu0oZ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36008201266
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781833; cv=none; b=M6rC6T5ALU0mbZew2wGFFfqjobSCN4/aDcIIf1xAh8VxIou8Y6x0TuDkcvKLjriJKgIBM+i5snT/wSvE0YoFdTY/DHCPKnuQ4eKLGCNT1v8Vae6xyVMSG6X0MrimAtvZGs5aj4hyk3AyhhpoiIRUmGl1AEPo0PlZ5FHnHHZzwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781833; c=relaxed/simple;
	bh=OJ/sh/VtJoFNwUXpYSmxCGdbslcUwkfuu8I5VXJHUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP4P+4CPSsS9McA2HrgCLxTwm8+NypGK6WMZN1E5CZxHUo2IAfORp2nGUOM9Ou8CQ5/n/8xkfSaBy71LeModHNPcA2RSEFmUCRSrn7lPpPVHXvXxW6lUwCoVxxsEUuc2t0tI1eiocPvx80qt5mWTkHBOsvarIijbkQ7J+cyfL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPPwu0oZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746781832; x=1778317832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OJ/sh/VtJoFNwUXpYSmxCGdbslcUwkfuu8I5VXJHUnM=;
  b=EPPwu0oZTvspSvU2PsYKlE6JKcxTAXUpV1cu61Q934sQh0ERuzFXXTVB
   2bdX/unw6UwVT/bbb3vkkdzV7WioYCb9kOoBN2S2MBtKGDQM77dHDq1/2
   wQfJMJDPT+cOTtEaqVjPDbrmKYspydPxnrMIN8m4wK/txerfMCplxd3Gk
   2Tu/AvVAmSakhj+RPWgDN/pMFCZP/gyi1UH5q0KYQazy1CSjkijKZrXWs
   XHJtLgQnTb2l2MVHBKT+eGWZQybrvvvHNGgIQ4v6gFjoIybEzrCM8AOW+
   HNHxaCBGO/UzFC5vsFrm1TSYB9HbbQXVDnyiOHRjwt+kn0rafhSDErNXf
   A==;
X-CSE-ConnectionGUID: fpL0OAfQTdyQkqq9S3YmeQ==
X-CSE-MsgGUID: UwLYwknvR2eRMdBmjZGt8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48757935"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48757935"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:10:31 -0700
X-CSE-ConnectionGUID: krxuoSxmQbWwFC7YTaR4ng==
X-CSE-MsgGUID: iKwOz92dRZmPDyuOT9YhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136448402"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2025 02:10:24 -0700
Date: Fri, 9 May 2025 17:31:26 +0800
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
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 15/27] hw/core/machine: Remove hw_compat_2_6[] array
Message-ID: <aB3Lbk88E+YzKsWc@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-16-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-16-philmd@linaro.org>
X-TUID: R24fji+DiJPI

On Thu, May 08, 2025 at 03:35:38PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:38 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 15/27] hw/core/machine: Remove hw_compat_2_6[] array
> X-Mailer: git-send-email 2.47.1
> 
> The hw_compat_2_6[] array was only used by the pc-q35-2.6 and
> pc-i440fx-2.6 machines, which got removed. Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/boards.h | 3 ---
>  hw/core/machine.c   | 8 --------
>  2 files changed, 11 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

