Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2662715lfk;
        Tue, 6 Jul 2021 18:30:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytL2MDKa0QS2wIAkrKa5kFgQwF8ZV5Rfpd9L20zIAaW7XDadXcrUwLIKPOOJ3OUPJKY5/y
X-Received: by 2002:ac8:5f48:: with SMTP id y8mr19962211qta.191.1625621404937;
        Tue, 06 Jul 2021 18:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621404; cv=none;
        d=google.com; s=arc-20160816;
        b=Rb71HDl+o4p+fD6+yPueaJyN8BCkl+zX7pQ0txR8aZh47JamJcMQ5jHEV7vVeI3eem
         ByaBGdDwBq/IUKUecQWbez7QIjMC4Vol5+S7i3COSkpgpIgZZc4rM7pMt9aMebDA8969
         3bBb/1ivB1GiF9LnU+GN+pBaGJYZahKDvPCZleQDdjQUPgJQCtv/I0psO9Ez9hd9POix
         3UcIe40+gx9Ay0p49Txk5PlenafvENtDKfr8F7hdQpszrQ6OWzES8PWRsGZWVnRNDJCn
         5NbuhLxXI3r44VEV784MdiaMSWXBkCwzKF+T4StFNzSN4Yaez1ow+H/fZ2uMrH7SO2vi
         2Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=25d6DCx4JES3PoAwzElArCol0of7Z0Fgihm3kJ0b5BU=;
        b=0x24OB5Jcwj3CuTLwQJnhpEFUEQMWY+Tbr7BIF8f/Io6GA2XKj+32rlJqUOIlQ/xPN
         VoXxKNvhFRG4Aip6dKPjZg0h8oNxkig+rKtIG0wjl/u82ydBuJ8SL7uXsjb+UlMk6BsW
         zCAEdvWCo9m5yKXKHkkDEhQU6u3CnGrZqInhC4xMiYIsJeEG3Ok9+H9j/ySbHZwgjmrf
         bEvLZbO4tEmDt8/26uQ6vf2Tx/Qfc3YMSFHAtff35rsRw9bcYo5ITch45+50LqNVcfcl
         OOKLzmWasXkYJGXRVO7Izweld5c1W+dLoMYXtpyP1r7h3PHr6g5y6kz3nE0Rw2/KAMp6
         teig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOinxNmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si12100553qtx.225.2021.07.06.18.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOinxNmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wO4-0007ng-9g
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wNs-0007nI-La
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:29:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wNq-0005zW-NE
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:29:52 -0400
Received: by mail-pl1-x630.google.com with SMTP id s13so148429plg.12
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25d6DCx4JES3PoAwzElArCol0of7Z0Fgihm3kJ0b5BU=;
 b=EOinxNmK/tE9EQ992NdxOOmvKnHwINojSH6bs+5KS7I98J1w3Q4QJUyKkUTyoayvU8
 bzZ99wAnnzPvrI9gisnllO9SMNxGwmMe2cFds/WT4KjiLrUtK6MRoPKfIMFfB/YREl1z
 H2+22uZUSD5VlikeAdooh/85gnaKEK4sTk3t3lkLeWXcBFsWoYT0pQMKvQN59Ma9sibU
 scZB8q/9D4XxMGCK3i6u3LmjKocX2wXfEb22SE2ygsh6XtvMbBshh0yU9SSQnA7Pch24
 kkaGlO3hTwbAtp9X3qR4kBwpk7NeyhfO/gvM2lajZuIuYXnkUXs3ZeNuAX0c1rX+czfG
 rNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25d6DCx4JES3PoAwzElArCol0of7Z0Fgihm3kJ0b5BU=;
 b=eVVGSbZCqRJYwHQGYeugAgHdFO+vKq5wpZ1HSSOPjJCUIV+Gs55ybLoL8xUvsgaeTb
 c1V7XAtLEQ3zEl/rbGiJBU38YVk7R4RGDt0Dwe9vJ3tobrIiVgfixGL3Q7z8LL7gMdPg
 SXpfUlOhIRYYmiEeCMuXyAvOXBO+dG2G36udjs22gupKIOzthJVF2a1bWuk+1zWqB0yy
 utSHDUmupDISG8cLFjyX/IhUhUp5VdWln7Hhw6/QX59/p6fW4+BY09OmJul9MocV+7ea
 eonBER8+WGwgVNwMU+k9KuY6542NUzYF9HWW0y7LQrFV30cGMgupwjGA3eTYzJC1mZ1v
 9M0A==
X-Gm-Message-State: AOAM5320R94XHCHiKXn5S/oqhJCW3/wBSuv8NxHVN58dR59yaRb3unKJ
 2ZMCaTcFyrCDyhhDzGoKd+PBrg==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr3315518pjb.141.1625621389342; 
 Tue, 06 Jul 2021 18:29:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y15sm7863488pfl.92.2021.07.06.18.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:29:49 -0700 (PDT)
Subject: Re: [PATCH 06/11] hw/gpio/pl061: Honour Luminary PL061 PUR and PDR
 registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdd8f2f1-471c-e3d1-ccdd-524ba3ae15c8@linaro.org>
Date: Tue, 6 Jul 2021 18:29:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OpV1qLlzxx6O

On 7/2/21 3:40 AM, Peter Maydell wrote:
> The Luminary variant of the PL061 has registers GPIOPUR and GPIOPDR
> which lets the guest configure whether the GPIO lines are pull-up,
> pull-down, or truly floating. Instead of assuming all lines are pulled
> high, honour the PUR and PDR registers.
> 
> For the plain PL061, continue to assume that lines have an external
> pull-up resistor, as we did before.
> 
> The stellaris board actually relies on this behaviour -- the CD line
> of the ssd0323 display device is connected to GPIO output C7, and it
> is only because of a different bug which we're about to fix that we
> weren't incorrectly driving this line high on reset and putting the
> ssd0323 into data mode.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 58 +++++++++++++++++++++++++++++++++++++++++---
>   hw/gpio/trace-events |  2 +-
>   2 files changed, 55 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
