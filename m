Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2215848njb;
        Tue, 30 Jul 2024 00:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUG2t9xo5I53cj/AF/6YxlsZCsWbLvEZ56v23QNjnn7t3/uB99rwmEaCakG41huxiEqDXg3x0/CFYi/U/Q9Kto5mIgPELRD
X-Google-Smtp-Source: AGHT+IE30xO1uU5oKM2V+ceLuHBD80g6lSleKn5o8u7nJsLZuyf9ofq8DGuucB4tCnpLKdx9z4AW
X-Received: by 2002:a17:907:3f1f:b0:a7a:a7b8:ada3 with SMTP id a640c23a62f3a-a7d3ffde804mr765261266b.3.1722326180883;
        Tue, 30 Jul 2024 00:56:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722326180; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ac1lbv0nEPMPVBrAzQT7ZYfyGJY78rmtiHrUpV3IIDCGvof1jGXeP7unrxdsABHRzO
         1NKs/xYoWFNDQRcSjVhPJEtRtubuLFsa95J8CFhDHlItNrKvDjopbxpRgQ0VgwbpERyy
         al9/ew2NWh120X8UsRIud6ZY21s2Z+eB5GKkl8uhJPJ7ADfBCax+wzxRyM1sWSTcbvNW
         t5JwhyOjvHa+blXkQ77eQZJ0cHFuPD9rs1GQTkVIG/d0VYudtyjttmNFgR3iFxOKUzUB
         aj92ObeSHms7s+3uPF5iZycTa1MbxAd8zPYs+NIh6NRLTQNa80IlnvT6ZQQI/OwtZDtS
         O2Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=RMbo/QmcHmM2/4r9oOQg77fZcKm9bRDzFuasRLnrtC8=;
        fh=UscwW1rX8CGIPHOVTfAuMO5KZvEuwv5X6kPG3yD6D+s=;
        b=xvY6RZmO+mgK6A+Tp1CI95fOpORrYAyN3dtSampJTfsW3lnletugmweSAYQKZCNUjX
         mUclNyn/3uRb0vJIRbf42l1Sob/uHdnRIyos1VxOVMDY/K5ggi45WXZf/ME4h4Ep/A8p
         drgKEQ2UR1UE10EEwPwPbl9uVLxPr2EE7TAiur5AOMLo1UWKd/Xjh42XoOK4OPRoTcBy
         mfUetjVOc5j0DxFQrKnCvsBdt72JdTJRshmqxIrbZFP7wjYU0Krd9CxFusIPJ6qJP7Xi
         lsSqCp7Nau715dCXlWM5QD+6bzvFd5CdTFSmz1vCjizraf1VsVCibbGAxpyKokIJPqHU
         b7wg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DXU0Eo0K;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7aca7b4201si748492166b.122.2024.07.30.00.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=DXU0Eo0K;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-266962-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E3E1F2476A
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 07:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1DB191F95;
	Tue, 30 Jul 2024 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXU0Eo0K"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D4190666
	for <linux-kernel@vger.kernel.org>; Tue, 30 Jul 2024 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326161; cv=none; b=h4rqq5wLz2dgyWkM1zahxq14PiB/cYKoALp43vbVnYHk6QNM7OMGi3wl9mht4GSwimmxt/Qutx3+J+gkmHefU1VyVnavI4Tzkwrn9sExbzVGIrva6WiBErjJVYLZzFUPxVChmebLSYZUKF2XNmbZwX1Ds/uJhGBXFc6uXnKxfus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326161; c=relaxed/simple;
	bh=iVM/lNIx9FLDzrJYFZIa7VB1NWYVO1TqB88lag6oSu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKqEVrOAbawgmGac3MLKPJokrDk+xzfaP/e/CwZ4SardrU6fFRXh8Iaf95x+JgNB6kfkmhLXhWTU3cNEEgYSlqBpTRN8ltGUu6qyYb/69cQiyKa8A45m/pvUGiwTVqeXITrtqPGDCEyHKmYlgE/KhdQZ54uhPiy/D3DU9p8aHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXU0Eo0K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722326159; x=1753862159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iVM/lNIx9FLDzrJYFZIa7VB1NWYVO1TqB88lag6oSu4=;
  b=DXU0Eo0K0aC5R1PjWolyyafhM/N+v98z6y+9v+OCBWaq9k2AyYKXN1U5
   zzURkXbQIq7q3R9yUSByrpuVKlAtvVJXPxn7m9WO+3Y+s6a8lEziRAYAH
   cKGOMj0h4l5Yp+AsMMRXYLLlHb2SvqFOJel4h/bKTQuxmAeh3kwix42Zn
   JhD+VMoUtbhcNmb7JtjgP8pEFJI7jmfq2DWx1ydU2AYLPAUnQyM+arn7p
   lxPv4r1kr6dqdYVPsar89LyyGvtRwGDI6ffssQ7w9mSOVY1DidC/0GNwb
   dNTvTKiVywaF2BOZxSfBM1bq33JWPk4AaT437KhFA+U95hlrZQ6d65YYg
   g==;
