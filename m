Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp362286njb;
        Tue, 7 Jan 2025 10:35:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUD2jF/1J9uLDe6xw/FtaFmnV9HuYt0fko0tDQGQWecvPnDFzEpCXKKRh/3hXeVRBB1tcMGWknjpLfxfA==@linaro.org
X-Received: by 2002:a5d:64a8:0:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38a418e1085mr38128401f8f.3.1736274907445;
        Tue, 07 Jan 2025 10:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736274907; cv=none;
        d=google.com; s=arc-20240605;
        b=OU+IQMkIk8GaVSN5bryZFNXHMhA2mC3V0plm8+9XP0Oz3xs50hmu7j2UelmrfyCt46
         Hm0GRJ9dluH7sM2O38pc7B7/Z677s2LO0BDHj+I0gfVKgNOltOvmU8X0XK4uP7EnWXqs
         mY7IQx1oYMZijipA+5lmjPLcku9t98nYCBErFNQyOhxAdS07PcFxaXfrKv69SGC3Hw/8
         jPUMMaTepYFbRcy8SCkpkrvZF7kWTCe9T43zSSY3xE133J+2oQpJYzkLgStfzsTUFA9C
         KwjdhO5n5mS2fqYMF4Gm9qeIhK0gy+kK+s5bYFyPq3H7e5WDEjilZg5qB+Utf7oaK5yd
         tApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=167vkgXi+p1l5XuKD9ozI0rWzBdU1wiwKN1ml5juTVQ=;
        fh=bcqFFPvLbMfNgVCJ3qm3Y1+22Rl92zovmIx/pHPSo2A=;
        b=cVrcXtdCEyfgmHtdnlk6P8NVLzceO+j2e3vlDNEllytjT7dDWSKSv697PENFOyhxg9
         Jg46JaTcB7TZPfPskG8NDPqZnw/soQy9nJa2s15RYZu83hjJOe656Rh2x6QZicsVpHmn
         Na7FL0MXKaKXq/0mRbODGjK6jHBqN0/poS5DQfQfAb1L2sdfIS44RHltIfXKYM1KyaAB
         RJTrr8ops3uIp2QaXViXfEIkdcP4aw/cBtwqsX4GVRMFhswHtKC1aOYqps3KIqai1aKQ
         cwsV5n3S+uYXLjLpFEJeu/cwfOdl5NdkO0yppe3ZgU9cfq0XxvydhHW/biVaAnC6jw7o
         bhKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AX+SAiux;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43661db8461sor131592135e9.2.2025.01.07.10.35.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2025 10:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AX+SAiux;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736274907; x=1736879707; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=167vkgXi+p1l5XuKD9ozI0rWzBdU1wiwKN1ml5juTVQ=;
        b=AX+SAiuxz1Ol8h8Grt2gyoGBmhF2rG6XLklWCv8JBAoycD5gGDJmOczATgRbvEUZsP
         KSQo8eSLbmlvdd9TPMoBfhaESYW3kd2pM6S5VdjbdinkS0V4L67jKbvMQ8Np/f/WYdO6
         9jpAigMFu30jydarRSQoZCtYg78duoByn1DJj2+ToAXZtg6uKvJ1zjL5Hjh56bnYr87f
         qHY5VxFJlEIqrCswI3nr7OwAMuaYTGrjYjV5c2Va2XUIIDye8rvghrWHLDcXZIR01MUT
         I0PogGNaQ+4SEj0OOEzb3C0QpEF6xhsrbgLDw7L9y8qhk+Bd+LR0akQl0/4FbURtC5W2
         SpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736274907; x=1736879707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=167vkgXi+p1l5XuKD9ozI0rWzBdU1wiwKN1ml5juTVQ=;
        b=aqyqOFFp8IiFNgLghQ2r/YcwQhLw9m+Iklge9esN2vug2EDxgYbWi/fuQaN9aEs0gE
         9yAMJm/ueeXahjNxJhoIgiiliPon/L2hrrrSjGiSV5abTRMjv3U1fNu7JkMvV42y9R6K
         Gc0ugFDZctsjdV2E27l2aXUAesEYZiIPBBqPpQa7ppJm0eIiFj3cWRQJdl8t1f10lQgI
         3GD5r9RjNsgVysr9clgjuRV4kfmTXcJUbbycBaB8gdIkcqFiZJ5seAYwToe6JTKzg8Ce
         GXlJE4NyB2fhKCxcTQCZVko07YY7aJHkhGUKtggoVabzu1mpDT0IgB8PU2N27CBT0sR6
         NJcg==
