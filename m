Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp965875njb;
        Fri, 9 May 2025 02:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKKG4/gB4qHbp4QBB0sEMyvdmu+ta/xfSdyPAKDOSe/p1pSuOHlVyTIxLRE+flAVU/OQe2XDQjsfSnnw==@linaro.org
X-Google-Smtp-Source: AGHT+IEhzKZvOzNJgMSsdCo7GOXJ/wRHp0+jSPeDiSUu9I2jymfPh+iUj/thhYocrLrx1xcoBuRB
X-Received: by 2002:a05:6214:234e:b0:6e8:ff46:b33e with SMTP id 6a1803df08f44-6f6e481eed9mr45729946d6.37.1746782434711;
        Fri, 09 May 2025 02:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746782434; cv=none;
        d=google.com; s=arc-20240605;
        b=AQmIpP/bMj9+Af8wS993WAn6vpk26JGn8vy0PxUF++Xh5KyNnGcvXZAdcnnVHIUhil
         t6O4uLdzlHz3eeebdtpyjhyw/gzoMxrgEeT7cOXnJL9B1xGecqbmAKcDy8cKcdqv89Vu
         78Qg7T26yUo0KsiW+paCLylhD80o3FovuaQ7rIBKhu0nIQPXrPDocXEpW6gW0Q1GAW76
         4Sr1+R5q5nq+Vidwk5YOfoZGg9/JE45y9i/4/V9jHkGkxjgPXNAdo2lvd15PHK1tYCad
         MoTSaCxuNnMtij8EvMACMhp4FlCCQ3pBqUo28Fvef1JAoyzlpinbQ+Z7HvdOQ00geBZc
         31yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=BIk4jYWGwwo+UmWn3JkY4JvUeCvaoqKQ/e5V2qtQai0=;
        fh=XwZ+SlKA2ObuTzjRd0BDrVQXnQFFQXDytsanjW2699w=;
        b=NOL+Kq47ST9xeNOHK/okCE3y3C5WU/2UeO1wPampuA07jwNuFztif5x4oIft1zzKIZ
         EnQGk08RZDUYoGDPRd0Qz5Xjl9UHVe2RFV4AudOSn8YuLXae96GPebtPEcMOmSOivY92
         /U6T6AdxsYeFiGnqgXDdKiNQHO+WcSoJOuv9blCJFlg+Psl20vL28sKF5d4uRbYms79M
         xDo7fjVnJXZnnURaOg5M4xZtE4zMd0C+3qEo7UHlEVUYfkTAm9bRnB1YvcGYKWPfILGG
         pMQolFAyJG0hLnaOGQ/8gmaTgIrV0h8qQsllcQ1LiraXxQQflQoWAdu9vIwbdbACnrKo
         erDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dHt8WWzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f87d5si19915666d6.164.2025.05.09.02.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 02:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=dHt8WWzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJu6-0001H3-GX; Fri, 09 May 2025 05:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJu5-0001GQ-5x; Fri, 09 May 2025 05:20:25 -0400
Received: from mgamail.intel.com ([192.198.163.9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJu3-0002Pg-Dh; Fri, 09 May 2025 05:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746782424; x=1778318424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kODIGmR2DLKrgzRZSqcJHoCc3hZ1D9APKKMi5uxaGGw=;
 b=dHt8WWzvTBxHvKxZ3H3sYURuBklS9ppMjHNuGas/YBPyqYQukzQ/FVBi
 C+JS4cj5pLv7Fo+R8tHHTUNyUpzVdlCKD/PjZQUJbC+iaIB3Ap69311Sx
 lNrR8u8qt/ZqCkj7h9VMh21hsDEAohim3umxdQyNlfqom1DuQfhxjvtVX
 AYYbgw5rgyl4WA2eCofAJ+E8hbGWyxcbwWj2d0OvugN7yr2zEb59UpDrW
 PjcEKDY7sIosftaRB+zO3SQ3ykjmDKb3DwlPWTsYKXRpH1Dzp5e957EVT
 EK2HQtKnTHhR/363sfK4IbiSK52by7gswuoh7IrmJiOQU3V+zLDMZynUD g==;
X-CSE-ConnectionGUID: jzDbgJNpT8aSC9TUnEVa9g==
X-CSE-MsgGUID: ygw0paHAR1aprZdWAF7PuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59266555"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="59266555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:20:20 -0700
X-CSE-ConnectionGUID: /P8mN7A2QES7gH0E8F4SHw==
X-CSE-MsgGUID: AnR6l5RYSY6VCvLDhE6wgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141668588"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa005.jf.intel.com with ESMTP; 09 May 2025 02:20:13 -0700
Date: Fri, 9 May 2025 17:41:15 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 23/27] hw/i386/intel_iommu: Remove
 IntelIOMMUState::buggy_eim field
Message-ID: <aB3Nuy3qFIhMNgas@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-24-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-24-philmd@linaro.org>
Received-SPF: pass client-ip=192.198.163.9; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: h4ygB3iy5HJK

On Thu, May 08, 2025 at 03:35:46PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:46 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 23/27] hw/i386/intel_iommu: Remove
>  IntelIOMMUState::buggy_eim field
> X-Mailer: git-send-email 2.47.1
> 
> The IntelIOMMUState::buggy_eim boolean was only set in
> the hw_compat_2_7[] array, via the 'x-buggy-eim=true'
> property. We removed all machines using that array, lets
> remove that property, simplifying vtd_decide_config().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/i386/intel_iommu.h | 1 -
>  hw/i386/intel_iommu.c         | 5 ++---
>  2 files changed, 2 insertions(+), 4 deletions(-)

This property has a good name :-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

