Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp151987ejr;
        Sat, 29 Oct 2022 16:11:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JgQv7R0q3yUcpwowe1NcA//1sFONnGKh10mImlfukpRR2xss7WnFfb3ll6ZBkwFmrDsU2
X-Received: by 2002:a05:622a:418d:b0:3a5:1f71:b142 with SMTP id cd13-20020a05622a418d00b003a51f71b142mr231014qtb.632.1667085068452;
        Sat, 29 Oct 2022 16:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667085068; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/kOHIfrAtcJ2I7Xqe8t6Sonlye2nSrSgMwt5XPGmoR9MVR1u5JVEm57CfBpUEYzsn
         iUb1gMw+EFBiIIsjc11+JBR5836p73bVnhz0vbcm54RbytQ8BSVt5KfzFCcHwmRBGQ0B
         L5ZI2xZmFF6HG/OfNSiOfS1aRtJ3nofXc4C7ydLhO14ZNH6N1gHmHGgDLrijGGp+9e1a
         GYBjNWavY9qvI8EheO4tOD7CS+tnL7CheAaiGgnxu6VdggKuErisBfZ4VvrzM7ws8Crl
         fspnetlyK20CE/4i6PufjOCoGfAKTLnDF5RAb0+rcZKTUN1dmWsII7AUF4BJZaM5q9RS
         xF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7WEHZGtJLdkABUE5WwbUglDYscAVMYI4pvPF2uOX8ME=;
        b=SXOM0gEZiQDo4UVVutBktjNDqJ8IeHR6ps5R0rxbq/JHAFGfBuPqzJoM9RZ31tV5CI
         inaVB6Z+P4wlt2/WdQ8NR96CGKGOjtngqAwfTp97SlkDSMHbAyZwLbVZDBfyKAe0u/tI
         mfjYvONU5PKJKpC/50LouR/L0vQ8k3HDAhvcnDMlMrJXikyrwpzKIcIku0lQymHlDbG9
         t+y4EAKNGhtL4mJHG0ep+TG3MypPk/4itWA1F+XpFKWbi4ekRuUsn7v8bZHU/nxzITF2
         veDj0oDmS8fYNrIB6qzV2ZrejJXjf0drXZFqSoEioKcMwnJECVH2PfUNK255NR9uq6Wf
         vQiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhIVQ6LC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b004b170df6367si1585454qvb.166.2022.10.29.16.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 16:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhIVQ6LC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oouyR-0006ZO-NU; Sat, 29 Oct 2022 19:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oouyQ-0006ZF-OP
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 19:10:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oouyK-0007rM-KV
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 19:10:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id l32so5194666wms.2
 for <qemu-arm@nongnu.org>; Sat, 29 Oct 2022 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WEHZGtJLdkABUE5WwbUglDYscAVMYI4pvPF2uOX8ME=;
 b=MhIVQ6LC1G0GmGdIyWrrU4uFxPTatapuL0NGFgkfci3ILNauTcPp4oCkGyOwGu0b2M
 2KFPeayT2fQcqulPJzdtYcyFv2AumKHq4nXUYp/cUtNJyVASXaVpbT0cInQ4n9ubWAGQ
 p7YCe68nZNvuZeFgf77GWEQ5Vwz3t4WTeRNGvHZm0DmoeQy6pJ1HKjlSVO9SAJSrHpT8
 5DzZpdxdPqViUDyzetIZofKIMBU5Jlq9I4Lb2X4zj9RhGSfuc/Q0CIcEg6qMbUzP0/DM
 xBE0uBrCncm7ktsFSflnPJz8kdOI3x8RG6fZvBIArqMer0Z+VnTyy3LqCR3tDBmGsUfp
 WwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WEHZGtJLdkABUE5WwbUglDYscAVMYI4pvPF2uOX8ME=;
 b=gv2VSaUKXYvO6ul7jnD247YsbNINkxJR/2Crmn+94WFVPoNzK6b3REKSrbDonhj0Q3
 DXnOYDsBgKXh3feuubatZbQrNkdP3/p5Hja/s14dxP6+Ww50cRe7fX1I8l0sGyRDXdVt
 BpRPoFlQB0cNXthTTgeSSRU/sZFn/Sn/b9lNn0d23dZ84uqJQM/RyDOoPUXapGUkiyt+
 8MD2b0j5CXeTnfCy655Og6KosaSothX5MUTW40l3ckwlX8T/KtNgrPCPHGk5H0Lm/xOn
 YBOVUMiBQOHqZ6J7MhDOMUHjicDX1mIx5zvaPD8pY5lZEgsnE4EHMs860THNlPDeUCKZ
 0QVw==