X-Forwarded-Encrypted: i=1; AJvYcCUN5gcugUogEH3ycLRaw2MW8J3TgMl/AnRk777Dn1b+dwglwRBoRa3b73ARK/a3nOm9qGWcSAWEkDok3Q==@linaro.org
X-Gm-Message-State: AOJu0YydFxk/XhUqCNVqd9UOAEf2YqpPq46IleKlRIxdxgatDrU3pTn6
	fMbGfvb5QAd+J5KnhgqCftJ3ObQpV392o7vX8JRDhKMY2Yqa+Tu+y4/+fABIJFkkbw==
X-Gm-Gg: ASbGnctsITUsQZzKkOCtUJsbvTT2aBh63jN1LnpqcD/j5BBUF5wSw7mOv0iiWoxCBu5
	yiCmlReuRtDxY2N1VYV6ebBy1Epd+HGIn7eqgpkhEH+35FBHEd6ehhkhIBVXBLJQ38Cmfs77g4C
	9UIPsdLTzDP/iHe90wSut8RTZpMZyqpjXAKEqacy7qWxU7gsvwvNhqh7L8dMSU5nuyI44NE3Aao
	kdTFaow8nL6sAVi6aZVMF+6W3e4H2ITwyuVKyH4YRuWfgZVFwKAzn7dsrv0D+zj9vtjHLid0UCM
	lacYzR8Egpub2FIRuf6X/1nS
X-Google-Smtp-Source: AGHT+IHOMgFPJTfbscvpYOsBqU3NX1ecv4i9MYoxHQvhiApDbGSOmHbGI+XOfXwUouL3JmdSDpJ9Fw==
X-Received: by 2002:a05:600c:3150:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-4366835ebefmr500410505e9.6.1736274906846;
        Tue, 07 Jan 2025 10:35:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2432e587sm47157880f8f.95.2025.01.07.10.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 10:35:06 -0800 (PST)
Message-ID: <77ee967d-00e6-45fa-a8b1-42192e61b553@linaro.org>
Date: Tue, 7 Jan 2025 19:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] tests/qtest: Add API functions to capture IRQ
 toggling
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 armbru@redhat.com, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
 <20241216141818.111255-7-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241216141818.111255-7-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Uj02RKwsXuRO

Cc'ing maintainers:

$ ./scripts/get_maintainer.pl -f tests/qtest/libqtest.c
Fabiano Rosas <farosas@suse.de> (maintainer:qtest)
Laurent Vivier <lvivier@redhat.com> (maintainer:qtest)
Paolo Bonzini <pbonzini@redhat.com> (reviewer:qtest)

