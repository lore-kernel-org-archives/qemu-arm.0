Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp650917njl;
        Tue, 8 Oct 2024 23:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQugdSAlFFCy+j5C6Ftbi+yx6onTEjRPIik/1QQVZQeEsL2mmk+f6BTevo7aCLtMbTM6r5c2mmpqi/BA==@linaro.org
X-Google-Smtp-Source: AGHT+IEhDEVwW1jVeS4LbeRYM+Ze9kveQBJlvlygOVRF5yUX1paVrmj1A+XYP28JCLIVGNLstGSo
X-Received: by 2002:a05:6214:1bc9:b0:6cb:9a1c:cfae with SMTP id 6a1803df08f44-6cbba93a7b3mr111950706d6.6.1728455711823;
        Tue, 08 Oct 2024 23:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728455711; cv=none;
        d=google.com; s=arc-20240605;
        b=VoTrlOzafCWpSMMsMdPwy+9pWGyr19sojzo2FoW2VwVwz44qE8q+IMgAoz03qzlRbe
         vLOV9GfPdrx6hj4M7UqAZVQ/eCZ/4VShWVdt1DmwgzzYT4+DZBAImWc4pUPB7KYvTfW7
         H4QpVUfB56M2Giv3a+c1HyDsrvjn/QRoViejlU9bBkUgLB52+4JS4kxzIJbmCGuRt6yn
         6bMZxtprVjKBMIsfYs+/66VcrhJdpg29KUHM1GWTy3wKQj5e+twOqOTTPONyAFfootgR
         Cw7POqDRbKkzTkdyrWhJmL6ozBGg+aGr2M5NzUwDLYMhWNiGjHwOG8pgmlsKu9Tup107
         mFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=htE3VYJenyMKxw39+IixCOHRLsMLvsJVv4UO1Bpafxk=;
        fh=wNgTrgmq0VRUyaeC2SHc+pkwJSD6QOmCg7MKZWreEQM=;
        b=RrVZp8Qa7jhDR7uIgHJaZAWh4Z4h9+eg51mI8OLgFHxZyUo+W4D1GwN5kRDACZ+Onp
         h/r1fXvfZ7oE9TLStJIAK24UK0w5u+JUXQL8nqlG4/S0dTN6MOXaj0PZhjnxgATI3G04
         Ine1SG0rMgvnEsrVuxAuR6RukW5TIClKscwz1n9sFLyNP+r2Gl6d0Z9CByE0qcHqN1n5
         QxIOsOe6wbVI6XZCwylaLSxCL1kad6F+QHY2Y8OdjWnfw4/rwQSRCw6TEQzPuCbzIudI
         CWd4HTP3Y+CUgsZlmpJACv1Hn9A5XaK7YT2bIoMyP5HNjHiqyk6/POptf8CcdyVJn0df
         snEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XaBYRAr+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.12])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbc71a8f6dsi23928766d6.335.2024.10.08.23.35.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 23:35:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) client-ip=198.175.65.12;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=XaBYRAr+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728455712; x=1759991712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oQRmH+fcm9FTEP+iuu4nyOE/JFb61Get/pyjqeqHQAM=;
  b=XaBYRAr+BFg4IVP8SzpEvdAqbN503CVcPUQEppo0Yjl+VI2kLEzbU+EW
   Tl2XWCnqaf8VMndvxXVcRWgq+oZbJajKbGcC+L4CdIhRSH6HgJyGeqSNI
   befaR/yvPklPxuFOEYwta+bB0YVbi6Wz9/gfqdsv9Z5JL5Q3g9siVgpGt
   WQB38i4mWCui3UIdDVA8R6qFTmQfvoIllTnVFSyJ/yQ7ihbD9z0JfEfFb
   xLMs9QPre80i3OA3FxrDR2h/vZ3BDgXduv/nbjlj7yb0mYQBIii47XFYW
   wHpva9JmRHmIVQGPafkKfWvbXOdLsuhgtLDcIXyK5d/GuhzWYa80XuKqY
   w==;
X-CSE-ConnectionGUID: 5wBlJ0WdRjCktEnwkA992g==
X-CSE-MsgGUID: iMW0TjEwSGeaW/L37BAC0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39127637"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="39127637"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:35:10 -0700
X-CSE-ConnectionGUID: J/jUx0I6T+GzB++A/NzQIA==
X-CSE-MsgGUID: 8hMyCA4ZRMmAb30/h4sbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76152091"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa009.fm.intel.com with ESMTP; 08 Oct 2024 23:35:04 -0700
Date: Wed, 9 Oct 2024 14:51:16 +0800
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
Subject: Re: [RFC v2 00/12] Introduce Hybrid CPU Topology via Custom Topology
 Tree
Message-ID: <ZwYn5ETRdd6dxfXU@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20241008113038.00007ee4@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008113038.00007ee4@Huawei.com>
X-TUID: 6ZnNtKgfOefy

Hi Jonathan,

On Tue, Oct 08, 2024 at 11:30:38AM +0100, Jonathan Cameron wrote:
> Date: Tue, 8 Oct 2024 11:30:38 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC v2 00/12] Introduce Hybrid CPU Topology via Custom
>  Topology Tree
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Thu, 19 Sep 2024 14:11:16 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> 
> > -smp maxsockets=1,maxdies=1,maxmodules=2,maxcores=2,maxthreads=2
> > -machine pc,custom-topo=on \
> > -device cpu-socket,id=sock0 \
> > -device cpu-die,id=die0,bus=sock0 \
> > -device cpu-module,id=mod0,bus=die0 \
> > -device cpu-module,id=mod1,bus=die0 \
> > -device x86-intel-core,id=core0,bus=mod0 \
> > -device x86-intel-atom,id=core1,bus=mod1 \
> > -device x86-intel-atom,id=core2,bus=mod1 \
> > -device host-x86_64-cpu,id=cpu0,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=0 \
> > -device host-x86_64-cpu,id=cpu1,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=1 \
> > -device host-x86_64-cpu,id=cpu2,socket-id=0,die-id=0,module-id=1,core-id=0,thread-id=0 \
> > -device host-x86_64-cpu,id=cpu3,socket-id=0,die-id=0,module-id=1,core-id=1,thread-id=0
> 
> I quite like this as a way of doing the configuration but that needs
> some review from others.
> 
> Peter, Alex, do you think this scheme is flexible enough to ultimately
> allow us to support this for arm? 

BTW, this series requires a preliminary RFC [*] to first convert all the
topology layers into devices.

If you¡¯re interested as well, welcome your comments. :)

[*]: [RFC v2 00/15] qom-topo: Abstract CPU Topology Level to Topology Device
     https://lore.kernel.org/qemu-devel/20240919015533.766754-1-zhao1.liu@intel.com/

Regards,
Zhao
