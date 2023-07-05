Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3665898ejy;
        Wed, 5 Jul 2023 08:44:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF6G8ZErkm4n17suEX+ur6tk8Zj2w+IdPSzzPrFUUWB4X/aGSgaTQIVSkoF8c20fpXvZE30
X-Received: by 2002:a05:620a:4096:b0:765:575b:415 with SMTP id f22-20020a05620a409600b00765575b0415mr21964294qko.24.1688571875236;
        Wed, 05 Jul 2023 08:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571875; cv=none;
        d=google.com; s=arc-20160816;
        b=XOTEF9JS+zo7rCw/whKNiMNIpui9+F1f/tLf2s0mYJnFla5UC4SlaTsaZzKCRAdr0D
         tLNpkIZmxRCADzgFcpI/yv5wk8R/g9hL0LlPZq9kESnELjjG/lTP+MjskNIz0XELnAQH
         yhrAaxkqIlIjcP4PpePVjxI6ytv+50jSOyFs8i8n43bsum0N+XTkNVNWazoOAucfoak7
         zgu6COnmqZWUfjgmcBTocAMRXGgrB9kyYhk2wwA7fgbmj4liXKq0dfZRjxwyrZj1vXEH
         i7wrP+HPsN/SB8hPMI+3p3huZ100C2I8fuQ2SEZuak8Z/hlF1rf5Q6NT78+IuKuiiaSU
         RpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1uyztzwuDD9Ah8M4GvDKZTZYgGChTPxk+odW3+66f9Y=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=tqPnHycy/f/TlW9K23si+8r8BJ/ed2naK0GGjbx2ERg0h5+m62QQlUZlw2db1EPKKj
         ufIFzPilPB6rzpp4aZZyifFZyMfJ+N0uDMv8AeBuwqykfWqnc5vd/wFfY0vL2zvvJWsO
         2tz+ySzJDY8oDigJE56Mg4vpkMbPoRK/ALz+1OiVVTirpBdHDjHi7J71dSm+DSBoZAYo
         DvTlM2449sljL+udqTXsElCpStCoS3MjIRj1Qb0tMZ/HWJFVBxjh5Z4JceP0+lDtk9Kn
         awfF+/r9/gsYGHYOqga4WYJo487wqrYqpIaYtsQG+r+HXciiZ6BvXvizk1TBAXry2bH7
         Uz1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3vNufOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a05620a0a4400b0076707845d17si12474917qka.21.2023.07.05.08.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3vNufOC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4g8-0002a5-Iy; Wed, 05 Jul 2023 11:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4g6-0002ZH-ML
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:44:26 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4g5-0001h5-53
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:44:26 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso11137504e87.1
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571863; x=1691163863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1uyztzwuDD9Ah8M4GvDKZTZYgGChTPxk+odW3+66f9Y=;
 b=K3vNufOCBbeDglvR5WfXBHVWCHv0nXROSmvnkxf/+lhQ1Y+BSb2UqsrGpFZ81RrPFM
 Y1+eWL4gTC0HIfMPuqTXxtaj5tX4pvdYUvZ02F/i1KdLp2/aRvIYeY3CO03nuu1ucl08
 mIWLqX0WniExn8cVnQk2ht0yEKESEMy9ldTN7qH1Nvsn5XjFxnY6Tbuly6CgBtnqzPzr
 DECewG84reA1URZzK8a+2U9h3JYWqa8dDN1Jejt6SvfgbSRbc8S2s6ygqXtq0CLBi9oM
 MGhJl3HKpSeU8zDMqWRx7rppOl7NqHiDP4zS/ifYbZMKVGD4Ma97MciTwum3seKjebeN
 Uq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571863; x=1691163863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1uyztzwuDD9Ah8M4GvDKZTZYgGChTPxk+odW3+66f9Y=;
 b=k9I1fGNvmr0pzdPQebvMDECwNZC1O6ItkoPoMmko9mWGTxQy4o0H8IczPR4IJIKTAV
 ZVamYQ8ujGg32ZTUpo6l/Rc6cBEZDXdwjZcRiwFuzJ2mwQzhV+yqVI3XC2VLyrgnfRne
 3bZxmrak9kCftkyQTsf/37BFd5LIUOZTFUxWnQ9pHsM61s0pZCeCwvjSSSzAtIeACbCt
 8odnb+Cqc6qHvfnABw5xzhvzJ8hS5lbI3t4CN5hFYUtxejdDYehg6/b2uuFKBC6+9AvG
 /HS9fCoA4Eftd/PPWmBeNNAKid8pMtmAikdxUTIgWEpCANwwo2UTaFIfuD75tTSS2waU
 ZUNQ==
X-Gm-Message-State: ABy/qLaITq6i9ZR9+Vm7Z6vFMv5cd/zitlGWW1GoWzgMD9lO6ufhgoKM
 FxLlWX0qvCq6pz18IzEZO/d6iw==
X-Received: by 2002:a05:6512:285:b0:4fb:82d8:994f with SMTP id
 j5-20020a056512028500b004fb82d8994fmr11109016lfp.33.1688571862564; 
 Wed, 05 Jul 2023 08:44:22 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a19550a000000b004fb844a03c7sm4316346lfe.186.2023.07.05.08.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:44:22 -0700 (PDT)
Message-ID: <12239add-3fbb-819f-891a-3e7278fc5d11@linaro.org>
Date: Wed, 5 Jul 2023 17:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 18/19] hw/timer/arm_timer: Map ARM_TIMER MMIO regions
 into IntegratorPIT
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-19-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: B4aPRcBK88kS

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> Instead of manually forwarding MMIO accesses to each ARM_TIMER,
> let have the generic memory code dispatch that for us.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 43 ++++---------------------------------------
>   1 file changed, 4 insertions(+), 39 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
