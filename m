Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp396640ejb;
        Fri, 26 Apr 2024 06:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmUpk7mk2W+OY6ImFUbHtaUth0wONnnN2kL1NKyDMQ1LW59eT/BXyxEhhqLIIXkdnOPv+8P2d1/7np7rfKn8kF9ChIyqgu
X-Google-Smtp-Source: AGHT+IG/SNJ1WxanTHb7xGjkC6qtnauAMk5hdMi9nExLqpu1CtOIt618KY0dARGoI7u9LFWD/SXV
X-Received: by 2002:ad4:5aa7:0:b0:69b:2580:ebd8 with SMTP id u7-20020ad45aa7000000b0069b2580ebd8mr3640737qvg.23.1714138878823;
        Fri, 26 Apr 2024 06:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714138878; cv=none;
        d=google.com; s=arc-20160816;
        b=XGuk0yTZmeFB4ItLDFHTXpwIoUfwTV3BKCAguAAaEjNYOT+17JW1xAPWNlFbfs2+49
         5CkkVpiIFipQ8cv/Bs61Zjgkb0w70uOqT2rpCoayFGMRRmAut8N9BOgJya5mH6vipqDg
         JloAqsfux3akv57bHaPImS2PxWAXifVznzfJJaYBtsHkcjtzaFZNNBRp7FCVAPPrrqrg
         kcn3mxkNyVUnwbg7NAPGHndM5blk59Q7IOAsDNiewzDSz5RJlisgYzNCmt1CWeXO7+TH
         uldrZFdmozu1CRxy4GMayOXnuWZvg4BzXjpzN/lICgpGZd6LveZw1sCNjQTua9Oco4p9
         +n5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9d1v76W9YlKbYNjbplkeshWLMVq0Czwi1rWFOBXIq3U=;
        fh=jbFt1DN6XN4ueg0P2UYXD7hsfvsKdIcc/H2Kpb+39mE=;
        b=rJOPQtHBP7sznAR7EWNXspQDD4ZgVS7Qck8f+yAcswqUfX3/PCl3mjVlBP4FEt1q7/
         lQZ2YVzDSI/Hjk1m6YeXEoFxg5c7xW5YIXY4ZeLBO/F7ANBOuBbfpWGOj57nXRG4WWav
         SvSUZXuKlqTGguzRGB3aagSCIT+nWjo5tWpYEvncb4qgVPChH0RbSXMayDdJXK0hVp77
         rtsqb7aFAzyLC94HVOqlI+4+bpBeelBCMEb0tBBZkkRZW/oxBvILqf1ZmnqADm0zpltr
         EghQYT9ct2+fri9JglChm67IVxD0HYf+elnD84uMOAoY4ac8JGICpxhF7RhonxI27yN6
         mPNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTX+tsUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq7-20020a056214258700b0069924c862b5si20935563qvb.43.2024.04.26.06.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 06:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTX+tsUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0Lp9-0007uY-ER; Fri, 26 Apr 2024 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0Lp4-0007lr-HR
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:41:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0Lp1-0008OJ-L7
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:41:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso302037666b.2
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138862; x=1714743662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9d1v76W9YlKbYNjbplkeshWLMVq0Czwi1rWFOBXIq3U=;
 b=rTX+tsUTPmB40pqbkt3tWUsgtZBPz7hJ9g/IblkwS5Jyl3UHEVDLej7n+RF7H4Sa/3
 7w/yBBpRbEvzYZBcmW0qqRnMJX59x1fRrC8m1wxDsPpYvSFwQH54l59J6fIrNMsIpM6n
 b+PQOAebZb7kyxRA+QH3Dm0G/ldDrNf9AnTm733mkLSuG+kMZXrbeLB3zaFcvRWOUQgx
 IP3UsKvaOHXLR6KG/VzIgGCAvk9kgwTd6c2jA/IfzrMfr6cFLakZt9Af0Nh/y2/fFp00
 ulEKI9grHlCJdoaWn6A9QjgQh09IvOfvYfPaMr/gr0ZaK0vGi+mDfBxK4ii+AOMdww86
 Kssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138862; x=1714743662;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9d1v76W9YlKbYNjbplkeshWLMVq0Czwi1rWFOBXIq3U=;
 b=NG2N5z5RlLxYuaXkAPKUOysI/FJUymtdeZIzhqlfnowgLlo3UG3MB5oqfI4owDefTM
 9qud0geJUxVb7eENqrEgROtYSTfcwYbvHc0ADMFSFMao6p1A80SPRmFx+1Tq38lZMpuR
 Osl8snbCnP/dubuQGwNybyOK1tyY/eNKXf/MLGWziANsoW5JvrW+Vc0Qy7sIb2Kn8NeE
 WvL4kvceOceFuWsLebiXwe0NE6p6CYAGMaQJoGCVYyZjCZI+hJ/cEIAcjVHkUdoylj2s
 0IVDZfW4IQXPyH3E6E44gEmSPhOt7m5KjeL/1jNqw1s0goRcG24ZWyqLh6BI5yj0ckxN
 txBg==
