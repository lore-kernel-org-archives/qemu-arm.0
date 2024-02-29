Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp708578eja;
        Thu, 29 Feb 2024 15:03:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUW46k8kO5UyvMgPJrXCNLBfo8KoAwIfnN6SR8fW1oBV2xaRodfqOWlduka1td7if1B6hDb3wJJ+eHQQQ830+Sin05GC23W
X-Google-Smtp-Source: AGHT+IHgNM7Lfszfe9SeavatoYEe4OrWtHhni6QC8slF3v2UF4z6afGgsUHtkrVOcluQ76IYGeLr
X-Received: by 2002:a0c:e184:0:b0:68f:2b9a:75ec with SMTP id p4-20020a0ce184000000b0068f2b9a75ecmr3765253qvl.61.1709247798282;
        Thu, 29 Feb 2024 15:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709247798; cv=none;
        d=google.com; s=arc-20160816;
        b=AkBIagVVEbpTTPnyUTt1mhujfKCVGP4OpH9uXlXEQxWY0YeDUkRF0YsqAoycNG6ue8
         obAau7Z6N8+F8Kl3hGQsGBUMNLxSv4UnG7XuJJh0bE4UqM+8ohEl3+tq13RXtOHum19v
         nHy+lV76/Y5BFn5vq5Iub3lsCMt/I7mHtZ5Zeqt0PGXGkZLgIDKwx/W6PCPzjnhlf8N7
         AuML3CV7RdRKlOw0Vod1y8Z8nxBV8h2p2vKmZD6D+FnAh9r2yzZSY380eRrmtaWsC7n0
         4XrUlLtMTPsNskYPJhKPJ0XInMjx9Ym9Z6kXOT63t8MFQXawbZhnJFKbb9+g2TUFiDnp
         X6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+FjtQ/FsVILsUbpCoTp3msJhtQx3r+SxfudK/yQyxoI=;
        fh=UtYbqaOYLhL0jr38MSKaKGg59XwqhBtATpwJtpEHTpA=;
        b=ESf8MqmALuE1FSSraEJpo8p13FJp8UhSFBldttcd78mm9NdXmlervT7QcBE428/wB8
         JrIvmqm4nw9Ud1sg7zquQLG/XU/d8t46pFPk9aJcCyAkYN/tp9PeWAkAOIs5X/GHCMv6
         yguYlM70Vp2YYOa5jhFmp2odrTeQz/yKQ0iyx+ALghMyprFATSoH3MrrnEkSpSbDOe2e
         Fr9gHCzs0TIrwLk6WHs1gXeEgXGFDkOOMwDQQDT8JKl3fXkGNzA50vlZFJbCmM+J/zMl
         71xHRFrIplYv76qxWELVDbgg2RrYaTdddMDq1a/IfTJK8Aaqu4EOrbD5rKeNd0DWq5vk
         k3+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANmB9jev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020ad45744000000b0068fd7a853b3si2323291qvx.501.2024.02.29.15.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:03:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANmB9jev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfpQI-0005Tf-Qk; Thu, 29 Feb 2024 18:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpQG-0005T1-MY
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:02:41 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpQB-0006Uk-Av
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:02:40 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3c1a3384741so1035459b6e.0
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709247746; x=1709852546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FjtQ/FsVILsUbpCoTp3msJhtQx3r+SxfudK/yQyxoI=;
 b=ANmB9jevY9gILIbAyEONTW1sRRU6f15fvH93MURDwfnorpiwJyYdqvqI70ntqmosM5
 CDzmAAd/gn8chy6su24xTSLdRauPPdOwq1Jil1p9FO218AR1oQPLn7A0b1EMgn8w2ROF
 7GmbZdSz4sDMDHiyV/uG2CY3VNk1tHFAa9QJAeygInixaR82nM5KQzIce+DH8T1WP/md
 YyM3q0bmLYXHCeAAsJulKQYfiJvma+4WD7cwoo2Jb/xJ143CGMJeFmAWCVmhP9I9zg1u
 5xh9Q8kSmV6FJ1aDmibJ8yjZQEM8IA2ynOODbihKF+OzU6XjsAqtLqGc1DtBC0lI/oxU
 JRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709247746; x=1709852546;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FjtQ/FsVILsUbpCoTp3msJhtQx3r+SxfudK/yQyxoI=;
 b=DYpNvAn+tCGZvo2I2UrB91Xl8HYElh5l3XGwEKCLX5jQaws9+sgIVytNHcBOW8B/ad
 qbXQJbnIFWyaqonkAgHxsT2uDp24GyYYOl80KRrlLu42B4szqq2GYLw+L0aJjAvRLoNO
 UmqPWx9DvaKK0fGiJsXEuzsOjXR7lhO8QcFqctr/OSrxeNQFcTTuWK63cehWZPH9FXS3
 PXfobgW8xobSKv51wqxuccAoy62wWB+Z5UVcAkW7fyl5PLxqdNTWIEkyThPCw7Mt3rAw
 6KyhKs7Uit3KLyfkZG4A98P81busHb3jVmW8eS4XXzQXwSWR8dU7MrEBIdpOjkzT0QiR
 aPRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUej8KEc5LdKEgqendQcWCIXXYO6cWbMdls+JoxnKrMz0I+QAzIstLgDHAlS/u5KEtJV5qZezXPtl4zkHP+X9C+H5X2
X-Gm-Message-State: AOJu0YwKbdgQ9GR/EuABn413ooAe/6LQ+ezVtfIjJydoWfnpA2HRrxiT
 R3fyRcz1wlIssQMKxtl8FOsb/SUERxaZ0rXtpu8GKVvvkiKw2zxbIQlAYkGYWF0=
X-Received: by 2002:a05:6808:1202:b0:3c0:72ba:64e with SMTP id
 a2-20020a056808120200b003c072ba064emr21624oil.39.1709247746247; 
 Thu, 29 Feb 2024 15:02:26 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 v184-20020a6389c1000000b005e43cb66a7asm1856051pgd.87.2024.02.29.15.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:02:25 -0800 (PST)
Message-ID: <8d494fe8-c0f0-47b3-9f59-ac69f10c1e64@linaro.org>
Date: Thu, 29 Feb 2024 13:02:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: A4viEolY1BgT

On 2/29/24 03:10, Jinjie Ruan via wrote:
> +    bool new_state = ((env->cp15.hcr_el2 & HCR_VI) &&
> +                      (env->cp15.hcrx_el2 & HCRX_VINMI)) ||
> +                     ((env->cp15.hcr_el2 & HCR_VF) &&
> +                      (env->cp15.hcrx_el2 & HCRX_VFNMI)) ||
> +        (env->irq_line_state & CPU_INTERRUPT_VNMI);

Because the GIC cannot signal an FIQ with superpriority, I think you should not include VF 
&& VFNMI in CPU_INTERRUPT_VNMI.

See comments for patch 8.


r~
