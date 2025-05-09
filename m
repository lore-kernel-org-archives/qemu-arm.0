Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp961504njb;
        Fri, 9 May 2025 02:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWh6kGQ9+mf5jPPulh6vMUz7Ssg6gKV/Ywg4CZOxMxOuY3PjZMTqvoniMydCUKD+UJ+vcH2+uNyhQ8tJw==@linaro.org
X-Google-Smtp-Source: AGHT+IG7VESM+maXVHQy5xFukzD6JgjvSWQOgXTpl37QL3/7A3GhJ8OQEMS3C4+361PFY82qgmca
X-Received: by 2002:a05:622a:2483:b0:48d:8053:d8ee with SMTP id d75a77b69052e-494527d4252mr37695701cf.36.1746781768117;
        Fri, 09 May 2025 02:09:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746781768; cv=pass;
        d=google.com; s=arc-20240605;
        b=MRB9LbxLgHkpywXtt/cPOnYcE0JppkpKr4j/yubulKkMa7agMsXbFVeFyjE/3Yub3B
         967CS7zrQY60XGJxzsLwgQlmoB0pXKNjcpm5qpFBKxmE92XpKRwyatrlQ2nkOpuhNsuv
         67WVWt3DVpG8kfsRBpq6ccmoMQ5W4zFchR/R/RKW10n04zqUwatVIGvRl6RrpNOI7e7d
         2PhNy1M4Oxmne9hZ99Wik35SMxmawXl6UwA/axf69VVG0FH7GK3glKmTBD3fPLTRVT/O
         QjYh1BldCL7i+6eJc6BRZmuyeohyKcPsHqJiZvz8SVMklpcWvPybD1oSoX6MGFdKWOW5
         WQRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=BS5XxXqjH4XKH9ciX+JoY5GDv5L//6z/T4aMKxYyAOs=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=NXp8RHmo9de9jxKpEFqFKBIkmPFEiBNccFOamX0Lq1hd9kgLqbTdKTn2zmSvKZS9jC
         hc+Q3tFQ7qo/kyX5u/PM1tqIcUAXYoPXAK1TN4bKw/rhbR3t3W6L8wkHENN6T6pEnC2Z
         T4hTRI4L4QTqVmmnBrq6fSy2KEliQ5jXA0DCQ5o33RO4UJUB25/ZLN+YNfGLD4XYMGXl
         lYtUicO2o2vzNXuo6ebonGDVqP2sFFT0iUWQrsCNI0I4eJNrN/pDp0Rof2DizjwppkOp
         ECznSI6SQVuqQDwTw+H30nN0oqwfxEnzKE4c9E4GZmJd5OjhuDL+/FzSd7AaIEf+Gltc
         vVbA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DabOOvgf;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-494524792a0si17258441cf.136.2025.05.09.02.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DabOOvgf;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46034-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A3D917A696
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2E92749EA;
	Fri,  9 May 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DabOOvgf"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AADD201266
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781762; cv=none; b=ldi0c93YZrm3u4mfNLr8ceUet0j9t0Al9c3r1OGd7GEfIJaibo8SKmq09ko0vPQZqXqsDbtDzqry/98SgVNH2kp0kFNFUx28nvWkS8pk3M/RgZ8pYddt92w6qOGljl9mW4jof8tbnIAqpQrJJCRu87PAa6T24k5Ut7FAsisldU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781762; c=relaxed/simple;
	bh=5oAxwranscwqB3GHDqmAi9ptxiiQwuBPM52/1nXSzK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjI08PNn6csi8wkDbnAhSHZ8r3iaqrEFg1GP2BkfNKlXzhjOemZrYmsR4JLFTDrLwIIuA1vsbuuSs9+XujFVbYd8v4+7lGd0ayylazlIe5jupIAb0EcCRvkMrirXtT5mJ8Le7JEDRI59qzaMeL6b5BKDNQr7XfsE9yGA+FNwF7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DabOOvgf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746781761; x=1778317761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5oAxwranscwqB3GHDqmAi9ptxiiQwuBPM52/1nXSzK0=;
  b=DabOOvgf0q3OELyZr77GX7rBNgRTtn6CmRoyGTHzvSgiA9t2rBJZAIK9
   GbW+YmTfNf4bOgn2Nckpuq03+ykXu3jLJib7uzT2m3ZSpnE4f6heFgbp3
   OUU1fiRyVhspkvZ5qPl5DtspBuiOpuJ1XQWnVQWhPHzuE/OJgc2xj0Vxx
   6qFVbHNeoh/YJRkxSrlOt0O0b+ZlncmnunFbfTTJQGFviaxfL3bpXzcHd
   VHNonRnHb+0m7UBRt7NApoBKscsfGFm6mxndot7Rrb/BMlmnKgZHf+QiH
   Eu8VAW8WYorjd+wQatLiAu6d5w8kpfdYQWmaZRjKF/FXExOu6W68MOgTf
   Q==;
X-CSE-ConnectionGUID: KFEdzcavQGSiQMNRoRW5SA==
X-CSE-MsgGUID: wpQVOOqIRaWhkuUdl6lgLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58820688"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58820688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:09:20 -0700
X-CSE-ConnectionGUID: 23mZ4JMRS06K1Y55uYr9rw==
X-CSE-MsgGUID: SoaA/M/dRXKbfVT6oLvAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137496563"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 02:09:13 -0700
Date: Fri, 9 May 2025 17:30:15 +0800
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
Subject: Re: [PATCH v4 13/27] target/i386/cpu: Remove
 CPUX86State::fill_mtrr_mask field
Message-ID: <aB3LJ8cI/zdJVbCA@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-14-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-14-philmd@linaro.org>
X-TUID: HdkRkmePBGHw

On Thu, May 08, 2025 at 03:35:36PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:36 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 13/27] target/i386/cpu: Remove
>  CPUX86State::fill_mtrr_mask field
> X-Mailer: git-send-email 2.47.1
> 
> The CPUX86State::fill_mtrr_mask boolean was only disabled
> for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> removed. Being now always %true, we can remove it and simplify
> kvm_get_msrs().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/cpu.h     |  3 ---
>  target/i386/cpu.c     |  1 -
>  target/i386/kvm/kvm.c | 10 +++-------
>  3 files changed, 3 insertions(+), 11 deletions(-)

No case found for external user use, so,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

