Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp930413ejm;
        Fri, 28 Apr 2023 00:45:55 -0700 (PDT)
X-Received: by 2002:a17:907:3203:b0:930:e9ee:c474 with SMTP id xg3-20020a170907320300b00930e9eec474mr4303445ejb.54.1682667955537;
        Fri, 28 Apr 2023 00:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682667955; cv=none;
        d=google.com; s=arc-20160816;
        b=otKarZTF6/aEjlDcu8QnhU3yQr9i46bUL6u+IsjsXASx75ShOcsvLgjm1ZgTpyXnSw
         NiC5HFNTEGC3bAM/xADNHLDkHEtCuOxF+d5TcndAlMut1R2YHNU2PCfYsJq63QQtj4xC
         +vaXrXiLasnbJ9E+jv2Eudxelei1HpZpz1eMb+3eb81fbnxBjuH37LA4ReakBzkWP05f
         3d7ekNLj4zAnIz5EXCsdija/8/vhH+SZ/u6kxKG1KWW8JVfYDvtoJMm9VaZ527qKN6bX
         CT6T9GAVOWUxjbcGwj620IwAsx7znV/C7dc7+g024+Pyc33Z/m1VfoLacdHAALur2/MG
         BEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9+3Y/1h9lEs1HleW94zteSaZCO8L6luldy64B9AYTpM=;
        b=EpKXx5KcyTIEZddkTeg1l0xlkYJoAtYP0CjrW/BN4sScGqx3QRQApvYdp2EdKAua7k
         W6QP7RWiNvVuz+A3Ef4YIx7a43ul8qeaG90QWNb31NNNqyXaYAFRuMiGEsQQT6yS7w5z
         +gRojJXlAvUcrmhcMIf7PGVo/tX+VffBUGBVjvpUniUTxcuOTjsLRu/G003jqu8451WD
         mFxuJEQJ9UfCTt2UCu4rOwf1VvSFNgtIlMPo8bUuxhisXobWUq42UbLDZSVTXK4unuDK
         6Qry/ZyFVsWnxOQZiAq7eaw6nQ7pMF6iMsw4VfwZxGny/Wl9rOb2KsqhBYKQ6D0sQZIR
         5Ohw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=byDizdON;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kv19-20020a17090778d300b0095393d34f31sor11336827ejc.46.2023.04.28.00.45.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 00:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=byDizdON;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682667955; x=1685259955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+3Y/1h9lEs1HleW94zteSaZCO8L6luldy64B9AYTpM=;
        b=byDizdONfpo3dmZy/geATRaH7m6rumXCCS+989aN4pK5TO9I1o3Tzf317syL+FMees
         OXaDqIjoK+ARptNWt0LFJ2o2inaoTb0w/xq/D5Be6fP/XqjySOVb2tB1XjK4QlNre2eW
         Gk/rpIKrOLLBgk1uMojGBBWSGPzJ0qKrpfX4qOdCyp/PE/tnqTmAuKqcSWErF+Y74gGz
         BIxkowcAsT+zRa0tuNfJVlzhSGRlG7hzGuIpep1+IxQiQBXbBC+HoCiuklwmhLFRNSB+
         2tzyq5Obq5d3AxdQ6CAZXMZME/oOGnTjBTwHJLPpDTfujQ0IB/LhuuRgTX8lJT9Fy9jI
         kndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682667955; x=1685259955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3Y/1h9lEs1HleW94zteSaZCO8L6luldy64B9AYTpM=;
        b=iIM6aINzDcb2c2Q+VdJ41byQG0V+Hs29czTDiY8ZzSxJQfAZJTPqOcBih6xjjAYtgN
         Z/VNeuIXBQoNWTy6vOPqrmt0d2lgE8JxB0+TA/WhkENmWCIsdoxM2XtPHFmlg3LO4lm8
         pSylDpq5nplSx5UMRdXf90UTSuFAUUza8hMntXXcov+x8nHULacOM+KawL6JmJSG128c
         CI0MnKiEatgCVOuVSGWUtULC1MPGTMxFsCO74p+euNQGIhUKH8HPQTfq/aujBqcFqYMo
         O5HbA+bR70v6VuuoyMZHlWvMB3VFit5o3LR1+EBotiGUEL0AReo44vQkLrMkh060eFae
         dOYg==
X-Gm-Message-State: AC+VfDyikKiFJ1Gq5WLRyf60Ht+NBxDylhkgaEPWzvy3pcbrBvr7n459
	97e1eJa15CDRlFY8uJKgtLe4qoNH
X-Google-Smtp-Source: ACHHUZ6XhXserF5kiJqQGZNrjPILoiCfbvjAUX8kEOmR9ovwxbvvcN02Ik+SYowW0QRSmkgHDEAoMQ==
X-Received: by 2002:a17:906:ef0d:b0:959:266b:dea8 with SMTP id f13-20020a170906ef0d00b00959266bdea8mr3873768ejs.2.1682667955023;
        Fri, 28 Apr 2023 00:45:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id z16-20020a1709063ad000b0094f71500bfesm10732000ejd.4.2023.04.28.00.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 00:45:54 -0700 (PDT)
Message-ID: <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
Date: Fri, 28 Apr 2023 08:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org> <87a5ytpirj.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a5ytpirj.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: KfPgftiSXRTg

On 4/27/23 14:16, Fabiano Rosas wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 4/26/23 19:00, Fabiano Rosas wrote:
>>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
>>> query-cpu-model-expansion test to check against the cortex-a7, which
>>> is already under CONFIG_TCG. That allows the next patch to contain
>>> only code movement.
>>>
>>> While here add comments clarifying what we're testing.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>> Suggested-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>>> ---
>>>    tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>>>    1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> I don't see why you're changing the cpu model here.
>> Neither cpu will work, of course, but why change?
>>
> 
> Because there's already a patch in master that puts the cortex-a7 under
> CONFIG_TCG, so I can have the whole if/else in this patch.
> 
> If I keep the cortex-a15, this change needs to go into the next patch
> ("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
> which was supposed to be only code movement.

Well, I still think the change to a7 is wrong.
If the two patches need to be merged to break bisection,
then so be it -- just mention that fact in the commit message.

Peter, do you agree?


r~
