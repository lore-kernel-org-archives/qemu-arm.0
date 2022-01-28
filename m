Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp30100lfk;
        Thu, 27 Jan 2022 17:44:18 -0800 (PST)
X-Received: by 2002:a63:9307:: with SMTP id b7mr4779935pge.291.1643334258644;
        Thu, 27 Jan 2022 17:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643334258; cv=none;
        d=google.com; s=arc-20160816;
        b=00P0d9WJ9sEG++gt2xtEQbotAzt5N/kUOdXgGa3GdNiYJH8yncy6T827FKnZvCBJOy
         sKaW7F0FpqA887TADOaf88pbBbnRTfTKMXSVKtm1ImyP6yxmZx/ocxVWwQ8UpAtUANVs
         nZp0qdRnkO3kO0msqobX0dyg9SCgnJ1Ks06h2hrefmwEVzjRfuI0Jqn0oqCM84ZoZMJn
         uoxDcTd0Z477P+LF7qDtuSTY5IeA5v2mFPisLpo/v0X9thurt+7pYLiwNYVn7fXIhnsE
         As+sfVcj1VpNaV6IueooA2m0gjLxZp2w/HG89lWito60OAgdo8yaFqQp9jZ2z4TQ/HU7
         zgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aIiI9K7HSzTWg/+CIWHb8DFbzK4Rqsax+3pQDyFp32U=;
        b=mk/uUX1i1lub+nr/wFqJtPKse9Ga7TLmCRJYE2kOrjnCAaInb0AFkqDoGabwnSzcY9
         V53RuJ5bz+4wqtHTAkjIjSiI2nl1AKva7fNmesieanSLt37DPq/hK/udLwV5OPXaij3s
         0MxDypLY4IzDtrr+5SvCfn7+CJ5vYtVSTBFp6N+sNA37ogUTUfF25BKocy7L/00rOwOy
         OSTM6MJPAkr26XpO+DpP+w8XlPdNI4jzQlNdLaZSjU+kNfbyowoGj0Y5zgW6cootW5tm
         uxiLp8nH2JkWIMrPfPYD+6GcXqfY9JLomAzKWRWv7OlrEtjLB9vZCv5BoPPcUCk4woJ8
         Lo6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOppJAX9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q10sor1935660pfj.38.2022.01.27.17.44.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 17:44:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOppJAX9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aIiI9K7HSzTWg/+CIWHb8DFbzK4Rqsax+3pQDyFp32U=;
        b=NOppJAX9V9f7gCOZtM1jp1PcNvpJ9VQsZog6nNcoBWBP2+AEGNBYnoVnxp1tzr2H+T
         d+VaQUK0It277/I9oeKZ2W0hYcpaYkIHCsKo799VtTf9yDSKDN/dka+Y86j3wDrliRRT
         LaeIlvGdzqLUl38Xuc3+9xU4bMtm3UpL7GeCivAdTJ7DaiecpkSXzR5kkmkOUWGK//OD
         JmNPByeym5m0SNFXc3q7izIaruxbARIqTd1eAOzOhOExexsQXgQy8egQYeNnkpq9JWgU
         ePPRNuzQrXCAKSB7TaB/x0av67o1q4ukW9IMbDO7glorfb3OebgKWA2Pc7WTBjLbyLBH
         Ou8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aIiI9K7HSzTWg/+CIWHb8DFbzK4Rqsax+3pQDyFp32U=;
        b=x2UpUtNlsSrVzGNr7/HiAkcdvZA5uu7KC74AvzuDykTs02VGglmY8AXx25yekJmMCF
         8lRyDzeHQfFwecTJweARqQIRkOlWIiMIJcJZL3S7z98I0aQ9tBxk4RP0cNJOMZJgFLTN
         WrGRK742Gd0IJgEHuawznGsblJqUytkHuQSkACOVVuIPPk/n89IgSP+N6JHRs+rGzsjU
         EA+O5JTO53qL0JM2Rvz9dXHcyKGBqUGrxN5X2nGQT4inZU+xYuvmC7GISSYjOqo/F6Sj
         nJ4jkwJAz/11wsN9bUNNXw3YfrbwvhC7tKpwZfhVf5utfCtJiolywXxwEAy2a3zOx+9w
         R0MQ==
X-Gm-Message-State: AOAM531DpzixNgcEolr5gIn2xBQ4COabpzR4HHJ+hjIueUYXF8hXORfF
	+GILGukLAz62xrrCsjFc4Tdyz1HF
X-Google-Smtp-Source: ABdhPJxjZeMA0yiwj8Eqk3ZT5YPkwG0dv5jduQd8Plgr/DiTx+LElTDfCJ+5bcL4lUz+89iSoLhDkQ==
X-Received: by 2002:a05:6a00:2283:: with SMTP id f3mr5664887pfe.24.1643334258175;
        Thu, 27 Jan 2022 17:44:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id b14sm7245555pfm.17.2022.01.27.17.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 17:44:17 -0800 (PST)
Message-ID: <e975ac85-eb64-8075-43d5-b9e6dc5a31bf@linaro.org>
Date: Fri, 28 Jan 2022 12:44:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before
 indexing into collection table
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ullw2FxmYYZM

On 1/12/22 04:10, Peter Maydell wrote:
> In process_its_cmd(), we read an ICID out of the interrupt table
> entry, and then use it as an index into the collection table.  Add a
> check that it is within range for the collection table first.
> 
> This check is not strictly necessary, because:
>   * we range check the ICID from the guest before writing it into
>     the interrupt table entry, so the the only way to get an
>     out of range ICID in process_its_cmd() is if a badly-behaved
>     guest is writing directly to the interrupt table memory
>   * the collection table is in guest memory, so QEMU won't fall
>     over if we read off the end of it
> 
> However, it seems clearer to include the check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
