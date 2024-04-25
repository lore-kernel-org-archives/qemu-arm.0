Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1180666ejb;
        Thu, 25 Apr 2024 00:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXD/JHt52rOXdbra0mjxRBmTSaKAbJf4YtRsgMIqLpJwyuWAOJtQsMoas9FaX35EAvkLZAIY+cc9tlMfz2tz65WMCtd0QyR
X-Google-Smtp-Source: AGHT+IEEinhVqjMwKZ4Tl2xGsy28VrrDIt/6FNY10taFzWjaVb/4Pg1a+7nUi4QMRkHJELvGkRtT
X-Received: by 2002:adf:f506:0:b0:349:8a92:7eda with SMTP id q6-20020adff506000000b003498a927edamr3191274wro.12.1714031484599;
        Thu, 25 Apr 2024 00:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714031484; cv=none;
        d=google.com; s=arc-20160816;
        b=oguHkeSOZaRHs4m+vrR2Q5NuNs4Rv+n6AN1eFmUtfZvHGoBma5sOjPhM1gXstaHlWD
         o28O0s0G+dI7ISVCdRGfuR1ya2ZVwOox/6cS+QE4Ccsoat5rQBrJiuQQeYVZ0zVEHoMO
         XEfWN41ytMvNJsJw+pytSSJEaIhHNIzsxGja20xz547cgZigr3F1KxyQYzWZiEvB7rUW
         7e2O05EteqR2dPIOLZzACfUEjTZfoGKxcclsGC1CCOWFal8+DjfMgJV4h0RK0s8gPNJU
         OMFMFqIpwH5LJjAwKGBRp6LZj685wjIVeCbbD2YdRqdZqKHT+Nat0VDpIKWakeGNfbUu
         ewdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=acKsY5/yphuMvkfLPTUSo/AmhbEKlxY/oFgqWmU/ddE=;
        fh=PwFunk9KfCI7dzRq16IobS5+nvY5ECuyhT/L1ky7dr0=;
        b=QzRGsPjIsvOTnjez6MDJOvwc7G2wy+XLr/iFhGAyXv1XR5fkraf3HJ7cR9tQM1iRg2
         LWiyS+UfOBHHc1DYmGbmgPoEkjIDxs463BayPPz3RH3YfTqhyrCL7LWkQ6ELgITouMbd
         PTelvPZ7EA5/fJfbNMH08zZTrfB20BRXAKvRX36AgvgdkL/WUKIs3lw0wuhKPkLOeKk1
         eutEa1bavxuMPONcfBkH25c4rO5UIjb6CFer73kGw6Jvf4W8xdDldtCARpyhfxcS0uxX
         kUPt1y6UC9w6JxxY3gcxqbsqMx2HVXQh0pyuYu7jy0y7fLAld7EOaFYSOjD9nbXzQLmJ
         Ssng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=OzuApP0p;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id a3-20020a05600c348300b0041b13a1f548si1348325wmq.209.2024.04.25.00.51.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=OzuApP0p;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=acKsY5/yphuMvkfLPTUSo/AmhbEKlxY/oFgqWmU/ddE=; b=OzuApP0pY5NL3pM
	1sr0ZlvXosaPe6hGIJJvbKB9fb/Xp2q+hh1oTkBByYULGZ9kNUQII7xT+3xGK0S80p9sfav9hVhDJ
	q2iBtPjed10arlwjKD4GO1W7pgsxX3uFs9dAdcqBipfiGXoyPqJtRxNbkO79sWC9rte4b7F2iMkdW
	As=;
Date: Thu, 25 Apr 2024 09:52:35 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Peter Maydell <peter.maydell@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>
Subject: Re: [PATCH 07/24] exec: Un-inline tlb_vaddr_to_host() and declare it
 in 'exec/cputlb.h'
Message-ID: <l2ob32xcx2gh77xxots2sttd7i327cz3bcvavxf4h7vt5kwogy@33u6iavgeilz>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-8-philmd@linaro.org>
 <w7c53ha73uvaxl6yr5vxcsqb2mlndzi2niib4za7h64j3ca7ru@ssa2okjwzd3b>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w7c53ha73uvaxl6yr5vxcsqb2mlndzi2niib4za7h64j3ca7ru@ssa2okjwzd3b>
X-TUID: GyxkKN3YuYzt

On 25/04/24, Anton Johansson via wrote:
> On 18/04/24, Philippe Mathieu-Daudé wrote:
> > Declare tlb_vaddr_to_host() in "exec/cputlb.h" with the CPU TLB
> > API. Un-inline the user emulation definition to avoid including
> > "exec/cpu_ldst.h" (which declares g2h) in "exec/cputlb.h".
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >  include/exec/cpu_ldst.h      | 24 ------------------------
> >  include/exec/cputlb.h        | 18 ++++++++++++++++++
> >  accel/tcg/user-exec.c        |  7 +++++++
> >  target/arm/tcg/helper-a64.c  |  1 +
> >  target/riscv/vector_helper.c |  1 +
> >  target/sparc/mmu_helper.c    |  1 +
> >  6 files changed, 28 insertions(+), 24 deletions(-)
> 
> Reviewed-by: Anton Johansson <anjo@rev.ng>
> 

Missed existing review, my bad!
