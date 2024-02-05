Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1119833ejb;
        Mon, 5 Feb 2024 05:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRxWdCUgFhBwRUJINCEGRUiS2utz7EBEf8VbbmjJKqL6B2Z5ZcaIhnWh86wbJf1hNRJCRb
X-Received: by 2002:a05:620a:120f:b0:783:b6bd:b0da with SMTP id u15-20020a05620a120f00b00783b6bdb0damr9498396qkj.39.1707138976346;
        Mon, 05 Feb 2024 05:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707138976; cv=none;
        d=google.com; s=arc-20160816;
        b=Jb2RA7sR4DWBD3aXpHWAMedFmWZKzjrr21DkX/7zbagvsleFvwdf2os7gXhh53KRLA
         xuCB3PFqpVuXKgIILoBcsD8nlngghnAWV7iPZ7in/M2cYCuXzk7zpZqMW3xf4PYfh2oP
         cCQc5go5iijBcfD5nUorMDC9m3GyEazafwY+K8Sq2z7lxw+pXrev7dRpWJdRR+VFxUYx
         cADpkqfxadFhdNQtzQ7L4Dq8YaUs4w4dCCKbWTIJzZ28QYWsyaiSalGT7yMrez2C1ffq
         +zTzZ618A3DuUcXc8Kfu95K5R21GEA14NU4jnd7bRmFpRtZBRck3ubUxZ2lw8uauVYNk
         ZYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E3LaGrCSeWw82x6hrDfkkZ383w0ufTlZRQ4os/JTKQc=;
        fh=oODw3XenoWNQLeOgmjNzA92VyY6u8Hb5O2GsjoRrzYc=;
        b=JQJ/icyvrvp994fUhiFnyQLHgUchf6OI0M+sOFjCQOa3iZrzXP8qs0mdZFfcpUBeg9
         w7P2sorpoOz63jLOub71tc5qubA5MAiETcf+zDkIDKVECg2++BxTuOE6IJDy1TsWIwXQ
         ni4o0CQOfErDIv0+LU0+Sbj4DtvT3RSemUOVJHDMAZIxLsyIj7ScJGXCmtRbhjZ411WU
         LJJRYGnIrIgmm1jxYl8gha6DojLS6+2k7838zrXKWMAfzfzSkrdhgNIp/kYTy6ne+QTo
         /vMPJ12DbMpGWCxpSaL4QCwTa0+KZ/F1kJ5nytKySCTO1YTXgzKw7YFx2/d7FeI4q49d
         aXCA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIfVaT8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVcUrdLQE8tgMCAlC1FZqMUZJeVucMKxl2EE1aY7377xA85PtA5SzyVguGYsPQ2Pd99ZuUtQTKMqESHEpGXszkkaeWc35aR
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vu21-20020a05620a561500b0078552f53b80si8390261qkn.50.2024.02.05.05.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 05:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIfVaT8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWypP-0005mv-UF; Mon, 05 Feb 2024 08:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWypM-0005lf-Hz
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:16:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWypJ-0003Da-MY
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:15:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a37f3443843so32591466b.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707138954; x=1707743754; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E3LaGrCSeWw82x6hrDfkkZ383w0ufTlZRQ4os/JTKQc=;
 b=LIfVaT8cYvtH1NAaAunVUCXVbhBVYt5bP4PFca1Qhlh7ubTP68qnY45o4/6c4zgSzN
 +4MT1Q8dMWdO2bUWGiO3ZBKwkae9ZtrSbABFpT8S+wcma3TkPV11Nblab8rkFKd/ioHl
 o0+uAVXbbKWJEM/DIuQFacU2EUIJMyZPjLEtgplRY2Tq6KFJFGS5v63jNbhI0mkg/FEn
 zngKWmj+RjS36L+/Wq0sFwOqfQU4iIVyy4eSmbyqj7vUmDjrthjPub3ODhZIRu+NMrmb
 2EjGWq2M9C9KOEFfIMuAa+69ptewOqf1yJPCdMaQzdU0y1h3Jsng35l3zoRWR/SHobMB
 56xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707138954; x=1707743754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E3LaGrCSeWw82x6hrDfkkZ383w0ufTlZRQ4os/JTKQc=;
 b=D9vwyaZ+kmhVYM+O17CJ7CfO6642MYugSfLzcG6G9KVj5L1uIobevQGPa6qc/bWfYS
 gLGWXVZSUpGfh5Y8jRxSckcm5lMiuaEGoDcmD0AZNPzuV9cwzm/czwi880djcFzl7xs8
 XGRkWJgwCODN8D301l21BdM5AN3hQ6IPOVn5bgxRCcIUSwwwqrB1zGZlcWsh9OmlhPXc
 0dath3x773JwQFQBvSvHOQAl2tq4jHJj8IWoTSy6bBptvmGNNETuiY1JagQZq5BhCcJm
 S9F6/EJj0RJo9huDLj3osk2f20oefnGaKbobyp+ppEA8hv79fMhi3ezBi+UCpCf8+21Q
 kWHA==
