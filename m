Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp483150ejb;
        Mon, 18 Mar 2024 00:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKLcMEqxBapZmi4pKNfPf3iDGD5jJ0jTYqjOOsEloBYKOtkiS0C9s8FifPcSPGpWtTLt9boT50opUelutrDje7HvTBRazn
X-Google-Smtp-Source: AGHT+IH+U24UunyVnI6hmk+02x+kWEe+ocuo0Tjnn+NJKdVakf0fJ0CslqQvGqJtTzBQH2iQ9pxY
X-Received: by 2002:a0c:e8c6:0:b0:690:f57c:b65c with SMTP id m6-20020a0ce8c6000000b00690f57cb65cmr11169756qvo.23.1710748757354;
        Mon, 18 Mar 2024 00:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710748757; cv=none;
        d=google.com; s=arc-20160816;
        b=jx0xw6TqjbVgcnVVjQvCKVp/YcpmhTfGNFGe0pzGq0DBvoVxVZbnPUrkGZ6hWWuPCj
         aDtmnVW8ronN8d+tDo+oslM77rKKi55JTp/7wLUChauk6hKr9EHePiJL04O7keh4nHN6
         0aeXthUV6VDhuDaByfILyqs7LZ6kRurGs7l+sjD8+cPoCOKVXGk1CKnrL81oSpTRgML5
         R9aZ9htDhE5Lx/E3PkWI+HqPgAZLWdcWazoJ8+svRweRBxtlPYPJ2N76boMj85xOzs1a
         xvmbvf7ZLjgGDDXB9YnRsUC3TDzzWdj36hY4cYNqnHOEVwUqnkCdtgJrUAlVpoQ6AFKj
         BwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7HRicsPfw2qH+R0Hv0lAfkLQ1AsWw2uQ8+b8w+OaAfs=;
        fh=MZYTlXB+bDczHuI0FDOhExBboyvTFrwhXwRBKJ8jQZ8=;
        b=ziRtIKsInUjr/Xvo4C0PHP+u7EnBSRvKjkKo45yQMMbeHarcp6g5C/Ztc34s4jnATw
         rpvOdieljk5bOMH5x9BGzJAtU+QZ+FB+d72Za8MMZ9/xFxc1CPA9AO0RjkM33EjKWzks
         bXD5qZzvkP9WVyn34ozacWG53Rdjeeripspk5QxoSr+/IdiQ84jAcFuE6MEUKwJIAC24
         bc19/MA6HTmL5Z8gzrYb73x9vm7IiJA/IHx6LoxFWAz1xx2eXCADGZoxwNRQKiWHz372
         ooqzhQ6zlogmt6Qp6SLRBbz4msSJVX9kLs/yqtDkWy0zhK1UFPkd8+EgsJY25wVtf47u
         ZLNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WfYgVq8F;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id jx14-20020a0562142b0e00b006961c193123si1576366qvb.304.2024.03.18.00.59.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:59:17 -0700 (PDT)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WfYgVq8F;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710748757; x=1742284757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K3oyBVjD9yERzrexxJjy+LSwuy7gM46KXG2e0fpWMCY=;
  b=WfYgVq8Fo+aFbsaE2zwgc2KUrzBFdcR4mQNfeO4IFK/vkwoT7yzU7Wih
   41k1hTC6SX1nh1fje2JAKLBjLpHe+2pxo/Vl9urCs95ejaxYBELG/j3Iv
   L2DvXwFskpVzYXEyIrlDlAhewmI/VYryzjdvdYArFHmUnzlSGhcGhF/zm
   kE6J3WHmmDs/17SSlNC+GHXCGuFbGDN0Heegl32oqxZC93YdDBhRGsE2+
   exSY7/IYLnEo5mskzSm5PXhlD9SG8e8D8We2siKtJlDDfvrc6HGjrG2bZ
   tVToQbVnXN86/eSgfO6TjVIfPIHmumDikYiQBHmYzDs2Qm1XguNyDJqGZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5678417"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5678417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 00:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="18072582"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa005.jf.intel.com with ESMTP; 18 Mar 2024 00:59:10 -0700
Date: Mon, 18 Mar 2024 16:13:01 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH-for-9.1 02/21] target/mips: Declare CPU QOM types using
 DEFINE_TYPES() macro
Message-ID: <Zff3jcV6H6u2zwtQ@intel.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315130910.15750-3-philmd@linaro.org>
X-TUID: ytS9518j+/Mz

On Fri, Mar 15, 2024 at 02:08:50PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 15 Mar 2024 14:08:50 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 02/21] target/mips: Declare CPU QOM types using
>  DEFINE_TYPES() macro
> X-Mailer: git-send-email 2.41.0
> 
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
> 
> In few commits we are going to add more types, so replace
> the type_register_static() to ease further reviews.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20231013140116.255-15-philmd@linaro.org>
> ---
>  target/mips/cpu.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
