Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp270079ejy;
        Thu, 29 Jun 2023 03:58:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fgcNDHNg3hnRiYNmFIlzLQVqrTmX4k7Iwu08aVvYHyfOO3aU6RlnNWkrUfky8Ojydj1G0
X-Received: by 2002:a05:620a:d89:b0:767:2f4a:e07a with SMTP id q9-20020a05620a0d8900b007672f4ae07amr2026801qkl.68.1688036305873;
        Thu, 29 Jun 2023 03:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688036305; cv=none;
        d=google.com; s=arc-20160816;
        b=AWxHk8w5et8pxBNDeLrSNteyqWQItIvIs9RZOSDVTlaj5PftNZlp89xhhyEYqXaAiS
         tPu9SuffWTJ4KLMytD3AwymUeV7FrMR269FXdI87FPkg+dP159zmV8xk4psFOsYcgnly
         iiy+Pob2fjHO+5UhDo5MIok1KEzqZRiTq38eR8JL2LzC5Ys03BEe3DkD5WnP5AAEPgWd
         TxIDf0spX8dBdyR9mxxWKEGbIyYtkHjs0RF/Z1bZWDyeHMnbG0DeFJSZCa2zi86Rn5Pe
         UMinNup06i1VmPzhd3/cqmKCgUtoGsKr42sLRHQ/dPvmKCOrefqyBE7dJMEgZvOxp0S7
         DqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KRSCGTG8JCbJAakePPjN6awzndENT09h1KFeMkJoEfY=;
        fh=ROmRueNIVJTXDcq6iEAWUT+MximvqXH3BQLMEavsX+0=;
        b=whV0gDRfh+7BaDyrQ0Giqkvyw6oLmo3kDa8xdYW3UDIZIEttqaml/Lio/zTM73P0k5
         Q9eQLtAczEhZIhPy7vMVk70XKrbiPXuFN3XK0JeQLnG7eFIfsNkfltj9vCo44E1A/lmC
         7GYhdZODVeQjIYSe1zTH5pvo/9AsvcL7wf+0MDSeXBvwgd1t2c474lOS2Yw+kkcZd9Pi
         9IGdTpB01ydMGb/pvb5WMalltQu0bhdeykL2ZbwMzUAfCq3qZ+E1A8gVh2kdIYV0ogIY
         2mQVknzy8qzh6k34VEn7mHmNLUD4tV5R8Gmh+bI7uvxSX+V8SC+t9P2iJDQdsnFiBGRZ
         4M1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlM3Gyls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b007671f40052asi2306115qkp.105.2023.06.29.03.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 03:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlM3Gyls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEpLc-0001nd-9j; Thu, 29 Jun 2023 06:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpLY-0001nD-N8
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 06:57:57 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEpLW-000093-9N
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 06:57:55 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso831314e87.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jun 2023 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688036271; x=1690628271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KRSCGTG8JCbJAakePPjN6awzndENT09h1KFeMkJoEfY=;
 b=xlM3GylsziU1IhyZ981/bFa4wjeCagJXqFmG7f7H6SpUSjdr1ebFpu23noCv9lY/iv
 OoUwAdg9esHCQa4FidwLpLNW8eBEO5kRYtW7zUAYaXzDu5ZzmUaYgli+ep0THd0ni9x/
 v3nKjAWUExP8HLVJwzzByqGiC0OaHKRUW4U12YWnll7aBMLwsYqOBtA+Z7uzGAdgW39F
 kAYiA8WZHotZXyeWq2O3ZDnLCuUWMHck3tOWoaCHp2/YQP9nKiF1WgXPLlAIxJ1ku4/y
 t/EMiHnhRvJXrgBFcb7EFH5uuXNUsfTJ/vL4G7PNr3CLkMg8DoybMSqfNOYV86bib9sb
 PDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688036271; x=1690628271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KRSCGTG8JCbJAakePPjN6awzndENT09h1KFeMkJoEfY=;
 b=dj8WPdAfYP80GPsX644w7wElhfPY1jWY3uMO9kMV+fZAieqyh0n2abd4+SVKsWsgNc
 kbbxB0BlG8likg2dgMqYrXtnu+EOL7bJYq8KVFdHUBultwPf2Pfqx5gl6P3+5OOcNAbb
 GRFmY/HisiIAoCphcShSggsYoVO3WpXtu57nx6AhdOXSFB5BvKNnuTAvR/xJoJ3AUrxr
 2BPJWeb/5+6i2k+SWVxjHxsevEMFZkydKeSRB7d+1klTuehF8LMM97lNUwB8Q2U/08Oa
 lCmXlfl5olZIXVq2ETjMuVlaUf2AkdJmgqKo0exNGEqrTP0uvAmcg1O2LKCQMpQ11OnY
 Umew==
X-Gm-Message-State: ABy/qLb2cmY0KX4UfUfg+MH/A43CWoelRpXaEsS+1FdaOcYIKbUM5/PC
 LLELoYpozF21311Lg+GDBPFVZg==
X-Received: by 2002:ac2:4c48:0:b0:4fb:9595:15e9 with SMTP id
 o8-20020ac24c48000000b004fb959515e9mr3174888lfk.22.1688036271188; 
 Thu, 29 Jun 2023 03:57:51 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003faabd8fcb8sm10112133wmi.46.2023.06.29.03.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:57:50 -0700 (PDT)
Message-ID: <56b24806-a8c0-6e19-7a15-2cb46a1fd138@linaro.org>
Date: Thu, 29 Jun 2023 12:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/12] aspeed: Use the boot_rom region of the fby35
 machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Peter Delevoryas <peter@pjd.dev>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230607043943.1837186-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: KuCcA3zsMW3Z

On 7/6/23 06:39, Cédric Le Goater wrote:
> This change completes commits 5aa281d757 ("aspeed: Introduce a
> spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
> boot_rom overlap region in the SoC spi_boot container") which
> introduced a spi_boot container at the SoC level to map the boot rom
> region as an overlap.
> 
> It also fixes a Coverity report (CID 1508061) for a memory leak
> warning when the QEMU process exits by using an bmc_boot_rom
> MemoryRegion available at the machine level.
> 
> Cc: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/fby35.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

