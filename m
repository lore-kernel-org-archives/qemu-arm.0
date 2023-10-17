Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3891529ejc;
        Tue, 17 Oct 2023 05:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnfryw0vGZNd9PVSc6C/Yf7ISNQqoy7ntEf8I6KC4qdc0e7J2E4pd2YSxC+N/VNSYyBRbA
X-Received: by 2002:adf:e412:0:b0:32d:a853:af6e with SMTP id g18-20020adfe412000000b0032da853af6emr1796749wrm.1.1697546709884;
        Tue, 17 Oct 2023 05:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697546709; cv=none;
        d=google.com; s=arc-20160816;
        b=aFW8uACiEhoX93+76BxMPMbnppxqphCJ4/Ih5hcGbl98CH1FHX0tUL9HZAH2Jkt95H
         5y91Ajm7kPMNW1vZCo1EpTn0TPVqNffEjPuU8+D3VAvLsT4aD/tp6lBqlEOOkSnHFPA8
         FS7OyAel95uth5pXExOttvuS0zDr76w2+o1O6eMF67Wi9cK96PYGasOKUFaNBZXo8kAD
         st3NkhB3HMFuCWClYPznqN1Dnt0KAWTSA68RR6kS0mc1rtkBsoW8khUaBCbRO5Gku7ay
         0N+vrI0ISPXmFf+i7rBC+7efI67oXjhk60VPkvxBLtWOL7Igb2HZ1XDMPR7KjcbAqsus
         SjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=wKulzNlfgfrpkUT+QrxCc7IozboSTp13pn0UnsMQw2k=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=hq3706mQoaxYm+NWLSxRuqFt2RbHjvh90hwNCdZ27mgfKQ4vFShlj9MMQ8qKsyj9v4
         pQ5NjBBONWbGTSNRi5pEUnrjBQgzIvGgMaY4LqJ4on7KRd0syJ39HrFB0h8Bv5uGRryU
         fV5PnKyCMdN6T8wPD1YX1+O0RhHPH/5xvcXkqwZ4mk5qWEMCGl8rzKqP0HnjLOXQZ3/l
         kchpjGqxI0Xqkan3v3Bm/YA+1nIxfNC1MXG8TI8szsAgeMsNIRm0qJNE6hgHBHlg+xCy
         SZZ7Y3+VIaW5CBPeMhJxamLaAETZu3gT6izwCNewHx92h7CmDpRlq2OxvxZD+a117XcJ
         NmVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO+daUZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020adfffcc000000b0032d95527cc3si938204wrs.271.2023.10.17.05.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO+daUZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjRc-0007hr-7V; Tue, 17 Oct 2023 08:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjRa-0007dA-8m
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:45:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjRY-0008EP-Gd
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:45:05 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so9578441a12.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697546702; x=1698151502; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wKulzNlfgfrpkUT+QrxCc7IozboSTp13pn0UnsMQw2k=;
 b=aO+daUZWHa97/8byhTsJYsuWxEdkTmBvnaVYxuh1TKE5jXF1bWxeNXvw4OswjEWMj3
 r9fXK/cJ/MSir8syYyhmX/zew5rTMNbdc9Q4Z+mnuj/JaUxUnKfoyZq3m6VNup+ixH9n
 XumxItzjlJsdHY2K3cwxX7Hc+TMaswPhGPtn35tRVMPGIrfA4W+u7FT/oKmzowgKIm/m
 xwQ7OW2ul+oWTUqPBj/97uzOSY4PTojGcYGmO2KCfeZ9GMDhvxALPrw94EshAcuZeglZ
 SyBHhyxUXWCTaQSpo/QYuoit+2u+XPH0swP9KjsSUOkZD0kRhhR5rN7fDYJywXQ8dfky
 PoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697546702; x=1698151502;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wKulzNlfgfrpkUT+QrxCc7IozboSTp13pn0UnsMQw2k=;
 b=pbKlJ3KTr4Y+Om6Z8EtrG2KHMeik0bvncK4hoEbRqjld0cA8cpKdN19n+RD6p5zw3Y
 9sexnru0gStu2DHapCsCot3pGWK+B64yHjgWqE/5VUxdMi40MhBVCW5iN7pM3inisjWs
 FwMdVBF0+71UMbQba5x3HoN/wI4i0Kp0BbfSH9gpp9fxqnleN67Nj2MNbMyknAwTPh8X
 /3tlqmarfbUW6yFJJy0cCPteKHTO4Hue/O9qWe8onGq2Ukb60GaTVdP/v5WAwZ0RqCzs
 dfVuDE5C/lXgEWZeNU05qVqV/c2DDKxxVv6w1h1B0XQkeLTf5gAVG0bzC6opp3zwr95T
 c3Ow==
X-Gm-Message-State: AOJu0Yx3HNi2n2V7Ut4NUGZvPKW5V6FUmpEjJ7kuYR/mLRess+6TQAkc
 Mswj12wDzRwC8MQ8MjtwQBHduRtAKVvnQd2UlmLWNg==
X-Received: by 2002:a50:d658:0:b0:53e:47e9:9614 with SMTP id
 c24-20020a50d658000000b0053e47e99614mr1699519edj.7.1697546701998; 
 Tue, 17 Oct 2023 05:45:01 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056402038700b005333922efb0sm1147916edv.78.2023.10.17.05.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:45:01 -0700 (PDT)
Message-ID: <4a335345-782f-1166-5cb7-cd491fcccf94@linaro.org>
Date: Tue, 17 Oct 2023 14:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/6] hw/input/stellaris_gamepad: Rename structs to our
 usual convention
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: fP9iXCGsd/Ov

On 17/10/23 14:22, Peter Maydell wrote:
> Rename the structs in stellaris_gamepad.c to our now-standard
> CamelCase convention.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/input/stellaris_gamepad.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

