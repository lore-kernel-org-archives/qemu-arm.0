Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp576053njb;
        Fri, 4 Oct 2024 09:54:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFyp6scEa9p0JlvUH1FE7hsEL4S5xqbW+/oO82inOcYtwrj1iQBFsWy0vbAVRf00quFlhCRNVG3+fs2w==@linaro.org
X-Google-Smtp-Source: AGHT+IElsOwKc5xTyhVe5EZF9NFil0J7R09HP06Gw/vkaIwfMnwlbMCr7f3DvpPZQ5tFJ/M2NJCJ
X-Received: by 2002:a05:620a:284b:b0:7ac:d673:2056 with SMTP id af79cd13be357-7ae6f422b8amr582272285a.4.1728060869164;
        Fri, 04 Oct 2024 09:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728060869; cv=none;
        d=google.com; s=arc-20240605;
        b=d+qkWiTylmLWo0n+OcMydzyx5jrZHe2WaNQG3N32BE/2Qsa0IMiSlFjCEEHIKtyODw
         cBCjB5aEPpF7emWCfyz2aHdaDt//A4KtMEl+AG4k8Vag5BWdecaSQDW3+hb40nHU5Acf
         zaoBpS554/FPHeRTWHM7Q8qFuIYNufQTxYh7Skzk/Z4KtQAdqCrz1rT/5zcTjwtvWFRm
         Zvfl5E3m9vacrtnJYOuAa9jnHeUJud09l0TWK5kUWfo/zvYAYMuKzJfQ2NMJ1juOKGec
         we3QBosPaZcRiyGfKWuEP86MZT/e6Lwd56WgygxWLhdc8yLDtvSBbD3j19Z4GNpMizpg
         ZMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lGP2A9bmBuTl2RGS3b0YCDGhmzpnLRee3j4uNqnE5zU=;
        fh=Av3pOdOUdEpSwwnDdaEUYQK4nYSc4CgBWBXksCLwqsc=;
        b=BTLnmXXmF90BIm1oTI5cdehOXpUacGDTjc3fmrrSjHno6/kchH00xP8/WGBmSV2vCv
         o5hEShA0nPL3PPgdp4DZp+gn45/3h76o/ogv5mUP8L5TlY3VB3uWUHAMLaLJs0zmHVh6
         mBtQC8hvZJ58uHtDyB+lqNOdZbBpuSz4NwQb0IjC92gE5LFdnOIBSgcaAKfD0FNHq/ke
         SUWrYCMoHuefJsgBYjUK6bO2dyW3+/RtxidSmjadkMSAZooaBcPdX4nzp7+zv9DickHv
         K20QIiCbztWd35ZM6Fh7HszLkNrrUWM6UgjV1HBQpiue4WA63oOl3WiRN0dJxOokyRRd
         3jvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iovZfX1X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75779b52si1204485a.778.2024.10.04.09.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iovZfX1X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swlZK-0004Gq-HC; Fri, 04 Oct 2024 12:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlZH-0004FB-OF
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:54:16 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlZG-00006C-5R
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:54:15 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so2896025e87.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728060852; x=1728665652; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lGP2A9bmBuTl2RGS3b0YCDGhmzpnLRee3j4uNqnE5zU=;
 b=iovZfX1XKL9iQjV5ywXA2Kbu+DyF4Z11a+ESLLv+DyClwKoKafcO0IOO3UO21vVqeO
 VqUOyO2ApFEgdVShBQtL/nLocrs2kJIYUdSWCj8BYWyWz1YUWVHP1DGPpclc4K/UCILv
 FMoV9RSZEmFavSTF2fFgxxqdcymbHyPkWBZusqWgVDkx9mCemY/YkZPzy5tGBAmvlKbR
 W39ScEs9OTl7PYiybrip1USUKnZ1vnDEZW+bx8+3IKg2lan8zrw1Wcdg+dKE4qZZgXg3
 QiSy62+IPNMoyM7dWAU9MWc0/gwNCtNztvCoiSkTng2dmhQDTVyAVH4pDArHncrhnCwY
 ZAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728060852; x=1728665652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGP2A9bmBuTl2RGS3b0YCDGhmzpnLRee3j4uNqnE5zU=;
 b=mHWyER7/drBPjmVxA/Dd6I5+fdXZepvpUDK2tbhimNTGi/1PvhZqNKOZNGCbH8zEyB
 cInxovCAknHvkyh948BuquweKEklOm1NXCEsU+sZTEK1Ky8bOI7sL/mcrjsbSkv3/zwl
 WFegqKwCOPUKT4KUCERvsAMSHwObclNz5meHUTtF7dNXvwybMfC+6sbN+hMNLZDFPpt2
 AdoTZjX/cEDEz7NKMzwsoSVEcNOS1wUvak/hhXCN44EhlMuPAa0pnZXnGBqrHnd6qP+u
 N3uQ4k4RVmetPd1IQwXfLx9V+C8vns+ZLs370HB5IdErVlzH64LGpUSAPwshi4/ipfLl
 4Qpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj5pGJw51V3f6L7XPV3XBsbkzPw0dQOAY8jK8pYQr45DpWOFYjjHBDfqToyHY3wCHlxh4XNnpwhA==@nongnu.org
