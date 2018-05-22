Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1769928wme;
        Tue, 22 May 2018 10:29:47 -0700 (PDT)
X-Received: by 2002:a17:902:b582:: with SMTP id a2-v6mr17852341pls.371.1527010187331;
        Tue, 22 May 2018 10:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527010187; cv=none;
        d=google.com; s=arc-20160816;
        b=R/mxM6cXpYq4anOgJToC1VUuCXC0dX4xEH7H7dyR/3XT2Csb95WSNhHQSERXqBcXg/
         XKQnzCfhCYXw5cB/Sq7iEve9udOyk7cI9xbFef2orZ+eVDy0Zt+nP/lLNwjFQjHVQGvN
         8VjR5/KHqEb+gvkpO1TOpBGYQ+GrORNuVu6OPgFNFbpAaHcu+OA+B68ZG2UJHZStPX/6
         DMZ0kuj3/tFeUgOX27CPxMqXpI2JJiEIMdJ3yeJ/HQIEZIEDP8zMgtt/Pao4110DYoDN
         NV0eFrG4LsXDfnzRI/ixWBs6SXTuN5FqQz+CphWrtH2qIOz7WGrMAeF2shZD6nbVycjo
         Y5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=984BbO/TmRGXZlP9fBjcqonvYg3O9hcTEUWgmwdkYQI=;
        b=YM9xZNM3ma21leFkLsWFR8VOOtii0VQbVUyExNcFw65skIsjg6jR6/rRppAFQOtjup
         zsGlgIUAFVEzn5bDMABLT/a2tKRMOXIeEpD3YAUjAC0Gm1ufrmmskQEXvXR+r9cjTK0/
         cRIQvZbm6+moA9NK3mZ9UuiayvqPxM6FKCIR1Fr7bXDgvtcSmEPf8IhrCDIqz+Mrza9I
         Krhx5/Mn9hF3tFnUcx1FE8EhDqqKkh8dcUh6iWvlnn9+MSnKQ4GM9zQF8GP4omd17Mt1
         PzgWFKBDmEtSBB/dwSmFJvJpf59Tt4V8wWsPXyjGzI+OpX1+dMS0io619Xz5CZ5pkcAq
         lXPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYQJ+haE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m14-v6sor7294274pfa.67.2018.05.22.10.29.47
        (Google Transport Security);
        Tue, 22 May 2018 10:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYQJ+haE;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=984BbO/TmRGXZlP9fBjcqonvYg3O9hcTEUWgmwdkYQI=;
        b=YYQJ+haEqZxxvPb+ilduNvE3oASnvYbqWXCf4IG12IVK3bfcCsPbcd2nPM5l6/vnOb
         a3gkInE0dCnYNoavMKXXy1CcTgF2AX127su4Zdc8KciUTG+2M8HIsGXbO/ps72R3Zp2q
         k7+CSyXQng2+Xr65DzHZFM/i9++qkzJqT3CuTzqzHtAIMwtlcEjw6xprx457z0ZB04j5
         cbVYycogXxNVILqdf6dWxRjHLaxAuDSHeduuzW2Bd8D4p/QyJofaGUgXUBNBi8wdvEfs
         OvP8OsPW8qBBHDIZwwUct+zWNwpTfpqbfsFpZUniV953uSD6xSMYHZjDFsD7bVL7V2Ye
         RZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=984BbO/TmRGXZlP9fBjcqonvYg3O9hcTEUWgmwdkYQI=;
        b=SPJjDppohDAeiYcg7GpeVPCQNhuuVllrY1KcOcMhHe8k4ikPVZZzk79PVM4EQskGf1
         h5ZLu8/lC+yv8G1Z+GhO8hhZQbDL/Nv6+wdyxlgeByyehkDjiMAgiQFALGu5iBZhE6gq
         +/SoIOwuKP+1tApQYezXcZT5Izr4g5bWTpKqT6va2CAiERib5Ko5j6BU6/g2+FPhsKVF
         +eHE2YqZjnRVRUhwTQ22yN1uW5DU7jG76OiWgntd3Pmo2CS9VP832WjTzZxCQfhLOg0v
         1jIOApJp7SWTayGrqV6P5K+OHpcMM2ypr4oiWQ/cE7hnrnyWWSGclY2QHY9IYrjNeCF8
         dGkQ==
X-Gm-Message-State: ALKqPwdCxwkJHR8YKWu7yf9VjG1IUgbmw6znyvRiIr5TZUcWeaAuRkYl
	INiIXryvUwuwP9iegNkvhypXTzL1
X-Google-Smtp-Source: AB8JxZqM34cvhGGxZHtXCZfMIp+y0IvnqI6cSZirS2SQiYXvuEjZIc4yHzSJbSkfoViAuVodfAjE/Q==
X-Received: by 2002:a62:b909:: with SMTP id z9-v6mr25219439pfe.254.1527010186614;
        Tue, 22 May 2018 10:29:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id h65-v6sm40529037pfj.54.2018.05.22.10.29.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:29:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 12/27] Make flatview_do_translate() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-13-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <c3b76288-a06a-96df-368a-814a4087d1cc@twiddle.net>
Date: Tue, 22 May 2018 10:29:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: D8t1h/9buTTe

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_do_translate().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
