Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp357487ejy;
        Thu, 22 Sep 2022 08:13:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/+2C0f9NKoyArQubj/wBzwz27K90NWWulhdlGrCNNHfrrc0OyqcmKGBuFB3apwtz2YjGd
X-Received: by 2002:a05:620a:2629:b0:6ce:7d2b:5828 with SMTP id z41-20020a05620a262900b006ce7d2b5828mr2448043qko.497.1663859633450;
        Thu, 22 Sep 2022 08:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663859633; cv=none;
        d=google.com; s=arc-20160816;
        b=qWAZMJ6YsG5s81oPnpz394lIqQfvA/mRKfX4vJZfVLxkxrPcCaSnqmhOUGivhl7Clt
         6PXCg4NqWuLESERaj3NkZG0ymQvN0scmwFEVBXxEO7QnyMPdM+SJMo4zoFA9oUsZwkg3
         9u99HPsJ5ZC4KpJiVSp5Zn8zWZ5OIC1KlJ4V0Gk4LsI5gLhc8qSAtbTOzHzEB4saHREl
         xj80dGD8w9eAexcf6m+DPoFudvTlzHpo6PbCzK79Y6SI5bUqezQyh0zLgsiSMN33scUI
         KoVsacg9fy3W7IynRzBWk7JU5AnnHUJ9JP1BSij1tr2+4seQTSY/+3140g46WUCHG6M9
         W1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GkWxW+owXfuzmLHw4aDN3rkB+vhpc7rTMfWkm6p4Ht0=;
        b=H0XNBR1HcPEUB/Z3XTRzdRyWEBCyFmT7KLtcqW3BDZ0jT0idd6TQHf/SvPQIrvg0ND
         uy/jEJ5gEy+TicMo824bBS7z+rGye597+n16rHQamfuENWF0eHm5wr8S4zU2LYrJBtgg
         eZ2LrpAT6tdF8bRFRY6cuzudx6cRO2b27u3P5uXsBWWznmCmsuRpNafEWu3xwAACCwCa
         k3W34SU76Ptq3k9ydaLiCduu4vsv/E4q67ru4dMq9XGB3omgVMWp07DJxrhULd+OBBkf
         1sULvZo2NZJRKE20K99Wem0yZC5H4e6cX8CwGEnluVmU/2c3wXt0LK+BIKOj0KhctVxj
         jzeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGJhBSuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a05621421a400b004ad23cd8ab7si3030767qvc.215.2022.09.22.08.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 08:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGJhBSuo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obNtg-0000bO-Ux
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 11:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNTo-0000h6-02
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:47:09 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNTj-0004iH-19
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 10:47:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id bj12so21504253ejb.13
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GkWxW+owXfuzmLHw4aDN3rkB+vhpc7rTMfWkm6p4Ht0=;
 b=HGJhBSuoBz/2YcsTW61tzR/ejIxlVsvOf+MWUp/n0pqebANc+VHEx2X4J6e4Vg9K9Z
 BqDZHk8J3K3T83N4oGvWitB+0MUSKugulSfWZ6eWrBzs8Uggrle2MR+vcLN+pxFTDpFf
 PdKD3a2DxAEVIbaKC7QfGvfcN2dSSwm0j0Sm6/yOEz1yNQQE5IW0CGZ5+jSE5uXnpE/l
 TxrAqR9gdMF2uyoV7z6IEBaPcP5tPCDbMDE4LBqQoz7WdWi+PqehRi8iP7zoPXUe6Q76
 /4Pw/2N6yUnH8VIdoxQB1Auv9h+B/5ht47KoAy3VdaC0xwh0Q9jtAPJJm0ki8GGU8+J4
 iqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GkWxW+owXfuzmLHw4aDN3rkB+vhpc7rTMfWkm6p4Ht0=;
 b=eX1HniQk/LT1sG4KqXRXgihyd+7lUfxPDOTzSgwgczgeE6OlJ0IeeScrEFFnCuxeAP
 zbkjV9XnePD19jJBkrGb3PH7ZXXW5oZhqRy376YnzwIMhXvUZoQAC40FJckHA4L+2azz
 2HykxhgGAIX90dZjI91rtvCQsyshsBt8bjKzAMz6YenKZhZx4W95hx8a3IAQjRZtGknT
 p4qdeLnnpsCF/oR8skqrkfRKH57GdN+o/HpWa83YVoZv1gG6Quy4+vyadt+wilSdWkff
 WZHQ3M5S0sP3NkHfYdnYxpAKzJJzzjnLDLLIOj+UqwcLMEANNevfh3dRn57+GcNEAeGW
 MNvw==
