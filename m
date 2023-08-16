Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp323067ejs;
        Wed, 16 Aug 2023 05:38:37 -0700 (PDT)
X-Received: by 2002:a05:6512:3e1a:b0:4fe:19ef:8794 with SMTP id i26-20020a0565123e1a00b004fe19ef8794mr1920607lfv.28.1692189516965;
        Wed, 16 Aug 2023 05:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692189516; cv=none;
        d=google.com; s=arc-20160816;
        b=WOrG61AGd6dKMUvC4C/63Fh7f6oFYmK9koH7KqOA+IWLakkOjmss5t+XnxhVZHPR4E
         6G4SrTYZDwCzkdqz5w1r+EpyZKGegr1i2TTJIvfTHUJyJ2rMdgY/tRZCQuD8V433eiK+
         x0ixZrZn2NMmd42Rq5eRxVXHSmYxL6WqG3v7f2X0sAd4b747Dvu8ktfB4pXbSacl4nef
         JBlX6rNwJaGx8kUzcoEuuYnX/TDPl7hVozPnO606GCc5F9eVAifVpdZS1sH3o6XaAhtn
         2GCX/3tXGEmLcNp403Q31fa/i/J3pvYce4jAq7c9OFGLSCRaZPhsKmUmnSC5owVVWWdG
         PpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q9poNHcu5AbZCpcG/Pkquwrs4rfLZEIzGIW9t9Ndfbo=;
        fh=/5+kKKbcGfziZJ5ep9dAf54H7ML1KkZqHsQr4EVTdYo=;
        b=V4ofciSNR8aZZltF8wHaHA4etGiDhEHAqJc97IE0TjDqsEAfBlcyVvs4Og4+EO+gxZ
         lGDgquMjLBSY7/NOPOUisi3dyMbi4x1aoCsSajRlI+54/rA6FqPNROyRr7jfC1hWAq8/
         rGbSzXWcDffSMiozrD/LT1GXfm5TukywJWTxiXtl0Mt58MrPLGw64Gg7XKmTTSIMp08j
         aBI1GWLhT3eGXv72GW9bjGEmbE6x5YsSaXjT4SeHTl3voGphLzFEtjxeQ8+7qebvjkhX
         zGtN9yH1HiPTfwDctoa6nQns55pdQ2QxP3wk5oYEESh6Jxe5a4Jd9AVPbVdm4rVREj63
         MJrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPuBDgVb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c20-20020a50d654000000b005236af24926sor4700143edj.7.2023.08.16.05.38.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 05:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPuBDgVb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692189516; x=1692794316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9poNHcu5AbZCpcG/Pkquwrs4rfLZEIzGIW9t9Ndfbo=;
        b=aPuBDgVbuy7Lo3xQemFV1AgJUQzABZMqnqoJwhfXG2PeJrNoyU5pAIMFjKHDb/kKMC
         UOYLNSNXzxbwrYSISzEg9qWRk7uVTsS34AYRMdw2xE7k8wM21d3Gid1scdDdKpWFJA49
         IUUlJpXKnitQdjixJGJ9+Cl/pr+26oOli6e2D0eNFUZrFPhUMHjVID0cR3H6Uuptiwkr
         vhnkAVyN/TF2/OoWKby6Ol9YuaOmQnLuE3/nvTunhGMxl9cs3oW4Jr4fpVfBJ04S/uFr
         dUJs00mF1sqJv7RaYxhu+rHqsAtosYJLPpZptprAQa7UTZassKtAgSZMvJU9jycS0UnA
         jDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692189516; x=1692794316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9poNHcu5AbZCpcG/Pkquwrs4rfLZEIzGIW9t9Ndfbo=;
        b=Mef7Efbr/zaNDD/rNieMNn/yTyA5s6qiN3SHh3Nj0DWT/0IghYSabew9WiwFepxbV9
         y+7iCxPDbgnN8SdLkK22MfmC4ezmKHG8B8szD1mODXH7ElHOdKmoRSOBtACepzQdq/JH
         Mvi57thdYjDKjHlMNcbhSGGapR9RdXcBTDvOo0sdliDkcDr4QW5rXm9T9CDESkUzl7V9
         G01HwF76xVSItJcMARTNjE+/CWPHfsmNTX0Q5dKGoyHd8yGmwwGP+vR3sRXCcahBkvzr
         w9O1TEzVO5hsTvXiUQBvbecxJhS03UROdEl7i+YFlOgAPLxQPs5PCB9Fpq9AJcBcvoI7
         C4GQ==
X-Gm-Message-State: AOJu0Yw8QUBlqzt9OLdMJ3tLlu1mCpz64N02Tbj8asKxyHK5N0CR9LJU
	yQAMmACP6ArIWGpKgSEVkkZ/bpC8y8jnumr6qxQsqw==
X-Google-Smtp-Source: AGHT+IEKYGUWbNFMUdDtpCE4kEGjhjbrp0+aYjHUMqkHDXK8PWv2elMYee+jR8OMn2n+9q6hOFMlQw==
X-Received: by 2002:a05:6402:1655:b0:523:1901:d19c with SMTP id s21-20020a056402165500b005231901d19cmr1679551edx.24.1692189516162;
        Wed, 16 Aug 2023 05:38:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.102] (mna75-h02-176-184-40-35.dsl.sta.abo.bbox.fr. [176.184.40.35])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7d8d3000000b0051df67eaf62sm8352815eds.42.2023.08.16.05.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:38:35 -0700 (PDT)
Message-ID: <dfc59eb5-ed1d-c86d-9e09-1626e943f84c@linaro.org>
Date: Wed, 16 Aug 2023 14:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 2/9] tests/docker: cleanup non-verbose output
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
 <20230815145126.3444183-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230815145126.3444183-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Y0xvwi4RP4g7

On 15/8/23 16:51, Alex Bennée wrote:
> Even with --quiet docker will spam the sha256 to the console. Avoid
> this by redirecting stdout. While we are at it fix the name we echo
> which was broken during 0b1a649047 (tests/docker: use direct RUNC call
> to build containers).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/docker/Makefile.include | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

