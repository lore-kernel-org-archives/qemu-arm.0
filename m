Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2945234ejy;
        Tue, 4 Jul 2023 07:25:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5nffpfh4eUmUhvP1Yqiy1HPiEiUH26WQjfDONtnbFFnEfyrU2fqCf/sr3diPvLt+wcklcT
X-Received: by 2002:ac8:5b55:0:b0:3ff:405e:9117 with SMTP id n21-20020ac85b55000000b003ff405e9117mr19456651qtw.66.1688480745931;
        Tue, 04 Jul 2023 07:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688480745; cv=none;
        d=google.com; s=arc-20160816;
        b=G60OiQb/XRT8mkZzjIBbeaTSN7qB25xrcUEXDe3vcQZdOfvxOPT+3y50oiiqOiQL8z
         efqZVBkPepmxZKtszoR9uB+s8V3BXdKHqXOiU7e5G0gktkA58RXxRHXL4pLapgc8djG8
         ff+LX9neuaW7Ek7N70r1/cjBtj3cyWD9t6YG/x+kZ8VlEw1vuUX6F8ygdf2GQF9qaMQ+
         whCv2qbRyu22OByAueSmbqZW3el2skJRZ7la+51qAqDxD0PHxwdwOHreIxrhaGTOPT1R
         /LOLGlI1oXpyLajF45+ay0Icy4JHpTLWisG4orPRm4tL0v9S0sJUIhNtlI6r6dMcUsWZ
         SX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GyE3CXPeXedQL5IGhlbGJ9w1KGn4iyl/4Ih2AUEQGDU=;
        fh=io2b6Ltg0uchImskinPivNiiEkwsX5U7IbfoIL9vHTM=;
        b=LpCqCABFNSZ7+hh7taJaQbP1ShUxQOSODAq/H5351OwGFRJbiB2s7bDphIKsNkT4c4
         J0RuHSb0y5s+Sqnf57znDSuL2MYHPSePFHkrk9B45bSiz/Z/xP+pKMFhqGl6gXbH3Wok
         bqkOG5uvsuSd1DTW5Cy9jlB7R0TQlWkR+GEH8tDVIOWkUmzuoC/eSGbyyCapDqIxqJhs
         Shfu/ZHykn6MLOF/wFbqtozosVPr9k3cIhlRBuE+qLkqoRrjB+8IgebPiXspgFRRutYj
         2oDQ+6Go0RunPjkV7qfDlARx05aBuPblpz6OwmfI3oEOHaAem0c87wuBxKIoa0gRW0Mu
         1STQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6Gt11xQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ac85e08000000b004031ae3ae07si10321744qtx.28.2023.07.04.07.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u6Gt11xQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGgyG-0003LM-BD; Tue, 04 Jul 2023 10:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGgyE-0003L3-PU
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:25:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGgyC-00060x-5m
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:25:34 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31434226a2eso3632392f8f.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688480727; x=1691072727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GyE3CXPeXedQL5IGhlbGJ9w1KGn4iyl/4Ih2AUEQGDU=;
 b=u6Gt11xQ7odwivWClsNDIy2Tn4hnuxAuoEvKhVxJDUXqYakv1RyFBPz8fLT2d0qhT5
 AwgblWyoZtc3c8jLeJqZCxbm96PwlmjoZmbjQi9TNu3z4KnFA5HpOSL29jQiHcvTPljk
 hdW9zRYfCpN14eiaIsKYDN949y5kHWhILgAeiraU9lNq9QabUofRMZfvximdyNeKx2an
 EMegRm7Y84RDzEBUoayXuGx20yNH3R1/ilN7V0b4BQ6tj0H8hXiiaRhzumlpRW3PO9LW
 1APqMJkCBSDMiqD1Ame65EkoYSAMsK+VgQXZN2zgIzalpRu5w8WcGH23c3ok9VYdbMdK
 pVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688480727; x=1691072727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GyE3CXPeXedQL5IGhlbGJ9w1KGn4iyl/4Ih2AUEQGDU=;
 b=BvXRxDq+lzc95JpSyF7UDGQWP12HBWP8OzSMvvTwEYesvwrnqvdSNN0ksP9v+ANjNt
 qShMXIWzf+HW7f+ddxIu6+iCH3ECjL+V+LedsqxcGj2t4hBBZgFYzychLRIpAAmLka8v
 R24fAjGCR2WAGn6KS30ARuxTbFDn7ELxEloH0pwQy0GCwS0gxE1SIwdnbJnVmgi3D2Kx
 8E9fPegRgv4dFHYv9MCtWmB2pAE01dbeHFxu4PfDUpdKDU9I1FlsEQWG1p7thfyrNfqw
 Trp5grfhs+vS3UueffOsjujRJegr9l+zWs3I3lH/GhNbHwsv7HVrL0XsJIeLAAu+g8g/
 lGLA==
