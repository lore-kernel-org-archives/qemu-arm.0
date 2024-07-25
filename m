Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3672598njc;
        Thu, 25 Jul 2024 04:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTC3FBYvq/yz02I8mlg9xCBHzdAt//j2dVlb4kwCyi5y8EmwzGKE6kKlfjW6zGIMmMmRnYUVOf/QecXcBgj/mf3Vj8iQC3
X-Google-Smtp-Source: AGHT+IGa/bLmgTp47OLYvnuoaHnPncKd6Y/78+SatzrZn5z82YOm/UcEIdBUeIyjgMxbwzrcB0yv
X-Received: by 2002:a05:622a:5d0:b0:44f:ca27:cca7 with SMTP id d75a77b69052e-44fe92838bbmr17712861cf.49.1721907750147;
        Thu, 25 Jul 2024 04:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721907750; cv=none;
        d=google.com; s=arc-20160816;
        b=n4A9oqtw56fiKyznNl3+IBjR+U/OmW9m4ryO1AQDzHEMT85ih92xDcjCq205N7UU+p
         tWbcKq1c7XgRwDTiSLltHa82A7DtkvVdEYqXY0OSJKp+D32GWm5JvI+3D7R5/qEQdR6y
         p4IE5M+QywBOJXWymDNFf9j8L6Ul3m4qz334+i4gucbXm0OfG3I9/Z9xsoWvPl8ud/Ae
         Hppx/mgtysBrV6GS4h3vNNtLGahOCI+eZ8uWHOjVRclTIetuKVLUUutx9ufGtIZcuC1o
         YoHvpoLKqwTww6QkxhfWspCl6HwaAb640syNOnTWcQEN/zP5b9RUXIvEGltvuG+xXexv
         098Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0EY5y3z3K0vNh0o9c+x26oOWcq4JmzeFXNMAAOG3rhg=;
        fh=KxRLUwjVy9hgF82UJRC7XxI5XwQwXWNAIlKMQLiwiZU=;
        b=ojOi/GcTbYkEWIyZNegSUVS9tspnZ1sJURbFcWck0AYNeSc+hrfI9r43NzCbXLYDM2
         khYsxRFQO9YE6IPKxB+8UG0RR7DwEId/z7CBChbcI+9fWd0M4zyHrjQ7NcWUwtHSc2cc
         R+URKFPy2PDFMiJ4zh2h6OYzcYA/OE4BACvN0/x3TLrwbDNEcXyIP/tqPg9wl+VP2NKT
         FGAvflvvdT4Xflltu0MQQPQK3QjbaQEOoxlcrd03keyWKCaL6OmsA9OJb+oOCSfMIR7A
         ZuSe4xUvAz6s1RU0/7Ca5jP/L/LA+2LbJWDg702Py5PwqrWruEYPUaX482F+iGp9h+NB
         /L5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l5NSFWu0;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.14])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8159e4csi13334231cf.174.2024.07.25.04.42.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 04:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) client-ip=192.198.163.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=l5NSFWu0;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721907750; x=1753443750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KygXsTO1/7PsKHbHPRlx3mwu6GzCfvzBN5TuN2US15g=;
  b=l5NSFWu0a0gZDwKWAjEFXOGb9sYb0a3eTTLtdUTAEvf0pwcZiNT2uvJn
   5dIRIsJuejPUrAY8dl7PJ3iwMPrWrTOh6VLy9wZUOqHmja36LQC17k5Yh
   ZMyjbcm0+zIiHTxViUy5vFNNRcJCL/aDBWgWDDRLthi5Jz+Ifen7i/kY9
   gbwlXSJr93MTtqFJX5UgvwSmJ8InqSIoaw1xmdIM3ncH9oI+fo7OnW3Pm
   3vzJdd+cNn7eXue9V7T0WtgQuST3Z9US5fCpBRv8Bah7MnhfGuzJs66s+
   XXkbsv0TIweIkq5l0yxRNBorIWKyoNwrmRriKHrq9+3C7op6A3cmigJjo
   Q==;
X-CSE-ConnectionGUID: VeWVqcg2SaWNtEBvbIhtCA==
X-CSE-MsgGUID: FxFyrD1RTJGbNWAA9lVbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19818825"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19818825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 04:42:28 -0700
X-CSE-ConnectionGUID: 2Wsp4k4PRGSWlLWNJZuuKw==
X-CSE-MsgGUID: utSt5rtmS7CpNGoEk5uI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="83895660"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jul 2024 04:42:23 -0700
Date: Thu, 25 Jul 2024 19:58:08 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Markus Armbruster <armbru@redhat.com>, berrange@redhat.com,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin " <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <ZqI90B1jkfO4N5a5@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-3-zhao1.liu@intel.com>
 <87wmld361y.fsf@pond.sub.org>
 <Zp5tBHBoeXZy44ys@intel.com>
 <87h6cfowei.fsf@pond.sub.org>
 <ZqEV8uErCn+QkOw8@intel.com>
 <871q3hua56.fsf@pond.sub.org>
 <20240725115059.000016c5@Huawei.com>
 <20240725115902.000037e4@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725115902.000037e4@Huawei.com>
X-TUID: SebLKJihY4Sw

Thanks Jonathon!

On Thu, Jul 25, 2024 at 11:59:02AM +0100, Jonathan Cameron wrote:

[snip]

> > > I think I understand why you want to configure caches.  My question was
> > > about the connection to SMP.
> > > 
> > > Say we run a guest with a single core, no SMP.  Could configuring caches
> > > still be useful then?  
> > 
> > Probably not useful to configure topology (sizes are a separate question)
> > - any sensible default should be fine.
> >

Yes, I agree.

Regards,
Zhao
