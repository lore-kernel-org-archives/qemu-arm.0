Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp435514ejv;
        Thu, 21 Mar 2024 04:42:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAj5GsnTsrONltKFW5aPgjCws/NJaRVYbRJFeIMiUzmIgaRM6n4k10sel694Grytqas4GfoSpWGBEi4ZxV+mAM8BbRIUhF
X-Google-Smtp-Source: AGHT+IGgpSvyqzzgxTtt5+zqHTVBgeQdpYq82CHoyjvNB1Z4pyc+f6hg0anh6DpGhESXNuFd4K0W
X-Received: by 2002:ac8:7fd3:0:b0:430:acf3:5c8 with SMTP id b19-20020ac87fd3000000b00430acf305c8mr24896835qtk.48.1711021356243;
        Thu, 21 Mar 2024 04:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711021356; cv=none;
        d=google.com; s=arc-20160816;
        b=auxGTdk5duyD4R46V1OJGpsnsKVTnsTWldY31Tk4bt4jhS1XlYFT5aXTzEsm1yhbIj
         ZCijcaGoJzOV8dPdrzmObyaVYdPFkSyGjnrtlV3KgN5JdzNeunPFXhs4FS+nlhGu53A9
         EjipAujHATVtUAQMiPmHEuij5YeOYv+2MLPmyzM5ilR2oPT7z6JgCMha9L1AQx35vjJu
         06mGA99zZuFCHv5PZalBHy+H6qJAS7xR1Jcskoot8gKjRKu+gfNTCGcuC8vvhG0zG1kw
         t8Zg05SLsqGFzjWXTFOIPzQ0ikh4fuO4wiQrn+D1z8FR1k7gbCyHQx/roxUoj+YzFTB/
         dRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5V2/xo6EUH/gTfa/P+YyHccBepo+EMc0rFYNGI3xJa8=;
        fh=XyuxscvXyv2wUzKjG8si1B8yk3zEUK12XyNeOv8yM84=;
        b=NC8V2HO1uy8whxsZlYbeB856lf67bGGYiKAgwqYI27s+RSNMw2dWMCzMVa6FSs4Tgo
         heh5LMzi2PobhmSr5Wl0wnEXPXiDhf5vwttcuJdgskCHninhr7S3ZNdjOunBfPifUPi7
         dnj4X4JPcpkuaUpYV04Raeu1xq3osP6CnWPKI34QMP1iPdDidnGad90qgHfFWNIPfpC1
         1qm8DbCnRz0Bmq92lmJE65upOomt5WPzEIyQRh59r+NK98LNqDQc6yAkYJ0YWQpSTIz8
         PCT62N49XA3bpKyoQLfO9YUzn5WOwNT6vcjXSix3rE74b90lTeSRCxyX+PifI98GW6sU
         v6JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6HTW3Eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85f8f000000b00430d9555860si7580679qta.586.2024.03.21.04.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 04:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z6HTW3Eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnGoJ-0003g0-Cz; Thu, 21 Mar 2024 07:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnGoH-0003fO-LS
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 07:42:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnGoE-00010U-Pg
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 07:42:13 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bb22ff7baso938022a12.3
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711021327; x=1711626127; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5V2/xo6EUH/gTfa/P+YyHccBepo+EMc0rFYNGI3xJa8=;
 b=Z6HTW3Eq+CGMHcap28pF3VD1h9PWXcixpOxzlS+ws4oGjhYm7cluqiNXaFFFBUW1D7
 aTzaV2Rp4gM6DGA5ePe9VpYHtN46nsGfDJH8ohB8MxFL2wXFUJ+QJGfIuRELh4S8Ztnd
 G2EUxbpE/CNRxK2b89IJvGnzADSVLZLWAiczZ6ATQ5itxkGIIf/J0qVc4nouhzdPC6Yl
 CoibdHeFZKO04q0OGwrgFbb4DqbnegbjdfP5dnh4C5b7NnBMoeMHXNnWGqcY8iUFjxjI
 ATrt4+VeN9lUkZhZQ47WKiot5IP/VB5nR567xrVd+PyqAtFw3I/mcI0pkUNgI3RViSus
 e+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711021327; x=1711626127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5V2/xo6EUH/gTfa/P+YyHccBepo+EMc0rFYNGI3xJa8=;
 b=FlcK9nwT9NAU5PM+Ft+Xzewsx7D3E6m3yXFwsTPWOofIQkHXABtqlALAfXHA/2j+JW
 FN2zq+qo9yJcb8ei2Xiqfrt99wiB02IF127js5XoExmM0SRlEaULoRvkIZA6Vwm7HFdb
 K4GKldHpArHjZ3YbcOqP5Em5dHJNVF1M9K5t4OwnXY5oU5FGN8GJh2aWRlyg33i9ZB1c
 ET//F80qSr/VlERa86WjBkNd8t7nL6n3Juz7RWumBGsF3/elIrvZOFl8spaUUtqUc6al
 lbNJB29zghH4TxZ338cMxUHcdulxHW3GujMLzyuz4OolaLIBR3TxSZk/jRrSb8uYWPe+
 cQig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIGeBYbo2aXIMaav8co3SkzNeUuXpltpHU7BD3Rv/tGjcwMkRROTYRTonMMHdKnKwCbirA8cmK5Pq9xuENhLbwLbo2
