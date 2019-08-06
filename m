Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5366487wrv;
        Tue, 6 Aug 2019 08:04:53 -0700 (PDT)
X-Received: by 2002:a63:2c8:: with SMTP id 191mr3379958pgc.139.1565103893592;
        Tue, 06 Aug 2019 08:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565103893; cv=none;
        d=google.com; s=arc-20160816;
        b=RMIydNlHw8tUs6KhcRg9/caJQgFPxY6cijkXuyqjxINcb/PUaKXYWvw6iu5NNqExCt
         K31Me+ee14keAB16CNNc8vMufZu2mKbZ1H/xxy+BFOodyGrFGqjfwHJBe0uKS8622Ywf
         nekR2WZNHtTqfCKWhh67qtyn9Nrgv27SwBbUtxQZlLGvHyAUSK80JFj/O2GxY1IQ5Cjd
         n0y/WH+taMC7y5Wa+ry/5tcsKaGuWgmCmOxYxNcpoZ2sfmpTUxxny8D4yaKYwnYBWjY5
         lwWHMIv4vddu9KPYPj3PjYPiKw9xs1N1erQFqxve64fctqVsVljWiC9z5MM7BNdL+5rZ
         +1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=0UvgkNYT4XxnBleRsi7bo7lrrahSm8tWNJn+dEGwjUs=;
        b=GfDHRLTJQVJTyVP4w2uinohsEyl4a0UZ/38qjhkQHsD3RNavsNyvERyGMxz4qigYBX
         +DrrFFeytqZGTmuVEXEAMvuTxh6ord2ttnGy4f5/j17kzPsh6fJ5rYEOkAbIMDctr7eP
         BZsmlsuzCBTLyX3kiyGigUR9S57Pf6rRPyr31R7uDlPhvHLKlAwqVhm2i6odW7qaH6fK
         0fz9i2rDG8I2HQMRYSUc6GcLQ1K+xNNpbjp91stOZa71lVN3INHC2TMH5nDb8TS6x0/p
         Mc63oix34KrrL8NeRPYQPIkIxDdibzkNvFfyxK8FuSIORkBWx4gQ9JLhQR071Dj2qXyR
         XpvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsmGIqSt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s14sor25196463pjb.11.2019.08.06.08.04.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 08:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsmGIqSt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0UvgkNYT4XxnBleRsi7bo7lrrahSm8tWNJn+dEGwjUs=;
        b=BsmGIqStDVudsifgfrdE1GITdloX52P4jiKkg3LUxxfWdnMQX1fo9zcQoCwNl0lMxz
         Gj1uXmf7T33QwA73W5Ju6j1oEZq50kQvqsbvQCPwC5S45KUWUFkAkEzkFZ4JHnfw0UuC
         ey3GUlpTOl0uZ0IFIiwweHO3KuICTUNMdwXkveGXRAjy7G6rWccUWzbRGgnV9bPr/C9a
         QlwJWaCBJr4knbr4qiFsrAfD0qFMDjmdIfxLC72682SQt2dN7CKueAZT18My+Jt0NrTj
         LpSBLZb/DrFGRuotTLuNMn8yg5yKSmk6mIyP+m85cMTkl4MV1FKUWE/SDavy+vCikDcU
         6YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0UvgkNYT4XxnBleRsi7bo7lrrahSm8tWNJn+dEGwjUs=;
        b=TLFg3zv+vDnnH5ckIHRqGsI/XZpj+sHPQ8DeFY5XYjY7POfHOxj4gErt5XoGiJYgTR
         ZSmoRapO2FVCLLbvyZr2l721S2IH1wAiugcgb9WqvP/2WbunUXdiQz73pvA+dJVYvCPT
         CwwclW3UMdMUwFv+a2/Mb08qNaPWIKypdrVgl63stVT/uWmTcA8H0m1PK2DS3eTZPAnd
         FXzLJtaX6CmHQeBClqmwtJUw4iNn2vWMCm+EuAmxZsuJ3hHZkJcd2YYWnEJpf/Hz7Dn9
         udhjIM5VyqEUR0L0vobtZy6JRwgfDh2OBIN/TYCSSyJUabpLBZU7o4ZbLvsLQA+X9IHB
         Ebnw==
X-Gm-Message-State: APjAAAVqeZOPnm0MfXWWaDOL57tyecq9HOmXR8j5Aai9mMOIQ+CRisHm
	1y/cUDKQstEpggAoEkDsTh/PMgeV71triA==
X-Google-Smtp-Source: APXvYqyKhOiKBS1Us3ex4IuGQgF8/zyArymUfFzEZeLZj4GfpdzZROuvY8poWruB8yhtD3GF7infVg==
X-Received: by 2002:a17:90a:26e4:: with SMTP id m91mr3659576pje.93.1565103892410;
        Tue, 06 Aug 2019 08:04:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id 85sm93424647pfv.130.2019.08.06.08.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 08:04:51 -0700 (PDT)
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org>
 <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
 <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
 <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92a7e54e-678e-cf4e-fadc-373e1bd6a41b@linaro.org>
Date: Tue, 6 Aug 2019 08:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: mn/0T4c4AVCL

On 8/6/19 3:00 AM, Peter Maydell wrote:
> Renaming pc_next would be a cross-target change, so let's put that
> on the shelf for the moment. Maybe just put a TODO comment to the
> effect that we could consider renaming in future ?

I wasn't suggesting renaming the cross-target variable.

I was suggesting shuffling around the current names, and using "pc_next" for
what it sounds like -- the pc of the next insn.


r~
