Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD339C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 08:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weTo8-0008Up-VS; Tue, 30 Jun 2026 04:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weTo7-0008UX-S6
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 04:27:03 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weTo6-0005bL-8T
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 04:27:03 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6649ffb1d01so3235971d50.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 01:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782808021; cv=none;
 d=google.com; s=arc-20260327;
 b=S+U7SzWzS5DaqHUaKmaRYIk4Iw8Ov85zxAY8YzHTZPp9S1yo3aAO1iKZEFkQw+FiLl
 2Veju/g2gL0Rl8hJ6dOYDWO2kB1wHi0QCjrgClUopD93Rl81o/FT5d1mMC/kYm2MUbgQ
 6kcQFt4fZXN7+LuFsqN8D8NAn9hOtGZdmI5QAbdbpZVR2hXDkT22nP/K1dQ1W3w/YORR
 Klyt9SRKtRUoQ0KyybvwXIZAQ6iZ6wxVCmGoteA8Cvw6eoum3FHLKIVecHHep360JBKk
 y9/9kJNXnK3DoHkHS4MXIj23ppsdMoUiX7IOxP0/Bcsa1LApmI2YRa/jAJ6XK3G5zbue
 pufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SlRlj1e3taTMD9vV8kdpKn9bhuRAl17GuqMiySNCEAE=;
 fh=xDf2XavdcDs5bRmxf/XeDITRjjFw81IiD/LRr44Z6Po=;
 b=oxAE0Omf9zbjYG1D/inVfknE+urjQSx2FyVFhnagZOmcrUpcfkD5Tq+6ucPbogpoT4
 elZzADeCY1Rk7YRweiIbYFccJu3v9t9P3pGwcuVNce0+1lo+KkFXwf8oNWUMR65Rft3c
 RmyWJ/GaQ1IdCIrWJrmUJXuTPuNoXkCNhavYpt1j3LlwH0fHnreWlptx9SOKGzA1dqSy
 SeOjksCxyEPk+MkHtKRe+JbFW5/KCHD07MtKxcRz7+HEpEh5V6jwYBDW60dMbbO3TwDX
 yeH+Y+bSc05V0TPid4LnTMHJJdks4Xst6qWsfpDHnAiCIefyWgfPQm8SEd8Aq9PXWtK3
 peMw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782808021; x=1783412821; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SlRlj1e3taTMD9vV8kdpKn9bhuRAl17GuqMiySNCEAE=;
 b=ZRZH/VmaGsVc27+ReV50XNJhz+uY4ADuRlgy8IPbjwzA8bw3VivAT3AmNbQyolzTZR
 5qVPxEZIvhfPU2sp8LmwY4GuYeUPRn66rVEDo8+xx/VF92mykLXRf1uJ9abOaGNfqBPS
 ZV6qVX2v4hpnCB3L+zoCBLKCyp9DmnNm0Pzzz7q23aEX716/onQa70BecGzZGjgseGm3
 EHmIUxJ21O6gsqjh7NmH5tSloR2tHrKLDtQR1hV9iTReBOXilsHR/SEnyxXrrP0KBn1b
 SvgASH6xlWRumMGnSpc0kFK8g0vp2xkkbRS3NdxgKHpD0OazOj8HF4gI7PhFc5ZT3Y6s
 Eazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782808021; x=1783412821;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlRlj1e3taTMD9vV8kdpKn9bhuRAl17GuqMiySNCEAE=;
 b=Qp/ZGOGP/RffeaI4Hbo/QEa2a1iFT53yJLsYnlkbiBqT/gVRvI7VHhAJiow4SBQCfV
 LpIdo6pMLCRfG2Z2qSH8V5jUUDRMHLvzaU7icsCzDcq73je04tpdVI7ml8UUsPMs9X2F
 R3iLh+I57SYa0i6eTJ+Z6wid2IFZOzmCmotkKAsz0iaAtxfSU1RZloFdd0azZpzcz/dX
 nHwIrkSruoSgcbOKxmV6h/OYYUGXibmdrN9UOIpqwQvIvSKCzpYUoMPzacK5nmX7y2YP
 bmJX33Mibiu1AvejhaP8qQ3XCOZec6Bq9rp1S2hv8yG/4ahQhnYAtcaSchA34fwq9O6Z
 tNTA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr09Bcewi1n6pSSyBgsDVFqX1mSbBfyoQBoi02Ibt3Mxl6NQQAjVA5pqG270HKKdTnKbA+MgYlDSA==@nongnu.org
X-Gm-Message-State: AOJu0YwJPHMV2VTch9BFbNDKZIvspSF2N8K1Aapc3avfk/k/yQJIN+U9
 Hs3oEj0XVBH+8HOwmQ9ZYFvGfDnfEllzDvc7xNPqXPk0kc0tPled9xmIX6Tjbr9ioo7GjzM6Z+w
 b1Vv1tFG+3ejCCEwqJMogv9fbk/MxA0peOVu0k1q1mQ==
