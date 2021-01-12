Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3626800lfq;
        Tue, 12 Jan 2021 07:07:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqej4VTD77bQ7Gr1g1RylMZpshN1/JltdEnI7YWfXk8ZYGIKhm/YSJig47QsQeu7TiwUAV
X-Received: by 2002:a25:2057:: with SMTP id g84mr6946882ybg.133.1610464031595;
        Tue, 12 Jan 2021 07:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610464031; cv=none;
        d=google.com; s=arc-20160816;
        b=Bqo1czLxfDBBvms2KbLEV/Up+nf+1RDP4/jdE9HKGNlGGPbROTcBXy5ZAoPZOwIfJk
         T1t1Or98Cp3MQV/DJD/3bBlz0rgSBPDL4DVpj8N464Na/uO85WjHGD1yaHlXJ56mwRBN
         650rF5Qgt+wvdqdKeOT7skxEZsSzWHEh7OB7eGOVVDIPOfik1NTa/ZcQ7uyiOHa2h9ZN
         I7Pugy36DCB7WjnP3/2v4BLRrTpP2jMP0FRgkfXdqcwHJMburq0hglFjQLRHP+oTdTKQ
         ZFGAnXOhPdL4AfX3Jj8CFWAPS17YUfErM/KPaODNr8QO7WXoZSpoMw8YTZWtK6qCIMSD
         jDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ejGy+n6I7cO4B2hnJmdcOlqpJpKcpw9gc9h9k+fJcrw=;
        b=SSnoqN2VuJwup3IhPQgwnKk+uo4FE6tF/u/psgtjLIstTt4Lx3wNnpJ5pV0wh2watx
         2GGq/0o/YVxJofzg9UDVjUV4uWLhwiPYApdlQiM9N0QhUfOQSjgO6rI+2aMsF+WOBwaV
         sSgTyWgypVDtrCqPemufRY41dTOioi6BbvBpMz+XxYWvq1ORHLhpIgzFqu2q4T0DFjyc
         QhyEWyKYo/G+QIHknIvWTErYV1v+pW2MGBPgnxxD5j0TpSl6+hxeeTdYF1ObzR0NXT+Z
         iykptVYY2Mc7D8g9b/v6DGaaQugA6PfzaQ9jYlBNRs1jZ9X3369cKiX5WcXTxjoLf+g8
         uyaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="CAgnz/+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si3395534ybm.9.2021.01.12.07.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 07:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="CAgnz/+S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzLGI-0002aB-9A
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 10:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzLFp-0002ZQ-CQ; Tue, 12 Jan 2021 10:06:42 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzLFn-0008IN-9q; Tue, 12 Jan 2021 10:06:40 -0500
Received: by mail-ed1-x533.google.com with SMTP id by27so2434661edb.10;
 Tue, 12 Jan 2021 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ejGy+n6I7cO4B2hnJmdcOlqpJpKcpw9gc9h9k+fJcrw=;
 b=CAgnz/+SdneqLFgD+tF1yzXyEezGN+78V963GGmo0XON+Vbt4pbnYmyjT9badF+pV+
 Jr/a0YOHvhBrp4kU4q0BgAVB5gPMJ+CiYIKS7OhGKiY31XwwpAaO2eb/m52SOBjoBCFa
 7PFtV9MHAb3PviE79KfxfJLIAOJPjlS03z5UM9zeccKRTEZXK746x3NtzpFS/1HiyMY/
 8Ig08z/NNXz33YcELJY3Q4VNLpIU1AfnggvWa/JOgGV5XhBpCwPZLQKSRenaxGgA/IKM
 2JUBjl+6di33zwDoV+bdxthwKkJjL725bi/JzUf9xViqgZYgK6f4PqT/oHayluPayGng
 fZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejGy+n6I7cO4B2hnJmdcOlqpJpKcpw9gc9h9k+fJcrw=;
 b=YQLVCI5ZNXGxc2JgWQvXnGsR0OPwfRY4zmbWN257puu8jghUi9EQrU5BENKuGvCcwR
 MJsn0nGiCpz30NE/6IuOLBrNq3PJEFzNJhUMxhFoBlaZrjCu0ejvDcxdGrTmXG2mvGGs
 vhl8GdZpnh0k4tDwEWI3mq8TbAP0fl8YeNlErm2zDK5Ose4Fl73LvYyj/SkY/QaBKTms
 qpTJsqrHYT37ZLn3AyYwo7FJrOz6TVNSgJLUgoouCbagxNOjfc2Tq4O30T7W7+HCl0ag
 i3EZ1gf+j1Y3HhFxQngyoEEVdKSx0NpVNRGfSTPZngKnYQKQVQs6cfHnUhh8NC0j7RBi
 7Q3A==
