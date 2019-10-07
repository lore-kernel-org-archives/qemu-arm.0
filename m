Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3840435wrm;
        Mon, 7 Oct 2019 07:06:29 -0700 (PDT)
X-Received: by 2002:a05:6902:4c3:: with SMTP id v3mr11868313ybs.175.1570457189708;
        Mon, 07 Oct 2019 07:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457189; cv=none;
        d=google.com; s=arc-20160816;
        b=0RMJ9JdN4bWjGQ5bZby1e3e8BvWREOSXvJSrhJ3/Ekw7+U+4PTW1h4Fq9P1QXg75qi
         NViVp8MGKVm8PVgygFvLv7lbWiaQ0ltjKpZdJPTEDUgSWlPbLFcgWzH/3AMzeTmb32dE
         dCzUPk3nPIe15PTAoYK0/Gm5xygjG12JlY1kNR029u1NuHgNXNJPNeoHNyFBltiek3PE
         l4OInFn1AgqSSg7xmFo020QYmdbSEcJbMsaWkxzPYKhlyhn7g/X06UvPVg2Lp0IisZG5
         X6jF3+LqmxUsFQZ8lThqzR9O3CbK/+t67uLdsQc24CS89lNXcqMCzt21lD381H+p2615
         v7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=53CnW+BOwoF1SDSWxo0eJusDqToFk5LjiZOAa/Of/tY=;
        b=NlpqElboujLKigdb53Gj3FvicCmjJkFYvH56yJMUdIthvhOr9PAJOY3QUQbTyaqzQB
         HsfvsVEOQ5u5QPU0TMHUJ1RUtKN/ztXYCufgHUmwOYPlawJ/+LuHvjNSBqNlEzYTYOHr
         1t1vsZV6iQ9RmAKYUBj5q/ddd5pXfVdOuKau1zFD4oRCuI/GigK5fysnXF5iXkOgws1b
         zYROzgiNvS19y11BRqsRft24k/9hI1+N8/G12id3elT81IZUn8ItXe0mYsUgq20QEN0q
         ESRea1fwvKMYTu/58I5MiWHdNddgdmZl8fi37z5DFKp+6MLL8EPq7Obe5o924teJb+nj
         kweg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6vfBbcJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x2sor7561067yba.126.2019.10.07.07.06.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6vfBbcJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=53CnW+BOwoF1SDSWxo0eJusDqToFk5LjiZOAa/Of/tY=;
        b=g6vfBbcJXQZOozLQsHpIZYwJQdE1FCOfXcVr9Lqa0aZqPYPiR2BMYsP+uhWw5I7Y5B
         ngcQa/4ZC8p9GzvShVYEcSIHsBMqxnNIIX0QMQI/RrrrTwDgwHZ7nViTqJGbslc7MEoc
         FepOvc4SUeD2GxKqHnlAd96Lw1k4lrSBjtPRykbexFifoVP5T4eRPCntf0Glg3j7xUHI
         45KIk3fUErehvwGMpR0fyPxY8w/2AJLUEsmxCqLsu/1ubJ9x88Q68Lj0CwVnpRXiyH9a
         Fv4lIcys0KWYYJBv/roglhJo2T0I3bCoiXiQX5kbea1myWyj0XU0r5GrBoR9F84eY+w4
         5Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=53CnW+BOwoF1SDSWxo0eJusDqToFk5LjiZOAa/Of/tY=;
        b=Fb9iPNfVkUPbuBa3rnCmtW/TScWPn5eglB3Tdkg2tO0uupsz62IAfciqyiLPHWcl6U
         NeBCVpGE1Kate8tja4oDE4t6TxDS3AoiyYsSCWB/77aXSc5s3gTEK/F5ZBa0LW3NTrD0
         OwVtici2LjVlpZ7RujxWXYQL2FYjzNZoUfPzP3yl6iBIF7F2l5T6ROmj3w+Bqa25SaVl
         zyJrDo3ZJRDsVtVtPi+dBdVUFGMtHlB7zVleR78PJmA+uOAFz4NVWHog+wAaFBNxHvDE
         40JkeI6i44/LpXIVMWPMt7cO0q6nBkvIjb9P0VKAASSKqT4dgj8bVFaUM0H7jYsjJBQ8
         HV/g==
X-Gm-Message-State: APjAAAVkd0y8ewZvKmSK4SghGmhKjbOgKUd6QISdy/9lC7JDOYgssAEl
	FaljAPssy2uUKRxqucPNg1mQErMCWKlrRg==
X-Google-Smtp-Source: APXvYqwvcvpdSBcm8ndI14T4NunkgBPyQx/IO0hoITp02OQ4UABg+bToLT/kH85W5RMZbDFAFaTVGA==
X-Received: by 2002:a25:7691:: with SMTP id r139mr10929429ybc.303.1570457188677;
        Mon, 07 Oct 2019 07:06:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id h3sm3774892ywk.40.2019.10.07.07.06.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:06:27 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 03/15] target/arm/arm-semi: Correct
 comment about gdb syscall races
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <91e47043-8cd6-ed6d-eff7-6a742e669138@linaro.org>
Date: Mon, 7 Oct 2019 10:06:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: eeT3LcjORmrB

On 9/16/19 7:15 AM, Peter Maydell wrote:
> In arm_gdb_syscall() we have a comment suggesting a race
> because the syscall completion callback might not happen
> before the gdb_do_syscallv() call returns. The comment is
> correct that the callback may not happen but incorrect about
> the effects. Correct it and note the important caveat that
> callers must never do any work of any kind after return from
> arm_gdb_syscall() that depends on its return value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'll come back to do the cleanup later, but I preferred
> not to tangle it up with the rest of the refactoring in
> this series; I also think it's probably easier done
> afterwards rather than before.
> ---
>  target/arm/arm-semi.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
