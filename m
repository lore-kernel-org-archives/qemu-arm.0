Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3067168ejb;
        Mon, 27 May 2024 02:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQsecVwL1k/MkzIC/f5THm0QlxEP6U9GgkSqWQH9hNJlCskJ9YcHNkaFy85E8ZzY8yB4RSW1JmLeUUqNl+7iTLV2PuCRME
X-Google-Smtp-Source: AGHT+IFMI8VeMUwl6YU8XMXrCmVvPThTUGTl+V0+vzJ2M2ZE6jT9BdES1rHIO7kBLw7R7CWYVpA1
X-Received: by 2002:a67:ee98:0:b0:47c:2b74:2903 with SMTP id ada2fe7eead31-48a38682055mr6854388137.22.1716803781046;
        Mon, 27 May 2024 02:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716803781; cv=none;
        d=google.com; s=arc-20160816;
        b=dT2Qh34jWhzMoKv5S7rK/pGI223WYxC3Mp8uYXa8gYbdqgE01C42d+VgaNJ0DNT73a
         x+kKPo2a9BPyyQ7NLliK+jwm1wd7cKrsWtK4j/yHs5ifjRJbwlnpQeOujB1h4RgoX7s0
         bZSXhOLA1EYOZ70twBrC9gFo9i/JhJG0wzNq3swcIcTlBgoszIAwL1RM5RkdtxxnGlU6
         kLlT3Cr5S62X0upKCrSpDql6kCoc1wdHPcxDM4kfkOIJbVRT0/SHlLLFxl2eBfh0uWi6
         HYWXrc6mXzn5EQrCySu+tNodmJYEqVAzedCZYj0hQnNuh+Jv4Nw0BYi4Zdw65xeOro91
         i49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HJbS40GLKiGqvSwlpdZ78CzpLfgZTcBCw7aQAbZT9qM=;
        fh=NCDCaEenV1FKGnNJQkxS68pmYnFQlt7M76oHdBH6Edg=;
        b=vqmGANDLTkZeqlNBDVYq6mQQTjiCZPHAKjkaSE0UX2tIho/7KnsY9Jph4bYt78emC6
         U9ZJu8HIJt1bZpXCu2Kmwncs3/rnnviB3eZpAYmckS5uGXUs9dZisnwYPnbzX6dlPQDp
         8sU2VEG5GuLVbO0PE3FjIVTq4ThZkG9mYdEw1UEtW/J9qrGOXgkntJMrlfEMN93IAsKS
         Dpgoc4iAJyh5+gxb8sxfTWdF9llRcWEOQWwdqj6/8fGmgo4rGIuewFKm2FlFxWC31k2q
         p1fgAP9Se9imq9kr23xh0wsjG3CODW6K2J6bzHeUxnrPuNUYegRDJVCes28MgjWPPkS+
         trOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Pl8q9TgZ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b2fb3si78209841cf.424.2024.05.27.02.56.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Pl8q9TgZ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716803781; x=1748339781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97lFmP1Xif4eZA/n0xbIqmin3Syi5ckopV3vGiHK7Wc=;
  b=Pl8q9TgZiedJWQbZONipnvti92/nZnpZgrqClgNPDGKEcee3USYW8iGj
   iwA+UKU7TnZoSFIhmqbRxlhtQohiPu9UEjiXtFAtSZFIcWzGYoZFQ+qzH
   vbk0z2v2HmpsDCIwhvNL0M0o8dVsebVOYGpSqDyBXyHnMrDYhhOJlaewW
   RQaNP3VedEUodIBaUGtILUBvLiYEguMPfMmiUO/9nVxL4EpfrOzOfGxqU
   h3dKgZiQgl9e2d3z7JrORLtD4DSLNo7mtsteRqKdIzmk1j6emPXpPGPUm
   sJpGbZSHMrL6KLoUGzM/kZC7oZkeadc67g5EWPu4bicymszrc+breGjh3
   g==;
X-CSE-ConnectionGUID: RRPhxZDCRcKF7FGnWxZRQQ==
X-CSE-MsgGUID: 6FZFDQAkRnmHAt3RhE/5rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="35629312"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="35629312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:56:04 -0700
X-CSE-ConnectionGUID: K+gIUm/3SGCWVzcdfrYm6A==
X-CSE-MsgGUID: aNP11mAfRpW7Q+k5uFzL2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34717942"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2024 02:55:55 -0700
Date: Mon, 27 May 2024 18:11:18 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	mst@redhat.com, will@kernel.org, gshan@redhat.com,
	rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
	linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>
Subject: Re: [PATCH V11 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <ZlRcRgGtFq+oeto4@intel.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
 <20240522211111.232114-4-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522211111.232114-4-salil.mehta@huawei.com>
X-TUID: 08Hd2GtueYNf

On Wed, May 22, 2024 at 10:11:06PM +0100, Salil Mehta via wrote:
> Date: Wed, 22 May 2024 22:11:06 +0100
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH V11 3/8] hw/acpi: Update ACPI GED framework to support vCPU
>  Hotplug
> X-Mailer: git-send-email 2.34.1
> 
> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
> notified event by evaluating ACPI _EVT method to know the type of event. Use
> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
> 
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
>  hw/acpi/cpu.c                          |  6 +++++-
>  hw/acpi/generic_event_device.c         | 17 +++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  4 files changed, 32 insertions(+), 1 deletion(-)
> 

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