X-Gm-Gg: AfdE7clrX7ho0lIHp8LdGHMoKDkbr6aUHElhPHdqzZXTXWEhO8h3beOOjwFdAOH13VE
 +C4KYYXTtVjKqHlNq4LFpFXL27F23qIuHxrnowQJ2fmpKJpD9LxUXeBWUY2tBny1AOUQorb+aaJ
 Tn9JeXc9cNUL5qYQ9Tm09qq6PKGpRSVDk6NygmIRYIbykCAfCJFYlDHBIpf/mZKQ9e33DigZ3uG
 IHkMHsbJF8+8U16UHa55fevECjQ9WsIOEsrIkIUKViJAphS76kfWYFj6NrQMQvk7L2WEMKgyxJZ
 42VV621SE/mhV8dxV/WL6wiREvIN/XoOej9dJlqL1vpaHHvZ977GT1VN
X-Received: by 2002:a05:690e:419b:b0:664:94d6:776 with SMTP id
 956f58d0204a3-664f96dba20mr2368743d50.13.1782808020724; Tue, 30 Jun 2026
 01:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260625111201.1645847-1-mark.caveayland@nutanix.com>
 <20260625111201.1645847-2-mark.caveayland@nutanix.com>
In-Reply-To: <20260625111201.1645847-2-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2026 09:26:49 +0100
X-Gm-Features: AVVi8CeixruMaq7V5ToWsn01_Hp0fTARgK37ij8LgZGyyDKf7T9_FF7isevbCK8
Message-ID: <CAFEAcA8or7xgrNvP2G_in3Y7TF_N4s4mxHoU+mPkS5-OsZLMug@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/adc/npcm7xx_adc.c: convert NPCM7XX_ADC object
 props to class props
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, alistair@alistair23.me, 
 berrange@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 12:12, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/adc/npcm7xx_adc.c | 77 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 7 deletions(-)
>
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> index 3584c27c75..833e01a913 100644
> --- a/hw/adc/npcm7xx_adc.c
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -20,6 +20,8 @@
>  #include "hw/core/qdev-properties.h"
>  #include "hw/core/registerfields.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
> @@ -229,7 +231,6 @@ static void npcm7xx_adc_init(Object *obj)
>  {
>      NPCM7xxADCState *s = NPCM7XX_ADC(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -    int i;
>
>      sysbus_init_irq(sbd, &s->irq);
>
> @@ -240,15 +241,63 @@ static void npcm7xx_adc_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
>
> -    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> -        object_property_add_uint32_ptr(obj, "adci[*]",
> -                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
> -    }

In the old style we get to use "adci[*]", which avoids the
boilerplate of creating and managing the string for the
name with the substituted-in integer value:

        g_autofree char *adciprop = g_strdup_printf("adci[%u]", i);

Is there a way of keeping that with the new setup?

> -    object_property_add_uint32_ptr(obj, "vref",
> -            &s->vref, OBJ_PROP_FLAG_WRITE);
>      npcm7xx_adc_calibrate(s);
>  }
>
> +static void npcm7xx_adc_get_input(Object *obj, Visitor *v,
> +                                  const char *name, void *opaque,
> +                                  Error **errp)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +    uint32_t idx, val;
> +    int res;
> +
> +    res = sscanf(name, "adci[%u]", &idx);
> +    if (res == EOF || res != 1) {
> +        error_setg(errp, "unable to parse index from %s", name);
> +        return;
> +    }
> +
> +    val = s->adci[idx];
> +    visit_type_uint32(v, name, &val, errp);
> +}
> +
> +static void npcm7xx_adc_set_input(Object *obj, Visitor *v,
> +                                  const char *name, void *opaque,
> +                                  Error **errp)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +    uint32_t idx, val;
> +    int res;
> +
> +    res = sscanf(name, "adci[%u]", &idx);
> +    if (res == EOF || res != 1) {
> +        error_setg(errp, "unable to parse index from %s", name);
> +        return;
> +    }
> +
> +    val = s->adci[idx];
> +    if (!visit_type_uint32(v, name, &val, errp)) {
> +        return;
> +    }
> +
> +    s->adci[idx] = val;
> +}
> +
> +static void npcm7xx_adc_set_vref(Object *obj, Visitor *v,
> +                                 const char *name, void *opaque,
> +                                 Error **errp)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +    uint32_t vref = s->vref;
> +
> +    if (!visit_type_uint32(v, name, &vref, errp)) {
> +        return;
> +    }
> +
> +    s->vref = vref;
> +}

In the old code, we say "I want a uint32 property", and we get
one. In the new code we have to have a lot of code here that's
manually calling sscanf and doing visitor pattern stuff.
Is there a way to say "give me a uint32 property" and have
the implementation be done in common for the new style ?

>  1 file changed, 70 insertions(+), 7 deletions(-)

This diffstat makes me want to say we haven't got the
APIs for doing this right yet.

thanks
-- PMM