X-Gm-Message-State: ACrzQf35XxlS9YcRvSvWJ/Nrsr1+zBzSrxKP6K4Vfc7beIGav5ll8Kbg
 k9YK6vUnvsyhzjYI1cYtUGQUOw==
X-Received: by 2002:a7b:ce11:0:b0:3cd:df84:2708 with SMTP id
 m17-20020a7bce11000000b003cddf842708mr3477622wmc.165.1667085034271; 
 Sat, 29 Oct 2022 16:10:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c1d1100b003a342933727sm2967311wms.3.2022.10.29.16.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 16:10:33 -0700 (PDT)
Message-ID: <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
Date: Sun, 30 Oct 2022 01:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z6ksudCAv3Ki

On 29/10/22 20:28, Bernhard Beschow wrote:
> Am 29. Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> Am 29. Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>> Am 27. Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> Hi Bernhard,
>>>>
>>>> On 18/10/22 23:01, Bernhard Beschow wrote:
>>>>> Will allow e500 boards to access SD cards using just their own devices.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>>    hw/sd/sdhci.c         | 120 +++++++++++++++++++++++++++++++++++++++++-
>>>>>    include/hw/sd/sdhci.h |   3 ++
>>>>>    2 files changed, 122 insertions(+), 1 deletion(-)

>>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_REGISTERS_MAP_SIZE (= 0x310) and map it normally at offset
>>>> 0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
>>>> hw/arm/bcm2835_peripherals.c.
>>>>
>>>> But the ESDHC_WML register has address 0x44 and fits inside the
>>>> SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
>>>> upper part of the SDHC_CAPAB register. These bits are undefined
>>>> on the spec v2, which I see you are setting in esdhci_init().
>>>> So this register should already return 0, otherwise we have
>>>> a bug. Thus we don't need to handle this ESDHC_WML particularly.
>>
>> My idea here was to catch this unimplemented case in order to indicate this clearly to users. Perhaps it nudges somebody to provide a patch?
>>
>>>>
>>>> And your model is reduced to handling create_unimp() in esdhci_realize().
>>>>
>>>> Am I missing something?
>>>
>>> The mmio ops are big endian and need to be aligned to a 4-byte boundary. It took me quite a while to debug this. So shall I just create an additional memory region for the region above SDHC_REGISTERS_MAP_SIZE for ESDHC_DMA_SYSCTL?
>>
>> All in all I currently don't have a better idea than keeping the custom i/o ops for the standard region and adding an additional unimplemented region for ESDHC_DMA_SYSCTL. I think I'd have to dynamically allocate memory for it where I still need to figure out how not to leak it.
> 
> By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I was able to remove the custom implementations while having big endian and the alignments proper. However, I don't see a way of adding two memory regions - with or without a container. With a container I'd have to somehow preserve the mmio attribute which is initialized by the parent class, re-initialize it with the container, and add the preserved memory region as child. This seems very fragile, esp. since the parent class has created an alias for mmio in sysbus. Without a container, one would have two memory regions that both have to be mapped separately by the caller, i.e. it burdens the caller with an implementation detail.
> 
> Any suggestions?

Can you share branch and how to test?
