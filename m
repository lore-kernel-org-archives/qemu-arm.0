Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2234788ejc;
        Mon, 9 Jan 2023 05:03:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjrfzIQqFyN8Ea4I3aFYGYQUTOpKaBTWHeAnSEnNfJV8zFRtT0n/M8OTdcgRRFhQY1CUSN
X-Received: by 2002:a05:6870:4c8d:b0:150:329c:84e2 with SMTP id pi13-20020a0568704c8d00b00150329c84e2mr18929498oab.35.1673269387070;
        Mon, 09 Jan 2023 05:03:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673269387; cv=none;
        d=google.com; s=arc-20160816;
        b=RHbCnAwXJkA2KkkVOzLH37NQjqji82A5Jx1m0coGNG3OcvoNn+36Lg3PTD+zPVuSGY
         kZ4FLs8pbKXr/PxfY66yEcyCOhxjqhoGkz/7N/2PB22BY559d+ktYpOuELNPOmTnnQoR
         RMDQEm9RgKxNftA1u840aFZYCDRDqD8cT0NkfymrqZSY1tBYQ7nzccqrfnZCU/I792RB
         FDFwFuusRG5cwtqo4K12aRyeThhP/txwZiKxg+pHmKeGPs9HBjKyriRm/wnK4pbJbItg
         cCU/FB7elmyzmTSEp5aDBhGRuWoSEDuEqsbiQN4l//bghsq0jpsoPrjRtuDIhISpiSFS
         p9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oOa558W65nN+mwNWf4ehs5ixKO9EILkwd73Dl1/KY5o=;
        b=j30z6EHfYC2MpR9f9EIJNudgn1BhKBdl2ebKbgugWIPUzhvcIycbpzAgdB8ONuBL2q
         FXC9UB8+X50MNsh2ITkttbzDK3z0Cjc4uq7bWMOQwptdsXU8VZo5d0w+KDZ325jI9sRc
         FpJwQ305ifvPEk5qg8OskquW+mPJHd8aCpTRvdTDt1ocEtq0HwK0umTJ9owPMj+K0CZ1
         7jo80W2pZ3pOYH9XVAF5v+1Fda38aoQfKEUtqdb4CODtAzTyWfO7f3xLUHZUqs5aa/m0
         cnXqAPUGufF64upwA4zJAWwn0iD3gqtyQaPrThAY1Z0NPiUo4+dZl6WQsDI1t9jnawPp
         Gv1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PuQuI74c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020a05620a140c00b006fa0187fd4asi4093982qkj.326.2023.01.09.05.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 05:03:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PuQuI74c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEr1t-0002FQ-6H; Mon, 09 Jan 2023 07:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr1r-00029T-5k
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:13:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr1o-0007sF-0a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:13:26 -0500
Received: by mail-wr1-x431.google.com with SMTP id bk16so7923932wrb.11
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOa558W65nN+mwNWf4ehs5ixKO9EILkwd73Dl1/KY5o=;
 b=PuQuI74czYjUtr2rm0hjfOH1AslxKCn6g1PF6QqtoswM1Sk6U2qcMQ5B/4pTULuZeg
 oDWjOvVp/oUVD4wST9ssqo09Q/KRtsYWCtLIeQ5y4RD5jsok+vnMHmQXBp7GjaFa9aDc
 6JJXy6V9M/8H01dXogYeEaj+tXrBqmEM3pH5BInqskRGLPU2331GjkKAr7tDUZpsGOma
 NDfXpHPa+4g4Nv2fhsklrcV7hPfSlZe5Kw9x4kxAL3Rf/Q05pnQCxGdEqUqws6RZeuWq
 QTHaj/CobfOXIMCiV5absvugbdGvXmc7dLpv0xZBD/K04LoYSP5roTZjaZdfWu7VrP6f
 7gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOa558W65nN+mwNWf4ehs5ixKO9EILkwd73Dl1/KY5o=;
 b=3aqzsoSi57A6MuEgGYcpoTZnsHEU+Iw5C6M+MRPF8jGYvi8KidfnDY0uy+K7jwzdAJ
 wN6VT7C4EgprCkqNp+7fblIC+5mcyzycmjWH5SMNbeJswu3cliOcf9aQ522oDlOZ2nwx
 +JuEnYh1w4A+JcZ1O2JdKMWRL00SIKpUUbLBKJw9MlolN2fYGOXMlMALwcUX9hExakYO
 jlr6Y2aU2Ye/ecxRD8v0Piy9v3Xg86zAG9WqOPzURh9CJFObcwU+2T7syJnc9wLk8F4L
 p7Q+Gl2jJoo2bNVtO9AH5o1FTbZHlzP+4LXYesW8LIgxg5UlliqGfwCX2baPJwyCkrDA
 W0zQ==
