Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp825121njb;
        Thu, 8 May 2025 19:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXhLqFCHfJLWSkZu58l390Z0P+7geobT5SSKMWstxpw5SMvFOgXFRN9mCEMnoanTMnNfuMatCPbGHApIw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3Vv+zA3BFM6a8X8zVX8U5fF3vpuYGlhjhYfng4Zkb6jBF/hIEhbu2XSmycuCCn0OGknYT
X-Received: by 2002:a05:6402:51ca:b0:5ec:9e6e:c48f with SMTP id 4fb4d7f45d1cf-5fca081ac40mr1018182a12.29.1746757815247;
        Thu, 08 May 2025 19:30:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746757815; cv=pass;
        d=google.com; s=arc-20240605;
        b=K15yMenb8/AcDsNN2yh0lmOdu2iQK4aWm1R6lTmDXJULVnxGFo6F5LHikL0NPfY75i
         IGAAjD6bIRP/RpyjeIohsavqhnapkW3BLYNErJkj5XNUM7JWZjZDF4+4ZyhrVVN6IJBm
         4j6ameG0TgMGvXlxROeV3sXKhk+a8W5q2V2vf72WlYW802q2UYl/akvd6aSeuMzGzWst
         n2y1KtWGZlc9Oc4E01N8kMFn1TuWp6LcVrxsQu6Wr1SpMeR/VhFHbIHF0N46OOm/t1z8
         8eM5NmTQt7caheSy+9XtF3ydmqvgFGUrgKI/Al2gMjnU9MGM44Hd/9LzkwL/QXS4DaiT
         9ylA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=z1ZTo3CannnG6X0Xjvzje/4YlkpGWBFI0+LAAdNFiPw=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=g1/FYADp9+Y6ITXFyxO6EamyycsS22iyss4GXuccWJzYTNUlFXeHpXCS6HxIHsgKAu
         VaMmiJXp8Fqa+828XfbSLxlp+of2Z3RVgso1928m1YLrzqdE+AfWBi51W0qcj9IjiFFQ
         L2Z1xpT2HiNI8Ki4M9QBvqS0CBfcjgDDkqvwqur/c3lARAeI7FNuksPEu3G+yEDFn5T0
         pMHMqzqmmJ1UFLaI86B6W7Ce19GH9s788oiGm9BSVo/j3O8HkGDFWWHOJS2CMlGQb6JX
         39RGFe1zNDNm0uDkyZrg5an6XznsVSXR9+s2qnTe6smljcjBw/LOUAMDQOqhKQfnTjw9
         oeDg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="PZp2OnF/";
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fc9d6c1984si785464a12.257.2025.05.08.19.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="PZp2OnF/";
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46004-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456DA1C231D3
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 02:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10377244668;
	Fri,  9 May 2025 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZp2OnF/"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D61C13E02D
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 02:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757798; cv=none; b=NL3KAUAYEh4GkgAr8NmdtdV36JncT5RSBQRO6HGXrWvZwhl0dqwFsbKo7Ilb4Akgonu+dHTLEWEqaRqkulB1eJtb1KLZg7HXZivT1HSTFeWoU3CzjCLuAOkH8ftejA40Pz/y4ihQNwdIeUQhdfdCHdOjm7RNjWaggtCh/qs/bqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757798; c=relaxed/simple;
	bh=7Tb77gPHUH0LPQdGOdm6IjNB2V0ob4F/eCHrWe81rIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jB57XliM+hsJb9rad3ki0LtCmGZUPDs04Q+ZSuES8jsRFFvCN7dEKLEeliaAgKKMM921Wg7h3gh1snoDYZwhwenM44F7pL3nqxydie4kwUTkwTM02N0ItNt6ujDwxUusmXrK0B8vv8vuigiS1RBbQ9JYen7LaKVyCj1TtbJnDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZp2OnF/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746757797; x=1778293797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7Tb77gPHUH0LPQdGOdm6IjNB2V0ob4F/eCHrWe81rIU=;
  b=PZp2OnF/mJDspnZsTrz2K5LQeK4cYvqs5DZ0wthb1p6gI3ZUy4lpKvTC
   ND/7gVwazTk6k/FbYh6To6juSOQ5LuK/E6qosRlStTptKLFvy2BvleQrb
   fFM4mvUqSnmrqCWa3LS1iLwWUriN7tt3DbwTfKOKxbL/cijacD0OKZpFU
   c+MLMfp2NIUDBk2b5k22BetuAu9W88pcS4WWoda+rTdLn389LD0NXdt1X
   zoInX5e70FrwhiQjHI/aYoEpQOmg1aQL02IVvVteU8tiJQOe6A2tuPa9W
   CFl+EWKvbKvf4ApeH+A3GTHASQ8nAYQZ6Y5FvbGkDwpEeswg/83cAJGFc
   w==;
X-CSE-ConnectionGUID: 7XKkcDqLSa2aNtAah3ttdA==
X-CSE-MsgGUID: K4Wf8DTLRZ2zWEWvASNbRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36196651"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="36196651"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:29:56 -0700
X-CSE-ConnectionGUID: O4kiPmhbQaGrST7uwiUwRg==
X-CSE-MsgGUID: ovYRMySHRxKudYS2HsQStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136362015"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 19:29:50 -0700
Date: Fri, 9 May 2025 10:50:51 +0800
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
Subject: Re: [PATCH v4 05/27] hw/nvram/fw_cfg: Factor
 fw_cfg_init_mem_internal() out
Message-ID: <aB1ti7GJSJwbhaoz@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-6-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-6-philmd@linaro.org>
X-TUID: PzXYc1RxOcaL

On Thu, May 08, 2025 at 03:35:28PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:28 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 05/27] hw/nvram/fw_cfg: Factor
>  fw_cfg_init_mem_internal() out
> X-Mailer: git-send-email 2.47.1
> 
> Factor fw_cfg_init_mem_internal() out of fw_cfg_init_mem_wide().
> In fw_cfg_init_mem_wide(), assert DMA arguments are provided.
> Callers without DMA have to use the fw_cfg_init_mem() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/nvram/fw_cfg.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Fine for me,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

