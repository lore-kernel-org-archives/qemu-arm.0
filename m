Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3685320njd;
        Wed, 2 Apr 2025 13:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXB0Y4XVmZmtRGBzXmIDPXd3Z3Dx1Xy5QzLJsLejg3+7+oM4dKdtsva8P4U53nhGQe60sHuFCL3Bon5LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqmoz2vQ5YmndukyYIUhsLBCuHp3fAoZ5vf9Rhl7W+4v82YIDM9na9wYGDB33B26BkWOV2
X-Received: by 2002:a05:6214:226e:b0:6e8:f166:b19c with SMTP id 6a1803df08f44-6eef5f006f5mr92739686d6.41.1743624047604;
        Wed, 02 Apr 2025 13:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743624047; cv=none;
        d=google.com; s=arc-20240605;
        b=Py2aFM8I4ynjygtkq8OVPCSwEbWXgqf9lqZa6QEhUM6UQmXEsz8hx4R7VWLSBS4xOz
         atIWhKC6vqYkEsLyjiEZGn2Msn2hcRZG2tUA/OWLqkA3MTllmU/X+fyzkLRKPhzn5cG4
         4NanlaIZRdxGhIw5c2B/R6dvyAKjnQgviQ2ltXgGA0Tm0HRyMFy7db4BakyCkHJ8t0On
         qdRJ19+CyslK21EY/Azy1zmeImK5jmleNao5u1UgFyQIB0J1tdSTfNs4KUCpXNm6frUP
         mcwHggHj1xdc7Lw4SQgmVk31cYwtXRqNa0nrtCSE1uIj+7p/OHiEfKt0zcQisircQU/b
         BlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=iowv20a+eYQqag4+5aapTvZDhZINmv6UzqRYgV5Y/KA=;
        fh=IDt1RfsingZaYxmYjItEEBMO4l5Mo9wCub7W2I0FAgY=;
        b=g77qUuiWQaOPFSdUHNFPxdt8a9Jwzlr6eKiUh1XBDq2gwjF4sPWNO4ur00EzEMk3RY
         7YJBDE+iMSsIDKg+pWuMc5/EerZyFjnBm/Y5QNgSdKTz+Ez6SRKCUA1ljn5wTyLDy06z
         n4Tv25Acy/cRib673rFh5hFeMNGRF0nCSCdOSc3OcN8CIY47xylNjFUT+WFadZ+KCWf1
         dH98mCdmFLFHOiLT9/k5+yHC0g0FA9wVgdh4dVn52FS5C6vXkkL9RL1NMfn29QTizODL
         fVts1OzpovgNG4aokHSoixg7djJEPSfSA+gWZ2ZghHHiAcfyITQV0QUNYM3oZ5IKzQwi
         Qehg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=X6XK+qHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97a55c4si114841296d6.357.2025.04.02.13.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 13:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=X6XK+qHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u04GA-00083L-2b; Wed, 02 Apr 2025 16:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <da.gomez@kernel.org>)
 id 1u02cs-0004Ks-D6; Wed, 02 Apr 2025 14:15:46 -0400
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <da.gomez@kernel.org>)
 id 1u02cq-0003Pz-A9; Wed, 02 Apr 2025 14:15:46 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F090D434E4;
 Wed,  2 Apr 2025 18:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BFAC4CEDD;
 Wed,  2 Apr 2025 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743617731;
 bh=plB+3vOFjT5WCk4owIOmSgL2ZPFj0kfRhk3LH8hLZjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6XK+qHhSIFFg0nn8XO4MdCP71cU83YSLtrGL9TSe6hO5y/YavESU7gZeNcD/keea
 zA1lMpTyBAJF6QivH9zIgQBpSgs7strOBIlzL8faqKmV1uQIeQnCyK3BBJKTjZoauC
 NNlKsKKYos8VeqwkYMnPo4+W+vO+EgTZlGa+f5MeIZRnb5SSFiCv/ySA2lZJI6bn8c
 HVHMAs+IyhQ/j2pOirSGSZ60eMRrcQ4/LKPltkKgmMbBPk3+F6lFpKVLK8I5Iy4Uej
 BLRRGgsuFhDpKf0X1SqwkytbRm2QVx0GTUGp/AEnQsk/Nqh4Z0nn98kD3n1lcYKmoQ
 wTUISQr2nzcfQ==
Date: Wed, 2 Apr 2025 20:15:28 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <m.ynddal@samsung.com>, 
 Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 1/2] hvf: avoid repeatedly setting trap debug for each cpu
Message-ID: <enffkbdotdb4z2yggxxciyouprg64xcm4cybz72i4ryl5jqwzm@u2wnlphszxwv>
References: <20250402135229.28143-1-mads@ynddal.dk>
 <20250402135229.28143-2-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402135229.28143-2-mads@ynddal.dk>
Received-SPF: pass client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 envelope-from=da.gomez@kernel.org; helo=sea.source.kernel.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.153,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Apr 2025 16:00:21 -0400
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
X-TUID: 5NTL3LsXKm/8

On Wed, Apr 02, 2025 at 03:52:28PM +0100, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
> 
> hvf_arch_set_traps is already called from a context of a specific
> CPUState, so we don't need to do a nested CPU_FOREACH.
> 
> It also results in an error from hv_vcpu_set_sys_reg, as it may only be
> called from the thread owning the vCPU.
> 

Reported-by: Daniel Gomez <da.gomez@samsung.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2895

> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  target/arm/hvf/hvf.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 2439af63a0..48e4b12725 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2277,28 +2277,23 @@ static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
>      return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
>  }
>  
> -static void hvf_arch_set_traps(void)
> +static void hvf_arch_set_traps(CPUState *cpu)
>  {
> -    CPUState *cpu;
>      bool should_enable_traps = false;
>      hv_return_t r = HV_SUCCESS;
>  
>      /* Check whether guest debugging is enabled for at least one vCPU; if it
>       * is, enable exiting the guest on all vCPUs */
> -    CPU_FOREACH(cpu) {
> -        should_enable_traps |= cpu->accel->guest_debug_enabled;
> -    }
> -    CPU_FOREACH(cpu) {
> -        /* Set whether debug exceptions exit the guest */
> -        r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
> -                                              should_enable_traps);
> -        assert_hvf_ok(r);
> +    should_enable_traps |= cpu->accel->guest_debug_enabled;
> +    /* Set whether debug exceptions exit the guest */
> +    r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
> +                                            should_enable_traps);
> +    assert_hvf_ok(r);
>  
> -        /* Set whether accesses to debug registers exit the guest */
> -        r = hv_vcpu_set_trap_debug_reg_accesses(cpu->accel->fd,
> -                                                should_enable_traps);
> -        assert_hvf_ok(r);
> -    }
> +    /* Set whether accesses to debug registers exit the guest */
> +    r = hv_vcpu_set_trap_debug_reg_accesses(cpu->accel->fd,
> +                                            should_enable_traps);
> +    assert_hvf_ok(r);
>  }
>  
>  void hvf_arch_update_guest_debug(CPUState *cpu)
> @@ -2339,7 +2334,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
>              deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
>      }
>  
> -    hvf_arch_set_traps();
> +    hvf_arch_set_traps(cpu);
>  }
>  
>  bool hvf_arch_supports_guest_debug(void)
> -- 
> 2.48.1
> 
> 
