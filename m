Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3320302ejc;
        Wed, 15 Nov 2023 23:52:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4bYlCkaU7rryAcEDz8sr1DBNiAl4peuxVIMliqGyR3QqVsgOMWGlv8k8MPUyBCXrkpPuH
X-Received: by 2002:a25:db0c:0:b0:d81:97c:c016 with SMTP id g12-20020a25db0c000000b00d81097cc016mr15207404ybf.15.1700121125117;
        Wed, 15 Nov 2023 23:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700121125; cv=none;
        d=google.com; s=arc-20160816;
        b=Dax5aV67HF8RT9xRKcNfwCX7DPGnZuCKHS+6+p9fIU/qeQ2zrNh/scQnRYYsnJVTsi
         GWRJ7NO3QM+kErBus6PNVeleMoEHfYATip/5xVwwmHKsWobsgeP7U8Gx20KPLEwjT6Om
         Ani9P66S5SikXYryaYkMChC9a4r4x+nrAuO1wJ6HBXoEvLmy3QfqNEFeaUYFLFONBSVz
         egrvwUkQgH+7fUMjXUPgzRRERDcOz/eSbwGpLRtKpTTBIKfDIJtYOW1sM55SZPyK+i21
         ZW1/7iTzhuPg7h/ZPSpM5AV6EaPXClNk0tIZ9fkekV958op1X33q7jUcgcThA1s59VRj
         rYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fGPIIo+oWgUbTH02UBSRyk9mwsyIl/36Lb2JEBEbS7Y=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=ln5N87UWHEOnfP1LM1ZmTr+33qAHXzqhaexFgYWUoH+Ch+QQ+ZgasH5NoamoUEfXqx
         /V/HXccn/eIaPAXMh8mJ/HAzVZB4/R7C1NscnDjjEYyPiskOVyeCfd2QbkTCUCJEbSTR
         rpFTHlSwmNNv2q4BNo9fSfcCW6WaqKqOxXTLG+oPL/ANMxtebLngroS+4c+ZCnz9bzpq
         mU1QoLoUey4GsKC/HjaH3OQgQtLvA3BtlTOGRrsI5Atu2DW4hzai1jONSAehWvh8W9dY
         I0XdBwQJJi62hj24pThJQL7hrnA0q5Ju6iOoBpEMQvFjirh1dv9yUB8jw0MktG5NhAQF
         qP1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbaH0u6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a0ce609000000b0064b78e57cf8si10921732qvm.38.2023.11.15.23.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nbaH0u6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3XAF-0001ky-PQ; Thu, 16 Nov 2023 02:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAC-0001cD-0N
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:51:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XA9-0000gx-6Y
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:51:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32f7c80ab33so360701f8f.0
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121104; x=1700725904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGPIIo+oWgUbTH02UBSRyk9mwsyIl/36Lb2JEBEbS7Y=;
 b=nbaH0u6a19VXMxC2NNTg9W5+SM+go8s8spLW/LOqqnPgdVwNwgIDk1iipArc2MSGFf
 CjmHyMTMa94gsJTJqX3IGNKbJ6ENUWaIYqzJC9gOLtEb9z8yZKVDRN0Nkwyz1BBYnQ9a
 dow3S3yXggP6T9hP/Ul0yM4aDpZ21/KR7opE01ZxWa4gbpggfRRKcUhhNs10I3GbKWu5
 LTYt1i1WsPZQQSRujSyWpqHH0vTGydIAJBiq1ze0o4BU3afWSbp+t8WHnyKCeOkGZFwu
 SF0FtqU9SYvhqCNaP7TteWAQ0tqpGqgBN+aVgRMC7OFYMcTWr368sHA9vu7NRJXxr+/t
 MyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121104; x=1700725904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGPIIo+oWgUbTH02UBSRyk9mwsyIl/36Lb2JEBEbS7Y=;
 b=WB5jEtYGNGsjM/TkK/7ouYpVejUx6xiAnH34VINJHZFWWcBaFZk43V3pabBpIm9UjW
 lqDIuqUKJ8WBjtyr+woDyR+5+Fy1wZFe3HGutCOPnNQdRXaQQYX3afcWpA8TR68BEm+P
 SPZqaHdQntgnzILDVKi6DjV6ctKB2BxZ0P2M2oS0LKSMyRMXLDLDJ+fn9UpzpZ8Q+jye
 VRVln6OHFFubfcCvfJFlr0vmcnLrnGq8z/8Qt6QsVKeb8ecNQDc9ThN5OexbRydqvBZ5
 FN4smtdQEhlpch67LQA7Sa/253oqpcWcAmG5njd3I9j43nYOCwB+ZljOTXFO4PJCcXAm
 qtMA==
X-Gm-Message-State: AOJu0YzyuFv6O0pE2OWtBH/22iXz97seWtxvKraVE1znmIpTSyygigKX
 Y8ihx1o+YgDNaaN8eCEu68qPSw==
X-Received: by 2002:adf:e685:0:b0:32d:9541:b1e3 with SMTP id
 r5-20020adfe685000000b0032d9541b1e3mr8930365wrm.26.1700121103683; 
 Wed, 15 Nov 2023 23:51:43 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:51:43 -0800 (PST)
Message-ID: <1ade7285-7f0b-406e-9d8f-8386da038087@linaro.org>
Date: Thu, 16 Nov 2023 08:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/31] target/arm: Use generic cpu_list()
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
 <20231114235628.534334-9-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-9-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: muFl+bjjoNZt

On 15/11/23 00:56, Gavin Shan wrote:
> No changes of the output from the following command before and
> after it's applied.
> 
> [gshan@gshan q]$ ./build/qemu-system-aarch64 -cpu ?
> Available CPUs:
>    a64fx
>    arm1026
>    arm1136
>    arm1136-r2
>    arm1176
>    arm11mpcore
>    arm926
>    arm946
>    cortex-a15
>    cortex-a35
>    cortex-a53
>    cortex-a55
>    cortex-a57
>    cortex-a7
>    cortex-a710
>    cortex-a72
>    cortex-a76
>    cortex-a8
>    cortex-a9
>    cortex-m0
>    cortex-m3
>    cortex-m33
>    cortex-m4
>    cortex-m55
>    cortex-m7
>    cortex-r5
>    cortex-r52
>    cortex-r5f
>    max
>    neoverse-n1
>    neoverse-n2
>    neoverse-v1
>    pxa250
>    pxa255
>    pxa260
>    pxa261
>    pxa262
>    pxa270-a0
>    pxa270-a1
>    pxa270
>    pxa270-b0
>    pxa270-b1
>    pxa270-c0
>    pxa270-c5
>    sa1100
>    sa1110
>    ti925t
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/cpu.h    |  3 ---
>   target/arm/helper.c | 46 ---------------------------------------------
>   2 files changed, 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

