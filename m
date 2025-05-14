Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp863809njb;
        Tue, 13 May 2025 17:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzVBJp4zUyy7ozylSqX90blyCbm7ypDthfm9d+mturHf2mLWaPsaPIKSus/IifmaX8ny3jeThHhYNdNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFb9/2ZUcD9p3r2dhZL20RL4tHoWx5dyL7a0NOmbvOC3vD9ZLKo2uHyDJBHTFpntiHoHllt
X-Received: by 2002:a05:622a:4111:b0:476:b480:e440 with SMTP id d75a77b69052e-49495ccdb4fmr29616641cf.23.1747181048862;
        Tue, 13 May 2025 17:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747181048; cv=none;
        d=google.com; s=arc-20240605;
        b=SOIA96nrkIBsM83epmaah4KFKnDvORrcskvB/6Vc9/3aoP1Yal+k5uMbg+nhUuVfji
         G0oM3QxApDe7lEPbk0LwR7UQATfEeBNjZ2LIwK5preuuuyD9+Lyog/Yt34MShVDnBt1b
         n9tWCkH8ilB5JS4NqMixNmPj0esDMsbfAdqItvUyVdkEpwSzYeocW3e+oMDLYFVplt4L
         FlLur4ItSqEAkYUxgJxtFx9yfp5oX0Ld99DAzW8Ni8QwArWQ8mHqBYzrvzbJG1BIkx2l
         diGmR+Nfk+0I1wG9RvieqPgiysJWbeQKl6YtSP2D9X4mXxcyqm+G2sRc8yGUPizjn2eH
         pIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=sseWur14j1D3TqA8ChdJbKuoZ3Mc0bikD2PAMeBzx/E=;
        fh=vaepxFUK0aoS2vzPjSz5RFsZj1kKwVtdQsrszJg9o6g=;
        b=RVBagFbgwpaJm1L+yUBJpCVqTU0Z0UGxlmpD3nMn04umPGzpTRpnx8GAXduMzZmT19
         MQC3TdSRH0k1DRYvNAVmLfk8JZ9kBS8W/yk4gFUvTCMkYoFEKKP1ptxH2p4I2dGTBCpo
         e7CRhMgH3s9FST24cb9H9Tnbz6jQ/5iSziDsFE1zzO6YFt/MYqSIVPIJ4SuhOqiIuUQm
         K8aUYZqtJbWqT12rJqjly/S+n+bwjYJnQe/VakuPuW1BTXPtnassGGk68/5nmweDRvbm
         I2DPFdM5lSlU355x6tvdDiB+UQlrOO77v8MziSG+pXa9n1ON2g14ES3iy9Y0BkIHGwY6
         hd6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cak51oBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452599eb7si122122691cf.500.2025.05.13.17.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 17:04:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cak51oBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEzav-00051q-AY; Tue, 13 May 2025 20:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1uEzat-00051a-9D; Tue, 13 May 2025 20:03:31 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1uEzar-0001nD-Ix; Tue, 13 May 2025 20:03:31 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 592015C4A49;
 Wed, 14 May 2025 00:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE4EC4CEE4;
 Wed, 14 May 2025 00:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747181006;
 bh=V9r0H4FFmFHRbUIuzb5awbyVY/AV8w/CNxahp6ppDzw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cak51oBcWts0nQZvhmBIFOTpaWUvxUBJUukktKF/Pke+GX7qiEBMl9OtrF26/jE3T
 xxH0V9yTBAa6HjEtyvj0+SDps7B82kg1+pbxHUStpgQ0RfvA3CyRtjZ2XMZvSz6jIg
 TaSBywL2pzpArbM25+PQrp0oPQKd5i9JSv1eKgelZPG/nq2A0BbraLlFWMA/eZKOvj
 aQ71KQx9MjcBGTxhJMksqsGBGLMtF+Haky1ODud96RoOZVx9HacHLPEqUiBdIt3FY/
 r59yBQV6f9KD83wbK+Lprqyd8gYrEaDCRaiZVEuE/yYhR0pl5RyWwYx4KMvOtBuqiR
 qra2z5ZoKrqvw==
Date: Tue, 13 May 2025 17:03:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>, 
 David Woodhouse <dwmw@amazon.co.uk>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2505131703140.368682@ubuntu-linux-20-04-desktop>
References: <20250513171737.74386-1-philmd@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-946740503-1747181006=:368682"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.549,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: w/dtaHShB4Z7

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-946740503-1747181006=:368682
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 May 2025, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/hw/arm/xen_arch_hvm.h  |  9 ---------
>  include/hw/i386/xen_arch_hvm.h | 11 -----------
>  include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>  hw/arm/xen-pvh.c               |  1 -
>  4 files changed, 10 insertions(+), 25 deletions(-)
>  delete mode 100644 include/hw/arm/xen_arch_hvm.h
>  delete mode 100644 include/hw/i386/xen_arch_hvm.h
> 
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> deleted file mode 100644
> index 8fd645e7232..00000000000
> --- a/include/hw/arm/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#ifndef HW_XEN_ARCH_ARM_HVM_H
> -#define HW_XEN_ARCH_ARM_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
> deleted file mode 100644
> index 1000f8f5433..00000000000
> --- a/include/hw/i386/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#ifndef HW_XEN_ARCH_I386_HVM_H
> -#define HW_XEN_ARCH_I386_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -#include "hw/xen/xen-hvm-common.h"
> -
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index df39c819c8f..8bacaa4ec41 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,5 +1,11 @@
> -#if defined(TARGET_I386) || defined(TARGET_X86_64)
> -#include "hw/i386/xen_arch_hvm.h"
> -#elif defined(TARGET_ARM) || defined(TARGET_AARCH64)
> -#include "hw/arm/xen_arch_hvm.h"
> +#ifndef HW_XEN_ARCH_HVM_H
> +#define HW_XEN_ARCH_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +#include "hw/xen/xen-hvm-common.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
>  #endif
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>  #include "hw/boards.h"
>  #include "system/system.h"
>  #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>  
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  
> -- 
> 2.47.1
> 
--8323329-946740503-1747181006=:368682--
