Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp295207ejc;
        Tue, 26 Dec 2023 03:17:27 -0800 (PST)
X-Received: by 2002:a05:600c:744:b0:40d:40b1:5184 with SMTP id j4-20020a05600c074400b0040d40b15184mr3760448wmn.187.1703589447494;
        Tue, 26 Dec 2023 03:17:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703589447; cv=none;
        d=google.com; s=arc-20160816;
        b=MB/M+DQsPxCbSp7nYrZLrJM6rMt/jzklf11ZPYxDbXw7UFLXd6ORx7T9u9aR+6dLYn
         ZKvuQUkl8CCTj6u6b9YfK6PHSFZzfk84qYQzf7fUrWkS8feRlvKyklPaULgMoBk9T1Nz
         o9dV1Ts/7Rnhithqf6SrjqPP0c+1tJZDcuOKHt2JAEMGPLm19qAWUgCKesqmj5DB6c6q
         3VwiBAb9iGCjJernCXLzmMRQoeI1wk79u31lmnmdHzHPDmlTLppcu17GLde0Up5MMPN1
         JpeDqAOzt8kzWwofAJqGFhTcLb3SH/UFv7kLdy6da6U9JY0elh4DLWmDYthZ1bfbpu5P
         dgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AWcLIU+t89Tu7OdXX76I4MYCQ86kFuCgTTPUe1ixuSk=;
        fh=xw2wN4s20Y3gr+6wEzwu1e5rGC86OpNCaYyKcxNeofc=;
        b=Zq8orbyfqWgDHZ8B3UXCbG2y1neYhVaA8d+6iALepevnQrsCTaIc8mWk/ue8C3Gnd+
         y56OaRvB4sHo5P/pedpPXkirll55MFcY7h4n14wQUntLI5D4ee9daXZXaMSz8yvRr3P2
         FUTqU76RZ7rUhHpTl+3XdO/JGxbd65mCieGP0XEV4gZC2wZlmXCU+YXLXJzT7uuKA1EY
         qA5uuCk3/jZP7yopsH92nnPdzcpRY25YvDux89IJ7rAOFW6onq/orsXyZplzRuUVtQd0
         Hd3kPbN2wbLD8Kr/kokmH2fng1XyPtYqYA1jvNHz18W/AfKmv2zAKkmVnnRWTVAtgXPR
         PiSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x4f++neQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x4-20020a05600c188400b0040b1aa92b9dsor176093wmp.4.2023.12.26.03.17.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Dec 2023 03:17:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x4f++neQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703589447; x=1704194247; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWcLIU+t89Tu7OdXX76I4MYCQ86kFuCgTTPUe1ixuSk=;
        b=x4f++neQznhEQiuTZDwr1D/dNLb5GbJA4tFTRt7q9GI7NLQzP1E/31fGIi6koavcLc
         KL3GdBXnHcQgBZQwFpbVdNtyPsDp0+LR7HxTzWx0tTfZT5Er1WU6VVgtUmnK1YAURJMz
         JAElzKPW2+fRsAkX6L4K/OjADrTlv54mBwOfiG0vkrreB6gvgKc0iJNgqs5So9W4VDXn
         0xFfhukiCQYeVlr8GaAWpvA5qUrSB3b4sGBz6PZJTU+Wtc1uAk84sECKnXG+NbtGlZqQ
         Xz8osmeL1id/nrWptfLApx/p5cEuE5SGMbsM6/tzPqHaKwnxIV2Vk9LIVbg0A1wY2F9n
         6F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703589447; x=1704194247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWcLIU+t89Tu7OdXX76I4MYCQ86kFuCgTTPUe1ixuSk=;
        b=Ou2rJ7KAKUiEkiG1qnpOjXCWw27pL1H7WeeiagC2ugQc0nty0ky5cFl6dHEX9u/7Z6
         VO2TT0rKr6VDRGHjJXyaG33s5JiD6AWWMY34lCJ8UAXOoFuEhQ110CSixK6McGgg1bqN
         549tjyNyJ/pqFvnaeDUH41522X/MbXsbFTmXhKc36oaAmQNilJV4NrAxW+l2dcq+5/GC
         aqyYesymUL0XxzE3TsgL3ut1MRnvtvKBxNmtnDMXURtdgUnlz/eCrhmgjmAYVOJ2Wbkg
         rj6IDqEXYtoBa9cP/BFJeIZqaaqPzg/nLzJaIUn9w9VTfsgg8EXtG4QiRtAftwG/YdkK
         N+XA==
