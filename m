Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4747735ejc;
        Mon, 6 Mar 2023 07:02:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+VBxx0ZNgtKfxjDdI3637KHdXJajOD1+OfQF1mkqMwdbqs30j89S8XMfvPd9Ns2yKQ1dha
X-Received: by 2002:a67:f546:0:b0:3fb:8618:95a3 with SMTP id z6-20020a67f546000000b003fb861895a3mr4671379vsn.27.1678114969013;
        Mon, 06 Mar 2023 07:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678114969; cv=none;
        d=google.com; s=arc-20160816;
        b=W3LKZhLwi/5Q4C/tkjbhZpnD6sEVLkq7vClPJunbuE7RnKmzmfXwnRdUzu3W7pFYBT
         90qYzn5Wbe5W4UM4lHlQU66mgig3GOw17vB3l/QTRZg8CTGclx1JCqrHxB0+Oz9dbDeK
         Ns3g2PsMATZ/yJiUZk7secda5Y9a3VVld7/Ed1lCNtfe31Ago3UB5VR0JRAvvjLSL/yO
         /IryOaYdNLjAfkYls40mMEAdRy1DN1aWwgFhJ+c8fCEY38aoSXH5vmNkqusInS/VsR+x
         f1XaknCOQQX31B5t6Goovj4/ZWhd6olGnPrhR5M22qb1WkdSX2oS7K/HL1KPjiBrc4xP
         vWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AVFWsc4JCQQip3THMGr7jXqyQsdTZCuJDQ8O3g3jdAw=;
        b=rhuOHFXJpw1DKQ2049RenJles9ftt6Tev1eycNYNIgNZ4TvOSr41L3kp/25PLtw7vP
         rZpznTMFHAQ2x6o8cBIMVYQwgulRWsWmDU0L9DNTcuQxl2V/LrsM36BOuVsEX2GJi3m0
         R5xd0++FYUZi20grFnaGJNIweaQO4NSEKpglgQNOF5bAxFDAabz4iFUm8eegfh950cjk
         baeaxZCXAIsN0Y3Pr5zffa/bknZ6j6hRy68N8j/s72gY/vLOvz4sNy+A5gurnioOutw/
         I0aCebI4Y6wR8lR0ppdi96kNg5Rk+9WWeO9s+RxiYlZYlfnt+QBVevjYqJh135WfH97Q
         fiaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3n1IKdl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25-20020a67e299000000b003d64177c126si2534981vsf.643.2023.03.06.07.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3n1IKdl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCLS-0003ei-UH; Mon, 06 Mar 2023 10:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLQ-0003bb-Va
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:01:45 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLN-0003Zf-7j
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:01:44 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso8438985wmb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AVFWsc4JCQQip3THMGr7jXqyQsdTZCuJDQ8O3g3jdAw=;
 b=w3n1IKdlyWnbleSQImgj3TOyS0NMlcX0ipfZCN6NFuNtTFUslWn+kegVUYIlaO0X1h
 MBJWzi7PxsEAXrKfBRB/CJathZND5UWfqN9H6wza9LZ9PAWL8InfZyLAyPinipqI3ZpU
 xH+MbLSoBbY1034yhUzaRLULW4VNie91fjl2TAPowpzwTYHL+0d3GjD8W6IjFzd9xGkF
 wHEWUe14LlzG7Yr0nebBmP7JbgdkyHydw93z82+Y+aDggEg4ZUWnOuoxkD7VDpQ37zKk
 IuRk3Aeea1Au+ED6N3DvpT0jvBa4k7QCO5hZ4iSqOhgxrmb77P6CETGtT/3WZ9s/k4GY
 q8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVFWsc4JCQQip3THMGr7jXqyQsdTZCuJDQ8O3g3jdAw=;
 b=JW1pGBZn5u39SpzZgl8UJco4Jm7SWqXEI3BZiQjGZKU/lkieq1FMOJyk2lREqRqdP9
 bie3sqjvi00JMlY+k+4toLDUizARIGqMUwGajCgk0iZ7azgWYTOvW3vz1NzBrrm4veLm
 AugjARoJugJ5kbe4tPv5Dft0Q6xrTfJvxM8SeS40bIVE9V0Rnthh5yqjaZAtWFHimuIO
 ePZhdl9l4RDYhAUc44t3Jqrf4cfUwwsicgHUuNgi8j5cXeIWM9Lkxr/KjCDj7haH6b86
 YFMUoWJzUtxjrZP0tW6VTSXc28iWEYiDWbw9AmMuzEvWxkmkn4D+hp47LcCTOYMcPlkP
 vACw==
X-Gm-Message-State: AO0yUKUraQOtM1OznsBZbGFytX6GxEMDyA0X2/koKX/UJakcL4qPl/s7
 4lwssQWXc25ch7cETYD41zonSg==
X-Received: by 2002:a05:600c:35cf:b0:3de:a525:1d05 with SMTP id
 r15-20020a05600c35cf00b003dea5251d05mr7715459wmq.8.1678114899324; 
 Mon, 06 Mar 2023 07:01:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c189500b003e71a6be279sm10192798wmp.37.2023.03.06.07.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:01:38 -0800 (PST)
Message-ID: <46a95da2-cc44-66e2-a20c-fce21a6f7d83@linaro.org>
Date: Mon, 6 Mar 2023 16:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 66/70] target/xtensa: Split constant in bit shift
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-67-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-67-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ck7pfVVc0o7m

On 27/2/23 06:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

