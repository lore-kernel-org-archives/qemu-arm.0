Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp132302eja;
        Thu, 22 Feb 2024 01:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWu2BlQJWjjMrkqWDAHGH9dSW0MusgjC4qIpE3WT8wTFAoj7vkCMi8JXNpcJvPk0DIXR1m/bvNunix147rzAG4Vsylcz3GF
X-Google-Smtp-Source: AGHT+IEqcOIW4ie6zUs82Twu6TZj2xQgx96etEqt8rcclLH6aI6vwWYqxU9IT4DKY5JRciu4CQFr
X-Received: by 2002:a05:6214:2268:b0:68f:7f3b:5ef7 with SMTP id gs8-20020a056214226800b0068f7f3b5ef7mr13686663qvb.17.1708594877285;
        Thu, 22 Feb 2024 01:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708594877; cv=none;
        d=google.com; s=arc-20160816;
        b=S5vpNIdgaLwoGotHhMzIezPihooDvcojQnvsDyS1y4PyiNDr88rD+t5R8IIh/2CsqT
         iaVQLTf9tQQuOvE/m+moK6bc72+kGQeve02mlWp9irnLF+/WIlbau1DUB/xFRaB54vEA
         0XOOaPRd3Hl1v+xO6JB+e6I3qMlcYPG/Hgbv5FrBfJT61J3ankpI7VLjeOMw4FoWY4/y
         KGnLJvCcwYiBet3IygVFNptIxJjLds0CqQV4JnwX2Re/E/CY1f6QG2DcP5eYP4P7J7mJ
         PkSnBzmjzqTv259fcxAoQ97ltBtt84c0GwdkBKeJF+ky6dZKjyaExy9dVTq5xoGFTkm0
         mKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=e4qQNAmko1syAdAkczkLkHGu8RgoJ/abE2rejXhT/bk=;
        fh=OEJtowJauWSYbNXimmT2OA95p4z0HFKgueSgbq3tDLI=;
        b=kWS+JDaL6ifsll/3DqPT7PwqvW+RVONPZjFBbK3K4rzB3V8YGprqkPBwErSJBBIEMi
         9SiWi8pD2d5IISmzPC/JX9XffyHY+rzUR69820l7TcFS6PThQ/XCkRZXmy/K3/DNZdmD
         2altLkOpRpOxKlcH37IFgrAwYMeAGpHMq/Jjgh/o0HmideBFdlq4AlbLdYsGtFBsDUOc
         rlZBeVDszRlI/0c8HXAeXcAynCpWAwOLAYKJTROjSsTqU1IBO1NTaAtIxe8k21yLCrXz
         mxKsBmCxkjhNzSoTxgRAn84vQOKXvcGO5z3E34XVlnMY1P5jK+n+n0wDPMJs2twgRm78
         E2gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WJFUQ1Sd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt15-20020a056214048f00b0068efb778ba9si12911967qvb.349.2024.02.22.01.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 01:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=WJFUQ1Sd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd5Zr-0002CB-Ba; Thu, 22 Feb 2024 04:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5Zq-0002BP-1W; Thu, 22 Feb 2024 04:41:14 -0500
Received: from mgamail.intel.com ([198.175.65.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5Zl-00051A-5r; Thu, 22 Feb 2024 04:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708594869; x=1740130869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=//cILPlV8ZtEIE5OOllf2iCg88j8tXpTlvuQ7BDcJRY=;
 b=WJFUQ1SdFjh3Xmnfo/Z6EN3r6AQ5kP+q1hb3zKs2Sfx+BXwZ6ryHJJGB
 52NOuCbXLlLvZxKT7IB1OmgXjFWRCxyKgnEqbbsUT/r/jO2ADPNk1WP+7
 7sHaanUhO8J3cvvkmxef8MqawpjYGOYt0u/QMbomQ/yRvQQ3+3UIqk6az
 T5nDKox4vvWhn1pZBSNHLEIXijZgd+9DlVP1l3OzS1P4btQDsXGvWKA6h
 PqLbeNXVdo4umOEdT6lZrzBj9iNchX6npNEFlaTZa/oY6gfM9gBZIqqy0
 pmMcTuOwLlVIgCvDYD4ZZb70IGVLX1hoKv803aH1Yey7SdELNVByCNN4X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13936000"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13936000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 01:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5805540"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa006.jf.intel.com with ESMTP; 22 Feb 2024 01:41:02 -0800
Date: Thu, 22 Feb 2024 17:54:41 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 07/21] target: Replace DEVICE(object_new) -> qdev_new()
Message-ID: <ZdcZ4TPGX9ZJ0GRL@intel.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216110313.17039-8-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.13; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
X-TUID: 2k4m74Wl+Hbb

On Fri, Feb 16, 2024 at 12:02:58PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 16 Feb 2024 12:02:58 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 07/21] target: Replace DEVICE(object_new) -> qdev_new()
> X-Mailer: git-send-email 2.41.0
> 
> Prefer QDev API for QDev objects, avoid the underlying QOM layer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/mips/cpu.c   | 2 +-
>  target/xtensa/cpu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index d644adbc77..6b3909ee08 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -649,7 +649,7 @@ MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
>  {
>      DeviceState *cpu;
>  
> -    cpu = DEVICE(object_new(cpu_type));
> +    cpu = qdev_new(cpu_type);
>      qdev_connect_clock_in(cpu, "clk-in", cpu_refclk);
>      qdev_realize(cpu, NULL, &error_abort);
>  
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 79f91819df..4f9408e1a0 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -205,7 +205,7 @@ XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
>  {
>      DeviceState *cpu;
>  
> -    cpu = DEVICE(object_new(cpu_type));
> +    cpu = qdev_new(cpu_type);
>      qdev_connect_clock_in(cpu, "clk-in", cpu_refclk);
>      qdev_realize(cpu, NULL, &error_abort);
>  
> -- 
> 2.41.0
> 
> 
