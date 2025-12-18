Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0B8D68BCB
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 07:21:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vW8KL-0004Rc-Hr; Thu, 18 Dec 2025 02:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vW8KI-0004QU-HG
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 02:21:31 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vW8KC-0000g3-VR
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 02:21:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso7300155e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 23:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766042477; x=1766647277; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qhPtL6mWD46YpRWj2QUnOitontT9eIS8uePBWx3AnKQ=;
 b=T2/6BZVtmkzbPJjLLvXeF+90MLL+g1h7Y/HGM3viT4Yd8sXtOp2K80aoffnEe1HDpT
 1l17TcDpBJO4I2TAq9OQAXgBTIH5TLezCm7U+KZIfyAlmjjGANd8YSZEsMJESYbG5O2L
 UDyPu64KDBjhU/E5l7LykWrr6Ntq8CBwCVfFAPojb7mYI0lGL22ZYGHpfGff91HfkCbW
 P9H6IiWhNovLh5cX2HkN2AkQwYPZrqU6JrQPGdH48IC/LRwTF8GOoU1aMqd5+wyRe387
 Vqg8cOsbHeKm/KTgD/x81/MDdA1ybiZ6N3/yrHnjjvN2pRlBm5k8Q7VKnyIkKRAdmZNM
 Hbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766042477; x=1766647277;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qhPtL6mWD46YpRWj2QUnOitontT9eIS8uePBWx3AnKQ=;
 b=GmlPYgDcQqcotFP1Yjr642J3hH2oi5NnLdlSo9uwu9agqgA8exhR2+0WmckHkt1uU/
 0L4Vcuha3fmCHKN1LVRdWm2/sD16XGFU1UJENlNlLiwY0bgmWVhfm3rKvp/HUfrmj6xu
 FYaaSJKz4XTRjKeUlaDNf7ZCvCC4JVKnIxMrlnuFw1msHKGRoAf4bkQBOEJq7YDmI2F2
 vvogGnVevp7/s/Wr6SSJp+JfxS5EcEef3lPhZ/ueRsU1l89MGnP/L8QTQPrGHLArNlZY
 8HLAT63byA42bqAFMDzqEdIPIrN4uwWep9gxj1ZyjF4kAAz3g6SUmQZAN8ZqpyE0yaUV
 V3Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+fsRFrHXqJJIiK7DYAXHkxf7ygjld8PoY774sUT9wtOQeJum2R19018/NAEh6u82XJjknB2GAQ==@nongnu.org
X-Gm-Message-State: AOJu0YyNDTRO+4DvXDdOrfqKioRIX1JZYzaQNRLTHgYdXTCeUE4H7rXV
 /mtUSkWN7hWKreW9fB8V6Ae421E0ZNDLt57p+HHqkdDYGmdGH7s5wZeEhMVe0xMxw50=
X-Gm-Gg: AY/fxX6baHwrKnb/MWzcNLsPoKjGR4upgtv/cN5Tk4rL9E9SAfY2iZR1dHExh1o5tNN
 Hl0dvdVAWnswf8fPXZ8T3f8BJeeobNv+Rb7q3pRfzJaVEWlZl30lMrkTMbuJzczhoR04Qf7NVUG
 6gAjTRVFNSwcYhyrk+pVHbF5GmrlbkMNfFbqug633xN5n+efwXvcxuqgHXg22O4yeszmy0DDi6p
 JsvFaYPFPB6QLXSeqmTII0i4AWYZqQOSWS/00rMv/xVcNAw0wckCv048XXGww/y4zgbSG8F1Mpv
 wto9vHsj2eklpAODwNLUwEDBLWqyerLcEVPIuRAXsfCPG8vXytbBHZxdbfhJ1m8c3LsJ0B0Ynun
 eENxZSdZ4eB53rGncZV96G+lR333ZpJoTHQsayqlps3+HE4BIBIX+HksmRMCUHoqwV+ClPiUkx2
 +mW1quB8refnOp6bksq7sURNLOAMMi8TP1kffq8Jc0yzMkvxewwOC6/A==
X-Google-Smtp-Source: AGHT+IHrBx8fAiGzOZII/og4QklIF+tmj+QjHx2e/H5qUfD0/2CBiuq4fwqftCORFOAh4hj6BSjjFA==
X-Received: by 2002:a05:600c:4d98:b0:475:d7fd:5c59 with SMTP id
 5b1f17b1804b1-47be29f362amr12885225e9.16.1766042477420; 
 Wed, 17 Dec 2025 23:21:17 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3b3a80dsm8382055e9.7.2025.12.17.23.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 23:21:16 -0800 (PST)
Message-ID: <cb5eca6e-23c1-4134-9145-7030bc10b649@linaro.org>
Date: Thu, 18 Dec 2025 08:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/arm: Add a _MAX sentinel to ARMASIdx enum
Content-Language: en-US
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20251217212018.93320-1-gustavo.romero@linaro.org>
 <20251217212018.93320-3-gustavo.romero@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251217212018.93320-3-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

Hi Gustavo,

On 17/12/25 22:20, Gustavo Romero wrote:
> Add a sentinel to the ARMASIdx enum so it can be used when the total
> number of address spaces is required.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   target/arm/cpu.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39f2b2e54d..00f5af0fcd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
>       ARMASIdx_S = 1,
>       ARMASIdx_TagNS = 2,
>       ARMASIdx_TagS = 3,
> +    ARMASIdx_MAX

The problem with including this in the enum is this confuses static
analyzers:

warning: enumeration value 'ARMASIdx_MAX' not handled in switch [-Wswitch]

To avoid that we /define/ it manually instead:

#define ARMASIdx_MAX 4

>   } ARMASIdx;

Usually the definition is within the enum declaration, and we name
it ${enum}_COUNT:

     typedef enum ARMASIdx {
         ARMASIdx_NS = 0,
         ARMASIdx_S = 1,
         ARMASIdx_TagNS = 2,
         ARMASIdx_TagS = 3,
     #define ARMASIdx_COUNT 4
     } ARMASIdx;

Unfortunately this didn't work well with QAPI, so we could never enable
-Wswitch globally:
https://lore.kernel.org/qemu-devel/20230315112811.22355-1-philmd@linaro.org/

Today I'm not sure what is the best style anymore, so just take
my comments are historical 2 cents.

Regards,

Phil.


