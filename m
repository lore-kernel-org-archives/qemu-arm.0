Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp484323ejb;
        Mon, 18 Mar 2024 01:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI3QuoBlg7Abh+gIMt0UiKS/nG8faEfk5MMsqEaR3pjRNY9xW5z2Ty3f47XLsQZyaZwePEH9/l4Hyym1jVCeyAm47QcjHy
X-Google-Smtp-Source: AGHT+IFH8dydRF5LItoDNoLcZlX6EUNyFKmcjSgG8k2RixoOh1rrUMtOeXdtk6i+R1dGRTjCMEcq
X-Received: by 2002:a05:6808:3988:b0:3c1:f254:7467 with SMTP id gq8-20020a056808398800b003c1f2547467mr18222679oib.53.1710748894168;
        Mon, 18 Mar 2024 01:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710748894; cv=none;
        d=google.com; s=arc-20160816;
        b=yGNC4cd9UCqTgiNG3D5p+3sglbx4izsLvGT4vVzNz1HjcdwWsY8R9Nla65HjqD1qWF
         EB42uiBnGbgd8eKENEujzIOY/wWb5XZyzEJTPckV4hdVhdIl9yM13cX0EMxwvjrHJE/y
         tes4sCOSlbAD6hNk5vbZJbx6VL0m5zyFL9pLAUb4FAfM/Ujjq43Wt2xYbJ6Na6kX/dur
         6I64PMES0P/vfJswarN0Jlyyt5zf9LKadT8K1IvgaCF6bYBCPk56D2uM2PhgtOCFQ6CP
         Qh65yMZowXb1BX7pWWpiN67i2s2a8cOpW3Rdc7bwRfXB06wuJWbgNNdbb8ECdMDh8a9k
         Zxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hufmlqM3bdktBrP8CZJ/6lxpt9SSHxeRceSZf/8YVR0=;
        fh=uB2wdhfgH4uy3UM4rNZB23tkt0RwlXu9UGW56GKcL54=;
        b=fg+x70bVr511rcol7tIWk6+Wm85KpkWWojbNeDJdhA/Upz6yib8FbsrCB6fflihLS8
         KjYSahjYbKkxUcjOl5X3OMf2awr/BKNOhHgMrdC36l5gT6cJgMXEsFEbTbUIFnk55n9z
         dPyWEthNOcKJOEY3cufIFuoGkLD4AaEk17z4BHhCYiEOxTFUE1msYKQ5A+37ungSPXv/
         OyDHV867lu16KQGY6xNSqIxKWIK66TP1te+L6QEYLZ3vhbOOxSNcsoKtFeVpemwEg3YF
         uzvEV9NAQ3A57pSQqSqq7S4DKBo4IYQOEhVTW4oqWKfUFfYAW4M1JwgqgR/UH5kqXYHo
         l2YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dJBZpEet;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.7])
        by mx.google.com with ESMTPS id z1-20020a05620a08c100b00789dd902c08si7703101qkz.177.2024.03.18.01.01.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:01:34 -0700 (PDT)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.7;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dJBZpEet;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710748894; x=1742284894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fZpPZsS9Ek2UYqxKvyku5IJyzfot+3YHcbSDRPzsy1A=;
  b=dJBZpEet7hfQ48KfCLLE5nUgFgQeNlKQHK7prc0k4LJWDeOCn8Gzz7H6
   cXRAIg59Mpp+jeaeO6Sp7CeaH+I86lRv3dhHFxsmp/Nu18EvTZdCwnvVN
   Tonmd2nKcxu8stbu/0c8sdtvCmOQyUquPwRD3tQIFb9cIIlCSHsxLuQUo
   yk6RBLR5XXi20X0RbHK7cSA9XZ7gXvaNesPTBrZ9jWlkEhtsXgEcyMml3
   RNDSxrZl40ZS88oOsDwXBE+d8Pjs4iMUUm4BtaOj18xHQzsJmwzCCJ00L
   2glni2tvui9yC9iZsiyZG6wkj9nYGtyil5K60X85Pshe/7GboZk2z6UDs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="30982347"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="30982347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 01:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13487922"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2024 01:01:27 -0700
Date: Mon, 18 Mar 2024 16:15:19 +0800
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
	Thomas Huth <thuth@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH-for-9.1 03/21] target/ppc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Message-ID: <Zff4F3xCiP7x95wF@intel.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315130910.15750-4-philmd@linaro.org>
X-TUID: sJUKQKJih778

On Fri, Mar 15, 2024 at 02:08:51PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 15 Mar 2024 14:08:51 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 03/21] target/ppc: Declare CPU QOM types using
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
> Message-Id: <20231013140116.255-16-philmd@linaro.org>
> ---
>  target/ppc/cpu_init.c | 52 +++++++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 29 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
