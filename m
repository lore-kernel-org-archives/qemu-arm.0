Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2720720ejb;
        Wed, 25 Oct 2023 06:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsZNOnPmgINHrNPRby8WKx8GCIRVXNvzXRbLNSny/YpyaM7BU5l8+7N+Ox5/0A8VPI14D+
X-Received: by 2002:ac2:54a9:0:b0:500:b2f6:592 with SMTP id w9-20020ac254a9000000b00500b2f60592mr8675397lfk.50.1698238909765;
        Wed, 25 Oct 2023 06:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698238909; cv=none;
        d=google.com; s=arc-20160816;
        b=XOgyCFkxmHP+xSCV8i/8bSbdc2bnw17sAAMDi6I4lNOhK2l2BEKpRJn/D0hnu5CvVK
         XiZtKL5l6z9rsVt8GmdEqsBOWT7p7F5085Vd5GBjcT4k5ccsXpXGzdC88IsRXYNZxd0p
         9nubeEjEZedCEU3yDmHczmWFqMcIFtaJMlYA/2DcYyXWX9BNvn8YkKQad/LCODnzYncl
         Kh3Q9mX56wOAgYFanOnvXFlBxgmPP/LZJXN1yamwDxB+stcnf8W6MGrtB8MJenjHI/RS
         NflFJ32XWrMYGGu1T9U2y3X3BOOkq64GD9bjme7CGOVkDhsDfyzrA/GO2dW8Bhxj6Ny3
         okmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UGYfFD6FZuCoZ0+PVEeRuRnNgK02r/WDHE/W/HQz5qE=;
        fh=YVDF4RkjcP+UEktHgwn1ALzsBwH/84z1qIZ583TUaqw=;
        b=EOZHPA/1uEV/+aeHyDpuBFxge7gDkbjvntkHCubbL0X/KE6NPwcJMuLFNm+EHdw8YG
         TYcqNj7nPFoUL0ywqInbsjcd1yi34bCwpDTIMzPwLlikMXcU3+9VqpLbTXHm8F3lmkUI
         yAUzNVIPYSrF8664yAQHLL6+J7IC8/xWu2XrIeLKuOLerNUTcrdA0N+qLoYqjtREQiCy
         bCUR5KEVdLOF7JSrklGNtuUDgQFQIi1HFe5M5nL8QqhNtvt/VOEfVA/bI6fqYAVvcfIj
         q9fidvPZJCmIUJNR2sifTeZZzliJW/TEgE+TmpErYYFxuYNwH+o32jaqqZwQq7rFIx92
         94hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zg2H6/ce";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a5d5042000000b003233944ffb0si7681778wrt.425.2023.10.25.06.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 06:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zg2H6/ce";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvdW0-0001bX-B6; Wed, 25 Oct 2023 09:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvdVe-0001NK-TP
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:01:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvdVd-0001jl-5W
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 09:01:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso44338175e9.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698238875; x=1698843675; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UGYfFD6FZuCoZ0+PVEeRuRnNgK02r/WDHE/W/HQz5qE=;
 b=zg2H6/ceo2tL4HYJ8vfxi6m6/LnCiJ/QMRA2x5cN3DojrseYgdGA38AA58HnG3sb+I
 vclTeaB1CJwl5obuG4jCGg9iU0XXKnKmFYZ01SYhEzpSqWztJODmzWpmNMb5BfH10Xme
 5UQvmC/KV4UoIBeV80suE6EoD7+ozLxov220jIUa5LrS7vLLwPXtHTEmNcUSyWKuepFu
 bV7sfE8mc4nXa47TfY32RP8lm/eYVTYAKdolRYCmomykRMh5vTQazM/Lf+9o8SlrT6rg
 prjdfqirPVU4G82i6xnUNPxSSZeHAuTHw+6e/1Ox7viLTAhfcyNSV4kzebreR50iUTgg
 EgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698238875; x=1698843675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGYfFD6FZuCoZ0+PVEeRuRnNgK02r/WDHE/W/HQz5qE=;
 b=sbFRHhq4EMt0eLxGzKwK1flENf2VaCmx0unxnizjOs1nu4GptY/1UCQNGkrpz7kYWk
 9pJT2PuQ7XhcmHr5MHF4/I8xeosA/Y3itUBNIvCRKESHpjKnfe46jYrLtOA6myUuvVZk
 su3UR7Aioq2TIlk5cudLwZQhWFSKWi5coy7a7MhZ46VylejpnnMfHlBuWaqJDTH/bYfR
 oDpiRYFAhd31588IPdriw2RL5dDSgy+0EbvLT+pHcg3KutVrLnx1GlQs2gDKxOxDDCvC
 1TGpW7x4U8qDZjF3mYk5c8c9NUQo/Fl0vXlU6jRhFBKHZrPQuQ/aQlm0VHqZrWBPlLgR
 6uvA==
X-Gm-Message-State: AOJu0YzRYZYmHEfVj3B+Wha/pO8VOWuOZn1Eti9BLwa0QLjKIP5k9+tW
 Ys7OHzBbGN0nHGfQo2bzGA18nipZAYsY7GwWZhA=
X-Received: by 2002:a05:600c:4b96:b0:404:6ed9:98d1 with SMTP id
 e22-20020a05600c4b9600b004046ed998d1mr11496175wmp.41.1698238875438; 
 Wed, 25 Oct 2023 06:01:15 -0700 (PDT)
Received: from [192.168.69.115] (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c320900b0040644e699a0sm19205355wmp.45.2023.10.25.06.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 06:01:14 -0700 (PDT)
Message-ID: <721493f2-fe31-548e-83e8-d8d6bd3a53df@linaro.org>
Date: Wed, 25 Oct 2023 15:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 00/11] hw/arm/aspeed: Split AspeedSoCState per
 2400/2600/10x0
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20231024162423.40206-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oYHnIQHnkCc0

On 24/10/23 18:24, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (11):
>    hw/arm/aspeed: Extract code common to all boards to a common file
>    hw/arm/aspeed: Rename aspeed_soc_init() as AST2400/2500 specific
>    hw/arm/aspeed: Rename aspeed_soc_realize() as AST2400/2500 specific
>    hw/arm/aspeed: Dynamically allocate AspeedMachineState::soc field
>    hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
>    hw/arm/aspeed: Introduce TYPE_ASPEED2600_SOC
>    hw/arm/aspeed: Introduce TYPE_ASPEED2400_SOC
>    hw/arm/aspeed: Check 'memory' link is set in common aspeed_soc_realize
>    hw/arm/aspeed: Move AspeedSoCState::armv7m to Aspeed10x0SoCState
>    hw/arm/aspeed: Move AspeedSoCState::a7mpcore to Aspeed2600SoCState
>    hw/arm/aspeed: Move AspeedSoCState::cpu/vic to Aspeed2400SoCState

Updating other reviewers, this series has been queued in
Cédric's ASPEED queue.
