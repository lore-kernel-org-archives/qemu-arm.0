Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp959064njb;
        Tue, 13 May 2025 22:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+L1q50q6Fqiv0Ik8cS12YbIpb2O02TNN9HWpVQVBt3mEYDLocGkCZjNBmhzFZUm23lrkagWYUzWESyg==@linaro.org
X-Google-Smtp-Source: AGHT+IEEGHr214b2a1rICPvyTwmQ+QvMpuq/00nmWpA7IN4ZFus7sH03hvjbddSnnhBNzRmcSch2
X-Received: by 2002:a05:620a:2989:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7cd287e1660mr301861485a.14.1747199503297;
        Tue, 13 May 2025 22:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747199503; cv=none;
        d=google.com; s=arc-20240605;
        b=JWKvzEL/LA6hb/NUOJkJCX5uOv03jywW15Pp2yfrxlJw4yGsFFdhjLMa3jyXRBaTxQ
         KdUFQd4xdADB/OO2j/l6c67+BS0E0IWdG0Xu/9lY3HHVE38y92dzc8ozhWTpZ+6P/m9o
         YSmI37ib0oPHTmv7wXQ5PF/56U5QODrR33wbVoQPTGplZda0XcJgi+wH/QPJv/e4Ek94
         1H28d2pG+l2iPOKyZMAvS19+2ERLtpuX0spkRmp9mQJgHMoYkswZ7i9EOPoYQqgK75v3
         LlvK9rJ20xpQovOvADGICrnZamzqgRCRjp02wJYhhybCIh2M5yWnjGpbqAm0I9cECEN3
         iQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ukb4JLCkmzh0LL1pOKgHViMTXdL3WRqarYobf2Y7U3w=;
        fh=pTEE7dbRTXP6zTsEHrtl7TFOXOBJ0xhQrxWFt7XBBqU=;
        b=GxB6hsiDXmKNuUxsLqDjWUHILdSxOH2V/BVYO/Wivr5i8wW62JruDJ54gUiPe/ssii
         Myn0BwQiC0H3IEoghnQUoNY70qMbuEmG1QzXQSAsQDg+d9rfOre82Bh2fwy9l+8DtD0Y
         nPSWEP6c6FSdLZe4N5k93SD1iSqt6Znyiqvfc7WIha53K15AsOC7plwcIFmx6/r5ckIo
         5WAw59RuspjGL9DPiCIcvRMIBzmjh8s3Dk2Nl8IXTYoZXqa/oyc4lrJiwsRxQxOFPyMH
         F4M4agn0eLGRWaHVahdyOTK9P1DtOZiO63q1Rh2BE4dMJVwEvx60bEI1EwxkbnJauRyy
         2ghw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BSvQVRbp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fee98asi1251606485a.557.2025.05.13.22.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 22:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=BSvQVRbp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uF4Ox-0000lj-9D; Wed, 14 May 2025 01:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1uF4Ou-0000lS-7U; Wed, 14 May 2025 01:11:28 -0400
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1uF4Or-0007da-Tq; Wed, 14 May 2025 01:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747199486; x=1778735486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UNNz5FIvJ/cXIxaiZEfi5bWCBZhv2ZCY4UIp4PhuOTU=;
 b=BSvQVRbpqUDp/0vZ+i80vkSOXnaGWn0Jv9z5ogx248OG/cd/I/hlRmPr
 GH5tbjXR4uYicw8HJacn5IaCg1L7WSWjvbKrHWKKXvIE5JiTPaTTTFtrS
 PkcQCyD9CN2R5EnctbFNt+n+WuA0vbKd02ZTjKtuF8YN4fUIfAwAKNOIg
 985lM5ts/NMSJDdUdBJh+LKx6BmpZG5tCPYXVI7u75sNHLlb1viBiwbnO
 qdlAbB7WzPTtCzWH0x0m3ss/1vsOzcFjB/35JZNBO4g+7d3+5MknaNnAJ
 BqnxjZ8UqcpjMO6UO6HlGI/w6XcDhfoJC1DsEKOhI2OI/CPHLQOpo9nog A==;
X-CSE-ConnectionGUID: 334eVy1HR4K9SM4pfrVGmw==
X-CSE-MsgGUID: jmUlabDKSO2lbqTBqSZX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="74477107"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="74477107"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:11:23 -0700
X-CSE-ConnectionGUID: JIMf2Mp5SKqc1Xeo6bCBcw==
X-CSE-MsgGUID: oRVSeXRaSpWBlNMRE3ptkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="161221528"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:11:20 -0700
Message-ID: <ae482293-80a0-4b94-9c34-4a8d5ce18b49@intel.com>
Date: Wed, 14 May 2025 13:11:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.198.163.7; envelope-from=xiaoyao.li@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pV135K3LQ/Vx

On 5/14/2025 1:17 AM, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
...
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>   #include "hw/boards.h"
>   #include "system/system.h"
>   #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>   
>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>   

This chunk seems unrelated.
