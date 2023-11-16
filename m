Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3321612ejc;
        Wed, 15 Nov 2023 23:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDmLN7JKijmKbK9AH3/PNFm7GqO/52r+yRapB1UyrGglWQhRjmacncsOP7xs0rH2DH2UkL
X-Received: by 2002:a05:622a:1750:b0:41c:bac1:6ad with SMTP id l16-20020a05622a175000b0041cbac106admr8111277qtk.18.1700121343300;
        Wed, 15 Nov 2023 23:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700121343; cv=none;
        d=google.com; s=arc-20160816;
        b=x9EpJvqvgpbephR9epvro3YLn1QSBDG6OPN+2SUDfp2Nqd6MLr3kSzwBIuA85VZBPc
         Mx3K0WhCvcoPRTs/kfb009isen6ftleGdDpWWpSxG6OvgMndOOX3acWyY7L49ttemHuI
         1S/HjSGVhxJf2nkMLoUWGhajdoYidQMo0EOdFL2CPfcSjo5SLikPvqmpj7+clLvpUM8f
         /7vfulUu+ibhNYbdz9JkNby4xDFdQ14srua+O/fI27Shs52TD2FJ1/AY1fc6I4GfT8oV
         CyQQvFA8QNklr4JlqQ5H2iBuQ2VfrnDV7frIlSIsDEEGfgPQPK+eAAWig1QpNF4kmnaT
         VwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eeAclw7QmKClKGXsAkhYu6vVMcQf+GGL62FWZwi1uU8=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=hwEbx4aAB3wiljQgHu+pSP0xOVSQlsVIqUJJVV2RDVBPxJNukIL5etO/zxFiQVyNMI
         Sw2KlFgu1vqUS9lmv5o4qTK/DrPusJRtNB5lbRZnJ/+7oGc40efsLiS6H7D2esV6x4cB
         nzr7QADg5phz7bgMTPVKopiawwfQF7tu7aEEnTJ7vH1808BmhjPYMvhftxxtrP0O7q4S
         GBrdsc3IqfkhRUxya0g0Ghp0CHgOePY8aYZt/FDdHbXaQznm7QtfPq5GbiTIH3wg2W76
         oXbQbYDg/qTApC+0Pw0pFQDBricpVuUe62AER4ixWFRlkLtagglrvJ1LEfTKg2NAETV2
         UPkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lpz5e+5S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020ac85fd3000000b0041819819519si10667024qta.694.2023.11.15.23.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lpz5e+5S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3XDr-0007rq-RY; Thu, 16 Nov 2023 02:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDr-0007qR-5P
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 02:55:35 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDo-0001o1-5n
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 02:55:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso3530035e9.2
 for <qemu-devel@nongnu.org>; Wed, 15 Nov 2023 23:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121330; x=1700726130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeAclw7QmKClKGXsAkhYu6vVMcQf+GGL62FWZwi1uU8=;
 b=Lpz5e+5Sr84DfWxzHuBJBEhgnZyfS8uRPCEHLTBCN4ncJb8L3OMLYldTQ4qjWO97B5
 syTr01J73Yq860D20+b0zG81dzVd7yl7Z7F16X1nb+PHAV781byYsNBgQbpSaH0cLwlG
 38baAgOBffK8rnj9w3CuUgfHcqhlvDuWOaP4PKHZ6Rbc61m2x83dRiTQUiX75M+nqgs4
 fCS8iDJZvTEUOMfp9bDtOxCw2MnmVcUx6F6cGrZ6gBJqcAIYy2rlTdbukZW++UVQ55OL
 A8/yFYjFk5rSkdwHFfD1XG45RfEA82G5rwemQ0kECNL8BgLSZo1ibFv7rHKTDj4+pkjP
 OifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121330; x=1700726130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeAclw7QmKClKGXsAkhYu6vVMcQf+GGL62FWZwi1uU8=;
 b=CdFuGxRfYpMwfER3L/9rOvGqQPoWe6vJdXZrH+y3ybMxscnbzvRleVsU8tZY92D+Xg
 kqk7jiTH2s1pVwkrrgEJZ0IaBM7Qj5CnEMLwGrizFCHFJy69XnDc41kfGqJhUwVUbC7a
 A8VbIOgYfB6sQOABDhotM7C640M9XXTPsPlBSY53ue9/OzX4Qup8RORLJwqeyCYd5jhm
 SsDzTDHel206sXl7mYJR+UqVUirDrSW4PQi+Bn2zx/EvrdemvF6c5WbVPoNXgLe55yna
 idvcSO0gcy+O9J+rh++NO0NvZBS4qniXC0svxapFpZDA8upZqJpWZw/qK4IJlFwOlePf
 6XHw==
X-Gm-Message-State: AOJu0YyChEEcYwJlL8fys5e37zChWvMzdWif0rrXrIv8mt3/Uxv1IWTq
 zyYRMhldCBk3vvnG5KMGA0QJgw==
X-Received: by 2002:a05:600c:450f:b0:40a:4b4e:2b32 with SMTP id
 t15-20020a05600c450f00b0040a4b4e2b32mr11491293wmo.26.1700121330629; 
 Wed, 15 Nov 2023 23:55:30 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:55:30 -0800 (PST)
Message-ID: <f71e943c-4177-41bf-8745-69d50786fec3@linaro.org>
Date: Thu, 16 Nov 2023 08:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/31] target/sh4: Use generic cpu_list()
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
 <20231114235628.534334-20-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-20-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qEPBBkR+2p1W

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
> sh7750r
> sh7751r
> sh7785
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
> Available CPUs:
>    sh7750r
>    sh7751r
>    sh7785
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/sh4/cpu.c | 17 -----------------
>   target/sh4/cpu.h |  3 ---
>   2 files changed, 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

