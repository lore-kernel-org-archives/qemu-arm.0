Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3594475ejc;
        Thu, 16 Nov 2023 08:08:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqh48BGFHX59GC5QxnYVbbiLUwBo6RayfZV2vFVPr+Ou5axq3XFOXX12vSg6XnMbY36yx9
X-Received: by 2002:a67:a642:0:b0:45f:66ab:f757 with SMTP id r2-20020a67a642000000b0045f66abf757mr15781199vsh.6.1700150936636;
        Thu, 16 Nov 2023 08:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700150936; cv=none;
        d=google.com; s=arc-20160816;
        b=0a6ZsSKc1rltD6ma4ppFeFwFiRAolZZIqypCRHmbo2hnyzU9HzaXdga+oWzfeq7dEl
         +999ShkUxUZ+BmCO9CCR1WdBXmBQTK08YrSCCVD8T5BM4X7VjOQc3dIxlE+MSJh0Lvum
         s/bBLbCdD7txkbFlkp6XUlpteOnuDD51P5p79KiLcRJ7rK/cL9hwhrbHfdbkWjeKIIIj
         EwmrXswhgOsrWJ+tin0Y+bEKwXWOEK0VeE5VEsKQUHLk4cPY3kFnOrW2bKVj1RIzQrQJ
         IvCIak8aIQi6i7E2pkqp2XEWa5b1lSYtIz/+hJOB/oKFfRpGWX3vt2Mgooe0WBPUywko
         pfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Bbt3Z6ihV8TA3zjJcKpw5cDUTO6AlSytICD8fk5xQeQ=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=OHCPcPe9UGagma2e1ygRkkvvJ6ofcXIq9SyY/Bfa7cvOZdJxu4UPmyLDjDTcq4KnLj
         HD7cm7qCePSQFiyPQYmFhKg28Etbdga29HJ9FurVBv0Q7bOWIeRpJSK091s8m3I3C311
         o7pPvdlvso2wcW5mf/+ullnjAvzxwSdF/vDf5zMw8yBtLXq5emI/qTPXbIUBSp8nJqp1
         8ffxU+AS1ii6hJf4VxSHSKz8doZJpnw3LTei0I2aGrMvy6vs7rnbB3K3BYnebya4RE5Y
         lgJAnPsOruEpHIOrkNbvFryFtzp9KKJUhuYdKH2qT91dvJHAn9VnqM4vtBOVEJux/DYr
         xZXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gc03RLAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s27-20020a056102109b00b00452d9b2fd79si1813895vsr.54.2023.11.16.08.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 08:08:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gc03RLAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3euk-0007hU-Vv; Thu, 16 Nov 2023 11:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3euj-0007gy-Mz
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:08:21 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3euf-0001A9-Qi
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:08:21 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso12952181fa.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 08:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700150896; x=1700755696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bbt3Z6ihV8TA3zjJcKpw5cDUTO6AlSytICD8fk5xQeQ=;
 b=gc03RLABEXrarFnZ8LA+RJWLFtbQkEAzccCL8lAXTPPJ/H8A3kMXDguc9z9Z4dijLf
 kbEcC2s/Bkj0bJDgXWeCRJaZKxrQwmFhk0NTvGIxscaKXxH9uzGTDscFJsMxDTk9V2Qf
 ZwqI0FRl36nJKq4/VY6dzIrCa1Cmu0/GQyT7nRzOy0kDe1F9ycWBQ5B9hacUF7sMAUvV
 nVOjIBwzMJdn+ZnD3Sks0tY76UQBLiCjhiGq5OgYkPaCui0T/a8Cjkm12llRDxVinl2E
 ZRDeO52QdnNqla528gxvh4SMvM+bqf7BZlPnXBkqK7zyshhh9M1YN1AppBCtTNs0veeb
 Jgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700150896; x=1700755696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bbt3Z6ihV8TA3zjJcKpw5cDUTO6AlSytICD8fk5xQeQ=;
 b=U7/XUYdnp3sU0AIIxFn+7bwhAudKsBO8RxEguvjQ8JYoVo8jOinKdvam90jHoicXBj
 OTm8Ywn9nHvKz5nwddCjd+znTwijs/K1quQpZkybCtGlPQNKzDO2EAU/SgwDWqlUpbBF
 kLn6c0xm4HDmBM3II5av7bpd6U5mOkAIaJmxjP9fVX3S5OklkS+nh5r9woFnjtGacqbC
 BTKf/N0hjRKryTc8FvXhRDkY1Q5nyBLK28igCLFXum5zouip1UB3PqDtbGal8PGsblr7
 8/08uENtvYv83bo+NadXMT7g/tpncdkSxXsJtlSBwLQDY5s0ApFhQOM/VvViSNeIQS4E
 WeHg==
X-Gm-Message-State: AOJu0YyDeTU4YwXccksdx5ui27ARB94i1Ai2Ts2+UiP4kWDwpt7kuGZw
 NwTkB0whr+fY8qEwIdt4Avqe1A==
X-Received: by 2002:a05:651c:1422:b0:2c6:eb44:2e12 with SMTP id
 u34-20020a05651c142200b002c6eb442e12mr6895205lje.43.1700150895898; 
 Thu, 16 Nov 2023 08:08:15 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 az23-20020a05600c601700b004054dcbf92asm4353398wmb.20.2023.11.16.08.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 08:08:15 -0800 (PST)
Message-ID: <d7a80e9e-9ffd-476c-ac98-a92838e11b5e@linaro.org>
Date: Thu, 16 Nov 2023 17:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/31] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-4-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
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
X-TUID: dj9qHQh28DLz

On 15/11/23 00:56, Gavin Shan wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> For all targets, the CPU class returned from CPUClass::class_by_name()
> and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
> compatible. Lets apply the check in cpu_class_by_name() for once,
> instead of having the check in CPUClass::class_by_name() for individual
> target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Gavin, this patch is missing your S-o-b tag. Do you mind responding to
this email with it? Thanks!

> ---
>   hw/core/cpu-common.c   | 8 +++++---
>   target/alpha/cpu.c     | 3 ---
>   target/arm/cpu.c       | 4 +---
>   target/avr/cpu.c       | 8 +-------
>   target/cris/cpu.c      | 4 +---
>   target/hexagon/cpu.c   | 4 +---
>   target/hppa/cpu.c      | 7 +------
>   target/loongarch/cpu.c | 8 +-------
>   target/m68k/cpu.c      | 4 +---
>   target/openrisc/cpu.c  | 4 +---
>   target/riscv/cpu.c     | 4 +---
>   target/tricore/cpu.c   | 4 +---
>   target/xtensa/cpu.c    | 4 +---
>   13 files changed, 16 insertions(+), 50 deletions(-)

