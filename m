Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp314888njk;
        Tue, 17 Dec 2024 08:02:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhyLqBvDB9bQrE2KEpZdBuYG9ODN5eQ7E3qyoHasy5VKhBn+gtL9XOzU1XSXjbynOW5M6MCotab946UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGzdP7lZmL6C1gbDMtaVFVUv198eiwJ3VCWo/LjdmTwjlhUipKTSADzr2xPPjEwDrptOczY
X-Received: by 2002:a05:620a:84ca:b0:7a9:ad65:f4a1 with SMTP id af79cd13be357-7b6fbef6cd6mr3161265785a.26.1734451341500;
        Tue, 17 Dec 2024 08:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734451341; cv=none;
        d=google.com; s=arc-20240605;
        b=IsLKnE1whVMMbzb2AYym44AtMdDcf11ljTCDl17U2w8wwPwuHXA56KCaQ2hDyVCQBM
         /ZMp1B5jc6XgyUdXVxzzlS3WRErBFo4MElPn4+zvVopsFEp9ZqofhcASI67HQAL+Fofo
         DuUZUjptWS1AaI3zR7FC7Wi/dMDeEjgJML0QLaQ+YiDX3sXnrwgKOg/xQ8yx8qI7acb4
         psmxIlUDTVDx80W3pk0SS8TL5hxRuB23y/Pg6r2Ov0ZkQ2tbKBGClyq86foROfEaFXH3
         OFBDvzpodw6S/+zUr0UXCsZQD30TzRvOt2wGktYpv21VRTgarb/jCWHXsPAi47eOEDmW
         wozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6gYwm7SrRiaXJ+vICxbZCUjHSZWKuZaEaHLmAC2Xshk=;
        fh=wlyFZzgFxYGtaAzwSmjetROZmdJkXKjl84qp0zJQ1Ls=;
        b=YnCODV9/drHLrB/jdMwM96xHXj4ewNssiXS4b2clFN4YgTVaTzuOlIeMmS+xNsNQN5
         jbhh9FTKY+CbHD7TTq/WNiAJ3SGH6tRcI5QkVvCORxk+WRTvXX3/MCF0T8TSFZO6RPCm
         c/NwzpRlAVcrlDlSHpATR3G4mw5DWidzIrZLAjfBtF3H0++IV8FfLm5wNPoDUwiGrVfh
         /Y4gSYSdDSxhTEpNi9iy8LbG0e1oCkDhXv0NBsA0IwQ1e6Ou1Zty2pQGe17KfAvR9NP+
         jlJSGyUEYQFh/UslwPq3Jl0mEvk5k4ZeGUqGboFsinT4iuDc+YjBWJWHn2rRnSM4I0FJ
         16Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dM0taZ5R;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.19])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b27041b9c1si2143997137.460.2024.12.17.08.02.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 08:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) client-ip=192.198.163.19;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dM0taZ5R;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734451341; x=1765987341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=snrT2Ns6e36l2ymjYWcaUa+kTGd+p3goxe68uIQLrSY=;
  b=dM0taZ5RVXkwbOo4MjNXZsq61Rdb5kPf1wccoxv15KBgbcsf1RCX+gsk
   Vi1Opzvi37YMegfWf2cY/ZSg3WwJ1oJs9H/VczRIQIDdmxYP7uJnrrG7H
   QEs44mMV/9sqZTynGNMxyoAYwEN6Id5Q2isz59cNAsxdsR24YqZxYnbGu
   gGNf0hRoIoi3277acRsFgQBo64RxMfBG2sriSdLW2o0E/1YrwiZP4X44J
   WthkiN6oLpDg4KCofqBRhmbnKxB+uewmKtKYTyDTCPM29DMD70fbXdQOm
   prwdqXX4npuasE2s9qkLZIRV9j0ZQHDNQ/hVI1q/7FVR1bfD142zxTNiV
   Q==;
X-CSE-ConnectionGUID: D1TA7/1xSEa1/Yn3lwsudQ==
X-CSE-MsgGUID: F5okSx88ROyydZ5zKuZtMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34174199"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34174199"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:02:19 -0800
X-CSE-ConnectionGUID: FpTVphQ0QCe50Aevqj3iLw==
X-CSE-MsgGUID: YSqaj35bR1275uo0MM1xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98018723"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2024 08:02:14 -0800
Date: Wed, 18 Dec 2024 00:20:53 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH v2 0/7] Introduce SMP Cache Topology
Message-ID: <Z2Gk5Ta43HJ9ChAT@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20241217142342.00007d96@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217142342.00007d96@huawei.com>
X-TUID: VrDTRX/3rPKH

> Hi Zhao,
> 
> I wonder if this patch-set requires rebase for the new cycle?
>

Hi Alireza,

Yes, as some general patches are merged.

(Pls refer the v5: https://lore.kernel.org/qemu-devel/20241101083331.340178-1-zhao1.liu@intel.com/)

I'll send a new version this week, to include the remaining patches
(i386 path and your has_caches flag):

i386/cpu: Support thread and module level cache topology
i386/cpu: Update cache topology with machine's configuration
i386/pc: Support cache topology in -machine for PC machine
i386/cpu: add has_caches flag to check smp_cache configuration

Regards,
Zhao
