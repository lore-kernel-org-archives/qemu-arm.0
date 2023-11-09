Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp466420ejq;
        Thu, 9 Nov 2023 05:20:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzoJ2bAPlXvNBWe/EzBrPSL5LeSvqRl5XDBIOZ2NYsqx2apGU7lS/nsRNG+9clvVjBHP2R
X-Received: by 2002:a2e:8188:0:b0:2c5:ab3b:d676 with SMTP id e8-20020a2e8188000000b002c5ab3bd676mr4701613ljg.9.1699536015206;
        Thu, 09 Nov 2023 05:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699536015; cv=none;
        d=google.com; s=arc-20160816;
        b=FwO5usDyN5b3BTp0Yq5HojC42fYbeeh+Se/+nRnDWW5QzshtdR0ky3QI27D8Yeqxmc
         lEzqMFTmFXNROrlS5K3nyxDvQE1KjygRz5LzsaCeDgvIr0KmFiYZBRXeFoBoDYGkKrHV
         pDUa0Haxb3HXB/U49buFzhO+myuFdg9VmSs5NafRooIaDXY0+iKR1nj4Z7XmCw5Tjo9r
         s9ENWCuxv+ltFpuecsdXfCsabf78/dEUBR5DFZT8SS9EdI+iqBWZQHyylK71pZJ0br4A
         ABa0GWVAhixb5L0beyWNdqXBa4uAr75lX2vLc+nKO9Ct6G39XIXadpPivaEL4v0fJwVH
         ULQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=hLPNTRBKFwWe24xSQ6PwWwx2+nEmdCDA1sGrFP2oGXs=;
        fh=C3P/r0wZB7xdX8a/rhHioSI7ZA9ymlg6laWDblvi2Os=;
        b=DWtPmfHLrXqRqE6lLbHF9nXFL6VgfCG/iQHsCQHMqtnvvF43GljsdTRDp4vMyvbt2w
         44d4IVEsWAE96GwnHNXDfRR6tAyt+LwUe/COb36BuaEp63TdPgtbOZ66Ef6IDbPglT96
         eeUCh5BEmJVpaCGInjLtZOKHFRQaKOXVb4nVZjawqF7t/d5iljD4BON5UZYgZJA/XOU8
         5EkRGoCLTziA/TW0Qvyz2RvltxdNV+8oHoyNlKvBW73/g0h4OrmTuJPRm4e7Mw/cJdc2
         eO4dO+0068CBkjr9WgLJwkyw0TSB0zy5J3s3LiK7gymjCE36oB0G3hWw/N5Xbh59l7la
         c45g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id q124-20020a2e2a82000000b002c6f4d69de9si5396386ljq.13.2023.11.09.05.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 05:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0FEAE31ADF;
	Thu,  9 Nov 2023 16:20:22 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id DD58034484;
	Thu,  9 Nov 2023 16:20:13 +0300 (MSK)
Message-ID: <f7f5288a-c2dd-4831-8bac-31286f53f394@tls.msk.ru>
Date: Thu, 9 Nov 2023 16:20:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20231031143215.29764-1-richard.henderson@linaro.org>
 <874jhv86a4.fsf@draig.linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <874jhv86a4.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YbbqsxDJxohu

09.11.2023 15:23, Alex Bennée:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The previous change missed updating one of the increments and
>> one of the MemOps.  Add a test case for all vector lengths.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This was Cd'd for stable but didn't make it in. There is a trivial
> re-base conflict but I can re-send the patch if that helps.

Nope, I picked it up, here:

  https://gitlab.com/mjt0k/qemu/-/commits/staging-8.1/?ref_type=heads

commit eabe320b, committed 5 days ago, - about the time when it has
been committed to master.

I want to send announce for the next 8.1 release, just haven't decided
when to do that, - usually there's quite a few fixes coming during the
freeze. Maybe the best is to get 8.1.3 now and 8.1.4 together with 8.2.0.

/mjt
