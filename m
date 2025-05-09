Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp962916njb;
        Fri, 9 May 2025 02:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVQvOKF57ieh4yxYHC+M+N/kgQiNunJ0FrzN7zZIq0Rj42/1HUUOVIctDVT6odSEeJoCcnEEOi2Y1gENQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF/DFXfNWVi2jASW59i8d4IvB4juyVbXfh9xY2dDWZnVvLNqQrMW2AIW2IIJ5gTHWhkxHYp
X-Received: by 2002:a17:906:c4d:b0:ad2:2146:3b64 with SMTP id a640c23a62f3a-ad22146451cmr102832266b.39.1746781982821;
        Fri, 09 May 2025 02:13:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746781982; cv=pass;
        d=google.com; s=arc-20240605;
        b=O7mg+zxvf+9jASEGxeSXDOC8lPBCOfvEq0ec38lFi7J+EZUEMuPQ3sMqXh3bn0lq+s
         cz6+yhBorWXgktglKezZ6YQenX+rMy50UEZqeqiSj31M8lNk8z/vNqO2HIN8e4Q2H17L
         y5v7Eb/uXUSGQ4OgupOD14Rav4AdIr6KSZriW6ZnppBoQKFhF1miePSLr0znnUINJRe1
         ETNNnrjyjtb2NmdQBe/vnl4gDyQXfHtO0mZLrNa6r7jE54oLgvw7x785Jo8OMM1t/IJy
         NS0PLK+uMd4qSn3UslCN4i0USS24XJwyj2FGDyj8LwwCA9IXyyK/HV3LPKE1/LGLpRRB
         v1RQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=aT0SA5qDUGIa/wyOXCyr5YBdCbJp9uz156yPYnThr7Y=;
        fh=y1fwdwYJ+ybi/Gz9eikWWAo4cmx9n1IS5+H12IBZSDg=;
        b=DK7iKCEeUW1nzhScqP4mB7CWXwisazBx58c0eJ6++owffNmfaqma1tRsZYupaU0+gI
         wXS3XORgs6udONDNhsbT4r228gRqWELd32SSqTBz5dTCEvZAkuurL1/fotKaIbTMgEsH
         WApAh0VAaghxE8PATWa+BYj7ReykKJcUXIs7yq0gj07NOlFSdecdSla3OWD7NXlWrcJE
         4zWtNTNa48xMF7r5kNfis/PzooEwXGN5/J2rQBBwbzveKBppSiqlHUq0kaBdwDAYsYnD
         G0fjGnRhCmKcEHiBBbH9yL41fAnhAVXzyuPRP23X4SiZYL2KGw0D2kJKaekWeckk2xLD
         vtdA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HrHk5ceF;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ad2199b9c59si117767066b.677.2025.05.09.02.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=HrHk5ceF;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46038-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3E6A1BC4A5F
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 09:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55E7201266;
	Fri,  9 May 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrHk5ceF"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC46274FE5
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781971; cv=none; b=VJ5ZbEUFJvSMx6BzbJuy6XbcL7wMCmgWP+g3mhDtXT+Zbdw8p2qTp1e3Vjhpt3UE1ayIGx1djIvf6ga0NRAXbM7JdSDLutVHSXOo9wikumcUnCjCNC3Sx1oH2LMeH15qmTR1hW13qfpXWrFgmcGtV4I0mMh2leTDLUumi1cVhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781971; c=relaxed/simple;
	bh=OxAOtgqS95oq/T1fpT4BK/8L86LhYAjPTsvn5Tvd2ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQGARxFcwaUmLF2qoObA/BGr/ulfEyv/FQdyLfanV2aaYneB2c0dxuzu1/kIg+3pOWH7JOJ7lcLmIpqf4PEaL+h+KGgTyPKQMX5c19fvt3b/vR3jRtrO27dv0gDYN6Sj77IAzmiTWC8xNlOIrFeYXLI6UKhbu8v8PyHr/9Lp0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrHk5ceF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746781970; x=1778317970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OxAOtgqS95oq/T1fpT4BK/8L86LhYAjPTsvn5Tvd2ZA=;
  b=HrHk5ceFBhINV65V/zbSF578PK0njduu+Fx6d6UPGwn35GodSMXsRv7V
   x5jfsyp/Sr7kR/pOHjxxTzz0ZnMWoiAgxccYDqmdQJFWkDBxhfB//Z3LR
   sXmUrgWP0nQ3iNmUip97VRYr3lJNUakuczFhViNeTl2arMf5gHW478++S
   PLC+UhqqMTQ60q7WkzlN9Nenm9cOAjz33fJgX0i7a417G6EglJsICIPai
   n3m4ZFsol3dCok8E50fddnsfNcRJwK5xIQdouTCkOQ50IooI+pOpqAMrI
   WBmwUy4fn096n4K6joumGvSRJH4F0T2U6HBhTeCwgfd5bAsk/cBdWhM21
   Q==;
X-CSE-ConnectionGUID: xs2GPBwFTsGKe7+JqOqddw==
X-CSE-MsgGUID: PVtexFMcREO9xuUzcCvHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58821484"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58821484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:12:50 -0700
X-CSE-ConnectionGUID: RmOe6Q0tS12beDPOMS9eQw==
X-CSE-MsgGUID: zi5cOttHTI65JzRYGKKcnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137496974"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 02:12:43 -0700
Date: Fri, 9 May 2025 17:33:44 +0800
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
Subject: Re: [PATCH v4 17/27] hw/i386/pc: Remove deprecated pc-q35-2.7 and
 pc-i440fx-2.7 machines
Message-ID: <aB3L+MVC0MWhXIp9@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-18-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-18-philmd@linaro.org>
X-TUID: 7LtdvpK5RH0k

On Thu, May 08, 2025 at 03:35:40PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:40 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 17/27] hw/i386/pc: Remove deprecated pc-q35-2.7 and
>  pc-i440fx-2.7 machines
> X-Mailer: git-send-email 2.47.1
> 
> These machines has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") they can now be removed.  Remove the qtest
> in test-x86-cpuid-compat.c file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i386/pc_piix.c                   |  9 ---------
>  hw/i386/pc_q35.c                    | 10 ----------
>  tests/qtest/test-x86-cpuid-compat.c | 11 -----------
>  3 files changed, 30 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