X-Gm-Message-State: ABy/qLbh3LX6G7ppfd37XSaKvpTeJB2ZYUNnXRdPswgpuRJaTkQfLulB
 ZTOeLkt4TzoA4MpYxXEfhQuAWQ==
X-Received: by 2002:a5d:5942:0:b0:314:3c8f:d267 with SMTP id
 e2-20020a5d5942000000b003143c8fd267mr3884554wri.45.1688480727420; 
 Tue, 04 Jul 2023 07:25:27 -0700 (PDT)
Received: from [192.168.1.102] ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm28615167wrl.72.2023.07.04.07.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 07:25:27 -0700 (PDT)
Message-ID: <36110549-9404-17c8-905e-46a81af4ea82@linaro.org>
Date: Tue, 4 Jul 2023 16:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 13/15] hw/timer/arm_timer: Fix misuse of SysBus IRQ in
 IcpPitState
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Sergey Kambalin <serg.oker@gmail.com>
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-14-philmd@linaro.org>
 <CAFEAcA8GTuV0AtHnFHbvii9bgDqYjhAJjsjq0CX3WRHrkkaFvw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8GTuV0AtHnFHbvii9bgDqYjhAJjsjq0CX3WRHrkkaFvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 6rbjCEBM9D3F

On 8/6/23 17:09, Peter Maydell wrote:
> On Wed, 31 May 2023 at 21:37, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> SysBus IRQ are *output* IRQs. As some sort of simplification
>> to avoid to forward it, IcpPitState misuses it as ARM timer
>> input IRQ. Fix that by using a simple IRQ forwarder handler.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/timer/arm_timer.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)


>> +static void icp_pit_fwd_irq(void *opaque, int n, int level)
>> +{
>> +    IntegratorPitState *s = opaque;
>> +
>> +    qemu_set_irq(s->irq[n], level);
>> +}
>> +
>>   static void icp_pit_init(Object *obj)
>>   {
>>       static const uint32_t tmr_freq[] = {
>> @@ -402,9 +410,14 @@ static void icp_pit_init(Object *obj)
>>       IntegratorPitState *s = INTEGRATOR_PIT(obj);
>>       SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>>
>> +    qdev_init_gpio_in_named(DEVICE(obj), icp_pit_fwd_irq,
>> +                            "timer-in", ARRAY_SIZE(s->timer));
>> +
>>       for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
>>           s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
>> -        sysbus_init_irq(dev, &s->irq_in[i]);
>> +        sysbus_init_irq(dev, &s->irq[i]);
>> +        sysbus_connect_irq(dev, i,
>> +                           qdev_get_gpio_in_named(DEVICE(obj), "timer-in", i));
>>       }
> 
> This feels a bit clunky but I think it's what we have to do,
> since the various _pass_ APIs for forwarding GPIOs and
> IRQs from a container to an inner device only work with
> an entire set of IRQs.

Indeed. sysbus_pass_irq() could resolve the last unused IRQ index
and amend starting at that index, but this doesn't seem a lot of
need for a such use (so far). We might consider it if we ever merge
sysbus IRQ API into qdev.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

Phil.

