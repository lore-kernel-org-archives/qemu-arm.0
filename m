Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1855964ejc;
        Fri, 10 Mar 2023 04:38:45 -0800 (PST)
X-Received: by 2002:a05:600c:3107:b0:3dc:55d9:ec8 with SMTP id g7-20020a05600c310700b003dc55d90ec8mr2357710wmo.41.1678451925085;
        Fri, 10 Mar 2023 04:38:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678451925; cv=none;
        d=google.com; s=arc-20160816;
        b=DWLxlyiFNmyKd+pDL/lCi4gUGpScLZs33/J7YN2wHyBFVQeP4agBJ/uOhcpBJwk6SQ
         EDV64vrko/0WfKfqSBFQAwkChnNfW9Oh7anJDZ5k22TAi3TDNdru+RHjE0jreucMboNk
         OVYSQ7RuHGpO0SJFajITd8wxZVub4StfLLLHt7wn9Pnv7mTFq/jFLW5shFrSgDm4Wyfy
         21FtW6YEJIFpYwN3KL9s80u84sKCvo3IqE2l2OGAZnuWMFq5BiHwQmtkG2ltdT19CFqW
         r3FGbQsiFcVISzOH2EL5Kq6dw9h1hGCFV2amdzpAowx5EFQla0ql/eaoWoW/ZVWVTJ1L
         3izA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9ntFU3BdFyxGBd20bM2b7GEbo6sy4YsABC9Wmrp+9Ao=;
        b=DsCJz5+G12PcvI1YG42i39vOIUK0QnpSkBHKBcMhDfRg3mSvyb5jawlkb3HJFuSV0n
         kgcav5FmWTl4wb9csL/TZP4nejpvtbFzWx/Ea6dQP+cXfH9+KCQyd567J21zNruCgX8I
         g8T9Kjn1V2HJaafols9VCtDCT16d3o7yiIbJMd+ijSNWGmRTdXfByAgK5k97X/mZ/z8a
         6hG73BkYEEvdXINAM93BwyvZfDinRTdiR6CyAzWCATjc7xbXw1+VqSYzvWAvU6Hgmv76
         Bk0N7gan4AGEH/tAr7U6DLz7XZc3bOtNi8JwsIGWvdN/uTVQkizK3KAb5ag62a5lYqLo
         5BTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCAioIWy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd12-20020a05600c1f0c00b003e2189c8c77sor860452wmb.10.2023.03.10.04.38.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 04:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCAioIWy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678451924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ntFU3BdFyxGBd20bM2b7GEbo6sy4YsABC9Wmrp+9Ao=;
        b=gCAioIWym7V+gLvRN9xe0gUUMjqlb9f0kLLSCEKlcZcjbkSc3voGgU37FWIYw0X2oq
         CssUhLw2sZ2n4S6WN52vPrUJScKolWt1SbmHQApR+l1vUareIy3xvSgeaiiCNmldpz93
         u+tztx9RMLTV7K0PjGVdECG+Hd81i0+DaL7xf8Ea9PchF7rkc448XsOhXqJ50MxfrTBD
         GvCS3c+eUn6nxsUp3br/d8r4iGwze4Q2eUs9bQoTe7OIgNJ045BlpokUVrNf428/wTsX
         cZJuQqGFSw0jTvG74bfxYRveh2l6JuesBIhXq35MHxFJlwJLEBphPXU+5p9KR/sSYVCF
         wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678451924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ntFU3BdFyxGBd20bM2b7GEbo6sy4YsABC9Wmrp+9Ao=;
        b=K++GaR/6W2JX26qy9s8Mpy+Bl25iXgKwdDoPP0dJmjW/5EIIjF5wkjelzDGS85VYsj
         4v8djzHl6jDndn+csD3nnMhEzNVcdGHfOs0e2qA88oCpfMoxqpHWE9Z36lyQp0mYLaf5
         K2hgqJT2gjVPaDB6+tYeV+3VIDpzdAzZ3KeOh8vWmnqDWLUIztQelYlSjeBQsfyRFJBN
         UWbg5Nr3LUoU9RkehJZUX5ZpR6LsArdbrA3jSGbYtrjZ8XJzdpQyO2GqJwpZctTKYLaI
         zTmxheb67mq9EYXqS9rnWareom6TQCLAD3Cpm1wJ8aHJjIKHq2EnS+MNBB4wr5Yd2tiZ
         7KKw==
X-Gm-Message-State: AO0yUKVJBwYZDiK86MOvelamPvSPWFJOjFA2VIbvF1tWXCCupE62VH8g
	PjBMR9lEPhXEsZ19JvhZZU6JB65v+bfvBxsa2h08bg==
X-Google-Smtp-Source: AK7set/pdMVn0sIzr262Yqv+y1Ge8xko/xPiGP0LoLeCVjbjfXnJnEhEWV6VQnj5RWdhCSZyUnJNHg==
X-Received: by 2002:a05:600c:3ac3:b0:3ea:ed4d:38f6 with SMTP id d3-20020a05600c3ac300b003eaed4d38f6mr2564948wms.4.1678451924517;
        Fri, 10 Mar 2023 04:38:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] (169.red-88-28-29.dynamicip.rima-tde.net. [88.28.29.169])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003dc4a47605fsm2961186wmf.8.2023.03.10.04.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:38:43 -0800 (PST)
Message-ID: <8184e8e3-7dd3-3a12-66db-531e6a0314df@linaro.org>
Date: Fri, 10 Mar 2023 13:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310103123.2118519-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9Px3kXnu7kAO

On 10/3/23 11:31, Alex Bennée wrote:
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
