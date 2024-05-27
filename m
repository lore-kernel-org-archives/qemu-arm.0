Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3066601ejb;
        Mon, 27 May 2024 02:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3YaQjeDs3fHmVg82lh6Rauay4NSDf0kLKj9eBq2DH1DFecg07F2DgW/dBz2ZNSVTkzg72i+Lu4iAXimqcm817yuI288KR
X-Google-Smtp-Source: AGHT+IEcKxtf0MM5lsFztoLQwHhGE5J+pAlpFwmEJw2FRvmyUXZ9FTCb3oSQ2MOQT/Lnhhf6Xfhu
X-Received: by 2002:a05:6214:5c02:b0:6ad:6ea7:b27a with SMTP id 6a1803df08f44-6ad6ea7bdd9mr84618596d6.19.1716803690365;
        Mon, 27 May 2024 02:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716803690; cv=none;
        d=google.com; s=arc-20160816;
        b=uvvCwFxCSlkymW9X2X4tllZKhcNLD+5kTcukbj/O6d3nzk+fYwtnUAZly81z47jVN7
         kPYQPdiKzt9xL8NfcajkvdsYQxNjwW9grtGvY9jU8HbHoAbCjgdC0CwrcfRWicqdvi5p
         z95cG4mBqcPrg1AxBsrH06L+dCCnSVyTy+ddM9lZ7I2nLJRxG9ZkrZ08Pyl94HSvSwBV
         XHXqAJ5SgpXjYX1UHP0hI8U632rntmvYd8Gmf8XU7uJ6OiQnSGgPxRPqympuzR2NsV9B
         ppxGw0efsHA3UoC8EkyTb5PYn0NvCU6hgnKk5h5LpoQMHgJjlpm48vOup3uhi4MwDiEd
         4UjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2cBWnFDY7bBOTve7WqhPGiC6FytePzBK5QYQ3qk+XgU=;
        fh=NCDCaEenV1FKGnNJQkxS68pmYnFQlt7M76oHdBH6Edg=;
        b=VuHv7+gja/XNUyPGzAY4ohabXOC6Ghx9/yzOLD7+6PK1A0CJk5ZX7FbfRYeQZe8gyX
         c+TsWLJBk/eRMGkfPPwJEAUCO532DKiUSvvDFKqNaiBBKXiJ+r3EyBIuJf4Oe3uPB7Fx
         nYAqVJNl3QJwzyU4Or2GPABBdcZZDc31IgTJfJ/hUzL6XNna/Xxg//cqDX8SsRP3ZYhK
         rtT+Sg8YfkU26n2FxVQThihPVixMiTxjmNdoePvDCw5B3l/LXZtGTGD1C3Funwv/Mmf2
         h5VKgPWEBghIPi8DhRaqQnWw8NXUQBdOIyCMBzuzxOy7gi5EuJyNmzNrp9S1aZAk7KUN
         NAsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IE3Xu6hc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.19])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad7428c3ddsi45380626d6.219.2024.05.27.02.54.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) client-ip=198.175.65.19;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IE3Xu6hc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716803690; x=1748339690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bOlElLfh6dD1KI2TE0d8lBG+ud9MK9TNyMp5tAHlTXg=;
  b=IE3Xu6hcKckl3VflIGbhq7HsOvqlL2cGUuZd8gd4eM9uAuiJMfmZNITE
   xwFvc6UeRw87jwa7C9Xl00EmMKIQv6P12hm9axUb75g0nQCazOMujJDAp
   U0DqXobeZQgRGH/r0qDCmcdUKCTPTV6jvBNSQGTHj9DSRWLvXpyDomiaq
   7cCmVRk/q/DhbxSehqp7ujyScUVHxa61zfxHDR66ktPr+VqQ3VRJopDo4
   DcTR9CnvAC6md2wf6jEujJ1l+kk7TSRKc4HBrzi/ErpbHtGvZjYimfMqW
   exfXY2bEF8ToB9v2/gIuEHplaqjFwEXDPIlpxbQbn64q2c7lBYZwbQ3dP
   Q==;
X-CSE-ConnectionGUID: ZmXwJKj1Q4asQdDO00Tmrw==
X-CSE-MsgGUID: 2j79cSl4RImKdycN4nKmIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12952315"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="12952315"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:54:49 -0700
X-CSE-ConnectionGUID: J2W3lqz3ReiazifHEbmQ8g==
X-CSE-MsgGUID: 2F3XYJnzREybJy59y+QhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34599385"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2024 02:54:40 -0700
Date: Mon, 27 May 2024 18:10:02 +0800
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
Subject: Re: [PATCH V11 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Message-ID: <ZlRb+uLWumeVUN0w@intel.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
 <20240522211111.232114-3-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522211111.232114-3-salil.mehta@huawei.com>
X-TUID: ExvFiipNqUcg

On Wed, May 22, 2024 at 10:11:05PM +0100, Salil Mehta via wrote:
> Date: Wed, 22 May 2024 22:11:05 +0100
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH V11 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro
>  to common header file
> X-Mailer: git-send-email 2.34.1
> 
> CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  hw/acpi/cpu.c                 | 2 +-
>  include/hw/acpi/cpu_hotplug.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