X-Gm-Message-State: ACrzQf0zfI8NhqFGK06Hv+arrxTQqjL96IaEy3Mk0Qp8SvLcecDFm/Jp
 OaSiViFggWsmpXOzxXHrlFXCwkYY/aLP8M4ArGxQnQ==
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr3031555ejb.609.1663858019363; Thu, 22
 Sep 2022 07:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-2-vikram.garhwal@amd.com>
In-Reply-To: <20220910061252.2614-2-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:46:48 +0100
Message-ID: <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
Subject: Re: [QEMU][PATCH 2/5] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8f/nCZsOSB8

On Sat, 10 Sept 2022 at 07:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
> implementation. Bus connection and socketCAN connection for each CAN module
> can be set through command lines.
>
> Example for using connecting CANFD0 and CANFD1 to same bus:
>     -machine xlnx-versal-virt
>     -object can-bus,id=canbus
>     -machine canbus0=canbus
>     -machine canbus1=canbus
>
> To create virtual CAN on the host machine, please check the QEMU CAN docs:
> https://github.com/qemu/qemu/blob/master/docs/can.txt

That link is a 404. You could just give the relative path to the
docs in the repo, which is docs/system/devices/can.rst

For the machine specifics, you should include (either in the patch 4
where you add this to the xlnx-versal-virt board, or in a separate patch
if it seems too big) updates to docs/system/arm/xlnx-versal-virt.rst
which document the new functionality, including, if it's useful to users,
some documentation of how to use it.


> +/* To avoid the build issues on Windows machines. */
> +#undef ERROR

What ?

> +static void canfd_config_mode(XlnxVersalCANFDState *s)
> +{
> +    register_reset(&s->reg_info[R_ERROR_COUNTER_REGISTER]);
> +    register_reset(&s->reg_info[R_ERROR_STATUS_REGISTER]);
> +    register_reset(&s->reg_info[R_STATUS_REGISTER]);
> +
> +    /* Put XlnxVersalCANFDState in configuration mode. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 1);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, BSOFF, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ERROR, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ARBLST, 0);
> +
> +    /* Clear the time stamp. */
> +    ptimer_transaction_begin(s->canfd_timer);
> +    ptimer_set_count(s->canfd_timer, 0);
> +    ptimer_transaction_commit(s->canfd_timer);
> +
> +    canfd_update_irq(s);
> +}
> +

A lot of this looks like it's just copy-and-pasted code from
the existing hw/net/can/xlnx-zynqmp-can.c. Is this just an
updated/extra-features version of that device? Is there some
way we can share the code rather than duplicating 2000-odd lines ?

> +#ifndef HW_CANFD_XILINX_H
> +#define HW_CANFD_XILINX_H
> +
> +#include "hw/register.h"
> +#include "hw/ptimer.h"
> +#include "net/can_emu.h"
> +#include "hw/qdev-clock.h"
> +
> +#define TYPE_XILINX_CANFD "xlnx.versal-canfd"

Should this be a dot or a comma? The codebase has examples of
both for xlnx devices :-(

> +
> +#define XILINX_CANFD(obj) \
> +     OBJECT_CHECK(XlnxVersalCANFDState, (obj), TYPE_XILINX_CANFD)

Please use OBJECT_DECLARE_SIMPLE_TYPE() rather than defining the
cast macro by hand.

> +
> +#define NUM_REGS_PER_MSG_SPACE 18
> +#define MAX_NUM_RX             64
> +#define CANFD_TIMER_MAX        0XFFFFUL

Don't use capital X in the 0x hex prefix, please.

> +#define CANFD_DEFAULT_CLOCK    (24 * 1000 * 1000)
> +
> +/* 0x4144/4 + 1 + (64 - 1) * 18 + 1. */

This comment isn't very informative. The #define itself is much
better because it uses symbolic constants.

What is the magic number 0x4144. It should either be defined via
some kind of symbolic constant, or if that's not possible at least
explained in a comment.

> +#define XLNX_VERSAL_CANFD_R_MAX (0x4144 / 4  + \
> +                    ((MAX_NUM_RX - 1) * NUM_REGS_PER_MSG_SPACE) + 1)

thanks
-- PMM
