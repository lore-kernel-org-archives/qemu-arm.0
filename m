Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1723160lfb;
        Fri, 13 Nov 2020 13:23:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHBix2uY55hywi9aAIkl66bG+8B39q9WYUOuOtja1lmtj1gf7DyZcauPtQgA2wSPSIz40E
X-Received: by 2002:a5b:ace:: with SMTP id a14mr5859593ybr.325.1605302615038;
        Fri, 13 Nov 2020 13:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605302615; cv=none;
        d=google.com; s=arc-20160816;
        b=eXnRkggTCx1dj83It7Rqxi6IuMhZfWu9dgyK1OIV0kBgceXVGdUGjNwox60hS/LZ+N
         F4uSrUFIMoOpFOnltdft1PX8iOaMyh2PybKZYc2U32HQe/E00P3BmjdxUppUlk1NpaZo
         wFUNLp4JLNJnwbmRXDWi2qN5zrbq+xEwvZChJsGhZoDBVJhLAi0BvGa8chv8/nrS/a0D
         MdxllPLe4hEzCMUBOgZ3/0uHL8gUFADQTOqJV1cChqBkg53UEsEJXF9RTObCTVLhk6P+
         /Rj3Qlp7d/Ks6QRi2YaSidy7ycc7EfvkPDwfAjLHaUzLqT8zTzo94JNKZ1kqlF+E94MW
         IR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1z2TQOjD4yoRTyAbO1fFLqWdCztBSj3wYN/Z/5fwMno=;
        b=CWhCsYs1K8cRaWZjjUyDmERrj7GmtlK4UGQyCJUT1I8JTzKXG4lnk4AT4Ig6TdPHgC
         B20goFvVBYZYFjQ8oKF7tNJQ+579pUyigB5x0Gm7V1lXlBk33TdcDMbuQUn1u7ZA2Dmc
         k074LdWet8dU+ZNQGa9UFvuOhVXZ03ykhTgFdjSS73JKrjpqxtTyrKgFPiXER4rDu4RC
         Jt5tyxkfw5cawfF0qkXhSDCWBPUJ+AZdCvWiRDYiVVZFid3Wo1FkVqYBlePz0xigpXWh
         ukppEzsOgoJoK1/m3zpkBYvsb7DkKn/1roUiZKvs9xG7yQU2NqbfMc7HSTuWdgLmBioP
         It0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L1+Msx/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f88si12778526ybi.75.2020.11.13.13.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L1+Msx/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdgXe-0005tW-DB
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgSu-0003A9-AQ
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:18:41 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgSr-0005XR-EX
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:18:39 -0500
Received: by mail-pg1-x542.google.com with SMTP id i13so8106541pgm.9
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1z2TQOjD4yoRTyAbO1fFLqWdCztBSj3wYN/Z/5fwMno=;
 b=L1+Msx/zPaZWM5og28DxwKLsTameZAkhrFm9bnLHkNk+We/yCBHbaJqAX0Ch3xLh7x
 ssvCQn7juTgBObm67LQn4KELvH3TFAcbpo3yvha7NgiinGNdX1VvWIgux9DL0FJ59L7u
 l1xSeBls+WSdzK8BfGrKBBLHZ4axT/NwpXrRroOEIKXjtt5s2GfiO/jUq91PQlaY94N+
 AMtJlBAnpyysZvkABmqJh2k7QZrulwi8FQUE8s7ZG+sOVwqbOzNW9UnEdMjSH14tI59z
 FafQGuUEvdP0gjKMYJ7SBrH7q4Uje37NjPsoMPR+MmzzXga9LJBTAS7MXwzE5km2qdDR
 XfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1z2TQOjD4yoRTyAbO1fFLqWdCztBSj3wYN/Z/5fwMno=;
 b=tqwKj2b9T7zmr1xf5smE01g+EHejiC81vm/qacbhojSg1JLkHMn7rnIRlODCgu45wq
 x4AELe0PRIHhjLXrcXAAcEk3PrzhC1qxotJ/GRxUyjkMByza9eH2azqQTdE8gJz6hCev
 urgS9YMGGzQEG+5p7n9EEKNuZfk7u3RM3bKs8393gN2+noMFfI+BvgGG06stL9tviadH
 5IrkkuxF1Be2l8Q/iSi67BNH03HX44U7UBYmIQpdPJO5gFCNha4ZLP9nNZp4r9xl0frs
 UOrtS1RBIq17N8iBfaU0faqNLs0eM+Sl9zfXX6s7vH5FZz8+exWyZMSSP8+tZMoDyAPs
 /sfg==
X-Gm-Message-State: AOAM533FCNc7AkJphOwQbm05rSXir1VW/1kVEToHTMlwZDshxfUKVv5f
 nNqDO7cLh0WsUS6HnAFSGADUHw==
X-Received: by 2002:a17:90b:30d0:: with SMTP id
 hi16mr4665227pjb.144.1605302315516; 
 Fri, 13 Nov 2020 13:18:35 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a3sm11077390pfd.58.2020.11.13.13.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:18:34 -0800 (PST)
Subject: Re: [PATCH 01/17] target/arm: remove redundant tests
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38693f30-7eb5-69db-b010-4471e0707699@linaro.org>
Date: Fri, 13 Nov 2020 13:18:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: rNPfBVmapgx+

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> In this context, the HCR value is the effective value, and thus is
> zero in secure mode. The tests for HCR.{F,I}MO are sufficient.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.c    |  8 ++++----
>  target/arm/helper.c | 10 ++++------
>  2 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
