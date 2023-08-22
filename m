Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp509083ejx;
        Mon, 21 Aug 2023 23:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfdaqEbJCnWe6akA6x0/NR69//ZvV+OED0iBN7uC6fzhpMXvM5yYYVbvjrsU2hbch/6S9a
X-Received: by 2002:a05:622a:1ba7:b0:403:a91f:893d with SMTP id bp39-20020a05622a1ba700b00403a91f893dmr13782788qtb.26.1692684894654;
        Mon, 21 Aug 2023 23:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692684894; cv=none;
        d=google.com; s=arc-20160816;
        b=WSMqq+PHhSZNqJIsgNjDTzhw6KAyTzjVqx5sIUwul2HrQ7tBUrA77iCfSx65eqkDsh
         DudfbmlckhSIl4/DE3/cksTL8K/fl+GMpPeAYGUqz5KG0uD4aRT5VtBu35yyxamdYE4P
         iBIR4u+FAhpOEa53wsYU0ppmFrYuZlASBgPvI8M1qhntBoDUwrLMl5G4F2nRaareyBt2
         od5iFYslXeR12++Zu1lRYbYYwNkam7LWWExeHiDdmpdP1IRN0Q2sL4slh2BV6HZ7opVp
         NzuodRr66BfD25sJCHtNQuw3fdMr7ObAD6CiYh0JcD6r7pXv/D7JdyC+I+fZqujcDnMq
         Sj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wXF5QAlK0X9QheMsGZTjavxIg0XP+RjETdA05u48G5M=;
        fh=o2uytz6hJQV6gzMe8MyhV1H/nFx12egrDQNGri8PKjg=;
        b=PEd3WC2+flWwoiYDzIJUXvIEu/Cjt28XP9HV7lyfrRY0k5vafYEo9BuI1Hug5yvUCg
         UP47hkTQOQ6WdEczTT0F5XoUFEg0uujZHOX/ibjDxmRXRlfMeBvIcJJ/jRTHHqxM2fhJ
         K9NpZ67sPJ4Y1egagrtdlPMRjYtSse/m+f99dfNCpcvlhTc1aiirZOjHtlNP2C6vGutc
         U0wjg7OAr3e9JkBFgzgECikh5q9pWFTI4GoGWxB3Ptav+QIz0NierhCAfmVTC+Gvc4g5
         CbN4bNFK+0LXvpbr1x/MYbvzm8O0nM4u/I9+VkqUaklsge3vlLOC1TmSPfzw3fQ1l8Pv
         lDGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqeHKfw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05622a118e00b003f0abf74b0dsi5939655qtk.20.2023.08.21.23.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 23:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqeHKfw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYKew-0004K6-Ll; Tue, 22 Aug 2023 02:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYKet-0004IQ-PX
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 02:14:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYKer-00065a-Bl
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 02:14:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso1596701f8f.3
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692684867; x=1693289667;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXF5QAlK0X9QheMsGZTjavxIg0XP+RjETdA05u48G5M=;
 b=mqeHKfw6aueacl1JADmnFlUD1yG4ZXHqtiIIY9onvtns2jq8glgXWJ4Kj72L6iBqFS
 9CuSRPPzcr8F5xwGaP1cp00xsyuFasI9qSM6nd+5MoDtmoPfEpkTsFcfqqTdcyfAC1pc
 /sFTpqAlw5zZPWH1UnIHm5nROkSBlTnogzF+nY8fIDWRbIqs2S5VIyM4lYm+XHLm18nS
 vwwq/lTTZU92f91qdbBzRh/hPhaxH9LH0UXDbb2cPrM4XMj0on64+85wTS0Jt3npS/ra
 v+atbfQ7chvf6IIA8NvKQZlBB7ATt2GPftsgtJaFVUspdmnmYWeD09CcjFBG67TlgfwL
 GyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692684867; x=1693289667;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXF5QAlK0X9QheMsGZTjavxIg0XP+RjETdA05u48G5M=;
 b=HAhscYwgZqJnOEJnuWSOV5PmNZHFLIwA6jCouVkhuqi7oOoOi0NHl2rypO4CnwAxy8
 CURTfCx3DNbIJyFfOeHV/VmAOA7NRB/Gfs92CZjpheH/Krw1J+r4VGiTS5+g4opSs5LM
 as1LLjpbZBT1F4pTqQAC57ZLpr4BlEFbQYhgyCjdS/vBUCUznRC8KSs/IgKUsZ/LQQOg
 8UVRwuz0YKy6onBH6HtVH/gxG0Giq4Y/Mg6gNOHQf+c7VJpN/8Ettc+G4Rrmllsx1mSP
 lZDh7VGRf5ij/zt9dPuvhml203Zq04PkReB14mK4vpL1Dr4XZwLr6e/7NPqUPoYSHnuR
 mTkw==
X-Gm-Message-State: AOJu0Yx0UZ6MQnh9F8ZnVFSbvZ7LWinGg+AVqIPZITMS9LRSs7HVT986
 2tUEq4T/Pl8p+M2+t1prXhS2bw==
X-Received: by 2002:adf:e990:0:b0:319:6d8a:75f8 with SMTP id
 h16-20020adfe990000000b003196d8a75f8mr7071791wrm.44.1692684867462; 
 Mon, 21 Aug 2023 23:14:27 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05600000d000b0031c56218984sm4840182wrx.104.2023.08.21.23.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 23:14:27 -0700 (PDT)
Message-ID: <b7f3d93a-03ce-87ce-000e-35cf8667233d@linaro.org>
Date: Tue, 22 Aug 2023 08:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/9] target/arm: Add ID_AA64ISAR2_EL1
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230822042530.1026751-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.374,
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
X-TUID: /VtVwFaUypFQ

On 22/8/23 06:25, Richard Henderson wrote:
> From: Aaron Lindsay <aaron@os.amperecomputing.com>
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> [PMM: drop the HVF part of the patch and just comment that
>   we need to do something when the register appears in that API]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h     | 1 +
>   target/arm/helper.c  | 4 ++--
>   target/arm/hvf/hvf.c | 1 +
>   target/arm/kvm64.c   | 2 ++
>   4 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

