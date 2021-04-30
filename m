Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp337390lfg;
        Fri, 30 Apr 2021 10:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycvReOWGFbysA01DKe2YV8rItGfscCruFqwn5wuXCgetCLJeO3akXN6X2/nlBkm9nLZm1B
X-Received: by 2002:a05:6808:202:: with SMTP id l2mr2205849oie.48.1619804452361;
        Fri, 30 Apr 2021 10:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619804452; cv=none;
        d=google.com; s=arc-20160816;
        b=lO5F4eNKWDIFbvJp4dxXvFzrYHU4uXR1JjU5KEQ3hIcpLYvluVOtTRQmHS2VOfA1Ux
         3j5YXq/e4PX9pcZ+0u5QoMWPWwhmMOwX2IzdK9c1YSfdiSbsph1z6yW34lnchL2v8vHq
         1YhVye9KSlghsvSRUD/p2qLQdjJ/sPZJbP1QKnA3W3HjpUVEsYnMQhL8JBml83PP1Xqo
         lncV+EqCP9lZAQDp0cNKOL3roOphw48Pem1/FVXvDZ0wBiVLUUb/vtqjMOgpWyIuyxkw
         Az6C4c0CmIQXP16ylEWfr6Vgv1tyxIYH30kcoJLyE8SVvZlbo+HKnSVqPPnLfImbg2ky
         5MEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f5vkA8wLGmivGkl92zdZgcM7uzbvY7bbTBQyEwqpBQM=;
        b=Fc6PCXjZFwF5qxxaCvq0iOGaxwsm/gLxRchpQEjCFW0SrZjePspC3bWM7qsUEGamO2
         eFp8AC/SMIb4IOMwuWNzNz4wKdVz8W133K9jGoloteKNa+JXculUzMxhcUkZH0feVA0n
         d+k++xiPIRBraqNThdRX9vij8Qq7SBQti1M4GfG+4UqLkLG11wx8owvNx9bTYV0UZAM5
         RMvOr0BZU2YhGNdfrSTAwiLITkZlEH2uwz3WiAV9fJYgomlJ9sXx3kuWOn1Xke0noRaA
         IlQJEnPuhQXrLnzGEMcrLHuP9De6XixRdNIT6HBh6hnry2qvTOCe6nDVBNXWL1hTnvmr
         uN4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ww1ZVHj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si3869737oti.321.2021.04.30.10.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 10:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ww1ZVHj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcX8F-0002qt-Id
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 13:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWmw-0007NY-76
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 13:18:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcWmu-0008Iz-5E
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 13:18:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2122423pjv.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=f5vkA8wLGmivGkl92zdZgcM7uzbvY7bbTBQyEwqpBQM=;
 b=Ww1ZVHj7KE5P0UeXJxnJxnVMQy6B3jNdTo5zG/ILFJe21hlHvFAThTpoqNuaTNc6A6
 7DyMVmenWg1qyzRbaZmf7gKX4UjOX9aVDp5bVF9K+n4LICnwfOHkv4V/LvmA1YDFTN9E
 AZ3SZPVQd4QSaNh9bnCUuDh4XzsmY6U8jzFtHZZJD2Ter4+iVC54F12s+5OFyAIlmeYh
 MF/HqjIVNDzNPVASwFfGLJr2deCb+beXksYIH9hGdyOsPJX2UEMg7Fez3uPhVf99NBBv
 EJ/+4QPSpuw1iSOCzRHDjYAn7X7NGINkpWl0rhHGYQ8gH9AN009vmvOanpJ7HZWSiNMN
 57Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f5vkA8wLGmivGkl92zdZgcM7uzbvY7bbTBQyEwqpBQM=;
 b=JtZQF0wADDIOWdR3GrhwWBICGcAzqssCQ7++wg+8+ZdXw82fQCyGkwaEAMk9hhXGSR
 EyEUIvOGx22HPmQVAeUIE9S2DASnqBNXH2VqiZfDQSdH0Tslpb7VuYiEVRJbu+mVQbyw
 YtVnvzdrR8fDZD3DimUAYIKvcY9PnX9U9SShMzZe+pyDtPDUWQ/BCxEIHqrp5hCWj37c
 0Jo4NFuhrfWZEYZ5Py/bKVxDn1IdA04OTQSIMaoPG5NYhO5eP+DOUQToN3Txcj7d1NVF
 T0w8/eHc7r3a6MoNMB4aBlypm2Mz0WItb7DNKPtZ9VDpVgwIruS/4QD04af4OMhlSGft
 RDGQ==
X-Gm-Message-State: AOAM5337fng89SRyvHGfmWEf7pxCO0M4m6vghaxxcXzptOdWcbnIF/Ud
 qRpm4vlHFXI4CQhOYnE5VD6VQg==
X-Received: by 2002:a17:90a:2844:: with SMTP id
 p4mr3411012pjf.89.1619803126602; 
 Fri, 30 Apr 2021 10:18:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id s13sm2711394pfd.79.2021.04.30.10.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:18:46 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make WFI a NOP for userspace emulators
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210430162212.825-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9ee41c0-deb1-28ac-3551-e9e03acfb476@linaro.org>
Date: Fri, 30 Apr 2021 10:18:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430162212.825-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rvqfu59TPGo2

On 4/30/21 9:22 AM, Peter Maydell wrote:
> The WFI insn is not system-mode only, though it doesn't usually make
> a huge amount of sense for userspace code to execute it.  Currently
> if you try it in qemu-arm then the helper function will raise an
> EXCP_HLT exception, which is not covered by the switch in cpu_loop()
> and results in an abort:
> 
> qemu: unhandled CPU exception 0x10001 - aborting
> R00=00000001 R01=408003e4 R02=408003ec R03=000102ec
> R04=00010a28 R05=00010158 R06=00087460 R07=00010158
> R08=00000000 R09=00000000 R10=00085b7c R11=408002a4
> R12=408002b8 R13=408002a0 R14=0001057c R15=000102f8
> PSR=60000010 -ZC- A usr32
> qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7fcbfa4f0a12
> 
> Make the WFI helper function return immediately in the usermode
> emulator. This turns WFI into a NOP, which is OK because:
>   * architecturally "WFI is a NOP" is a permitted implementation
>   * aarch64 Linux kernels use the SCTLR_EL1.nTWI bit to trap
>     userspace WFI and NOP it (though aarch32 kernels currently
>     just let WFI do whatever it would do)
> 
> We could in theory make the translate.c code special case user-mode
> emulation and NOP the insn entirely rather than making the helper
> do nothing, but because no real world code will be trying to
> execute WFI we don't care about efficiency and the helper provides
> a single place where we can make the change rather than having
> to touch multiple places in translate.c and translate-a64.c.
> 
> Fixes:https://bugs.launchpad.net/qemu/+bug/1926759
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/op_helper.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

You could also ifdef this out in translate, in tb_stop for  DISAS_WFI. But 
either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