X-CSE-ConnectionGUID: YAYLBVeUSXCpkR2sYaJuFA==
X-CSE-MsgGUID: lDLk35kgTW+oDe4LSqnshA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19967184"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19967184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 00:55:59 -0700
X-CSE-ConnectionGUID: Q2E2GV1PT1aKj92KyS1elw==
X-CSE-MsgGUID: 1+APfD/eRfyG89D5H4OylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="58393322"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jul 2024 00:55:55 -0700
Date: Tue, 30 Jul 2024 16:11:42 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>, linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI /
 GHES
Message-ID: <ZqigPgTl7quJ553J@intel.com>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
 <e994c3944d31775d62bbd017dec3adff50ddf269.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e994c3944d31775d62bbd017dec3adff50ddf269.1722259246.git.mchehab+huawei@kernel.org>
X-TUID: ohQ6dNlKHCvw

Hi Mauro,

On Mon, Jul 29, 2024 at 03:21:06PM +0200, Mauro Carvalho Chehab wrote:
> Date: Mon, 29 Jul 2024 15:21:06 +0200
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Subject: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI / GHES
> X-Mailer: git-send-email 2.45.2
> 
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Creates a Generic Event Device (GED) as specified at
> ACPI 6.5 specification at 18.3.2.7.2:
> https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
> with HID PNP0C33.
> 
> The PNP0C33 device is used to report hardware errors to
> the bios via ACPI APEI Generic Hardware Error Source (GHES).
> 
> It is aligned with Linux Kernel patch:
> https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/
> 
> [mchehab: use a define for the generic event pin number and do some cleanups]
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 30 ++++++++++++++++++++++++++----
>  hw/arm/virt.c            | 14 ++++++++++++--
>  include/hw/arm/virt.h    |  1 +
>  include/hw/boards.h      |  1 +
>  4 files changed, 40 insertions(+), 6 deletions(-)

[snip]

> +static void virt_set_error(void)
> +{
> +    qemu_set_irq(qdev_get_gpio_in(gpio_error_dev, 0), 1);
> +}
> +

[snip]

> +    mc->generic_error_device_notify = virt_set_error;

[snip]

> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 48ff6d8b93f7..991f99138e57 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -308,6 +308,7 @@ struct MachineClass {
>      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
>      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
>      uint64_t smbios_memory_device_size;
> +    void (*generic_error_device_notify)(void);

The name looks inconsistent with the style of other MachineClass virtual
methods. What about the name like "notify_xxx"? And pls add the comment
about this new method.

BTW, I found this method is called in generic_error_device_notify() of
Patch 6. And the mc->generic_error_device_notify() - as the virtual
metchod of MachineClass looks just to implement a hook, and it doesn't
seem to have anything to do with MachineClass/MachineState, so my
question is why do we need to add this method to MachineClass?

Could we maintain a notifier list in ghes.c and expose an interface
to allow arm code register a notifier? This eliminates the need to add
the ¡°notify¡± method to MachineClass.

Regards,
Zhao

