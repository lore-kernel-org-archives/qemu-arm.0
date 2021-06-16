Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp621804lff;
        Wed, 16 Jun 2021 12:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP8dvt4Sx2XKFuRhgIUe+5r8cf7IbnpdRLT6dNrqFqYOu04NA3YbVe/+KH3LdrZOE4Jd0Y
X-Received: by 2002:aa7:ce86:: with SMTP id y6mr1445962edv.309.1623870185211;
        Wed, 16 Jun 2021 12:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623870185; cv=none;
        d=google.com; s=arc-20160816;
        b=TMezL+Czz7ZtT2MCm7MIPxLt1KfbAtBFZyfbEVZY+zYU715Ctw4sCYpdwjvW/24Ucq
         BZCWNtufprzsJWHmLgShtRHpgpeh626UMHwifu8XdnaWZILy3ZPy9tQm/4/vcVEKPoJG
         Gasr8maZ4fG2WFMs0nwpLtm3M89fObbZAhOu8tg8KQcQgM1MtHxHJSmoQDULbD88IXDt
         RagCHOMDtajZoiaSKty9jocLZl3q+RK4/lgXpsqMVudwVXCnClgCHaB9dXLgpwkDSg5l
         QVB8wshGyvxbrya3GtpBlW4E13ZqA6HZoQgVbOnt0pcKAWF82aw3M36AJ12cZ55pCbvU
         G03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s4TOvHX318f9h9ao1O6xP4xdg33Xz6ackDWY+LYz5uc=;
        b=Zm0/d0ORvQSvGuvjbEBFixcvRXd6Bu9apPCZuzFNrM+jlrQL84Yvfes/CLQPeYmcOs
         HFUZzh2Ua8BWP4+5TnuMOm2Dw1N5cxZ8eoGy5WqmA9ffrANdmqYlMC/hQWvBo7Vygdyw
         KXtXRh3KwqSGf8kdy/47rY0TCOEbkWZgb8Nkj/jN2JFG9XAtCK5J6mRnYoHxoFMqAWt/
         J9/I/1QovZV363xG5O+GZWLeCZhDAyDbQb5fLh6qDtrce+0zDBZQd+umfmntR+7cLYgw
         N1ZvIBRC6PSxVxUUFg0OAchW44oYZj5rm/9G1pgZMTLw7gle+bCvogfJr0DIpsF8Qoh1
         AQjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sEPTjN5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bf28si2906455edb.224.2021.06.16.12.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 12:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sEPTjN5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaoa-0001mm-CN
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 15:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaoQ-0001k8-AB
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:02:54 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaoN-0000Ie-A8
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 15:02:53 -0400
Received: by mail-pg1-x535.google.com with SMTP id n12so2739020pgs.13
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4TOvHX318f9h9ao1O6xP4xdg33Xz6ackDWY+LYz5uc=;
 b=sEPTjN5wbWpqvY7aOJ5Yd/R+MggeSokJ3BySK+2HOLGKBomqa5MEWjBvAz/GpZr3k5
 LOX+aQ8Fi6UvGIkFR5cMjSFQ8UWoCBivTydxGsy+CO/vZE2gE8rGU7VjN7AFcOqfBvgp
 X8FVTNzMWtF/qEWzTITQwp+ShUHq5xjSHXIfdpo8dinAchQgig4Lz5xzc9JbmA+T1CVe
 f5pGuJsBO8aaKNcFdvee2w9cFKBBZlu/+Ta3xedWIHOzjiIYR19J722UtaS2EpQd9L74
 yRrOcsYTV1I2VWeNbRpfr26w2GJFNGJlbw1jwPwcTju5uLb2fPmOXlMp9jokuN89ABRO
 MC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4TOvHX318f9h9ao1O6xP4xdg33Xz6ackDWY+LYz5uc=;
 b=bJsun807JyBkAxrD98f4VM8FVP7VtzwRAlAlUZCaj8HCCmAyL5MNRejuwguzO/VYOD
 NC2bu0jeCT39EguBprPdG8bJSqs5GkO0etf7hX1cNHgJfiHUB6wLC6z3HmucAE+47/0A
 oKLQRQWDMXRV5hI1e64M8fcqJfHvd8DJWEpuqkeT7POnAv4P27CCVOBfxXd+Ydl18Igq
 RK+R5wz9NwwzA42JEntb/6heln1iGeM2ul3hHee8rKZgnH75k4n6Rh82GAGmB7KKkg31
 VDa//YwlFD4dWSaaXHlySKZj/vrypWMPQhwnIyJ3ukQ1Qc8wSI9KJqk4VSSiFfDTME/t
 nG2A==
X-Gm-Message-State: AOAM533W9mlpwdIX/sI+qGjCOeT2K1MzA2SCp/o5tFsBpEVjqM1Kxsiw
 +nMl69ZTiXYPJ48Pyq9WV82/2w==
X-Received: by 2002:a63:195b:: with SMTP id 27mr1096287pgz.450.1623870169455; 
 Wed, 16 Jun 2021 12:02:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y15sm2870715pji.47.2021.06.16.12.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:02:49 -0700 (PDT)
Subject: Re: [PATCH v3 13/13] hw/i2c: Make i2c_start_transfer() direction
 argument a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31490775-a16e-1e4e-a180-d3c473cc87be@linaro.org>
Date: Wed, 16 Jun 2021 12:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 41wxLxuZ0Ku5

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> From: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Make the argument representing the direction of the transfer a
> boolean type.
> Rename the boolean argument as 'is_recv' to match i2c_recv_send().
> Document the function prototype.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Message-Id: <20200621145235.9E241745712@zero.eik.bme.hu>
> [PMD: Split patch, added docstring]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h | 11 ++++++++++-
>   hw/i2c/core.c        |  4 ++--
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 2adf521b271..5fe94c62c00 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,7 +80,16 @@ struct I2CBus {
>   
>   I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
>   int i2c_bus_busy(I2CBus *bus);
> -int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
> +/**
> + * i2c_start_transfer: start a transfer on an I2C bus.
> + *
> + * @bus: #I2CBus to be used
> + * @address: address of the slave
> + * @is_recv: indicates the transfer direction
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
>   void i2c_end_transfer(I2CBus *bus);
>   void i2c_nack(I2CBus *bus);
>   int i2c_send(I2CBus *bus, uint8_t data);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 6af24c9e797..6639ca8c2e0 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -115,7 +115,7 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>    * without releasing the bus.  If that fails, the bus is still
>    * in a transaction.
>    */
> -int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
> +int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>   {
>       I2CSlaveClass *sc;
>       I2CNode *node;
> @@ -157,7 +157,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
>   
>           if (sc->event) {
>               trace_i2c_event("start", s->address);
> -            rv = sc->event(s, recv ? I2C_START_RECV : I2C_START_SEND);
> +            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I did wonder about passing in the I2C_START_{RECV,SEND} enum directly, as that 
auto-documents the sense of the argument.  But there are quite a few instances remaining 
which would need updating.

Perhaps one more patch would be nice: introduce i2c_start_{send,recv} as inline wrappers?


r~
