Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp186100ejo;
        Thu, 4 Jan 2024 08:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETXiPH3CzCGtCTKDmTtGcUW7nbX4iI98Zi7AdVkZ8alhULGdD1+a5pvL8k54AXdu71y2ux
X-Received: by 2002:a05:6122:59c:b0:4b7:4759:ac0c with SMTP id i28-20020a056122059c00b004b74759ac0cmr493162vko.22.1704385189271;
        Thu, 04 Jan 2024 08:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704385189; cv=none;
        d=google.com; s=arc-20160816;
        b=xbiwS8RjPf1NZyID3x672z4APg4GRKERzKsoFQGENAhra62X5CGYLp9enjaSQ7Dl09
         ky+d9IvCqgyxBbKv9RN2JEvG7RVp9Sy3TqHp1Ac68J5QsKUl48cHUVUokGbq/N6AltYc
         ttjStSsF4TVTCa6yl++dt1pEr7njXrzYMN7fb82Iz2BCURPMm1SEjl1AbyPZRB9CSWpl
         wj6OvfyTFx//nzuArD54YiJU3FXsYW35WP3g1A59bBr7VceDdjDCmYsgno1po49TkBu5
         ys+eSt7kYBTVfWTDaSZzGJBIKwBygPR6ot5mg6pQQI8Ny3B1i0Wk/cNbJdZU2MDe+XaH
         GeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ETzw13pxgK9Wn/XnxK2ycHa+lhvtUNccAgCESqMAupw=;
        fh=pRXqezJrTS1a4pXm8qXTsRBdYSObk1rfHN6W3e/lF80=;
        b=zg5/G+2faYPDz0XTNXLOdyRM2yA3bTTwbQ89T0C1BZygjz2E/VNkmAUWX3WNQ5a3U4
         fO0XnPRb+l0Trm+acRgklIF19rAyNDHu7Y3Mn2S1vo/L0mu+rxxwW/D1zO+paPb9bpWe
         39vSPciMdx4798t7GYkbAOVoWRmL3R79NnYFZ9EY8OrvCVJHFl3qZ4pLr8eNnZcpUayh
         iUpm+pZbdxNeIv/uVhBl1MBkd8xgS35Acf9yh0CcNVRGjk6PZDXkGgucHrcW2ZJtlTLO
         zWyPXv53XMj3kJa2+9S0hjLyPPkaHID/bXvPILzSpkhv4nRwOMYqTrHvfVyADIlIyobG
         9xqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YE8GHgta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a1fd904000000b004b2d6ce6395si4388209vkg.251.2024.01.04.08.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 08:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=YE8GHgta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLQRU-0007ZM-4g; Thu, 04 Jan 2024 11:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rLQRS-0007Wt-F5; Thu, 04 Jan 2024 11:19:34 -0500
Received: from mgamail.intel.com ([192.198.163.9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rLQRQ-0005NO-0W; Thu, 04 Jan 2024 11:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704385172; x=1735921172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ETWmTlJlHbaTTOuyM0EieSosO/J9p965d/zZA24U6F0=;
 b=YE8GHgtaHG72Igeei+/wGoYWgP8VS5pv+mqCtUNyXBKLchpoHeAYjBjZ
 /p++fpwYzto/ZwawnhFGJpmMbVs2QB0x2zPTTmneucdtjYo+jsK9/A4r9
 DvVoBjpycuGhdm1tPnqJuMJojqdAp4H+dtOZ23ywSzb4sQAMusCbz8vwd
 NfjAQD9TNjerFevHNdbDPrUaCCz/wWcB7DmiOq7bdiOmr42oNTXfqHQEa
 hB9Vb0mCgk6TDw263NPY6VrfLseY354y8Rx/1wku8SkFoUS2eiv0IZuWr
 MRVnR1Wx5K6gRpfLoJ6lGlsa5ygiTppKvr6jqvEAARD5263oWQuqvNkvK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4103005"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4103005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="28838743"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa001.jf.intel.com with ESMTP; 04 Jan 2024 08:19:24 -0800
Date: Fri, 5 Jan 2024 00:32:17 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
Message-ID: <ZZbdkTgmg3MsRjkv@intel.com>
References: <20240103172817.2197737-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
Received-SPF: pass client-ip=192.198.163.9; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.691,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lwJaWQrymEb3

On Wed, Jan 03, 2024 at 06:28:17PM +0100, Samuel Tardieu wrote:
> Date: Wed,  3 Jan 2024 18:28:17 +0100
> From: Samuel Tardieu <sam@rfc1149.net>
> Subject: [PATCH] docs: use "buses" rather than "busses"
> X-Mailer: git-send-email 2.42.0
> 
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
> 
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> ---
>  docs/system/arm/palm.rst    | 2 +-
>  docs/system/arm/xscale.rst  | 2 +-
>  docs/system/devices/can.rst | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


