Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp720127ejk;
        Tue, 30 Jan 2024 02:15:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFXLhwuOHkf5ext1JV+mcq/8S8Dv3P0pyBTfYqQIIn//UGgMkiZuq/RWgJH0dB2FO83AJr
X-Received: by 2002:a05:6214:5008:b0:68c:4f69:ac79 with SMTP id jo8-20020a056214500800b0068c4f69ac79mr4083953qvb.109.1706609700894;
        Tue, 30 Jan 2024 02:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706609700; cv=none;
        d=google.com; s=arc-20160816;
        b=Dwa0PW7cMIR1X2Lnba3f+ehr+JktkAslLYEBHPsDsLYVEBB647LgvISFU5rSKJlaPN
         XdL5wlRrdX1XDRhr0phmWA5Ij3flTIcTQko4ie8IhpTUKidQEqtFLn4K4NAu2uccBum0
         zU8hMItWpbfm2VOsXgJ0JvMLNQdJAliUl/IIMPD+LSY7ROL/6trVDh/1jcyyPwzcKTZg
         YZ0bkFVC8lg4iZjwja9+etYo/tkPGwjElM4sSkGbuOHlWkVFBB6BfA/GgwQ9QEp2WzbW
         S6ArsqHqQChQ5Ayp9U2gfu+7WGC5kM2zxe5Ziw8A1haafmxcMgrWJknJ/TmuWetYgFsU
         eGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FUlxL+39zvpvl5E9zKEekDOOrtv6RH6k7fqk6sfwuMI=;
        fh=gBOdVVVD9mhK/RSg8mLkgl+9NOj99REHplAugaYg678=;
        b=rjnxh+MRT5cmw9BaswxqWUbz0u8edOOi3uxCQ7dQBgtFsklVn54lzAmQNjjK+6tVXg
         8wsa3y485+htisvf5lzNJUMeoBmf4VlZZUVvPRXilDmNABH9wQzi81kytnZiQCyLPSxi
         ZRt5zWC20aylQTMV6nXB6xNcDImh87wx+gRNAJEDarMRmsx2GswSlquC+231iKrGsmHg
         VEjaz1v5GSEVV+CwxhGbWYgkVHjEIjiYQIrrH0DoMwbhdDs8UqKxQX/EFz26rSyZ5FW5
         JBGKR2SAt+Qe/KhkijG+30jAXOwXhlAMDV5R7SUxgQpnVA47JvTmgYcihF4hY3B4v3Tq
         mh1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4IoXD2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a056214202600b0068c5c5f1d69si1982401qvf.588.2024.01.30.02.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 02:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4IoXD2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUl8L-0001yR-39; Tue, 30 Jan 2024 05:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUl8I-0001xC-PA
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 05:14:22 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUl8H-0004hY-4t
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 05:14:22 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-295bbf1a691so169403a91.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 02:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706609660; x=1707214460; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FUlxL+39zvpvl5E9zKEekDOOrtv6RH6k7fqk6sfwuMI=;
 b=O4IoXD2dYo4NOWGOh5H4Xfet6qZsTW6GxDXsJeHBXOOZ2lsMH7qiYRBt0Wc1P0V3/h
 tf1wi8RSvQOCANRv4eGMfEFX5w6Kn8WcLhgBHcM2B72jThD8a0SoufC4ajx+rtAgLHoJ
 V/ssbeaKa4iYL4qN+LGpyTliaP5uxEN66qnhk46VJLHPVtF6S3t6j7SwJWW95v+aBSil
 UtzhE25nFys/+sNR1kkGRr64PEBchhges0AwijR23Y2hx0YCgneNHMqSfVAKw74t8pjW
 YLaN2vnYjefCv8rOilMbCHtna249aTrFe5tyuBlHJ0ys6k1ErdCu2rvWjESOff5Ga6wP
 27LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706609660; x=1707214460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUlxL+39zvpvl5E9zKEekDOOrtv6RH6k7fqk6sfwuMI=;
 b=tCXng84Moy0bTMeX/ZzC/1cr6wLi6ViRPyx3PnOmJ6TozSovIulpjjSkvmvKLxa1rN
 TiCrE8O7AS//PzRNtnVwWNsB5/Ykm3UpR0PcbjXfjqk4zwK1affamy2dU22E4UbNaNDn
 +/5UK4zhRSe/MQQMszf/EaPkgRrl23PfmliVf1SS/2ROvNgA5GubHzp4vCmY4gAIT2Ah
 armJpWSuE7wPyl4gYMlmwr7hBrZiRpLu0fYgjoQ1+jrL8/y5J0d0Fykqlz8pt61i+hX9
 s6U4yyE7o2mZF0pytjicuJNGn78/hmAEaX5hYXTmBELlGWOTMnHKxGxWhq5DSY5s3+r9
 4A0A==
X-Gm-Message-State: AOJu0YyINeDqVe7kPc0zw6ODaP5orKEZzHF44FbZ6hlD+j8IRBxfJ9Um
 9U5rPOSoELdRfrEEzWbanVRtsRLdPhaAGuxT5/eaCh7rJpUO03XNYTmHdpbbBv0=
X-Received: by 2002:a17:90a:616:b0:293:8708:7a04 with SMTP id
 j22-20020a17090a061600b0029387087a04mr5097354pjj.18.1706609659751; 
 Tue, 30 Jan 2024 02:14:19 -0800 (PST)
Received: from [192.168.0.103] ([103.210.27.218])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a170902ed4d00b001d8f24ee024sm2544453plb.173.2024.01.30.02.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:14:19 -0800 (PST)
Message-ID: <6f47ce70-5d11-458d-969e-8b14a511862c@linaro.org>
Date: Tue, 30 Jan 2024 20:14:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/29] target/loongarch: Prefer fast cpu_env() over
 slower CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240129164514.73104-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: fRM6LACQj0Hq

On 1/30/24 02:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu.c            | 39 ++++++++---------------------
>   target/loongarch/gdbstub.c        |  6 ++---
>   target/loongarch/kvm/kvm.c        | 41 +++++++++----------------------
>   target/loongarch/tcg/tlb_helper.c |  6 ++---
>   4 files changed, 26 insertions(+), 66 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
