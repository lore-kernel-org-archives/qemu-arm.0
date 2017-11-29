Received: by 10.223.159.82 with SMTP id f18csp3942296wrg;
        Wed, 29 Nov 2017 01:30:10 -0800 (PST)
X-Received: by 10.223.180.69 with SMTP id v5mr1609288wrd.193.1511947810347;
        Wed, 29 Nov 2017 01:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511947810; cv=none;
        d=google.com; s=arc-20160816;
        b=WjSxMhS1zqq02YBVTHD6Ff4hV3/qmYwqQT9Qd1azzuO6Uko6pOO5ox0zRPzt5YuRBz
         c1prS8Y5ddtVX4LrZ7gQco20hpYT3NPvBHRRkT4J793lqYejNOEb9coMDfZCzO0BWErC
         3H2tpPHskDJzCn0wn1H3RNp5lomxFh6xMhqz1ldSKg7lMeqIkObvqKJL6ZwlAJI6JAGB
         xM8jBETyJX5xFJ5ZZJgZnQMmhLKalhqP93btM1BoXwMxArqdikGFhbGmyHltSOqa8BV7
         NRHDHztFylweIir6XywsOYFO9n33LV4+h7nV6oswV9Bc8R7iZSkJXDP5en6ooQk9CAgZ
         nvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Ew3nz3FTRL4GaLsesEKTFfOlOR/MWx4f7LY8N4AclfQ=;
        b=YlR+fN5zhIFhE241QEkn4m8xfjt9AcX3KtUG8WYMvzuBsRNb6FTynC/UUK25p/71DV
         p3VeLOThn3gO2BPHmp39Ppii55xNCtKy5qhTAFjH9L7C7XsD6wxn7tDK6LKLQ2QfDO3m
         jdDAx1L+XiH0jkHNG9UQOWyUwrnC7zrA0L+PIrrqvEjQVdO+YqMih1dxbZVzgf7Oxwub
         uRDEIegXBuR4cXgHIeUvi95uDhK0p1MhXYEMZ0Oqby7bYR8+D5D0bV3c50Yj12BYvfvG
         qGcHAWnblYJVRCh7ZLTFWDp2inMoV9zD+32zygOxvDUDUvXvpYFpQD87jEryC0xZWQno
         bbQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5eXE3gU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 62sor398384wmp.21.2017.11.29.01.30.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 29 Nov 2017 01:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5eXE3gU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ew3nz3FTRL4GaLsesEKTFfOlOR/MWx4f7LY8N4AclfQ=;
        b=P5eXE3gU619GumokytcSmVw8KVYU4l4uZHaHAVNKlFBuOtNrzISdSxkitHoFmRu3eL
         cZ3kKGkkDew+JpUqwotb9CuKOH3NhSOe+jJR+96cpfZ3FJLwmQgZS1Jd7xmtyjTUEfss
         qh9BcHFZ4GHygsQzoECzY+zdZlMQGdNI9KhgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ew3nz3FTRL4GaLsesEKTFfOlOR/MWx4f7LY8N4AclfQ=;
        b=D1YUN4+YZtE5t/StT5aEv5OdNyA5fRr/RBSxwH9R3qWyyhQH7M5jjKL0OXmNpJkqMq
         H+eFYKbARHpZm68A1VkOA6atUXsOGkffAMKalnyit27z01h3bbg4owETUQxP2IducCr7
         lFH3lpVbrzFpqNy97T822iFFYLFZ0cDtwIKVBlr6KUeINWrnx1WLL9LNPhTngWgeMGse
         1odbRpZxmSGPHJjCcbvnP5r94taTz+j2GMlK9qgGjyO/tgHHksM4QyXZlRMC+NmJsf2V
         59kpTAoOO7APIQXRshlfnFMw2RMDqLzcDQ5dKjJN7s5ECilbuxnqObJ9QeNv/B3neEUA
         xlKw==
X-Gm-Message-State: AJaThX4M/JzECow8pq5ZeXay59lTTK9h8EqlpPUWXOVO0cdvGcljzMMO
	TGfGpseuOfOxV30MqtdjN82A6sQE
X-Google-Smtp-Source: AGs4zMYOLYLoWe11nd0JwkwKwJFt3tdNVuqs30WG4k+VMwiNLZLzsnmpbi4Y4eAwstY2gNO61k6kqg==
X-Received: by 10.28.222.132 with SMTP id v126mr1697768wmg.127.1511947809692;
        Wed, 29 Nov 2017 01:30:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z108sm2718798wrb.67.2017.11.29.01.30.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Nov 2017 01:30:08 -0800 (PST)
Subject: Re: [PATCH] linux-user/arm/nwfpe: Check coprocessor number for FPA
 emulation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
References: <1511890447-13601-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c99d190-5154-556f-caaf-5abcf4341f96@linaro.org>
Date: Wed, 29 Nov 2017 09:30:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511890447-13601-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: LMHz7TK41KeG

On 11/28/2017 05:34 PM, Peter Maydell wrote:
> Our copy of the nwfpe code for emulating of the old FPA11 floating
> point unit doesn't check the coprocessor number in the instruction
> when it emulates it.  This means that we might treat some
> instructions which should really UNDEF as being FPA11 instructions by
> accident.
> 
> The kernel's copy of the nwfpe code doesn't make this error; I suspect
> the bug was noticed and fixed as part of the process of mainlining
> the nwfpe code more than a decade ago.
> 
> Add a check that the coprocessor number (which is always in bits
> [11:8] of the instruction) is either 1 or 2, which is where the
> FPA11 lives.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with a chroot of arm debian lenny, which is the last one that
> still used the calling convention that mandated use of the old FPA11 FPU
> and thus needs nwfpe emulation.
> ---
>  linux-user/arm/nwfpe/fpa11.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
