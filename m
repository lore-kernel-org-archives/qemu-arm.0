Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp201244wrg;
        Thu, 13 Jun 2019 14:17:43 -0700 (PDT)
X-Received: by 2002:a62:fccd:: with SMTP id e196mr22520951pfh.53.1560460663165;
        Thu, 13 Jun 2019 14:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560460663; cv=none;
        d=google.com; s=arc-20160816;
        b=QUZ8yGfY430b3xCQnfT7bRwFMVCiQ0IFX2aKElXgBNrLUCUsHTzBWR6Go0glhQpBtc
         NT4VUTUnuZ2tj2ZaGZKUhbgmmZh0GYdD+xHCRoaqbxzHEtv/mC/2U5igo/fZSalbmwPT
         x3xuDzurOX/Uap5e58qQ2mU9o4eb/DcKJH0OYIs5V4yiarUKSrWbx+iUomGo/DNMhSGU
         EbGQWI/O13bzv/aGmSObuQagTMpL291gvYgNyLvSslOEAIDwCPcFupArkSdVAE5kokxJ
         i8cOsGDAOD6K7cJjLTqVtktFSlJYBoDhHqLQ08zwf67U+obDv7qMf6Z+Zlna1KbNHzP1
         nhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=4yMHvf0hUfaJfI1pMhQ/w/OXG5dCWud1i8+8m0GQous=;
        b=tmjHP8huV+NfNamuvKcLlFtSYEf+hPNSqH1+JdTVA3UBgDlWjM4sJv65iR4DWSKRFW
         j+m9GUDalzBwD2CJRyLFSsFf/o5JJ4NO+DEeDJxN8mPFUzH6ITvRboxeXlWafpzPKvh2
         7fp7W9WbDgz1ojX6SkkEAKUa1xeSNTWmku67t8bP0RUNBLeW1Gg6uH2u8QpjwBxsbNR+
         wjb9QKMyvuVje1TlROqACTwrP5WrQPKEO17ygbWZtluVDGMGFwhQhEg1knrK+mkW97iI
         oehibnX3TWviBi4mtpR6DuRo9Q9AU5WMgFeCLyIAEm0yvGg6QSGNVKWtp/eKIkEaox87
         lnxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOYSDqaX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b19sor337557pgk.53.2019.06.13.14.17.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jun 2019 14:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOYSDqaX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4yMHvf0hUfaJfI1pMhQ/w/OXG5dCWud1i8+8m0GQous=;
        b=vOYSDqaXOoNbhWH5jiXnI1fGr1eWxHlnzd/kQMwSOGp7ZciF16TdwhgEaq5sd4yqFk
         flcVLJG14bsBJIhHmkaO9iRKS5rAjgEuGgQcTsKlEPPQl0oJkOWZRW3pBa2XxBYF8nRC
         cPTvX7CipvG81MELz5BNzohas7htMRc9hfuC3D2ekOvpxrPlj2h9AENur/x+/O+UiZjl
         UOHtL+hnUCOv5+SuKNuOedG9arAZa/2s0Z9yxozoWq+xKhoUmiuOW8ql31utM/F2+QdS
         NUPQXzq3E5z/PXOrmoE1LnsqpidABTBLB4Y7aeAvU3LENjLo2pD6afZTf7BBZQiTr+/J
         6ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4yMHvf0hUfaJfI1pMhQ/w/OXG5dCWud1i8+8m0GQous=;
        b=PdoArNKICu3ar3wKethyasoSqAmp13TgAP0gSS4WH3Q4OXqEJhstlzY/VIUTTmPBt8
         QDQVCzIGTVPVYgJy1SzVcZXUsN6Nbdd1qBxGOrIlzGKSz6TUuSORXWSCpF301rtTIXbj
         ecDWZ56U/74m7zgTk+8yRkoRU/ojHHUh4yEgqSxQERPL+FXaeFxN4GpE+2hg8T/1Tl3U
         kpRlsNa/idM0Cw1jAPKofzwLLoy7JIDpMvfu7ktetw24QOYk2SAaGtV99d/uaF9MKE2m
         ZYpOcDy2pBNdVfzD0m4dfuJOmK3Hyrpf88K7FkB8obYjU/ZCYQQyrZSCjcuvzy43qE1G
         srXA==
X-Gm-Message-State: APjAAAXCo7TbrVClx8Zxmjc1NdJ2XmIhBTW5i/EJjqffx9P6GvmROO0u
	TyP+2dNL0F++F60h5now2xsxuOHa1lQN1Q==
X-Google-Smtp-Source: APXvYqx6aXssKFY4zeVrsKQHw94Ud35twxKVMT5u3RctBhBg/AKusGs+7xx5dGM26ePlFsG0UzQ4FA==
X-Received: by 2002:a65:60d2:: with SMTP id r18mr32304315pgv.217.1560460662295;
        Thu, 13 Jun 2019 14:17:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.150.239] ([149.199.65.200])
        by smtp.gmail.com with ESMTPSA id j2sm680508pgq.13.2019.06.13.14.17.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:17:41 -0700 (PDT)
Subject: Re: [RISU PATCH] arm.risu: Avoid VTRN with Vd == Vm
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190613143741.15128-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <724331ba-44ee-c37c-e22b-452b6f25ee7b@linaro.org>
Date: Thu, 13 Jun 2019 14:17:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613143741.15128-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: BDWukCYzwtvl

On 6/13/19 7:37 AM, Peter Maydell wrote:
> The AArch32 VTRN instruction is specified to give an UNKNOWN
> result if Vd and Vm are the same register; avoid generating
> this in risu output, as we already do for VUZP and VZIP.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Alex: this pattern error is why we don't pass your
> testcases/aarch32-all/insn_VTRN__INC.risu.bin when compared
> with a real Cortex-A7. You probably want to update that.
> 
>  arm.risu | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
