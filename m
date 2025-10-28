Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F41CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 12:10:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiWX-0003JZ-OV; Tue, 28 Oct 2025 08:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiWR-0003CE-93
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:09:59 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiWM-0001Rc-Rq
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:09:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b6d5e04e0d3so183457566b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761653386; x=1762258186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7hSbiGQ8zB1GdCfwOxii0U9V40aj1PzEYLIaXABMmU=;
 b=xG7EFdMm42RB4dOkYN+UGet/naI1V+Mg5iV5Ft13qH70a3h8ZTKjKwkOHcW1MMVFPm
 eooFye6HRlC6p0ac8fT44OLOlBTBkwHNNueT0sKuci9yNpZ2LsNfAyewJh1aAgkDi5dz
 6xtjfg4YMirkYKlRXTKgKx+dKmCtYomdsc1bjW27KyxlYFSn6vW+ci5dP946hTiulfpa
 ENLildI7IPh11JDv8mdSgpEBKO7YQNF3goiHqPbOsYN1Ln6veiPMMGZj33olmn6i9WT0
 trWYkuQuTuDG+TJlSe49MGYQSFGPEH2s43BtZgjbVtDVh/cRq8LCfsGmDBA0ocBN+mSS
 i2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761653386; x=1762258186;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U7hSbiGQ8zB1GdCfwOxii0U9V40aj1PzEYLIaXABMmU=;
 b=HE7IG7yXOeHEbk4p71ZzXKtp7L8o6p9nYCdgjVXm9v8MNt1+Uj/SXIYvHTZCMdSD5r
 YxdQRlfRWO557VxxoVwhtvTRsN0S6DHl3k9NgC67jp9bOFzQ8yDKn+XvdU3NJKw6TVuG
 UeNQWRmcfHOQDundrx4ffy9u8PPRB5cnwWeEzHWzlnbqhUC7P4sF1SO6cr2os7i/VdV9
 ynsxVLl6W2HG9vXLqarISgmxtvsvlBS4bCSxjtNuF56tIf+yi6H1tJRYbuZBL2kwiet6
 frsbCEiCgm6t/vGz4OqNIyzwdT+hLgY5vlTZKzq+i6i598OcKN9TIrlgAXdE2zdC8uDS
 V9cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjaAEf7NGJXPDBHvQRxQWwYiZf18J2X21bk8Mb6JPyYP0NUu2YL5oHtOs4+mMA6de3//YKN/0S0w==@nongnu.org
X-Gm-Message-State: AOJu0YynnaKylYoO2NpcKt85utopsqDmuiDN/SbKXo9ckOqzvwy8TSmq
 AOT/Co42rVu2nPN1Vw4uO+zooejxwqTMqaP6brEyPIZ92V/IoKrspNyvDBC5E0p3ju0=
X-Gm-Gg: ASbGncv+HqTeTHnsQ4whBfZhNa0Nuuj3Twb5rACusDa3GX7uO85T+/DutLyw8sBlw6B
 sRTqLye0mnsODmlS2UU4lfmx1uOShhpBekLTdH4zh5NbCvN632Lw4Nyz3173WWJvHXiVu6cp7KN
 jAfrQsqOKDL2/7zLftJ9MDyUDpGHL79wgRIUHI4ETUI/OoYtX1ZalRVuSq5vES/eQTRbwtH03DS
 wbJwrvBwim+WhaxauKkXLpEUU6X9vZ0ISYk0Dj7vFOMGBndVS/obe7Cje4q1HQhga2O6OBWh1pG
 7rxfnncjDKYyY6s3fd8MZhouE/Nn/ul1+9Hin3dTDu8egLyH2QUISexmfSOasJehEM3T9Ugyjxj
 CmhUvlnzmhWD2TzeeR4xKObTmHjBe2yKhRwtQ7NIKaskudGN6WH4ZH4T8YrM0K+jyOWuzbTEZL7
 g2EtxF2Bh9RZAzyCpd
X-Google-Smtp-Source: AGHT+IHWn0A8Qduac6I8HNJQufIm69Ue/9eUk/DmXtF9Elho6XY5jTsErg1XzPj0xHtlukYQ+Bdu2g==
X-Received: by 2002:a17:907:3d0f:b0:b6d:7db1:49aa with SMTP id
 a640c23a62f3a-b6dba65b0dbmr361748566b.63.1761653386348; 
 Tue, 28 Oct 2025 05:09:46 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d854550f2sm1064231766b.70.2025.10.28.05.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 05:09:46 -0700 (PDT)
Message-ID: <57042456-f65a-40e6-a5ff-bb0e5fbb93e6@linaro.org>
Date: Tue, 28 Oct 2025 13:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 53/59] target/i386/hvf: Flush vCPU registers once
 before vcpu_exec() loop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-54-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-54-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/hvf/hvf.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

