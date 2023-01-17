Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2094629ejc;
        Mon, 16 Jan 2023 22:47:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXutPt7aZ2ZvXnGst74XzC8YjtaqsUOZFHmo9gUa0Yqmn3aadZ8QJEExaHvMHhIQsRm/FNhC
X-Received: by 2002:ac8:524b:0:b0:3a7:f424:d1bb with SMTP id y11-20020ac8524b000000b003a7f424d1bbmr1705818qtn.21.1673938055351;
        Mon, 16 Jan 2023 22:47:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673938055; cv=none;
        d=google.com; s=arc-20160816;
        b=mq1YV/Kkoz3gn4/KBVUMGwSWGAhVtMXZMx5RsFGIlbsMFHNz7LgeYkH0L2ICdnoYS9
         ofMEwrESldgfTb0TnjG4CegJfgnkq+Zme/UyQzx6MD2hL3qZ0s9PbJLa9TgyKexSUSnf
         R2/v5+i9pAkLHMVX0C2VMzYFtjIxWIY2al8NZ4Xe7f2/08/hCObYatHLbHEzIhfAsQ2e
         fl1342+s/6ZhO0ayMc3tbcD4/CHM+7R9wDQ03rWTcNeG555NCFm8piRtAAp3r0RjMDlE
         qbzNktzpHHIF2sAkF5d8ULRiqYj8QCdb3Ti+CP+TMvfbWdpQ3+0lJMPFW34IkoAPz3Mm
         Vkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FQd7INcG/xxlIZsMMLARuLEBz5TWChZoMsVbajCKuTw=;
        b=jEtaLS9i4KcFALBayBxriBF1mK56SgdxXCRUs8DZRibXd+O8vPwr/4sXocbaXIT9OQ
         /PMk9395KStYVFXvXA7PL480BIor9qkAFjFHFYrCicg3MIJwY0qG/86HKjiPLzvKxAfQ
         E8e6DCVaKKcQbeJXkGK9wP4nX4rjjIeWWnS8NtCFA1YFxs6U8WZxrmC/J91L+YLTKMEW
         PVhlWMG9oMGPaFtmKAnDdb0wu37eymyvHwwMi1+MpdPSW+tvt1XH+zW6NceVh/jrvqrP
         HjXxE26d5U8P5s/R0O/Z03xFATTV1ZhvaxmwWVaXEuQaKNTxGIfLTReNGEcHihtfEFCe
         ohig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMcAtctI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga16-20020a05622a591000b003a7ad4b9ad3si4626229qtb.708.2023.01.16.22.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 22:47:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMcAtctI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHfke-0003L2-R9; Tue, 17 Jan 2023 01:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHfka-0003KV-Ad
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 01:47:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHfkV-0005dx-AG
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 01:47:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so29513985wrz.12
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQd7INcG/xxlIZsMMLARuLEBz5TWChZoMsVbajCKuTw=;
 b=IMcAtctIhaPTmyCckr8kiEko33Dr6Pwk3KcJEyUb7HGQ5JfVo6D3MRT6W7mHMBgYYz
 pUwjrYksQOCjh3hBFfYk+yyVqnqGq4veCSn2zj0NyM0rMjfW+pHYqP8bCj2Iqb0y1eWY
 9H2vOjpohaKeTacDOmRbQY4QBRuxEqRFR+QxCLLlXwf1Y/Yuap7318KMMUHgduWBlyO/
 D2WyXmyiscZaKwK6XDr38XYenq69YcMcgGiK/RwZ/kSshd0XgjV6taOeIF37ErGqylwB
 CzU9nmPg4OdHnfFA9VNRDljbuQg+116un3RQibkWYFCyUB12cGtpk4WSjoj2grDH7Wg4
 P9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQd7INcG/xxlIZsMMLARuLEBz5TWChZoMsVbajCKuTw=;
 b=ege5TPAFwbDSQdMXV7UsI3bz2NAm6OGYMfSgTMXZe8mZp367ACGgNvIfm5dmxK0ute
 Jk3VVcL2HvNmdGs0q4I1nAw2PThLUPWuh+lL/JGFzPv6TKGwTrC8qldCJwz5JUPiwKq1
 2PMFMA+I2ppo9xZG6qmKFJR2OhCTeEVRWImtQXbaR8DSXl/Is9ADPIZc7Q1aCAjPuhTD
 NVT0O68wRgYzHKNRgd+LfL7eNJXT1bGe5UOpDkPtpVh/DgpuyaET4LbKrX8o8QyzSbIt
 0idLtHxxaRPiFZP6wAuv6aC8kfNiJR+z4rTSXkQG0/YpcZr6NJYyHXHIChMIUTm6Z/2o
 kQww==
X-Gm-Message-State: AFqh2kqC37zdongvTJQF90HuoH5J73Ub3XO3GVaq1FcUaD3VAXKbuQB1
 r3N9x66LMRgIrEsgB8OF45T/yw==
X-Received: by 2002:a5d:6e42:0:b0:2bd:fcd3:44c7 with SMTP id
 j2-20020a5d6e42000000b002bdfcd344c7mr1599505wrz.29.1673938028346; 
 Mon, 16 Jan 2023 22:47:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm28334766wrm.6.2023.01.16.22.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 22:47:07 -0800 (PST)
Message-ID: <f098f433-24e1-5f38-b479-d41ab1c51663@linaro.org>
Date: Tue, 17 Jan 2023 07:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
 <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org> <Y8WH+aneXr/JkEXp@pdel-mbp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8WH+aneXr/JkEXp@pdel-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HAB9TBRpOuqC

On 16/1/23 18:23, Peter Delevoryas wrote:
> On Mon, Jan 16, 2023 at 01:30:19PM +0100, Philippe Mathieu-Daudé wrote:
>> On 14/1/23 18:01, Peter Delevoryas wrote:
>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>> ---
>>>    hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 49 insertions(+)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index c929c61d582a..4ac8ff11a835 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
>>>        i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
>>>    }
>>> +static const uint8_t fby35_bmc_fruid[] = {
>> [...]
>>
>>> +};
>>> +
>>>    static void fby35_i2c_init(AspeedMachineState *bmc)
>>>    {
>>>        AspeedSoCState *soc = &bmc->soc;
>>> @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
>>>        object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
>>>        object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
>>>        object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
>>> +
>>> +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
>>> +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
>>
>> Why transfer the prom content on the i2c bus at each reset?
>>
>> In particular this looks wrong if the prom is initialized with a 'drive'
>> block backend (using -global).
> 
> Yeah, it looks like this might not be the right way to model it. I'm going
> to try Cedric's suggestions.

OK, but watch out this is a PROM, not a ROM, meaning it is legitimate
for a guest to reprogram it, and expect the reprogrammed content after
reset.

Shouldn't we put the 'fill default content if no -drive provided' option
in the device's realize() handler, to avoid overwriting content possibly
updated by guest before reset?
