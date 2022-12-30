Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4737044ejb;
        Thu, 29 Dec 2022 23:08:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvL/tUDDz4ruzOx5QMIRED1Fi+AxCpc5wYrleykZBw24/FwCkN3B7e5nIPTAs9AK8u+FnSt
X-Received: by 2002:ad4:5362:0:b0:520:f8fa:5ad8 with SMTP id e2-20020ad45362000000b00520f8fa5ad8mr36311332qvv.17.1672384125354;
        Thu, 29 Dec 2022 23:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672384125; cv=none;
        d=google.com; s=arc-20160816;
        b=UevYArhAHOJrJYhpX8Hcdpl7EyB4p6Y5pOsFjS+ocZz6wAC/7WfFOG1qcA9ITDgXom
         KGDmMmUMHLm60Tzhhj2APHWuw92kSouJAca67W+Q+oETJnZei7EWbR627e2VzSjTNcVH
         7zXYlLhBT5fRU/J1lhzKM184HAZuhj5ctwQNWpSEiFIVBbNun6x/toubsppecmwwBAzV
         Hz6s3nXvaE0HiksgmEfRoqalT3N76C11/z1WbatTmczFqqS4ytCQL61VEYdBJRQN98AZ
         qs/3+fGw4ekJo2RJoNMz1m33S/GXjU5qWlFIZLpSPpDOQA9I4aPo78WJ5kBIu8Ph5gSO
         VCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/etFgTGUsqILty+ksbzAMhlux2U86WAmtzBthdTIKWU=;
        b=KuoZBT4n+xahwM2a/YAthz9FbkDeztQopYVTxuwfEwuqkShQTvVOF2/ukTwE+C3tYC
         fQnAU8jXq/NRmHhhJ6DHIN3q3gOgvPo4gbo++Jx2IVX/HqOXYUs+zMvA7XP2uSX9jstB
         Zie8AImDgoCf1e4jhx0xFkETnL+dLwVV8sSQsWJnTq/VdOXu+TxF8oaQ1jp0y5d1+hxZ
         YU0b9Ug7GiajAEt4n37RDAcr2SNgEsi+oLbaVPwrhuuhvIvECPWXQMM3WhqqeaO6sV8F
         IQDm5GHNevwsy3v8JqcDTzThui+dNP1mTP4LYi6yyFsBGONw8pjCabJ3LLiw1Z1Aq105
         j1rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cggPulIn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp44-20020a05620a45ac00b006fed6c46178si9803176qkb.19.2022.12.29.23.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 23:08:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cggPulIn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pB9Uu-0005Zy-6I; Fri, 30 Dec 2022 02:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pB9Uo-0005Xi-Ab
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 02:08:02 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pB9Um-0007hR-A0
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 02:08:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso8124729wms.5
 for <qemu-arm@nongnu.org>; Thu, 29 Dec 2022 23:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/etFgTGUsqILty+ksbzAMhlux2U86WAmtzBthdTIKWU=;
 b=cggPulInhfEQKrRgPXoIKy0+t/OYzPYRGsBj0CQ2hdLFoO3oQaye6UOTME+auiEwwY
 3YWZdqJlu/lsi19BeuC2udjUTG9VbWwBLCRGYgLkQ2IX7+rXy2X06Gl6cY13no16lt+M
 hkCXvX0U+dWUOojhAq934B2hKRqdEXSKzWYKHh56La7mq9PrYYVIGQsONMgQF0BbLGOL
 LpE0MVVea8hyZPc4ZE2j+Q2PsbEPsDlppBas5ITnNO5j6JJh+tG0Vm15YEbh4vqZOFFJ
 tBHnRCww/4erT3Ay+L1Ry+J52ORGpt0nY8Awq+jUIEgM8AiTakvWJjNbtSZTmWdz3rK2
 ILgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/etFgTGUsqILty+ksbzAMhlux2U86WAmtzBthdTIKWU=;
 b=vBT3jQSKXh106DeSqCpZCHpDojuwUfyM1mV8hBNXUOe/BbJWhQYwdbVYriXyz8e05Q
 GLw946K15sltmglo+JIjQsYHgKIlHJX03dJqkCsaLjzB4919pWw5Nf/Ur5BPkMRqyTJm
 NyoMaTt2Mkss1zZKmmkcxQZTu8yTBJZDqfEwwCvXxCnSh/w6+LHVkD5A1CRPcjf8UvFE
 6Fbwoy50faVtepjsympeitkUC0NSTYSaBRaA6B/5QTCU5dzQzcrl5tsQ6F6ciW1Kbtzb
 QeXpsVFHXy8ZOvLjZCzUOJJhJHH0LXpn+Chu14HjrDlvBcSOpSAubXZQQGBRjrMPhSkL
 FJAg==
X-Gm-Message-State: AFqh2kopxbKbWSzyLYD1r9OMVmte8iJfpkS0qSnQ9F7e+xAN/SbZdEg6
 e1jAA1ue6zbydSuWNBTb2rNaZg==
X-Received: by 2002:a05:600c:4f55:b0:3d3:5166:2da4 with SMTP id
 m21-20020a05600c4f5500b003d351662da4mr21766000wmq.8.1672384078503; 
 Thu, 29 Dec 2022 23:07:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b003cfd4e6400csm29632521wms.19.2022.12.29.23.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 23:07:58 -0800 (PST)
Message-ID: <35b39b89-f2e0-3c57-3ecb-825b6b98e890@linaro.org>
Date: Fri, 30 Dec 2022 08:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/9] hw/arm/aspeed_ast10x0: Map I3C peripheral
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Delevoryas <pdel@fb.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-5-philmd@linaro.org>
 <Y638ocw5VdN5TeHK@pdel-mbp.dhcp.thefacebook.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y638ocw5VdN5TeHK@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: z9z2Z1/6GE+u

On 29/12/22 21:46, Peter Delevoryas wrote:
> On Thu, Dec 29, 2022 at 04:23:20PM +0100, Philippe Mathieu-Daudé wrote:
>> Since I don't have access to the datasheet, the relevant
>> values were found in:
>> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)


>> @@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>>       }
>>   
>> +    /* I3C */
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
>> +        return;
>> +    }
>> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
>> +    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
>> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
>> +                                        sc->irqmap[ASPEED_DEV_I3C] + i);
>> +        /* The AST1030 I2C controller has one IRQ per bus. */
> 
> Should this comment be I2C or I3C?

Oops indeed, copy/paste leftover :)

> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Thanks!

