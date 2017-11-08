Received: by 10.223.150.237 with SMTP id u100csp1024639wrb;
        Wed, 8 Nov 2017 00:52:26 -0800 (PST)
X-Received: by 10.25.181.65 with SMTP id e62mr547824lff.248.1510131146273;
        Wed, 08 Nov 2017 00:52:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510131146; cv=none;
        d=google.com; s=arc-20160816;
        b=byOeY9Id064gNap07qP/+pQQs5wHKWvcsvEERps1xqmWWOy4EmR/sx8QxHmQVAvfRq
         7Okq+a75YehHVhDkeTHwOyRs4SYU5O1eUJZQzpKsM36wSGXBarhQJaAG3Z5gkFezJSpS
         QAnb7yF2SE2sTb5epAHXF6wPN/4t2w6Ep0v7qWdOE6zZtpGID5IwfL/iz6KhfwICgykb
         qv5zCzIln4v16AH4zEtK/ShBnOy/cg3lB5DYrL48zP10801HsUn6ysltDvc+YHoIa3RU
         c1Jj7PSetJ1Ciy/GrDVHcbCdRPqJNQxeSeKiTm88kBaLuX+rucSDoTYHd47mOHe0TrGY
         neYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=LeFj6m7U6m3iX2Ky9RefDyQ/pKU54hlHH/tXC6m6jCM=;
        b=i6DObLCd0cc/jdU1541fedLph9y1wEN+NW0PWtOO5WrweRh9j6dpoPSM7dcyLaVXl8
         EvzD6pRYBXOq8tZzMVwyvCYC2ooDbEuvoEa/cqoTgisVhN6ou1vrj2M1MaitgcMkewGo
         W54W0bLWOcKD52KrSCj8d5KBYbVAX+Z1S/yS4diIGXuvbo5dt+O3JGAsvdYrOu8QuNgD
         X8D2fMiFosWlURvX4ITvmq26CrE74Gqraf0ZgYFQH/rzUVDD40H28OAECiOemH0ZhvD6
         enwkx4MnNpsbw/elSq0Jm/0uYGdsy32mONbxvDN/ZurHqxVSGLS43+FzTFb0iqYGeRm0
         uQjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=be2jCu/9;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b17sor580681lje.8.2017.11.08.00.52.26
        (Google Transport Security);
        Wed, 08 Nov 2017 00:52:26 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=be2jCu/9;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LeFj6m7U6m3iX2Ky9RefDyQ/pKU54hlHH/tXC6m6jCM=;
        b=be2jCu/9/zfmLjyc0kJDYliI92ncnQQFGpfW3qYro64R5Z6buGU16tIAF02e7qpl1o
         VmhvDmyEJQsL0V/gLThlyM1ofg8BKBSEXvJQ+ExRNti08sgmcBl6AR68zcimOv0bwzj4
         UtOVFgZMsEZ3oEGvwgwn8Tb1tniA2ZrrnTlH44koCvy5JZ1r8vvWe0RjfWf/cm2KK4rR
         oBefFiHRo3SZp/DYUmZ18luTcheGCT8VYcc5GGaS9cyKmkRTExGBm6te8j/9IS/Oiz/L
         HolDfeO8s/ddFakg6dmtTCVZHDlHKIPqU6upeGvSwi7a1LJyixwTDcHz4IdtDB93MV26
         QQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LeFj6m7U6m3iX2Ky9RefDyQ/pKU54hlHH/tXC6m6jCM=;
        b=K8FrCiQKjt9BzFmiKPPace3ycVnkoXT0ujOJodzgXczRBbFINdLH1KkCEosx8EFRCr
         2YsviCoa4tSlnmHxK7QAyg9vgnzbHHpF5j6qQF4d1/Msc7BNi6UL3IG04U9JUewvovmp
         vIZjU7zaypV0CiJ+NVf+e/inNqU6fvlcogcl+po2lnQeckjx8DttW17YQlUxInjya1t0
         /3dPBC/wuSS/xpEO7OGSEnXFP6NpSOrNr8MwahlglyDW0OJQGU+MCOZiq5ARMA+yRPuU
         BeteB5Qqgq7XabUHSNFyaSlBZDqgzapvoPwJ8Ys/fLOmxENOPVQxib2jIOsat6rvRv6L
         cDZw==
X-Gm-Message-State: AJaThX4R1NCy32oZmHrzuW2L8cn8GQRrYyjVi/Ao39tf3tNfWjj4LjDT
	nJOwUYv8+OVcr1LBVQRZm8A=
X-Google-Smtp-Source: ABhQp+Spd9X/C7596ogrK5Ib9rfLVnhV3t6JqaHbkZUD15xiJsfGa5Cve0zQ4JTzQXTfXGlfmrY+KQ==
X-Received: by 10.46.95.82 with SMTP id t79mr613960ljb.63.1510131145910;
        Wed, 08 Nov 2017 00:52:25 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it. [93.45.2.58])
        by smtp.googlemail.com with ESMTPSA id r23sm661997lja.32.2017.11.08.00.52.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 00:52:25 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] accel/tcg/translate-all: expand cpu_restore_state retaddr
 check
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20171107165226.22546-1-alex.bennee@linaro.org>
 <CAFEAcA-E4Tq0gi3q5z+_5JOy0-j0=59p5WiKNFP9qmKG8=r4bg@mail.gmail.com>
 <87r2taq66h.fsf@linaro.org>
 <CAFEAcA_2QhC5BRJX51n4FP7EBOZ2qyq-H3hRhoGRLMTD=gP=Nw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c1ca4ad6-b31f-7c7a-ae43-80eb11b49e1c@twiddle.net>
Date: Wed, 8 Nov 2017 09:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2QhC5BRJX51n4FP7EBOZ2qyq-H3hRhoGRLMTD=gP=Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: L3yd6QcKFiEq

On 11/07/2017 07:53 PM, Peter Maydell wrote:
>> Then why call cpu_restore_state at all? We should be consistent as there
>> are plenty of places that do things like:
>>
>>     if (pc) {
>>         /* now we have a real cpu fault */
>>         cpu_restore_state(cs, pc);
>>     }
>>
>> I'm happy to make a 0 retaddr officially valid and actually document it
>> in exec-all.h. It's not like most callers even bother checking the
>> return code.

This is exactly the discussion that we had last time, and we did just that.

> Hmm, there's more places than I expected that do that "don't call
> if 0" check than I thought. Overall it seems better to me to officially
> allow the zero, rather than having lots of callsites that all have
> to remember to check.

... what we didn't do is go through and change all of the call sites to remove
the check for zero.

> Incidentally if retaddr is zero then
> (retaddr < (uintptr_t) tcg_init_ctx.code_gen_buffer)
> is always true and you don't need to explicitly check for zero, though
> it might be clearer to do so if we think we might change the rest
> of the condition in future.

Indeed, I was thinking

  retaddr - code_gen_buffer < code_gen_buffer_size

which works well with unsigned arithmetic.  And a large comment re zero.


r~
