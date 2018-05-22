Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1690220wme;
        Tue, 22 May 2018 09:14:09 -0700 (PDT)
X-Received: by 2002:a62:ae13:: with SMTP id q19-v6mr24782676pff.155.1527005648886;
        Tue, 22 May 2018 09:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527005648; cv=none;
        d=google.com; s=arc-20160816;
        b=VqKRoFc7dtZ7GUjlQEN4/OZJmlrjzVqANGlTdA9n1j3fES21vDalIBffrVb40BKbqC
         XmLsLMjU/e+z+yM7qQxVjWuUwQIa1xSsRFappeKWcL8NHfWhsJa6xr6DMKNhNr71HRFa
         rO2rlIbDAtXE77R+kZG++ur738xmnkUovGPn2mLPUoW8Pe+yEZmuNCSZq5BsNIWdCMvT
         RcWYzWfRQryT+gGzwCWJ1k8zW9zfFiRHmo/SOAFQHmTtEX+nM6JO8oywWR3jSsyy2FwX
         ikjrMETHd9iB3ttnPWERW0LWKCmxr56xPYScvr0SZt9W0/4p+PvOxWe7Z7NT4JWGDXYZ
         lrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=BhT2iyK8CbSXk7Vvly2J4juIQr1NLmi39EziOrsu/xE=;
        b=j9tCGejnAWZ6etcimORB4X4ZRiEGJMM0lWjn+pP/SvyeEJqbh1D91NtSwIYfuNZmwL
         ieqkFmi3HDgLOqeMV13PUVtQWbokCwlkdnOE3gq8PONvexq2BRIfG5UTPK/8DwnttHEG
         vtsIkZPzDuj3H6ntD0kHMt+NYtDfuoWvS9wVU8cxeey3q3IMBjO57UQvzI4c8wLrlpyK
         qqEz3gMjPet8hCcSJ8GPr1F0xdWH/g8fjslrMSuHR4KTRjW2Eu73wnQS1Uly3QH7YS6h
         RyKRZhUqoxmsF6wPxnXXqsUuliZL5hF/kz91avEjLunXe6vgwpsrBMd4/lPFN4sLnU7F
         6V4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nP+IRGlX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c1-v6sor6752073plz.138.2018.05.22.09.14.08
        (Google Transport Security);
        Tue, 22 May 2018 09:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nP+IRGlX;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BhT2iyK8CbSXk7Vvly2J4juIQr1NLmi39EziOrsu/xE=;
        b=nP+IRGlXpPaECMR9RW5Kql+jNg3NJlBmbTxe9/5Wkak/EEZmXgjComIqGy/KVr0bEf
         KOikReWjzrNpOXj5SOVLR62taxUVlweHTizoVdG9CYAak+9g6f3vKe7XTAhZFQOALz69
         qAdOgvlfDjMomyBwH5DhljFBryroiVQ5POWvMj/j5yHar15Cg5fGzSNs+q3yxBxFxdU0
         qIaJYTFr31mhQgVq5WzoBWHrKQJOrRt3bFSrOVVt0wrKHTpLiI1WleMnFLq8GTWWvqn7
         3mzjBYqE//h3DRYDGSi343gfVhSxQpjxb06kSlBVXB3LGNU4z623i+R9PmBtMd6dAa58
         mpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BhT2iyK8CbSXk7Vvly2J4juIQr1NLmi39EziOrsu/xE=;
        b=QLSTOavx0iIpzHEbzWqTlKOaL/yDwGUkJ2TQCs4HdVegKxcyy80CVasbjionG33O31
         EOYVDZyqHJf8xAELxXf7e2ZU4+CdEuOsDOMxQ5ohealtU+7iuL77A/fl4AI4A+C/zy/t
         9782qssF4O411rv34uE+H5k4dV98hgW3RR+bwWoqY3sQZTQMVfXG8U9YtAj8uuB5pbvB
         CYiVsQ3bBvzm0yKMPoT0IW9D1oV0bWGoL3WoKNBgoMyxhGH3odKaBr/wgWwDgzZQ/TrI
         BFmvWXPsqZuOLQV0JLlb84BPtzp/bYnZGd/pS5RovnRKUcCQXozaipgt4IGcsNxzkZeS
         33Rw==
X-Gm-Message-State: ALKqPwestIPwh+vLBd8X2cHBuCIQ0rrgK/b/Mz0tCBSmoMQb8vIGWq2h
	EgoT52gdf5S8oflnNUc7Kjm3hGLS
X-Google-Smtp-Source: AB8JxZo087sqrVrKza2UDHfdsV+ei6sS1upwJmjN8/LAGjMPV5q3HJ9pHQi1u9YXO+PdaLRSD9A28g==
X-Received: by 2002:a17:902:9344:: with SMTP id g4-v6mr25707902plp.10.1527005648195;
        Tue, 22 May 2018 09:14:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id m11-v6sm21418180pgv.48.2018.05.22.09.14.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:14:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 05/27] Make address_space_access_valid() take a MemTxAttrs
 argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-6-peter.maydell@linaro.org>
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
Message-ID: <1defe7d9-cf3f-6edd-6e01-fc26446faed7@twiddle.net>
Date: Tue, 22 May 2018 09:14:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: KOZtvK4wIEL7

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_access_valid().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
