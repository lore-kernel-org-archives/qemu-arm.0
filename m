Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2717714njk;
        Mon, 27 Jan 2025 13:14:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZwPoixMSQFxGBQdASAdkPDMhBFkdETFvRYe/kg5qR42eU3D24c4EbzvcSa+EHk4Cq6BP3lf9A2rEigg==@linaro.org
X-Google-Smtp-Source: AGHT+IFcgPj8rj3IPrn4OotiBRxGTSF/vKbbbQRyRhVHPnD3BFFgzKNeIjFWrQL+6VFSmylxkFml
X-Received: by 2002:a05:620a:2490:b0:7b6:d3e5:4f45 with SMTP id af79cd13be357-7be6320d272mr6084787385a.30.1738012448578;
        Mon, 27 Jan 2025 13:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738012448; cv=none;
        d=google.com; s=arc-20240605;
        b=PGAzrXQH+y/UoIPinYpz8lum3tQ7NydYQ4BZyv33iwMfbYlYb1FPwht5RSgdNtd/Un
         v+Jg5c+8mK4LvI4M00jSBH5AQutDhRJMs/7nZemnYUSkvm8IYzFDbdsrHtfr+LMFtNiK
         8GMoIo/4F94gfrtTWCcb1Pbf2ymwCOMEY8ehBN4HvDqLAbpDEMr6ceFW8DIljz8Th+NC
         Euko1tNSiV8QfUvJRrekV/RfkV/M8va8ssdO/AXY8hVvrRCmcDxxzaIega46kyMckChP
         PNNBhbYXwERD/066W7aHseX2XTSGp4BIr48UAgKwRFVuHxLlpBUhTr3EbafFcyTZWgle
         2o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lMluLNAOvaEWt9zJ/HFJ/dscsMm/gOn1zHA8uO+W198=;
        fh=Cwx8hd7ImawvgZANqGkXpo+2yypKampaU33T/P989g8=;
        b=g04ovW7FUGb7V5cVcwVwVDTiwbNhmyEWUWWOXvZY0DKzqq8rgp1O1HyXM6tdrdQFiS
         ZKyfz8L1ghgUNdwQdh9iedJpxbWOdDt+QRZdRiz17LNyWUJlbuyxmeX2Q5fJVECd6vTp
         MTyZwzXawW3Oz+9vKumoE2rsSsVBpo1K8rhaO8k0II8bT1WSjcxGXfLDQyjbvRO8AR00
         0Wg5YdUplJZxmBeLhoApmkyvzpy/duCbLzNYiVSSExCtqcsxdKTjNVrKF5PYYZNHpXZ7
         J2N4LxQ7XWRxWY4X4DwEfnYAt94SEkuL+xOWiCN8NueUtCmkwTLM9JYL+VFwI4/RkgIA
         lipA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCKaACd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee1109si1196103085a.198.2025.01.27.13.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:14:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCKaACd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcWQa-0005Sq-0Z; Mon, 27 Jan 2025 16:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWQX-0005L4-5j
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:13:49 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWQU-0000oC-Fi
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:13:48 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so118292195ad.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012425; x=1738617225; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lMluLNAOvaEWt9zJ/HFJ/dscsMm/gOn1zHA8uO+W198=;
 b=UCKaACd6IR0t+f5+nczBPBir/ey6E5Bwf8uQrYua0vzZf+MMfWlHfrA+8NdK7dmeb3
 NZm+yadJjThKDpOs3lnlx9h9RQ9IdPiPvS//K0xsu2kGTRLyyBJwBA3t7GK19+RCjijR
 DIFQx1ys6TN5+1NJumWIoTyTLMuTMd4w2YaBsL7YNuQVfl0ByUqxsoepVSMp0wiCTVsZ
 XejWqWlxQmcSabXqT++qrABa+jQqKv+KUp9VqyplKtoUcDA7U9Z4RKdLAQlKWibqSZ2x
 6IDvVWR0h3u4Yg6cjugBBVs35i/JNWIVvPlNXVg+99z4Ze8Dtb9xDAPMAe+C3yc5Muwm
 ZUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012425; x=1738617225;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lMluLNAOvaEWt9zJ/HFJ/dscsMm/gOn1zHA8uO+W198=;
 b=kaX+3H1uGPF4vblPrI5hDbDcdzKBl0xsutRooQo0BjCVJZ8lzOvqoq2lv1ydqN5TD0
 I6KUsLldGltrne8I9XZJx5/c2AmQW0X7foFWJqsUSzsyALI/TZbFdEttDhKm4XIzoO3y
 KFjO7dlQ3bR86khvlGpbZ7NzIrcFeKnJ6/KoAgMGRBgkpFhYYAKTNVo1vYHj97O3cqlj
 2wNIcgYAonzYLHYGyby5TS1LxORcpBn55UxpCRqWJdK422khI68XtpuvFOd8H/aAXm5K
 aBvXpzZWxpmjg+/0bfQpT+9vftKU79AxSDj2PWbvEnWNzvZQs60iK5pYAuHEvHgTktb6
 0B7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Ao5tmxNBwukEQ2uRv9i5dLonXSMN69aeuXcriTJgrtgNfmy+UIWud5xMr8r4TBQoGuiGDZFVMw==@nongnu.org
X-Gm-Message-State: AOJu0Ywzcur31QT7WczcqhMaEEel5CBVJkqmBLpIF1H7+EFVoGGMI/jE
 dUXZmSeRnJp9Szg+DmICnhwtQsd+d9DAI7SJnvBWkDJlaaiwpBUb5NA+di6YC5s=
X-Gm-Gg: ASbGncsb8Gb6MMLgXgOT8QAATNsN6D6fvvSC17FWvmc7rWM80iJY2/iW+I/K2GjjDKP
 gljquqe29e9JnFD6ty2DzqSKf1N7XcZcIgeF9whyUCX+2g09rbmhzrmgXsSJpUcJGNHOtyaNQki
 gts1thbgMVO//CmJOaNamX7NACML4xp8hCRz4xOOwplH4la31mRaunDxNbrHL+39gL5jynSsziA
 /2ZlVKJq4LkqMD/Tzyy0xZQGykGis1soKkQ9UlsrXbzqkHGMx9kMLJgivuj+y8CPegN4QRe5aaW
 1QB6JKhFo4u+x6IiVSKb++saBfxFe+u1aP0yLp1pSH6cBgc=
X-Received: by 2002:a05:6a21:6da6:b0:1db:eff0:6ae7 with SMTP id
 adf61e73a8af0-1eb2157dcc1mr62769252637.33.1738012424554; 
 Mon, 27 Jan 2025 13:13:44 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a78e41dsm7929191b3a.173.2025.01.27.13.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:13:44 -0800 (PST)
Message-ID: <bf36a5cf-c74c-4dba-8aed-cbf314f380f8@linaro.org>
Date: Mon, 27 Jan 2025 13:13:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] hw/loader: Clarify local variable name in
 load_elf_ram_sym()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: 0D/fJ422io/z

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> load_elf_ram_sym() compares target_data_order versus
> host data_order. Rename 'data_order' -> 'host_data_order'
> to ease code review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/loader.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
