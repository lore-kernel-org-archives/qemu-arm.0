Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp842913ejf;
        Fri, 23 Feb 2024 14:13:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVG/zGG1mx3Rr9mULtCF7XOKirlvm8fkamwpku3kW2wvlMx4m8Q+akrAv8oQSlsmaFQBW4xitWGdwa/0f58K/78PsasSCPk
X-Google-Smtp-Source: AGHT+IF8XmsVeTIAz4au8KXjbX0sEbQ1bwV721zwxgIbngr/n5A6GqkELWOtm8HaAKey/wis20Y2
X-Received: by 2002:ac8:7dca:0:b0:42d:de30:83e1 with SMTP id c10-20020ac87dca000000b0042dde3083e1mr802671qte.29.1708726428149;
        Fri, 23 Feb 2024 14:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708726428; cv=none;
        d=google.com; s=arc-20160816;
        b=tyDvEJhAa2Z+FWr1tqfSStRO3bnks1VeTyQN7JRhbrCpO0UhsaqiO30LHlButDMhxQ
         a+eFSvND9u33LbRPVaizpufqEnUd870c5X+XOB8R8kj29rGEg9OuQg7W1DR0gUAYhGMy
         X7+kueJc/KRmdgjlEYtB4KQFDtI7cQtA8Qb8+A3NP2GLD0ZXUNgzYYOCBbWdksPNkoNA
         SSr3Xsi80lZPTBnhqbuPLgiQhmRwY+Hfg7lSNtCtGmMq4O8HUbS71lPnCbsZwX00qeZw
         iekAUfuFkmDf4xErx8Z3ZqDbo2paVvwHbSjuwMqKHGeSqx1G/B5UOs7z4EnjJ7JGfA8q
         nNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mYlMYISlgRm/4KA4kPSTs9crtAC5Oq8DsbR8nT4sCZg=;
        fh=NR6pe4E07Wr0DNANKEN5XmYRjCfmgVoe2vMkO1gJ7PM=;
        b=T1Ug7RLLH+XwK4u+MxORgRBJjg/fl5o+LEPugxPd7WWfAkoU/Cjz7drmHgV+dY9c1v
         V9nddKaMBCH2iaO//+3fYZ7D4bSvbEQrQNqK6jmpaDv0Vnqn/T3ZtHWtAY5VIRF0it2k
         961IOywmcFy3rGi8dzMrUwvTAtTJBekCiU82RhdlA7XLgvym3VK2NzHIvG3W6rxK4Il1
         JOD5uiT534uOLagWN3ZCGYBO+mqX+DkjC22h8hIohp5s9PHYQHG4QDlZblvvuygZ6WSU
         3DZoDadQcGGUepDD5DD2DE/kH9HGxtBHhVZjPiACqHFPJdGuE4CGLVD21X1vO5lT+qUT
         DpnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rudQvtDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020ac85ac4000000b0042db67f6b41si17360743qtd.602.2024.02.23.14.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 14:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rudQvtDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rddnP-00071e-Bq; Fri, 23 Feb 2024 17:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddPX-0004Ca-Q9
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:48:52 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddPU-0000DS-T2
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:48:51 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e459b39e2cso582976b3a.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 13:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708724926; x=1709329726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mYlMYISlgRm/4KA4kPSTs9crtAC5Oq8DsbR8nT4sCZg=;
 b=rudQvtDmWJ8mv6cm0nVAf9iCSXf5vuPULtMgz9AqJAdLO8yl3OstAawacm4w+LDc1o
 1MGGOx85tU9aDTnFvOb1WS0ND3ZWfTJDBnxuGoW1DJN6ao3yipemsPCqmzMURd/TIWCJ
 4K0yJ7UYKkh8uOipOZ9nW0YeOKLeqG4WcaBD1zGYqf+dBUDBD35Ap+k62Ae6FT5YA8Sf
 nRPwZa7bvEgRWizcMtmXyP/8EA+ptL5jrqfbH+hPuj7L4NYySdqdeKvfWJJgjNrAy0VA
 XZGMIDtDUt7Dme23cXuR3gN6OSZ9CuhXiNGDMhOjRmOwwMni8oDVkiqVB/qOQ5QpA7uk
 nniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708724926; x=1709329726;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYlMYISlgRm/4KA4kPSTs9crtAC5Oq8DsbR8nT4sCZg=;
 b=b+vK10UlUTj9MEixUgK08/JH+bomVEsrxs0lqubjxGSccVuLSK0svJlZouhAFdVQbN
 2+e4N2dNASjPIzgTRncnmLQO2I/J4GpfTnZW9cufFIiv3rU37OULk2JhnJopwawJ22zl
 v4zU/IFq3WxpLywBW85iyWcq4+He4sgHQfO9DiOa6M67D5fcOteTo6UcEzX1IYCfS/Cb
 8VDaCICuCC63bv10HnlZLCMMRXe+qNpoS/EkcegdWPN3zTNwoVpzkABvDypOmgnD0pWZ
 dTp4rKxcQ+zW1ljJRLxh8OH7aDdYHYN2HG48F+2fcwZo6oOBvJtHyYU52nFha3V3CG/P
 HfmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAA/kWKf2iORo5IYDR0shycL/0AxtpAkJpmeqrxBSQDT/+mTTres/5y9bM7RhOPOfBJ8bXH6Ef2DDA5tbS+6dTnh4a
X-Gm-Message-State: AOJu0YwmRKXGNx4qDMzsXUOfMcW/MAatdep00/+UfkY3eqgwKnGUSRib
 4mgfQ6OMjcad+DiZrHJbCZ893gxFgDjRVJ0DmiYq7JOwICI9CvsPVp0n6q1Un88=
X-Received: by 2002:a05:6a21:3a4b:b0:1a0:5f9b:9ec7 with SMTP id
 zu11-20020a056a213a4b00b001a05f9b9ec7mr1226908pzb.13.1708724926104; 
 Fri, 23 Feb 2024 13:48:46 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d188-20020a6336c5000000b005dc89957e06sm12691396pga.71.2024.02.23.13.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 13:48:45 -0800 (PST)
Message-ID: <2704e5de-6c2b-42ca-8379-a1aae1fb0db3@linaro.org>
Date: Fri, 23 Feb 2024 11:48:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 19/21] hw/intc/arm_gicv3: Report the NMI interrupt
 in gicv3_cpuif_update()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-20-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-20-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: Ngk7WD1+8Jcg

On 2/23/24 00:32, Jinjie Ruan via wrote:
> In CPU Interface, if the IRQ has the superpriority property, report
> NMI to the corresponding PE.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v3:
> - Remove handling nmi_is_irq flag.
> ---
>   hw/intc/arm_gicv3_cpuif.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index f5bf8df32b..3ffeb9543b 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -931,6 +931,7 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
>       /* Tell the CPU about its highest priority pending interrupt */
>       int irqlevel = 0;
>       int fiqlevel = 0;
> +    int nmilevel = 0;
>       ARMCPU *cpu = ARM_CPU(cs->cpu);
>       CPUARMState *env = &cpu->env;
>   
> @@ -967,7 +968,9 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
>               g_assert_not_reached();
>           }
>   
> -        if (isfiq) {
> +        if (cs->hppi.superprio) {
> +            nmilevel = 1;
> +        } else if (isfiq) {
>               fiqlevel = 1;
>           } else {
>               irqlevel = 1;

NMI only applies to group 1, per Table 4-6.  Because group 0 always produces fiq, I think 
you need to swap the ordering of the IFs.


r~
