Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5772143lfh;
        Fri, 3 Jun 2022 10:06:31 -0700 (PDT)
X-Received: by 2002:a17:902:b215:b0:165:7bdd:a9f1 with SMTP id t21-20020a170902b21500b001657bdda9f1mr11260663plr.41.1654275991151;
        Fri, 03 Jun 2022 10:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654275991; cv=none;
        d=google.com; s=arc-20160816;
        b=AhzIScuAdikfKiJhIjI1ajmK/9i/z/VvhEVQ5AvUZJ4ngB7Es4M9ebrCzS3giR0d8V
         o0KTzRI2KFsDNY/STGMY9yh4F4EgM+Ib759jp6TP47j+iCeJF5vufbW9vbb6QZ5qARvZ
         m9MhOavVoE1+BEQ5vN5njOuen8ce5wAn2YBikOQaBogWomB7ybA02rTN/hTuuo4WHOrp
         buKcqkOb07n9FshA2NB5qStj6zxL1wOlCrXvPTEtDHo9YHnfcnX2mpSgFXWVNNYRX9QF
         C5f568SJWpFHioF/Ws2kHvRr3lDgDaiipiorY2IFUd+CkBSLnfxl1lj41EdLQg0GvOFU
         Iokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zpuRVH6tn528rYHfzVEZj4tyUj1KQQAZgikPCbFnAtw=;
        b=IxAVfDERHSUUt4xNhySy6WSaSpq+oy0W2CoIGgFYHZDShDF/D2SRV6QXDjHbIw6QQe
         QunPrHnlriORgO7cNb5oTvveU8C8xehI8CI1JLi3GO9WJH/48yxX2xh6nRnmGScioFwE
         m72LVib6aUT27Wjm5aNmTOQbCG65GqvUgppMhxxdNr6IEaQktEPwhoJLJ6kn1hzrqeLg
         KRdfLj2Jei1ND3r234WaeRFt2PYUZQhT/IYYtpqgY9n/1WXiKij7+gYQz7m+u+fLl/O/
         ybo1fkHovADXyeLtueqW8vVAtysX9dnSOKbBJTVJD0lbgYZ9YoJJqziAnrWjXL4al7A1
         rCdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uH6SEeVl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x136-20020a63318e000000b003fafdcf6bd2sor4259301pgx.53.2022.06.03.10.06.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jun 2022 10:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uH6SEeVl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zpuRVH6tn528rYHfzVEZj4tyUj1KQQAZgikPCbFnAtw=;
        b=uH6SEeVlDuaRQAQtzudgNkSMb9+LSfg9txUe1xPwiVHbT1yR9I3vLhUgSVqR5mLoXv
         IqEd5gglz6lYUWAvA1dHOseGXiFhJ3z3gtV5F2G1x42YYidv1iJ5Sx2rux0e0jMLLNpg
         hl3XRxY8HY0fi52+b3Q/igl376MpGD3Te3jVM3GEm7OZD/u/JzYzjo4u25fHyCGlFT1G
         1oLXLH1OZfc9EbTVt2pcSnOyLDIUToOft7fGFfE3ko3+tnjE60lWYA5scjFmPz3hfhtd
         6GHmQI+9WNUeoaFfS6eD8Sj0CeFTuBkIAa2I1YK7VbLMx/Q/iZ7g8WD3NXBrrZU3zlmy
         zLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zpuRVH6tn528rYHfzVEZj4tyUj1KQQAZgikPCbFnAtw=;
        b=FFnwUccfStWymTqvStecUmYkPIDhP43LFh4ZecsBwqnvWQ2yGlcC4P1lBfm5cjbHfR
         r/PcBwBOnI0r94m7QqnhN5xUA5z4Wi1RhURCB14gvVmxU4G7lUUMhIZLp0CnHfzL/r18
         vEJl41gUkrBKs+GhnhTMCMmBOotanLOCUkO5Rq71hpPbADULqxUs36vjHZGI0apEQXrr
         Kl9W0jbWorjld178h1rGCpdf1X3FmlJFkuzoTaBcdHb1ipkPUONmHAike35cbZHdjOsw
         JzqzMP0obbKnFHOH/2WNUPUWAKWlNHQtbraL/2pOLJu1XgUN0AKTVzN9msePQ6J2Jxiz
         HGkQ==
X-Gm-Message-State: AOAM5305tl5jGcYsXvl6LITN2n+aMySkfQzjmzuoWaPpCiIYAdjwUbAp
	rjQMt8N9USEE5T8TFkGVv4o/v6QU9s89Bk6Y
X-Google-Smtp-Source: ABdhPJyKMeC6ZJ4hRdiY+TR8LNz78kCwerK7LZIArLjYJwVTJF0Su7e9sNfXtzw6hb6zuxBih8Td7Q==
X-Received: by 2002:a63:788:0:b0:3fc:6922:704 with SMTP id 130-20020a630788000000b003fc69220704mr9788338pgh.6.1654275990678;
        Fri, 03 Jun 2022 10:06:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94? ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
        by smtp.gmail.com with ESMTPSA id i188-20020a626dc5000000b0050dc762815asm5741440pfc.52.2022.06.03.10.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 10:06:29 -0700 (PDT)
Message-ID: <8da904f7-0d80-c272-5a6f-8a080099ea6d@linaro.org>
Date: Fri, 3 Jun 2022 10:06:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220603164249.112459-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603164249.112459-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QbWMrtWEJiGO

On 6/3/22 09:42, Thomas Huth wrote:
> The disassembly via capstone should be superiour to our old vixl
> sources nowadays, so let's finally cut this old disassembler out
> of the QEMU source tree.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   See also the discussions here:
>   - https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg00428.html
>   - https://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg03416.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~
