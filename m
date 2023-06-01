Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp273603ejb;
        Thu, 1 Jun 2023 01:59:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vKnTei/VBNjclbwi1LgQF10uXPhqrPChvk2mgMhHv4c336e6T9GAMP+Wil/m/OwQnSRpn
X-Received: by 2002:a05:620a:6542:b0:75b:23a0:deb1 with SMTP id qc2-20020a05620a654200b0075b23a0deb1mr8001098qkn.47.1685609974931;
        Thu, 01 Jun 2023 01:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685609974; cv=none;
        d=google.com; s=arc-20160816;
        b=I73/4mcT0Mqc0gecjzjWkmQz1zTOrSbV/jFNUu+zYhO9SdK96fUr9CQf6YQWwmS7vp
         P7EPXpezPBN6K5/vwKeqfQfXbAuZNfuoDwVz8mAO0JhszntovOpjOj1RkEWl8seRoPmi
         5fw4jZ+vH+xAZtlxAX+o9lph9/UdWXOZq2T9aslRPlgCml9Ro+n8yO7qin9HZyT/VCiB
         AI4wVYPv4f8u7fJ5+3pWZ3hRIpqGrhBids3EpWfYhpcfxbR1ZQHgQES9ar1uSCG2PpL7
         s2CEPa5QHJkXkpD4Cmfouq5jZ3oxzUsHfcW1/VvdqAfnkxFZsNz4MY6p9tVE2oAkrGj6
         kcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xIwKH5GgGG4g4zJF7CHtSnylZPdtOpqpBpfI/qqJcMM=;
        b=xdSIA73e+DO8AvKyWb0hS1dKvz+unDjFGwePkQlieUbvBUOY2rQH4XIFa89F1IgA10
         qeXCCViY+x4s21ZVt63pw5fZylhJopnWOW8II5MtBfMDpocUE87Ur3CMQugd2vWN1H88
         ZXxYj3cCmKmOdcTsK4Rv4PvZVUzgQzBXOGJl+g+cWFmtvbb1SujD1uTg0q6vvGQxCGJY
         7+iso0z8cODkKHepg6fXJrf7grT9muRVHjRz4dhDD9olCL61uhpHFvvgDX2rh8+UKmlS
         TbngZ8wj3QLVmsONPV0LlgVm7mbsu0qetMqiFVo8cvwtOhqd/e04TiKuWh5MeAMYEjzw
         jWkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiO1ovaq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ae9ec16000000b0075b3b1e262fsi9250377qkg.521.2023.06.01.01.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 01:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiO1ovaq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4e97-00080m-SM; Thu, 01 Jun 2023 04:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4e94-00080I-Ln
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 04:58:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4e92-0000Eg-Vn
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 04:58:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6e72a1464so5810315e9.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jun 2023 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685609935; x=1688201935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xIwKH5GgGG4g4zJF7CHtSnylZPdtOpqpBpfI/qqJcMM=;
 b=BiO1ovaq8xlBWW2jITKXCXe3SDaOeHEZPlD3WJImRyp0DKECfhcWN+ppr+G+kG/5Sl
 +SgQHab1GtWG0zOC5GKh5hRpa43ylNQDJWQQEQb2sn0EOn1uKVCYfLdA3cYd2fsIDDE+
 tOFYhi3tJWBYtlt/qkkJUPkOaZ8DiZTB6854RIeYFN2SVMHdiEFKBpBVpZoiOwHkKg01
 RuTjUPRdobpwGyH6+V/t6UTc/NrsoUBAh61watX2eNS8XZ0ZdOl6ajawi2QFG/BGQJaU
 6pj5EfVA2mR1qMAiI/RfKwjJA+hjwVBI8HdRJa+DHj3aTUwY0f9CI1f/VpTp7mWJk0hj
 kDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685609935; x=1688201935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIwKH5GgGG4g4zJF7CHtSnylZPdtOpqpBpfI/qqJcMM=;
 b=LRwgrs0i9EC5yVcrtk0XQaNMqCYYY4msTdfCfjaxQFcWrrNjekFr7u6mzxDkPx3SSF
 y0R+j4WwnLAIJ0lWKvXNitqm2HOONMenRhvS6Eh07tGdlxc6DMRioOi6zTmvhPG1cvge
 FOpFuiSn5Dka3rmloqMhnZDgtCdlO1O4CYvTQXR1k5FzuHhUjLRfTwnC/m3Z0tn7hrf3
 4GBcBN/nMT1SdD1GpJ4ZTMqfJ0B2/THIAQ/Vvka9aaV9kJV0YJz1VzG2aqV6S5aaijXy
 7SF8nVcLnh+jfx3hyi49LZwGn0q3e/IV8My7weGUEuS3+q/JDMUhlMQlpdwq+Zd/9Zur
 WcxQ==
