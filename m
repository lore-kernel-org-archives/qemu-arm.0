Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2528670ejb;
        Mon, 20 Feb 2023 10:50:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+Jf0/H3m2PQBHHuaJscvJcOu4mVJH1dh6MeW4dB5UzLWskew7BKb0y8FOvEnHFm2DcbQFT
X-Received: by 2002:ac8:5c15:0:b0:3b9:a4c4:ca09 with SMTP id i21-20020ac85c15000000b003b9a4c4ca09mr3991006qti.10.1676919058980;
        Mon, 20 Feb 2023 10:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676919058; cv=none;
        d=google.com; s=arc-20160816;
        b=gmpja3delntVTcjBfOalaLliE0/NiLWyRo5nHalDYp2qVbhTusmtcP5lsEJENXcVkF
         dln2Uj2d4z/QM1rIyhM4lYiDHNvqOtHNjaHPwAeDRdHiJgAByGWft+Xb1/bJ+pcv+v+e
         YHCls0yEuTk9+M2qrW9w1S9OV99XRC5pYWh2/oyfJEsmbb3SBujAZqrsBa6g+608Bs3a
         3K1H3I0+r1CCQ5dYGjosN8kUJqmNBJNp1bAqYj5PpZK05/KsLvepckQSNByx7Sudzy/c
         WdEZdFxdwGc+A5MLFeYCHdhubq47N859NV49v6uIQYU5WqAVABTnoiq2pF4PQ4ZmUumk
         No0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=he4FzNRAucaPCOV3nL7YNHnDOBFniHWFKVZyhdHNRpg=;
        b=MnH9sQ360Fu57/VCuLE3CgTnWBnnKtwlJItmQiVO/xmt9UKJjzIDXwOuAWoyBMOcMK
         YmJ9ZKtaLha8bvYhkT7uwy2zHX+WPtUnrBXrvIiIIxdbBxG728wAKNG2Y6cUayBG+HRi
         7EnG5QovOJmPsvqrLMAs4jKEZle2PxY+0PwaP2KaTRbxiN2OvQbx4uFtmfoZcuhR3CZG
         rH1THqY+xRqIZAWA9Yx8yN5VmfkJLA1IPmiK0tcu4QjveXzekzNnYQgef3qaqGJf1Ilw
         wQEfOYsr+iBtR9qliRS+gQvrzrmbnDE8xGHx3mzFRKreECAwWlC+H4RncvGnKUSBs0IH
         YARA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kosbcWbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az18-20020a05620a171200b006fed78dd8f1si10856228qkb.83.2023.02.20.10.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 10:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kosbcWbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUBFW-0005l4-79; Mon, 20 Feb 2023 13:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEr-0005F1-0f
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:50:14 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEn-00067S-Qh
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 13:50:12 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h14so2677143plf.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=he4FzNRAucaPCOV3nL7YNHnDOBFniHWFKVZyhdHNRpg=;
 b=kosbcWbWmHj/EJ3keID86oLwprdXfD72YxlPDVjDYoz2pUdiGduev3++85rBJwCf81
 BynMK2+kpQkNwtcAfohqYHj7SuWwomlZOvFTfFMWDjLO6nDefNUw4tcxM3oeiZql/xYc
 3cyKeUL8piTb6hoQ57Yq9Ygw2xlQEvlYRlLcrhyGuT8AlDRWskc1AGeZIoQk5/aD5Msr
 DLsmOw5RPNCtTKUMsAsZaJ8lpJ7gBk4d/gPaKyOPYDu5fHOuEDtEahMbI57GENICmenz
 BCcXEOGgs6D45E7FnsnHtR64bC4kZyu/FSo4Fo24b/5K3Dg2XbHXYd4GtADCAuxm+6MR
 ixOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=he4FzNRAucaPCOV3nL7YNHnDOBFniHWFKVZyhdHNRpg=;
 b=KVrd2rV3mGOMku7dZegb4sBb9N1zr4yIwO97CWalyYWjhuEJDzAjcYvguARwqxX7YO
 LunhOkqBWTnY16SSbDtnAWOiecYHaG71W7L8ATMlxIwcbYxgpyr8scQt1othcprXcn2q
 V2ThR6g5bw/hMlbqaYPSkDXq6inZXf0LMOvXnYKKcLL7mVRXBRKhpcPj1RIGmrWGlxTF
 wifRKqSqf/khoGJyGPBkqZ88gvRaYbcWVAvyRT1vVagutD3UN+p/dI24PqMzKwsmgGQW
 2EgC7olnbl5Atg+RcCdWowbLhjdrwhR5qK5T7XfRIOAD4KJIxn+qzX4c95gQ08EqY7GM
 X9sQ==
X-Gm-Message-State: AO0yUKXR+/UR+PeRrM/sydYOehEif1YrceO1R39OXaJVKR/scbw5vr52
 sdgndRgNCLy/T9nSOoVQl444Ww==
X-Received: by 2002:a17:902:c941:b0:196:2b0d:feb7 with SMTP id
 i1-20020a170902c94100b001962b0dfeb7mr4971509pla.13.1676919008272; 
 Mon, 20 Feb 2023 10:50:08 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b0019a7bb18f98sm1313578plp.48.2023.02.20.10.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:50:07 -0800 (PST)
Message-ID: <0c0076ac-e82f-193b-cbd3-b77f52b082fa@linaro.org>
Date: Mon, 20 Feb 2023 08:50:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: Qp2qyRPJ8iJj

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> pl011_create() is only used in DeviceRealize handlers,
> not a hot-path. Inlining is not justified.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/char/pl011.c         | 17 +++++++++++++++++
>   include/hw/char/pl011.h | 19 +------------------
>   2 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
