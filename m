Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp6307844lfy;
        Mon, 3 Aug 2020 12:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBNJ2TieOwjxvaFSpYDWd8vnRIN5fdKV/GPN+Cjs5orcy5xXXH1a4jjDEIdWJ3Lm/n1SuK
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr10285583ybc.220.1596481752899;
        Mon, 03 Aug 2020 12:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596481752; cv=none;
        d=google.com; s=arc-20160816;
        b=p3o45ETGdtMehsyVihxMpIVfDJ7eOp4oRs8uSeF/B6N1QHYQcM0hTKLb4Km38ETrcO
         /rTu7qTrkL0fyQc9desYfJuU0/8nlsFIebVe6FNQ7ArLFa6EhqXHSzMbuchXL+Xqnt6K
         eRf+uQOM66fTJRp+f16OE+bgAdorgiIMngrBEEtJa65WrLfGaFOUbJ9KKG98DBVIT8i3
         wjf/jvTlQtEwUqfZiV8dg9ZBZbLzmMMAUKR/q8OHNNzE9DkozGZyGSlayZWhGPvO4EUi
         rNQbglOrvcG3MVOa1hYa+bAatAk4dDX5L41vRoFaplpfgELknaMG/G+ACM4zvtwBt+Ms
         Wd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uEr5yyXCGhwQVOZCFVlKuzg8aQu+Pdh2opLh5KDg4A4=;
        b=AcnNbZ8vK+uawEpZCleTzT2xw87PX3XPSbh5k7dINPxVgBHlPuB/fDprweB9KJP8Mg
         BsGBDph2z0pdvjy3UHOcE/u2gzCGUIx77Q5OOTlFzGcnS1cnaCaGVv0/kkTwrMII6TVO
         BZ53sMpnM4aYK/gyiC0sOOe/Y7+ahUwN8/IK+40vvLN9sa8nlZ78u40kzc7okhV4lPrD
         TdOzgbN+2S3BjRnURfzotIBlux6pTBDo7nkRzLrkv6nGlFCC8hkfJ2BJEbiJvNXElyC7
         6vPYZSh9xGVNpLjR5xGMLnVwtf1OrhCEBsVrgwiLypLcqBa/ALO3auveEI0j8OzAMR03
         MkTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mPlKvRM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j64si3346545ybb.497.2020.08.03.12.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 12:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mPlKvRM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2fpg-0007WA-8o
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 15:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2fpX-0007Un-8B; Mon, 03 Aug 2020 15:09:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2fpV-0000Mh-Bw; Mon, 03 Aug 2020 15:09:02 -0400
Received: by mail-wr1-x444.google.com with SMTP id r2so30125872wrs.8;
 Mon, 03 Aug 2020 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uEr5yyXCGhwQVOZCFVlKuzg8aQu+Pdh2opLh5KDg4A4=;
 b=mPlKvRM/SVsXiKl7hNMkAuFCZOJCzkalVrxYa9kcMnWvE0RkBSgqvRRk9SwdpADLDl
 TVNOTp6BYPJTb4JukIM6thVwWpGd/2BTJhQzh8cgdPicBLBRNkLvryuXlEFJBuDBCGjw
 7DOkBvzdVckxjV9spS9Alb8+lfZUPzdvnthKd9xxWgnnSHU+WLAeIYQCeHu67Yw7oC/O
 d5Gcr9IoJl+Mp/3Uma+67eLCDIcuExdlRdH0LqMcWMa/Vx3L6BXOhN4OxBKMiNHMTL0E
 3RXa5hbNmUSDgo/RY7pOxqeTe8UGj6773eQIKOXfs3wO42ygualUBeaGhsSmo1JloGhg
 oEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uEr5yyXCGhwQVOZCFVlKuzg8aQu+Pdh2opLh5KDg4A4=;
 b=SYOYXLRzet+e8Yjp14yTFBb/MmSyCWaAHtmsQdlFPFA9+zLMaAXFlwftp7htivxWnZ
 wS8lbDklH6Zpx8+PdPaq3MhhfZnims340VM2g1YYuD6oMYqpkza4ATCrLsPnGoIM2/fK
 1yT02wHASaPQUPoknWAxXRmOxPTf7oVAWtIJTD8KF5E2VSTPNK0vpzDlbje73a1RmXPU
 zpShYDhFOd1/dUDfq69N/S5XQ0/Es72wSRw4dFllpvUXYOFw3Zjl2OshU/ThzpJXhXeC
 NrWhOQNXoqM2R5ZO2KiiVhQXpelsRfM5o6co3gCHt54LLQn3NIDnvLTWfZzt1YorYbow
 4j/w==
