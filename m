Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5740325wrp;
        Tue, 17 Sep 2019 14:28:35 -0700 (PDT)
X-Received: by 2002:a63:ff66:: with SMTP id s38mr851212pgk.363.1568755715670;
        Tue, 17 Sep 2019 14:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568755715; cv=none;
        d=google.com; s=arc-20160816;
        b=tU06bJGvmaiMbIZ0mJbwdbcNdm/gA4W2XBW8N1AUcul9tu22/6zus+xXIGvpSCiLQA
         BF8w73oMWkva9H7vRxBchO0M15/W0boUH7G5xKNxdDUMDZN3DbiHIf4KOM8fJbV+XL2z
         W+3RqXETnvLZwJSd7POmygBUWSh6Q0Lh+FWopFYeG1taOL2bOc8L2BIwhgRwj7gzMwK5
         RWdNij9yLJ0oGA4RZ3ZVW7XoVdW5+uZ44YU+q7O3225qgWw2CA3kZ5f2+lJYU1Cqd9KP
         KOE9Ge8dfHMI7lq9Dbs6ZKQv/1OC086Cylp+B6HfU9TBF9DzJLOqEqtodUSX8Yn2KPXH
         xvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=WzMGZXaEOlRXK4dqLeaJHkKEfUJG+DDEAm+9ueoRpZU=;
        b=uW0RE02MUVX5QL6Fw+eCFQSXyxqJ1Bm6CP294MrNgfO0/4Zv74KRdMkAnhk/mbvALA
         8iY5FDiyB6pxbYWMjVxnvirGEvZIDdstDqSzoBGTRc+OgmhAr0vDgWwmcv9kxbJSiBdO
         ro70uu37ZbhzevhObJO3Qkg4/A7GeVY8ZcnCUAHpmGXWLbGxjtHk4I2nYsu4zjMwBvZI
         wSuX3mrfdw8zvTThkmBxUSGcWa48nk5bODPWc3O290zuv0okXjufsRryOqnHK77qdWH+
         osKIa6o/edN0zo35mCImQTjmXMe2BMk+f53GqJkFsHW3lcNRjsG76gs1l/CfIC5hJAB/
         3AYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CR1TLuNw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h8sor141318pje.15.2019.09.17.14.28.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Sep 2019 14:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CR1TLuNw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WzMGZXaEOlRXK4dqLeaJHkKEfUJG+DDEAm+9ueoRpZU=;
        b=CR1TLuNwwGVBp3QhMk8KFn4851X5vQ4tgkd3scgTOR7U4eZQGjJKZDf0DGgWGx6nPW
         VSpyifIN/QKkCTE95DMLaaMgDXn5oOHArkClBG0OEl+ZphNOKSZ9vpsV7LTdd/JQ4qnZ
         N4FdeUeYBAbXWngXqzpE67aRLKgBuuOWK6vvPdCxye/rzZ6gX3+ztLJuG4vL3V/cDXHf
         CJpIYvmqACqEe/awykRUnYLr0gfVd9FCZ8QIlTRXDRtYTQkWdVjOcJNBm3Ie++TlfY+9
         TkhhpK0XIPWHH6bmlPjVEk12D/F+q+iy1RKsvAOtolC10GtylBtBwscyMS3tOyBf20Fv
         josA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WzMGZXaEOlRXK4dqLeaJHkKEfUJG+DDEAm+9ueoRpZU=;
        b=d0Sg4BmIJpR/tdot184Xlzz9sNjzMyg8fLQ4mNknYVC84GWxz4dNI7piQgvtNXt0+c
         AL2yWpE3WRSMTvsNvDjIrOfbfrBgxbDZcy+fZyD7WKb8BXJ917WcS75EMWAPnNYiLS9D
         QQqgqu9lca/LeSHF7CCZCh5z2rbPjnwIslhjUq6S2zhnUgLhsjY9QKX/b1zh+dkd+6l9
         TBqK76sGuenSLLZ5DT2DT55pE+lAo/46drzfdNJCe7QNzPK76paI40tyLdDymCPZ09mw
         kYr/Lf/2QjLtRQpj7jHjmhxnYrp1IMt2IwSqWk8cpYmW3Br+5+1SCjYKOXYTHZBARs/m
         dgsA==
X-Gm-Message-State: APjAAAUuOdxCQdCbVERRKKUL8U39u56Vb8jmQSDIU8fYWGNMbgMjgfze
	X4+L/5W4mNEwPH9z6qYN+3QfI2rqAlKSjQnM
X-Google-Smtp-Source: APXvYqwpIjkBcxeQGuAYkeTZ3kmQQKG49hF7tADyBRvwgPbb522P8dyZJmt9OEgrtcDqWs0tsbM6DQ==
X-Received: by 2002:a17:90a:b001:: with SMTP id x1mr174603pjq.114.1568755714959;
        Tue, 17 Sep 2019 14:28:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id n15sm1679909pgl.80.2019.09.17.14.28.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 14:28:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 7/9] tests/tcg: add float_madds test to
 multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-8-alex.bennee@linaro.org>
 <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org> <877e661vur.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <93ff7174-77c0-d2eb-eac2-d3eef7e88a14@linaro.org>
Date: Tue, 17 Sep 2019 14:28:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <877e661vur.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sO+wxZXSUNeu

On 9/17/19 5:00 PM, Alex Bennée wrote:
>>> +    add_f32_const(0x8p-152);
>>> +    add_f32_const(0x8p-152);
>>> +    add_f32_const(0x8p-152);
>>
>> Why are you adding 3 of the same?
> 
> To replicate the 1841491 test case where the same number is used for
> a/b/c

Then we really ought to be more explicit about that.

You're not doing full permutations on the sets of numbers, so does incrementing
a random index really test what you intended?

>>> +#if defined(__arm__)
>>> +                r = __builtin_fmaf(a, b, c);
>>> +#else
>>> +                r = __builtin_fmaf(a, b, c);
>>> +#endif
>>
>> Eh?
> 
> Ahh I was going to hardcode the arm madd instruction in as the builtin
> wasn't expanding. I tried setting -march in the CFLAGS but that didn't
> trigger it either on my buster arm-hf compiler. Any ideas how to get the
> compiler to do the right thing?

I think you want -mfpu=neon-vfpv4.


r~
