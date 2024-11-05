Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2823018njc;
        Tue, 5 Nov 2024 05:32:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUE6v4K4oV7mJHgNM7D3vHxhTsZH9CGEuqI8lmH+JfBJG1ZV5j8VrA2ZFcn/tDLbc4Ilx27W5fsjWb6Ng==@linaro.org
X-Google-Smtp-Source: AGHT+IEkxli9k9tk4P/uSx+lQtr6vjZNS/HiJ3L5Oyj/X0B7d43/DYE12P7pXiVUie+1Sug/6wuc
X-Received: by 2002:a05:622a:188a:b0:461:6bb8:22b2 with SMTP id d75a77b69052e-462ad3384bemr295485301cf.29.1730813559236;
        Tue, 05 Nov 2024 05:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813559; cv=none;
        d=google.com; s=arc-20240605;
        b=QUbszvGtnlC+XoRtr5pr6P0HApd+wVyYRxsQg3COmo4PCaOo/+IhvGU5LtRB3niMHe
         Yvsb0pZuM6JtPOZdoWCnF1hVvPsF3JYEZV5mcImd/y3uJEc/dBiDuF9z8HPY3Glm25vm
         LnVoDbUSSqasf6+71Q3L6nlwcj4VsTy1xWo8+nep0z3KZ+wvIeevfpuCiDghbve1rdIw
         4ZavR6cGmJSwUPrh611nelCzpWqSCxFfjYHA5EODX4b5W4CMlYkVuzPlNP63rEHsAI4R
         sQoXHvwrWZ0e93pbktopTRo6DRA764zDKO3RXRoSpVNjHlcmeZMERzHzE2YBuvbZOy4P
         WvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sL/q0ySFiqdKdwWl7IvNX/vct6C8s8NYR7Y2ZsZELkg=;
        fh=hnY7RFLGVLfRaOt11T3Y75waSqxZUvRT/utlQ/edBrg=;
        b=AxIZGlFs1wkCgFilrKWdCryqfSf0SqwibsbmG52JbAcwyaOT2o75YkSJMz1JPAWJ0b
         NT1277zR36PVQiaAdaYCVPkSR/1h/0F1CPT7w57MWY3n1V+VNlSdUxaqRkRCcEuWTn7H
         tfzmiTp72ROEbFmZjFIVo/xYkyPnmu13JbHFYpNtXlDj9zTanxfhcZGCS1YiNU3Aa4JW
         ELzPTuvcWTyGmRLI6uwteAbKVUNAWb6a7k8HPBEpcuLqcnAgFuvbge3/lCMf64BC3LLW
         nR7FLe6oDdRu8ak9w2es7d0PpUddEp4kJwWW0dYzmj9+0i67Ym5l1BhyUZjInavbZmuj
         Ykfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IyMdzcGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b43b6si132000571cf.79.2024.11.05.05.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IyMdzcGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jfg-0003Ij-NF; Tue, 05 Nov 2024 08:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JfW-0003B1-Uw
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:32:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JfU-0007Rw-Qr
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:32:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so3965326f8f.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730813542; x=1731418342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sL/q0ySFiqdKdwWl7IvNX/vct6C8s8NYR7Y2ZsZELkg=;
 b=IyMdzcGwW0BshrVFVaQ0cs72L8rpBKz/oKzGU1CXVt60Lem94ozeoxp0RS7koVoa7/
 YxbV9jNE39WPEj1OOfB0UZ3Dt9NombNdbTNbF+VM1SXfM545yWrdAUIbT7sfhmWL2GS7
 4iNTsIMfBbFznvaTgI033iKN6JHtAC3EpL4Dzow5FfRgp5o3APvCno7PW/rRMP8zeoV5
 xcZaqt5oJpI5j1JjZ5M5DwboW6GK2tk4SDqQ/6BIVnktTMRvU348hatI8pOFuPIQ3bVD
 ssL0444Gv18VW9z5fycawQor2CQAB8UtXzrTNClTaf7IIsddNSVScdDdUMyilLLxMT0i
 eQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730813542; x=1731418342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sL/q0ySFiqdKdwWl7IvNX/vct6C8s8NYR7Y2ZsZELkg=;
 b=ZEZgj++C1RjJmgYWugNrEbuIsWPEv9piHPz0HICMkTawYLST9zGdE953mdBXaGQ7Tz
 2IvN6kmTs2jWIdHpEGqpDmTFIAw0EkUu1UPKMaVT7eVIBs0DF8IXJNtKDJIMhvjr5low
 MtH2CzvWTPpMnxih5NMK+dDWr4hb7+tZvFGZOlZzsWWq0gB8MzbomAKIxOcmHRpR4AWJ
 UwKuc6KEfXVXJvjNx8PQQ5KM8psLaaaR2kNFFH5YuMZNKgSW66NiCcUPoqe4msB5exN/
 S7/590Ehfvyt9vsTV8ddm5unY8RCDrdTPDMltkAZvHeoWwmDpANISa/FrsSX6eZEwU/G
 ZBfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZfMrebljOO8hKGHNA0S1/NpPleZ1OFHTxur6tmn2z2hB73W0NGvP2Nh0R90Idsuk+EKbcKp5gdg==@nongnu.org
X-Gm-Message-State: AOJu0YxL+iZGl6WvorLYZ0GULp//+0IDAjvkTXgC1BNd7g1KDL5n1STo
 /3yGmP1TEt4a/st1Mwj2t6ANanRa+hSVj9M2cxZ6OZISvxrYy2iSri5/veF9oY4=
X-Received: by 2002:a5d:6d84:0:b0:37d:5129:f45e with SMTP id
 ffacd0b85a97d-381be7c8137mr17810500f8f.20.1730813542076; 
 Tue, 05 Nov 2024 05:32:22 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7387sm16135325f8f.51.2024.11.05.05.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:32:21 -0800 (PST)
Message-ID: <a9c34a40-3f51-4496-95f1-d5d5237317c4@linaro.org>
Date: Tue, 5 Nov 2024 13:32:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] target/microblaze: Set MO_TE once in do_load() /
 do_store()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3SztIdgRRQXn

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> All callers of do_load() / do_store() set MO_TE flag.
> Set it once in the callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/microblaze/translate.c | 36 +++++++++++++++++++----------------
>   1 file changed, 20 insertions(+), 16 deletions(-)

I think you could have squashed this with the previous,
but either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