X-Gm-Message-State: AOAM5321mtvTeaReT6nfFcYpOpwVMg7TPyWFJAiWst9bGQQdIzgZo/Sf
 /zrkOB71EEG7byHZq5HESQI=
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr17301111wrs.188.1596481738864; 
 Mon, 03 Aug 2020 12:08:58 -0700 (PDT)
Received: from [192.168.1.43] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id 111sm27450514wrc.53.2020.08.03.12.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 12:08:57 -0700 (PDT)
Subject: Re: [PATCH v6 00/13] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200717060258.1602319-1-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <61366428-ca35-e0b5-cfce-99624747631b@amsat.org>
Date: Mon, 3 Aug 2020 21:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200717060258.1602319-1-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPDHAvtR0OY6

Hi Havard,

On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> I also pushed this and the previous two patchsets to my qemu fork on github.
> The branches are named npcm7xx-v[1-6].
> 
>   https://github.com/hskinnemoen/qemu
> 
> This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
> an OpenBMC image built for quanta-gsj. This includes device models for:
> 
>   - Global Configuration Registers
>   - Clock Control
>   - Timers
>   - Fuses
>   - Memory Controller
>   - Flash Controller
> 
> These modules, along with the existing Cortex A9 CPU cores and built-in
> peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in turn form
> the foundation for the quanta-gsj and npcm750-evb machines, respectively. The
> two SoCs are very similar; the only difference is that NPCM730 is missing some
> peripherals that NPCM750 has, and which are not considered essential for
> datacenter use (e.g. graphics controllers). For more information, see
> 
> https://www.nuvoton.com/products/cloud-computing/ibmc/
> 
> Both quanta-gsj and npcm750-evb correspond to real boards supported by OpenBMC.
> At the end of the series, qemu can boot an OpenBMC image built for one of these
> boards with some minor modifications.
> 
> The patches in this series were developed by Google and reviewed by Nuvoton. We
> will be maintaining the machine and peripheral support together.
> 
> The data sheet for these SoCs is not generally available. Please let me know if
> more comments are needed to understand the device behavior.
> 
> Changes since v5:
> 
>   - Boot ROM included, as a git submodule and a binary blob, and loaded by
>     default, so the -bios option is usually not necessary anymore.
>   - Two acceptance tests added (openbmc image boot, and direct kernel boot).
>   - npcm7xx_load_kernel() moved to SoC code.
>   - NPCM7XX_TIMER_REF_HZ definition moved to CLK header.
>   - Comments added clarifying available SPI flash chip selects.
>   - Error handling adjustments:
>       - Errors from CPU and GCR realization are propagated through the SoC
>         since they may be triggered by user-configurable parameters.
>       - Machine init uses error_fatal instead of error_abort for SoC
>         realization flash init. This makes error messages more helpful.
>       - Comments added to indicate whether peripherals may fail to realize.
>       - Use ERRP_GUARD() instead of Error *err when possible.
>   - Default CPU type is now set, and attempting to set it to anything else
>     will fail.
>   - Format string fixes (use HWADDR_PRIx, etc.)
>   - Simplified memory size encoding and error checking in npcm7xx_gcr.
>   - Encapsulate non-obvious pointer subtraction into helper functions in the
>     FIU and TIMER modules.
>   - Incorporate review feedback into the FIU module:
>       - Add select/deselect trace events.
>       - Use npcm7xx_fiu_{de,}select() consistently.
>       - Use extract/deposit in more places for consistency.
>       - Use -Wimplicit-fallthrough compatible fallthrough comments.
>       - Use qdev_init_gpio_out_named instead of sysbus_init_irq for chip
>         selects.
>   - Incorporate review feedback into the TIMER module:
>       - Assert that we never pause a timer that has already expired, instead of
>         trying to handle it. This should be safe since QEMU_CLOCK_VIRTUAL is
>         stopped while this code is running.
>       - Simplify the switch blocks in the read and write handlers.
> 
> I made a change to error out if a flash drive was not specified, but reverted
> it because it caused make check to fail (qom-test). When specifying a NULL
> block device, the m25p flash device initializes its in-memory storage with 0xff
> and doesn't attempt to write anything back. This seems correct to me.

I've been quite busy, now looking back a this series. Do you have a v7
in preparation or should I keep reviewing it?

Hopefully v7 would be the one Peter queue for merging once 5.2 window
opens :)

Regards,

Phil.