X-Gm-Message-State: AOJu0YzPWD4IJN9cjBEK7/UM9mV0LANBR1zMEqpbStAX7WN9/F8/ztB8
 ANJZPxAd+H5t/fafGymvOu1RGc18TnZ0PFsRYEk311OP73OSQxe8wmFe0BwTEnFwVq3larGnQrX
 OYoSBzJiA21lVwnvGCZ1TWwBhZxnAjd0v2snWZA==
X-Received: by 2002:a05:6402:3986:b0:568:223e:f2b0 with SMTP id
 fk6-20020a056402398600b00568223ef2b0mr16976307edb.21.1711021326887; Thu, 21
 Mar 2024 04:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-7-ruanjinjie@huawei.com>
In-Reply-To: <20240318093546.2786144-7-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 11:41:55 +0000
Message-ID: <CAFEAcA9m6tfAkZueuu4nOxG9dDQRYB3sHP-N-8B2Jx5CUZQeyA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: EDTQp6tjRSoA

On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This only implements the external delivery method via the GICv3.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -692,13 +719,13 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>              /* VFIQs are only taken when hypervized.  */
>              return false;
>          }
> -        return !(env->daif & PSTATE_F);
> +        return !(env->daif & PSTATE_F) && (!allIntMask);
>      case EXCP_VIRQ:
>          if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
>              /* VIRQs are only taken when hypervized.  */
>              return false;
>          }
> -        return !(env->daif & PSTATE_I);
> +        return !(env->daif & PSTATE_I) && (!allIntMask);
>      case EXCP_VSERR:
>          if (!(hcr_el2 & HCR_AMO) || (hcr_el2 & HCR_TGE)) {
>              /* VIRQs are only taken when hypervized.  */
> @@ -804,6 +831,24 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>
>      /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
>
> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +        if (interrupt_request & CPU_INTERRUPT_NMI) {
> +            excp_idx = EXCP_NMI;
> +            target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +        if (interrupt_request & CPU_INTERRUPT_VNMI) {
> +            excp_idx = EXCP_VNMI;
> +            target_el = 1;
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +    }
>      if (interrupt_request & CPU_INTERRUPT_FIQ) {
>          excp_idx = EXCP_FIQ;
>          target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);

This part adds handling for taking IRQNMI and VIRQNMI, but not
VFIQNMI. So because at the moment we merge VFIQNMI and VFIQ
they both come out as interrupt_request having CPU_INTERRUPT_VFIQ
set. But we don't handle that in this function or in
arm_excp_unmasked(), so we treat it exactly the same as VFIQ, which
means that if PSTATE.F is 1 then we will incorrectly fail to take
the VFIQNMI.

I think the code is going to be a lot more straightforward
if we keep all of these things separate. Compare how we handle
VSError, which is also (for QEMU) something where only the
virtual version exists and which is only triggered via the
HCR bits.

thanks
-- PMM
