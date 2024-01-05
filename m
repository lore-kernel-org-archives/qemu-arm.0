Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp620626ejo;
        Fri, 5 Jan 2024 02:19:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJx4yKU3GSmNSWcBFvAdFeSshyWxWP/bgWFx44Ucm0aeo8KRRuFFUhr8/wkTjRwQHbDgZz
X-Received: by 2002:a05:6214:1d25:b0:67f:7780:e7e9 with SMTP id f5-20020a0562141d2500b0067f7780e7e9mr1940422qvd.21.1704449982132;
        Fri, 05 Jan 2024 02:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704449982; cv=none;
        d=google.com; s=arc-20160816;
        b=e2dU3vFhyL0LdwQuuNQfQE2vaWOFXyrHr/0Sqvj7IqEDCfxZSmLVjzcZtgI3InZTHO
         OzQryLSx1IXf/PAqUWG3av/RyyTpElSIR3/fH2+Gn8fRFuFEv+N2So31NAlo+ywPFURx
         5IceaN0BDlXfWYTfDzdBIddKQhu5YA+qrvSb6rX22N3rReGIVbdO/6LxB5pp/dfLhOT5
         Zr0DdRgAI4djPjzPdCJD6otFg3VJZGnvXcqQbOZS8YTDTrB2y5UTLhoV0Y9ogUdu9EGV
         q6LQ2peq7PHEhjJi3PVjlqO1g/PUjEcY2oDHd6/TL/oHT6nU2Udj6DS8p8JMRYRmHwsA
         RRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JrpZJsC+JCf4DKhNEEKL+YgSEbHMOxskxIftU0vEodU=;
        fh=pLk7IlYeOw9gEUp1FsbFqgDAiPe5JHHXs+b90EKpYi8=;
        b=leQehwUFQDMp+BvjMZjUKGBCFGb0PaOPbTdYuE5zI5++04jvcL1coRwcjiUeI0i0Vw
         M11AuzpI8vaial4KROP/mhBKeYRmIahWbcWJrUureuYthyMmDJAgN9aFmycvNaTij3R8
         HiOckYyZzfjP7qJEEfFhM5JCe48bQnc6M+7gM9yMEVrfExmEZqElnwlpO+VeBnneQ0TX
         wZf2SuhdpuQo6u7b+HbdGKmEzazbWdolUyenMqjcR14bamaju2Y9l+rNtsZQhc9sk4DP
         Tquc94wAVlHbOA5/+qT63O9+qFstXqbiYlJlg3YpAulZdiWt5QlzU5MO9EsEBtEVwwIJ
         ntrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OatCxACR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a0c8e09000000b0067f30be7df2si1385847qvb.496.2024.01.05.02.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 02:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OatCxACR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLhIS-0006Tw-M2; Fri, 05 Jan 2024 05:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhIR-0006TH-2W
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:19:23 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhIM-0001qN-Lw
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 05:19:20 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e741123acso1602959e87.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704449955; x=1705054755; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JrpZJsC+JCf4DKhNEEKL+YgSEbHMOxskxIftU0vEodU=;
 b=OatCxACRDqIQhAUiVMmjpMDUtT9F1ygNGRbswS9eCcfeyccdbRrJyyIj2ViME3giCi
 GBI/elw0FSgyayH/L33Y6GdESiAQlmE4Ju5EJg50xp7Rbb7u6Ynsi+5f9I/DIHH/thRf
 YvPEJ3i+QUTVfFkw9JrPU03kVdyJHHM5cEBR9NfDEKdtx9/jdDAwLCoq1VhKkhhMiLZt
 48aIXnWPXIVrcHjUlIRSwXKTKgvSkY8vsD72GmQtyY/CA4KipcnkdTg75+nbrl3eTqzr
 xYJqVc3NUZcEbQuob01Xb4Y/yPiTXHC3uk1CGd5o05YjNsoMRW1D5b/hyVk4LoieVqG4
 xbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704449955; x=1705054755;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JrpZJsC+JCf4DKhNEEKL+YgSEbHMOxskxIftU0vEodU=;
 b=a60eR7NfcuOZlXN2A1+++VxsBA/y1GkkFLuPG7oH8XPHvs6E9zcg9Y8O152LgPT0vQ
 0GKlPT1YWlm0HiSsutK56d64xCBROD03UQIwoqWmGGk+PKIKJyTYDzixp6uzU8hUHa5Y
 8RAvKwe9fXvFG921djVxHR2d9dTM/jcTs+rsOMy4xtrm6fndGX6Ae51Fk9HX4uUKgwHT
 4Bsfoq6M6PRqcWkNBTMxpDQPsk+gWl8SZH0mk3D2xpMqvLPkPyw/ZrxNL6jTwH4tR7xd
 GQdkg5QLtGn0hu8VEmQs5HC4TjRbJby3GEGDXwwA7k/hbeljcCBrdXs2+CgudUSznS6F
 1j0A==
X-Gm-Message-State: AOJu0YxkHY1Ady+v4ceBn4H9fYI1SY115egIBes8SYVKA4+GY5t9cvvT
 tfRKAFsWM6sLZ03P/YLmh3/0TW7jQ/etzA==
X-Received: by 2002:a05:6512:3e05:b0:50e:7bbb:55c with SMTP id
 i5-20020a0565123e0500b0050e7bbb055cmr1140634lfv.139.1704449955448; 
 Fri, 05 Jan 2024 02:19:15 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170906604400b00a298ade2e72sm83965ejj.195.2024.01.05.02.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 02:19:14 -0800 (PST)
Message-ID: <805ca196-5464-4023-a1c1-97d5a6699c1b@linaro.org>
Date: Fri, 5 Jan 2024 11:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: inesvarhol <inesvarhol@proton.me>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
 <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
 <5f624a13-0ba0-4d9a-8910-2ef1c784a295@linaro.org>
In-Reply-To: <5f624a13-0ba0-4d9a-8910-2ef1c784a295@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: sT9q/vPtza+A

On 5/1/24 11:13, Philippe Mathieu-Daudé wrote:
> (+Mark & Eduardo)
> 
> On 4/1/24 14:37, inesvarhol wrote:
>>
>> Le jeudi 4 janvier 2024 à 14:05, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> a écrit :
>>
>> Hello,
>>
>>>> +static void test_edge_selector(void)
>>>> +{
>>>> + enable_nvic_irq(EXTI0_IRQ);
>>>> +
>>>> + / Configure EXTI line 0 irq on rising edge */
>>>> + qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
>>>
>>>
>>> Markus, this qtest use seems to expect some stability in QOM path...
>>>
>>> Inès, Arnaud, having the SoC unattached is dubious, it belongs to
>>> the machine.
>>
>> Noted, we will fix that.
>> Should we be concerned about the "stability in QOM path" ?
> 
> Don't worry about this Inès, I wanted to raise Markus attention on this.
> 
> You showed a legit use of stable QOM path, and Markus told me recently
> there is no contract for QOM paths (it shouldn't be considered as a
> stable API). IIRC Markus explanation, "/unattached" container was
> added as a temporary hack to allow migrating QDev objects to QOM (see
> around commit da57febfed "qdev: give all devices a canonical path",
> 11 years ago).

Hmm am I getting confused with "/peripheral-anon" (commit 8eb02831af
"dev: add an anonymous peripheral container")?

> I agree anything under "/unattached" can be expected to be stable
> (but we need a community consensus). Then the big question remaining
> is "can any qom-path out of /unattached be considered stable?"
> 
> Regards,
> 
> Phil.

