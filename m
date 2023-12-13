Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1848453ejo;
        Wed, 13 Dec 2023 11:16:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+g+VcFLJsOrOUWkKaYcSgG4/NFtcEoseVGZhhj2zemj6st3i1Bb/9Han8GKenzmL7JoPD
X-Received: by 2002:a05:6359:4112:b0:170:c093:8d16 with SMTP id kh18-20020a056359411200b00170c0938d16mr8164682rwc.50.1702494986374;
        Wed, 13 Dec 2023 11:16:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702494986; cv=none;
        d=google.com; s=arc-20160816;
        b=RLUbiaQaEIrnjPEnBOkIyZzWuW/l14lB4fqE2k/hhorLyIdLt0RyDx6/6AUwmpg08c
         iLJH1BUy6zcD5SLqK7JzoFRySWTtPdKQ5gSVcEuzpmLmMQo53nynoBy7ECv+PfZx7CDh
         PaoQr+N9AFFbosGUTpKzjN7W42MXEVGEbP2Aw66epHZejT1cyplwhjujVwTdGJDRJxif
         3hmmiGD6AlyAPTzkPoSfIWyuh3l1eBoonKMoEC245f+WH8Ke6GDNlpDYALzltB6GGKih
         SUxNiXUFssbxZYIFXv0LVXqLpmGyl9xzIBfcbQ360mOeGXaeiUQft+UF/9gke3PPyfDR
         ASdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rLenTaYJHXtibSc66pUowk+tsS9QMOhm/sOD6BaK368=;
        fh=EuPRAS/cvS2mgyO6kgXIEB2LjqSKzNlqpxrCWCXCvqQ=;
        b=Wvs1n0P0gikYLxtxexYMKdP0R+x0kM+4Q8LW3TmdU+hiDpA268wNF7SaN96+yIGstR
         hzj3B4I7ldUwvPCQoAiSuuaSIT8EPR9of3C5ei3WXhcrjiCi2CIvdcsdRxKCZry9kRXe
         1mwyN1g+8dwK91T52FIvMzrkIQudLK+E5Rnq8Iz6InFLCKHDSqYm8pUxJxbiU14Y7zOh
         PdEb7zSzLlkdx/axJ9iG5KOaUdIxP/M3DyXSNu/yG6ivpVPzuXTkUjgb0t3lDTvE3sk2
         eGkZI0/wKAmQao5aUEonORbb3ZUuS7ImqWvhOJMH2UJmaM2s8AhON3njXC6XvlqKkUVb
         +CoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sHs/wabI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb27-20020a05622a1b1b00b004236ed850d4si13762058qtb.166.2023.12.13.11.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 11:16:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sHs/wabI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDUiM-0006Dn-Ky; Wed, 13 Dec 2023 14:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDUiL-0006DS-By
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 14:16:13 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDUiJ-0002lR-Ko
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 14:16:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3363eba94ebso703697f8f.3
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702494970; x=1703099770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLenTaYJHXtibSc66pUowk+tsS9QMOhm/sOD6BaK368=;
 b=sHs/wabI2WCQ8y48rgwY77qNhdx5L7f5odUqaE1S/GXpMMO4I2Vp6dDhePWb53OstC
 0j2iHmAthOFXCQGxyhGnuCe+tv4hto/xHZqagANroa2TbrxghSQEuN2jWJfH9UTO4v+r
 da7HfgB/rMv8EBK/bCnxyTowjMvy6ybGzooNMR8xfenTIhggmeEdl9dTc9Ex9JqhDsm+
 z5tZdvZLV/Wc21LTCNCj3sOpkC7dYzCTXJ0PtnL2PBe7B9qugo5mThjNlVYqPGlDEOSC
 0nTIgBfdI6mv8R8uaXCoXn55p91YrKQC9oYpst3tXEMejHPpHHlDiCCpkU97IaX1QYBQ
 2eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702494970; x=1703099770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLenTaYJHXtibSc66pUowk+tsS9QMOhm/sOD6BaK368=;
 b=XJumZUV7liIaXFKBsJNStz6qeVztAS9IXHqVgYBhwBfMTytSpw8H0bTYhiA+0CsbPZ
 +1+A1wnvTczkG2VKLYJB4O/sgXe0rksy6Gty+POtk4+8xwuOsfHgYDzfCtrjp67sy0SC
 lq+Q/E0QxuqwsvKFsHQ3fJsi/W+CNsW2iv5vqjYTkVL8hTnnzj0jHMOeKHSlzT2JaTJo
 TSryJewQ2Yv3BAM0BYM5FN7dThQXewgFT5IS3RN8T/IE7U/FL5s4mmc26QWmz4kJA7vf
 VZ4Ru+kz0uhQmuoTE7q6FjDNPCujWj+L6ZURKytim8rl/3Y3uDWXkS2ZVYAR6uLHEybH
 fojw==
