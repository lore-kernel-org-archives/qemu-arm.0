Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3842674eje;
        Thu, 13 Jul 2023 23:56:17 -0700 (PDT)
X-Received: by 2002:a17:902:a715:b0:1b8:918d:ac48 with SMTP id w21-20020a170902a71500b001b8918dac48mr2394127plq.56.1689317777396;
        Thu, 13 Jul 2023 23:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689317777; cv=none;
        d=google.com; s=arc-20160816;
        b=fGRtqUEkZe1O7TlvxMsR9Aer+5SRxretIV7KjgyRUuMUrOTuLWuOJEHLHl+KNMuqLf
         o1yyPqROS6YtlWa08Zw70kvBB4tRDcCxc+Vw2q6SueanjRp2Spv3MuFQHjdmI1vCnsUl
         DmfZpN0cPBPuya11MN4BaWk71hrqPGI1DpzIW2g7KSKN+QFiqjdDMwLHp3ofGEIuHcm+
         uGqKTH+Rfi4tw5DQg+2M6F98G2FUufgoKuwRT0qdgWvQqmdCkWFjbNzOWPfK3mdU8KWq
         IQzgdMCAOrqSv5w90aoUvHTuzcPMs86PLyfLGK7mBG4kIsQgAq6uVlS+vg6qz4YOYKBS
         CLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=foEaLFX8KMgUyuIBJtXqPi7GafqmcF/xw/u41e+TOWk=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=OBd5TK5lJ/d01BM3y0hn2MTD+jNh6OgVUw5f4AuxOjCYhMO3nAWGKET89ZZMLixN6F
         8VilI7mw48QhHv+M751yI6ovgA5qzn9jYSyuyzAH9RmDDTUkFyavGf8hOVFbNkJrGiTY
         d1qmdKsbs0nqRM2a9pt+CzrbuH7UELffBiIOze1BF3FIG7XX6XL8GxT8jjIXUYBWC1/u
         PblcjPm0AE1MRgcUFMmcUsKs9Y3uIr/Lkp2BiO2vPzkfppK09pTrhLybFjXZqv9kO2F0
         2fCW9PY+Uae5IVn7CmcJ/Hkjii2MjQsx6O9Tyk5aRAWbfME7t+dSzkNbZxSvoh8pAeiU
         HrFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhoAGlYR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l20-20020a170903005400b001b9f8e6f9bfsor1692471pla.7.2023.07.13.23.56.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jul 2023 23:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HhoAGlYR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689317777; x=1691909777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foEaLFX8KMgUyuIBJtXqPi7GafqmcF/xw/u41e+TOWk=;
        b=HhoAGlYRpXVGnG5V3gfy/fWwqmztzE3h7aQcRzhg0VSz6xnr58sZxczal1ijoQweIC
         TvWz5ulOP+hJAQKCQqnPb2Bo0fS0bOHQZ00GNlA49r7OMt4FKkIJ27mvQnelm22eN9Di
         ilNTyl+X/iFipIOtOOxzof0E5MUZAW2Xd1TEtHpa+vi1S3sRn14NXay0LcIdcVstfzv2
         2u9y7Ao/7nCPq2O72/kyrlMD3/PRt0C/kh7cLGUlzTAtIGNXYqfEvjxnmLm+wuPCLAit
         uYcwa8BaO7d7M2TFmkR5vYoiqTjOw1AJThECkr8dUuXzsfiXMDL3UK5pvkIblKYA6Jpc
         gTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317777; x=1691909777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foEaLFX8KMgUyuIBJtXqPi7GafqmcF/xw/u41e+TOWk=;
        b=Zy+IixlfgoWMPVoEw8XoGM9lhnzxp1pELow0qHu+DVjnC4zwhdIKbcZsY4mxtURjG8
         y/BzrlbUIMinS+/Umg59SQGz9NOag6L1QIqtiQVCiXgbTDyvERK0rlq6gHdahV5DfLP0
         krNcASFdvbL870iAFGEsqHatbV+8YYxV70KaCgbMSJkmKcNZXUYVdDLAbp3CQsfDM3hf
         JebWSTT8ChpqEGUPj2wX+ZUAcf0A6olWIvbiKJTzz4vL+nWOqsqVypQm9kpI4nGmjW2x
         piF2LkDMMLyTPtZodT415V6Omtf74dxZfFgVmzJMDNGp2Wi7legtLIQdHcpTerH0TWID
         J9ng==
X-Gm-Message-State: ABy/qLZyvTseKs+YOwCIMPrN72AMgb/MPbCjlR1+dv/slAZsd9sFQu/N
	/hFW7vQNuTrLY2p5K2OcF4EwQ20o
X-Google-Smtp-Source: APBJJlE6d9hQwH8FrO20wbJ0bTuneSPE60Czujy6eebW1h0vb+7gLcQ9xFFHA+2BWF9YDWksGm7fag==
X-Received: by 2002:a17:902:c381:b0:1b8:9db5:2ec1 with SMTP id g1-20020a170902c38100b001b89db52ec1mr2536584plg.67.1689317776915;
        Thu, 13 Jul 2023 23:56:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b001b8a897cd26sm6947822pln.195.2023.07.13.23.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:56:16 -0700 (PDT)
Message-ID: <5bb250f0-744e-8820-b9b2-0ce1a0eee3a3@linaro.org>
Date: Fri, 14 Jul 2023 07:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/11] hw/char/pl011: Split RX/TX path of
 pl011_reset_fifo()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T3LLJXet+hL8

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> To be able to reset the RX or TX FIFO separately,
> split pl011_reset_fifo() in two.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
