Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp808993ejf;
        Fri, 23 Feb 2024 12:52:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLowiPAkF/ltrDielq4Tt5+MyMrtgiu5anWs91UQyti0RpN5qg9+ixPipupBkb36W7beq0KpwjOQcgi4SBWyJzCWF09bhq
X-Google-Smtp-Source: AGHT+IHPZFerCQ2vUglBcUtCJGHM7aHTBJDe9yOMs3dRUT4Bfg8k6R1u2FItmjbs16/80puuKeYF
X-Received: by 2002:ad4:5d4a:0:b0:68f:dc2d:3ce8 with SMTP id jk10-20020ad45d4a000000b0068fdc2d3ce8mr925123qvb.19.1708721539344;
        Fri, 23 Feb 2024 12:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708721539; cv=none;
        d=google.com; s=arc-20160816;
        b=Atjl2UWi5Nr8nxIcMlIwJwml0R59kLhdTrNW/aTXc4tkGA6SEoReOQQl3oAgiBZhQd
         IQfbiF8k6MDq9AE43meGas+zKGOHmN6QTlg6Bt/sxGpAWIq5y6WdS5noDn7557n6LytQ
         e9+d694I1L/KkoKI4V6dLnOeuDjpdiCChr4B4tmGNr4P93ErY7rVW08XdIDfO7cbNtKO
         yP4yEiP19KnzgLju8QkbOZVSdSMxXMqrMl0tO3UVsz5o+Wm8Oc+ctrXCBE5cH2lcQo3C
         AMokrs5XxFGCEIokv4F05kA3iZYNXxWPiGDyWIEU0pRD1YGmLgMInuEGSCOMp8GeKIDB
         Uhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=n1XC3vl+LDj8wZs8FVuIheeyyKpaBBm/H85XNB+6cwM=;
        fh=aU8wl0epk0OobyxNHQYrRCMAqkinlSEQo0kDjO9QO8w=;
        b=ygR86L68RUU5jCaC+NsMoQX4YfMd/IQQ0Av4YBVmlnas4uoN35OlAOXK/xDr1q/A7E
         SgXguFavdnjk++IsJ2gcyHvMxHLgAyqZuV3ke66H0l/pW1sj/2AwhXle/9FAcqj6kQsQ
         BDeFunCkHAoBfesU2sj0fZpLVqnB5Jy0xaAUqOvZUa4z+oesDc9hRbGkv3yQXNNkAQ5m
         N57jACGNKbAoEenqRX6Hadh3yJvD7lr4xitpdmQc9xEC4C2xAPwrFo6PaNAIbg7nUazr
         MFgEzK9hwpAugMD79qi5kmQGQ/i/ttrEbEJdtvzXXQupa+TL3r7A+btUZH3vRSoS+MBw
         PkLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJnbHMux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo12-20020ad45f0c000000b0068f55102243si14256615qvb.470.2024.02.23.12.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:52:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJnbHMux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdcWG-0007tR-AM; Fri, 23 Feb 2024 15:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbpX-0005bL-16
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:07:35 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbpV-0003wj-Gg
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:07:34 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29a7951c6faso710290a91.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708718852; x=1709323652; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1XC3vl+LDj8wZs8FVuIheeyyKpaBBm/H85XNB+6cwM=;
 b=GJnbHMuxFbg/yPBCjx31GEstlZLHeHcbw1Hv0M3AHzVq9dre2WkTac65ZZRORchuFF
 y3Zm/sebMFCoGGYIlVw0niZB98//G6uELmZeq2QUEBEAQ+9QZOvwEaHsHADyyxniZZdK
 HHJ3tkZu5Rt5B+X2FfPflXoENrpFnNCtikgr895mcU1eoTK9Jb4w6LKX3zMeU8/infER
 pTXO5ZEm0WdlIuTYThJn7QczRVCGM7GYI3DAcjRolamMCj4a6t9OmLgZhtUA9SLfCuDJ
 mJVwMbD+7nQrXGGoEk7AmMghkedgKtZtZxqzLWIYMvYpaFmWweRUaKenNGRQbEgHcV2p
 Zxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708718852; x=1709323652;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1XC3vl+LDj8wZs8FVuIheeyyKpaBBm/H85XNB+6cwM=;
 b=rlHoofRYeEEgvY/14B2iOq+Eg2ZKoaP69K2jwO72FpAS4WOaiGXzXL/bDu6qj49qQx
 J4uBlzYNW5xYtZur3GwG3jTTHOYicR2OWnThYWxlxusb8BXbC5e5bO3oFYhaBkRWMekG
 oTnspvbG1TNdPMMLc2qg4YdRltw4xcSaFmxJMoaRnSlGJ3vEKvBz5JiG+MPXHN7CJPRM
 uOJ05qh7zeuCa5lBFsLbbzRoP1O2mZIZXpjjYO6qV78JZ7CDD9Q1gegepZ/MZmbeheEO
 hUUSS6DupVPilOSmO45534VlAGaOYySUnqJ4qkyDQSFld9UfPT/SinQp6/sqIRfpkBWP
 C/sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlOOUUFCdKcYXr3ZMMfiFUSdIQq8h3kj/s+yIg7XRPXN/D9D1bv6R24BosNfErxOZEz8Jp+jl0imYutX+Og1DpQ3g4
X-Gm-Message-State: AOJu0YzSX5DYX0yGFHOLloX2+C6liqAkO+Fs2MfY627p/7oYGaO0ASbi
 iPSpFn5MGt42k6dLGv5zoBckcVyw0Nslgd+SoxcaSPdhijBK42qcoh1gSFnZlP0=
X-Received: by 2002:a17:90a:4683:b0:29a:4b13:786f with SMTP id
 z3-20020a17090a468300b0029a4b13786fmr912374pjf.36.1708718851936; 
 Fri, 23 Feb 2024 12:07:31 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 lj10-20020a17090b344a00b00298ca46547fsm1885987pjb.36.2024.02.23.12.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 12:07:31 -0800 (PST)
Message-ID: <71f6caef-b9d8-41f7-ae09-def488d6d5c6@linaro.org>
Date: Fri, 23 Feb 2024 10:07:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 11/21] hw/intc/arm_gicv3: Add external IRQ lines
 for NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-12-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-12-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: DIIt57k4i7+e

On 2/23/24 00:32, Jinjie Ruan via wrote:
> Augment the GICv3's QOM device interface by adding one
> new set of sysbus IRQ line, to signal NMI to each CPU.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v3:
> - Add support for VNMI.
> ---
>   hw/intc/arm_gicv3_common.c         | 6 ++++++
>   include/hw/intc/arm_gic_common.h   | 2 ++
>   include/hw/intc/arm_gicv3_common.h | 2 ++
>   3 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
