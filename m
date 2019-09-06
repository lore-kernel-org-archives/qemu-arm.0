Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp175985wrp;
        Thu, 5 Sep 2019 20:02:49 -0700 (PDT)
X-Received: by 2002:a5d:8d0b:: with SMTP id p11mr7797800ioj.136.1567738968914;
        Thu, 05 Sep 2019 20:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567738968; cv=none;
        d=google.com; s=arc-20160816;
        b=lHXxCr7i+9pWUdhZY+7nDhQILeAQW6YeiGx17z0sYwjwSxiTpH1ObCj0oSN3baHqDT
         kxdTKG7kcrC6+15+s23a9/8j7CrVXuqvGdvB+HCioAivRCcfdtsw6by2p1Dz0moyYHB3
         QV6zD+AwH6ZAyCJP+hInLwsc9ZJAKv9DjPqj3wZ6LFunQsAipED6d5fc/j9Q+CuCpd9o
         BErfXQYbqNI65gVQNcMX1lrNlNHfS9sw/IcVwgLnUpNuzZNjdDoDwxYDX5sOV94fj0vc
         cfZHs6+Xg+qyIGH/cfBe/6wMsymgK468jtp2tzLF78+mo2h9X78ukUpFtGf8d1g7dnn4
         SyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=tPjrxSpg0VUXdoD54SOmEG5RPuzf4G6Eimww2PODS4w=;
        b=aTO1B8MiUxbH333jZVSvEWPDymqSeR6riZuwUXCoMNMF1CS0a5eIIkBUFS0TvG6MbT
         ls+ZYfCy94YTRwZd9AAJnToemZi61xjhRUJff3vx5Cw2me5p82lzpG1TLvLImYNBLb1I
         seWUQtT8RUz43myEQwj2gPZ0OTlj5wVLyaOqRcCbMPZmMG+SMiwZlT3Vjyc8poWROh85
         OeSUukjcEmfu4fpPX5ZWFyGGKsGgd2MYa/Qb0tXVgU4esCspXnvJOAsyelNw3h4ksU6G
         ITtj2c9MVg+iKYErK3Xbm3Xgc6n1H3fIkPGKDBsimQ3v0Q9/b9B4XCR2JZpYELDUZIt0
         s1+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYvC0Dmh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x21sor3253757iog.130.2019.09.05.20.02.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Sep 2019 20:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYvC0Dmh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tPjrxSpg0VUXdoD54SOmEG5RPuzf4G6Eimww2PODS4w=;
        b=YYvC0DmhRPGBOgtFuUJA1cGbS8QCNF94USz2SNufa4CG3eXYaIQwUuI+TtLkuBSiIc
         akaHcP/+SyqjEaLrBId5zILue3T053ebWTaI80FNweE3tOZiRmW/t4wocMrkORMmdCDl
         lUFCqFOFXRE7S0zIqW9uEdapSrCGsCR45PhiY47J8kf2nNE/wsZl3cgv8dVVkhsj4cAI
         zP3vTGrfTM6SRVhl+dTB8hGUQ7biudwQZcoR9a9oyyAeQBC5sg8JSoNLmFbGmRqAeWPJ
         m8zqr4Arcks6RSVVrkwlh0NpdHr9KRjHnlojPCvhSTesQ22kxXcQA9+jasHuTioyeBOC
         wX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tPjrxSpg0VUXdoD54SOmEG5RPuzf4G6Eimww2PODS4w=;
        b=JtX0MoVmeGXXZT/ncUUKoeW3vhbtITUSNWUPi6G6f9DA9zzazBxwdDgFmYdjF6IZ2M
         g3NKwPJl83m1DSS55EtuYKbdNNMTb5xyCzFutY0KrYuFmZYr8NJbfDxeCJUWvIuZOtOw
         g3MIGyv6Xpn+fPvBkDki7VPCqhUZrOBNabCcB9rD+/Gg2fVuJWsFS6Qk0l28BnEagyxV
         1zaJwNznzqrc7wOgOJHfPGyg5m/Q4vvdEXdspTKrBKLa77kuHQYwV8mVcVh1U7T/GsWv
         19VCHQG+ehxA3X1itX+vHEfefVyh2UUe12V9tvJo3mUpGGarjJf8dFdz4fujftbbVxQY
         L5Cw==
X-Gm-Message-State: APjAAAWGNFVL4YSnV48odvrVU41SkRSL6uKJGVsjf2fPUU4WpZUhScEh
	vF4iW0V+9LbHs5MM+EB7B7vJomWT72E1yLRj
X-Google-Smtp-Source: APXvYqwXh4nCbnDBGJkSN7UUhfqY/y9KjHZXsAosSATxI/HcrYllj00waLM4U2m+Im+4GfaYh9fBNw==
X-Received: by 2002:a02:6a56:: with SMTP id m22mr7618815jaf.114.1567738968413;
        Thu, 05 Sep 2019 20:02:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2607:fea8:a260:81:78cf:74ad:c2b2:73ef? ([2607:fea8:a260:81:78cf:74ad:c2b2:73ef])
        by smtp.gmail.com with ESMTPSA id l186sm7993113ioa.54.2019.09.05.20.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 20:02:47 -0700 (PDT)
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 17/17] target/arm: Rely on
 hflags correct in cpu_get_tb_cpu_state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Desnogues <laurent.desnogues@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-18-richard.henderson@linaro.org>
 <877e6m937n.fsf@linaro.org>
 <CABoDooPis6VR-3zw6EcCerwmTfZ_c2gqbCtVDSnpB30q-Oh01A@mail.gmail.com>
 <874l1q91z7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <90c9a537-6786-060a-35cb-ab29dd8c45c3@linaro.org>
Date: Thu, 5 Sep 2019 23:02:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874l1q91z7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: l8rwjxZ6dU8E

On 9/5/19 11:50 AM, Alex Bennée wrote:
> I wish there was an assert form that would handily print out the
> difference between the two values. I wonder if glib has one...

g_assert_cmphex(), but checkpatch.pl flags its use because there's a glib
environment variable that disables the assert.


r~
