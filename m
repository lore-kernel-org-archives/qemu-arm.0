Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1198C83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 21:30:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubnDv-0006uz-Le; Tue, 15 Jul 2025 17:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubnDA-0006ex-17
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:29:16 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubnD7-000405-08
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:29:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-23649faf69fso48577805ad.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752614951; x=1753219751; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6l+0C+UGbHAJtkqka30GvC5sClrPTPa6suxK3B3wEQY=;
 b=oxfiJfvWQzQQ/n5KCGOj0ht9sk19kLicY/wpw4qLRqFjuCDtadcpdXch5pBy+smbd5
 w+xjRtsSsgSyJfhFbB7Wb/9qelGe9So+pePOTZi2uF1sqaIwtll1mgpo4DI/fS3m2XKp
 mnY9LbfRANiuy9WQNTc9kADznkKW4GfS7edC0UyCIkz25Qm+Q/PK+DHpyCBeyQ1zsLTC
 nuiie71yNKwMc1YyQu01qqn8CUTOJk8fPb9VOQVFsvMXlTJjSmZ4yFIOWOgm7Jos6cIi
 tsy0LZExR2P/3ykDkhqKd8OitYWytGIbj16z+wDsMhtHFc54j5wIU3QOsiJXaACD4EYV
 mFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752614951; x=1753219751;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6l+0C+UGbHAJtkqka30GvC5sClrPTPa6suxK3B3wEQY=;
 b=GVe69w2D97BvIJHk1vUHmaOkGrZaXoibRuBRl93A/10DPZwZVmkbRbk4goheeYMqIE
 Td3Q9AmAd/aslQyyy6xn2Bdumo5GZq/Uwy25JiVuu63i6bWWooMSkRwRULBzXwOivbj9
 Xh2SOyfZ80oawXzysbvHSIk297kmKjOYizelybnDI31qOFQUaQyAkhKM7pVzqqyYmuYo
 5xEOR6EfZdbGAaypm0SYFLMuZc0lDDwnFaSB90oSiVxt9PhKiOh5Nb2T4LZcGJ0wPKY9
 T4fJff+oRI4c1FVgG8P+5K0t9qZGg/X6EY2LpblCpcZh7S11L8WaphCDQ2U+spqD/Uiv
 1fLw==
X-Gm-Message-State: AOJu0Yw9XLQeEVEXf3aracdqCscGcDsm4aGNL+oWwOJgDkTb+B2YGSAK
 3h4xGxbLot2WvYoNCxbunI6CVREVkTZ/nPjt2lAMHU3ykiyedQ/6fYn5ht/xotafltOZzrJ7fhg
 MEBTB
X-Gm-Gg: ASbGncvLwWKSNlPBNecR7fd0AJsGvn2rMJhpYLy2DHHSLELuT52XhR3G6J/sWqwZ7yN
 /bLWdANbdC02gjr3LVa8SO5hK/RNippxKW83DPQXUEpvHgc0cjNIU6bVFkbgtv3oLiNovwQ6CyS
 jo9Cmjd8QocxPl4ado1RUbHMs4TapRrxHHz5T8pkhks3QA8edxhWN3O9Pdry/74MeaJrBw5Isd0
 /Eddzx+uO8LFs89slCKldqBJFxKuqSXDzQjSmyKDU8Ede4HTbqbM8lpYLryhMW8kEwLM/Mq/EuV
 Mur+jflRlkx68+pY4Eq+3VK8detdNwNt7X1zMEfvXzi6emV/84xx/Y1eFbafM98g6jdcIDF9Vqx
 531psnV5sGz6ObUP2KICDuNf528tMpHw0iUA=
X-Google-Smtp-Source: AGHT+IGJF1xVJa/IhyK8K4jUskHC5KXi8q4c5AzZt81ORy1E+DkglG94/O6ZxJ2i9hQLBFT1wFNG6g==
X-Received: by 2002:a17:903:32d2:b0:234:909b:3dba with SMTP id
 d9443c01a7336-23e256c99b3mr4119945ad.20.1752614950974; 
 Tue, 15 Jul 2025 14:29:10 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de43228b3sm119187535ad.135.2025.07.15.14.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 14:29:10 -0700 (PDT)
Message-ID: <c2c5d91d-3531-4f60-8ffb-e47eba82eec8@linaro.org>
Date: Tue, 15 Jul 2025 14:29:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] target/arm: Add FEAT_MEC to max cpu
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org
References: <20250714155836.1514748-1-richard.henderson@linaro.org>
 <97292e35-b7f2-40ca-aed6-34ef39396433@linaro.org>
In-Reply-To: <97292e35-b7f2-40ca-aed6-34ef39396433@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/14/25 10:09 AM, Pierrick Bouvier wrote:
> On 7/14/25 8:58 AM, Richard Henderson wrote:
>> Changes for v8:
>>     - Re-order SCTLR2 and TCR2 so that they are independent of MEC.
>>     - Enable the SCTLR2 and TCR2 enable bits.
>>     - Squash 3 smaller MEC patches together.
>>
>> This still fails the RME tests, because we still need TF-A rebuilt
>> with ENABLE_FEAT_SCTLR2 and ENABLE_FEAT_TCR2.  Pierrick, since you
>> have just done such a build, could you re-test with this series?
>>
> 
> I tested that on my local Realm enabled setup and I can confirm this
> solved the issue and current series works.
> Both flags are needed in TF-A. ENABLE_FEAT_TCR2 is needed to boot host,
> and ENABLE_FEAT_SCTLR2 is needed to boot nested guest.
> 
> As I'm off today, I'll update that properly tomorrow when I have time,
> and not rush things. I'll update RME images for sbsa and virt tests +
> device passthrough test, and post associated patches.
>

Richard, patches updating tests images have been sent [1].
I tested them with and without current series.

You're welcome to merge that in current series (preferably before the 
current series, to not break bisection for concerned tests).

[1] 
https://lore.kernel.org/qemu-devel/20250715212335.2215509-1-pierrick.bouvier@linaro.org/T/#t

Regards,
Pierrick

