Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3173310njk;
        Mon, 2 Dec 2024 12:09:35 -0800 (PST)
X-Received: by 2002:a05:6a21:3997:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e0e0b9bc2bmr41864209637.46.1733170175295;
        Mon, 02 Dec 2024 12:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733170175; cv=none;
        d=google.com; s=arc-20240605;
        b=AqklQSHmakQSWSb7yge0KH6Xn1xi1TppQVOVBqyi6fB+BJW1FMcBgRxwN/tIEm3fx9
         pqmI89FjJkeBh5g1/1kf1jFm9lcWiyEzHnSikmhpeUdPuPJkTkzQdo/GGZwR/Jv1+pj6
         Dqb/zYdLvXMQAnsJMP9Pe4z731FnBjNtd/bP+g3HfAaeS2Qzh8PBJ+2gzH1bzSnbXouQ
         reo+Eg61t6108Q5lkDvtRemmgPS5A4cIlYtaSsWEJkQaz7LlyIHLEla6zFuez9q+GjbD
         +emsNL8oDJkNFuFvcW2X0gcDT3rgXSeld44uVYeBbbtv3yLeYhQag26Zy53RGob6eHh2
         dkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        fh=pXNUrq7g7KqPZrtpfddQpPQcUThKcoRDiTblbFMy2mA=;
        b=HAqSqQqg2m07FzoXrGhhEDUDuYcGU4VgNOSOXzmyV6dpbhAVuzEJTZTnHbIN+aquZt
         EWmTAPG7P/nf0JX7KqZ4WYuoCAMVlkxfKlwv+OkZhPOyzbBgIZtu8t5MMsvvuqIDJkbR
         2NQzR+Cm0JWdai281FiTQ87Tgyxkv+Txlqcxil2tlTBP5Fl5fwCbhKGkRI7/7U9ujLaq
         gq6X81mTjKDn/mkuPmzGtmWsj/ANO8Nln5936KLHnVi1KbLjIHVYkj0QrkLrFpB46nlI
         MCrQgvjPG5ag+DJe8PnIPl1OiA7t1nAyjPSj+57WqpXcanbXynikYk2bNt8FhCVGnbmY
         GxdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAHFW+Ew;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c32218asor6717716a12.4.2024.12.02.12.09.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 12:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAHFW+Ew;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733170175; x=1733774975; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        b=nAHFW+EwngdHGgIC5cignBb1EFBR2nas2RU6sHHzCaJWUN7OV4vI0W1reIuCrXkDNm
         MRrGvFZpdsTE9Rt8nC9Qb0GroAlKtSjUYlGLmAwBQxPaskswnFOTc40euuVpq8Tyx7aK
         ybvPvO55urdn7LTMhGLo6J0wfTmxpZkSt7cZHFLxown3oBX5hoKpvsAWmxFaym7i31ND
         IkvQCVzewi0UxaOvPdmgxxJ3G2IZOKTzHRuI9Oh07st33SAUmvhruHbLVsdM873tguHO
         zB9E59t5/RW3TBvNdGnyxoo/VYahAbA7IpoJyyVhlEdpkALanemLSbfeyYa4k1I1H5Dd
         1x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733170175; x=1733774975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uCaoz+owZcxrH4lSiRSvwy7ZK0/4LayKovoJZvtrTs=;
        b=Eh6AHqM/K4rSfitnrazMlQ+yeuqoDEGd1WQyESiu0kjEBkgtlKWnc2fooE8Yf2ZF4l
         fJhm6Tk6qiBUgTzTN84GzBuURFzAlLkDx8Mpa58NVoZjkWK8Clsp+4HnehqDonR4nW7t
         XivnOrA5W8kA5W+Ao7DEQGfZc/8eXQX+LUXsOrkb2RebkzLLh5fwW6Exysrm1MVhd1Sg
         ZavwezmvN7vn55hj1jMo64USFgawOYQLj+6pvb++ighjTklWi+3o2lq1N2VQG/fYSQVI
         flgpa4qwPmtIW54tgJ5El6KYTjYrbwxmGmk1uf89oqsfYVGMoithgfwGCM4BeoQypeDj
         K72g==
X-Gm-Message-State: AOJu0YyhBRdz822ZLq6U1dreGB/0Dy5/kpE5c6Bi2OVA+Yx+JstXiaE4
	4Wwon35seAbndsgjBdQX5C6oVVZdadqZxPZ5y3yA0VHTf6dqRcDgBR8vJokrMV9EKg==
X-Gm-Gg: ASbGncu4ae+eZ9NazS4Wp5KNbhpw9VvaE+0KuZ38r5PmiNqYIyaUJB5OZycD/olb3Me
	wQIgfcHsU/TbEk2RgK0agRPXcKxMIaPPcDXpq8VXePdNgyKFN2OOkzyByhHo37h39xpJbucSd6b
	J2GKtmVwF+MflvtYm27C2sq9BCY18jnrNn+XiH5Uqq0R0yuarRB7Cwmpp6Ik1ePYcyIrpWP7qyA
	/nUTtus1bUaBPO+OpdgKoHJwoQzga6zp0w8FAyGcl9aeOcBPb3tqpGskF9M4rIruHw3MdKnsuot
	EJkY4EZi3+OgFIJaV8/z0g==
X-Google-Smtp-Source: AGHT+IELy2r6StoU9KnaZdSIz5VSm335hm6epIOMbdT9KUwOypXhbZwTsHO29wV9p6nq/eski9rzEw==
X-Received: by 2002:a17:90b:350f:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2eec9b6c52bmr6940952a91.11.1733170174896;
        Mon, 02 Dec 2024 12:09:34 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee36170536sm8141802a91.28.2024.12.02.12.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 12:09:34 -0800 (PST)
Message-ID: <b16724af-0758-41b0-afdf-8a6eb138dd64@linaro.org>
Date: Mon, 2 Dec 2024 12:09:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
 <87ser6c5be.fsf@draig.linaro.org>
 <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org>
 <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 98lX36fvw5V7

On 12/2/24 11:56, Peter Maydell wrote:
> On Mon, 2 Dec 2024 at 18:36, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>> Maybe our enable-debug should produced optimized builds by default, and
>> we could have a new --enable-debug-unopt for the "I need to use a
>> debugger" use case. Would save a lot of time for devs, and in CI where
>> minutes are precious.
> 
> The whole point of --enable-debug is "I might need to use a debugger"
> (or a sanitizer, or anything else where you care about debug info).
> If you want the optimized builds, that's the default.
> 

It seems like we associate debug info to "I might need to use a 
debugger". But, it's not the only use case.
Sanitizers for example, are usable with optimizations enabled as well 
(with some caveats, as some errors might be optimized out).

I don't have anything against what --enable-debug does, but supporting 
this for tests (and CI) because people *might* use it is a mistake IMHO.
It's an opinion beyond the current series use case.

It takes more time for devs and CI to run tests with debug build, 
compared to recompile and run test suites. And we hit timeouts and lose 
minutes because of that.

> thanks
> -- PMM
