Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4210085njd;
        Fri, 25 Apr 2025 01:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU72vPoA3p+y4mQJmHgY7oFuJsJPRQDt1O/5sqQ6m1HfXG3pSMyQNel9Qu6t3YNfunGH9e5YFk+zTunKw==@linaro.org
X-Google-Smtp-Source: AGHT+IG8n4SMQMQ4t1VDHO2MRp5YSoiarTfbZUBR6Hls27cdxIJXVu62/iL1z/DNaoMLWdxGU79Q
X-Received: by 2002:ad4:5c83:0:b0:6e8:ddf6:d11e with SMTP id 6a1803df08f44-6f4cb9e5107mr23309006d6.21.1745568513498;
        Fri, 25 Apr 2025 01:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745568513; cv=none;
        d=google.com; s=arc-20240605;
        b=bwdGW/VfGV5ouMGqKxxR3s0xMMyN3AGYUMYqxsv0rqzfsATXBtZhc+TaktDJ4jKUTw
         9NNCN/Z1Z1MsNHQIjwUNyJlpIHrKjKxiS0Tq8UC2bSERsXCQ6kDDIVrXTad+k4T4p3dS
         4hXzvedztt79NFGuMW3cDbgzfozjYufDBQ0f6NTTn22emD4RpLeGfetkz5ptQqqxXq4M
         9Q0slB3PyoTVc5aUNUVsKYyTY/uQcG4FhZwCuFcAi9Xa7yBbSNVDsmug9K7M6kETrMJX
         paRIyzFb5zy7eVq2WPc5yf6yAUnUAWCuDZvmGTVMPqUFHoPEe0Uv9MrndOxNuDQ4eJYi
         aMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=BSAOewodhRFeub9foa3Zo2NN+TwFjpqKBX2SrWYMGuA=;
        fh=Z5gh/o5ZL3xRtUwccechZMEA5ciId+Hw9EA3V2rP7fg=;
        b=hVtdojA3PjXYokFw2g2qYj5joMC503y6ike5G8q5wS2m7vyYi7h/ZELR0evPLMW6q3
         tegETAuzRQlZIr+GkPuSLbS2krYXaa2AnPTLyeVHBVO1nql4tgPsKdOxRSePpI78l1Nl
         yspxnPybAQp4AOEQBd9RGu+q9znfFIcrkHql9sbkqYavBiDABw+5kMdA8u6+QUuz66tn
         lhlS+99Y2wbtejFYkqb1LB7p/nJ98fdR5tqaH7qbqsMmd8KcFnqQhqlQDcxogCy8Mitz
         LFmIjhvA2nCDT6g01qOHNQjg1aflEjNeI5aspBP/IlKy/we2XnTtyhw2zDdTIluxj6jZ
         k5/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PK8aNYUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0acb576si32621916d6.203.2025.04.25.01.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 01:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PK8aNYUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8E6h-0007c1-Ej; Fri, 25 Apr 2025 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8E6c-0007b5-Q1; Fri, 25 Apr 2025 04:08:20 -0400
Received: from mgamail.intel.com ([198.175.65.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8E6Z-00076N-Q5; Fri, 25 Apr 2025 04:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745568496; x=1777104496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5KRtg0VP7RhePb2K1+43zCTF9YsbA4O/PrqeshZCb4w=;
 b=PK8aNYUoJuEx4LxX7TElVXurQieQYMXXBpZ3RGL36kmUPFlTlYXN4Mha
 HMVqFPQXubFI594kxQ97k+LFMGdCIHDb+Xb/y8ITMc6CJUMRWD74YDUbd
 iW9OWls00TXQpyvBYEcJrBWo7CMsa/2Q5XFn/t2502em5xy8USXgPurWK
 7WsY72cp9g4Eeq7Kzr2Vd6RU6ggLwFgB3Wbc8E7h8HnJI0ezB4QzlP5CL
 wwVmSzAWMROfubCWVicGrSF6QgL0AlEBV2K1X1yQwj87JAJvlidq7xinW
 pW/fOUMix+HS2QJKWLEJtDpj5bRGBLJ9mS0g3QX5To1nBbhbm8RTbhkyQ w==;
X-CSE-ConnectionGUID: du0OzITwRR+C1HZ2bU/X4g==
X-CSE-MsgGUID: e94w0k4vTQm5BU4pp/Z1lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47240146"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47240146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:08:09 -0700
X-CSE-ConnectionGUID: 2BKS4ujcSP2OGoMmWUBd1w==
X-CSE-MsgGUID: BElnjdbdSySYVUcokWJU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="163808291"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa002.jf.intel.com with ESMTP; 25 Apr 2025 01:07:59 -0700
Date: Fri, 25 Apr 2025 16:28:54 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, mtosatti@redhat.com, sandipan.das@amd.com,
 babu.moger@amd.com, likexu@tencent.com, like.xu.linux@gmail.com,
 groug@kaod.org, khorenko@virtuozzo.com,
 alexander.ivanov@virtuozzo.com, den@virtuozzo.com,
 davydov-max@yandex-team.ru, xiaoyao.li@intel.com,
 dapeng1.mi@linux.intel.com, joe.jin@oracle.com,
 peter.maydell@linaro.org, gaosong@loongson.cn,
 chenhuacai@kernel.org, philmd@linaro.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, arikalo@gmail.com, npiggin@gmail.com,
 danielhb413@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, flavra@baylibre.com, ewanhai-oc@zhaoxin.com,
 ewanhai@zhaoxin.com, cobechen@zhaoxin.com, louisqi@zhaoxin.com,
 liamni@zhaoxin.com, frankzhu@zhaoxin.com, silviazhao@zhaoxin.com,
 kraxel@redhat.com, berrange@redhat.com
Subject: Re: [PATCH v4 01/11] [DO NOT MERGE] i386/cpu: Consolidate the helper
 to get Host's vendor
Message-ID: <aAtHxmpV7ka1lseC@intel.com>
References: <20250416215306.32426-1-dongli.zhang@oracle.com>
 <20250416215306.32426-2-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416215306.32426-2-dongli.zhang@oracle.com>
Received-SPF: pass client-ip=198.175.65.17; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.84,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: wFVfHWtZC7cR

On Wed, Apr 16, 2025 at 02:52:26PM -0700, Dongli Zhang wrote:
> Date: Wed, 16 Apr 2025 14:52:26 -0700
> From: Dongli Zhang <dongli.zhang@oracle.com>
> Subject: [PATCH v4 01/11] [DO NOT MERGE] i386/cpu: Consolidate the helper
>  to get Host's vendor
> X-Mailer: git-send-email 2.43.5
> 
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Extend host_cpu_vendor_fms() to help more cases to get Host's vendor
> information.
> 
> Cc: Dongli Zhang <dongli.zhang@oracle.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> This patch is already queued by Paolo.
> https://lore.kernel.org/all/20250410075619.145792-1-zhao1.liu@intel.com/
> I don't need to add my Signed-off-by.
> 
>  target/i386/host-cpu.c        | 10 ++++++----
>  target/i386/kvm/vmsr_energy.c |  3 +--
>  2 files changed, 7 insertions(+), 6 deletions(-)

Thanks. It has been merged as commit ae39acef49e2916 now.