X-Gm-Message-State: AOJu0Yy8IN4CiTPO3+LROihQR7OZh/67Y/RjJq6rsLOnvNZyoA5fhTxJ
 UgF43RZP00vRnMJLPBbC5ChdAZQVYXzCm4sPqvcf56qf80Y7aoyMXaJqGS/NR7c=
X-Received: by 2002:a17:906:4a47:b0:a31:1b32:8c8c with SMTP id
 a7-20020a1709064a4700b00a311b328c8cmr6860921ejv.28.1707138954560; 
 Mon, 05 Feb 2024 05:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWnOfglWuk/vV1awnw21Ti6l8DlQ5koUtxNcsgEv3toQLTk0AkSeAsfju7xtrdxB4Za61/EHtlnX5vQrkFD2dcairrJrhqMQqw/bsHaQ4GeSAQezw5jc6LliXEBOiK6VKUqaXUv0AkAF0eH+Ni8VP52r7yWnXbBJWpd+QOQj+8mxte4AvzMkMyg7mtMayTSgf+rSYWAf7Rqt14VTrb4X5vD7E7CN50DYEX7RGSZurmAMgDSALjiOQ72oXoB
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 vx10-20020a170907a78a00b00a32fb8e79e1sm4340867ejc.65.2024.02.05.05.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:15:54 -0800 (PST)
Message-ID: <da2708e0-c3f3-4e11-af24-07817bc0cdfd@linaro.org>
Date: Mon, 5 Feb 2024 14:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 1/2] aspeed: support uart controller both 0 and 1 base
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-2-jamin_lin@aspeedtech.com>
 <aab5b2fb-e7f0-434b-935c-ff5ad5d39f21@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aab5b2fb-e7f0-434b-935c-ff5ad5d39f21@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: YnXQdFc7NPi9

On 5/2/24 11:46, Cédric Le Goater wrote:
> Hello Jamin,
> 
> On 2/5/24 10:14, Jamin Lin wrote:
>> According to the design of ASPEED SOCS, the uart controller
>> is 1 base for ast10x0, ast2600, ast2500 and ast2400.
>>
>> However, the uart controller is 0 base for ast2700.
>> To support uart controller both 0 and 1 base,
>> adds uasrt_bases parameter in AspeedSoCClass
>> and set the default uart controller 1 base
>> for ast10x0, astt2600, ast2500 and ast2400.
> 
> The board definition can set 'amc->uart_default' to choose a different
> default serial port for the console, or use the "bmc-console" machine
> option . Isn't it enough ? May be I am misunderstanding the need.
> 
> To clarify,
> 
> ASPEED_DEV_UART1 is in the first serial port on the boards.
> 
> I think we chose to start the indexing at 1 because the Aspeed QEMU
> modeling began first with the UART model (console) and for simplicity,
> we copied the definitions of the device tree from Linux :
> 
>      serial0 = &uart1;
>      serial1 = &uart2;
>      serial2 = &uart3;
>      serial3 = &uart4;
>      serial4 = &uart5;
>      serial5 = &vuart;
> 
> We replicated this indexing starting at 1 to nearly all device models :
> 
>      ASPEED_DEV_UART1 - 13
>      ASPEED_DEV_SPI1 -2
>      ASPEED_DEV_EHCI1 -2
>      ASPEED_DEV_TIMER1 - 8
>      ASPEED_DEV_ETH1 -4
>      ASPEED_DEV_MII1 - 4
>      ASPEED_DEV_JTAG0 - 1      <--- !!
>      ASPEED_DEV_FSI1 - 2
> 
> I don't know what would be ASPEED_DEV_UART0 in this context.
> 
> May be you could send a simplified AST2700 SoC model with definitions
> of a minimum address space and IRQ space ?

Looking at TF-A definitions,
https://github.com/ARM-software/arm-trusted-firmware/commit/85f199b77447

#define UART_BASE	U(0x14c33000)
#define UART12_BASE	(UART_BASE + 0xb00)
#define CONSOLE_UART_BASE		UART12_BASE

As Cédric described, we have TF-A UART12_BASE -> QEMU ASPEED_DEV_UART13.
