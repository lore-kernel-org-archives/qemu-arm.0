Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3090552lfq;
        Mon, 11 Jan 2021 16:06:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdYR870UpDTHmW30bVj6uNGB/SckvoaGYvy7wXrtNrZowtRiBRnel8GPCaKnk8kkP4jM7c
X-Received: by 2002:a25:d1d6:: with SMTP id i205mr3103414ybg.199.1610409998253;
        Mon, 11 Jan 2021 16:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409998; cv=none;
        d=google.com; s=arc-20160816;
        b=kYK2H8gFEGCT7F4ga855+5CmRdII8yIwOZKMMneXt7FCrXoEo68bvjoOdfb/wwYSLM
         3aXes4VP92FStyOWM9fxWnOF1TG5bXHavE1p1X3i2GOWGcYGGY/C16+7oWT8cXVpIYZk
         fh9uf3HsMV3r51pO5dMVYYpyJAmD9zsGrSXwgJC/c7UgHMKJO+Ek1DmPrJTRfCUS6+4H
         hkIEHzEtl8EMKqMjCWPr2wvI49T3bwa78+vINWsmkiWaFj393o+H7l7qSnKhV1RBSvYf
         kJ2U21OVepnjpjuvfPQvcci+59NwBgmyNnUmDLc6Y9dvILf7BW9H+yq9NXCBYGfjcEPC
         paJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ulNC+wVGmUmcJ5b/YZvDBl+z1bvwMpgx0vSChiFkux0=;
        b=xcWfVI+WFMpNltgq75txsHf7g+hp8bzjn2QZ6+q971CeuKu34l/iUfWxSWnyxWUb7N
         cCI6Icnqr+3c1qkd2yVc/PAB9y7XgYBjM4j8WLJGsBTGrc6uL1qYsD9/4i5JwQxIXq2c
         0imICHNnUGqbD7HUxL7Y5URZ+/+KH9H0RSMWN22cA6NiuMv56lezu+/XGNDUtgZb42l6
         EuLOSlSTdcMH444R1NkiKX5vXLM7LUZV7zPN+7h/6yEE01ktqJb3cny3uyer2xZ6TZLg
         0hsVKrToq2NFFSbGGaQgjYEBufJwNGoYBoaejVtfQhWoDI858tiDZklX+4ZXlE4VBsEu
         xXgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXt8gsep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si1175428ybg.263.2021.01.11.16.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXt8gsep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7Cn-0005Jj-LJ
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Br-000525-A5
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:05:39 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Bp-0004Ec-HC
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:05:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id 30so229587pgr.6
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 16:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulNC+wVGmUmcJ5b/YZvDBl+z1bvwMpgx0vSChiFkux0=;
 b=lXt8gsepYT6nura0aTzs6RE3ABWLYv0Km8GmGBiCogpFfpHO+0z5JkDOp5r/61bzdC
 8O6Osupb12v/geKOY+kiV4OWWUSWLpwrDkAwYMagvUGZXBMHIxl6nVMjlmXcZKkZ961m
 CLbMsEtV9s8khVj0g1ptsQpAkDoh+CdVU90XsKcYKnF9n2q8uEiDVx5StVmqaOFmIo5g
 eUjLYgpzUw6xF8OwVYf0fWnXTDyL1iKXOfg5YnzOeNitHpkx7GrLJb4Hlf2X3vfXbaGk
 ZeObHLlVuk0YbUVRxl/NSpl6xYaJbZ9eUngAC643q4nU8iKRjm9ND6fRcAALWT/r+4J5
 zH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulNC+wVGmUmcJ5b/YZvDBl+z1bvwMpgx0vSChiFkux0=;
 b=UjIzU5EvHo/HzVmNsuqaulXYF0qynIT7F1xuxdzOKoj2Pl0cqqxWOSLJJstBNzvcW+
 NXWHPZMJZ8k9I3VJ9efai/MxZ9CCpRj9AnkSIZbLRen0MM5za0T0gUl+atm/gVlFHEAa
 lOJzkui4yFpTJCwGmlPrs9X9yV7wWO/2joywC5hR2yrLDCSuzpcpQKs7lxJN6OemJLcw
 0ghUJx0hO/fScYyqLTaQHZocGlatJKgxZhNSOGiOZnLVXzstGHjaRGbYGyP7KRbCnIXs
 vupk/SyYuu7K6oX/Er4uBJuy/9gKhTAssBeLn0QAISHKVEusUbUdhNbddQSqIFEhoao/
 /BVQ==
X-Gm-Message-State: AOAM530lnin5rf0SUGPDkQgxVRbevB3khyGa+VoeP6iKIiZQ1bY5LSF0
 nG0oDWeuQ1FKXdqPqEeDiisvxw==
X-Received: by 2002:a65:488d:: with SMTP id n13mr1828443pgs.315.1610409935972; 
 Mon, 11 Jan 2021 16:05:35 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm810273pfd.171.2021.01.11.16.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:05:35 -0800 (PST)
Subject: Re: [PATCH 09/18] target/arm: add ARMv8.4-SEL2 system registers
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-9-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7179fb23-01b9-83d3-3aac-64ed3d4649d1@linaro.org>
Date: Mon, 11 Jan 2021 14:05:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-9-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4O6sxFdp0Gk

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  7 +++++++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
