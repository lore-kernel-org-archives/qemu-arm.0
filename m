Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3066218ejb;
        Mon, 27 May 2024 02:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrNW8um5OpSIWl8ouEDWGFJnIZ585EDoJG8P/ObOe8ogagFWKmCStx5aKWYi9YqL4Q0yaGMaURUMeA91iw+j25pHK21cH/
X-Google-Smtp-Source: AGHT+IHcbjG63SkPy0esvn6k1R9zo1FGXfxWynZfsYz6FgY0ftGj4bieCJfqeJUT1+ATBsy97JpN
X-Received: by 2002:a05:620a:4152:b0:790:edd8:ac18 with SMTP id af79cd13be357-794a0a300ffmr2134350585a.35.1716803628501;
        Mon, 27 May 2024 02:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716803628; cv=none;
        d=google.com; s=arc-20160816;
        b=AWSdrZrZYlsT89fExRRgZb5rveaPRZ4rnk74z0o/vBQf7SkxnWDnF64zbZ1VtnuJLt
         qmqff8KyfwGPjjoe7fOmWRDfXSv0Gb00BnitW+E4Qa0e2hOzOqUalgQdN2+XU2uGIJ8Z
         BdEKlYJgninC5eDuABmACZO7Fh2G5aRhJV2a8t1kMKIE5jw+c6cCqTgivGP0c2B4355Y
         IXJwQquzhzcvpa0P5dx58PdjqmHM+U6amFZeoyD3Mxp/ThT5f0LVMSni0tyQyochHV6u
         FFF7rJQd95WZKuSyxppjdOdk03jMimOj3vzwVh0QPsdYdnxuWrYCM7hueZ3l2GKxoirS
         HSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=MLyFWHViQsZcOy3ndell/Y/OFphanIopNZfYFOvGbLI=;
        fh=NCDCaEenV1FKGnNJQkxS68pmYnFQlt7M76oHdBH6Edg=;
        b=ZG6V9PAWeTLU0spqjM3tWQdehTaxGqAPZaDJUDHUGs5Wa1iJFO2AAYBxD0kv8Pjie/
         H8WI34wO8aLPkNcd5uk8/g6AO65Vb3tZwcvJ9FEliIykfwwhzxjjkZbXL5r9lBE1CnvK
         mDcPU9N78wybhUJXS09mAZhPe7IwZFBT1gr4fIdaPxIwnVKoiFma2KwmQeqUYkujqPNE
         OY7lUtJUXZyVhoBMemQ3pDXbjktRzFT44guU52YiM3wpzGfa6FX0ReVOA4puOMSBntnS
         EyqPZD3cSxrs88JA/DCp7pN5b5czHe3ZKp6f0POo/12M7JoL/XmGAvoGCuJqHIkondhc
         FNfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=E+S+CRKD;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id af79cd13be357-794b60af1c6si485099885a.136.2024.05.27.02.53.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=E+S+CRKD;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716803629; x=1748339629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUIk9Rus9L/HpaU1BXvE1EmkaCoph9S57b23c7qT2EM=;
  b=E+S+CRKDKf/fB0kHZ9aN3YMoxA/PQ//wCQE5YqhAtU7+D8/B4pKVF7SK
   7VWc7+DljjyrAJ8mFlVlDZMlk2GKRxNOqIfTkWuTMm4QeULEt+RNXbuKB
   oDm2CXVF4Ks+r9yyMlfCpQ4VtFCH+8Rt+Zf/bYAgAEnRIM12f2WRa940A
   Gd9XB6h81FQRbzTFR/ufkmEWiYfdI8I8xedkNpQqYN1M4W0VYWb44Jh25
   wtdtgYnuggbuXybsTOIZFK6ASMh2/lI46pEBffVQpafFG0ZJOBCCYN3sK
   AU5PPPddLQmjW3vFHNvzud2muIc10x17La1W9hyvhQ8Y4Ve2R0vrVPdQ+
   A==;
X-CSE-ConnectionGUID: AxELIEgfSlmxzJBpZhnMMA==
X-CSE-MsgGUID: +hEfpJS3QdyJ2iFK/Ts5vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13286029"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13286029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:53:47 -0700
X-CSE-ConnectionGUID: yeS/vLVGS96D9Qsre28CeA==
X-CSE-MsgGUID: /G/k4l2NS/uO0McdkEG5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="57904338"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2024 02:53:38 -0700
Date: Mon, 27 May 2024 18:09:01 +0800
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
Subject: Re: [PATCH V11 1/8] accel/kvm: Extract common KVM vCPU {creation,
 parking} code
Message-ID: <ZlRbvdTEcqgoEmuo@intel.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
 <20240522211111.232114-2-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522211111.232114-2-salil.mehta@huawei.com>
X-TUID: Cp0zN/EEmOcc

On Wed, May 22, 2024 at 10:11:04PM +0100, Salil Mehta via wrote:
> Date: Wed, 22 May 2024 22:11:04 +0100
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH V11 1/8] accel/kvm: Extract common KVM vCPU {creation,
>  parking} code
> X-Mailer: git-send-email 2.34.1
> 
> KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
> is spawned. This is common to all the architectures as of now.
> 
> Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
> corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
> support vCPU removal. Therefore, its representative KVM vCPU object/context in
> Qemu is parked.
> 
> Refactor architecture common logic so that some APIs could be reused by vCPU
> Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
> with trace events. No functional change is intended here.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++--------------
>  accel/kvm/kvm-cpus.h   | 23 ++++++++++
>  accel/kvm/trace-events |  5 ++-
>  3 files changed, 90 insertions(+), 33 deletions(-)
> 

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
