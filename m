Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp39253ejk;
        Mon, 29 Jan 2024 00:55:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+6okSw0vqdnrStm5+xgwJuiSkldP7d0lFkamd+SrHoFEMErTmx8661LvWqddmNeeMJPNb
X-Received: by 2002:a05:6214:c68:b0:68c:481a:433 with SMTP id t8-20020a0562140c6800b0068c481a0433mr2650622qvj.53.1706518519223;
        Mon, 29 Jan 2024 00:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706518519; cv=none;
        d=google.com; s=arc-20160816;
        b=qmECDWD+9Ez11h6KdZSHwn4dr0Eo1qYL3fP0BsPn+sjVE9fvBe96Hk4/EWvisQGpQT
         CwhUKhZ17Jkfz4OPt1Y4kkLevgLVx1Q9k1MXG9w3NfRkC4Z6p1GjI7Oppk+FG5IkZofK
         Yt2IVg/ft2Y16fGXGPjPR1WF0K+i99q72yMOeuHm4mqu0md2tPjoouJPmeyNvmBSWtnu
         Xnx5HXYNxtsuQyNuuRO8qXb9YBJoWcGnqsNjzIZSmQRiBmxS6RrJze1+jstZblXWFGoE
         NK7Q7BHGufXXr+pduoko9GK5jCDFdFRjBkLVzShTrK71I4kPlJLhdBc1xZPoeXa86FXl
         HY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oorgb+BlWVMYQCskgufSPlA0qHmGXKaL4ZeDFtL69m8=;
        fh=y76T+Hz1y2NeG/jvvvqu9cdQXasamd9eDPfsWsP2QxQ=;
        b=krO2a04z2dOuf8ERqWwhKVXX9tZBbfTOOeuK6yffBWy2DJ7HF4B118yMwuk0QHOw5R
         VRktOK0NhXzXdneqyV8Ejejk6ISWdQ5nKw75nBxadCbqHMQdfamRkfSIuCfUqggPoiEz
         yrsEjHS5GCyTe2XzD6thr9zIIsSawK4rW7+59gNDTaSd9kY+hSkgBu6tfcawQw9L5SkG
         FzngH+FKlM3oJeSb6tjanzZHTWkz6dxnjlHkmoUGaukkQsuQBT/flTSpd72GLoeLaJwM
         P4AG4HFoYC4ozuYCrbQxaTiR7ArVNpeOfIxjB8ktoB82Ov26R47layWzDWZWCj8A6KGI
         4ZFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IHCdLM5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a0562141d2100b00681b43d8d41si4175776qvd.34.2024.01.29.00.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 00:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IHCdLM5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUNPM-0004za-AN; Mon, 29 Jan 2024 03:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rUNPL-0004yx-8Q
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rUNPJ-0007m7-2D
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706518459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oorgb+BlWVMYQCskgufSPlA0qHmGXKaL4ZeDFtL69m8=;
 b=IHCdLM5Ht78xR7utHMqNys2E56qei9QxXh4dpe7sreNpFvKMrF1Wohty5aO5FJbfmeBghr
 qjcILAeJVkqplrJKRhPjMuHfvlAIHn61lbo0B8r6MUHJRtFjSP/AlnmijZgc+VyCenmyR1
 knL40QBNY2ZB+cUtgXB9ODuKpnh67aU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-QYjfDSasPge7zb7BE8aGUw-1; Mon, 29 Jan 2024 03:54:18 -0500
