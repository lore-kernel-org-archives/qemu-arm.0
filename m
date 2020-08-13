Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp667346lfy;
        Thu, 13 Aug 2020 09:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsnkIvB4ib7FOfofcOEQImSbf8856K3fNOpxVV5AGCGsE1qDUdOQ/WyzPTNC0gMUajEc6O
X-Received: by 2002:a25:d00a:: with SMTP id h10mr8310286ybg.40.1597335128942;
        Thu, 13 Aug 2020 09:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597335128; cv=none;
        d=google.com; s=arc-20160816;
        b=ILw3q4WlJWNYoWpav/Loyot44FvWGDWPE5BpuP8McneiawzL3aK2oVh93eWBIlxWIx
         if8j3bbtRuaVbtzrxbgUVJihk7aQ7NMZ8F6eBp+7+vieLgS7hpI9iCg8itvqWy0FNUbJ
         Gcvm1b0zhpkR6FASCbhswOIbCmOJRHj5ojOzUptGm2Y28Z49PYLvRHVjxJetAy7O5tfx
         VOT2Nr+js8c/huXD0qLtk9Lwm+iJJ3Gu97lauWBx5CDQmtwbE3JvhZmnymWQaUn3EV4U
         pZmK42OBCGkBV1xSxTJ8NlvZwm8dVJug3O9yuHHYm7YpkR+nMNMrK1oc6OaxNFBHIMc9
         bf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=73oxTYFUVtiYvM5yR5jEL4CAAE7SDHJEhhg4/Y+wIRA=;
        b=rvH8owIU99NCBkcUf7yq+65ylwYlf94NNyL3+bVeO8fxz+V2ySPzzLBdam/pNtA1WB
         NhEq+YH7up2spCnSmRXFM6ttmt53XpBi1DL+2YZbWUUvZSOA66Zpz3vPMoMfg1Zzl7lh
         8k+bLRF3dlTPccg3SDo+aPfNwlGScwcFixlzvJkwKE20Gc2UAOWpvgZkV613EOLFV1sb
         PCPFw2k41QFSJpWXqh1HrQYxsjJ79+zjsm4lkHaf6KvTMgGa2xNEHOSRIie0ESN1j721
         PtmArEXO4H2UG/M648XxO81LYCauFJ0nEIqXOXlCyXimVGAUqW6YbM8XPgXCVWiZunYf
         P70g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exZRfqqi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b72si5762026ybg.6.2020.08.13.09.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 09:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exZRfqqi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Fpo-0003gV-Bw
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 12:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6Foy-0003Gh-7y
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:11:16 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6Fov-0007RC-2Q
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:11:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id mw10so2976813pjb.2
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=73oxTYFUVtiYvM5yR5jEL4CAAE7SDHJEhhg4/Y+wIRA=;
 b=exZRfqqiueM9mkDhLrcX2ZDBwG2RJcXskon0VEHdRa9q8C+9NFhFrI7P35Gj45xAy/
 dS2YVHjlD2KsXDzmVHq9cBmZv8rLA2b/RNpB2A2tQKOcAkfhnIyF24czN5IaTGYyv/0R
 GEUh/xVOVEuq8gBzctYi40KeCY9vWnWkitjCJ3AEzhoicQiYtF6OsAB7n0ee75PcA/T+
 P6ryF34VPKXhUaOGTM+kuw097si2f0Tv7+ulEutqUWXhOg58KierWwGVxMZamSX09CsO
 yeK5ItF09gwfYRtyDBTxYzreZ42R0aT3lOP+6RMNzgurlU0EPBABAN3jEl8XQ/b9TlAd
 un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73oxTYFUVtiYvM5yR5jEL4CAAE7SDHJEhhg4/Y+wIRA=;
 b=QdHu9FW9wKaEzprMP+gJS/o5YVoE0sSSiofkKfPpsG0euy+abiWvonevToc/x6WsRl
 pB+xcAUChZzqYlxIwoM/srQytegZwAMzDkK9kpDOidh/wfcj7e/5fo5eez6o+yhoaibM
 779H9llFXpoi6/yyonKVQmpLuMWWtnYuGYdzB/hIXB1mNs+hUPR8PNInxiNwabt2jzB+
 wwcWFOkAeVsTy6CxxYGPEVnftgmc5HCFe585F5EeoloriNT2lZ68Gx7cRqQ7JKHwtR8u
 wiDVi4aYPOIO+6dN34pT4SyFdHQOg7hcEBKwDq/2hgjwB5zBB5affjltxOOaRJTg0myP
 KrGA==
X-Gm-Message-State: AOAM533X5yc+Z4f5ZFXeyxhbV0LdRv491zmMJmkLbd2pg/afOhNNwEhx
 NCieiFymi0XiwHys/TMET2WOMw==
X-Received: by 2002:a17:90a:3d02:: with SMTP id
 h2mr5793000pjc.15.1597335071452; 
 Thu, 13 Aug 2020 09:11:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gj2sm5609250pjb.21.2020.08.13.09.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 09:11:10 -0700 (PDT)
Subject: Re: [RFC 1/9] target/arm: convert isar regs to array
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peng Liang <liangpeng10@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-2-liangpeng10@huawei.com>
 <6151cd0a-b3ff-ae68-e843-c6b294b846a8@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43673801-9e9d-b090-c187-d8869433f18b@linaro.org>
Date: Thu, 13 Aug 2020 09:11:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6151cd0a-b3ff-ae68-e843-c6b294b846a8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ugunGa2XGDwj

On 8/13/20 3:42 AM, Philippe Mathieu-Daudé wrote:
>>      struct ARMISARegisters {
>> -        uint32_t id_isar0;
>> -        uint32_t id_isar1;
>> -        uint32_t id_isar2;
>> -        uint32_t id_isar3;
>> -        uint32_t id_isar4;
>> -        uint32_t id_isar5;
>> -        uint32_t id_isar6;
>> -        uint32_t id_mmfr0;
>> -        uint32_t id_mmfr1;
>> -        uint32_t id_mmfr2;
>> -        uint32_t id_mmfr3;
>> -        uint32_t id_mmfr4;
>> -        uint32_t mvfr0;
>> -        uint32_t mvfr1;
>> -        uint32_t mvfr2;
>> -        uint32_t id_dfr0;
>> -        uint32_t dbgdidr;
>> -        uint64_t id_aa64isar0;
>> -        uint64_t id_aa64isar1;
>> -        uint64_t id_aa64pfr0;
>> -        uint64_t id_aa64pfr1;
>> -        uint64_t id_aa64mmfr0;
>> -        uint64_t id_aa64mmfr1;
>> -        uint64_t id_aa64mmfr2;
>> -        uint64_t id_aa64dfr0;
>> -        uint64_t id_aa64dfr1;
>> +        uint64_t regs[ID_MAX];
>>      } isar;
> 
> Why not simply this?
> 
>        uint64_t isar[ID_MAX];

Because the ARMISARegisters type is used elsewhere.

r~
