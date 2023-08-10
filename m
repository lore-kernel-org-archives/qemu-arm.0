Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp823043ejc;
        Thu, 10 Aug 2023 10:10:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec90:b0:1b8:3dec:48de with SMTP id x16-20020a170902ec9000b001b83dec48demr2595864plg.47.1691687446350;
        Thu, 10 Aug 2023 10:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691687446; cv=none;
        d=google.com; s=arc-20160816;
        b=LQPZo1Rp4sYp9JHipk2wn9mE9PhoipuuTbV8Y8u1nnXNF2JMm+nS1BSavqAor8mgxX
         98zMzlNT42pVfV7IHxwFLw2X0KJdolqMBkupQp4WdISbulT+7oFm3QvippBsEY+Bkmok
         5Nx8DF8cV3zaZl+nO80W8lwyviVx464gCjES59hINr6kf8Afd8U0VLGXM5aPFH5vWa3o
         5C/+fSxYzYLM1BME1GhZTL6zRGe2iYbpcNF8Nuva56u9UgU0uSkWWdpO+JjGVtNDC6BD
         7ifwogvDB0f5Z2h8rsL3TdW6htGDFhXFAe5x2S+PveVccIKCO09Ay1RWkpAkcjfWJd+Y
         8drw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZxMOPh9dOkuMEVe8qKBEydcF9wbCuV5C9JH1zuchmzs=;
        fh=ihiwTNv69pUMQ2yLjv7oagE4C9JLaoKJ/y7zQfEq0ec=;
        b=fgqcvN2dryoiVp27UPlu03DushHEMXuZr7bnoetrooaLhZQy8aGZTSjGg4eV4S+3zK
         pqHI8PE38CcZrc1jdar7txfVV15MLp4FaUNTTNZTHtwmqv+dHherXbBgihNRQ440Pd40
         MUTvRCWUAyWG48UAbJatwoQNQbkpLs2NK39L+e0/rmTd2NNkBNe2tEAQmWDm03Ojg744
         98Tvbt6uhzlI2LJWE4AGqKAp45ChIMBV/2z9PGr9UZFpuS+rLnmH79sV+mmy52LZsC2Y
         VqHYvm+wuEkdLPMSo4eywq4CJtijNxAwijkr39udRywwVrDXnTpxIlZ6tzBnb1Du/6bI
         Ye2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqZNEa3G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w17-20020a170902d11100b001bb962b76ddsor1065108plw.7.2023.08.10.10.10.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 10:10:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqZNEa3G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691687446; x=1692292246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxMOPh9dOkuMEVe8qKBEydcF9wbCuV5C9JH1zuchmzs=;
        b=IqZNEa3Gkpr1nrFpwm2GEKfx0VRSl8xTwMSrkhs7sG44XhJVwdgwdgfLqXLgTJoMY2
         5ouLLaoJdvlIR+fEVvttjqw6AQae4EJ6oqEVEt2g6Pb8SWZxqlSS/8vYItz9XRALviGX
         cWbSIfn8SjLYSXsie8MdSDRJMwIQQDcJDImLNrlu0jBB26fSMgbhjGhxJf8urXFWCEa/
         a2tzcBUdp3AOM1j40nbNqniuuXomYqvpAF88XLETIrokhqQbsMa2bSnFxyjVYxAQi+Ch
         wUcFIrqi9CnZHQDjJnc199na9PKvf3Nj+IPgkcsGTSsAI6yu5t85giSYHcILlXHk8XqA
         O5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691687446; x=1692292246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxMOPh9dOkuMEVe8qKBEydcF9wbCuV5C9JH1zuchmzs=;
        b=eR7FXzhKLQH1K0GNLLcqD0ul6EVfbPbOwIeGEkpf7JuKK35yxZh6B1eRRAmgZm6DKj
         8atBHWRP2qZUNmNMPtBwZJjqE44G0i6a25gCyyuakalWxCzHpS3HQsFxhLobitw4klaZ
         3oDuyjFmoQhiZpvjt8+vzyIRzRuJbCWMzKrSajIeS4gEPcdWB5xT9h89hF5v7y+xqZrY
         nuJRrBLVkoAJEaqMGF0SvkpAKNC4cn51nG3TB8hv7l+gttmj4KUJ8GgC/ky+s+hTOHFx
         k3qUxMe9YMTfMSqB6rYBz2cYb1tlzsZlYrqRpiCAJdW6qCnl4Mi4qMPA7Z8fbC/36Wov
         oFKA==
X-Gm-Message-State: AOJu0YyA1hwMcGy5B4Sd+hesGx7nVOdkZqp8tCTY8eNHZlYPQtu1StPF
	TkipDqzzik8zoDRKWAR1Oetgo7cL/td6MGMOf4WEvg==
X-Google-Smtp-Source: AGHT+IH0pyGQ9d3kYugccm4968ZAj8mKTRtHWsYriwy5ZukitLyant26rTe6yqAk5KrBu6NUbQEBSA==
X-Received: by 2002:a17:903:444:b0:1b7:f546:44d7 with SMTP id iw4-20020a170903044400b001b7f54644d7mr2299778plb.17.1691687445770;
        Thu, 10 Aug 2023 10:10:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001aaecc0b6ffsm2017370plh.160.2023.08.10.10.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 10:10:45 -0700 (PDT)
Message-ID: <02c799be-e6c7-111b-0211-d45bfc34a4d8@linaro.org>
Date: Thu, 10 Aug 2023 10:10:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] tests: remove test-gdbstub.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230810153640.1879717-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ze/5TUow8oN7

On 8/10/23 08:36, Alex Bennée wrote:
> This isn't directly called by our CI and because it doesn't run via
> our run-test.py script does things slightly differently. Lets remove
> it as we have plenty of working in-tree tests now for various aspects
> of gdbstub.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/guest-debug/test-gdbstub.py | 177 ------------------------------
>   1 file changed, 177 deletions(-)
>   delete mode 100644 tests/guest-debug/test-gdbstub.py

The first sentence could be clearer.  But as it's unused,

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
