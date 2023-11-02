Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp131164eja;
        Wed, 1 Nov 2023 21:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9mg9gwLT3V046DE74sG9gMfBhI+qyw8s5M73Iejkq/5JbuPjnDc2V50y+A8oJaWOyE6eU
X-Received: by 2002:ad4:5ca9:0:b0:658:23a5:e062 with SMTP id q9-20020ad45ca9000000b0065823a5e062mr22377163qvh.31.1698897615233;
        Wed, 01 Nov 2023 21:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698897615; cv=none;
        d=google.com; s=arc-20160816;
        b=AFDvw0fUSQ4YhhwRdj4+LV5Wm1aMztWTXLvDZr6OM9D4FBQaVpjmoExDYd8MBUm1Hc
         qRwUhLl9INfln+8J2cTgItdquVAtKHKDpE97e1cnEFq3LJ+VUaLJtG4p8rGyHbrj2I2v
         oo7BESIdLJqTA3qlVHw7qUOQzllD9X72w6Chmdl3dav4weM7QP898dCBViqS9rjfLHaD
         yHmu+kW+N0eC1Jw98qottwbcDfp+PhCkwoj5rVfdiDChG4KGYdX3Bs9twdEhCsEYLbvv
         z2xBLETR8NqQJcLe0btpqn4zYPNvCLe4GBWJYn1FT1crk2y035PkpQmz6ueA42pfw2Eg
         /Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jeJ5ezoq0A3mVep3Qz9X4VmG6YNn7WCBFzXUEdxUfCA=;
        fh=vnd25H/Ke+7YaFzjpnMIhV1td4ceLAPtKNu/30RxYYA=;
        b=MJKHW+t8zoAdqvuCAvzfr9dxdfdL7FfQEQjpXnVEYuVSfhKDhv5YZp4q8m45oirWfO
         3xQOQwZEFoZnJ0D0AeQkUS3HSfaPD93WqQJ5WVm8Wjm0Py/LtQylsO94ZtiUVF5BjSZO
         2aFT4P9qE0tEFM56l2fEZLTpApRCJaDo5oQS0Hj9DaYS2JLeNKangaxzTsOwqRl9ZH41
         AX/pIsNJOkta4BSuSt2fP8fEg1ZCeAVIrPlCO66rsDooNnNxYPPP78LCsa/JzP2+uQNi
         WjFFJRCZNR37vMluklFXVfBKIyLJW451XXjba/kkTMtrzrbvM9OIXKqlL0D2pwcDrLx7
         r7AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXC9FLI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq11-20020a05622a1c0b00b00417bc62d18esi3433052qtb.231.2023.11.01.21.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 21:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXC9FLI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyOsB-00071k-DM; Wed, 01 Nov 2023 23:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOsA-00071X-S9
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:59:58 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyOs9-0000d7-73
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 23:59:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b709048d8eso534036b3a.2
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 20:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698897595; x=1699502395; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jeJ5ezoq0A3mVep3Qz9X4VmG6YNn7WCBFzXUEdxUfCA=;
 b=rXC9FLI2G+YWuNvv7DwlXw4aJqpiHKucg/rLm7RtrA3bdaGtvMk+yGnjxVz9HTR06O
 FuzjKzwynQst9guhqPu2BBVZILKW9LzCF34yE6zxCAbXUM91eA5VtQQy7yorDsdXEAU3
 L88O65Ka0Oo5kklblf2Yl83ufCU0DfKe1j2xpUkaLZAxX9WlDZscRZlt1hS2Wj1npCes
 ZGIP853r7YlcF6V9vGenwlmUejx09nbDr2+Q6GMT95GcdpMoSZtwXytVNBEuQNl3ptpT
 6zZROKpzpgNKYFLrawW558jT8vz30fAVG0HodopVwSHXt4jP9Plspxyl8tMDps2ORf61
 EQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698897595; x=1699502395;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jeJ5ezoq0A3mVep3Qz9X4VmG6YNn7WCBFzXUEdxUfCA=;
 b=CRr6h7fEfLrfFTccQD1cyRKNRAkgJr6I0tuLdkABvcVLVw5qGd1wGwBKRJQA6W3mjw
 s8oFWBbPA08a16BP9djQM7E7uDM1LnltEEwpybWHQHpGPpZEpG5skm1MNcAd6kbe3r5Y
 ZHOQB9QilI5X6aC6nozUWE2BhRV2cwZWLbB7Tnn0FmP+JRPgJcqhV8CUQQ8xhGZ+oMDY
 mTAJ/RR/UWvMvSnPNLPtFTaUEX188XC3MnWJ508zciEnsq5N4uR8l9W3iMdgtkdvd9iX
 MbEo6p6pX6mYzec54eArARjBay2D5WlxcG1QBv+fBm2Ofa4K9Q+054iVGa0bhhTkOV5K
 iTAA==
X-Gm-Message-State: AOJu0Yxv0exvYFJqiPPl/5AKLXQwo3tXD4lbM56jty8FjcJVsoRwD8YB
 ox//O+7tF/rjm9mvI2C5oK7lVQ==
X-Received: by 2002:a05:6a20:2d0e:b0:15e:10e:2cc3 with SMTP id
 g14-20020a056a202d0e00b0015e010e2cc3mr15957386pzl.60.1698897595402; 
 Wed, 01 Nov 2023 20:59:55 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001c5076ae6absm1977632plo.126.2023.11.01.20.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 20:59:55 -0700 (PDT)
Message-ID: <6d1ff83e-a942-49e6-85f6-88e97c63611e@linaro.org>
Date: Wed, 1 Nov 2023 20:59:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/33] cpu: Add helper cpu_model_from_type()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-5-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jU/pHoADugoP

On 11/1/23 17:24, Gavin Shan wrote:
> +char *cpu_model_from_type(const char *typename)
> +{
> +    const char *suffix = "-" CPU_RESOLVING_TYPE;
> +
> +    if (!object_class_by_name(typename)) {
> +        return NULL;
> +    }
> +
> +    if (strlen(typename) > strlen(suffix) &&
> +        !strcmp(typename + strlen(typename) - strlen(suffix), suffix)) {

g_str_has_suffix


r~