X-Gm-Message-State: AOJu0YxIltIlTf4cPDbVvKEqpDJ/xDVl2O0tVUiC1VFtdxgumY4oscvJ
 LZuxdGXhNbRd4iHGoUuQS/gNMPsa3eqEC2S2xCXkNDsept71X9oGbS864ltD2w/NLMgFUyt6UKr
 9H+I=
X-Received: by 2002:a17:906:34c3:b0:a58:d7d8:2f4d with SMTP id
 h3-20020a17090634c300b00a58d7d82f4dmr986007ejb.61.1714138862016; 
 Fri, 26 Apr 2024 06:41:02 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 m12-20020a1709062b8c00b00a58d438ed2esm519056ejg.139.2024.04.26.06.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 06:41:01 -0700 (PDT)
Message-ID: <fa4a0f09-a5f1-481a-8f2b-20a4df1eff59@linaro.org>
Date: Fri, 26 Apr 2024 15:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/watchdog/sbsa_gwdt: Make watchdog timer
 frequency a QOM property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240426122913.3427983-1-peter.maydell@linaro.org>
 <20240426122913.3427983-4-peter.maydell@linaro.org>
 <36b9a714-44ff-4b60-a23d-89672a98f46e@linaro.org>
 <CAFEAcA-ajhEXq4wJW-qp_scL0JqfJXCzZNvtmHtQEJLcRhj7-A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-ajhEXq4wJW-qp_scL0JqfJXCzZNvtmHtQEJLcRhj7-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 3DkaZVLWaPGy

On 26/4/24 15:28, Peter Maydell wrote:
> On Fri, 26 Apr 2024 at 13:46, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 26/4/24 14:29, Peter Maydell wrote:
>>> Currently the sbsa_gdwt watchdog device hardcodes its frequency at
>>> 62.5MHz. In real hardware, this watchdog is supposed to be driven
>>> from the system counter, which also drives the CPU generic timers.
>>> Newer CPU types (in particular from Armv8.6) should have a CPU
>>> generic timer frequency of 1GHz, so we can't leave the watchdog
>>> on the old QEMU default of 62.5GHz.
>>>
>>> Make the frequency a QOM property so it can be set by the board,
>>> and have our only board that uses this device set that frequency
>>> to the same value it sets the CPU frequency.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    include/hw/watchdog/sbsa_gwdt.h |  3 +--
>>>    hw/arm/sbsa-ref.c               |  1 +
>>>    hw/watchdog/sbsa_gwdt.c         | 15 ++++++++++++++-
>>>    3 files changed, 16 insertions(+), 3 deletions(-)
>>
>>
>>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>>> index 36f6f717b4b..57c337fd92a 100644
>>> --- a/hw/arm/sbsa-ref.c
>>> +++ b/hw/arm/sbsa-ref.c
>>> @@ -543,6 +543,7 @@ static void create_wdt(const SBSAMachineState *sms)
>>>        SysBusDevice *s = SYS_BUS_DEVICE(dev);
>>>        int irq = sbsa_ref_irqmap[SBSA_GWDT_WS0];
>>>
>>> +    qdev_prop_set_uint64(dev, "clock-frequency", SBSA_GTIMER_HZ);
>>
>> Since we have access to the CPU and its generic timer, what about
>> just keep the wdg in sync, as smth like:
>>
>>     qdev_prop_set_uint64(dev, "clock-frequency",
>>                          object_property_get_uint(OBJECT(some_cpu),
>>                                                   "cntfrq", errp));
> 
> That introduces an implicit ordering requirement that
> the CPU has been created before the watchdog, which I'm
> not super enthusiastic about. "The platform knows the
> frequency and sets it on the devices that care" seems
> more straightforward to me.
> 
> (The really-follow-the-hardware approach here would be to
> model the memory mapped system counter and then wire that
> up to both the CPUs and the watchdog, but that's a lot
> of extra work. I have some half-baked patches in that
> direction but for the moment I figure doing the simple
> thing is all we need.)

Yeah, since the clock is fixed, the current patch is
good enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

