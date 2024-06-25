Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp712925njc;
        Tue, 25 Jun 2024 09:03:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXURKKzm1FWsfidMjhzTfZu5o/UcxS01QDehtc+W6SjFugAGwCVOQQiJB33SJSEMZJTdH/VkK7suMCThp3aKlpQymhaaI0T
X-Google-Smtp-Source: AGHT+IE4uDx2Saxzp2oEug+CdTEzfgj1zE3gE6ibrWRp8CXTx8E6EcA/l58pAcJ5tuDXd2OdW7y3
X-Received: by 2002:a25:a366:0:b0:dff:2a6b:e3a9 with SMTP id 3f1490d57ef6-e02f9ff4594mr5586048276.29.1719331408258;
        Tue, 25 Jun 2024 09:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719331408; cv=none;
        d=google.com; s=arc-20160816;
        b=cX2tAYVMRezKgJQdmVRVHCdffqH5XdtSxErwWUBQPubA9CepcD9d1ZK5+UNXvPs6t7
         ACd+eU3aGuDhgu6fVW2KkseUYo9YYBQ0IKdMmf3dHiDrJlvboKIp9klCPj7TF+GO2FW0
         P2R2gXBL3soPo67qToBhkoHNsTEC/0Y/zyRLBhjo/j795JiobNbvcJiese0YFIMhtsoo
         uDdjBHEo+sc1IAdJHoTXl2QZmr9uJr2lKmCWgYN7G9tfr2fgMosnM1J1xNknxRYQ4x3e
         qVXpp6dQnTmwuBTneAgpGoCuS8n2+26Js0IpNjSJgqi1mbL3nZ5aTleiBgXJ4cU+NHYS
         wExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TRbG+K1LwoUInwTBMdDvHBgdApTQuA0zgQR/5LXAROA=;
        fh=z79M7mqy30c9iBZgmOpoJqa6bCTbd+F6gHOitsaqorc=;
        b=AJnJ+Utf1S2HG3M4Yo+/Ck7Q6W7XExr7myY3kERarhN3+svb5vas/EKn8iB+QKY0K2
         4MPXDqFBYQhqbo6Q3MdvtSOUEFxiax2v3zUPQO9Z6Jxt65HdGgA5i+61rDewvnPSTcCK
         p99wBPHZ9WU/jCabDNgweR45Ohl7LPwsUTpyTlmKM6w7OE365+CzNPVc9UDGuRKNFytq
         ibQ+2VSLInZW6B7CnBB5c7kziAOx9b/nWfqpTkoK4tXe/qladwPM2nXws/8O4by7aLez
         UApzeKQ4a+Ti24TZFhMoqBd1wmJw4S6xIcanNylL7mYA+NgMSA36xDe4nCxRpbXgbYBe
         3pGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="M/k1gba+";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e02e65f5748si4959173276.645.2024.06.25.09.03.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 09:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="M/k1gba+";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719331408; x=1750867408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aqtR3/KU2BgFo+Rt5bpSW19OPfURXowtgqJrCWMwTto=;
  b=M/k1gba+zXVJzjhdMDMKmzRZ1AVW3dIkZPLDy8RH4PEqclNVqsrXsK4a
   wrB5b/NQ5vwLzrhWej/W2Ki2LTVUDc3FuLINgqTXoYwT9AFktuLroGbSR
   Zbmpl/xSvhI7k5DpEYwNXXcStNcxrOmZS6Zw7463uI62iHhVoEB6hTGrM
   JieHVAy0Fn6OFCNKQttX6KL12Sh1iePHgLe8Oum2q4zwwlM10XUb30BuP
   zHm7RWKXzmkZdFWgKvrM+whfotROCz6M1Y2vl1Zvkwm6kvcZA3J8I1LTi
   espeyPmiQ4Wx+ZP1PJ/KYFCiBomKRVBiiNGD2SVdlpPjUQ2RaJIgSfeWd
   w==;
X-CSE-ConnectionGUID: C9xs2olDQke0KOJocoi62A==
X-CSE-MsgGUID: FWC3URokR8WlRdL0xGUdDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20138446"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="20138446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 09:03:25 -0700
X-CSE-ConnectionGUID: q1TTNfjCSSOZQQDuzM+KzA==
X-CSE-MsgGUID: G9h8UzVKSUKFgZcCn1LrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43765999"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2024 09:03:21 -0700
Date: Wed, 26 Jun 2024 00:18:55 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	rowan.hart@intel.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org
Subject: Re: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
 x-pl011-rust in arm virt machine
Message-ID: <Znrt77XOc2YBNZyM@intel.com>
References: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org>
 <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org>
X-TUID: DQY/8Xqa9AIv

Hi Manos,

On Wed, Jun 19, 2024 at 11:14:02PM +0300, Manos Pitsidianakis wrote:
> Date: Wed, 19 Jun 2024 23:14:02 +0300
> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Subject: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with
>  x-pl011-rust in arm virt machine
> X-Mailer: git-send-email 2.44.0
> 
> Convenience patch for testing the rust device.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3c93c0c0a6..f33b58ae0d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
>      int irq = vms->irqmap[uart];
>      const char compat[] = "arm,pl011\0arm,primecell";
>      const char clocknames[] = "uartclk\0apb_pclk";
> +#ifdef CONFIG_WITH_RUST
> +    DeviceState *dev = qdev_new("x-pl011-rust");
> +#else
>      DeviceState *dev = qdev_new(TYPE_PL011);
> +#endif
>      SysBusDevice *s = SYS_BUS_DEVICE(dev);
>      MachineState *ms = MACHINE(vms);
>

I realized that if we want to merge the rust pl011 device, then this
patch or similar enablement support is necessary, otherwise, the rust
code is only used for compilation and cannot actually be run...

This is also an open for the devices that are rewrite in Rust.

I think there should be an option for the user to choose whether to
enable pl011 in C or pl011 in Rust. What do you think?

Perhaps the easiest way to enable rust pl011 is to add an option for
virt machine... But that's certainly not a long-term approach. I think
the ideal way would be to allow rust pl011 to be specified in the
command line via -device, but this approach would mean allowing the
user to create pl011 and would require changes to the current buildin
pl011's creation logic.

-Zhao

