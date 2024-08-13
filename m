Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp986769njh;
        Mon, 12 Aug 2024 18:45:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXbohGZOmDJ82M0SgSj/SyFY2FaHuFWLYbsg0F0TmXSCqxBt6/R4D5sTKAjdKOlGM3PC1w9NMG7fvqyy8pnzV2aeDEaaT5
X-Google-Smtp-Source: AGHT+IHIbk3fus7ZZ7gJQUuY5RnSDhs7bPFIprEvthIMAyNSjkd5CICRZqxOD9rG/tjzw0rs6KFj
X-Received: by 2002:a05:6a20:ce47:b0:1c4:f695:dcc9 with SMTP id adf61e73a8af0-1c8d754dd07mr3059457637.32.1723513553092;
        Mon, 12 Aug 2024 18:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723513553; cv=none;
        d=google.com; s=arc-20160816;
        b=JN6/a/T0RsH9GmyxPGGKj6YpkY4lnxf80dROSytKHppm4hNoZJoSMwS+hHKYmU1X3u
         lL19eSRNi4gOtCLB/pQWkgwmZrJvTFTvcKphH5k6uJ2umAWaxT7+41s02d/R4eQEhjM+
         mrKfbib0FgpPNAb6sop5VrQFBp0C729EYHcrJ+2oLzRVWobyWZGdnIHhxtpZrZ5lK7yR
         NNyFz5XaFLNYzNDrsrtGXO0SzVmKKqQJGCYHmkny8Dc9O/sEmtZoy46ub7cqigEZHXrx
         Hi+YFVO7t9eN4XUF7NqML8IoBrXou+R4E/KGJTD51iB4zrTylTL2l3UF3dSvsD4k68w+
         j57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=JexBtBLDCqNMD7nLfyY2iV1ITM29GguYcgqqwLJv2yA=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=VplvOCZO7V9l0L5fn2yBFTv+H7zlA9eu4auNUQh+ZX/p7yDAGkCT3+x8P0c2d9mI2y
         e5EbeTg879jJRd2zVJdrmTmMBpHly4tduIQpIMS3nm/JB5kZDy86JHfGjGIKf2gF7kgC
         785HXKZ1qxX9UIwjWbQHj+3F4KOxSaZDrwH9nm/j525wZHyiT8oNOJO5VZ5hUjsNG0zq
         GDIVT/gKq7P4gAiuGcT82tvIeFJmrzNzr5Y0GY0WjLFpnVJDCysXszbrWm3GcBsQ0zK1
         vjo2q5UI1c21iI3S5d3vFkZq7R1iPzZ77Xx0GQ/lX/1Ld9YAIJquO3F4yrlBqo9SljP2
         95gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RL1TyfKu;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from sin.source.kernel.org (sin.source.kernel.org. [145.40.73.55])
        by mx.google.com with ESMTPS id d9443c01a7336-201cd14e71asi7343195ad.132.2024.08.12.18.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 18:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) client-ip=145.40.73.55;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RL1TyfKu;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA89ACE10D3;
	Tue, 13 Aug 2024 01:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C3AC4AF0D;
	Tue, 13 Aug 2024 01:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513551;
	bh=ECjQDs9jziapBcyXSTtq2tx6hUghV1n/XxS12P5heA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RL1TyfKukkhFoK7lg6aUIzmfh+UjCF4vgBgj42v8NqiVovWn08NTuEl/1OommeWCx
	 eakdXydKoigcr39Mo32UuHCs/YG1M3OBrPyxngLg46TVYz3FATUxnnY0HzZkIcF9Yd
	 xZMqPwlD5nrweeprJkCRwBIA87nkrBC80sGSi5dyt1QHcXZDVhbCiCLpa940JbV+tA
	 EfSbNMaBoHu9PafV01E2G5RCkCd/+D8WQBsTxUYVNtHuHa8uPl1Dt8rgQzX09wvfXK
	 U+4fUVTaP8HiQIqn86tC8bSUJQDnGkIzknVUcKsC1ycdrNGUfTip80tTECBLDblCau
	 C89g7o2ir0RaA==
Date: Mon, 12 Aug 2024 18:45:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 02/10] hw/arm: xenpvh: Update file header to use
 SPDX
In-Reply-To: <20240812130606.90410-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121646560.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: Ez+4zcwfAwcl

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Update file header to use SPDX and remove stray empty
> comment line.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 6fad829ede..766a194fa1 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -1,24 +1,7 @@
>  /*
>   * QEMU ARM Xen PVH Machine
>   *
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a copy
> - * of this software and associated documentation files (the "Software"), to deal
> - * in the Software without restriction, including without limitation the rights
> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> - * copies of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
~ - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> - * THE SOFTWARE.
> + * SPDX-License-Identifier: MIT
>   */
>  
>  #include "qemu/osdep.h"
> -- 
> 2.43.0
> 
