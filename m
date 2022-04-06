Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp717419lfu;
        Wed, 6 Apr 2022 06:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGIYS99ukuDWcp02g+C9neAim+eupoj4xqIWo8rxYlw+M0+4ddPWmM0skEFf8A/k14uH2W
X-Received: by 2002:a05:622a:286:b0:2e2:2b3a:3a07 with SMTP id z6-20020a05622a028600b002e22b3a3a07mr7407109qtw.411.1649253581272;
        Wed, 06 Apr 2022 06:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253581; cv=none;
        d=google.com; s=arc-20160816;
        b=YU9yW/jFfLRMIDFAOSGmCSqgIAyGQES42stwq2uRA8mSNPXo6t+DaK16atkRUkIl7e
         TaZWdzlR4Eq3F7dsYTGiyqe60mYM0h254FMhi0IJKPgspl6LYvLWNs0yUbo3PEWjeh1I
         VqjGx1NdgUpgDivQ+gGyJq/FaH8+aDOzN/LoYIjE1eq+AVcogIi8+tM+faoZNhPV54qq
         dmYV0pVgAS7lkZjxHDGvNEAE9epQo6XOcgKW3z3+JpwgXZKSPP2OTMUq219FdPXGPBUz
         V1en2qXtyWbAJ2vq1HIhk7T1RE2LCnboCSPHRgttY9zYZh2cE/7VVm9PQQemKOxKn96R
         wfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kR+sb7Bzfk81CyMsarmweyEXaK52EOlbciCPmWsKVtA=;
        b=rk/hrH4N6Qu+2iVnPUG5SMReuJkrIbRA0xcUC/IWSO7bY/i0MplvKtEzsibuoEPetZ
         DDFL2YOXox7Ue5kJckOMIe7y/SqPS/5ILBM5sNiP6p4xO5xJF7kzmQduGFZrwKSH888X
         aBIjj9aqL8v8VI4Ed0NqNWaY3XC+JMm6AbbdbwF8WdxJVUN4PoftGIDTqCmLgfHyhI9l
         x60MqG5u8dypjLL3W4h6DjYwkAma7Q+oWQR3dqGdk8Y4ld9xSUCWcYm+07NwQXLXh/J6
         lC76t2hLqmb13ZF59SILCCtGDq/k4gjOPZvxXsdXoYxu7y7IFOrV5Dadf/sxzT7Pc5s+
         bSXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEPmn4HK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a66-20020a379845000000b0067e4be23a34si6262119qke.633.2022.04.06.06.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEPmn4HK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6CC-0008W6-NC
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Ao-0006iy-39
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:58:14 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Am-00053n-LU
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:58:13 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so1731603otq.13
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kR+sb7Bzfk81CyMsarmweyEXaK52EOlbciCPmWsKVtA=;
 b=yEPmn4HKT6+AJItC1BrCDf3T1++tqJeyH1PdajkjfpaYSUOcee+Y271FemlxTxJMQw
 NqJqfcugGpwCKi4/CHBUahYum9HhF3Z/9z2Xs7FYKolixeUl/ST/2A9ZylH7CgaFIolo
 sUEAqmmz7WLesvGT+bIrpaxDjXt/KssR/foViCPhOi8rfjAtnrEH5Av6MRxvOz3osZ85
 IcEpvYY2SrapH4dyPYBMc9F69gJL9Llu55ek4rwPOSG7XtESeeCjLpMFXM4LYc1l1kfD
 suO3mr7eQMcTzCJhrPlmFBDhAtsmFkI0wtVayeZ1v8K6Q8nnBqI4rnRawWWcikcTiRQh
 VkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kR+sb7Bzfk81CyMsarmweyEXaK52EOlbciCPmWsKVtA=;
 b=fGrjPWTB4wvTAnVu1tWSfCf1A0cqvBaJXXiUZh3FPjeWUFA0Evqh61kp5hj/3D0PQ8
 VaHAG5NfPLBjGgZW3RIAtu6RbvFGNGXK4yMOWUQEXt9b0WY1piUh8yeE3tTBbCsgWxu7
 frq0WGrG482eC4GNKRyctGuTjAZgOQ+AwRAbdw2cmxBvSBBWXuDjctotqdDXfIGe8q05
 JFl/z17LNOTNQ5fXLT7YlLY58lXCYnH+4PtwFjxMNi9xyrHY29jCTi8b+b6VJw3vo9ah
 QCWFc/heg9oW+JNePU84qpcll+XXrnDDrgb36H38mkYyvnkOqg/9PUR6nhrVCkFxIK8M
 wgYw==
X-Gm-Message-State: AOAM530mvBbveF7YtGHtMCBGsEEEYFI1nhV/RXQbjmmByMXGz8EnDx/H
 w1h60SVG7KQi+4/y9oUjDPH6BQ==
X-Received: by 2002:a9d:4702:0:b0:5cd:481a:148a with SMTP id
 a2-20020a9d4702000000b005cd481a148amr3079780otf.200.1649253491390; 
 Wed, 06 Apr 2022 06:58:11 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 123-20020a4a0181000000b00324a1217e96sm6236959oor.35.2022.04.06.06.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:58:09 -0700 (PDT)
Message-ID: <cf3668fe-f5ab-716c-0df9-3cc3507e9245@linaro.org>
Date: Wed, 6 Apr 2022 08:58:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 14/18] hw/arm/exynos4210: Connect MCT_G0 and
 MCT_G1 to both combiners
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eNL9pB83qz2U

On 4/4/22 10:46, Peter Maydell wrote:
> Currently for the interrupts MCT_G0 and MCT_G1 which are
> the only ones in the input range of the external combiner
> and which are also wired to the external GIC, we connect
> them only to the internal combiner and the external GIC.
> This seems likely to be a bug, as all other interrupts
> which are in the input range of both combiners are
> connected to both combiners. (The fact that the code in
> exynos4210_combiner_get_gpioin() is also trying to wire
> up these inputs on both combiners also suggests this.)
> 
> Wire these interrupts up to both combiners, like the rest.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/exynos4210.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
