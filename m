Received: by 10.28.4.212 with SMTP id 203csp3206424wme;
        Mon, 7 May 2018 10:03:33 -0700 (PDT)
X-Received: by 2002:a6b:9e42:: with SMTP id h63-v6mr41894220ioe.30.1525712613575;
        Mon, 07 May 2018 10:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525712613; cv=none;
        d=google.com; s=arc-20160816;
        b=XRz+bL4N3V8J5zvx1dSgPePCsVprxj9GPpYoS/uKNdkQbYl8yPjTrFHN7e1a8QDXbA
         auwLcM028M75bKB3Pl5mdd9tKvroGcRi1bIAtu6MSjRIrq4Y6m74mZOgv8RfrzO3X3EJ
         pKxLgvbplzGE+6QmXpzMprDoA89TQ/LPxTniCB7WhtFJZG7cDqQ/GQOLzrYUJE8ITMJv
         UOU3bX5EZYWjXufct7paBhXNhvThPLNdu2F9fGljKLDBO5aQBFtSzBMkJRzkrEOU3gqE
         M8Z2q/bp4I9onl3Zo3YCpB5g14rBwfGltGg9hZnzD3OjqdI7kJbxjyoksO1wmf3nFIAv
         YYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=46FycHhunOwEAHEPFuf/szwZJydZ9QPjZXEToBpPjEY=;
        b=zNUsC0Shd8nLlFHn+dGByjg8mclwDwp75mXvDXqHNoGuY/sKoKuDcTENp2LN4ofHLU
         u0i6MoZmxVBMRT2i+H0WYH9n/OnWLXCJgBYs6DYMba4Haqp1xbKAnN811GEPAX417eoz
         5wy3AbkT6aMqhrbrw7NSro1tiPwE7sgEnNjj/aLMb9KrJgGeTghjs/QFj7PibGz2bK1u
         oO1yYss4TC99Hv2xDoZfkrgrD+TcodmyuQTpCmltg2X9Cxz63O5tymoh/Acu+fkgV7gH
         n7g5VmdBXyOKn+1cGD+GMUruvBoq+es4TY75oAr3XA5oUeXasmO+1Rls33z79JUaDa5X
         2l0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMJ0G175;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e68-v6sor4307594itg.57.2018.05.07.10.03.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 May 2018 10:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMJ0G175;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=46FycHhunOwEAHEPFuf/szwZJydZ9QPjZXEToBpPjEY=;
        b=RMJ0G175JZLR/F024/e04RDxZav9VpNG+9/+y4j9+sJSqWtH7NsQ1szrkAAiKMVif2
         fXPxiJ6CKYlyi7yumEqasglfneZl4dNdlaHiQpkoggskM56BUlI4sOcV4Q9GpociOERw
         JY86Sr8VS6D+k/cKgCsCEFYRd+rtSLmQCZsEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46FycHhunOwEAHEPFuf/szwZJydZ9QPjZXEToBpPjEY=;
        b=r2WjB/KtdVoa/ym6/aAZVdzRumuDAmSCAtbuzmDoW2RqTleETnVQ3673/LCRJjvnon
         FMJTjtRnMjRy/INGiSOoHPtaFMv8uDO/8PYeACd9NHFXSoW/D22rJldrZLdq+0rTt0Yd
         T6sdPNW4TnfYmSM9ki/Id8Bj609z7TowjRdDTvDZy1YJEIJqrwoa7GUyrZmjp1FprIhj
         oaxkiHZ8Lk1EroMLPwz9gQ7UvOWgSzwz8JfoqpwCc0ccFEhr8WNLUk9XaHR9vTcn8UNh
         qdVyH1YXUMfGZwL/8jxHoezrUfw6+C8qF9f1PL7py1Ii3sml452miEgHFm90PLcntApZ
         Dd7g==
X-Gm-Message-State: ALKqPwdjP1H0J0fCXHiqTHLcvR9tvMAog0nfW4FyeuTZfGQzPsXEBOiN
	gKI5SIVv3AJyAluU3s/y32mBBOHU
X-Google-Smtp-Source: AB8JxZqXNZ20JVISOqg8EGfHMSteCa5mn2+7Uah20h0ZeuA7Kqv0uqO8z9dggd1ftOw76vthWnkJxA==
X-Received: by 2002:a24:5905:: with SMTP id p5-v6mr2246483itb.135.1525712613032;
        Mon, 07 May 2018 10:03:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id e133-v6sm10043892iof.28.2018.05.07.10.03.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 May 2018 10:03:32 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] softfloat: Handle default NaN mode after
 pickNaNMulAdd, not before
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-stable@nongnu.org, patches@linaro.org
References: <20180504100547.14621-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8fa77474-f9af-1569-0a41-14dff183a52b@linaro.org>
Date: Mon, 7 May 2018 10:03:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504100547.14621-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: O+N/+xI5Zwey

On 05/04/2018 03:05 AM, Peter Maydell wrote:
> It is implementation defined whether a multiply-add of
> (0,inf,qnan) or (inf,0,qnan) raises InvalidaOperation or
> not, so we let the target-specific pickNaNMulAdd function
> handle this. This means that we must do the "return the
> default NaN in default NaN mode" check after the call,
> not before. Correct the ordering, and restore the comment
> from the old propagateFloat64MulAddNaN() that warned about
> this corner case.
> 
> This fixes a regression from 2.11 for Arm guests where we would
> incorrectly fail to set the Invalid flag for these cases.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  fpu/softfloat.c | 52 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
