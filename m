Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp93068ejo;
        Thu, 4 Jan 2024 05:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGBCw5w2CGS48eEYhUK4Sl4huiK/4EnuZ8tkKQjOX+9IK7e9Dd8r4UBnKMqTNsKTxs5L6m
X-Received: by 2002:a05:620a:4913:b0:781:5c19:cfd with SMTP id vy19-20020a05620a491300b007815c190cfdmr776926qkn.68.1704376106088;
        Thu, 04 Jan 2024 05:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704376106; cv=none;
        d=google.com; s=arc-20160816;
        b=u/ZrYXNGeeW0axoX3BR7mu94k357g1Ass/i4kHPtMGTkLot4Bl3uwwZ11ptUkv++MT
         TZHjEOI+/9XD0Wc7xHeGIMlVZGKQ58GwiOamDsWJ9V3YTBtmZ1zkfV9p/7W3EnNuWo6H
         ygOnxID+Eefcc1d/MW8JcjPgHfeqOyJD+I08EUHw+qOVBjP3Zp7oREQyL0hVmLpDSKqw
         +kV4vUWRkF/fthkvKzqZpuJ58dY7flSCBSjbYD6vlP6TttbBm2dzVFZ+kYhuRAe/2xYZ
         oOSND5e37MSzXdcuGhPuSPSgshTAOVPZQnbK90x6+4kMFf1ow3hNs9HqvFKl4IK8x5Zf
         gBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DliT4hOlGihAIrNhSmS13X+aX8dNM5Idvh0MCUHG4AQ=;
        fh=dY4KKxeGf1fwfbNlCvFauPZPsJuzoPPOBtr0NxdEvlk=;
        b=tEfxsJNuLemrorJOzjLKI74W2oeEKWXY6eBzVzz1Uy7xwRN0gITust1eu57DbhvILw
         ll2Rt/er29fjC65zBk3I/tObfrf3wkoLYxEdIkxeAiObj4lRdP5W0d38IOqGDIkylNP6
         x++GB3Ol7EzMTxGApLjqJBRKweavoyiODvpHYkbDp0aGTyOaGGG4sY6pvfSkSapjK2qg
         T/vImhJDVBxwxfLvEHtfa7HxQIY8IxSbyvwuRih6VEGPf96wP52xs59tV5y3wqkVFd9x
         ol91Z1oXJ5S8jRIDoPIJeciGu8jSOgGkIy+e67Y+nERPffxBujKwayay6j4rQebC5Zm8
         lNrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/7x7ekD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de20-20020a05620a371400b00781b580f371si10235876qkb.754.2024.01.04.05.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:48:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/7x7ekD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLO4p-0004M5-Vi; Thu, 04 Jan 2024 08:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLO4m-00048D-Nb
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:48:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLO4k-0003gH-4D
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:48:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso4778565e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704376075; x=1704980875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DliT4hOlGihAIrNhSmS13X+aX8dNM5Idvh0MCUHG4AQ=;
 b=U/7x7ekD4IYlwAimzMJdTnRlpbnjCDKl0RrsNE1lZJlJ3usKmC6jZQBdRmB+rTlQN3
 3lkW0zgdkis/xUt8hdorVnhkOw912MQ0vKRBRxv7/oI28EctXoEneoxqq9GSIJYajatV
 WKBy8s1GspD/F4yDDxPxUfB4Vi14oLar8e7duL646JTTzuahpcL4Kt8JkipEZioK1tW4
 3zrRmadKja/UCWWzf/kaAMLjfHJVKw9yvU2Rpag0qDcv+VrLrebNMogYVcnFtm6UjQzE
 eXmPfc/ZemP/EnejhCVdggqMpfA6/OG8nJSRuEhPJQqcOxV1hYD3GKPWYrttKIAOuTvx
 lhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704376075; x=1704980875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DliT4hOlGihAIrNhSmS13X+aX8dNM5Idvh0MCUHG4AQ=;
 b=fbTw49yeJ+H8ch5Dt4gynKwYLVcUtdUMe5U2G07WOgvVbPOKnnKV5KvLwxsw+IkVVm
 YAjidvN+YslY6laddUWiyxQTNqidrDWeybebzftAtyG7ykRLBMwjKB9iz5rPzzjN9xUJ
 Zvuqqz2zCs4LQjox6t755Pu78papGAGqxQFX+65u10Cz/Fh2yw/hmRwPFkNiuShisE4G
 EqEeOvos2vIXHwqPxUJvUWiEFkvOw5buuYDFoZ4yvaPalXfb+/YPqp1FkvqTjePKnFlH
 AM0q9jMQOkUzdmp3WbK6q/WG2ieWhTnUiquxH0LYmFqH5Vzdx5RR4Wv4Hp9IXvDAYb7O
 hnFA==
X-Gm-Message-State: AOJu0YxqVzy1j6JHt3rQOvfZ0vyJJ4zMSEl0dblb24cBpBcKpXv4lUml
 yoVkx6IX3uVc8jWVgs3uKUVxL5b6eHWBNw==
X-Received: by 2002:a05:600c:6b17:b0:40d:8587:a77f with SMTP id
 jn23-20020a05600c6b1700b0040d8587a77fmr384305wmb.90.1704376075348; 
 Thu, 04 Jan 2024 05:47:55 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b0040d5a5c523csm5820118wmq.1.2024.01.04.05.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:47:55 -0800 (PST)
Message-ID: <05df4322-0f91-4423-a065-9636fac7a005@linaro.org>
Date: Thu, 4 Jan 2024 14:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add device STM32L4x5 SYSCFG
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
References: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: c7/3lC4yAdVq

Hi Inès,

On 29/12/23 17:47, Inès Varhol wrote:

> Based-on: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
> ([PATCH v5 0/3] Add device STM32L4x5 EXTI)
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> 
> Inès Varhol (3):
>    hw/misc: Implement STM32L4x5 SYSCFG
>    tests/qtest: Add STM32L4x5 SYSCFG QTest testcase
>    hw/arm: Connect STM32L4x5 SYSCFG to STM32L4x5 SoC

Very good work!

In case that helps, I pushed my reviewed branch of your
series here:
https://gitlab.com/philmd/qemu/-/commits/review/stm32l4x5-v5/

Regards,

Phil.