X-Gm-Message-State: AOJu0YxapmJUIE0OlR5496nZJrBgGQ/De2kCIzw+FtdX7v0PMaUcVx31
 vknCDnskmU+o+5Kp22vcZl3b2eCWCU0SnKQaApTqv9TF34RYnoEiDKdSz/WUKIM=
X-Received: by 2002:ac2:4c47:0:b0:539:8b49:8929 with SMTP id
 2adb3069b0e04-539ab858cc6mr1980046e87.21.1728060852085; 
 Fri, 04 Oct 2024 09:54:12 -0700 (PDT)
Received: from [192.168.132.175] ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff2835csm5200e87.275.2024.10.04.09.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 09:54:10 -0700 (PDT)
Message-ID: <bf1c2206-ef63-4dd3-8a15-0323dfa9509c@linaro.org>
Date: Fri, 4 Oct 2024 13:53:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] hw/core/cpu: Introduce CPUClass::is_big_endian()
 handler
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20241004162118.84570-1-philmd@linaro.org>
 <20241004162118.84570-3-philmd@linaro.org>
 <CAFEAcA_X38bhELuwwKLPrbfC+vLnwpUHP5RNCDv1V2r69dbJ7w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_X38bhELuwwKLPrbfC+vLnwpUHP5RNCDv1V2r69dbJ7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: Dplj1MvlDqIF

On 4/10/24 18:41, Peter Maydell wrote:
> On Fri, 4 Oct 2024 at 17:22, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Introduce the CPUClass::is_big_endian() handler and its
>> common default.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/core/cpu.h | 3 ++-
>>   hw/core/cpu-common.c  | 7 +++++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 04e9ad49968..22ef7a44e86 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -150,6 +150,7 @@ struct CPUClass {
>>       ObjectClass *(*class_by_name)(const char *cpu_model);
>>       void (*parse_features)(const char *typename, char *str, Error **errp);
>>
>> +    bool (*is_big_endian)(CPUState *cpu);
>>       bool (*has_work)(CPUState *cpu);
>>       int (*mmu_index)(CPUState *cpu, bool ifetch);
>>       int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> 
> What does this actually mean, though? Arm for instance
> has multiple different kinds of "big-endian" depending
> on the CPU: both BE32 and BE8, and data-endianness not
> necessarily being the same as instruction-endianness.

This is to be used in the data bus (I was wondering whether using 'data'
in the method name).

> This series doesn't introduce any users of this new API.
> It's hard to say without seeing what the intended use is,
> but I would expect that probably they would want to be testing
> something else, depending on what they're trying to do.

I'm trying to split my branch in "~20 patches series";
I should post example of API consumers in a few days.

First conversion is the cpu_in/out() API in system/ioport.c,
I'll try to post it ASAP so we can discuss there.

> It's pretty uncommon for anything out in the system to
> want to know what endianness a runtime-configurable CPU
> happens to be set to, because in real hardware a device
> has no way to tell. (This is why cpu_virtio_is_big_endian()
> is named the way it is -- to discourage anybody from trying
> to use it outside the virtio devices where we need it for
> legacy "the spec wasn't written thinking about endianness
> very hard" reasons.)

I'm trying to convert implicit knowledge of target endianness
to explicit one, propagated as argument from the machine.

