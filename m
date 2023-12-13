Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1563071ejo;
        Wed, 13 Dec 2023 03:56:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErWfIEte9bR4rKNFKdgltZtcPGL1ghgNHTf1BO7c4cYsV+NgsZjKgPG5kaHwVhZjKgrHud
X-Received: by 2002:a05:600c:b50:b0:40b:5e26:2382 with SMTP id k16-20020a05600c0b5000b0040b5e262382mr3950542wmr.51.1702468575452;
        Wed, 13 Dec 2023 03:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702468575; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo2BPG+haNR903I9ecvQ3GiA9AZz28qtuOIVJ3iN5yu1OxhcxOGGbsGLHzKwlPOCtK
         rImHZKN76OOsgnF8QZaJ8CPmdep6vipmjgbddnD8wA60AL8gFOQl0JSMaPPcLq12uavu
         xuiOhegWMJL+zBcb2dL+rMfKGCK64V1hecLtCYIO5tueCKjmisL0SdLKTdRjTMBAeM18
         7A0QWBiqTJy3a4UFSB6Swnhm651J705LZuc/q9QSFDMQJO7/b/vMCNDL5qYZCbz1omRC
         rsbtVhx9AXKlApoMA1nBraj2PQ5SPzotpzAEDIMxjaF8H+zmGv6miEiQ2bKyIePlHMK6
         05xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=BV6K3Mm3nvgXNQo4BiKorufcdfPdeA72eRuRFOnsb0Y=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=Ceg74IIW4+hpD8sLjhgimghbn8lVKTzkpatLE0Py+TalbpBmjbgy52yw/67fq8yHeq
         +2WVsxb9NKh11XQ/nF6N7Bw21hDAmr4bX40QYq0ffMZpOF7hfSC4sxnITuSauAgr23Qq
         y0MhomZ0GAgzUl3AEv6JcAGtMRddE2X7XKUaVHuvlwbSSRWGUN9Hcr+i6huagc6nCUjC
         BbU4259CMCsUv5dVieZZ9Q6QnNQgFcZsyNAATTs7dDaqmP31Sxsrr0Faw6OiHYD9BhUe
         Vz5sT5AaqzcBakAQxM8Dlf6p0E/CHwnBNja4d5gbViXlivRaOAIGU9k4o2P0z3OniOpk
         PfdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=fChkF+tF;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id e19-20020a05600c439300b0040b4ff99cd1si6543662wmn.163.2023.12.13.03.56.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 03:56:15 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=fChkF+tF;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BV6K3Mm3nvgXNQo4BiKorufcdfPdeA72eRuRFOnsb0Y=; b=fChkF+tFvOlznkDok0k5Ld3BIS
	s433J27x0cW1KBIpdSOJTOTPBbZeyiuqvgmWkImHptdUFvmxMPY4p0AISEfivz5VfJDjlTaUT6kVx
	rSMeUJs+IYTG45iye/+aenpwPLkwSN1vGwd+jLWP9uwrxwI81LS/Anym4zIE3zrrx/SQ=;
Date: Wed, 13 Dec 2023 12:56:06 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 09/23] host/atomic128: Include missing 'qemu/atomic.h'
 header
Message-ID: <vzzjwfq23lhpukirvss75s5tuu4vn6djbu22mlrgwvha6em4vv@irs5cx6zy674>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-10-philmd@linaro.org>
X-TUID: dnPEjoNB49fb

On 12/12/23, Philippe Mathieu-Daudé wrote:
> qatomic_cmpxchg__nocheck(), qatomic_read__nocheck(),
> qatomic_set__nocheck() are defined in "qemu/atomic.h".
> Include it in order to avoid:
> 
>   In file included from include/exec/helper-proto.h:10:
>   In file included from include/exec/helper-proto-common.h:10:
>   In file included from include/qemu/atomic128.h:61:
>   In file included from host/include/aarch64/host/atomic128-cas.h:16:
>   host/include/generic/host/atomic128-cas.h:23:11: error: call to undeclared function 'qatomic_cmpxchg__nocheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     r.i = qatomic_cmpxchg__nocheck(ptr_align, c.i, n.i);
>           ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  host/include/generic/host/atomic128-cas.h  | 2 ++
>  host/include/generic/host/atomic128-ldst.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/host/include/generic/host/atomic128-cas.h b/host/include/generic/host/atomic128-cas.h
> index 6b40cc2271..4824f14659 100644
> --- a/host/include/generic/host/atomic128-cas.h
> +++ b/host/include/generic/host/atomic128-cas.h
> @@ -11,6 +11,8 @@
>  #ifndef HOST_ATOMIC128_CAS_H
>  #define HOST_ATOMIC128_CAS_H
>  
> +#include "qemu/atomic.h"
> +
>  #if defined(CONFIG_ATOMIC128)
>  static inline Int128 ATTRIBUTE_ATOMIC128_OPT
>  atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
> diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
> index 691e6a8531..12e4aca2da 100644
> --- a/host/include/generic/host/atomic128-ldst.h
> +++ b/host/include/generic/host/atomic128-ldst.h
> @@ -11,6 +11,8 @@
>  #ifndef HOST_ATOMIC128_LDST_H
>  #define HOST_ATOMIC128_LDST_H
>  
> +#include "qemu/atomic.h"
> +
>  #if defined(CONFIG_ATOMIC128)
>  # define HAVE_ATOMIC128_RO 1
>  # define HAVE_ATOMIC128_RW 1
> -- 
> 2.41.0
> 

What about the int128.h includes? I guess those definitions are acquired 
from atomic128.h that includes -cas.h/-ldst.h?
