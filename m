Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp292265eju;
        Thu, 4 Apr 2024 07:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ2fyW7p1zlon0jSS3zK9zeRmFnlma4kcyPXDOkNHlk4x2XD+4JUQ0Ssf1bWaSshRpbLIyrJPKyS0brux+5euyiLhYhj4S
X-Google-Smtp-Source: AGHT+IHLKEcKje8REIAC2R0916d595uGj8VO2EVQuKuW3AdRTt5rVGwkmblfe53uJHx6BWqfY6bU
X-Received: by 2002:a05:6214:2122:b0:699:17ec:48f5 with SMTP id r2-20020a056214212200b0069917ec48f5mr3360403qvc.48.1712240510014;
        Thu, 04 Apr 2024 07:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240510; cv=none;
        d=google.com; s=arc-20160816;
        b=m1TGboEM42QwLMOUy31edAl0N2CHgPtqMeWpbvOoxB34EAwCUwn90ET8sPQlDHk82r
         cXnIMMNytXsN9NpBRLvJJR3n8Glv8LaOYXG9lMWRXmg8jQqKkvc3d9NgfvezNGwXTVfz
         Zht5HlAZkm9xoP5k8HeNb6M6yegQs4yWSbo+wNXl/+FTWQpj1LaHbPsv+1Zvn2+3x6dZ
         ZlmfXOMU0AWqPzfZacwgDEEIQHmo/mx/loXIt2wzFpvqULPZyfMTNqA3Fsj6OdajMds/
         7oTTXGjBladzJrDFgTHRtFEgIdWcKUcVudjmf/3STuX/PIyLCJFXN+rQ+/Gog9sWDRFq
         ZZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WO/NuWFFNyzaoF4v9nBBIhI6WakE7Vuqi8ZmgoCCCls=;
        fh=8mHoixTMMGWUc4/M2GnryTeVKfg2frJasoZIlafTovU=;
        b=W78weoTsIWM54ADtziA9cVdttyBSWjO+QWpqT2GbPmAneK6P0BuGki+QymS2R45u+F
         zPsKHJ26izqJ8mZp1+O3yc2ytki2rD//R0H97I//OmIsV1SQaaAz+7/GVJTJmXpuuMrC
         r0p3lZLguVnWWCNdxnjoGCIEKG19qmK0F37EjkNa8FM3gcV+Ii0Mrvn8cyIASvOr7vex
         Ecq668fCxh4wvdinUwtD/2t6saYwx6NcBs0q32WREjmoZLz0iRMLKedbFKsFgnLjvout
         ZnXz/+JSYUKpcjbjbSdxdxNSTtcr9JLhYmQ1UBfBocBkZgwbNDZUm9mfsxnHAlR7E2c3
         iCJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOceKg33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a056214070800b0068cbacd748fsi16549074qvz.520.2024.04.04.07.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOceKg33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNyB-00028k-07; Thu, 04 Apr 2024 10:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNy9-000206-Bn
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:21:33 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNy7-0003Ox-OA
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:21:33 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516bf5a145aso1312346e87.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240488; x=1712845288; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WO/NuWFFNyzaoF4v9nBBIhI6WakE7Vuqi8ZmgoCCCls=;
 b=gOceKg33C8uJvx3+Fe6H7BOFSE+behkAdNYO6Q1G6kIK7fdJiQdj5209nFwW+MA5ru
 Vu6J2MdR14eaZLKaIzobyjy1FBvVxk/HJa82sVjK9aLo0VOTaMF1yUjMbuHWL6rkWkmw
 HcU0Bl3cjqhifzjEuaUYrl8wm4aR/sQ4Y86meLwGHJSPikC9KvsJrbbTRix2BGySEKip
 6jEKg3Hmlp46/OmwH3BkwNTqIfScFfiUIzOsZEUl26DX/kp7CCoLMbsjXJvPO3INZ7mG
 9INkt3o+weDQV+VC4Bi5TCZTyt8P8px9jywWyxkRvj5iBozw83FMJnKKEMtZToM1h4Qp
 qYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240488; x=1712845288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WO/NuWFFNyzaoF4v9nBBIhI6WakE7Vuqi8ZmgoCCCls=;
 b=GzZ4jT1R9rYiIp5/sTxXO/keQcuCwPXfFYXCieWBnhE/kwJbW4GAbxhBIYr3q4hz12
 e6XQfqEVeCIjy5krs9jOiBRnfjWcIumUTGr1RB1YExLO+DJDcr7dPv79bC/u+ony+YB7
 Gh7xWwfLZ/xXFvrL2GqkIWRWto2LZuOdGI7GVqWYwgkRwrOco0+6ngq6gNMpinsineWU
 OglmDOWtKeP35uJ4EM8uDcDr365gW8JWIJRcGzO4x0lcwr2+c1NumFY2tAiEi3DVcmGj
 aVy5y2JJcn9YrQz2/gyCDLpoYrdgbFN6O2fgk7Z9hEpbn3bPpqsrrSAIIwTNee6rLz71
 BCZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUht6hwa2qaecQoz60Lzl6AeK7a5juUTIEqsKBWo4W0sM58bKnalX3UzEl2ZjypPL1TY2PoLYnxTY+vr8e9/Vl+OAb+
X-Gm-Message-State: AOJu0Ywyg4k04zCI56FchQCckOkMz44H81GU/DGeKKuMqQ2gUPuohMtz
 Ko+Y+H++len5Z7EsJRoicnZEcKkH0UgTqOl3JfRHtaMmS3cbZGjlKD8dXj+96N3MhxIYxDVt6W1
 dCyvAWNL64bmuxfw+IyB04r65Z5OVRwNsikQ7Xg==
X-Received: by 2002:a19:640a:0:b0:516:a77a:9a7b with SMTP id
 y10-20020a19640a000000b00516a77a9a7bmr1760127lfb.52.1712240488290; Thu, 04
 Apr 2024 07:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-13-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-13-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:21:17 +0100
Message-ID: <CAFEAcA816o+7mUCKXPUf2akejw-MPP_N9PgBQWiHL4ZNRkqYqQ@mail.gmail.com>
Subject: Re: [PATCH v12 12/23] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: JIfiA8efqTvw

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
> with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
> behave like IRQ. And VINMI(vIRQ with Superpriority) can be raised from the
> GIC or come from the hcrx_el2.HCRX_VINMI bit, VFNMI(vFIQ with Superpriority)
> come from the hcrx_el2.HCRX_VFNMI bit.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
