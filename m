Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp996219wru;
        Wed, 3 Jul 2019 09:28:14 -0700 (PDT)
X-Received: by 2002:adf:afde:: with SMTP id y30mr29584681wrd.197.1562171294252;
        Wed, 03 Jul 2019 09:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562171294; cv=none;
        d=google.com; s=arc-20160816;
        b=KZwJzIf7n9X/DbRaheOxdWRgzSu7Z4wotkBADeTo2pmLzHtBCg65PKFdbpfH4n6pDZ
         05WbLxTEllTrDAGrxluncD2vvEcOToBJ0HicvD1W/p79SsgzreO8nDJZBYgBwhLrhUrM
         B0RSbK8tn+WvZhT6nfAfPU+bKPMk6Kie1/9QGNloaCl21IqRSZO8tV9raDhMlRF2Tjoj
         ZsbhQg807BppSCcGyyTKAq+js9AbFkreo4IRH/+oBv5Qv2kvWrMWYHVP/BewlElRDrEY
         YzcEUOfYGJ4J+7TErU3+muH01+5bCnN9XfU+TmyUacn9DE9GTr0+cA1KlSid/OPbS+Ze
         99SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=NMSVpAVvmecmbttQ3iXVWbkVTXIlxDa/eRG3CDeCvs0=;
        b=UnwDOA9vCPdEzFPiKXrENJyFb4hl1Gt6NxRxI/nVz+bROq33gEGt4PJhH7DKWUJ9iw
         xeFltK/GdBAqhQiS9Dd8sspVVAK1vOVN478stcw+ZmqYg+baAN89Nk7iiOYcxaRZqtcd
         x909w2EoaCMbiWvntgH9P7u4nnJCgmzzehGgKtMBwRq0v15lffAPtJ6808VTzRxkvr8M
         2pebtugnABolELPBnbfc0/ILT3J7rW7pca0659zylBWecWLtbRyreD7d3i4jGV7cjq2E
         rYEzMdNQ8JCJihpB1Xyxp4Ss0vtOcvpcNVQlAPLIHHCzMjCmdfLVHJDFwN7ycgEbGk1c
         dbMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6eIJ125;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e9sor2407536wrx.37.2019.07.03.09.28.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jul 2019 09:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6eIJ125;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NMSVpAVvmecmbttQ3iXVWbkVTXIlxDa/eRG3CDeCvs0=;
        b=T6eIJ1252fD2W0N6r1d3uLftqkJyWFxDeIFCENZCpbgjOH8XYE4S8FN9W7MIvckDBa
         gL0kOHaCDeV+rpY/rsS/A996bLK6tvZohyolC1CE7GHrmtxYUS3w8CaFG3vg3vbN5Dht
         frSeMSYHl/u7qljafdeWjWyufOdHjIsZ3MSoeXkCTnZcf6j+fFqQ5+HcEG3Vst6OU+vR
         42AXwCfGmYtxHm0F8zF8b7luamj8Ph+J1+CMlK5dorZSnEC02goNKJN4Rwnk5FlEeB5L
         qwJML7N4lCty43Dva+SGA3FmFVM/r27HHWhkKYPVM3+IrxSg9CedvFVpw4xKGFgM7NtJ
         Jx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NMSVpAVvmecmbttQ3iXVWbkVTXIlxDa/eRG3CDeCvs0=;
        b=OIdOI/2y7k4c0GaMO2mP0c+4qxKcrYZZfR502sQGqYYgMUi+P2gsXifKI6LKkyKcAk
         z8V8vr6/g8qcD7/C6FTFeysf7b+Ec78vu1R23PS3UwiZ6SEnkf+R6Ls3Up3uIELksxzF
         4BotUzhsZpl7WV9wrk4gs6reoCgU/hC0reheHQGm9ZGbVYnRLvKuHa8J0FRpKlroxA3h
         zu9oZi4COt2MTyMd9UakslpJ3K+SG4q82K7AP962qICc6Px5VEj/qwZoXAjKNXKtA8WO
         Kg/iKctRcGROUvX00almvAazH1+Whz9ZjLZNLv2sD0IfmTAcWZoNiQVlhEIlODuwvcpk
         Eq4Q==
X-Gm-Message-State: APjAAAU4y0xT/UjbKA1wVe15wx28ri/pYVDoat03hDtBf3i++rajTE3v
	t05gqdaO0Zh50ct/X1NnnKDlupL6qm8V/1FA
X-Google-Smtp-Source: APXvYqwLuYNFj/5+ZL+cGbt1JR1uregIQbOuvEUmGSDoW1xn/cJDTS8oyJu5jv2ufkGEvQ67LhTgEA==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr29945317wrn.94.1562171293901;
        Wed, 03 Jul 2019 09:28:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id x6sm3624372wru.0.2019.07.03.09.28.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:28:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 2/4] target/arm: handle A-profile T32
 semihosting at translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0f413085-d9b1-e77b-53a1-bed5ed10de33@linaro.org>
Date: Wed, 3 Jul 2019 18:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703155244.28166-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DsH2K/J+Povy

On 7/3/19 5:52 PM, Alex Bennée wrote:
> As for the other semihosting calls we can resolve this at translate
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
