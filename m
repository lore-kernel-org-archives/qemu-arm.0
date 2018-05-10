Received: by 10.28.4.212 with SMTP id 203csp1111264wme;
        Thu, 10 May 2018 07:50:52 -0700 (PDT)
X-Received: by 2002:a17:902:3f83:: with SMTP id a3-v6mr1673994pld.279.1525963851957;
        Thu, 10 May 2018 07:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525963851; cv=none;
        d=google.com; s=arc-20160816;
        b=ynqK+MgCnZYnw9DluJkjByEnqMwOrydhVgYfFevuvMCq5t0cTgW8KtG8t1IwVuf8z3
         2uPIAc5UyxXKhmJb7L10nJMrgqhBQF53IHi5Xoo3H32BleUEqybhdDZrXmmuHdC3rZuP
         hKqLr4RqLUUa1aSRI3km+0JeR7U5NH89m8HPj/al8bp2GI8n0CEqLs1myvmdQNenXzDu
         f8xDaBnT4/dKQQXbvxwKFn5brD59KkIj9mXLf8GCOiz2o4y14W+j6Dp54Sbtm8HvkZd4
         6L33VaNi284Nw9o8WlEpUN07DrrD84YDNAcUM9rVSXvovho01AAhAGKY6WLQxymUCw7e
         3q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=rl0d0W6EC17NIijTw4C6JpPO0K/Z66gTprUClQWFSPY=;
        b=lLjpvRpVG6VajwAyoFYrBtavX8goJNrtBdhGpW/AEZ8baxT99nTzDfYR0f42bDrHVF
         npO6gtmAtga4gHy5/NgYEUtcEejgWqu57DkVQSj2n5gxW5wg+3dnwdW2e/JNMJmoKBfE
         ENlQ/kFUz2NMPBWDbuKPCasp9TgPcZsopVKQI5dwsXbinECCqsFJp+s2nrSlLD+HJUve
         qMwJ5Whee5eXaSK5M0TC/aJQTnhZpVHaty8L3RzOKn5SHJep1T0ni+QKggYclcMPA6dN
         HdYmjY+C1SuqJjUfDOmtnlONXkD89cEwe5omu5FzGoI/0AoYmkijxXtK3UpfFlreY6XF
         2N5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsVugbyA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f90-v6sor351494plf.118.2018.05.10.07.50.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 07:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsVugbyA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rl0d0W6EC17NIijTw4C6JpPO0K/Z66gTprUClQWFSPY=;
        b=jsVugbyAMcn/4h6ZgB4tKdrxWQ6tHsDS+LQ3t7ucrKeaax382hgegTFSNHyfmxqVm6
         My2+UKRS7SC45bhEdkmLbJzkNyvmG17cqP5TNWs1tD/v+E8k5lUjRz9pibdmYEgtU3VV
         xp7Kva11etWUplzX6wPxd4tzQHunsjZfd3NY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rl0d0W6EC17NIijTw4C6JpPO0K/Z66gTprUClQWFSPY=;
        b=W41YZz28BzjVFWcvatksEtGEQ3gV3ib7GqF5+s22p817jHq4K8L6GM2I5rTRRG0XcR
         hp07WFGjeZeOAXv+l5O/3QZcSrnI6r4xTsu86MXk2Ij0szb3eTeQX0Z5wBOA79DdgrhB
         NAeIrq0nHln5Y6OfXRDV7Mjwcu2LlWJ3SHWklCUN5CzsS5HAnsD1bmmU8xIOyQU+1sZG
         TJVbqaviRX73WXi3nFJ2HtzNBxTaBIBY2G7puLX1B01J4LPqT2CQO0kRtcIgavLDCD8l
         504L7xCEYsY/n9tmJaqlEd4M2UTMhAp/0DhqIk/b587fHFtWF9cYhDHp6JwA3GZJIRQU
         FWCg==
X-Gm-Message-State: ALKqPwdi7wXGlFc80RkZEpFqIRg5kAbXEUmY5Kvy45eNFl7kWVWo3zy6
	OgrBeipgGP7A90UXRCe5/pEUi+jxbE8jsA==
X-Google-Smtp-Source: AB8JxZpPpFwTiIwN+nZTZaE7pUHt4i2VC7O/6b5do5GEiGEEXfb8sH5Bs+ZETCt5T536dibSAEBk9Q==
X-Received: by 2002:a17:902:8647:: with SMTP id y7-v6mr1673249plt.86.1525963851336;
        Thu, 10 May 2018 07:50:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id z13-v6sm3964182pfk.156.2018.05.10.07.50.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 07:50:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] fpu/softfloat: int_to_float ensure r fully
 initialised
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20180510094206.15354-1-alex.bennee@linaro.org>
 <20180510094206.15354-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aa6da963-7af2-ef74-8dc8-97486949a0cb@linaro.org>
Date: Thu, 10 May 2018 07:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180510094206.15354-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UDOFX3wYfw+L

On 05/10/2018 02:42 AM, Alex Bennée wrote:
> Reported by Coverity (CID1390635). We ensure this for uint_to_float
> later on so we might as well mirror that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/softfloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