On 16/12/24 15:18, Gustavo Romero wrote:
> Currently, the QTest API does not provide a function to capture when an
> IRQ line is raised or lowered, although the QTest Protocol already
> reports such IRQ transitions. As a consequence, it is also not possible
> to capture when an IRQ line is toggled. Functions like qtest_get_irq()
> only read the current state of the intercepted IRQ lines, which is
> already high (or low) when the function is called if the IRQ line is
> toggled. Therefore, these functions miss the IRQ line state transitions.
> 
> This commit introduces two new API functions:
> qtest_get_irq_raised_counter() and qtest_get_irq_lowered_counter().
> These functions allow capturing the number of times an observed IRQ line
> transitioned from low to high state or from high to low state,
> respectively.
> 
> When used together, these new API functions then allow checking if one
> or more pulses were generated (indicating if the IRQ line was toggled).
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/libqtest.c | 24 ++++++++++++++++++++++++
>   tests/qtest/libqtest.h | 28 ++++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 8de5f1fde3..dfe3139a88 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -83,6 +83,8 @@ struct QTestState
>       int expected_status;
>       bool big_endian;
>       bool irq_level[MAX_IRQ];
> +    uint64_t irq_raised_counter[MAX_IRQ];
> +    uint64_t irq_lowered_counter[MAX_IRQ];
>       GString *rx;
>       QTestTransportOps ops;
>       GList *pending_events;
> @@ -515,6 +517,8 @@ static QTestState *qtest_init_internal(const char *qemu_bin,
>       s->rx = g_string_new("");
>       for (i = 0; i < MAX_IRQ; i++) {
>           s->irq_level[i] = false;
> +        s->irq_raised_counter[i] = 0;
> +        s->irq_lowered_counter[i] = 0;
>       }
>   
>       /*
> @@ -706,8 +710,10 @@ redo:
>           g_assert_cmpint(irq, <, MAX_IRQ);
>   
>           if (strcmp(words[1], "raise") == 0) {
> +            s->irq_raised_counter[irq]++;
>               s->irq_level[irq] = true;
>           } else {
> +            s->irq_lowered_counter[irq]++;
>               s->irq_level[irq] = false;
>           }
>   
> @@ -999,6 +1005,22 @@ bool qtest_get_irq(QTestState *s, int num)
>       return s->irq_level[num];
>   }
>   
> +uint64_t qtest_get_irq_raised_counter(QTestState *s, int num)
> +{
> +    /* dummy operation in order to make sure irq is up to date */
> +    qtest_inb(s, 0);

Isn't it better to simply call:

        qtest_rsp(s);

?

> +
> +    return s->irq_raised_counter[num];
> +}
> +
> +uint64_t qtest_get_irq_lowered_counter(QTestState *s, int num)
> +{
> +    /* dummy operation in order to make sure irq is up to date */
> +    qtest_inb(s, 0);

Ditto.

> +
> +    return s->irq_lowered_counter[num];
> +}
> +
>   void qtest_module_load(QTestState *s, const char *prefix, const char *libname)
>   {
>       qtest_sendf(s, "module_load %s %s\n", prefix, libname);
> @@ -1902,6 +1924,8 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
>       qts->wstatus = 0;
>       for (int i = 0; i < MAX_IRQ; i++) {
>           qts->irq_level[i] = false;
> +        qts->irq_raised_counter[i] = 0;
> +        qts->irq_lowered_counter[i] = 0;
>       }
>   
>       qtest_client_set_rx_handler(qts, qtest_client_inproc_recv_line);
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index f23d80e9e5..b73c04139e 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -389,6 +389,34 @@ void qtest_module_load(QTestState *s, const char *prefix, const char *libname);
>    */
>   bool qtest_get_irq(QTestState *s, int num);
>   
> +/**
> + * qtest_get_irq_raised_counter:
> + * @s: #QTestState instance to operate on.
> + * @num: Interrupt to observe.
> + *
> + * This function can be used in conjunction with the
> + * qtest_get_irq_lowered_counter() to check if one or more pulses where
> + * generated on the observed interrupt.

Missing to mention a device must be previously intercepted with
qtest_irq_intercept_*().

> + *
> + * Returns: The number of times IRQ @num was raised, i.e., transitioned from
> + * a low state (false) to a high state (true).
> + */
> +uint64_t qtest_get_irq_raised_counter(QTestState *s, int num);
> +
> +/**
> + * qtest_get_irq_lowered_counter:
> + * @s: #QTestState instance to operate on.
> + * @num: Interrupt to observe.
> + *
> + * This function can be used in conjunction with the
> + * qtest_get_irq_raised_counter() to check if one or more pulses where
> + * generated on the observed interrupt.

Ditto.

> + *
> + * Returns: The number of times IRQ @num was lowered, i.e., transitioned from
> + * a high state (true) to a low state (false).
> + */
> +uint64_t qtest_get_irq_lowered_counter(QTestState *s, int num);
> +
>   /**
>    * qtest_irq_intercept_in:
>    * @s: #QTestState instance to operate on.
