Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp827727njb;
        Thu, 8 May 2025 19:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUV4AxPhrzQJr4YQjnvbz/MnD+GhlKQIzTQ0sqsdyTOad84Hs4jGK9aUMHhINqTHETtFEJzk++IlLjL/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHTMPNE5H8DK5dveYirEh2M+qZGIlQ5AMj+aOOVQhtgXWWlC7GJUDv5Z7gPaoW5dHOr12RD
X-Received: by 2002:a17:906:80d2:b0:ad2:1f65:8567 with SMTP id a640c23a62f3a-ad21f658744mr56009466b.17.1746758361863;
        Thu, 08 May 2025 19:39:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746758361; cv=pass;
        d=google.com; s=arc-20240605;
        b=QdQVLpRY1Piao73bpwXkVeV3yF/fHgprg8g0niDgtBXhSYo7ChsW/tRHW1iS+OmfIE
         q2NASQlj/fePbwiTMz2Am+E9IQsTuQvFFZldQEGJWyt7mkC04o3lMySyFZQic3vTOn2U
         0SQT0pzuB4FiEH+yhy9BLX9e6NhGI5xWa3cYXT770biAKg353cGcUxUsyqskeok8SUHT
         2rAAli6sGDxObaxEnGgmpXt1q4iunBBdz6/sIill/XtbJ496RVDSzTjpyjfdCtm1FpQI
         jQFZ/Ux0i4qNWtz2yES8lGMxdGXZBIlOCT83geTQCoM30LhBD2sTmIfrKO/u20Wm978F
         F5HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=y8Xs4HO6LjL3DI4yqx7m3QoCAyXgfWbS8b1fjSPmsQA=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=bk9ZXqF709JeJmQpQJI6k+4F+kRq6QsSRjIcZNM6s3XZjRw97+3sQgubsY4/P3Eyyr
         fh8R3UUjAZBAql0lh5/li5oJh2jPjM7B/AG5/NpELMnv6w6WmCWRARDl9/+L/2yZ9W0n
         zjXIKGTZtIjjz2iwuVc1FpG97RwfemuXi02O4UzdGXzdJ325V9jKlvpAVgzgaOdYqVSP
         1BXUKmnsdDDyvo8TPcF982t1Ziil1Q8xBV67UbpqxxYAmPkEsm0JH0uXl+dTmJaTUz0V
         xg0NL9G3lr+w7cD5++2nPopBWh/f02N8r7FdU88CtMYV528ki4yarDVodx6Vou1p5iOd
         Q2lA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eZ0HfDXM;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ad2193543easi77764266b.62.2025.05.08.19.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eZ0HfDXM;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46005-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2535F1B67940
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 02:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0BE225414;
	Fri,  9 May 2025 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ0HfDXM"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1C22DFA2
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746758345; cv=none; b=e2XbRhe25kWhbs4fpxONczZz5qxteHq9RHG2AURs27ZwJirDHmj67G1JQYCWacUc7b1mAcSkpms1kZI4P3MhRF+kkByYJE885y7dxx42KpK9lDUx1xARJkcSQfAMkJWaIELG6KseTzSjZOZW7zPQtZIJGUdAq+lLkvKmACt2QHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746758345; c=relaxed/simple;
	bh=JXwi2uJoss8m2Ee12mCsjw2jbINKA+zy0KI8tSqNQa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjeWtxLvhpYViIkTwk/o7UlrfbOExJWX5rJRLzGezMiMP1YqWCEOkk9UwMh/GK0S8CyTRuB09F8Pe7Fn38WuVNSnQxgCDeXCZe5z7fdLWcTM/qruFOeOvIju+anci4VHkhj9/tUO5bEypbl23wbvXJzl6fflAoDjcDrBOOdip/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ0HfDXM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746758344; x=1778294344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JXwi2uJoss8m2Ee12mCsjw2jbINKA+zy0KI8tSqNQa8=;
  b=eZ0HfDXMT0lwaTE0+LK5650XdPKawD8odI2aPsDRNJon7vSEwI5jbMoC
   4Zta7WSDUwgrTUeDkmddOhndHN1bGIawGrASjtLTgymad36oy2eFEep36
   hdUCZACDyYpUwu7hL4+QSKnXDnJ+9jqddkzLFt0aA1CT74WuYwcZ4BaqM
   76x5qYxYEhR024xVYCw5qPKoPV6QtjOHU9UC/eThDr85H/ctModLQ8Du7
   N4CHnGex40tBbtzWpiGqxK7ceht6MZkrtDkaeIH6du+U/bwpUUrlLBbDx
   g5tQs/LmP/5F8hP58qfm4bmwL6w02EwiE8JJct0HWDcqj7ErdQv+2nYN2
   Q==;
X-CSE-ConnectionGUID: j6UDF8ACRBmdxJEcjncUiQ==
X-CSE-MsgGUID: LVWgwhWRQRihiI6BzmLQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48719464"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48719464"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:39:03 -0700
X-CSE-ConnectionGUID: yB6P+4VPT6q1SmQ9DdW/PA==
X-CSE-MsgGUID: JLvymKaORr6aflr+3VRG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141389104"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 19:31:01 -0700
Date: Fri, 9 May 2025 10:52:03 +0800
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
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 06/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide()
 -> fw_cfg_init_mem_dma()
Message-ID: <aB1t0zLvOGz065ho@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-7-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-7-philmd@linaro.org>
X-TUID: puxCUH2QwJYS

On Thu, May 08, 2025 at 03:35:29PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:29 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 06/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide() ->
>  fw_cfg_init_mem_dma()
> X-Mailer: git-send-email 2.47.1
> 
> "wide" in fw_cfg_init_mem_wide() means "DMA support".
> Rename for clarity.
> 
> Suggested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/nvram/fw_cfg.h | 6 +++---
>  hw/arm/virt.c             | 2 +-
>  hw/nvram/fw_cfg.c         | 6 +++---
>  hw/riscv/virt.c           | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

