Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1545501lfk;
        Wed, 2 Feb 2022 18:23:26 -0800 (PST)
X-Received: by 2002:a17:902:c102:: with SMTP id 2mr33152504pli.92.1643855006188;
        Wed, 02 Feb 2022 18:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643855006; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGmx44QvV9Yg9lP+ppIMwXgu+vy3BSH7/GIqH1M7mBhZ5RorfnsIOD6gDYBFFnIxo0
         5D3zQ9YjmGmjINFVIpH5MxlT5srjVNADNFajGRyDN9qujTzry72AbVbce7ifv/X1eZhr
         Ub6hEarwomBqv83dnaiYGVZSlQu6lyv4aEWSuyEz7luzhJR7rDduCKreK5nVHp4hicAj
         ZtvX/FzAAyGVwNWauVwRejoVUuO+QxG7gjeb0yk9CwZf8r6FQRXRW8IMpkSyzF5TMtOz
         JRT/Jyoz3awFlPNTvKa7XHRlb8ALaiSc637wwDO3KYYEbTHqckp7R5i+0ysBNPXlQo1K
         7OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tIofPPFKxe5KjVvoF9VUePFaya6n4ldKVA9gyauPOAw=;
        b=hAa4mc05AkKLg1e/a5cHk2tUAk9IjLZyIf/W1ISMF2XjoF+Uh8xjZ9hlFN9z/Nd3Sq
         +eJYb3QHS2CmGskBviN8aJkr6u459qj0w8ho7woGthwrWO9qkFYMT+6aCVwo8NwmUDuV
         MPJUDeJT5dpvOuQpYB55l7TGJcTfPg7rLTzJwQfP0jFYyhzL7n4EpNKU6vYwj4B48rMK
         en0IWETrtfiz2gtQqAz6gL2FpuXE6NPevlKCQ/7AczpY/42Rsi6yFRnsd9k3JgAzn//S
         spvQVFck1CucE7nCykyxHipI6okexi4v55/N+XC9I6NR5iTSL57WgElqU8tqvy/uy1Ph
         Io0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkzxAmxQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u1sor9223787plk.63.2022.02.02.18.23.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 18:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkzxAmxQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tIofPPFKxe5KjVvoF9VUePFaya6n4ldKVA9gyauPOAw=;
        b=GkzxAmxQjs4BFwJfQYqxGhyZcfYsK3mMnUQjYahziyTmxLqTLZsKt4dO53yjk4Ftzx
         PiJjC0bVUaiJsHASJf7GWuuXHB+3zEwlBxTgc3SScbNBYFaLBJfosth1gVYdlj61g6ik
         UMv0tthUoCXI+75SdQKX70iowvnNj2xCUYxYrfTGbxP1qgFuUzpvejmqb6ZZEq5MscIH
         J0fe6igDP+I+rIHnyllbWm0USgmLUT7ttVemblgJUmmN/jX3f84dqCPbq8z033NFnEA/
         ONWyEgSGs3FcbeFmrp5wTbBm7z+0+2MN7Y9J8XnlK89YVogbyb2RS+SuMxo4kFq0dNdW
         uUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tIofPPFKxe5KjVvoF9VUePFaya6n4ldKVA9gyauPOAw=;
        b=aNYPsviaLi9dzZLbV6z2GxOs9t9obcrEsV6W2XG23Xz6/DH4FCA13ZwXPS4zA/Pbz9
         JukIDmlR15NscEq6Ckk9oTRUH20UfQG+d2EDVpfWL8J2Y7CRN6dTu2/uHnuVXXHt5qhO
         qpA1Odrems87FT+nDUuLlVkBhh20JSmsvxwMbUUoSMcVk3rkJJ3jZzZEjdMQTHhMg+Yq
         h3Ul6xZfaM/bmjsLLL79NBEq9Z7nfvuqzvkCyhR4mNmN0D9O0KXQpRzHeEYX3RwMKGvh
         L5FMdUBeadQQIlLYPIaDrK45mSfQCyiRPDR5pAWvAkv6luo6tCT6PMZHyKvqnG5PkPlW
         fkcg==
X-Gm-Message-State: AOAM532TzxjLnb+uxY4BlVnhFUpWyTfHJi0JnI3ysY5Bnd+6Tj7W0xI+
	sr/m3YukTdkp5sQe0rbjbarl+IRF
X-Google-Smtp-Source: ABdhPJwZ0O0Hs7ESKHYCi44AMYSTFUZEB1Tp6Kn4j5yU0Y6vOai7vte5ni10yrH5vd00d/VX0OjB/w==
X-Received: by 2002:a17:902:8c92:: with SMTP id t18mr7404042plo.11.1643855005646;
        Wed, 02 Feb 2022 18:23:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id pc4sm8954145pjb.3.2022.02.02.18.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 18:23:25 -0800 (PST)
Message-ID: <4d102117-f62c-825d-e686-d5b3331078c2@linaro.org>
Date: Thu, 3 Feb 2022 13:23:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/13] hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a
 raw uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: r8OymSOXgcv5

On 2/2/22 06:31, Peter Maydell wrote:
> In the ITS, a DTE is an entry in the device table, which contains
> multiple fields. Currently the function get_dte() which reads one
> entry from the device table returns it as a raw 64-bit integer,
> which we then pass around in that form, only extracting fields
> from it as we need them.
> 
> Create a real C struct with the same fields as the DTE, and
> populate it in get_dte(), so that that function and update_dte()
> are the only ones that need to care about the in-guest-memory
> format of the DTE.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This isn't a massive gain for the DTE, though I do think it
> looks a bit nicer. The real benefit is in aligning all the
> get_{cte,dte,ite} functions to have the same shaped API:
> currently get_ite() is different from all the rest.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
