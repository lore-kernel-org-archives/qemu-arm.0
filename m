Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4662577wrm;
        Mon, 14 Oct 2019 09:46:37 -0700 (PDT)
X-Received: by 2002:aa7:92c9:: with SMTP id k9mr33764722pfa.155.1571071597641;
        Mon, 14 Oct 2019 09:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571071597; cv=none;
        d=google.com; s=arc-20160816;
        b=AOmRs1lyEjC4B4goZzFO85TVD5JguYhyEmijN0ImF6m96fI2Oq4lPubr98xUlvM5dL
         v5VRm9yY0ex+9kaxCALA1gEeI1X9EuggJv0hzRD6wnaxIrxw9Cg8qgvx4ZkHRKRUb2Eg
         9Kay3yEOWIVX+6zQH3Q/PJoypwK5Ywjuu1g7xwoFGFCF4zHEagNx0svd5wOYxIIReg/u
         CzA954OzLlmoqT0OWEory5VYI4XCaSTlF8NdLnF2SrYZJn8vbRqQ53/RzGZXQlnM1TZt
         q5arr+8PXOTy9OTiQo5B6HeA77IXiLjOEhNuEjH7haUBvpTHQDO3bF9WI9U4NNfPaOP1
         o3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=dESNirl8armO28oQGNDfDZ6Ay9I3M9ghXOLXqmDLpgo=;
        b=uTqJ9SFSlZEwtkiJ5vZJpluUwJl4qHRimw8n8deIvwZb7SH+UyziW3c/RD45ol5Kx3
         oJLrsWqwH6Xlr1jZA4jYbr1zlroBz5hIK/+K5RKCAygXjpylRiQ9ub3BQ7/0ecpfGF4n
         RzKR5vwYQeZUvoD3wUcKbzsnDMXtPkqUgLwmnL9SzfDhOHG7phZb9q2lGFaoIxTODf3b
         VTPlrfpXoZYoQk2CKvs7jm2OSq0SI+eK7y5BLNlcnsUej1ch/KKyD3wHjN+AcSVOIDsL
         D1GSZgXDztvLroNxZqdE35jBxkaGjjYRs0gRMzJXxzyelVwJP4iC30OQok/33X8RdHHN
         G6JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V7B9W/yz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a14sor17963632pgh.66.2019.10.14.09.46.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Oct 2019 09:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V7B9W/yz";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dESNirl8armO28oQGNDfDZ6Ay9I3M9ghXOLXqmDLpgo=;
        b=V7B9W/yzhQ0N8sbYMjv3r9HqtxWGpM4apy5if3Tks7cJoaVRYfnTxr/JVoy3BHH+vp
         C1od7/O6pLle793bYzCmucYdTer6FIk+opr+IOTDiPxNXQdYM+RB2yoy0KkEzIG6ZNfO
         rsWlBVYknh4ItG1lkl7xL7tp/n9vHKsGiuoxVa+U1DDYfvvUTkkF7vTfEGjR0I1FA/6L
         BWQ1ijvEh0v59+L8aokYkJIWrBsZtZbbFyZrtdN1Ftz1G9Zum/4c/O2OIHMFrynAuJSD
         pLEvGSDzStMvx75Pe8hPHq4mLzFS3EYOY6YWBpwIEC9O2cMjw1h1r8B9mkFpcleJiR17
         nUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dESNirl8armO28oQGNDfDZ6Ay9I3M9ghXOLXqmDLpgo=;
        b=C+jmjR9l+0GtTeCd4mjWkGU1Te4y8ErNTuz3YehRJYmbWXeCSxdT7EFJ0KX/qjAM89
         ctpgVHgZ0dHS0MLG8C6Rwax8z0qnT8AR5Z15qGMVLlyWMCYRVOOgomYp3Ug2i9bzL3Bo
         Z97ct8mD0S0PXYoQXy1fHyreKuOFA75TysZ2fOc5igY7dkRuWx0D73rZhtijAMsBG4bw
         wfbAm7IewMu72AYdxkdUSTj7lEg6lI35nNMY6lUv6UWajLxVzulYDBUObIXM1ksWEkSt
         +mfseS1bwzRgTf5SieIujPoEYOawKRcCscrh4MVq0cohEDK7jEtzOVxEKAP9YsjIOl4w
         RA5Q==
X-Gm-Message-State: APjAAAUJ84JDK4Wn7L/l4yVmYh2d/BpHMa/Qp3YfEAEOajaAmz3hko30
	DSn+R5SS/pARJsoXLLhDOZVU0MXO
X-Google-Smtp-Source: APXvYqzWRm8b11ZYWxgFGgsQmFTN2bopbMwiTXNtcg+kCFAe9wk0oC55Y6PqcfAvhvYliYVBqI6tQA==
X-Received: by 2002:a65:408a:: with SMTP id t10mr34474915pgp.385.1571071596937;
        Mon, 14 Oct 2019 09:46:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id b69sm24968947pfb.132.2019.10.14.09.46.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:46:36 -0700 (PDT)
Subject: Re: [PATCH v5 44/55] tests/tcg: enable plugin testing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, robert.foley@futurewei.com,
 peter.puhov@futurewei.com, aaron@os.amperecomputing.com, cota@braap.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-45-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7b594021-a722-82f3-a1ed-facc0d6bbf0e@linaro.org>
Date: Mon, 14 Oct 2019 09:46:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-45-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yTCl9oevwQuJ

On 10/14/19 3:49 AM, Alex Bennée wrote:
> If CONFIG_PLUGINS is enabled then lets enable testing for all our TCG
> targets. This is a simple smoke test that ensure we don't crash or
> otherwise barf out by running each plugin against each test.
> 
> There is a minor knock on effect for additional runners which need
> specialised QEMU_OPTS which will also need to declare a plugin version
> of the runner. If this gets onerous we might need to add another
> helper.
> 
> Checking the results of the plugins is left for a later exercise.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>   - fix for the latest changes to check-tcg
>   - extend timeout for plugin tests
>   - add special runner for semihosting with plugin
>   - fix naming of test in call output
>   - add special plugin aware runners for semihosting
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
