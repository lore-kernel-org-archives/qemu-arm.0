Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2452424ejb;
        Tue, 30 May 2023 14:27:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FnokCypkZ2QuM0HccgUpwrz4IBTc68HZ9/NeznbpUNRQZcwgPn9RUXo45ToG9gJLe93GL
X-Received: by 2002:a05:620a:40c5:b0:75b:23a0:e7b6 with SMTP id g5-20020a05620a40c500b0075b23a0e7b6mr4768483qko.23.1685482068268;
        Tue, 30 May 2023 14:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685482068; cv=none;
        d=google.com; s=arc-20160816;
        b=BQeu/hugEOJ+QfSugzkvr5ss1qhZThddRzcW4MwxlJivx+VKr1T1yX5z49i8fD/XJk
         mEVm1W9kXukjwiUqIv4YUstXo9nL0IJtT0CCFDP/qOf+vcHnPtuf/oQJ2PkRO4YCxj88
         5pNAlRc9ZxBSVUVLU3EO5lAES0NAcX8hTpqFliHRVqiX92nOL24kavJpWIsLj27DlPDi
         HzeOsUZ/xlvalPQ2PSajpWcDh20KLFt5jSoOZsszaUqnB7dLh6wBJmupOD4ahq1ZOWeP
         OTvurDATv6ij/qx+HZ0huVzVCHSf8wCu34NBXkHGYt82e/0iAcs9ux1xL8b4igP+sqzh
         Uq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iE15bGtQQeyfUNU1+Xr91UXiNC5Y62gPfcZSsnTaSVQ=;
        b=kVJKXt3Burc50JjW5p+CVKNxmlyqlBYr68i/mz8/mMLBgaKv8m+w/9V7NQvapoMJMU
         1Pb90sSlEsqWRE2Sy/X+Fdn+u/vHAi0QeOpsiH0x+nPZvApAyeq2egFiIqZ+NaAn9csa
         8pCi6+8Xv7QNFqrHfwBIOw7s5dIGxMiJBJ/mVRu5oIyqE3RiQnfIlDmC9fSmBoBNvokV
         VAp1cNK9j5cJQGCW2ZjWDIFq+xQ4WtXTKJ8CuQ8iG9ujx6fmgD29vcAJRMvhTTMEZsbH
         JKkCsBW2Cd7nP3WKV4aeJWkFkEx78oU1r6MvU4lFs2Iz62/3Pvz+yCwknlMVEZn9rIqo
         xpCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COb1nVH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05620a103200b0074576196164si6848521qkk.549.2023.05.30.14.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 14:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COb1nVH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q46sI-0003aG-5T; Tue, 30 May 2023 17:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46sG-0003Zl-TO
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:27:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46sF-0006g7-Cy
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:27:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f60e536250so2231245e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685482041; x=1688074041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iE15bGtQQeyfUNU1+Xr91UXiNC5Y62gPfcZSsnTaSVQ=;
 b=COb1nVH3D9zTAQc7nmaVOXIhvPXV1IQTS8nrtlXadukk43GYyYmwMWBsqyNglxfD9J
 ns2H2fpey8DiO+lsZrtS7xQoT9b1gawLqPprJdLcm8BHMqupNrNcJDYALQJNY6AKgJdc
 E/LZVOhFs8zigTRsU6Ix3BrD9r35SwVorElH8wikPDcfTYyf2FoCvy7JO/L1l97g5TfQ
 I6BPVQONkPqgNEQiweJ75hD6CuyNHRrssPGpcaHK0yJzpj9h3ETR0ne/V3INn8jgwC9y
 yNZEyTYAJBEmy5ROkaR3GKeSjcAU1Ad6ys331CbHLCGuCFVp5/McL0rZL8rBJB0GAUDx
 FzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685482041; x=1688074041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iE15bGtQQeyfUNU1+Xr91UXiNC5Y62gPfcZSsnTaSVQ=;
 b=b0ooONHvRr1eBcSM0W1xLQPsonnxCiiYA+pcdwb+zy7TcKTfj72jE4/nXoDxz4tU+O
 jKU1nr6/FiCaQgYqhyhmN42QMNMUqFhGoBMEjCiNuUkN43GRl8TRffSry+ozXQrqRtu9
 KBLZRejo+oSxWRlEZEmxKOPuahNiIl/00lEZC/eG5oBot8ymbKSDYREFK+tG43hWf0Jb
 HoqeKYkzy97e631E3aEjONyhwf7Os/rLfMCRmv7c2gBcoFNH/iHE1Dxcw9oS0hAhKCiL
 7HY3wFwZg04/LwgVfq7xwTUAUFY6Rb0JEif0sl6tkfUXebmauFFpUFHKe/dTi9bcNABi
 s7aA==
X-Gm-Message-State: AC+VfDxhl7AWxEEapFb+1O0hpXdwsmNe292MxHVXjWwx+bgHgiriJDFk
 Ded1Ptl0GCLBagWYRSGwN4jWbA==
X-Received: by 2002:a5d:4f84:0:b0:307:f75:f581 with SMTP id
 d4-20020a5d4f84000000b003070f75f581mr3258511wru.18.1685482040974; 
 Tue, 30 May 2023 14:27:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b0030aefd11892sm4357182wro.41.2023.05.30.14.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 14:27:20 -0700 (PDT)
Message-ID: <981dd9cc-9d2a-9e41-8ae9-4fa355b0b061@linaro.org>
Date: Tue, 30 May 2023 23:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 03/12] aspeed: Use the boot_rom region of the fby35 machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Peter Delevoryas <peter@pjd.dev>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: owZoV3A6RQOP

On 8/5/23 09:58, Cédric Le Goater wrote:
> This change completes commits 5aa281d757 ("aspeed: Introduce a
> spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
> boot_rom overlap region in the SoC spi_boot container") which
> introduced a spi_boot container at the SoC level to map the boot rom
> region as an overlap.

2nd patch,

> It also fixes a Coverity report (CID 1508061) for a memory leak
> warning when the QEMU process exits by using an bmc_boot_rom
> MemoryRegion available at the machine level.

1st patch?

> Cc: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/fby35.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)