X-Gm-Message-State: AFqh2koydp5Z+IxVRZ49IHYqHuo+VpoUJj1apbRNgVEY+g8yszWmfTnz
 j05aftHmloUzxigTaTcO+eYcShH5mmsQOR2t
X-Received: by 2002:a05:6000:1f1b:b0:2b8:27df:d43f with SMTP id
 bv27-20020a0560001f1b00b002b827dfd43fmr12843832wrb.24.1673266402512; 
 Mon, 09 Jan 2023 04:13:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k18-20020adfb352000000b00241fab5a296sm8637861wrd.40.2023.01.09.04.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:13:21 -0800 (PST)
Message-ID: <0e0f31fd-4d10-7bfe-af6d-3bee3cee1073@linaro.org>
Date: Mon, 9 Jan 2023 13:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/21] hw: Remove implicit sysbus_mmio_map() from
 pflash APIs
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PxCATisXExFM

On 9/1/23 13:08, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Do not introduce pflash_cfi_create(), directly
>    open-code pflash_cfi_register() before removing it (Peter)
> - Added R-b tags

Sigh, my sendemail.cccmd command didn't work, so Cc'ing manually the cover.

> Paving the road toward heterogeneous QEMU, the limitations of
> having a single machine sysbus become more apparent.
> 
> The sysbus_mmio_map() API forces the caller to map a sysbus
> device to an address on the system bus (system bus here is
> the root MemoryRegion returned by get_system_memory() ).
> 
> This is not practical when each core has its own address
> space and group of cores have access to a part of the
> peripherals.
> 
> Experimenting with the PFLASH devices. Here the fix is
> quite easy: open-code the pflash_cfi_register() functions.
> 
> Since we were touching the PFLASH API, we restricted the
> PFlashCFI0X structures to their models. The API now deals
> with a generic qdev pointer (DeviceState*).
> 
> Please review,
> 
> Phil.
> 
> Based-on: <20230109115316.2235-1-philmd@linaro.org>
>            "hw/arm: Cleanups before pflash refactor"
> Based-on: <20230109120154.2868-1-philmd@linaro.org>
>            "hw/misc: Cleanups around PFLASH use"
> 
> Philippe Mathieu-Daudé (21):
>    hw/block: Rename TYPE_PFLASH_CFI02 'width' property as 'device-width'
>    hw/block: Pass DeviceState to pflash_cfi01_get_blk()
>    hw/block: Use pflash_cfi01_get_blk() in pflash_cfi01_legacy_drive()
>    hw/block: Pass DeviceState to pflash_cfi01_get_memory()
>    hw/arm: Use generic DeviceState instead of PFlashCFI01
>    hw/loongarch: Use generic DeviceState instead of PFlashCFI01
>    hw/riscv: Use generic DeviceState instead of PFlashCFI01
>    hw/i386: Use generic DeviceState instead of PFlashCFI01
>    hw/xtensa: Use generic DeviceState instead of PFlashCFI01
>    hw/sh4: Open-code pflash_cfi02_register()
>    hw/arm/digic: Open-code pflash_cfi02_register()
>    hw/arm/musicpal: Open-code pflash_cfi02_register()
>    hw/arm/xilinx_zynq: Open-code pflash_cfi02_register()
>    hw/block: Remove unused pflash_cfi02_register()
>    hw/block: Make PFlashCFI02 QOM declaration internal
>    hw/arm: Open-code pflash_cfi01_register()
>    hw/microblaze: Open-code pflash_cfi01_register()
>    hw/mips: Open-code pflash_cfi01_register()
>    hw/ppc: Open-code pflash_cfi01_register()
>    hw/block: Remove unused pflash_cfi01_register()
>    hw/block: Make PFlashCFI01 QOM declaration internal

