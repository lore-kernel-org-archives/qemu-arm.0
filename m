Received: by 10.223.197.9 with SMTP id q9csp1127974wrf;
        Fri, 13 Oct 2017 13:52:44 -0700 (PDT)
X-Received: by 10.84.241.131 with SMTP id b3mr2475496pll.103.1507927964812;
        Fri, 13 Oct 2017 13:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927964; cv=none;
        d=google.com; s=arc-20160816;
        b=qI5SMy1d9mkbGzxQczF2GVFBinxtdhHythkKH4whMCI/gfNG1JEICKuOV6gBoXG0d5
         nEivkhV3f5M+OTgxabSryyq3RYLSnZL2I3v5sbbwgSxk0oEPrRaTzYgh2imKr3hMon5f
         P96jHaSDZBRuix1wAo/4oOpzXaDZLP5a+asWS7AwlWfCgHrjJv+hpRwmEtRjB0AdculX
         dFlU/Mjwt4lLdlyqoDbTV22cfoeXneRih3D0wHaQKTrBlgTbgXapfMRO567SCnTUID0f
         dbROcllCb60CYJQeza0umy41TmgPQmistsPikfoVLvDJ/Kll6GIggRyM3RypmcNmuGvy
         Ulew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=B0INXr8eDRg7nhEc4704R16rn3BhOo/fah5ElDNJ5Sc=;
        b=KeqSrHIH8cn5I94EYNLgpPc+4gjkpepjOgVDd3sP+hTIDnR94TH0XIDn0fxPXqYV51
         RnNyY884r8CGLo8UTYLVEm3k2poafZCLZ7SXV3oU58KZRQTzw/EUdxEOdzlEAvyCY86O
         0kxo1M2/3tNxHoKcjIt0dSSMxcZMaXCDOde0WhfXcQ28zZ6wCz88kKNtZpUDXtsdzBr1
         97oiHs8eMegvDv67h7v3DoKG+Dbo73P4Go1XwopioX+wZi2bigDIZnr4DD4urL7uMjgk
         cmTZ9fgIofP1KqkGOG83fITImQ1plfaLfEYG44I+JZ7cJFLLFXI+kBVCRcHukjDOVnXD
         DkuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P0ftCFqd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f1sor621436pln.124.2017.10.13.13.52.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P0ftCFqd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B0INXr8eDRg7nhEc4704R16rn3BhOo/fah5ElDNJ5Sc=;
        b=P0ftCFqdtPv7vVC0dWXXpmrHHYRCz4fYploSG7TkWH/bQdLxQbMJxClXgPBe/BpCrl
         feSYxz3m/ZbaCRV2IYVrXtW5lqne0BcJwnDX+fYPVJHePFsuhi7blAes6q0q9VYnMNHr
         TPIC2IQTAiGSnqV/HIiy0NhOCi0+bK5Waqyo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B0INXr8eDRg7nhEc4704R16rn3BhOo/fah5ElDNJ5Sc=;
        b=RZtqcKVRmiCojdq9WOfcPR93CHuDoeJU+nwFXHR7OSGxE7PSG693v2nms+Dbpb9Fcc
         u44oy8qIlH2MI0qVqsnR+sexqedepuDA9Kt7b2OACxMdzY8ZZxvjYLhxCY3HvbGr3wro
         zSNzOfs01cKfTblz+nPl7Y8mysPPX6fARORzHy5sX5Y/aNVNiMjT0DW44L4AOzHd22CA
         grgaR3/CsV2nR2wjLNWEZ0ELFqV2a1rwmrnfNopPEZp7jmoMTHxHIHAuJpsDpLxTOaFV
         x2SglDdLRKYMTvht5zCdsbfpU78Mg43RWfiBgVwF9S8HjxIcVWElqXCbHvltQa0vfkoI
         v+Fw==
X-Gm-Message-State: AMCzsaUailDqbB084OH4qjIpGlsGlRuqXgM0y6AmO6sCLyIxDOsypv6j
	1SJ0juCoke1nh8Sz1tnqyWgqw6rOQUHvWQ==
X-Google-Smtp-Source: AOwi7QAje6EfJ3MMfs6DVFHq87NS88RZZFjVMry1oPyqKVAXQZk+yrLzBg8K5cAYr1beX6fOGn8bnQ==
X-Received: by 10.84.191.129 with SMTP id a1mr2364165pld.272.1507927964461;
        Fri, 13 Oct 2017 13:52:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id t81sm3922898pfg.187.2017.10.13.13.52.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:52:43 -0700 (PDT)
Subject: Re: [RFC PATCH 08/30] softfloat: add half-precision expansions for
 MINMAX fns
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3476d545-ab0a-fb84-d97f-5368ade59b37@linaro.org>
Date: Fri, 13 Oct 2017 13:52:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: NncdmQ9edXY1

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> Expand the current helpers to include half-precision functions. The
> includes having f16 version of the compare functions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat.c         |  2 ++
>  include/fpu/softfloat.h | 11 +++++++++++
>  2 files changed, 13 insertions(+)

"This includes..."

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
