Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp645006njl;
        Tue, 8 Oct 2024 23:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYm0oCkY5rS98ScH273aoyhFISopm51H5/npTMd8wDi9024wCS4e6eZwe6+rdtx9fttInV5Wn/henXuA==@linaro.org
X-Google-Smtp-Source: AGHT+IFP34NXFfpjICOnzWr0X0W0JA7pr+01+0mfXa4oqQtT3rcl+eBe4qj2g4KbQfaH/c/Hqa/3
X-Received: by 2002:a0c:fed2:0:b0:6cb:cd05:cddd with SMTP id 6a1803df08f44-6cbcd05d58cmr8181026d6.26.1728454526877;
        Tue, 08 Oct 2024 23:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728454526; cv=none;
        d=google.com; s=arc-20240605;
        b=FUdlKSsfSnzCHexHyKssJjLD07tGHNAq3EdEjTaIg4PHge/pGXr3tmnEPBl1dpP8P0
         Fa/AtI3f/jLr8Gl2kxv4Kn1HO5xiy6JnZ2lP9L2MT8JKMp/9WKJbEAdxDFzNxXFoycgL
         TkjFf40ksof4/vD9U16r4hkCZPEzPVlcKUT7hu/6A3/ehmArMaB1t6AfU6SFPdU0KX19
         shBO9ASxXeWYamwaBK3IM+L50l8NCJZyqneUJJDFlxTt5S3UJnqBmh6FCAbbjRttysPZ
         HN14JlK9xLsb18YbjT+DUJMnPubtsxCiNcV0Nqq9ifnc13V9/SL1aPz4OzYyiEG05Q7e
         4hDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=wcs4lSe22FY8atdmkddM1Ko6yCan67+3o9sEMgCTe+k=;
        fh=wNgTrgmq0VRUyaeC2SHc+pkwJSD6QOmCg7MKZWreEQM=;
        b=cKLK1vnWvyh/wuoPfVtcSV76K7lAAwVIdchPcUL/EkInlC7C6QLuckTJt0GvZl+1y0
         RfRT8NPYbyPIqaJhr/8uwsnAc4RmuPJJHCxuOlL0E+0nixl4Yyjw3N4jrX2GDhP85mRe
         p+uDW2n35O/mmdHHeQkqZ6hZKgLF75X7RXc3oXxTNpRyrALw1lCotbSUVgzZR78hrZNR
         fuFy/bFCCWk6QpgjFKbrmYXJkiQmQPG0zhOMV4/nE9dtkxqjJUlvofly+bdELGmsxNCT
         Av2Uvr8tjgXt+3SSQcPErfha30D6AbS3XFf9cGkRCRDvn18R23dRHh+vzUWlF4DPU3TY
         Tcsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZgNDbOzM;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.14])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbc81253bfsi15156526d6.526.2024.10.08.23.15.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 23:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) client-ip=198.175.65.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZgNDbOzM;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728454527; x=1759990527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lt669vuESF+NLlyNvW3nMfB5lZgQCn13KNvjj5g2nMs=;
  b=ZgNDbOzMH3zgVrH2FKYGCfK2ID1b4HmWUatnQYTk6xZeYbGNw8bADUn1
   ZxO6ZMKpPlNnmztuZKY9Yi+KgIRBWYjhsDZD3NXBx0DnqjSaaJCiKFSge
   JvFl5JDBgshLR5HhBkQkX2X5lU413ibgbEJYgI4+mTpOuSjKAoqsCKGzd
   5K2KyQPO55NSBmx0FlwSnkDNUshxNyhB++KyrZAjaerBuFWlclbsHYPS2
   dFdeF27x+DDqb+Tl03gpiHCvTV4BnsoTAMyLD4RokKEfEd620XrKcBFwQ
   HdL9Niy9h9Px1rEDhzBaAudySKWVuRlvBS4uyMUDi6MHxmbtxOj9cF4Bj
   Q==;
X-CSE-ConnectionGUID: z8Fo5beLTD6xkkkeb/+ajg==
X-CSE-MsgGUID: NnWpUI7sQueyWRPNV3/Vww==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31513099"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31513099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:15:25 -0700
X-CSE-ConnectionGUID: UnMqb4StSIaCs9/73yv3Vw==
X-CSE-MsgGUID: kiLaGcXURCyU7A1OBQ9Q7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="106901495"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Oct 2024 23:15:20 -0700
Date: Wed, 9 Oct 2024 14:31:31 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC v2 03/12] system/vl: Create CPU topology devices from CLI
 early
Message-ID: <ZwYjQ2mEa2OP5r//@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20240919061128.769139-4-zhao1.liu@intel.com>
 <20241008105053.000059ee@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008105053.000059ee@Huawei.com>
X-TUID: WzH3XKIYQ9eB

On Tue, Oct 08, 2024 at 10:50:53AM +0100, Jonathan Cameron wrote:
> Date: Tue, 8 Oct 2024 10:50:53 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC v2 03/12] system/vl: Create CPU topology devices from CLI
>  early
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Thu, 19 Sep 2024 14:11:19 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Custom topology will allow user to build CPU topology from CLI totally,
> > and this replaces machine's default CPU creation process (*_init_cpus()
> > in MachineClass.init()).
> > 
> > For the machine's initialization, there may be CPU dependencies in the
> > remaining initialization after the CPU creation.
> > 
> > To address such dependencies, create the CPU topology device (including
> > CPU devices) from the CLI earlier, so that the latter part of machine
> > initialization can be separated after qemu_add_cli_devices_early().
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Other than question of type of category from previous patch this looks
> fine to me.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> However, needs review from others more familiar with this code!

Thanks!

-Zhao
