Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1627407ejo;
        Wed, 13 Dec 2023 05:45:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4YK3/+iib7IRFlpJyl+bhRT1m9IC2V3VMeBVBF+QTYuGPuiYWIpI1Ef0u7CSx5OmthqSZ
X-Received: by 2002:a05:600c:2a8d:b0:40c:3308:3afd with SMTP id x13-20020a05600c2a8d00b0040c33083afdmr3804238wmd.12.1702475102696;
        Wed, 13 Dec 2023 05:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702475102; cv=none;
        d=google.com; s=arc-20160816;
        b=QfXkqMRPXfdALG1NUWt9RenvDekn/s2Co+D5jMuPCD3kgdwlyC2q1bpc+3D3jkL3eY
         WvwTe9/+oYmT0nPmhpQtuXVP1XquZyLb3Yy9g8S1GYpUbMC8lP2YgG3EkdN7+eAXSmX/
         a7wQlN4dksmkrPqHZYFZpMCi5QlJkGfk4pXYAzgnR9qQb0pFqKNFxq2TEtYF22WW+vB5
         n9EjwytUNQwIWI4zuWFliYcwy0myopQCdkzZwgi8sxeOOOFViqFH4mArDX8OsjRrnKVm
         i5TOCnMUrdzBS8G1dlU5fP1HPzVFNOFOhUycowiIcPSVovQoPeD1P2IsYKgVn7c9Lruy
         RdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=y/BeS/uWhohIgo2Q1Syl0ONa3+qSPBdT0sc++7O39OY=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=O0SYnScwY6nUNWhQjwsc8vOqcyyjVE2XJrqkMxymPaN7Qg36hlDqnB6TOhuSSUf7Y+
         TNVv78ZrHUFYZZDKsVTPIVX0ED5g1J15tc0paqCIzq2MoBK+SlJemU72dVp6VwLwvI8S
         6y/vwDlXU0BKQrU/S92XnuqBkLCXjnNORPLsCI8amTfY5Omk70eYKqx6KaAuBtyUYc8w
         +CAhPo2qm67/EEsFg2K1X7gE0Qu9NfMsYAZQ8+mB4p0d5wZ3ajAXytYn8NYztG2zwR8O
         JA2zVMnpIvz4bh4T7WkM1L/o7qclNCi2TGhAOjYCpyZgdJme52QKSNBr2OBuZcQnqmxd
         BrGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="qL1OvgA/";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id q12-20020a5d61cc000000b0033642b6f609si253314wrv.5.2023.12.13.05.45.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 05:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="qL1OvgA/";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y/BeS/uWhohIgo2Q1Syl0ONa3+qSPBdT0sc++7O39OY=; b=qL1OvgA/y6zXkDHDdjO1FIECXA
	h4NDPd4SBuw+FXzuQfvmAg7jRwpeU42oZxFdAREVoivbTFO35pHosBfW+jIg7JHx8pGv6gdRPoeMy
	6iuG+kgAOfLpZCffn9l9jcA6qAT+WzioW76ZRdyEDdNpjZYeF6ivF8iKTJEZkYLAleqg=;
Date: Wed, 13 Dec 2023 14:44:53 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 14/23] exec/cpu-all: Remove unused tswapls()
 definitions
Message-ID: <vxb6ts4qlgf2krobzz2rosemk2f546wkuegfh5p5tzgwxih5ly@lv2hzdfirn5z>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-15-philmd@linaro.org>
X-TUID: 9CHti1mMuw1J

On 12/12/23, Philippe Mathieu-Daudé wrote:
> Last use of tswapls() was removed 2 years ago in commit
> aee14c77f4 ("linux-user: Rewrite do_getdents, do_getdents64").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 5b5379b94c..b042d94892 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -38,11 +38,9 @@
>  
>  #if TARGET_LONG_SIZE == 4
>  #define tswapl(s) tswap32(s)
> -#define tswapls(s) tswap32s((uint32_t *)(s))
>  #define bswaptls(s) bswap32s(s)
>  #else
>  #define tswapl(s) tswap64(s)
> -#define tswapls(s) tswap64s((uint64_t *)(s))
>  #define bswaptls(s) bswap64s(s)
>  #endif
>  
> -- 
> 2.41.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>
