Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2526620ejo;
        Thu, 14 Dec 2023 10:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLwf2MA8KKnkr1dbQY4o6EzJhgYuIgk1blLM6XWa/T4mt4uSsO/bicBRjGudpr5wKFK6WL
X-Received: by 2002:a05:620a:84c5:b0:76f:5b9:3f29 with SMTP id pq5-20020a05620a84c500b0076f05b93f29mr15116070qkn.2.1702578624378;
        Thu, 14 Dec 2023 10:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702578624; cv=none;
        d=google.com; s=arc-20160816;
        b=fFfABvkGM4DnRepTXwoLXkWQ8xZ9ZJ8d7M5SuHCQt8vaRpx9z+yZbePYtN1h/7l7CG
         zK7uXhpu7a89se64bO+25cjigcSq0lBcE7R1v2u/aPvot1BbdU4DYCbssMUJBc6yhDsh
         XBq5bhmkNjpabEfqFAEPTSc3URNACQDLVLPAEOfMcyZ/oHVprTJQqWmaeJAyFFwv7ygs
         TOHdtTRQ27NAWsC+ek38Nu5fSZ+SDl24aqeu6t4XygXEPNUOqxR3Kj1KC5h8Xu6y/qTE
         nNF4zGW82y8lA9tchj6ODaEGcvzGIGAnHim/b8Dhr7cf3l/bjFJZFkn8qrnVgG6S5q57
         lbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=CPOZqa0ITrIxh6mhW86wXShisg+TCpntOgzYzAqQqzM=;
        fh=4eeQJNwuoqOF0I+7AUXaRYUXx2oZpmO+5NUYuzIxseU=;
        b=mkXFIL4S5tjuufpPdKUGq+nI1mv8bAAHix4EsOtXFB6xOPnHqPco1Ku93waZBd81Ec
         3StlUiOKr8cn6OmCXYCA4DEQxapYRb9ZwmihoF6P98lCs8/DUlI7he1K/x2H6e0V7hh0
         UDGc4oCP/Y8HESYYonimHKmFdJlNe8WKCMx6YS2BTw5zb5dfGvgyKTt2FHsHeux5ln1/
         xcWY/ysSeduqmFoApy1KMdBDJjphSaSqbfla3GiXVjhqt9SVv6qgcHAFej4eX1P6YyBV
         yPDtWPP8NAoqktAXSyGCXw2NbZZaeJCoObfzlqkJQ5SJn1XwLfSoiKgVmmJLtcJvEF2D
         kfAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GLoaW/bO";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n5-20020a05620a294500b00779db6b77dcsi16825105qkp.353.2023.12.14.10.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 10:30:24 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GLoaW/bO";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702578624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CPOZqa0ITrIxh6mhW86wXShisg+TCpntOgzYzAqQqzM=;
	b=GLoaW/bOKgcbrqdyUz1zPb9Db57FAd8kEM5nn6e8yn544TlOVuwJt80xP0w3iieD0Ba7kX
	9UAhDO1l4b+f5owuV6J/9AxoGaJfyu5zAy41do1GfWiUnXCnzXAMRr+y060bzmy2Sb6AZP
	bmLGh6IdAsn9JlvEAHJAD/Muz0F5B+w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-zO2gLPGaN9KBQpR7_2ytjA-1; Thu, 14 Dec 2023 13:30:20 -0500
X-MC-Unique: zO2gLPGaN9KBQpR7_2ytjA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67aa0c94343so14936916d6.1
        for <alex.bennee@linaro.org>; Thu, 14 Dec 2023 10:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578620; x=1703183420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPOZqa0ITrIxh6mhW86wXShisg+TCpntOgzYzAqQqzM=;
        b=wLCcXbw9Wo33LhofzfbMdPSmFuaLr3nJ0/95m+/UgDcjmLztwze2cg52TIYRmhE0Ax
         OO/mS64BiiYk8TF/KZj3U+rgO2nUvqUp+MRTa2PXi2i8uUJFde6aQby+gKkDNMjztmMx
         vGsrjhtJf9mLn8UC1GgNtRfMdIwccOmm0249TjHGPkSiOkwv04+CxeZVPgU5SVJuAmD5
         jnwsgxElM1vRxHj3eBDpT/+xwZCCmOu/xR/r1AjWJU99tI/kMUbZ9+ZBXpsv8xPYdVUC
         MFR/LBVWuQv+YXZEvhDmoFWsSuW1WbCPwPkQ7iN7aevivSaa6FQIxa3OKJGNpUZSg7Nf
         /HPg==
X-Gm-Message-State: AOJu0YyLzaG9qijrLtYIB3+80jX7BQJRUMi8wHBvfcGIka5t1MF2MaAU
	dKKUFzXkLCgoHNNj1s+HScJN1TAy1p7mAT0oT4Z7CGZA8ixDPduCYFBCJKsBE3n0wf9+UG/4pTL
	+h/y8o042rJxC7gWf
X-Received: by 2002:ad4:5742:0:b0:67e:b3ac:3c0 with SMTP id q2-20020ad45742000000b0067eb3ac03c0mr20387235qvx.47.1702578620403;
        Thu, 14 Dec 2023 10:30:20 -0800 (PST)
X-Received: by 2002:ad4:5742:0:b0:67e:b3ac:3c0 with SMTP id q2-20020ad45742000000b0067eb3ac03c0mr20387210qvx.47.1702578620160;
        Thu, 14 Dec 2023 10:30:20 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-144.web.vodafone.de. [109.43.178.144])
        by smtp.gmail.com with ESMTPSA id oo22-20020a05620a531600b0077703f31496sm5484433qkn.92.2023.12.14.10.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:30:19 -0800 (PST)
Message-ID: <7b576994-9477-4b84-aa12-7e36d90e7529@redhat.com>
Date: Thu, 14 Dec 2023 19:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/23] exec/user: Do not include 'cpu.h' in
 'abitypes.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-20-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231212123401.37493-20-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rOjIOFYxq59k

On 12/12/2023 13.33, Philippe Mathieu-Daudé wrote:
> "exec/user/abitypes.h" requires:
> 
>   - "exec/cpu-defs.h"           (TARGET_LONG_BITS)
>   - "exec/tswap.h"              (tswap32)
> 
> In order to avoid "cpu.h", pick the minimum required headers.
> 
> Assert this user-specific header is only included from user
> emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/user/abitypes.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

