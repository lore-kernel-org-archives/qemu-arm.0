Received: by 2002:a05:7022:fa0b:b0:76:3752:a982 with SMTP id sy11csp184730dlb;
        Wed, 28 Feb 2024 20:33:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLfYzwDxwJDhdkmQrbOzcwpB7jl46Ao/nzW6tdZbuRx6R4fM/OalBglYbrR6wx5GDcXSk+qhhVM1cxl2ybwlRcucpyrVJb
X-Google-Smtp-Source: AGHT+IGrUixEt6NyTyqX53CN0cUeAwCRGzlJrKfbm4IXa8AQYVqDWSmLVO8XH1wAYPMaMpmRKg6C
X-Received: by 2002:a17:902:ce8a:b0:1dc:cf17:8a70 with SMTP id f10-20020a170902ce8a00b001dccf178a70mr1149253plg.29.1709181199154;
        Wed, 28 Feb 2024 20:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709181199; cv=none;
        d=google.com; s=arc-20160816;
        b=0T5ttwPdGd5YEhgRMl3IVsXpsQXs7xQ+O41RddKzrHzPq86VOF88FOgLP3k0njrzuy
         stYgXnOgY/BWF0uZhzV1sj4p5Ur6FkbsDLrGHvYDwLTjp4ogMEgvbmdVvGdA2/lg0dhh
         zD7HcP6VCcNKN1OvgiP58Q4vK0w4GbDOW54WCGOtFxn1jYizP4OFfA4fi1D+fwfbx3Ek
         pywCbnL+kb2uwMp7w4fFZ27YWybTN/mCrH6vWi8YSCaAgsVsXSnf9Cxbcx78qrXGlQLo
         OrzCVKaWA2fzicWf5E2AT8KU8jm6T8GWkQgfzzs7G4XEUIuTRPN8+MKMLpU4m2pJ3B2D
         l9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zb88qiTrwS/aUUKzU37PAoVcS3fL/y1gRnyLEGS7HPY=;
        fh=LdQSP/IzOsJu2Z1R2sMd/3tGWWnW7jyc4/vr7URDKK0=;
        b=yKo7Ua3q7HJrefWQ31PnJLzsEPEBBfjbF5/4OmSm76dDW31vNFbdiQtJNd+9yrp+eu
         KPr5Em9cQS688Yc5WwbUbWird8rB84tWGa2TvJBX/D5eAeJ5hQjFgUtyoeyTOUzjo4dq
         QDy1+hT8uiA7KcBO9WO8MisinJiGZbA+66p/ctF59fQVvrX3WSI2KlQSFZ/Xm/DzEcpo
         ipXHQc4Zbmoa5KzQKSN61w78M38oV63A9Q04Iw5Cy2VNJqbyjBSxfNqlmOkh9oEXvM8h
         nbZvUJeHVR/oA1p/ge6M2rD9KvHTBBs9fxe86TeMsU2esVrsUbd/ijQ+8SeLuS+qLBCo
         GHLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GayKpWCq;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.9])
        by mx.google.com with ESMTPS id j5-20020a170902c3c500b001dcadae1e8bsi507127plj.357.2024.02.28.20.33.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Feb 2024 20:33:19 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GayKpWCq;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709181199; x=1740717199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K4P+3be7WkAmiqJGY461bGaJxoGNESikO7CzVS0rHDM=;
  b=GayKpWCqL6hBOgbY3nIHZ4aIKKfIWbG3ZF7ZtQY8qG73WkiolD1D/Vk3
   jSSYXIOKtMCVeuMk9JceiMw/+xlVfeC9WIbQYbhSGeWO+m3dFM3fF/W7c
   YGyoLmgEnCSIzzw/tyAbQKdghrER6BgDJSsr6eeKPd+tPbo+t93+rk+QF
   tx9SHbfN897Dj6iHBZgR9Eq0WebqWk69aI7WI/e42sjFgUhg84MpE/RWn
   7zI5UYEfJBJquBgHUhBmdydfjjmcSnMXjCcqH9Gb907x/HtC9VZUVQByR
   TWy4l+z3m02Oj1DJV+hKy5L59VYeU8pYxKpVKDUsQ7y/Y2wWTyvgwiy8y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14338811"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="14338811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 20:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="38526829"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa002.jf.intel.com with ESMTP; 28 Feb 2024 20:33:12 -0800
Date: Thu, 29 Feb 2024 12:46:55 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 2/8] hw/core: Move CPU topology enumeration into
 arch-agnostic file
Message-ID: <ZeAMP7OCwWPMhpeD@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-3-zhao1.liu@linux.intel.com>
 <BJSPR01MB05614B900DA2E93AE9F8E0BE9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BJSPR01MB05614B900DA2E93AE9F8E0BE9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
X-TUID: zfa7WZ+sBm3E

Hi JeeHeng,

> > +const char *cpu_topo_to_string(CPUTopoLevel topo)
> > +{
> > +    return cpu_topo_descriptors[topo].name;
> > +}
> > +
> > +CPUTopoLevel string_to_cpu_topo(char *str)
>
> Can use const char *str.

Okay, I'll.

> > +{
> > +    for (int i = 0; i < ARRAY_SIZE(cpu_topo_descriptors); i++) {
> > +        CPUTopoInfo *info = &cpu_topo_descriptors[i];
> > +
> > +        if (!strcmp(info->name, str)) {
>
> Suggest to use strncmp instead.

Thanks! I tries "l1i-cache=coree", and it causes Segmentation fault.
Will fix.

> > +            return (CPUTopoLevel)i;
> > +        }
> > +    }
> > +    return CPU_TOPO_LEVEL_MAX;
> > +}

> > @@ -304,7 +304,7 @@ static uint32_t num_threads_by_topo_level(X86CPUTopoInfo *topo_info,
> >                                            enum CPUTopoLevel topo_level)
> >  {
> >      switch (topo_level) {
> > -    case CPU_TOPO_LEVEL_SMT:
> > +    case CPU_TOPO_LEVEL_THREAD:
> >          return 1;
> Just wondering why 'return 1' is used directly for the thread, but not
> for the rest?

This helper returens how many threads in one topology domain/container
at this level.

For thread level, it calculates how many threads are in one thread
domain, so it returns 1 directly.

Thanks,
Zhao
