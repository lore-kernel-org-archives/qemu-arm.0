Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp953388njb;
        Fri, 9 May 2025 01:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdKV6ktTpIvMignVk8bxyyp8Yopke0uafNCIInJnBbrCSVl85n7PzQxF6cWw4Q/AihPR4NvxBqObWzKA==@linaro.org
X-Google-Smtp-Source: AGHT+IHx3L3/pe6HBF88dBGD8hlWxH7BtOb99714uQEf+kOq7TuKHWsCRdGY11Tul/us1RDMNssX
X-Received: by 2002:a05:622a:294:b0:48d:50eb:91df with SMTP id d75a77b69052e-49452737129mr29409841cf.15.1746780636258;
        Fri, 09 May 2025 01:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746780636; cv=none;
        d=google.com; s=arc-20240605;
        b=ev1JcAd/NvqDSD3o3/ny+GmgP5psZeD2r68xGb7DKnqufw7ABA5c8uZsrQSvddiTdm
         byigh78YGF6zUJu5txN9Ja9JFNeGQebabeYVeX93vV9wm95yimz+QsdjQVplYoO7kBos
         xVJbdiIu2Y3NJ7qYiT+fUk9IzwNw6Q6Neej4SgPywqxpslz+bPAN7q3tZCdm+9wGQ4qA
         w3wFfd0Ywi2pRt8kJi5T8ZLgR0bklgvDZa8oRVEVhhLXJurgDW37QVDFQ9gE+g1bh9fT
         iYQ3jv0XfDZfRrtWNl0f11bXudjSiW/uEDfAOs0sGfd1GIuXoc1/OsjE8sbwMvV8numA
         pIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=0yWzgeHCT2TyN5GCpnE/1ZW18xCpyYZtcIRwBh9wtig=;
        fh=JxHmcrA01BA5QK0KCw1k/zuTtIunTfHN6Hx8q/ntgXs=;
        b=HtLIOp9TK8LEG5UEtAijolyg458R7pY3f/YLZJbjxnqEgGHZM8tXqoXAJbUBY04rLx
         U7XwZNUnFPVfjInQcnh4Uf59x9Kfl0F5iVg35u+6dJUi0FKVDR94EtubERk9NPiJyAIi
         9nx5H0ocI/25eRnmTYaFV225EE6OedQupjn8iGmr7Shxk10TUKrEW58dN5IJt8nzQ4Av
         UqCBY50TGg4L4PjPZx6SatmBnE3f8aU8gI5tvQfFj9FVDkG/j07YVHnd+ybJHKZhYpO6
         /wPustH/dqhdFrLuxDQVfEQLYhwKjNmSC+PWO1DJIb7GNXCUPs/aQhEMX+I/idMZuvfV
         9AzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KSu29SL6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452459adfsi18556901cf.118.2025.05.09.01.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 01:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KSu29SL6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDJR6-0005Sf-RE; Fri, 09 May 2025 04:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJR4-0005SC-Ue; Fri, 09 May 2025 04:50:26 -0400
Received: from mgamail.intel.com ([198.175.65.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uDJR2-0006oi-Cs; Fri, 09 May 2025 04:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746780625; x=1778316625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=frJ8xDYf5dCgwXDohsd3IDh9hXwJr3cVlXyTzjKPOJA=;
 b=KSu29SL6zFk840M82TE7m/gGK3RozCW5GvfkpQcLLiEHVaUos6xEeuJS
 dNXrJ6J/hbRp4i9mD4uc5n8Tp65Q3rcyFDFk1JuA5RpkL2NrL8b7dddyy
 kZzPhpafPvlgy8Ud6gh5ujEyfYiCAWJSleXbWF21hja2LIog7pHqiXEkq
 1j3avNPAAzq34Pvr/K/mFN3Itv9wPhbQK74FqkorMu1YcKlufhlfZ4rX+
 eqaNyYv4db7YjrOwSkkydFNKEvhUms/5RMQxIBtVO7qmJpcQzXC5/B6v5
 qa1AHdVBRqLByI3m7GfcJTw6Qj8w2xrM3d5kaEMft4voG/WvXaXRDzn4+ w==;
X-CSE-ConnectionGUID: Ub7xsblcQS2sPsaxrbf/cQ==
X-CSE-MsgGUID: HbvqJtfiQvy9iVmDfrUJoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66005249"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66005249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 01:50:19 -0700
X-CSE-ConnectionGUID: OMtp7xesTVq/J5C7ScuQFg==
X-CSE-MsgGUID: 4CmTpZuORRSlXGdxVuxfhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="159855159"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa002.fm.intel.com with ESMTP; 09 May 2025 01:50:11 -0700
Date: Fri, 9 May 2025 17:11:13 +0800
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
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 20/27] target/i386/cpu: Remove
 CPUX86State::enable_l3_cache field
Message-ID: <aB3GsY71YH4usdSi@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-21-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508133550.81391-21-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.10; envelope-from=zhao1.liu@intel.com;
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
X-TUID: wWEJdJ4Af6Mw

On Thu, May 08, 2025 at 03:35:43PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  8 May 2025 15:35:43 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 20/27] target/i386/cpu: Remove
>  CPUX86State::enable_l3_cache field
> X-Mailer: git-send-email 2.47.1
> 
> The CPUX86State::enable_l3_cache boolean was only disabled
> for the pc-q35-2.7 and pc-i440fx-2.7 machines, which got
> removed.  Being now always %true, we can remove it and simplify
> cpu_x86_cpuid() and encode_cache_cpuid80000006().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/cpu.h |  6 ------
>  target/i386/cpu.c | 39 +++++++++++++--------------------------
>  2 files changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index b5cbd91c156..62239b0a562 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2219,12 +2219,6 @@ struct ArchCPU {
>       */
>      bool enable_lmce;
>  
> -    /* Compatibility bits for old machine types.
> -     * If true present virtual l3 cache for VM, the vcpus in the same virtual
> -     * socket share an virtual l3 cache.
> -     */
> -    bool enable_l3_cache;
> -
>      /* Compatibility bits for old machine types.
>       * If true present L1 cache as per-thread, not per-core.
>       */

I realize this is another special case.

There is no support for hybrid x86 CPUs in QEMU, but it's also true that
there are some actual modern x86 Client CPUs without l3 cache, such as
Intel MTL's low power E core (and it has vmx support, i.e., support KVM).

So I think we can keep this property as well, to have some more
configuration options for users' emulation.


