Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp13853253lff;
        Sat, 28 Dec 2019 18:57:33 -0800 (PST)
X-Received: by 2002:a17:90a:19d3:: with SMTP id 19mr36972151pjj.1.1577588253494;
        Sat, 28 Dec 2019 18:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577588253; cv=none;
        d=google.com; s=arc-20160816;
        b=vCnxB/1HKU2Q1O9T/ORKr4B3ezU+qMdLhILkXzMOOMCaHN45hIa5DxvJzDX0Jc2LvD
         7tOJNnZuXXPuVpup9120edub91ng4kaQN7y/slb7m/cfQfQmDE7l2wKOE8jdHMlXn6s4
         wQyjf6xTw6qe4iU7Ku4+erM0oI3jYG/3mYbknBqQ6oDIM+dfir6u+SqSYa/QSNJ6eKQD
         vwQjVAfmLM6UMOCV3jjwd94HWfGeFLb6i1E2M4CSwLST7/JrQ2jVNWCftzRjrebcuW2F
         hZjmuLg0f0HI0mfMmu15NbFSl+YqOqSbjoYCklaC62jQLaXx+UP9160gw4m9XxkemCNO
         f6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yLaqwPIFuNuKqoOfcXmFF2FZpBhCNI7L5ivEi70Tx7A=;
        b=tm2Gy4+FdACA7kZdoCbYCX1wp/e/9aMU/LZ4kpXZqM78s7ynl2DjTHI8zCyqcsChy/
         ZBdoHXX3owW975/Nx/KvRlKhCJdjuFBw6KTUa1NfZY/8NtZmgRDPtuPCjEjzfKfBmP7D
         wGjV9+DW3YLMt326emk/+ax3tN82MqNswChHCNUj92mrEahzdvSxlMbd07+ojM6Qs8Cm
         onGmeiB8HET0ilSJJ33a4CaatSUaGtmv32chsjV+pnJsOiocdocw3JgW7H+uwN2mziqB
         1K0LINjUZiKU9vMdVnVURE92Vr8y6fsfgXN1Q17t8r9MT9gOIe7jMmEv/51PRAIMQsW3
         mtGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbA0oMwy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x3sor40594245pln.2.2019.12.28.18.57.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Dec 2019 18:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbA0oMwy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yLaqwPIFuNuKqoOfcXmFF2FZpBhCNI7L5ivEi70Tx7A=;
        b=NbA0oMwyNZ+xHiqx6KaWXfxDiL+pOlrQaZiXHwVeym3kJzJFrKbLErxhcRKN5lnWwQ
         pu36YjNLL/9jjXLwB0yRA7HPW2AK1G5TJxE20vcLRVBsCOLm7iqI5VbEctvNdZVwukrA
         tKUJrGKmNdGdlw1izmxlYjtYAP5w1viZr7XVSPz/KiQ+rG7ROmv+UIwpI1Lcq2/q9/61
         kkAuXipaTjXcsUzYpwQfiKRbBrorAK6eBEfb10a794gVrLnz5nHZgdz+SpTQor0+R1wR
         ePugyLpAxwR7J/ymPr8kZQimGyzyJOUiCz8ELa7zQkro0TtyKB3tTtiz7HGkrWxwifLT
         A+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yLaqwPIFuNuKqoOfcXmFF2FZpBhCNI7L5ivEi70Tx7A=;
        b=Dqw3fJFysIDOGRNnKjUOk6WQCVHQQYiLhIXc1XOuDni3kZIgfiXEUc/YZ6dCUJmrQ1
         tr563tyTU6WfmYdwflhxkCFreQtmIRT2y5R44WVmPsbZ3ZIs6uGRbQcrgS4XX2+Yc00D
         cY2QbCqWpgI6gmUw7uY2yw47ryNp+pMcw5hHhkOXAukS/xLo5C0Y3CPjeVrbmqDR2Lor
         1UE02SeJtpElgP1mETuaLfidAO8/ZslFb2nw7QFaGfm9yE+D8ENErzWJdurIIAeW1tXJ
         0dkk6dl4f6sjeniL2udnjFoVl/OA+Eq8Cz+uueH34zvUylGjJrJ9TROyxTC9rYqy+6Z9
         5juA==
X-Gm-Message-State: APjAAAVQu1guZRzm2xfzP0sEGak0f4RB+xfWZkrpobFsQwVKC4UNXZEV
	qAzS32d8xX3jk9L+Nnwb3KckHx3X
X-Google-Smtp-Source: APXvYqwHLFGBtdQq3j/i+kaQWDuhG9WqLrDYK3G6uy+PcAqmC0j/2qwGQruwkABv4sH3+ivN+2VuJQ==
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr62031009pll.238.1577588252927;
        Sat, 28 Dec 2019 18:57:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
        by smtp.gmail.com with ESMTPSA id q15sm42618719pgi.55.2019.12.28.18.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2019 18:57:32 -0800 (PST)
Subject: Re: [PATCH v2 4/5] tests/tcg: add a dumb-as-bricks semihosting
 console test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: keithp@keithp.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
 <20191220132246.6759-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <557f36ea-159f-ebb2-b7aa-e96b0844e1ae@linaro.org>
Date: Sun, 29 Dec 2019 13:57:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220132246.6759-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AWRuO/3gw9yf

On 12/21/19 12:22 AM, Alex Bennée wrote:
> We don't run this during check-tcg as we would need to check stuff is
> echoed back. However we can still build the binary so people can test
> it manually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v8
>   - actually return the result!
> ---
>  tests/tcg/aarch64/system/semiconsole.c    | 38 +++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.softmmu-target |  9 +++++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/system/semiconsole.c

There probably is a way to easily test this with python, but I don't want to
write that script either, so.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

:-)


r~
