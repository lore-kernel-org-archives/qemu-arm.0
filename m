Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2216251lfm;
        Fri, 17 Jul 2020 01:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxCk26sLPtPluKnEhRKqE27J5dj0gqq4FEn0dj9E48rjbwES8iMx7OJJhKUsmN2CGl/fEw
X-Received: by 2002:a25:c60c:: with SMTP id k12mr12163711ybf.407.1594973138082;
        Fri, 17 Jul 2020 01:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594973138; cv=none;
        d=google.com; s=arc-20160816;
        b=Cdl7Y46IAnpAeCeG0LTEnR7zZCWc2qvalcnk4sK20DQydXJeAkIGxn1ZNKMj+RZ6WJ
         aK2jW43sknSOfQp2KsnthyjlZdfnkhY20O+0RUlvVDL0CsRrxWyj4tc5UCIytG/yibaa
         qy5v47QvCUGKkj9S6qZSdhNc+lpcZPGx+NWktdXHJXnpJ/IxY1vg25Z3ReWJvCfbBbMg
         Hp8lEtWUqKnIWt0jFo+0accc+MjTVPayi7Gv77RAIx5V7kQldWRqhqiW5L+rxpDYVGRE
         wOAI5+LjF1255YtGa3PiF7IYvY7sjrplCWNmzD2onE/WOXgLWGweuXBo0VxQzUzDzeQ5
         aYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CRx8UAMFJpCu+/l7XQzF05CxtVqE14/wHpiubEoKPPI=;
        b=QUZrEabeGosuKRMzxSt9gb1XAON1BVcS+K+L0m6asVSUeKyc98ggBpaOOExAa7z2uC
         uuWIkI3ZE58C99U9XpkAP4GDgIGiRmU5dJ0m/zdbCUQcpiEsA48fCO57OTv1Ggjolcwh
         QHCcefFmQeUCkLBJrnLTGPuotOcRLyxhkZ44nRi9KbxTI3iUd+6NC+h1c4VEtiPmyvYF
         1mDY6fwUQGL6P1ccbn1EyG/EyzzcMtIi9yyHai2+XLnaZnOggVYsR3Bdv1x9KdU53bvv
         n1et9x6oDbHFkeB5qcYPWrI7wxLtIokopqFrPnosPymfYXeSk0Yzu1nERa/kNHDMUPiU
         tlOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dohL1hHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x38si8574158ybh.147.2020.07.17.01.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 01:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dohL1hHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwLNB-0006WS-Fl
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 04:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwLN5-0006WG-9N; Fri, 17 Jul 2020 04:05:31 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwLN2-0005c0-W5; Fri, 17 Jul 2020 04:05:31 -0400
Received: by mail-ed1-x544.google.com with SMTP id z17so6975494edr.9;
 Fri, 17 Jul 2020 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CRx8UAMFJpCu+/l7XQzF05CxtVqE14/wHpiubEoKPPI=;
 b=dohL1hHgOzkvRk3N+2iz6+wp86uqY0yheXJbgV6nhXxrVFILRDJIJheWTQUH710Noe
 sWIJZL7Rnt7zlns4SgOvHVSJomQFFD6HFyLEuvd9NuBYKApyHf2dpNIu/aZXJqL1hP35
 u26K1Ap43A4XqG/fBr/fCOCXUKG6iAhnglsq6lW5AjmMLnL0GLdHUEyPOyWGyk6dm/3A
 fLBSoVV9BQYlfQD+ZA5BBkFsBiHLHD6qFEqB0VSR1ssyI3oSnPsXcpXYowWouijV2lOg
 vh9NkR3KoB4Yc5nWQkLKCO2WPmkw1SuhJeKucxdmXqky/QO5yXYi3bHaJpTrqmGeiD5l
 /GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRx8UAMFJpCu+/l7XQzF05CxtVqE14/wHpiubEoKPPI=;
 b=ZQiNwNYF5fWxjyvWdJ4KkEHe7G5WGBBcmrnh18LBIOZX29e7lDRkXHIpVFoZbutAWE
 eO+28m64FonFOx79C+TvR6C+9lxulSRL4avKOr+o4vdJRD3DEKg9V/7ELDVOuWoGSdW5
 WPkRsVCXScxtvmxQaKYIyIDZOG6kNo8v4aul/8R/pZvO4/yddpoCXRLhI3GnfQN4nPUa
 WfAZ0tYJPiVRQoHHQ4xFXMenQO70Hk7jUg5b9VChUuU7vzrndHT7rNsW2HRPrxOklRn2
 IB8knVgM9GfihpQdZWwN85JBqHyrtKLAwwzyxVkyyRwtJPUeLvfOItXZ/upXdSzYCD1J
 pIcg==
X-Gm-Message-State: AOAM530aKI6Vtxr9vg+nlpg3GP7oh2nOOZwljMmoGQDXE2dOIuG5Mm8j
 4jZMq1E55EdhdMHkpaLHBTo=