X-Gm-Message-State: AOJu0YxhWSq5cYi4+NsiAVanXlhCMwXiO39H619TzHtxvZnk9pZcnovS
 BqCbDNv+dqXgKAimXg4SWA4kyg==
X-Received: by 2002:a7b:c7c6:0:b0:40b:5e59:f741 with SMTP id
 z6-20020a7bc7c6000000b0040b5e59f741mr2416710wmk.179.1702494969713; 
 Wed, 13 Dec 2023 11:16:09 -0800 (PST)
Received: from [192.168.1.120] (tmo-066-178.customers.d1-online.com.
 [80.187.66.178]) by smtp.gmail.com with ESMTPSA id
 fj8-20020a1709069c8800b00a1d5c342674sm8175320ejc.27.2023.12.13.11.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 11:16:09 -0800 (PST)
Message-ID: <e4ce3b41-8a40-4a30-a615-a520ae881121@linaro.org>
Date: Wed, 13 Dec 2023 20:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsl-imx: Add simple RTC emulation for i.MX6 and i.MX7
 boards
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Nikita Ostrenkov <n.ostrenkov@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20231112092232.131-1-n.ostrenkov@gmail.com>
 <CAFEAcA8A8sGjknad1QpeJ8qank-mWWw+gRvR4PVBHk2zAHrEnQ@mail.gmail.com>
 <fbab82ef-bb45-417a-932e-99089dd4d4a5@linaro.org>
 <CAFEAcA-NVrx+q6XLX02vuwD274THh5N7NJExVzvtD5zKaFa4HQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-NVrx+q6XLX02vuwD274THh5N7NJExVzvtD5zKaFa4HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: JwMQNbmyyhfD

On 13/12/23 18:20, Peter Maydell wrote:
> On Wed, 13 Dec 2023 at 17:17, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 12/12/23 15:18, Peter Maydell wrote:
>>> On Sun, 12 Nov 2023 at 09:22, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>>>
>>> Hi; thanks for this patch, and sorry I haven't got round
>>> to reviewing it earlier.
>>>
>>>> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
>>>> ---
>>>>    hw/misc/imx7_snvs.c         | 59 ++++++++++++++++++++++++++++++++-----
>>>>    hw/misc/trace-events        |  4 +--
>>>>    include/hw/misc/imx7_snvs.h | 14 ++++++++-
>>>>    3 files changed, 67 insertions(+), 10 deletions(-)
>>
>>
>>>> @@ -31,6 +33,16 @@ struct IMX7SNVSState {
>>>>        SysBusDevice parent_obj;
>>>>
>>>>        MemoryRegion mmio;
>>>> +
>>>> +    /*
>>>> +     * Needed to preserve the tick_count across migration, even if the
>>>> +     * absolute value of the rtc_clock is different on the source and
>>>> +     * destination.
>>>> +     */
>>>> +    int64_t tick_offset_vmstate;
>>>
>>> You don't need tick_offset_vmstate -- it is only in the p031
>>> RTC device as a backwards-compatibility thing for older versions
>>> of QEMU. Migrating tick_offset alone is sufficient in a new
>>> device. (It seems to have been unfortunately copied-and-pasted
>>> into the goldfish RTC device; we should probably fix that bug.)
>>>
>>>> +    int64_t tick_offset;
>>>> +
>>>> +    uint64_t lpcr;
>>>
>>> We've now added state to this device, which means that it needs
>>> a VMState structure to handle migration, and it needs a reset
>>> function.
>>
>> I just noticed your v1 review after reviewing v2. Indeed
>> 'tick_offset' need to be migrated. Now about reset(), RTC
>> are somehow different. When resetting a machine in the same
>> QEMU process I'd expect the RTC offset to not be reset.
>>
>> Could this be clarified by adding a reset handler with no
>> code but a comment /* RTC state is usually kept by CMOS
>> battery and is not reset */ maybe?
> 
> The lpcr register state needs to be reset.

Oh, I missed its access in imx7_snvs_read().

> thanks
> -- PMM

