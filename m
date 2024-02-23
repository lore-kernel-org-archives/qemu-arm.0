Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp525755ejf;
        Fri, 23 Feb 2024 04:27:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFY+xG0AJQ5lvMkJsPAK0Y08lTAglL13SVCetoEI+UqOgjD8u4jBun+U24G6e7ERnO2LcEz1J5ba/B1/gzKMQdo5T3YA5t
X-Google-Smtp-Source: AGHT+IElRk6z0+YK1oMHx37LOFMUnEwmwXkN5XcP64GYbIE+teEeI6CMynSUQBJNh2omqwoxKUIV
X-Received: by 2002:a05:622a:1056:b0:42e:5a82:2956 with SMTP id f22-20020a05622a105600b0042e5a822956mr2482889qte.33.1708691241529;
        Fri, 23 Feb 2024 04:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708691241; cv=none;
        d=google.com; s=arc-20160816;
        b=TDCGx+xiJ0KlVwan6VlIZ8tEhdLr6gNWRXobT2/UIMHjLOZPbYbguBW05LIKjykpuf
         fklcuIIGbg1/GHaGCAac0NJk5ZYpzUCH3ZBpmS9A4l2rFYgUPCc0LTdDynXUHUXMdVr2
         i1cZ90xfQCx93giPm0heH2tyD4Wp7e5OaqH9kCRHIiT8/VsF03Ex0Gi3tjpa5WivapJg
         nPGs9ElIMcV6AVSc/DKbzt/zNzOd/kbZz3qauTE5BzRlyAajUySyIPvu1ynxxG+BZfmX
         YiSkkCM9HgJVfR32J0JceS1q99K7kVr+6F3FBVCXAVd4xU5xCDKC8oZ3GknTwcjhuwMx
         Yj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=idKcpIcniaL8IAn26qKaZe0/gBqZXOItKcX8UBMnGYY=;
        fh=NzHT1zli0NSjL1HfuceSHymolyCFY2nEd3hPf6oVDX4=;
        b=jG91xRKEyIclaq3+n4Oa0gxQ+GKnw5pQHI/kcLv1TKWuHMFJBYRagr3/mVRUlc3qGe
         VrT54lQNh6ZVriOCG4Dzh/mdaYhieu7Q1nOQGdCJcA7XTcs5wL2wiffS35WUUpEA9Lji
         mXKdP8ou/6Z2Kxa1C7rAnOfz3biWQpNXfap0L4rBCxOl+UaPiukLz0ov0nma7KBvIxc4
         DdjKJDz7wfE5Htdpa66ZiAffIMvZcXR3jN3A/UgEGtEhJdrsf2d87TKNXfKipe7TtC5j
         OKMVg942qX/aRDRqpQSVuz9KyuFcGXU0r9gaaG8QI9G9kz0YTMUAP5MQz6L24p90waCR
         Wz/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMCfVHgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac843d5000000b0042e165bf5fbsi9855699qtn.724.2024.02.23.04.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 04:27:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMCfVHgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdUdz-0003mz-8m; Fri, 23 Feb 2024 07:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdUd7-0000x0-4g
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 07:26:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdUd4-0000iH-BO
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 07:26:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41276a43dc3so5610895e9.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708691172; x=1709295972; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=idKcpIcniaL8IAn26qKaZe0/gBqZXOItKcX8UBMnGYY=;
 b=eMCfVHgZr6CMQ92pKVaJzLYxK3/CQUfj9Wbi5zkO57bwsTW/DhlfAX/vmXRXZ67pX2
 zSrNuQjFbefJfV+++fyZFjLkgTimO3y49WoBxbBL6GCbp0ZAdAKtJh5rPafVNB6fuIh7
 zULYQD2S0pHd71B1hecgyLgrWA0D+Y1ae01I8oIRiinzF87Rs6SFAaok8Ubbt9ivvEaL
 odG6V6SknD0g7N+ABok4RfRhh1EwaS+cBRx7oKDBTStGw6z3pPDwocpZ9A8AKLJy6GE0
 2KpgIwd6Xu7IvaeZz6yAeHs06/AiTTpJRpDeMW5ll4XZ+hlARdAtxHXZFPfCp1DeL78A
 oTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708691172; x=1709295972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=idKcpIcniaL8IAn26qKaZe0/gBqZXOItKcX8UBMnGYY=;
 b=p4yqPtx3Mob2s6kNnD0JSPEIxlzmjlkqPLZNPbielKCkXBZtKPCQHL1+/ypxKfhNjM
 slT6KbrcCs4QRxgvCqlQ6qobgMIG7sslGYg6hWr7em8qROKi+5mTd7T2ri1EPAbIoxnP
 K82o0KqQq7SGVVNC7ErLrJXfNZs5ezEe0SD/krNsFa4TBSNGMTqWhHTYjQePBig8N+0i
 MKazL9sG5sE2U9dj3Qx6Ez+igpHI0NjQ3103bZ9GZH0ABn/4a4tO/kvJMgbH3SYFjh5P
 s4LydFde64arHmUPwnaRpfoidxp+LQZhpyteRrkKfZPn6PQ2nWhBHgU+2KdJIhQIww0o
 3xuA==
X-Gm-Message-State: AOJu0YwtcoXCK6wpIYi84PDySC8uSlxpcebGCLXtRJAFVH53gwajg4Ls
 NPvX21IMY8MIJDoTtuhurg0gc9gAVix+lQGppK6xpA20wGVInnRTyX+PsmuY2x8=
X-Received: by 2002:a5d:4203:0:b0:33d:a011:ae42 with SMTP id
 n3-20020a5d4203000000b0033da011ae42mr1282215wrq.38.1708691172532; 
 Fri, 23 Feb 2024 04:26:12 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4b0b000000b0033d90b314e7sm2631441wrq.101.2024.02.23.04.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 04:26:11 -0800 (PST)
Message-ID: <1a71aa6a-0fe0-4407-a2f3-3fb9bacaed8c@linaro.org>
Date: Fri, 23 Feb 2024 13:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] tests/qtest: Add STM32L4x5 GPIO QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
References: <20240207132517.198348-1-ines.varhol@telecom-paris.fr>
 <20240207132517.198348-4-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240207132517.198348-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: tTPMTxZmTBjC

On 7/2/24 14:23, Inès Varhol wrote:
> The testcase contains :
> - `test_idr_reset_value()` :
> Checks the reset values of MODER, OTYPER, PUPDR, ODR and IDR.
> - `test_gpio_output_mode()` :
> Checks that writing a bit in register ODR results in the corresponding
> pin rising or lowering, if this pin is configured in output mode.
> - `test_gpio_input_mode()` :
> Checks that a input pin set high or low externally results
> in the pin rising and lowering.
> - `test_pull_up_pull_down()` :
> Checks that a floating pin in pull-up/down mode is actually high/down.
> - `test_push_pull()` :
> Checks that a pin set externally is disconnected when configured in
> push-pull output mode, and can't be set externally while in this mode.
> - `test_open_drain()` :
> Checks that a pin set externally high is disconnected when configured
> in open-drain output mode, and can't be set high while in this mode.
> - `test_bsrr_brr()` :
> Checks that writing to BSRR and BRR has the desired result in ODR.
> - `test_clock_enable()` :
> Checks that GPIO clock is at the right frequency after enabling it.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/stm32l4x5_gpio-test.c | 586 ++++++++++++++++++++++++++++++
>   tests/qtest/meson.build           |   3 +-
>   2 files changed, 588 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/stm32l4x5_gpio-test.c

LGTM!
