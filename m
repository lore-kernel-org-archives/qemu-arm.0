Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2019853lfj;
        Mon, 17 Jan 2022 04:29:22 -0800 (PST)
X-Received: by 2002:a5d:5745:: with SMTP id q5mr19808256wrw.381.1642422561895;
        Mon, 17 Jan 2022 04:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642422561; cv=none;
        d=google.com; s=arc-20160816;
        b=qXO+V6ga+AEVU60966Jxb+6uxaP0eCC3yyq8CMhVlnF+OiN1/p1a2cOF2RloVTcyHG
         87Y/NHeE/vQGKsKWRChePMkiwvXwkDN53UAA06O508Y6FHHcmexz4jcxz65xiGbXbPHD
         CEIe74tBsIQf7RAmB7MfJaNOTVLiXduVV72M4Vy2FYyAPuWDhujry7PvZA8MC+qb+KdM
         107+B+z2ghp7xd3y22JkqWXl0WV9vww9PhBsuqIlbxBrCLjw1yd7tja/GcU/pmz1nW9i
         xeUKcBTztbqhEC/R6j1LhqDwzIEp4oZQhKG4lUE0GREbMeOD6uw7H/GykSnpfi73GKOs
         k1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=EbFpMn4ZN9+tA5q1tjlgrdMpTZqE9EWZ2ycdfSkGbcY=;
        b=N2BeGvFpRMHyUlLnNdJHMS+lci0BoYkrA05apAI5PFS3EwJXrAZ9NyrlT5UaMKR6dD
         pYIyVI79xkezct9KhxGVx67unH1Nu971sa2PU+WaIrYdK0KPbNYRwks8XyNR69uNvc44
         3kftviptDRnXZvb1N573/nbdysIWPc7kT5Pjybqv/X7XT5Jldu5BBUGNhBK4KhEw60BN
         iQxk2SvP7ZF/rqkBz7GpmhqtzjqALYDUo9PejvqrgcIEi+FYLNYBJ4Bnm6JivN7E0POV
         j+itYiAI2ncupsvKkHbraHIxr9hw/UJjHKs4y4zsJXnf2d0yDeBPfiwn0v4r1OqrRGg9
         O0CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=d+Kv7mQ4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f15sor1785258wmq.7.2022.01.17.04.29.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jan 2022 04:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=d+Kv7mQ4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EbFpMn4ZN9+tA5q1tjlgrdMpTZqE9EWZ2ycdfSkGbcY=;
        b=d+Kv7mQ4gnyOIh98oZCUO5msojK1Uhx9hL2pKbP0OFDU2y3Kadkv1SFmQKaltnuvJF
         TPnrCRlHt+xkLPxrfzadk8h8Rcrt6oSHNER1f3SBBkSY/4EHmzGetW4HWc9HSA/P0MCh
         df7I+XYDC0J3ICW6pC40H6FnsGiTxO7I5r0SgTw4jCY0qY5lzl7iLoQWcMlchcq5L43E
         a1xecCgugdrTUJbJV+JNJw0i35OJ5joJeEDTBtzSydheeBfYCkofUCzkDwSPPpmDiHTe
         7/0eaq1rxc0XsRbhQ0Ai+ISXLnsAZ+GCLsXFraAibwU5JMousS6Nvw0tqoRWfbERJQuR
         Gp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EbFpMn4ZN9+tA5q1tjlgrdMpTZqE9EWZ2ycdfSkGbcY=;
        b=QSd064guPDFfD/uRaZWLLydWklo4HzuhxvtWju6AX9AlleF0g2oOM4bOMUs5ciqcSn
         ef90PDicznO7KnvNLdoOWqseCjdNOJJK8fr2m3k3tigb9DA4Yl1Nsv1V0rp8P7Lhqj3q
         YfMZhLJQE5sYbhVEkvyv6dNo5egizIbllg9lldCCNPb5gAerYQkkILqXHaHcs8Vn7ofX
         AjmBG+aM57Mew4dNY+QaOO1NFn+fZ94d/jpVOJwc2v/oW24Py/Fqy0nrFzxp3LCinPCx
         16glDoICbbrfjDuEGBQ7ubAnvt81546qmUKBBXhzkJaXR31SXCgNzol6/J0Q8rWt3iI3
         9E1A==
X-Gm-Message-State: AOAM5311D4DxMPLHVYcMx2iUvctlFV8S/y6EZ8qbUwgKyrV6qGkGj4K+
	NDVn/hvbHBYdrb8+bT7MJpV4pZ9EPIXDfESa
X-Google-Smtp-Source: ABdhPJwEGprV4SAf4wkm1JoSmA7T518wmb0VvXL/Mw7v2y5JZmDzlQxMlAGEcoqE8K3HB+G7kBTXaQ==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr20245753wma.79.1642422561234;
        Mon, 17 Jan 2022 04:29:21 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id v3sm13810540wri.4.2022.01.17.04.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 04:29:20 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <9f9d83eb-02d7-bd5a-e72e-62427b785253@amsat.org>
Date: Mon, 17 Jan 2022 13:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 6/6] docs/devel: add some clarifying text for aliases
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110175104.2908956-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qEQs4Tvz7Nsq

On 1/10/22 18:51, Alex Bennée wrote:
> We do mention the limitation of single parenthood for
> memory_region_add_subregion but lets also make it clear how aliases
> help solve that conundrum.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/memory.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 5dc8a12682..69c5e3f914 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -67,11 +67,15 @@ MemoryRegion):
>  
>    You initialize a pure container with memory_region_init().
>  
> -- alias: a subsection of another region.  Aliases allow a region to be
> -  split apart into discontiguous regions.  Examples of uses are memory banks
> -  used when the guest address space is smaller than the amount of RAM
> -  addressed, or a memory controller that splits main memory to expose a "PCI
> -  hole".  Aliases may point to any type of region, including other aliases,
> +- alias: a subsection of another region. Aliases allow a region to be
> +  split apart into discontiguous regions. Examples of uses are memory
> +  banks used when the guest address space is smaller than the amount
> +  of RAM addressed, or a memory controller that splits main memory to
> +  expose a "PCI hole". You can also create aliases to avoid trying to
> +  add the original region to multiple parents via
> +  `memory_region_add_subregion`.
> +
> +  Aliases may point to any type of region, including other aliases,
>    but an alias may not point back to itself, directly or indirectly.
>    You initialize these with memory_region_init_alias().
>  

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
