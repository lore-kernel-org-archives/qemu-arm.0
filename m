Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6904214ejb;
        Mon, 2 Jan 2023 12:06:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDSMY8YGi2gKbmjwnRsVLdmZFv1E7KAZ4mFIbBJlcAeP11tsVuvvZ8fdgQbJUuk8YtyhVE
X-Received: by 2002:a05:6102:5090:b0:3b1:383a:d463 with SMTP id bl16-20020a056102509000b003b1383ad463mr22786264vsb.1.1672690003872;
        Mon, 02 Jan 2023 12:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672690003; cv=none;
        d=google.com; s=arc-20160816;
        b=vV+3ivs4+pWKc2TBmvAyjX590JbFoPgX2AA2NoNlCluCELVldyYlfbfQrBmcOvsPRu
         VYjXlImERoEuexiPyKVZtWKo97PmRjY1I62li4nUBSl1EwKUy/6Md/WCVvcxqkisr5C9
         +mNXqc0fSLbgBstr9TsGIAEPwkrzpmuALSYeAVDb0eAa8cFLJQ5mqGnWP2BAN8PBI4fG
         gaGkMNlFuX+TaMTYp7UHL5WvYj1CUOZClxnmL8I53r1TwT6Nj7a5KvogCfTShcvn93DA
         xeQOv5JD6Ce4cGJdJftU1lpixudOzoXL19VdlK8DggtKeM3+N891nJ4Lzy+xEXuYMwec
         mx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BCPIcWG68XPjFacQ10B7UHokkM7cxPf4Vp+CZIjaXaE=;
        b=J23S7szyP4iLUwdVHODvFNjXjpe77UgDa2/aSEfungxRcM8gQlbsqVwRWbZROM5UFj
         sJ49ifdfMvf79T2sai4VF5PcyP8ZAMqaAxbgKGAJoqm8nOrjzRpsWcngSMhtWUTXUOMd
         r1OAA3rW9+qVVLv1dDx/Tghv32P6yeFDaIakR0JZ6hEsBJ25RKjzLt9YAPqTOFK4Yyob
         2Z0oX5QwWic2kpXl0irGt1KtKTBntff7iDjT8A6qGdw9WRvyKYSIhRQcy99KbWiRT63B
         OQbfyFvHsf+8fCDRZkTCUCgXt27Syh1RJrVEdWTva4m/YnG98N7MLKMjPt6msXJPRQ+n
         6vLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1qmWV2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a05620a2a0400b006f9fee8e4acsi16381085qkp.399.2023.01.02.12.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 12:06:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1qmWV2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCR4c-0001hb-Sg; Mon, 02 Jan 2023 15:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pCR4b-0001hA-T8; Mon, 02 Jan 2023 15:06:17 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pCR4Z-0000xq-MR; Mon, 02 Jan 2023 15:06:17 -0500
Received: by mail-ed1-x533.google.com with SMTP id i9so41161227edj.4;
 Mon, 02 Jan 2023 12:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BCPIcWG68XPjFacQ10B7UHokkM7cxPf4Vp+CZIjaXaE=;
 b=h1qmWV2uWPVPLGQSV1LFr0Cui3/xSb70ksZkOZVymfemLD63idrEmne043PZ9UK1km
 CvnTV17IkVr3TUaWhWEGHvoclWgkOGQ5XwZWH2jlwuGeCjKo4UB1TeuApZlKFoNHJmJG
 Q9v6D2pjaSLA57DL8W2Flb1HBH4hyIvt3SZZgPWg6+N5bKAOTDhT85mEDc6sTFqwMb0a
 MaOQ36SkMEDdB69eknyvccC5s1AvPzW4VQjkL+FDPx6VRkhBPOinoK1k/cT/xtZXWNlm
 LxK+cHJ1OGyURat+YU8rg5o+vjkZA9eLWD8d97Rf6uj3XiNX+J/C0rVb3j1WSxKDF3Jq
 K+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BCPIcWG68XPjFacQ10B7UHokkM7cxPf4Vp+CZIjaXaE=;
 b=mWfUtGSb0FyEojeVHG1ZE3dw3oN2QrSr72tk/bAYaw2/pU7QhdTLYl2RrUh1loJLWt
 FB9BMEgg/ouSsTuSOjTw6Dnc2Q5YS6GtyY0kRnAWp3rPJgavxdb0O9KZnSkep0I2gNtO
 45NMa0ytk0JbJiNYMqMERkFRP6xqEIkq1JTYJJ4srRbyDkZ+asfnmFV9Vn7v45mu1EGg
 gEJfL4B8gbZFhF70tM6aAxvcbmtRAEVJUDxXZRVchsdy1yJFXpG/ajkoFvmhfeUWejVb
 aVXfIRyJM4cgFfKPHnFCxQrw+ce5wvmgS4WU9urqX7WFkmfyOmKD0Q01eS/YLv0t5rqh
 xHrA==