X-MC-Unique: QYjfDSasPge7zb7BE8aGUw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5102bbe883aso1248509e87.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 00:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706518456; x=1707123256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oorgb+BlWVMYQCskgufSPlA0qHmGXKaL4ZeDFtL69m8=;
 b=JHx07/IlkcrvU6aCdfVAi3p28IwENrlJ9si5y5sA+Pyz4lMye5ieTPQYf49843QjK8
 TmOJ6cm9qdRuhiRrw93Q8LM5UdtBUniJGOkrZJHyP41Aj6bGPfD9Io5wLtCoAX/v8/5q
 w8e1DWh9U2s3NOsRDOE7ofWLizhU/78eYxOfPAED9BMPMT7dpLkWeBB8XiLmifGgoqgn
 7GADFJKSfgmOJSZevYrEok9PXlw4PPhsbOPSjl7eUmGY60cg/sqFfmwnu2dGWtcblfGj
 QbRr4XHamfR7QPx4zzxHD7PH1/pSZaYE6FutbK1AdaXObYgUhTNayt2z1ayTXD6lRSsQ
 BLvg==
X-Gm-Message-State: AOJu0Yx6CEwkfRqoguOmYx36ajWGrDoDC6KBCAtnNB8zLX02tdHqH92C
 3Y7CXByQoHc10aV0bLBEhGXtV+lYVZRejUVfO0OmLiJwwrcSDSP5K4+AkTCDoseXH1MmMnzLnNC
 BR1L/f41Z9YU+whjGT23N5uiZmFJbKjiLAgCgE5np+fFnOBqDeg==
X-Received: by 2002:a19:7506:0:b0:510:6e7:6999 with SMTP id
 y6-20020a197506000000b0051006e76999mr3215710lfe.45.1706518456604; 
 Mon, 29 Jan 2024 00:54:16 -0800 (PST)
X-Received: by 2002:a19:7506:0:b0:510:6e7:6999 with SMTP id
 y6-20020a197506000000b0051006e76999mr3215693lfe.45.1706518456207; 
 Mon, 29 Jan 2024 00:54:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm465242eds.30.2024.01.29.00.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 00:54:11 -0800 (PST)
Message-ID: <3e984769-f178-46b3-aaa8-1718b6fd49bf@redhat.com>
Date: Mon, 29 Jan 2024 09:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/arm: Move v7m-related code from cpu32.c
 into a separate file
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-2-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20240129081835.137726-2-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.485,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: xdmhjn0BE5Ot

