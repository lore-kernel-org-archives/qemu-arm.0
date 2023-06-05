Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2691226ejb;
        Mon, 5 Jun 2023 03:21:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7tpnjqZve1NyokXVR7TaefjUeV1LtT0KMfFWu3SKz8qnrT2tWxyzIq4MppOyoJGXPb2GW6
X-Received: by 2002:a05:620a:8a08:b0:75d:49cf:102a with SMTP id qt8-20020a05620a8a0800b0075d49cf102amr5073815qkn.5.1685960504417;
        Mon, 05 Jun 2023 03:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685960504; cv=none;
        d=google.com; s=arc-20160816;
        b=zzeoNI98lUd2ePL2b41/+Sh2A2k5t6Kt1vWx2ZRt6lUuSAw2kJ4hRfY9FzZX6TZthS
         O7wIRDlArWS4DnSaUURRQJZNsHr26uS0Mw+NTqn3I9yyzqukvj2HdZED3FXANDrZSPnE
         cr64o8SLkmBaRr9K92Cd8/N/VsLAH7qowVai2H6Y7ms2UYSU4ASfY+lJvNuJpf4Gs2eP
         qkVLXWeC1bNudVgZRhAPiuOVt5PYBBCd8G6fWGGe+BqU29PWmDx3BHkFWy4/NQ09VYPh
         EenR3isZDWSePuJ3k26r4nHwsmwigXM5IB4oSXQcZGMtKTiB2UdE/tCVHQny2xvwZyKF
         IqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J/i1IF1cHGu3YBIPrBtGDl6FsaB1DSpDzEDQxZZMLEQ=;
        b=VouBrl5s7CneLa4awb99qFTyWpyPtNwpXe6lieSJTGNy0Di/cy++uCjAt9zqyOklCY
         eYqzq4Bgv+xCfpIWgAMAOJHJ9pSeH0l1DIbKkwrci4rj/qdlQF2/GiLK6qHW7uDb7aSc
         pmyAj5c7DQxHO2bYcrTa5F1RAKsD6VJxu4UIbPM8+9ZumVCqEFEt9tsxUsV9kY0csvY1
         uS9G27egVbaFvDWZD5TUUneyzyAcZt8UelNyjWRG1dFw317kizizxfkINylqZPTVMAmT
         RX7HG8hDEVvq6TLCG7bAqd4w9LOivunpYxCuQ1TXHfgcDGbRYDvkCG0PRx59dM+1RlhP
         7y5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBOgKdDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020a05620a135600b0075ebbd6077fsi411260qkl.515.2023.06.05.03.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 03:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBOgKdDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q67Kn-0004Sr-Vg; Mon, 05 Jun 2023 06:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67Kg-0004KV-Rh
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 06:21:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67Kf-0003XC-7z
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 06:21:02 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso9399615e9.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685960459; x=1688552459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/i1IF1cHGu3YBIPrBtGDl6FsaB1DSpDzEDQxZZMLEQ=;
 b=KBOgKdDLAlJEWrNp1O+6mvas2J7lg9a27+03qW8Mcf9TDqtWh8CqPXTgkrisxxrpRf
 NtGocKZ69YIlGwMeDynB0FJiiNVexkNli6f4CTO1zv2SI0PG6Y9ODwo6oejQh4td8Etl
 Phgr8JxZwbVUA8VBhqgQTJlsy6ItJnGEn9Kf70n/1SmxqCoVjwxrCpGcuCGu4CAZUIVf
 GSrOIuL9dOsq6sB40KgalBWlCT4k1q5w+EHeYVQkQDYzcpGFLsT+E3TzrrKcZ/s/tUVX
 k7fkjluErcTtUK5WwWGNs7szSv1m99HfBSI1KTV35YN/lk5MydLi5qqxHfeEvpcfaXqD
 hBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685960459; x=1688552459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/i1IF1cHGu3YBIPrBtGDl6FsaB1DSpDzEDQxZZMLEQ=;
 b=FfT7njIY7/J7pWo1oea4uuU16KcmFIifIkngu1/cqBwYtHnyPCIEQkb6vc4x+FQDbk
 RNPm2aZrE6s4lWp4ROwD0BMOPxuIOWuUS5v8TvQjDbHv6/pw0LR5maOhzIggvm6275dw
 8OkgyqGANm/oSgjZtYbYw4jHadywotnS/hqQfPvBDhFVENhAwyqLvjODCBp6Pfdhau1I
 YrUMBZyTAdHazo1ZFdrtiL6tuo5RJbvcMn36WRs2cdNL7A1SBtqh6wzFY2wHQRfPiEqy
 UU5SnkXK9W8JXeDU+A+CK1pWijr73Ll6tgarelE4neFl+nWnz6bLD93KvTo/t+b8WKvY
 acfA==
X-Gm-Message-State: AC+VfDxu7S2vSP4WywrtErxWt/nR0TC253ZAJquOvas3Panx7G7T5ucF
 io8X2vrhZsbjdBLBWv19AvHQuA==
X-Received: by 2002:a7b:cd1a:0:b0:3f7:3a19:b951 with SMTP id
 f26-20020a7bcd1a000000b003f73a19b951mr2031883wmj.21.1685960459636; 
 Mon, 05 Jun 2023 03:20:59 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a7bcb90000000b003f6028a4c85sm13795249wmi.16.2023.06.05.03.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 03:20:59 -0700 (PDT)
Message-ID: <33d6d99f-5a75-9891-b43f-c9caf40a62de@linaro.org>
Date: Mon, 5 Jun 2023 12:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 15/15] hw/timer/arm_timer: QOM'ify ARM_TIMER
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-16-philmd@linaro.org>
 <43f014f5-6dd7-7c46-eea4-ed9cffe8ec48@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <43f014f5-6dd7-7c46-eea4-ed9cffe8ec48@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: W34HJIfkfF6s

On 3/6/23 20:07, Mark Cave-Ayland wrote:
> On 31/05/2023 21:35, Philippe Mathieu-Daudé wrote:
> 
>> Introduce the ARM_TIMER sysbus device.
>>
>> arm_timer_new() is converted as QOM instance init()/finalize()
>> handlers. Note in arm_timer_finalize() we release a ptimer handle
>> which was previously leaked.
>>
>> ArmTimerState is directly embedded into SP804State/IcpPitState,
>> and is initialized as a QOM child.
>>
>> Since the timer frequency belongs to ARM_TIMER, have it hold the
>> QOM property. SP804State/IcpPitState directly access it.
>>
>> Similarly the SP804State/IcpPitState input IRQ becomes the
>> ARM_TIMER sysbus output IRQ.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/timer/arm_timer.c | 109 +++++++++++++++++++++++++++----------------
>>   1 file changed, 70 insertions(+), 39 deletions(-)


>> -static void arm_timer_reset(ArmTimerState *s)
>> +static void arm_timer_reset(DeviceState *dev)
>>   {
>> +    ArmTimerState *s = ARM_TIMER(dev);
>> +
>>       s->control = TIMER_CTRL_IE;
>>   }
> 
> If you're currently set up to test the ARM timers with these changes, is 
> it worth considering converting this to use the Resettable interface at 
> the same time?

Good point. Then ARM_TIMER doesn't need to inherit from SysBus: if the
parent device resets it explicitly, it can be a plan QDev.

Peter, what do you think?

Even generically, I wonder if a QDev could resets all its QOM children,
propagating each ResetType.
