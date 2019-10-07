Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3808393wrm;
        Mon, 7 Oct 2019 06:36:29 -0700 (PDT)
X-Received: by 2002:a81:a553:: with SMTP id v19mr21120612ywg.381.1570455389469;
        Mon, 07 Oct 2019 06:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570455389; cv=none;
        d=google.com; s=arc-20160816;
        b=sEioQ3ZOCMtv/F/5X4dypKfU/pRBftG1pnJAzKHnrMkysPKlI6qEyT93pcVmlk5SOd
         vemPvnqKCk8y27qVkRkCmaG/tX9tdbh7K0cM4c0WZ8kIIACE43tHH6CU+hBHt6sZPO6u
         MRFJxjoFAmsm2oO7ZCX5qBtPN20IynVAiJQx7GmF7PfIxNhZYdZc65kQGTF1DTuDY5lK
         HNX9UYIpgfW7BWti/Ax5CMq1XTtKoK7V5jHeRHnh176Gg0tu6mARJfJqAE53vAFaEU35
         3HDL+g+0hmoWF7xhTpdjcTA7PIzNODMyKPFsX75KHxCKiEmMr92yPpU86Cc62dcVkz/w
         X0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Ny1aNn6LVxX7Bhak4U7E8JYqggUXalQzYCu2EQpeTdM=;
        b=OEC06s/s0ipGRtoXpmiY5j65C+K5fapu8hdQkbq3Fn0qd8TQH6b5bn+6WyfXbn1dbE
         33rXhWFuUOPipet0H0qwi3vV6aB2VA9mxGb0/zD0I0BWK/2Dfq6ld/J6AXww0hrrIWm6
         daT/SU/fOS3R9ieXQ3oGgv2sxxeSzYuqKp6TwBRzsrylqwdXF4iWeOxWUyheNY7lA4id
         Xt4MuhdOay9U4GI8LVtZvko8Bs030ERiiUH5UcvOE6EH5EL7EtBRrnhEO7jqYFGv7cfn
         bUC/KlmN3T1DhFJsDm0lRN+96JY5foRuo/g5GzY2gQoowWpzTY3kxD9czW8UVgr5Ovia
         ANmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbPggMEu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f203sor8313714ywc.175.2019.10.07.06.36.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 06:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbPggMEu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ny1aNn6LVxX7Bhak4U7E8JYqggUXalQzYCu2EQpeTdM=;
        b=hbPggMEuSI+nQWIKYB/4fji99+lN4rQCPaMMFC6B+qiqXKiS32M/ydYqUfwLU7sxiO
         qdZ6FkCUfFtzkzzRk340c+Ji4zaXpr84WA58R0A4nE8s+sFba8Jh5czBmr72w3ruoFsk
         Uzj8eDRQsozD4vZZjcX+JdakA886pb9dkTaUfA+nWmi/Bkg76SRaki9pzFq/aptUA4PT
         x8mJXL12sLX8c4jlXlAcxHIhb8ioeeqUUMSC6h6yr12BdkfyMbzOfCcC96x4iKpjofst
         jLYRb7Zsh+oi4LXAjCUdV/uTlBdOfF8WjBbkF99UaVpUAJJ5Y4OmGOWE+NJO1mqAA1xk
         RMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ny1aNn6LVxX7Bhak4U7E8JYqggUXalQzYCu2EQpeTdM=;
        b=o7rFbHzVSz++bQP6PFAhutiT8ri617WRGoAQxhZuILglA7yVLmmg0nCHG9PnRPMDYH
         h7jjXAGMvJSgbFTrY5nkMscUqr88XjBrFcxX46Vh7aaQw20Maffw6nAqk2JdvAfFEk+0
         D9x+dqdCJ9unbJ7w2I4mTVIqHwznWSzuAwrpe3pUPPRM8BbKVT1jgRfFs1Vs4Wf4/yTW
         nbGzDyYG6jOwIrmgA2dqYGq6JgWB5NHSlU2jYAbIM8R918u7jsE+NxxDtaB2COJ1A4mj
         R8no81/0MfMft8Ckvqk6TfW/vsNcyiUpLhe9bdaChHIv3EpnslyEIuUY3O1z7R/6zgWm
         YqpA==
X-Gm-Message-State: APjAAAWQRbCvGFL37LDotxivJWcmvfOx+VOJRMs3Cgigh8Amc9nAYrzX
	pahCBpXKXKQMrtTQIwOYmPU8o5tFupNbug==
X-Google-Smtp-Source: APXvYqxnCCgVWB+cg88+W6cJ1RjrVkGBaUZ99AuFXRSsv37lHl6UMsE+VX+g0m9D1a67l3+MT9Wv5A==
X-Received: by 2002:a0d:cc86:: with SMTP id o128mr21060695ywd.416.1570455388482;
        Mon, 07 Oct 2019 06:36:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id 12sm3971513ywu.59.2019.10.07.06.36.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 06:36:27 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 01/15] target/arm/arm-semi: Capture errno
 in softmmu version of set_swi_errno()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8bf09c55-967d-e1ac-3c0a-78076220dcc1@linaro.org>
Date: Mon, 7 Oct 2019 09:36:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: eDDIcRREvoMn

On 9/16/19 7:15 AM, Peter Maydell wrote:
> The set_swi_errno() function is called to capture the errno
> from a host system call, so that we can return -1 from the
> semihosting function and later allow the guest to get a more
> specific error code with the SYS_ERRNO function. It comes in
> two versions, one for user-only and one for softmmu. We forgot
> to capture the errno in the softmmu version; fix the error.
> 
> (Semihosting calls directed to gdb are unaffected because
> they go through a different code path that captures the
> error return from the gdbstub call in arm_semi_cb() or
> arm_semi_flen_cb().)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB that a later commit will put in some cleanup of TaskState
> that will let us reduce the duplication between the two
> implementations of this function.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