X-Received: by 2002:a50:ab53:: with SMTP id t19mr8254412edc.179.1594973127008; 
 Fri, 17 Jul 2020 01:05:27 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id l15sm7157293ejd.100.2020.07.17.01.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 01:05:26 -0700 (PDT)
Subject: Re: [PATCH v6 03/13] hw/timer: Add NPCM7xx Timer device model
To: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <20200717060258.1602319-4-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b9c0875-514c-8b3d-c27d-bf607665d62d@amsat.org>
Date: Fri, 17 Jul 2020 10:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200717060258.1602319-4-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kfting@nuvoton.com, Avi.Fishman@nuvoton.com, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3D3y+zjxUaic

On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> The NPCM730 and NPCM750 SoCs have three timer modules each holding five
> timers and some shared registers (e.g. interrupt status).
> 
> Each timer runs at 25 MHz divided by a prescaler, and counts down from a
> configurable initial value to zero. When zero is reached, the interrupt
> flag for the timer is set, and the timer is disabled (one-shot mode) or
> reloaded from its initial value (periodic mode).
> 
> This implementation is sufficient to boot a Linux kernel configured for
> NPCM750. Note that the kernel does not seem to actually turn on the
> interrupts.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  include/hw/timer/npcm7xx_timer.h |  96 ++++++
>  hw/timer/npcm7xx_timer.c         | 489 +++++++++++++++++++++++++++++++
>  hw/timer/Makefile.objs           |   1 +
>  hw/timer/trace-events            |   5 +
>  4 files changed, 591 insertions(+)
>  create mode 100644 include/hw/timer/npcm7xx_timer.h
>  create mode 100644 hw/timer/npcm7xx_timer.c
...

> +static hwaddr npcm7xx_tcsr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_TIMER_TCSR0:
> +        return 0;
> +    case NPCM7XX_TIMER_TCSR1:
> +        return 1;
> +    case NPCM7XX_TIMER_TCSR2:
> +        return 2;
> +    case NPCM7XX_TIMER_TCSR3:
> +        return 3;
> +    case NPCM7XX_TIMER_TCSR4:
> +        return 4;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static hwaddr npcm7xx_ticr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_TIMER_TICR0:
> +        return 0;
> +    case NPCM7XX_TIMER_TICR1:
> +        return 1;
> +    case NPCM7XX_TIMER_TICR2:
> +        return 2;
> +    case NPCM7XX_TIMER_TICR3:
> +        return 3;
> +    case NPCM7XX_TIMER_TICR4:
> +        return 4;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static hwaddr npcm7xx_tdr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_TIMER_TDR0:
> +        return 0;
> +    case NPCM7XX_TIMER_TDR1:
> +        return 1;
> +    case NPCM7XX_TIMER_TDR2:
> +        return 2;
> +    case NPCM7XX_TIMER_TDR3:
> +        return 3;
> +    case NPCM7XX_TIMER_TDR4:
> +        return 4;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static uint64_t npcm7xx_timer_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    NPCM7xxTimerCtrlState *s = opaque;
> +    uint64_t value = 0;
> +    hwaddr reg;
> +
> +    reg = offset / sizeof(uint32_t);
> +    switch (reg) {
> +    case NPCM7XX_TIMER_TCSR0:
> +    case NPCM7XX_TIMER_TCSR1:
> +    case NPCM7XX_TIMER_TCSR2:
> +    case NPCM7XX_TIMER_TCSR3:
> +    case NPCM7XX_TIMER_TCSR4:
> +        value = s->timer[npcm7xx_tcsr_index(reg)].tcsr;
> +        break;
> +
> +    case NPCM7XX_TIMER_TICR0:
> +    case NPCM7XX_TIMER_TICR1:
> +    case NPCM7XX_TIMER_TICR2:
> +    case NPCM7XX_TIMER_TICR3:
> +    case NPCM7XX_TIMER_TICR4:
> +        value = s->timer[npcm7xx_ticr_index(reg)].ticr;
> +        break;
> +
> +    case NPCM7XX_TIMER_TDR0:
> +    case NPCM7XX_TIMER_TDR1:
> +    case NPCM7XX_TIMER_TDR2:
> +    case NPCM7XX_TIMER_TDR3:
> +    case NPCM7XX_TIMER_TDR4:
> +        value = npcm7xx_timer_read_tdr(&s->timer[npcm7xx_tdr_index(reg)]);
> +        break;

Thanks for adding the register index getters, I'm not sure this is a
matter of taste, but I find it easier to review.

> +
> +    case NPCM7XX_TIMER_TISR:
> +        value = s->tisr;
> +        break;
> +
> +    case NPCM7XX_TIMER_WTCR:
> +        value = s->wtcr;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +    trace_npcm7xx_timer_read(DEVICE(s)->canonical_path, offset, value);
> +
> +    return value;
> +}
...