On 1/29/24 09:18, Thomas Huth wrote:
> Move the code to a separate file so that we do not have to compile
> it anymore if CONFIG_ARM_V7M is not set.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/arm/tcg/cpu-v7m.c   | 290 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/cpu32.c     | 261 ---------------------------------
>   target/arm/meson.build     |   3 +
>   target/arm/tcg/meson.build |   3 +
>   4 files changed, 296 insertions(+), 261 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-v7m.c
> 
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> new file mode 100644
> index 0000000000..89a25444a2
> --- /dev/null
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -0,0 +1,290 @@
> +/*
> + * QEMU ARMv7-M TCG-only CPUs.
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "internals.h"
> +
> +#if !defined(CONFIG_USER_ONLY)
> +
> +#include "hw/intc/armv7m_nvic.h"
> +
> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cs);
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    bool ret = false;
> +
> +    /*
> +     * ARMv7-M interrupt masking works differently than -A or -R.
> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
> +     * masking FIQ and IRQ interrupts, an exception is taken only
> +     * if it is higher priority than the current execution priority
> +     * (which depends on state like BASEPRI, FAULTMASK and the
> +     * currently active exception).
> +     */
> +    if (interrupt_request & CPU_INTERRUPT_HARD
> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
> +        cs->exception_index = EXCP_IRQ;
> +        cc->tcg_ops->do_interrupt(cs);
> +        ret = true;
> +    }
> +    return ret;
> +}
> +
> +#endif /* !CONFIG_USER_ONLY */
> +
> +static void cortex_m0_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_V6);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +
> +    cpu->midr = 0x410cc200;
> +
> +    /*
> +     * These ID register values are not guest visible, because
> +     * we do not implement the Main Extension. They must be set
> +     * to values corresponding to the Cortex-M0's implemented
> +     * features, because QEMU generally controls its emulation
> +     * by looking at ID register fields. We use the same values as
> +     * for the M3.
> +     */
> +    cpu->isar.id_pfr0 = 0x00000030;
> +    cpu->isar.id_pfr1 = 0x00000200;
> +    cpu->isar.id_dfr0 = 0x00100000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00000030;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x00000000;
> +    cpu->isar.id_mmfr3 = 0x00000000;
> +    cpu->isar.id_isar0 = 0x01141110;
> +    cpu->isar.id_isar1 = 0x02111000;
> +    cpu->isar.id_isar2 = 0x21112231;
> +    cpu->isar.id_isar3 = 0x01111110;
> +    cpu->isar.id_isar4 = 0x01310102;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +}
> +
> +static void cortex_m3_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    cpu->midr = 0x410fc231;
> +    cpu->pmsav7_dregion = 8;
> +    cpu->isar.id_pfr0 = 0x00000030;
> +    cpu->isar.id_pfr1 = 0x00000200;
> +    cpu->isar.id_dfr0 = 0x00100000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00000030;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x00000000;
> +    cpu->isar.id_mmfr3 = 0x00000000;
> +    cpu->isar.id_isar0 = 0x01141110;
> +    cpu->isar.id_isar1 = 0x02111000;
> +    cpu->isar.id_isar2 = 0x21112231;
> +    cpu->isar.id_isar3 = 0x01111110;
> +    cpu->isar.id_isar4 = 0x01310102;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +}
> +
> +static void cortex_m4_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
> +    cpu->midr = 0x410fc240; /* r0p0 */
> +    cpu->pmsav7_dregion = 8;
> +    cpu->isar.mvfr0 = 0x10110021;
> +    cpu->isar.mvfr1 = 0x11000011;
> +    cpu->isar.mvfr2 = 0x00000000;
> +    cpu->isar.id_pfr0 = 0x00000030;
> +    cpu->isar.id_pfr1 = 0x00000200;
> +    cpu->isar.id_dfr0 = 0x00100000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00000030;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x00000000;
> +    cpu->isar.id_mmfr3 = 0x00000000;
> +    cpu->isar.id_isar0 = 0x01141110;
> +    cpu->isar.id_isar1 = 0x02111000;
> +    cpu->isar.id_isar2 = 0x21112231;
> +    cpu->isar.id_isar3 = 0x01111110;
> +    cpu->isar.id_isar4 = 0x01310102;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +}
> +
> +static void cortex_m7_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
> +    cpu->midr = 0x411fc272; /* r1p2 */
> +    cpu->pmsav7_dregion = 8;
> +    cpu->isar.mvfr0 = 0x10110221;
> +    cpu->isar.mvfr1 = 0x12000011;
> +    cpu->isar.mvfr2 = 0x00000040;
> +    cpu->isar.id_pfr0 = 0x00000030;
> +    cpu->isar.id_pfr1 = 0x00000200;
> +    cpu->isar.id_dfr0 = 0x00100000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00100030;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x01000000;
> +    cpu->isar.id_mmfr3 = 0x00000000;
> +    cpu->isar.id_isar0 = 0x01101110;
> +    cpu->isar.id_isar1 = 0x02112000;
> +    cpu->isar.id_isar2 = 0x20232231;
> +    cpu->isar.id_isar3 = 0x01111131;
> +    cpu->isar.id_isar4 = 0x01310132;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +}
> +
> +static void cortex_m33_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
> +    cpu->midr = 0x410fd213; /* r0p3 */
> +    cpu->pmsav7_dregion = 16;
> +    cpu->sau_sregion = 8;
> +    cpu->isar.mvfr0 = 0x10110021;
> +    cpu->isar.mvfr1 = 0x11000011;
> +    cpu->isar.mvfr2 = 0x00000040;
> +    cpu->isar.id_pfr0 = 0x00000030;
> +    cpu->isar.id_pfr1 = 0x00000210;
> +    cpu->isar.id_dfr0 = 0x00200000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00101F40;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x01000000;
> +    cpu->isar.id_mmfr3 = 0x00000000;
> +    cpu->isar.id_isar0 = 0x01101110;
> +    cpu->isar.id_isar1 = 0x02212000;
> +    cpu->isar.id_isar2 = 0x20232232;
> +    cpu->isar.id_isar3 = 0x01111131;
> +    cpu->isar.id_isar4 = 0x01310132;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +    cpu->clidr = 0x00000000;
> +    cpu->ctr = 0x8000c000;
> +}
> +
> +static void cortex_m55_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
> +    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
> +    cpu->midr = 0x410fd221; /* r0p1 */
> +    cpu->revidr = 0;
> +    cpu->pmsav7_dregion = 16;
> +    cpu->sau_sregion = 8;
> +    /* These are the MVFR* values for the FPU + full MVE configuration */
> +    cpu->isar.mvfr0 = 0x10110221;
> +    cpu->isar.mvfr1 = 0x12100211;
> +    cpu->isar.mvfr2 = 0x00000040;
> +    cpu->isar.id_pfr0 = 0x20000030;
> +    cpu->isar.id_pfr1 = 0x00000230;
> +    cpu->isar.id_dfr0 = 0x10200000;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00111040;
> +    cpu->isar.id_mmfr1 = 0x00000000;
> +    cpu->isar.id_mmfr2 = 0x01000000;
> +    cpu->isar.id_mmfr3 = 0x00000011;
> +    cpu->isar.id_isar0 = 0x01103110;
> +    cpu->isar.id_isar1 = 0x02212000;
> +    cpu->isar.id_isar2 = 0x20232232;
> +    cpu->isar.id_isar3 = 0x01111131;
> +    cpu->isar.id_isar4 = 0x01310132;
> +    cpu->isar.id_isar5 = 0x00000000;
> +    cpu->isar.id_isar6 = 0x00000000;
> +    cpu->clidr = 0x00000000; /* caches not implemented */
> +    cpu->ctr = 0x8303c003;
> +}
> +
> +static const struct TCGCPUOps arm_v7m_tcg_ops = {
> +    .initialize = arm_translate_init,
> +    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
> +    .debug_excp_handler = arm_debug_excp_handler,
> +    .restore_state_to_opc = arm_restore_state_to_opc,
> +
> +#ifdef CONFIG_USER_ONLY
> +    .record_sigsegv = arm_cpu_record_sigsegv,
> +    .record_sigbus = arm_cpu_record_sigbus,
> +#else
> +    .tlb_fill = arm_cpu_tlb_fill,
> +    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
> +    .do_interrupt = arm_v7m_cpu_do_interrupt,
> +    .do_transaction_failed = arm_cpu_do_transaction_failed,
> +    .do_unaligned_access = arm_cpu_do_unaligned_access,
> +    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
> +    .debug_check_watchpoint = arm_debug_check_watchpoint,
> +    .debug_check_breakpoint = arm_debug_check_breakpoint,
> +#endif /* !CONFIG_USER_ONLY */
> +};
> +
> +static void arm_v7m_class_init(ObjectClass *oc, void *data)
> +{
> +    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
> +    CPUClass *cc = CPU_CLASS(oc);
> +
> +    acc->info = data;
> +    cc->tcg_ops = &arm_v7m_tcg_ops;
> +    cc->gdb_core_xml_file = "arm-m-profile.xml";
> +}
> +
> +static const ARMCPUInfo arm_v7m_cpus[] = {
> +    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
> +                             .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
> +                             .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
> +                             .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m7",   .initfn = cortex_m7_initfn,
> +                             .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
> +                             .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
> +                             .class_init = arm_v7m_class_init },

I'm not sure these CPU models make sense for linux-user but, since this 
patch makes no functional change, they can be removed later.

Paolo