X-Gm-Message-State: AOAM533jCN0AwjogePu5iG2Ov4yVB4YcImTbgxXl6Evzoh7ZKBioFyRn
 XG62DUcCXvVTLMeLGLJgrak=
X-Received: by 2002:a05:6402:2553:: with SMTP id
 l19mr3693672edb.326.1610463997445; 
 Tue, 12 Jan 2021 07:06:37 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id q17sm1547221edr.83.2021.01.12.07.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 07:06:36 -0800 (PST)
Subject: Re: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-3-bmeng.cn@gmail.com>
 <CAFEAcA8W8vxA8AJY-Ka+--drv_asw5soaFNO90VzVENApMMH0w@mail.gmail.com>
 <CAEUhbmW2NaTNusZ123D7FPAK6uJZtCuak=UOtEE6Nc5fNfnsHQ@mail.gmail.com>
 <CAFEAcA8Yc9d5d0R3_m5FQE6NE6Gk3_RnDrX45eg0D0nCgaW4WA@mail.gmail.com>
 <CAEUhbmXkB7NDeUr1_cUR5nXPtmwrzFqfL5YTa12VnwERQOJ4Pw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e75ae7e4-f87e-33d4-e937-2230d478e188@amsat.org>
Date: Tue, 12 Jan 2021 16:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXkB7NDeUr1_cUR5nXPtmwrzFqfL5YTa12VnwERQOJ4Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TSsggYQsm7jn

Hi Ben,

On 1/12/21 2:22 PM, Bin Meng wrote:
> On Tue, Jan 12, 2021 at 9:19 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 12 Jan 2021 at 12:54, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Tue, Jan 12, 2021 at 6:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> Usually the approach is that the device on the other end of the line
>>>>> is going to reset its state anyway, so there's no need to actively
>>>>> signal an irq line change during the reset hook.
>>>>>
>>>>> Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
>>>>> imx_spi_hard_reset() that is called when the controller is disabled.
>>>>>
>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v4:
>>>>> - adujst the patch 2,3 order
>>>>> - rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
>>>>>
>>>>> Changes in v3:
>>>>> - new patch: remove imx_spi_update_irq() in imx_spi_reset()
>>>>>
>>>>>  hw/ssi/imx_spi.c | 14 ++++++++++----
>>>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>>> index e605049a21..2c4c5ec1b8 100644
>>>>> --- a/hw/ssi/imx_spi.c
>>>>> +++ b/hw/ssi/imx_spi.c
>>>>> @@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
>>>>>      imx_spi_rxfifo_reset(s);
>>>>>      imx_spi_txfifo_reset(s);
>>>>>
>>>>> -    imx_spi_update_irq(s);
>>>>> -
>>>>>      s->burst_length = 0;
>>>>>  }
>>>>>
>>>>> +static void imx_spi_hard_reset(IMXSPIState *s)
>>>>> +{
>>>>> +    imx_spi_reset(DEVICE(s));
>>>>> +
>>>>> +    imx_spi_update_irq(s);
>>>>> +}
>>>>> +
>>>>>  static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
>>>>>  {
>>>>>      uint32_t value = 0;
>>>>> @@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>>          s->regs[ECSPI_CONREG] = value;
>>>>>
>>>>>          if (!imx_spi_is_enabled(s)) {
>>>>> -            /* device is disabled, so this is a reset */
>>>>> -            imx_spi_reset(DEVICE(s));
>>>>> +            /* device is disabled, so this is a hard reset */
>>>>> +            imx_spi_hard_reset(s);
>>>>> +
>>>>>              return;
>>>>>          }
>>>>
>>>> The function of the code is correct, but you seem to have the function
>>>> naming backwards here. Generally:
>>>>  * soft reset == the reset triggered by the register write
>>>>  * hard reset == power-on reset == the dc->reset function
>>>>
>>>> I think this is what Philippe was trying to say.
>>>
>>> Philippe said: "Hmm usually hard reset include soft reset."
>>
>> True in hardware, but for QEMU there are some things we don't
>> want to do in what we would call a hard or power-on reset.

Sorry for the confusion. I guess you understood me well, but
I was wrong. Anyhow I'll try to sort this discussion out with
my English teacher so the next time such confusion doesn't
happen again.

Thanks,

Phil.

> OK, will revert to use imx_spi_soft_reset().
> 
>>> Since we are moving imx_spi_update_irq() out of imx_spi_reset() to a
>>> new function called imx_spi_soft_reset() (what I did in v3), that
>>> confused him (and I felt the same thing), so I renamed
>>> imx_spi_soft_reset() to imx_spi_hard_reset() in v4..
> 
> Regards,
> Bin
> 