X-Gm-Message-State: AC+VfDxO9sLcs9U4JMAUGftltWJtF/tilWkLcVaBGwZULr1DDfKmejf1
 fRs1bL+uLQACQxJW5kAt/zyX8g==
X-Received: by 2002:a1c:f313:0:b0:3f5:ff24:27de with SMTP id
 q19-20020a1cf313000000b003f5ff2427demr1314422wmq.32.1685609935139; 
 Thu, 01 Jun 2023 01:58:55 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a7bc043000000b003f1751016desm1534788wmc.28.2023.06.01.01.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 01:58:54 -0700 (PDT)
Message-ID: <a47c2841-8a76-ff40-20a4-1710ed17e47a@linaro.org>
Date: Thu, 1 Jun 2023 10:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] hw: Simplify using sysbus_init_irqs() [manual]
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-8-philmd@linaro.org> <87mt1jafjt.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87mt1jafjt.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jiARcFYsMBMJ

On 1/6/23 07:59, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Audit the sysbus_init_irq() calls and manually convert
>> to sysbus_init_irqs() when a loop is involved.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/intc/loongarch_extioi.c | 3 +--
>>   hw/intc/omap_intc.c        | 3 +--
>>   hw/pci-host/gpex.c         | 2 +-
>>   hw/timer/renesas_tmr.c     | 9 +++------
>>   4 files changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>> index db941de20e..c579636215 100644
>> --- a/hw/intc/loongarch_extioi.c
>> +++ b/hw/intc/loongarch_extioi.c
>> @@ -275,8 +275,7 @@ static void loongarch_extioi_instance_init(Object *obj)
>>       LoongArchExtIOI *s = LOONGARCH_EXTIOI(obj);
>>       int cpu, pin;
>>   
>> -    sysbus_init_irqs(SYS_BUS_DEVICE(dev), s->irq, EXTIOI_IRQS);
>> -
>> +    sysbus_init_irqs(dev, s->irq, EXTIOI_IRQS);
> 
> Commit message claims "when a loop is involved".  No loop here.  That
> work was actually done in the previous patch:
> 
>    diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>    index 0e7a3e32f3..db941de20e 100644
>    --- a/hw/intc/loongarch_extioi.c
>    +++ b/hw/intc/loongarch_extioi.c
>    @@ -273,11 +273,9 @@ static void loongarch_extioi_instance_init(Object *obj)
>     {
>         SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>         LoongArchExtIOI *s = LOONGARCH_EXTIOI(obj);
>    -    int i, cpu, pin;
>    +    int cpu, pin;
> 
>    -    for (i = 0; i < EXTIOI_IRQS; i++) {
>    -        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
>    -    }
>    +    sysbus_init_irqs(SYS_BUS_DEVICE(dev), s->irq, EXTIOI_IRQS);
> 
>         qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
> 
> In this patch, you merely delete a superfluous type conversion that is
> present even before your series.

Right. I guess I did that automatically "why are we casting the same
type?" without even noticing.

> There are more of them in this function.  Please delete them all, and in
> a separate patch.

OK.

> Actually, there are more elsewhere.  Coccinelle script
> 
>      @@
>      typedef SysBusDevice;
>      SysBusDevice *dev;
>      @@
>      -    SYS_BUS_DEVICE(dev)
>      +    dev
> 
> finds some in hw/arm/xlnx-versal.c and hw/rx/rx62n.c, too.
> 
> Would be nice to do this for every QOM type, but I don't know how
> without duplicating the semantic patch for each of them.  There are
> almost 150 uses os OBJECT_DECLARE_TYPE()...

Checking all QOM macros, I counted 1076 types...

