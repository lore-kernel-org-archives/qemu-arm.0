Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp484903ejb;
        Mon, 18 Mar 2024 01:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjbhdTMu3YU875LyI5DrXL07B0Ze/0WF4LsQ+p5ZdtNDtCAKVJjfK01G2js7Iw0Ki1OzV8zGlN0v1idP9ejfbKw5hehwI4
X-Google-Smtp-Source: AGHT+IFxAA0vI8r9jXgGzpbLLpr4MbNhHQ/tzoyvYu1A4buy4cQWvscBUH2IguXt4/n3WM7LiXG1
X-Received: by 2002:ac8:7c49:0:b0:42e:dd6a:5421 with SMTP id o9-20020ac87c49000000b0042edd6a5421mr12800472qtv.45.1710748963509;
        Mon, 18 Mar 2024 01:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710748963; cv=none;
        d=google.com; s=arc-20160816;
        b=rSv10EaeDntHoiQXGwBQGDZlfabOpgHlEPDWqIfTREYPLKL5d21D9yQCLatUD1S94K
         dZ1P8cSR3HFLUuDLpelXjVHVeKbu3sV2kS/iuZtfZ9mj3+U5ew1zIBRipImy/QLJ5zbK
         DHHecrL39FiEDGzN+0NVwMc1pt9qlOmX6/cPnfyoGGjt2aIV4jXC9JAzOtMR99Fz/o1y
         pd7wn3vmTzpguQ1JceFe4ZB28IIqU5zD4ZjrD3vriHZkkmGFxb066pfLiDSjPtbt6U4X
         CiVx+5oPPsle84ZW71Te9jmL9XM9sB49x7EXeFjnSjp5tYo3dUmNJgHIU8udUHBKPCSo
         hz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=F3VfidYMmiWqO9eAcxHajuJkdLVGmht1LTg7XOT/3h8=;
        fh=zkMQpKWb+NcwuoIGLTdDA+CpnblpqygJif2Ot4g5zPg=;
        b=FPbncS5gQG7PZKWtcDhSx+T+Oo5cxMbVqVA8awKyjZn5BH/MPaxI47LzeIiZKJHVS8
         wGpqQG7gV6jkqJFxf64AUi5AZ9O6DYCCIKSh9LvK4E85ry7hretTgOJAqWSIgUSNfSV/
         cg2K/LrKis82pWKVVztRxmEEPuraYr3RAg8WnU50c8Xu83UGYNL01FuogFziHHxsLDsU
         iyzl5DRs00sHnmzbYvpOOhN1RJ5MuBDWnb1wbkOH+FDJ+aHdxxBWxXOxahUxaQ4fCqQ6
         b1fyDYp1/OBebl7WL23Ke6dK3p2aSiwxiNsAp/cGlYirzWwgGHe52wWqNoAVt61jBJB3
         p/vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cWRjG3BB;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.20])
        by mx.google.com with ESMTPS id ay30-20020a05622a229e00b0042f5123b42asi3366330qtb.370.2024.03.18.01.02.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:02:43 -0700 (PDT)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cWRjG3BB;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710748963; x=1742284963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cqJcvdL48VXuIbNfE+AI+q7sdsjFin1f18ojzEELhDk=;
  b=cWRjG3BBqFqWZlbEhEIChi4pqrBT8YTsvoW043BLNrloYt9zF7qteqyT
   rqUD8lVBTtjJaAHyx51cznFk48z7dpdRovcW5TfZB97kT/+0aVFTFPT9w
   TVWLKXs6gUlgnbREMX0QFBBD+5pBACHqP7qOngb+MzrgcKKtmfXc7i12k
   v6DyaqQPFkjttx+7TztiEiKAgy37pVtYdxKxrGJ9B2YHmVgWoRWUjmvoU
   yMzQAnYzDCMwOC4bFqZnfOGHP78tIX0VsPx7vqI75VPx2gS8SnepAH25K
   LnZIYh3GUek8ifQ0QI+oY+cp7xg409geW+26JtMg/UYDrsQBXDCXjvtN3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5421377"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5421377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 01:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="18000418"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2024 01:02:36 -0700
Date: Mon, 18 Mar 2024 16:16:27 +0800
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
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH-for-9.1 04/21] target/sparc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Message-ID: <Zff4WwMvwfMXLurF@intel.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315130910.15750-5-philmd@linaro.org>
X-TUID: NvpXGCjkCdzG

On Fri, Mar 15, 2024 at 02:08:52PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 15 Mar 2024 14:08:52 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH-for-9.1 04/21] target/sparc: Declare CPU QOM types using
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
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Message-Id: <20231013140116.255-17-philmd@linaro.org>
> ---
>  target/sparc/cpu.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Zhao Liu <zhao1liu@intel.com>
