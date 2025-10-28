Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6957DCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:34:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhxb-0005pm-G9; Tue, 28 Oct 2025 07:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDhxZ-0005pe-Qc
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:33:53 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDhxW-0004Mp-AJ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:33:53 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b6d4e44c54aso1018435366b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761651225; x=1762256025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oqywvgzht8w+QYLBZHYhDDhSx7n3vcr9BzmjlX4F8Wk=;
 b=YXZTUnZD85ok7amHaCPkCee6NAGyli8hfHTXjrioXxOgHXESgUs/p+KuNy0mN7FsXd
 C0AbPdeWLASGL4RtL2ZkmIk9jaPRueQJLux1unRlctAJg7f2C4oWmLiB1m9Okr6tsd09
 cTdTa4LBfnAgtmjYBwX2Ve/GlD5Wx8fkznmiZKuXUci6fO+p2iNx3jGHMwuzWRB5ptQi
 TflR9k5tQdu0W1xVVi9owWNBPigauZdWV6GoC5YLVMVnQSlGmM81PIcrOYKn1HTdGeCN
 fYQb9a3huAVj4UkgK+0aCiMqbejRkIDz/DskFxgiGx+TysQ+0+1OTudixRq1KOvVZoMZ
 +iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761651225; x=1762256025;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oqywvgzht8w+QYLBZHYhDDhSx7n3vcr9BzmjlX4F8Wk=;
 b=XF/iC3FrSc81zcZCIy9f8tOipTlat6S3hXfLk6DbB7Flva+BrkzG+3picWoLbAmjUJ
 oZzRADXPvOaNDG1Fa7y+3uXXjE1VTQ+lZ0bm7WIE8AxF4jQruJD/OwKiQZNqpUUPQq9E
 tMFi+ofztoWrKhJ2Y6lB7BlS5lAglEXJGaU/tKgyi5o6NDsMUe20A9Ew9GUqs5TOg5bx
 QHb9zZ2wVHrhFB+R+SmEnDMmqcBk7koKU8IAKIgSHVTh34ORf6JHKlU8QqAk5zz2d/Rn
 nAqm9MPDKL23q6lQ6bPupt39JFHUKl9WS//eORuxQE7pEa+unLqfGQKDTtn00c3cjjI0
 1I8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuIpQYulfdl+opryV9EIeSneaWEept6KESn0q3sNhZjSV7TWaPmVOSlkP2mBQFcqzR1s1udauJw==@nongnu.org
X-Gm-Message-State: AOJu0YwU4bUa4FvGQciRWkWCwroOr6FC2qwtZux/6IavERZ1C+c2C1eX
 VzaAwPrmNHNHCJB7ATSNe9cjP4pxYF+mw1arnCqfoCnZSJlo8mSck0XyuMnH0c1Qbm8=
X-Gm-Gg: ASbGnctHyjuJnW5ezyV0dLA8Cwq3+ixRqRi5e4/qbrU/mCOg7TtWZy07J3S+hV5hMPo
 6g9yLQRKcpAH53UfJ2KrBU2fPUjVYWolg719kssr/DoPZRj6zyGLegzxvm2k7xCOEAUb3XlH7OK
 EgM0++U/yJzwrtn/CB7zbD7w+Nn+muKme8C9wnPSCZnN7trxbnhpAQUWwthUdGPG3S9iJ/OwcAU
 rNeHOjdy5gSifkiGVOszclXCKBO5yYYpW7ZsWEGQZPKg9i2lPZE5eKiabUnV0XE9+keDgNotu1M
 4YM+qsp7DfJJVOKUR3EfdUqIwJpGTDeZvIjZdf8SEyFL58GJOTbk562o1g00tU63GlEDiZ7g4rM
 6qtgrzgaQYPTt2D/r5JWInpHD+jT0UsGfPz4lOsSICyqXqhJzb2rZ8SfRIoCpTsPkSlrQm0UddZ
 JBtKCYiHYj5pdjV3JN
X-Google-Smtp-Source: AGHT+IFMoRg1/y3PZv2+uRaFlAvgg4YnbPPx2lLpiafEXjau4rq+KbbGtpDpF/AvigWc+kF0KMtaaQ==
X-Received: by 2002:a17:907:2da2:b0:b6d:7859:61eb with SMTP id
 a640c23a62f3a-b6dba4a2ec5mr312011366b.29.1761651225369; 
 Tue, 28 Oct 2025 04:33:45 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85369675sm1073348866b.28.2025.10.28.04.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:33:44 -0700 (PDT)
Message-ID: <434ca97e-7a77-46fe-b6f5-2be5e9387743@linaro.org>
Date: Tue, 28 Oct 2025 12:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/59] target/arm/hvf: Simplify
 hvf_arm_get_host_cpu_features()
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
 <20251028054238.14949-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
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

On 10/28/25 06:41, Philippe Mathieu-Daudé wrote:
> Use index in the structure, dereference &host_isar.idregs[] once.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