X-Gm-Message-State: AFqh2kqvpeLNUk1ZcFp4KZGxQg94wJHcDnwoVWzCGm97SO6PsJ4qQb4t
 n0CbehwlxnaspBN+IL9A+TVAd1UJXEIF5Pzj9Vs=
X-Received: by 2002:a05:6402:2915:b0:483:39e2:bc82 with SMTP id
 ee21-20020a056402291500b0048339e2bc82mr4006221edb.252.1672689973118; Mon, 02
 Jan 2023 12:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
 <20221226220303.14420-5-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221226220303.14420-5-strahinja.p.jankovic@gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 2 Jan 2023 21:06:01 +0100
Message-ID: <CABtshVSjVn4EqYA50ehFZSCUb5CTcft8HQt5ULZ8bBq9_kvTbg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] hw/misc: AXP209 PMU Emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: wobrJ4dKdULm

Ping

This is the only remaining patch from the series waiting for review. Thanks!

Best regards,
Strahinja

On Mon, Dec 26, 2022 at 11:03 PM Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch adds minimal support for AXP-209 PMU.
> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> the chip ID register, reset values for two more registers used by A10
> U-Boot SPL are covered.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  MAINTAINERS          |   2 +
>  hw/misc/Kconfig      |   4 +
>  hw/misc/axp209.c     | 238 +++++++++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build  |   1 +
>  hw/misc/trace-events |   5 +
>  5 files changed, 250 insertions(+)
>  create mode 100644 hw/misc/axp209.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b270eb8e5b..354da68249 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -576,12 +576,14 @@ ARM Machines
>  Allwinner-a10
>  M: Beniamino Galvani <b.galvani@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> +R: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: hw/*/allwinner*
>  F: include/hw/*/allwinner*
>  F: hw/arm/cubieboard.c
>  F: docs/system/arm/cubieboard.rst
> +F: hw/misc/axp209.c
>
>  Allwinner-h3
>  M: Niek Linnenbank <nieklinnenbank@gmail.com>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 052fb54310..eaeddca277 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
>  config ALLWINNER_A10_DRAMC
>      bool
>
> +config AXP209_PMU
> +    bool
> +    depends on I2C
> +
>  source macio/Kconfig
> diff --git a/hw/misc/axp209.c b/hw/misc/axp209.c
> new file mode 100644
> index 0000000000..2908ed99a6
> --- /dev/null
> +++ b/hw/misc/axp209.c
> @@ -0,0 +1,238 @@
> +/*
> + * AXP-209 PMU Emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +
> +#define TYPE_AXP209_PMU "axp209_pmu"
> +
> +#define AXP209(obj) \
> +    OBJECT_CHECK(AXP209I2CState, (obj), TYPE_AXP209_PMU)
> +
> +/* registers */
> +enum {
> +    REG_POWER_STATUS = 0x0u,
> +    REG_OPERATING_MODE,
> +    REG_OTG_VBUS_STATUS,
> +    REG_CHIP_VERSION,
> +    REG_DATA_CACHE_0,
> +    REG_DATA_CACHE_1,
> +    REG_DATA_CACHE_2,
> +    REG_DATA_CACHE_3,
> +    REG_DATA_CACHE_4,
> +    REG_DATA_CACHE_5,
> +    REG_DATA_CACHE_6,
> +    REG_DATA_CACHE_7,
> +    REG_DATA_CACHE_8,
> +    REG_DATA_CACHE_9,
> +    REG_DATA_CACHE_A,
> +    REG_DATA_CACHE_B,
> +    REG_POWER_OUTPUT_CTRL = 0x12u,
> +    REG_DC_DC2_OUT_V_CTRL = 0x23u,
> +    REG_DC_DC2_DVS_CTRL = 0x25u,
> +    REG_DC_DC3_OUT_V_CTRL = 0x27u,
> +    REG_LDO2_4_OUT_V_CTRL,
> +    REG_LDO3_OUT_V_CTRL,
> +    REG_VBUS_CH_MGMT = 0x30u,
> +    REG_SHUTDOWN_V_CTRL,
> +    REG_SHUTDOWN_CTRL,
> +    REG_CHARGE_CTRL_1,
> +    REG_CHARGE_CTRL_2,
> +    REG_SPARE_CHARGE_CTRL,
> +    REG_PEK_KEY_CTRL,
> +    REG_DC_DC_FREQ_SET,
> +    REG_CHR_TEMP_TH_SET,
> +    REG_CHR_HIGH_TEMP_TH_CTRL,
> +    REG_IPSOUT_WARN_L1,
> +    REG_IPSOUT_WARN_L2,
> +    REG_DISCHR_TEMP_TH_SET,
> +    REG_DISCHR_HIGH_TEMP_TH_CTRL,
> +    REG_IRQ_BANK_1_CTRL = 0x40u,
> +    REG_IRQ_BANK_2_CTRL,
> +    REG_IRQ_BANK_3_CTRL,
> +    REG_IRQ_BANK_4_CTRL,
> +    REG_IRQ_BANK_5_CTRL,
> +    REG_IRQ_BANK_1_STAT = 0x48u,
> +    REG_IRQ_BANK_2_STAT,
> +    REG_IRQ_BANK_3_STAT,
> +    REG_IRQ_BANK_4_STAT,
> +    REG_IRQ_BANK_5_STAT,
> +    REG_ADC_ACIN_V_H = 0x56u,
> +    REG_ADC_ACIN_V_L,
> +    REG_ADC_ACIN_CURR_H,
> +    REG_ADC_ACIN_CURR_L,
> +    REG_ADC_VBUS_V_H,
> +    REG_ADC_VBUS_V_L,
> +    REG_ADC_VBUS_CURR_H,
> +    REG_ADC_VBUS_CURR_L,
> +    REG_ADC_INT_TEMP_H,
> +    REG_ADC_INT_TEMP_L,
> +    REG_ADC_TEMP_SENS_V_H = 0x62u,
> +    REG_ADC_TEMP_SENS_V_L,
> +    REG_ADC_BAT_V_H = 0x78u,
> +    REG_ADC_BAT_V_L,
> +    REG_ADC_BAT_DISCHR_CURR_H,
> +    REG_ADC_BAT_DISCHR_CURR_L,
> +    REG_ADC_BAT_CHR_CURR_H,
> +    REG_ADC_BAT_CHR_CURR_L,
> +    REG_ADC_IPSOUT_V_H,
> +    REG_ADC_IPSOUT_V_L,
> +    REG_DC_DC_MOD_SEL = 0x80u,
> +    REG_ADC_EN_1,
> +    REG_ADC_EN_2,
> +    REG_ADC_SR_CTRL,
> +    REG_ADC_IN_RANGE,
> +    REG_GPIO1_ADC_IRQ_RISING_TH,
> +    REG_GPIO1_ADC_IRQ_FALLING_TH,
> +    REG_TIMER_CTRL = 0x8au,
> +    REG_VBUS_CTRL_MON_SRP,
> +    REG_OVER_TEMP_SHUTDOWN = 0x8fu,
> +    REG_GPIO0_FEAT_SET,
> +    REG_GPIO_OUT_HIGH_SET,
> +    REG_GPIO1_FEAT_SET,
> +    REG_GPIO2_FEAT_SET,
> +    REG_GPIO_SIG_STATE_SET_MON,
> +    REG_GPIO3_SET,
> +    REG_COULOMB_CNTR_CTRL = 0xb8u,
> +    REG_POWER_MEAS_RES,
> +    NR_REGS
> +};
> +
> +#define AXP209_CHIP_VERSION_ID             (0x01)
> +#define AXP209_DC_DC2_OUT_V_CTRL_RESET     (0x16)
> +#define AXP209_IRQ_BANK_1_CTRL_RESET       (0xd8)
> +
> +/* A simple I2C slave which returns values of ID or CNT register. */
> +typedef struct AXP209I2CState {
> +    /*< private >*/
> +    I2CSlave i2c;
> +    /*< public >*/
> +    uint8_t regs[NR_REGS];  /* peripheral registers */
> +    uint8_t ptr;            /* current register index */
> +    uint8_t count;          /* counter used for tx/rx */
> +} AXP209I2CState;
> +
> +/* Reset all counters and load ID register */
> +static void axp209_reset_enter(Object *obj, ResetType type)
> +{
> +    AXP209I2CState *s = AXP209(obj);
> +
> +    memset(s->regs, 0, NR_REGS);
> +    s->ptr = 0;
> +    s->count = 0;
> +    s->regs[REG_CHIP_VERSION] = AXP209_CHIP_VERSION_ID;
> +    s->regs[REG_DC_DC2_OUT_V_CTRL] = AXP209_DC_DC2_OUT_V_CTRL_RESET;
> +    s->regs[REG_IRQ_BANK_1_CTRL] = AXP209_IRQ_BANK_1_CTRL_RESET;
> +}
> +
> +/* Handle events from master. */
> +static int axp209_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    AXP209I2CState *s = AXP209(i2c);
> +
> +    s->count = 0;
> +
> +    return 0;
> +}
> +
> +/* Called when master requests read */
> +static uint8_t axp209_rx(I2CSlave *i2c)
> +{
> +    AXP209I2CState *s = AXP209(i2c);
> +    uint8_t ret = 0xff;
> +
> +    if (s->ptr < NR_REGS) {
> +        ret = s->regs[s->ptr++];
> +    }
> +
> +    trace_axp209_rx(s->ptr - 1, ret);
> +
> +    return ret;
> +}
> +
> +/*
> + * Called when master sends write.
> + * Update ptr with byte 0, then perform write with second byte.
> + */
> +static int axp209_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    AXP209I2CState *s = AXP209(i2c);
> +
> +    if (s->count == 0) {
> +        /* Store register address */
> +        s->ptr = data;
> +        s->count++;
> +        trace_axp209_select(data);
> +    } else {
> +        trace_axp209_tx(s->ptr, data);
> +        if (s->ptr == REG_DC_DC2_OUT_V_CTRL) {
> +            s->regs[s->ptr++] = data;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_axp209 = {
> +    .name = TYPE_AXP209_PMU,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(regs, AXP209I2CState, NR_REGS),
> +        VMSTATE_UINT8(count, AXP209I2CState),
> +        VMSTATE_UINT8(ptr, AXP209I2CState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void axp209_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
> +
> +    rc->phases.enter = axp209_reset_enter;
> +    dc->vmsd = &vmstate_axp209;
> +    isc->event = axp209_event;
> +    isc->recv = axp209_rx;
> +    isc->send = axp209_tx;
> +}
> +
> +static const TypeInfo axp209_info = {
> +    .name = TYPE_AXP209_PMU,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(AXP209I2CState),
> +    .class_init = axp209_class_init
> +};
> +
> +static void axp209_register_devices(void)
> +{
> +    type_register_static(&axp209_info);
> +}
> +
> +type_init(axp209_register_devices);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 9eaa0750b5..448e14b531 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -45,6 +45,7 @@ specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
> +softmmu_ss.add(when: 'CONFIG_AXP209_PMU', if_true: files('axp209.c'))
>  softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
>  softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index c18bc0605e..c47876a902 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -23,6 +23,11 @@ allwinner_sid_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%"
>  avr_power_read(uint8_t value) "power_reduc read value:%u"
>  avr_power_write(uint8_t value) "power_reduc write value:%u"
>
> +# axp209.c
> +axp209_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PRIx8 " : 0x%" PRIx8
> +axp209_select(uint8_t reg) "Accessing reg 0x%" PRIx8
> +axp209_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " : 0x%" PRIx8
> +
>  # eccmemctl.c
>  ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
>  ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
> --
> 2.30.2
>
