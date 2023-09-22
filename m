Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1404219ejm;
        Fri, 22 Sep 2023 08:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE99v+y5dnHa/YmW/3ZwcgLXs4F1wJGB6WsYoyPUNdlVPnYHpVgBVONfvL5J3t980PTYoMD
X-Received: by 2002:a0c:f285:0:b0:656:2696:9947 with SMTP id k5-20020a0cf285000000b0065626969947mr9236990qvl.18.1695397116304;
        Fri, 22 Sep 2023 08:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695397116; cv=none;
        d=google.com; s=arc-20160816;
        b=K9LUhk/KaGvOR7EQcbwK2+29n+7jUjd+9zkFVhkpHzbwhEwsDku1k0YILfjoBtW4bV
         5vt0eH5etB3gIoMrs6DbCZqyoplEWFum2RLIjjjj1FTeHwMcgIHvc/yumP/iMFoh8Gvt
         eVdqoJboUmKMH4e1NWtw5uUo3I3k5iA9yeKL+qCBKkqseOcEvSmhAq4Hp6E4O4pTMA0N
         fF7s5WUJ9gwwYbJA0ZTEaA/QeiiG8JiEzn5MAdCJAbvaE/GmziLvQIgVK/66xXLc9zNd
         v5rAgDX7prbx/Ob+vwcW4mfAOxMcSQy4luhN1ALP4OA27l2GkK1OZ1lcnO6rE3sDL+C7
         aYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=61Nw5qSFEFXff6TdAdTRcJZh+UlX6tbX8SbqKuCFpJM=;
        fh=vSFYUDMPKebNxmLyxRDie694dMHU8rn9DIgzC+PKU5o=;
        b=H2FTijH6DiCkVoG3inDzFKdaNKV6MtajlmU+It0n7maVY6SxhYIV1U6d9U32crKEYG
         cEy71a25DNs3LgYUvxHT/Y7XT+MSZFr2HWsnUysGZPxFuQvcXUvwEnPgAs/N62pa149w
         zvc+0DVmuyPNm3yYos7IMfBNfxRPpKbZqGzJEgZ7hb/U6s3vQbOi4+4EuK6RomSklxON
         O3fheFb49z36euwRhTq1hlK4N5JG5Qm1lWpA6Af9iyjFky6wx6Oyg7plD1/l0oQB87Ue
         0MXBED0tQnR5aXOVxaSeI1y7SrnPpK8ecCr0bb7xKpZnESO0k5/S5ppd8i+TCC21nPLP
         kqDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHtMp4U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a0ceed3000000b006516d026f39si2397235qvs.532.2023.09.22.08.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHtMp4U6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjiEi-0005a9-9F; Fri, 22 Sep 2023 11:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiEg-0005Xs-AJ
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjiEe-0001ll-QG
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:38:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32155a45957so2243810f8f.0
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 08:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695397107; x=1696001907; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=61Nw5qSFEFXff6TdAdTRcJZh+UlX6tbX8SbqKuCFpJM=;
 b=YHtMp4U6G+XPHuOfHo+yn9J66zfJuVF3F4HxHpDVSYQSldnPbYgFLuMkn5J5ILTNuS
 qJRoOHScTPUyqAsaZ5Rak90h49snAS54nEgTuu04k3BBEuyzjXOr3VgHcYIfxDr6QW+d
 ZTU1rUSstVDbsQZFMg1QoXrVGwjzYfYM3sg1jknuFUnkYTJyhKRuD5ZqH/BF+2pMfb67
 j4h31Kb5go+Hztz2Necs495o9EU1OBf4UsQdLeuds9S0LTi3X73w6BQPlBP1qkraHwBd
 nPKiFaE10GbL9iZBJmZeCdbzrlWLotSCIIVjmS4T80VOyX+DNqYdHzbtmB8Z8wh3e+c6
 DH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695397107; x=1696001907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61Nw5qSFEFXff6TdAdTRcJZh+UlX6tbX8SbqKuCFpJM=;
 b=hV/m/To6+CZQMvgTgE/MQQxA1LmP1Pj2jquHF46Xv8wYYsMFryz7MaLPjqw/wsh6yR
 homvSwZBS8FM8GmSA23goGsN2/kRKFrsel+UOmxApZDKsRwunfxrronfyUgyh3gnpW2D
 9KTzmD3laBhMpwSNA9xjOdcDT7TPH5eMKnpoVchik83iAXLtqoTTmiJdkyklmgfSGpNS
 6F3JVZtOSZTsQad6BqxCFu8whk9HMdJGgV5NIB2lrGAsLZ+ILkFCS8X9z4IsRpYTsyh+
 xg0VzIb51SCD1vw1GpwUku2lRE3EW0NdJSaDsS3LNiQk6SIbW8+2xXLqmHcPkz0+kZ2F
 AKMw==
X-Gm-Message-State: AOJu0YzmmyeL4xzIcameGW1WoGgfvjRs2tZiesMUcGde0pgsfgmPR9ed
 gosPbRspMp4TqZaEPd3xt98N4g==
X-Received: by 2002:a05:6000:924:b0:321:4d1c:425f with SMTP id
 cx4-20020a056000092400b003214d1c425fmr14659wrb.47.1695397107455; 
 Fri, 22 Sep 2023 08:38:27 -0700 (PDT)
Received: from [192.168.250.175] (234.red-88-28-23.dynamicip.rima-tde.net.
 [88.28.23.234]) by smtp.gmail.com with ESMTPSA id
 g12-20020a5d698c000000b0031c8a43712asm4714848wru.69.2023.09.22.08.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 08:38:27 -0700 (PDT)
Message-ID: <cc480044-5b62-69b9-9c75-ebd012675cfc@linaro.org>
Date: Fri, 22 Sep 2023 17:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] hw/arm/smmuv3.c: Avoid shadowing variable
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922152944.3583438-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WLFgE4T00WuB

On 22/9/23 17:29, Peter Maydell wrote:
> Avoid shadowing a variable in smmuv3_notify_iova():
> 
> ../../hw/arm/smmuv3.c: In function ‘smmuv3_notify_iova’:
> ../../hw/arm/smmuv3.c:1043:23: warning: declaration of ‘event’ shadows a previous local [-Wshadow=local]
>   1043 |         SMMUEventInfo event = {.inval_ste_allowed = true};
>        |                       ^~~~~
> ../../hw/arm/smmuv3.c:1038:19: note: shadowed declaration is here
>   1038 |     IOMMUTLBEvent event;
>        |                   ^~~~~
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/smmuv3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

