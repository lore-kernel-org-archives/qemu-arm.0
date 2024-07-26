Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp326248njb;
        Fri, 26 Jul 2024 01:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsqCNYZTDqlxTUvXuMb20yi4PB3gN0q+fYtZ1+ufZ1yrHYDHhsZcUgrDaPANjDfwJDis+LQcWqxgc8XLXtDvgEFXVvvT4p
X-Google-Smtp-Source: AGHT+IH9/kJpBRpZjjWf4CbWLNtN8+VB33X+/9hiYOb2+MepMLC0Hamd2/80rOA8sdL0zbf/tfqs
X-Received: by 2002:a05:6358:278f:b0:1aa:b9f2:a0cf with SMTP id e5c5f4694b2df-1acfb8f2764mr597130355d.17.1721982706586;
        Fri, 26 Jul 2024 01:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721982706; cv=none;
        d=google.com; s=arc-20160816;
        b=D8fwKQsL5MtH+6ZO/C79F5JuSdx0t2Z+VIqEOrXtUvCQXJnuObxBBRF/BqcFECbKTm
         3vwnS2loPma8K6A2SWiSHNV6ndd5Oyz1m7SY4P4Ac5T4iPCUYhBTFid48GunTnCBQSF1
         QUTBHPpzTKQqXlGrtgPzpo3muP2cspP+EkvUBFTi08dGio/xRBqLT70ka3AjEWpqaRKj
         6mgHto2ULg9wW6nQthdpUA95iL88gB/qTdVKmShr1eC5HNVT1Zjbzd/oxiGd39mqkjsQ
         EFiUVAG/DHGROOOYXBGQLjMbqT8N/PlbB9Wn8ub9aTiHVZU0pvYxbyVKreVDV4I+kYA9
         vUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7OyokaZGVXCRiPsdprdhJ3/U6anM/wFf4QauyfT1fbw=;
        fh=Ag8fHTgGw24Cz1hIHiqjRb4nsUUoo3g+vnMp8d9xND4=;
        b=H4tNfUsmyL9N2oi9EgB8bQ/19aUE3p69it+ovm9DybkndtMx8law8Mog6EjvF6rWgX
         wqVqmLqPrKNFMAk5q+LYFlHes1hjqijXevxPC/FB4AQxYTDR5tdSnEBj8mZdL61D1ao6
         yyXW9SG+7oArzFrXKUAuGbKDAEf+lpc+F93RbCNO2Z0Dap8EJpiD89mf1D+tTOR2Bd7y
         FuBRToNQSi/eseTr/eroY9lOd2CGcUeb6VHBwe4hobiqnWj95wnM1tCt+4okNlnXSz0m
         ZZOMUMNLnRqwq1otekhBfcRmdjjVstjAc1zqKwuVYofyY8MW+eN8AK/Fz2/PksWQ8M4Q
         d6Kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XihyBbiV;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.16])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7460733si361312885a.384.2024.07.26.01.31.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2024 01:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) client-ip=198.175.65.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XihyBbiV;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721982706; x=1753518706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1TTAQgqV5Lsq/BVcPUOuVC2qkQBDtpIDqrvlF3oUl8=;
  b=XihyBbiVRjk//qvmLwTZ0PeM392iqsLDjG7gMO5lclBn1R80a+ng2OEZ
   wLkvvv7QlPhZ8ztnrNWI1saVhyr1V6OYn2vdBNyfgb0doYqhAI8tXbSzw
   nTfALsmUaFghAWPvMbOU7WG37fwFq7PKe/H+ISCGI5Ut538uHKnQPlTPq
   wZLB9PXSGG3QgpF0BH9z+5Z/tbSgW15QHGKLr6jVksFQo5oKDyWx9+h7r
   /5KxjqEU9g4l0HX4tecceoq569o58tOs9h3d5fvhpatap4tEewBklSCvF
   nDeneMV7QM/CvpU01wpNbtwBG3MjZGFDvlFSzlGtDPRcZrudXOi0za/+7
   g==;
X-CSE-ConnectionGUID: LF2P2pd+T/COp+Tfz6oLdQ==
X-CSE-MsgGUID: B/Lz6I+dSui5fQAiFwxpVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19904918"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19904918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 01:31:42 -0700
X-CSE-ConnectionGUID: xq+6sqHzQy6JDuZ6Q7lrGg==
X-CSE-MsgGUID: 1xN54sKzRsK8w62sthl36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="83835655"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2024 01:31:34 -0700
Date: Fri, 26 Jul 2024 16:47:19 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
	peter.maydell@linaro.org, maz@kernel.org, jean-philippe@linaro.org,
	jonathan.cameron@huawei.com, lpieralisi@kernel.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	will@kernel.org, gshan@redhat.com, rafael@kernel.org,
	alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
	linuxarm@huawei.com
Subject: Re: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU
 unpark logic
Message-ID: <ZqNil8XHVGf9XAPW@intel.com>
References: <20240725145132.99355-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725145132.99355-1-salil.mehta@huawei.com>
X-TUID: NZVDOYzpRG76

On Thu, Jul 25, 2024 at 03:51:32PM +0100, Salil Mehta via wrote:
> Date: Thu, 25 Jul 2024 15:51:32 +0100
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark
>  logic
> X-Mailer: git-send-email 2.34.1
> 
> Loop should exit prematurely on successfully finding out the parked vCPU (struct
> KVMParkedVcpu) in the 'struct KVMState' maintained 'kvm_parked_vcpus' list of
> parked vCPUs.
> 
> Fixes: Coverity CID 1558552
> Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU {creation,parking} code")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Message-ID: <CAFEAcA-3_d1c7XSXWkFubD-LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
