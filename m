Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp824799njb;
        Thu, 8 May 2025 19:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVvZA24AiFFs7ae30G8cQxP2bFWdoxJDZ+yE6IeFFEBg17ywSsifcxfzhKsy3A+B36bgfz8TDdaLuZcPw==@linaro.org
X-Google-Smtp-Source: AGHT+IETHIVUBI4iXHtbnBNMx1avan2kdXo+MO/jBOXj8tQ6yZ4WrS5QVYD2fyAHV2+UH3Nol/HB
X-Received: by 2002:ad4:5dcf:0:b0:6e8:f4a1:68a4 with SMTP id 6a1803df08f44-6f6e480e30bmr26064566d6.39.1746757741594;
        Thu, 08 May 2025 19:29:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746757741; cv=pass;
        d=google.com; s=arc-20240605;
        b=DHf4m+M4adpNv/JgA4HOTIXyw70lk6cX6jvcibPAy75KE+GlWjTe/Skpu8OyI/cn+b
         rI2daoq5/Cg9pIAPfyxXdLT2k1OnDhHef0g7Ek7yxc72BEEes6UqUzQ4Qd9fzaVnvdrJ
         GHbVImAWTV7PGH1m0rWKTQuDMWTr4CauxQX5drq41nJHYzo5A5we+fPGfnoijOZotf7Y
         vNl8usDYxdnKCaIlzjRtoBudy0JlRXrjVi3p+hdeCRhjY8bezE5p3FcsPcOWsv0MyyAo
         IpvyHuKHEcypLZcJJAqzGNwD74ZAUCT0km9tpE06OTdXznqZ6vMYig6VRGFQgzowCl6J
         eQ1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=T2XFUTD5arq5D/f2FnQF7kji+xeW4nZJ0kcUxVTk/fU=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=AteyIlHCDVqcdXNZoingOxGTE4SVkk/IoJH4c9u5xvp5E+bRzPZqoVAXVm9EN0m3/S
         vPwOr6TDNWdWrF86QzEqx1PRiJS34Rg5TyjKKrfMx0VbbgnfDXrvMP3onP51B1py7ObW
         +55p9C8maQLx1Q/74UhNjUjqmA1e3kl0KZTEh0Jo0/viiNUpuWHsEve/8bUke4/PtM0Z
         x3MarOP/F83AEsK5nj0yHOnGXPHdya2Y6LZbsHVacx1Zq1RB3YUT8d9atsOEA694T5A5
         A3PuYl4CK2WhScTI4FPnhJboi3W6p1jDQt7ajL7qMW7xPWq5yY0pk3HbiyH1SkW9l6UX
         JdIA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JmjDBPVO;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a58be8si12973126d6.407.2025.05.08.19.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JmjDBPVO;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-46003-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C187D16BB79
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 02:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875FC24167B;
	Fri,  9 May 2025 02:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmjDBPVO"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DA13E02D
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757736; cv=none; b=S7zUZEi6+HaAAKdwknBlR+mtitrq1sMeQJ8fJ0t58u85ZYHQy+u8lwklO95X5HUYfMGP1ClKip4a2k9ERn/iZEUwYQ1bDd/8oFf6sTyHmLNfe6jR/pHeceZJdMD5UbYusN9ipE/vT2GgSc6pnXloKnCcD5YgOBu2uS8k6CscJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757736; c=relaxed/simple;
	bh=RMprCGbtdSV40HLQjrF+qRBk02ekzXK5EPWksg+SrrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsKqIRQQxfZN915OzB7DootmuHwl4t+f8Oal1KNZt48V7+CeUIRfIbzYoVnfSrceK8VowB/eHKk7aktAU2RsYH0KkvLRCkovayRBMiulX3HlOsg94ax/99V8LWTrC4Xa4nSU15ojt0bczuSa1I7GIzbMdRNQ7VQBmh0HnQNeZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmjDBPVO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746757734; x=1778293734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RMprCGbtdSV40HLQjrF+qRBk02ekzXK5EPWksg+SrrM=;
  b=JmjDBPVO8KypqzqHLQEwrjEi7k+vQfNJ+0D4dFTyqJvkyRW7VBErxdwL
   9f54hfN8KK8MSP65oAVEwe9e9hcpOnu75FaXjkjQnGxLIhlW5/ZYQEE+z
   nWo++sB0oNnQHsvp+2/LzpJJaIgcZdkqWf/dWV+EmW1SP4taqNcU8dCqO
   Txtt0GgWwgDgwLofnZThCXQB986yW3FTn4ux4b5nPvRInSPZd6k3d6Dtt
   SOeN+mEfXoxpM+w2gYZhYoFgLIJMp05VRWPebMNzAtD/wgJ3XP0NBNNSk
   E6p3XsgErA9ZGqg2YO+aElqyDulhz2srMrjyo4VniwcpnJaaHLqdW6U0M
   g==;
X-CSE-ConnectionGUID: apUlp2CHSyuZZknsUT1+wQ==
X-CSE-MsgGUID: tsiPp4I4Sb2fywzSxmoIkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48683052"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48683052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:28:53 -0700
X-CSE-ConnectionGUID: 4cioW0uESkCHgfQCf0s58Q==
X-CSE-MsgGUID: CXGlrR/DRviiDer3bjIwEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136183450"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 19:28:47 -0700
Date: Fri, 9 May 2025 10:49:48 +0800
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
Subject: Re: [PATCH v4 04/27] hw/mips/loongson3_virt: Prefer using
 fw_cfg_init_mem_nodma()
Message-ID: <aB1tTCJ2isIYbiIt@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-5-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-5-philmd@linaro.org>
X-TUID: Rp0rIr7MO4WG

On Thu, May 08, 2025 at 03:35:27PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:27 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 04/27] hw/mips/loongson3_virt: Prefer using
>  fw_cfg_init_mem_nodma()
> X-Mailer: git-send-email 2.47.1
> 
> fw_cfg_init_mem_wide() is prefered to initialize fw_cfg
> with DMA support. Without DMA, use fw_cfg_init_mem_nodma().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/mips/loongson3_virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

