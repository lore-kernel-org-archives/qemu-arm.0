Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp75001lfk;
        Thu, 27 Jan 2022 19:37:45 -0800 (PST)
X-Received: by 2002:a17:90b:1c8d:: with SMTP id oo13mr7639269pjb.59.1643341065676;
        Thu, 27 Jan 2022 19:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643341065; cv=none;
        d=google.com; s=arc-20160816;
        b=rbdxk0pKpqsOw47fbP/8ya8ifN7B63MXFaCxoMacvygbh2Nx0HLciWZeogazfAdhj9
         TFWLjAxvaUS8z2YF5WKdlgls6c5Ekxf7gKSa2eRExpZvAkDPa59Zn5zAOu+3+xnt3zTk
         jW4+3rB8yGP86IQtm6TJcSjb7zyR7qhtnE0kiTaD0ctxJdc0vCu+UHXBbHPXLsxWJ3NV
         TDYX2C26T/DU92WopSsfRXqEUwccvm2y7qgrqmtlxqQpTmxL6sQHKRZGIxluMib6aSCW
         PNEm8ZnuAjIquaO6T/1QhG0uDrxOMQu7NtWkw9UbXRbyLbEBRSQo1HWKqZDEMnZu7nBT
         yssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lNViaG3CzaemUEEjM7cz4z3583QpDIPZEFSIoFDTiAY=;
        b=Ffw3LbkmNBP4hU0S7npTASdEt1U40yACsOhbIwinBosdxM0UXwmE5fgIjev7LM3XBV
         r/J+exVxnSco1OI0xWbCLf0QrKzjpJ5fJeNAfdUAGyMC8xCjKqDbHnQ8ZYdTmO9W3btd
         /SQT98cjjrcTmVOjamibyGTtjZqFgqZT0w4jZnWLhPz+9Nwpz0jmUgjE1ZQvDeecuPYp
         n/wG7LR3xy4ug5P598TBYalQrcFp/nmnYAviM+tGaJ54eh4bepGbBzWn7Wwt6SvBQjZI
         chNyuCPrwuVLRlJRKngCAPAqPSL4qAG3FtquuTbcXGUJW0c9bp7sbOn53+xwqi7Jpoi8
         gCcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJLNAaRs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f19sor2114744pfn.32.2022.01.27.19.37.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJLNAaRs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lNViaG3CzaemUEEjM7cz4z3583QpDIPZEFSIoFDTiAY=;
        b=iJLNAaRsZK72THhGO1LS6VmXVOSZamddccmLb4i3jjoXXtR/zPLM8WB4T3FOz1oQKz
         f+GVXQc+v9IxgNRVMRs7aJ1T5mEhEvVSgdkhcZlcK2ksV6FMiZKLgTdgztaoLBd9SR8N
         UAyGdszCqZc9rk6OWURc/IJt+kfU9bftBUmU0QTxlKf0/1Y8OumAA3+eBHTa/lpTRMF+
         xzh3tKsYUZOeTePmwt62aeS3GMyJka82VwuTMdm14Wogibrd+M08YGMASLBsjVDVjYLX
         N8+o2Sbo/o5V4bC6OJHbj9p1h2G4a8K+h4Vhy9ExNF4yOyXnXwdvcAJfO84qS+ytC6Ka
         7MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lNViaG3CzaemUEEjM7cz4z3583QpDIPZEFSIoFDTiAY=;
        b=JCs4XZfQCo56/ZLJdRdBIJQDPjlVT0O6jHDzkb3CZUjlJaNCqaMQPCFedNNcr0J6xR
         TR8YT0sCDHJ+ZVfhTWBvdKIozg7F0G0nS1gnn9RDAhBczrdlP8sKYpEYbGFKF250fEn+
         d5Zn9aKGyATjwVZeWtUtndmshf/NDLdWQjpYOU0lDj+Tw22/V5Yads9k1dapijnrlV5F
         Bl20lpwPLXP6yL3BRk+PpOX042gP+2GjL/tORU7v7rsL+oCDjQBxQ846DGfZe4CdEXc3
         GuctG5BL4GkKQExz7pYvHXjy3Qxgv6FxWW/IBMkfWs+RITQMYM0quVVZcGPEPu5iZwDW
         CQjQ==
X-Gm-Message-State: AOAM533GJvBbN9f/RnNZvgOUTqgNoh3Atv08J9fz68arLMqw8KbJ4fRE
	3E7s4zGQN55I1YqZHBDVMtCubpRdBFZ4RES88ls=
X-Google-Smtp-Source: ABdhPJzUQdZwWYM88AeWBcGD2TnAc+nobDHtxWFwv8rPfUwIjhtjW9Tg0kDfsnIuhWVQXJnTcZddAQ==
X-Received: by 2002:a05:6a00:2493:: with SMTP id c19mr6180172pfv.29.1643341065175;
        Thu, 27 Jan 2022 19:37:45 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id v17sm6958162pfm.10.2022.01.27.19.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:37:44 -0800 (PST)
Message-ID: <bae003f2-24c9-d65a-ddb9-ae0eb0fd14ec@linaro.org>
Date: Fri, 28 Jan 2022 14:37:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/14] hw/intc/arm_gicv3_its: Implement MOVALL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TEtshtORl5G8

On 1/23/22 05:24, Peter Maydell wrote:
> Implement the ITS MOVALL command, which takes all the pending
> interrupts on a source redistributor and makes the not-pending on
> that source redistributor and pending on a destination redistributor.
> 
> This is a GICv3 ITS command which we forgot to implement. (It is
> not used by Linux guests.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 16 +++++++++++
>   hw/intc/arm_gicv3_its.c    | 55 ++++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c | 54 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 125 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
