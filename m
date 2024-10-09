Received: by 2002:a05:7022:110:b0:8b:e46e:3391 with SMTP id 16csp645619dlk;
        Tue, 8 Oct 2024 22:55:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaS3p/PTnpPwQV+0+Bri39NVQJm6QLXwdsgMIYxmsX7rx62BM/kmEkfPc+On5UN0KgTfNvqyDyCReQig==@linaro.org
X-Google-Smtp-Source: AGHT+IHdraR5Fam7S97zPqkaKwuK+/5+NIyq4dx3vrdvBIZnmbUVb9ajyLnsVeLavg4dB7VkQgte
X-Received: by 2002:a05:620a:4416:b0:7a9:aba6:d024 with SMTP id af79cd13be357-7b07954794cmr191219785a.43.1728453303108;
        Tue, 08 Oct 2024 22:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728453303; cv=none;
        d=google.com; s=arc-20240605;
        b=B33oCaHb3X5LeysS1baAAOYDd4+8emUaxFJwoIip7V/d5Msov4B1E+GQtQsHmyb4Lq
         qSbFtnzkFK4VUzMFZ3akh1Y7YVldkREPtdSNjHRDaSDY1E4QLNUuisb9+Fy4nvhAWbeN
         +ZzrRBCe03rt1dj6Yb+PchtLseKBBv15u5ZpMjjQxiyq7fS5mV7xVlGkM9b7Wb9TFOoi
         XesiCZ2sVry1JDvITJnOUfMgxA+1G2Aj5kcdDAf8au7yUIsL/iABZcDFLdAmLqWytb06
         81wvRd8vz4TDN5B0RCjoPfEBVI5h419aguVVvRLosjjz0q6PsfDJfU9mrb+Xay9wSxHl
         zgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FsoLjUC+s29ssEpdDIAdIVJYTTgiYllIJorw7y5zt1M=;
        fh=wNgTrgmq0VRUyaeC2SHc+pkwJSD6QOmCg7MKZWreEQM=;
        b=lJdSLbZTSBwSAZRWfbsXQrFCuL+FuPESswEa3DNY4a71Q812T1WIs6AAkwuWW6fC9D
         UStAnefTNrcGZYznLQqtlaXYEIT4kIfdpPuNOshtDN3RRb3G/Li474+Bw5GKN73uSs//
         i98OxSpESV+VqS7GeKdhEYS0D9+uZreh2Tu4Mr4Hqf3r8cQtmUkxfNk4ywmqKc1cz28q
         /Pv5Sgz0bC4Qass/UNAEAvYjhBz0cSuagdvp+V5sno0KZ+DzbZiqeQbrKs0/yHtf5Nlc
         qwLfsSiJkABeNoTazsct5Upn9T4k/Gz++X5fgHOQmTvpM+uDStBLmv86+LDdk6K6fWWo
         /uww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kd0TVzyc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.19])
        by mx.google.com with ESMTPS id d75a77b69052e-45f09b3bda0si13019181cf.614.2024.10.08.22.55.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 22:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) client-ip=198.175.65.19;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kd0TVzyc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728453303; x=1759989303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wMTrGWrNqEJ/3vJS5OVwKl/YUiB1j9er0HSj6wg9YsY=;
  b=kd0TVzycxlRUYU57o0GMEExRDoG2pVlTJ0tj3or+/KY2KuDHSYg+jIch
   5Itb6gpjqKhXjXVpGOwkUuIgZnGI5YhUq1Xjedqqtmn3DqNW95B/gx7hJ
   rmCzJ5/Epq4P8rqN6K80CkxBTaLp2wfkt+9/dmAsnXGe8u5GBeLbcoCS0
   IA71TZ+QxUB2JGC3TzvspQ2NJ/pMRyzUyGBZ3Zd6+QI97SQyyodP0BaGX
   DZX1itZHkKg2rsGnonfYZHr51iL8TSqmcw7olC4Nv9u7QFvMuK6B/kTPS
   AWfYPxGieJGMqUgyN5ulSI6UTyhJ6pCswCoLMPYihtzNwQZ2Lk4+PeN74
   g==;
X-CSE-ConnectionGUID: EiXB2LVdQJefXCIHVgg72w==
X-CSE-MsgGUID: X30FN7bqTCOwvxMm/cMByw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27623659"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27623659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:55:01 -0700
X-CSE-ConnectionGUID: tj+D1EMQTfGPh480WuhJkQ==
X-CSE-MsgGUID: jqH4fZ4+RSaVVwxcKVhkAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="81154308"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 08 Oct 2024 22:54:55 -0700
Date: Wed, 9 Oct 2024 14:11:06 +0800
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
Message-ID: <ZwYeek8iaoE2fu+C@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20240919061128.769139-4-zhao1.liu@intel.com>
 <20241008105545.000013e0@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008105545.000013e0@Huawei.com>
X-TUID: gskyiTsiJzTQ

On Tue, Oct 08, 2024 at 10:55:45AM +0100, Jonathan Cameron wrote:
> Date: Tue, 8 Oct 2024 10:55:45 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC v2 03/12] system/vl: Create CPU topology devices from CLI
>  early
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> 
> > +
> > +static void qemu_add_cli_devices_early(void)
> > +{
> > +    long category = DEVICE_CATEGORY_CPU_DEF;
> > +
> > +    qemu_add_devices(&category);
> > +}
> > +
> >  static void qemu_init_board(void)
> >  {
> >      /* process plugin before CPUs are created, but once -smp has been parsed */
> > @@ -2631,6 +2662,9 @@ static void qemu_init_board(void)
> >      /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
> >      machine_run_board_init(current_machine, mem_path, &error_fatal);
> >  
> > +    /* Create CPU topology device if any. */
> > +    qemu_add_cli_devices_early();
> I wonder if this is too generic a name?
> 
> There are various other things we might want to do early.
> Maybe qemu_add_cli_cpu_def()

Sure, it makes sense.
