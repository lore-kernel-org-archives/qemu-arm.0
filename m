Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4968466ejd;
        Tue, 23 Apr 2024 05:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKMyunFdyxf0Wy2qNSfQNzN06xBoCNSNpgBRr70QXKGv/yHOMJyRx7d7q08zVZ6QdO49KPADkXF3Q9GwrEUCxk/6+6GSWL
X-Google-Smtp-Source: AGHT+IGjE0LuignzFGJDKmzga8JsDmYQqla3Y1SwtRTbkotYVYCacJLhZ4XaQdO51nWcuDbuBLid
X-Received: by 2002:a05:620a:c46:b0:78d:6477:37bc with SMTP id u6-20020a05620a0c4600b0078d647737bcmr16684801qki.51.1713874371819;
        Tue, 23 Apr 2024 05:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713874371; cv=none;
        d=google.com; s=arc-20160816;
        b=yHVuCp6vjf4fW7AifQheAwIevTp/zlGEO+oYdDzQi37s9qFqnc+302zf8BlMbVX5Wt
         VdV9XQcpOBt5hSJf7T+4rWptiGMulMkw2jJ1+/GDOxiDHeYmhGd9xfQLOqKEChYDqCOP
         nVjHBrV/apyx5qiqT8knwKTZF5OAw5XVsMANSsiRD6WJX7evX583DXPKgTIrHJVd+zcM
         bSg0ZxZinnIEPJ2ENafkEp2oapmwQlLdSzG7JaSkz2D6zVzbMrkK/GHR1FvtpnSwTqla
         Udow6mHPyjND3osh2i8c2RVMQckCfPqynBruZA3seKQHWiklxo11wFmdk0tHEEPF0vhH
         TfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=2l7PltlWdJDwWp/74Dgpbb8SGt7xm86vms3Vm5cSd1E=;
        fh=hhQGcvLODbZg2O14IKnmHpMtFS+N4nfbuOGWT8Fd3JM=;
        b=DeNQ7vlAJfU+R+aNMi7QVuaVUMx+KlzPn4I2Efr7bmLMR66yzqVKplDqlpG7SA1Qlf
         w9UAFICqKhq77ett8OrQmVVykUfj5RqexwdqgApDkrhJkrFf8dqL4uDkaZWs02f4wU7f
         KyeyyJ3W8v6b7cmk5tJu3oHzNVIwINhQTAD2xFXuxHJGqYfcAnPI6wNIVqpEmz2u6U7i
         HGrtQSSN0J22ZSD7EZiEaFjptoggKJHNFT+2vINzsLjR7H3NUULwEDWEEa8+BOyOVqas
         56Sf1HMTPXckXJezLwRvqxdY1ZmHfq/DNpEQ7+2cy5/Ceev7TsDQy/rgGsSbUEco4iYT
         CpBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n3KDW5Ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05620a0a9400b0078ec8244f78si12446455qkg.28.2024.04.23.05.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2024 05:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n3KDW5Ro;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzF0j-0003cE-VV; Tue, 23 Apr 2024 08:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzF0i-0003au-IR
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 08:12:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzF0f-0007Ib-P2
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 08:12:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34388753650so2906240f8f.3
 for <qemu-arm@nongnu.org>; Tue, 23 Apr 2024 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713874348; x=1714479148; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2l7PltlWdJDwWp/74Dgpbb8SGt7xm86vms3Vm5cSd1E=;
 b=n3KDW5RohaLbG+KPOrLw8RMo9/piYC3FBQX5HewKQDrhj2Md42C+UjJFLNHTOCMZCa
 O8aAyRXee5ZJWyLN25c9coeEQe9sJ2QXkmG2NGgMz8kHBuhzboCIozZxJtZSB6yaWNvk
 iTkxop8ed2fHpEJU2e7/0dEt5LAL1H6eLZakQskSaJt2u+nvRxhmKUd+t64aj5e7PPdQ
 bkJhCsc1pQJxLvi3G75n4Tsbz1I2Flu01bud+XBBaRYsczLlwqeCb+eIyaw72We9ZE6D
 dbwEN6IlBIStHXZmc/XUye4FvofdtLxb7xjKgDQHwYnUuRujVrtBMwCk9ZR3oSAfE4Bu
 tcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713874348; x=1714479148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2l7PltlWdJDwWp/74Dgpbb8SGt7xm86vms3Vm5cSd1E=;
 b=drJXcikLouzcN1cF1/HcTZ+ZCm43Lh4xIGdQdKdvS6AG4OO1/CPEM3o11YqHP/39VU
 feSgwmLKLnA/F1SrwkIfyLpwx2n6rZOO+Bq6pkkX36qDvM/sPLZAjdLJNeKP2TD6tWnS
 qahaQSGJwj+5jX5biePrS/M2YxiDdzr2SoIp5ZjRj/x1JJasM5xATALzIDPM/YYzRwOl
 ErHyUojN4s433rECfwymu9ebTLnFh8aOC2BuLw4sVAEPUPP+D1kE+Ve747TyeeFP3dAt
 Pva32DlrjsEC6ACA9vzXWHodsnatL1v62wkNcj61a5OcmeL6yYbmF/qWDV6p0JPjVryF
 ZCHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaHrjd10s6SfJzaXYF8mUkovGBQlsG5+A1FcJs1HjPOyJjesnktAnRimc8114IQk7hSMweVKYWJdbN7TmdtxvtDxxM
