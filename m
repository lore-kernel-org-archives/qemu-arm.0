Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1555358wrp;
        Thu, 19 Sep 2019 15:00:41 -0700 (PDT)
X-Received: by 2002:a17:90a:7308:: with SMTP id m8mr83424pjk.87.1568930441866;
        Thu, 19 Sep 2019 15:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568930441; cv=none;
        d=google.com; s=arc-20160816;
        b=LscnebIKDiK9ei5zTvJMrNRMBhr2cWykVSbyRgk1vYmH8X3QXXhbU4flSyIdrOgNEJ
         r7CqxkkDtjhCu/LzFRfh4wzdB6+NPbK+wfpf3pK6b2JDcd7m8UiNR5RDNpgKEmlMcm+r
         jxwvx/rUCNu0lfrS6Qd7dln1jjxgdGzs3IF6Co+RBAIGxZO3aBoHzhDI99v+MgI2Earz
         Wbes+UjUQnsySGQRTtkq1NzV6R/S2pjZFRI1FOVsEx1b/pecXmcEaB8mQRoWNjUpE2ez
         kWtXZtPbTeWLGrLYSXRWeL7noloBrM7U4cFnaokAqVx/QAcluLPaBMpjsvlOlxBayUG+
         FLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=03E2kG3Ai5vEaanMicRt7GLZNCx3aLawxhWL/88f8ew=;
        b=vHBaLcXEGFbDzylZv5Mz0P3IJzVZ3wzW2ctvGM7olrGCvnV25CrUQXAB0wx3Dkakk1
         fy3DYBkVike4cKZ67wmAL461WWHBs2F2kNVRBO7m4Ttb8vgmGj/NVKLH5S7xB6HqEYb8
         UHxChAev3UczGOr5lcD7R0V31OC/ondNgcCUA3FaxtKwlZH7yA4yGlAMb9ZYWI2fnyNN
         nASTFIlYquuQDtVyDJ+lR7gHaJZhgJVz1KTcx+2TzhXNxFsJKtK1IHtSBbJ5FIhNTDvY
         pNPf/U2RHuAu9PPtiieUwaqKiIoRTGJvlLrWLIRZ0u/XpIB0SSfJW4qlR9TxHEvcWqR/
         KEcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K6wFjP0O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m25sor127555pgb.83.2019.09.19.15.00.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Sep 2019 15:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K6wFjP0O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=03E2kG3Ai5vEaanMicRt7GLZNCx3aLawxhWL/88f8ew=;
        b=K6wFjP0Ox0klPIUuZ9AyFRVq0oUT9Z9VWsMEpnVsDkUcViBPle99rgecfsRsJsC7mj
         nVYEiKnw3T5uHNr+pM0kmcAAaXrxRIfv8md8gcTr2rdTN3hgV6DXoT9zQ7HS2yd2qBnt
         ADAJEEDKLT4sC0CtH63UKG+/+myQs4K9FOs5ZOA4dqbj0B0LIe+k4kuoYsdoUhgOVtHY
         j2pju+WHupyTkaaNaJ5rRpDElGxyENIVT2YRmVxopuCYUoSSVl/2YTaPPBpXQA2zqf3c
         I843LGfSROsM9H7LEybcyh75+1j9GC7YrcFZ7SSnXR8Z3Ct8fCG5/a1ermm6gxB1IVRI
         nBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=03E2kG3Ai5vEaanMicRt7GLZNCx3aLawxhWL/88f8ew=;
        b=KFMU6RuqFpjQMH1dbTDJzZr2PxNefPvXU/1+EZ0Hp2emKLidXfhmwwQFRjXx9g4NIg
         9MYuFPgMnCOZb7hf95N2aYR+HN4AY1rZhKWtRiTpVxHw5kli4/a7LCmwmIkWIUD9VonW
         ZFy1EvqrxFEIH8CN5V/9kV1vix9ItpCChRrs9/ydfBruRMExN2cYQ5JFmwPWwXrFAKPG
         CdLET15dDDdLpvziMfOjRsCdiv1lmUlq33si2NWXanQLTf60NCQ6YcppI2k6VJm5bQHJ
         3ShTFAGTFu4YACfKtIyJZjGl4Q/53hkSEVPc7zqXvDb5R75avQclfXSLBdUrf3y9ipL4
         GHOg==
X-Gm-Message-State: APjAAAUkwmk4345Aa6QayMwuBFE2CxGNxJoTcM0m+jsfZISjTJixCeqV
	/GY3o0CIcW7vmvg0Y9rqpAkp/DdqTJDQRQ==
X-Google-Smtp-Source: APXvYqyFyFD+iPFJSxqTq5fm9iP0QHX8XGsJix/dzYmcckhQ3XSP8vNau7yXvEJZMgSGx8GtyzQb7A==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr11687219pgf.340.1568930441201;
        Thu, 19 Sep 2019 15:00:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id j126sm17817200pfb.186.2019.09.19.15.00.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 15:00:40 -0700 (PDT)
Subject: Re: [PATCH v2 08/16] tests/tcg: re-enable linux-test for ppc64abi32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <994706a0-9aeb-c7bc-a8cc-db0ae5603343@linaro.org>
Date: Thu, 19 Sep 2019 15:00:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: X2Z6w97IA00P

On 9/19/19 10:10 AM, Alex Bennée wrote:
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 6c4a471aeae..e8a1a1495fc 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -54,6 +54,7 @@ fi
>  : ${cross_cc_cflags_ppc="-m32"}
>  : ${cross_cc_ppc64="powerpc-linux-gnu-gcc"}
>  : ${cross_cc_cflags_ppc64="-m64"}
> +: ${cross_cc_cflags_ppc64abi32="-mcpu=power8"}

I don't see why this is required.  Indeed, ppc64abi32 was much more common when
G4 was the hot cpu of the day.


r~
