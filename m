Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2045435lfk;
        Sun, 30 Jan 2022 23:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0a7cl0yrDBw6IcLCxjaoeVffgVuMOyTkM0IVkKnbvmQYdvNpoRQpki3iO5CKfw0iiuHTB
X-Received: by 2002:a25:188a:: with SMTP id 132mr30231103yby.616.1643612623000;
        Sun, 30 Jan 2022 23:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643612622; cv=none;
        d=google.com; s=arc-20160816;
        b=Qv/cKjAalCJyNuW1Mu/ePSVXrvhNNwfc7A9J8Y6uNS2Vla3LFK/aUZwd+J1FPuLIA7
         1dP90brMpVHikNkuW7yAm6Tg+iQkwIvz6USs+g3gJsE4nNPQaHigyiL4m7qOEAVa8H+p
         4sxlBSOIaBj1v7yI/DfvTGI91hOO64pccFsd+U0HXLlYtomkdxkAn+0FHsrFYzAZTDcp
         8RDKLNAR13VCrzQ0ZJzGH2yuTudpXllvYZpOmL18NUqdIqyeem/UlWhIuWovJqbKXMQL
         M7ZtYx+8i7TbABWX1Au1cEZIDF9cdRLjjWo8+EqDlR4DFitlXZ2NDCPN78zUJpFcCMGc
         6LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dSrEyogKJFhAp12eJufVnFm0WUtS+NDb9vcs/6kLhek=;
        b=LR5P1sTCEGFVjK8ilhI8WCiu3SDD4W1cXlY/5lgGA+OTHvRO8LSM3DBp/+KBm8OPeL
         /eUrGrmIEmySeTgRtUM15JCm2OG6slYP1ibUdTmXn++Jmkb4rNp+GOfGnNoR4BTkot1d
         OjhNz/sMlMVtqclzzVLn8EadcsWMQS6ycOFaePXuP0z5tzO9zKUFy/hZKhfh7pPJJCXD
         OzHXSwzeCvqKzqXCg90MThLu0BBYgPjqIXLUMzTWvnSx61j6eZoaXhrXciJgr0gjxtBJ
         83d4UsLfJLD71P9I+4tHY6yl40TC5qhOJzPaCNb3gAvMQawT6sMzb0WPuKWyoftjt8qo
         Uo6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tv/x4bat";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si15654017ybj.661.2022.01.30.23.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 23:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tv/x4bat";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEQj0-0001z7-1a
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 02:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQWx-0007wx-S6
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 01:51:23 -0500
Received: from [2607:f8b0:4864:20::52c] (port=36409
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQWv-00022s-7g
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 01:51:14 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e9so11408766pgb.3
 for <qemu-arm@nongnu.org>; Sun, 30 Jan 2022 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dSrEyogKJFhAp12eJufVnFm0WUtS+NDb9vcs/6kLhek=;
 b=tv/x4bat3Z9ANaFQxI7NjzsmRcp38kDt+s09pUo9HknLavP+X9VrPmQtzPniz611JH
 cZP8GwlqpVcpeAg5rD3uF9v8GzfaqcYqFKmcVd4pvs3HYmeNrQKSLdEdUr0KylbFr2su
 eMKqDyGzYA+uMmINCwBzpV56swVaPdsgEnj6cBECD4DDIRtWr4tbIwnNwiG8p9Nh0y37
 qFm+F/Jdk7Tz+kdDkUK8lmxkY17u72WjVtaIei+WCAW8Tq8CtYZxl0lAvMF7fh2JN1Q0
 pHN3T1T7wVxx4uvVIoMQ4MBpI3O9zFsX1YtRJMOHsLrQJQgZyCPSCKN2ic6NYwn2ViU2
 GnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dSrEyogKJFhAp12eJufVnFm0WUtS+NDb9vcs/6kLhek=;
 b=6LnNSwBvXThPXsF9SpEWJ52VXOooBHhlii4aA9ndDOoNcMQMpTj2ie+IaRK4IoDsnt
 73SoV/4Ar9AuvvWAy22z993SOKuFgHdSPtQAeh0lCFSTcPts/e8vypy7STSvOygXwyK4
 g0kA1FhI0j4ufx9/nj4J/shiJpNufRZfltP85OgA7NWbmdpd2gZxUoLcEDmy3vNFKKwF
 fY4o0Iz3j7+23DUrxav+TAcvg9jpVnW4G8hth84zLwbgQMAiA1l2xXKmku5kTsPwpqge
 eK+c+70YnE6d6aU/mDRksYOqhi9gNCv1v/TsxWrNmGVS1g2heG5eET9qecjYgQGwgdVv
 dQ6A==
X-Gm-Message-State: AOAM530nnhlg+0renh8JACT1boLjDmLj07bQ0xcuF/uqngyy9uvRIZvT
 fybSlKaY3U8+mRvQ2VbIUa0mpQ==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr15423300pgi.543.1643611871236; 
 Sun, 30 Jan 2022 22:51:11 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id ot1sm4363525pjb.22.2022.01.30.22.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:51:10 -0800 (PST)
Message-ID: <dccc1934-cb3a-0f5a-fcd6-bc00442d97f3@linaro.org>
Date: Mon, 31 Jan 2022 17:50:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/16] hw/arm/versal: Let boot.c handle PSCI enablement
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AkPMWkbkzHfr

On 1/28/22 02:46, Peter Maydell wrote:
> Instead of setting the CPU psci-conduit and start-powered-off
> properties in the xlnx-versal-virt board code, set the arm_boot_info
> psci_conduit field so that the boot.c code can do it.
> 
> This will fix a corner case where we were incorrectly enabling PSCI
> emulation when booting guest code into EL3 because it was an ELF file
> passed to -kernel.  (EL3 guest code started via -bios, -pflash, or
> the generic loader was already being run with PSCI emulation
> disabled.)
> 
> Note that EL3 guest code has no way to turn on the secondary CPUs
> because there's no emulated power controller, but this was already
> true for EL3 guest code run via -bios, -pflash, or the generic
> loader.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/xlnx-versal.h | 1 -
>   hw/arm/xlnx-versal-virt.c    | 6 ++++--
>   hw/arm/xlnx-versal.c         | 5 +----
>   3 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