X-Gm-Message-State: AOJu0YznHtnmQU/j5xZst/87XgYSujCfeMz9tOAAGK2dg5Z03ziY9PJ9
 FObh5MvjjBOe4CteK7/whBcMp5eD4Pll2ZHlGXG+Y+0FrsRkuApB5iUX2uvrlyM=
X-Received: by 2002:a05:6000:11d0:b0:341:ce05:dba5 with SMTP id
 i16-20020a05600011d000b00341ce05dba5mr8601607wrx.30.1713874348076; 
 Tue, 23 Apr 2024 05:12:28 -0700 (PDT)
Received: from [192.168.175.175] (228.53.205.77.rev.sfr.net. [77.205.53.228])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6b45000000b003472489d26fsm14517690wrw.19.2024.04.23.05.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 05:12:27 -0700 (PDT)
Message-ID: <69fe13c5-8351-44fe-bde5-88015b4f2523@linaro.org>
Date: Tue, 23 Apr 2024 14:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/arm: Refactor default generic timer frequency
 handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <20240419184608.2675213-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240419184608.2675213-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sO65g5yh4YDq

On 19/4/24 20:46, Peter Maydell wrote:
> The generic timer frequency is settable by board code via a QOM
> property "cntfrq", but otherwise defaults to 62.5MHz.  The way this
> is done includes some complication resulting from how this was
> originally a fixed value with no QOM property.  Clean it up:
> 
>   * always set cpu->gt_cntfrq_hz to some sensible value, whether
>     the CPU has the generic timer or not, and whether it's system
>     or user-only emulation
>   * this means we can always use gt_cntfrq_hz, and never need
>     the old GTIMER_SCALE define
>   * set the default value in exactly one place, in the realize fn
> 
> The aim here is to pave the way for handling the ARMv8.6 requirement
> that the generic timer frequency is always 1GHz.  We're going to do
> that by having old CPU types keep their legacy-in-QEMU behaviour and
> having the default for any new CPU types be a 1GHz rather han 62.5MHz
> cntfrq, so we want the point where the default is decided to be in
> one place, and in code, not in a DEFINE_PROP_UINT64() initializer.
> 
> This commit should have no behavioural changes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |  7 ++++---
>   target/arm/cpu.c       | 31 +++++++++++++++++--------------
>   target/arm/helper.c    | 16 ++++++++--------
>   3 files changed, 29 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

