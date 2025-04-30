Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1312335njm;
        Wed, 30 Apr 2025 16:47:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWp5RDvukUnKUII+oa9934Y8U47+jrxQSFSy2hW/kyNE+urZPEBZy+mCIlcvXZL3eoI6iqxoWK8Xs+TzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvWP9Yfa088Bmy4/XMyljVGfbahzmhNyyvNTYXprkYVty0SliRhG41YNgrsW/ZO9fBnt2g
X-Received: by 2002:a05:600c:8711:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-441b7034c5cmr4350195e9.15.1746056872862;
        Wed, 30 Apr 2025 16:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746056872; cv=none;
        d=google.com; s=arc-20240605;
        b=N8GDd5S8gGcjO6m6vB20F0Tj9I0GA9BfEWUdQiFImBOb1GlN4MQ6QULvJUSzHHK+CV
         m5TyRYZfY6SBlxy1msmWDqX50gfMdRTNSA673wyxTv/wl0dqPBRtJcTsc8xozuh7VKNA
         j/5o+Sr3egEhMW2npyFOFN8NUZroMWnQ3N874jRgZfDx1G2h6R0Kmw2QWSp1GGTHgF8+
         ijx3TdvfIhcdkkjrqA0b5zNEqQotL3oUIh/pD1yVL9PZ3q/c9GfaB6x1nxWxuR8mj1aG
         +qbwsyTORkzvN7tc3cBxBtTVCiBxPG6gQoRtreCsh9R4Ji1nYDMCj8W2VS4BS9puuh7N
         cXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ODtBgca4sXD3KHTJuGek7w/NgcE5+epsaeewIw262FU=;
        fh=1O4D0F0xiJ6EStpC+EImnfai1+/pleYm9GV3gX57bpU=;
        b=QQjlIGGr7OYiZoEVG7MBDdZVg/c1e9sjm8A2cCITxYta6qEWpi/Rv+jrkgowHQSGhm
         Rb94R8hr4wiANZuQaEeOF5PyEVZuz5mmeJk9xTEgtk5JMwVeWZ8o/t1oQRum38mZvwgi
         w/X9jClYUHo97ERWzPAg1c4MTXY+iXAfKJoQ34uXSBSzOcYkkjo9IT9iiFd9m5xLNZLS
         bdNL0DJt6BaP1SdEYeEfXshf1KeJxUWFc5/qPqy6D4PDh93uit65mQYIxX5RxnMEOxmm
         6LTGl19cHIeLM0IMcJXFdZ8YXIIMPrWPu0kV8Y78GQIDbgSDwsB16PdgMXstz3W+eAVQ
         9JEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=TKtaafEO;
       spf=pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [94.130.142.21])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a073e569a1si8961993f8f.507.2025.04.30.16.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 16:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) client-ip=94.130.142.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=TKtaafEO;
       spf=pass (google.com: domain of anjo@rev.ng designates 94.130.142.21 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=ODtBgca4sXD3KHTJuGek7w/NgcE5+epsaeewIw262FU=; b=TKtaafEOpGY8rbU
	U7EoTVA1oJ8lnIeS0eq9758xiq9F+d9lk8E6KX94/i0zgld/wKoKl2LrKfuJr7xgX6EtshRm3s7b7
	pLo7IsAaeFMMpRIbJre/nRIlYYN5ZToYQbB94mmnPe28o9g7EyY9ixuL0I637MqxVh8cNgy8RzlKh
	xQ=;
Date: Thu, 1 May 2025 01:49:06 +0200
From: Anton Johansson <anjo@rev.ng>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, alex.bennee@linaro.org, richard.henderson@linaro.org
Subject: Re: [PATCH v2 08/12] target/arm/cpu: remove TARGET_BIG_ENDIAN
 dependency
Message-ID: <jgakrza7l26w2xuf6q3avu3jpjk3wftrn7bvsjcfdgv2i4aalz@nbeabqxv5rkb>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-9-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430145838.1790471-9-pierrick.bouvier@linaro.org>
X-TUID: 5jo9ksn39efG

On 30/04/25, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  target/arm/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 07f279fec8c..37b11e8866f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,6 +23,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "exec/page-vary.h"
> +#include "exec/tswap.h"
>  #include "target/arm/idau.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> @@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>  
>      info->endian = BFD_ENDIAN_LITTLE;
>      if (bswap_code(sctlr_b)) {
> -        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
> +        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>      }
>      info->flags &= ~INSN_ARM_BE32;
>  #ifndef CONFIG_USER_ONLY
> -- 
> 2.47.2
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>