X-Gm-Message-State: AOJu0YxswfY/AWW4Dh7/X6MiaMp3dMOt1aom6D95JgFV5ZEeFHdYd76f
	hyjRkOvwKh/yYlA7byWZ7j18RPhdCIDSgYVl
X-Google-Smtp-Source: AGHT+IGOP58ZhJ2vHhyk8HHFvlg9R4JbumcsOm+95vPNThGYjegNXCAGbDZa7oAQ+9rP49jsQzpR3g==
X-Received: by 2002:a05:600c:2253:b0:40c:5777:da1a with SMTP id a19-20020a05600c225300b0040c5777da1amr4269997wmm.113.1703589447062;
        Tue, 26 Dec 2023 03:17:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.96.175] (137.red-95-127-43.staticip.rima-tde.net. [95.127.43.137])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c4e0e00b0040d5a5c26a9sm1868669wmq.43.2023.12.26.03.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 03:17:26 -0800 (PST)
Message-ID: <f8a9df6e-fa49-4d4a-ba01-b0c419e8bd9e@linaro.org>
Date: Tue, 26 Dec 2023 12:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Anton Johansson <anjo@rev.ng>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231212162935.42910-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4C8Yd9b2Axg5

Hi,

ping for review?

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> When a MPCore cluster is used, the Cortex-A cores belong the the
> cluster container, not to the board/soc layer. This series move
> the creation of vCPUs to the MPCore private container.
> 
> Doing so we consolidate the QOM model, moving common code in a
> central place (abstract MPCore parent).
> 
> This eventually allow removing one qemu_get_cpu() use, which we
> want to remove in heterogeneous machines (machines using MPCore
> are candidate for heterogeneous emulation).
> 
> Maybe these hw/cpu/arm/ files belong to hw/arm/...
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (33):
>    hw/arm/boot: Propagate vCPU to arm_load_dtb()
>    hw/arm/fsl-imx6: Add a local 'gic' variable
>    hw/arm/fsl-imx6ul: Add a local 'gic' variable
>    hw/arm/fsl-imx7: Add a local 'gic' variable
>    hw/cpu: Remove dead Kconfig
>    hw/cpu/arm: Rename 'busdev' -> 'gicsbd' in a15mp_priv_realize()
>    hw/cpu/arm: Alias 'num-cpu' property on TYPE_REALVIEW_MPCORE
>    hw/cpu/arm: Declare CPU QOM types using DEFINE_TYPES() macro
>    hw/cpu/arm: Merge {a9mpcore.h, a15mpcore.h} as cortex_mpcore.h
>    hw/cpu/arm: Introduce abstract CORTEX_MPCORE_PRIV QOM type
>    hw/cpu/arm: Have A9MPCORE/A15MPCORE inheritate common
>      CORTEX_MPCORE_PRIV
>    hw/cpu/arm: Create MPCore container in QOM parent
>    hw/cpu/arm: Handle 'num_cores' property once in MPCore parent
>    hw/cpu/arm: Handle 'has_el2/3' properties once in MPCore parent
>    hw/cpu/arm: Handle 'gic-irq' property once in MPCore parent
>    hw/cpu/arm: Handle GIC once in MPCore parent
>    hw/cpu/arm: Document more properties of CORTEX_MPCORE_PRIV QOM type
>    hw/cpu/arm: Replace A15MPPrivState by CortexMPPrivState
>    hw/cpu/arm: Introduce TYPE_A7MPCORE_PRIV for Cortex-A7 MPCore
>    hw/cpu/arm: Consolidate check on max GIC spi supported
>    hw/cpu/arm: Create CPUs once in MPCore parent
>    hw/arm/aspeed_ast2600: Let the A7MPcore create/wire the CPU cores
>    hw/arm/exynos4210: Let the A9MPcore create/wire the CPU cores
>    hw/arm/fsl-imx6: Let the A9MPcore create/wire the CPU cores
>    hw/arm/fsl-imx6ul: Let the A7MPcore create/wire the CPU cores
>    hw/arm/fsl-imx7: Let the A7MPcore create/wire the CPU cores
>    hw/arm/highbank: Let the A9/A15MPcore create/wire the CPU cores
>    hw/arm/vexpress: Let the A9/A15MPcore create/wire the CPU cores
>    hw/arm/xilinx_zynq: Let the A9MPcore create/wire the CPU cores
>    hw/arm/npcm7xx: Let the A9MPcore create/wire the CPU cores
>    hw/cpu/a9mpcore: Remove legacy code
>    hw/cpu/arm: Remove 'num-cpu' property alias
>    hw/cpu/arm: Remove use of qemu_get_cpu() in A7/A15 realize()
