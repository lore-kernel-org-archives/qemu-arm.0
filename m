Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1148821ejb;
        Wed, 24 Apr 2024 23:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVG905JE7nt6GivxQMyZYhz1O8sH/DKFtJqX+A0DxUYvPI0U8W5WgAZ8TNp9WITdMy2VvOQYQ9XLrNB4i10D0Ttbrc9ZIPc
X-Google-Smtp-Source: AGHT+IEJg5MvHIydSHZOecxzc6W7FfUbaERSEj3DP91MpT6blwtLllYfhdQTGuhS+7vXrk00NeqC
X-Received: by 2002:a05:600c:1d04:b0:418:ee1e:3445 with SMTP id l4-20020a05600c1d0400b00418ee1e3445mr4580507wms.26.1714027365256;
        Wed, 24 Apr 2024 23:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714027365; cv=none;
        d=google.com; s=arc-20160816;
        b=UxS21QAt5p3jmr6TwZdGTgOBqLXqUP6NQzscz91d7LGMf2w1TYUTGPpfFcTSBKrqbP
         H427UwVLInzB2EcwdSdjR0EMA1E1pEr9klYWT95M3LxqFzAV7mRq1RHs3lWWz3Z5pudz
         lt2UJp33Coc39vx4BZ7RnHWzW+rOEe+cxvmV8fzUQtuwdGXDodEs4v+d0AoNzCA0Nixk
         v0tFmQXzt+SF1neeqSZ/xkxKevcLBOQ2OHfnUFPjSk+9Blg2sgKjy/JQ6CCKS1xL/X6/
         5xGfUBbWxTbk+PnPtxrnsDCyzsgq9gH29HvcpqOMWb/Q6t/xlTZNY8eAVDzJ2JgbD1TB
         fqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XrLYZVhsUcjsltFVYzuggHcd5PM0vq0OtYU7pt90TEQ=;
        fh=tCSg2yooBT8EoLYT6AIKVhtkL2Pi5HZWa9q7oxNeMzI=;
        b=QOaM3bzWGjiRGpxu52nqVeeYh6RO4JjgPxVmBO5EHMCttPwkHNGIci5EQtghvNHYGh
         UaaUsNy/g+ZrI3/AbMB+jh72lak1FbI0iYotbjyhGNHLu0lVyJMeko4WKlmvSQq4Jhsf
         o7WcTUTqfJtJPGsHWTTeFxSGHz45jhn6dDkFvVQ3UwEnQNbwEczLk/8+OSpX3whOGXZJ
         oE2+j7GwXteI8F7LB3rUDJ5XFCWCvyvJEhML4tTVHBqLDXQkU4TMqiU+Yg3v9J64sEYL
         0IZi35XzU/ehLDGKex4X4M243BdSgklbcv7yR7tRSm7+hQqn648axK4Ph9J5dRj9FH4D
         N9Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=VZcltcZO;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id n20-20020a05600c4f9400b00417d59fc6e4si8629220wmq.17.2024.04.24.23.42.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 23:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=VZcltcZO;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=XrLYZVhsUcjsltFVYzuggHcd5PM0vq0OtYU7pt90TEQ=; b=VZcltcZOYmj1JEP
	/zXfrw/nGHZfqUw6SHdoLT9V7ZTy+rE04UQUHUM2FzJUFRjnZKydig9q10+jJLcNMvmwASlZzvOEE
	OiwJF6pMh8uCJny0iL0wsQTk0jcWGNPFtKhxmePU4EzPg5LcKedtmLdCwwyXFtX1RgY7n/zTwJfWG
	j0=;
Date: Thu, 25 Apr 2024 08:43:55 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Peter Maydell <peter.maydell@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 07/24] exec: Un-inline tlb_vaddr_to_host() and declare it
 in 'exec/cputlb.h'
Message-ID: <w7c53ha73uvaxl6yr5vxcsqb2mlndzi2niib4za7h64j3ca7ru@ssa2okjwzd3b>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-8-philmd@linaro.org>
X-TUID: YMNVxct3eI8T

On 18/04/24, Philippe Mathieu-Daudé wrote:
> Declare tlb_vaddr_to_host() in "exec/cputlb.h" with the CPU TLB
> API. Un-inline the user emulation definition to avoid including
> "exec/cpu_ldst.h" (which declares g2h) in "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cpu_ldst.h      | 24 ------------------------
>  include/exec/cputlb.h        | 18 ++++++++++++++++++
>  accel/tcg/user-exec.c        |  7 +++++++
>  target/arm/tcg/helper-a64.c  |  1 +
>  target/riscv/vector_helper.c |  1 +
>  target/sparc/mmu_helper.c    |  1 +
>  6 files changed, 28 insertions(+), 24 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
