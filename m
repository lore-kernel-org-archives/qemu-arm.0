Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp248566ejo;
        Thu, 4 Jan 2024 09:59:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEWk4DYhH/cAhSXh/Cr/vVfyxzEStvxUQwZwJk5WcYMmcqsD/OhqeDKCL3DV7FjKRjznmK
X-Received: by 2002:a05:620a:45aa:b0:781:80dc:a0be with SMTP id bp42-20020a05620a45aa00b0078180dca0bemr1122666qkb.76.1704391143404;
        Thu, 04 Jan 2024 09:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704391143; cv=none;
        d=google.com; s=arc-20160816;
        b=CMI0Fk95NqHlj/SpQLFsBkn5dAe/h+6EjHPsY8StcdAQKi6feA+qiJlzoJgeGKAmUm
         X1RBPmpTDwkHj5jkacPlKGgzROmmeVGdnV1I9cAzNfRhfbIdtICgORvtzeNjeRwxafhO
         xpQGephYKo0dwT86lfdzPhaHa+NrRbB2Qy48j4bZHKlU9tX4BlQIXd6yi1vtnrxYP69n
         sPy16IGZcmW6NZNxVGwEulCzD/Siak1zqEABzBPUjom4JppS6Vd5YcBZNrlLkjgYCi4Z
         XOfyPhRLSs+P97ubhJiq1vlhM5kmIw5KttB1lYaU9tbbga3FQPiO6TvZl5p0zxhbUTgN
         xdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/LKo2C5CZxR+iHnLgYm18JKD3MaNG3AbgeuPt+Xvk4Y=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=OFaBoTWy2ZguGWFP8qIcBwAJC3fr1JCEhldcatZK45Lnb92HEpKoiap65L/2ISICuj
         yYpn7z2JPm1tqiSY0LIpvEwTre/x82I2EAT7ICvBKI46RXk3cmZzlrCl7eO0J9kgjb8S
         K2TijtEeQ2VRnLZlbc5QQC1R8aO8XPUc/HI3ZSe/n0dvTYqntBcBPy7XYLXBN6Zh0tAp
         dBbJ3YjIaz2xhpx+YfhFqRUQWi3j4tEIOtzo45wy1Akc85Ai1rJp6g3dHUDkWf3Vcvad
         6Vb2blYFFnEgQFRm0puB4SZNwcI4ppj/LtO1Kg4ZOEC2zoUXOLkJjZ5dKbrdZlERgsGe
         WsFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWmKG6vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a05620a270600b00781aedc0e31si12071766qkp.733.2024.01.04.09.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 09:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWmKG6vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLRzX-00082V-Sx; Thu, 04 Jan 2024 12:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLRzV-000826-C5
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 12:58:49 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLRzS-0004Lu-Jw
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 12:58:49 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so95243466b.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704391123; x=1704995923; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/LKo2C5CZxR+iHnLgYm18JKD3MaNG3AbgeuPt+Xvk4Y=;
 b=GWmKG6vR99lLBQbJ+LKu8j6XTvrG79tJ9Bk5W0vDnLIuA2NgN6uEo8yS0uLioiq+bN
 Bjtt32KTrJe8zjEc3BQNFqoWikoKPxFvhiRKAGNOq95K5uGyjBg0ZtKkG4p/obnfFqhA
 b60g2tlb/EB8r+xUCXr7t5TsFdLmU39Nxogk54V4SCoLsXv82dFe1S75BZ2oxOHngumd
 wtuKXEiyd6PRcC8RilA1sbWEx+qOgU8X1lxbG7kaqC5s/kof9NZcjT3KFrsVRM8y3322
 onGXc7XNwp2CZyDNT2v0aFYb81I0VSlZSwGBa1q/gMD8g7iNHm2McsbQJ+syHdHMQIRv
 MM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704391123; x=1704995923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/LKo2C5CZxR+iHnLgYm18JKD3MaNG3AbgeuPt+Xvk4Y=;
 b=J15iQb9WFJiathfy5SJ0KY9yUStRCNGJXNluEiJk+xpRnNZSYuMQV5Lot++8nP56Nw
 ot6NDLQcYyoP2fieUqduzqfd/UEs1zzI+hCy5nIllIXHNYV4SAhjimi0cDZSw7gIr3hD
 g+jyc3VC2pBvORG6LG2ePXYI9nGstJ+cfjnGzTY3aHNFQef26OySKLo1O3Ru3nnzFFoT
 WG+JqawsDmWM9Tijvxwb5ISFKs1fTCvmXq4FPKlZiiFAVuR4+L3RIk31PyYNomRx6aE3
 KTHL5lkx7GQeifLYlknHzl9UAKgledwyARc+3NNnK3UObMp7pBsQ5k3Nj+FRJuEpF9Fl
 h+aQ==
X-Gm-Message-State: AOJu0Yx0ro3/40obcbDF2hpYG9XcjnH/ZRUGqUa209318Yjd1Uol8KVQ
 JFQiEBcAyZ+OWAN7U8zeqA4fJmjJrjAK9g==
X-Received: by 2002:a17:907:3209:b0:a28:ab54:4e81 with SMTP id
 xg9-20020a170907320900b00a28ab544e81mr473891ejb.150.1704391122854; 
 Thu, 04 Jan 2024 09:58:42 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a170906704d00b00a27af2cf7c3sm5796066ejj.175.2024.01.04.09.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 09:58:42 -0800 (PST)
Message-ID: <9fcd0827-a729-4cf8-a6ab-93cda04d88f9@linaro.org>
Date: Thu, 4 Jan 2024 18:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] target/alpha: Remove 'ev67' CPU class
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
 <20231114235628.534334-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: g/DEj9nNJ0Pb

On 15/11/23 00:55, Gavin Shan wrote:
> 'ev67' CPU class will be returned to match everything, which makes
> no sense as mentioned in the comments. Remove the logic to fall
> back to 'ev67' CPU class to match everything.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/alpha/cpu.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 39cf841b3e..91fe8ae095 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -141,11 +141,8 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -
> -    /* TODO: remove match everything nonsense */
> -    if (!oc || object_class_is_abstract(oc)) {
> -        /* Default to ev67; no reason not to emulate insns by default. */
> -        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
> +    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
> +        return NULL;
>       }

This breaks linux-user:

qemu-alpha: unable to find CPU model 'any'
