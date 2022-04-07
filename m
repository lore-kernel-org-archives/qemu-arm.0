Received: by 2002:ac2:5de3:0:0:0:0:0 with SMTP id z3csp112292lfq;
        Thu, 7 Apr 2022 05:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMwfEhcpBu6V69L7jzLIHJchWfibkONkOzgiUfNCWz/cRVOktdJTReYlFnY65nGCB8LxG6
X-Received: by 2002:a37:68c9:0:b0:67b:21e6:297c with SMTP id d192-20020a3768c9000000b0067b21e6297cmr9132121qkc.464.1649333134198;
        Thu, 07 Apr 2022 05:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649333134; cv=none;
        d=google.com; s=arc-20160816;
        b=eova6MYzw+ZLj3xxcuFnW4Trv/+zofOHc57uVl151lrq5uhcDfS3aLK3+ArtdFHUm3
         HU9D7XsX/UWXaQbK2gosfuqEF49HjDuIJtYCeergFBXmRh+UhGSEeY7z5nffV+IqLuTN
         By/Kv9q3y/IZiMd7KWrfYgpgcjtw6QUGbug4mlIG+zNHG9elyH1nd/8j754qyn65BoJp
         Cu5UjpsPqGFthykFJlmCLO+QZCn6gX4iU9F7mFN0K/cpNX+0GeAGQg2N6OMqAbkT2EnB
         crswkaJtn/30HNf/VbiYqf/OXDA1N3PCfGFuBXXRPar3PxokdVMUL7ILqz/nJoogFA3e
         3xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=ReYOp/YVLMAxexLEzT4f24MKJggnUm0GZU6Rz2oejVs=;
        b=clssckuy3gCGkGy5s+TnxFBqPYnME5sSqsGlVXVN0wX1Zu9/KvnZXiDDip4OheeuBe
         ipsxxvslO4ggRJ2XQ1k9Vflya4fjpkltDbEQ/3J4LLxP4gPmakujrRjE7c2s+LJe7KTA
         v16FotsuzBmyd0gkZoURg6/JOT68+wyoKFs/TGl8+XRao9lc/u6BeMqtrp2Hn7bE8nCQ
         B0jmYVrlU3oDoARYxQ1K8UN3rJzr3B4whwjj+JrQ4yQLv2U04m3NQDxgP0qIMDmHf6BT
         AVA2rLsBh63XS/8eCfhoWXn9sEsEc/wj5QDSoAsLatJ9/f2OoilfiKjQfgQ/KtuG0bah
         Doww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=k1VGsDSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b26-20020a05620a04fa00b0067e4be239e3si6684724qkh.552.2022.04.07.05.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Apr 2022 05:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=k1VGsDSv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncQtJ-0006WT-Kn
	for alex.bennee@linaro.org; Thu, 07 Apr 2022 08:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ncQsf-0006Uy-3K; Thu, 07 Apr 2022 08:04:53 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ncQsc-0001wl-6I; Thu, 07 Apr 2022 08:04:52 -0400
Received: by mail-lj1-x22a.google.com with SMTP id q14so7118990ljc.12;
 Thu, 07 Apr 2022 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ReYOp/YVLMAxexLEzT4f24MKJggnUm0GZU6Rz2oejVs=;
 b=k1VGsDSv8SHrLKXDgE2DFohCAx/coUKQ6NHcht07vn7Fl5BUuk84siQRnLqdiXEhg6
 h9iyMYiPFygkSxgvt8WeA63VOS6Svx+T+h3vgJEyd+mj+uXXpv3bukoDKH+ALpnszeOD
 5l6dJvnGcEAOi/FtMQHJjXvnDo8KcNtY/xMn5P50xsRJr+VKW9DcGSMWs0FVDngItoqQ
 3brTopWXVZGMoLDfwfBy5BCVemNN3b/Wx0UMLjEmEppPmmYXvn3sE+3Eupz3jqPm0IY5
 Ecla4xvj3J0zYWrRYHImIj7xGCsAvWKKL/OkOoHBOIcXIOhoEXFJ9+Y/p9vzEkYMtU/m
 RhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ReYOp/YVLMAxexLEzT4f24MKJggnUm0GZU6Rz2oejVs=;
 b=01FMnNlH9t3EHC8hwWFDmCKYYsh72k3/SZEtEvqsizGsl7Ewvqho+rXngl1sQNXkzE
 F6Dj6uOpJhDD2WDiKvLOdVzqUkbE/fQ2ypJF6BOy2zLlwOBL8zbk/Bj8aASi2RKxZM7o
 kbMqeRW/opo+hRgoHEMSoX5uBebgV1s4w49kFe4E41fpcfnItrrxwQMSCLGpeisYDBRR
 DVualSdiYtATtUNI10h0a2JM7XB7O+7/G7qESu5hW9rjNCe48MU0IiGaGR1CGMK4SuaE
 6dtH1PsIQnmAt8xJ4+40vi2ILr8r9F2c7pdnJYGHsfCKCdmqizPoECJ4rkxJB8eVv+9z
 pEAA==
X-Gm-Message-State: AOAM531lY281zGtMWGz58yxD0hpx/M6QlJL+M93TbDa/5L+ukcR5KFNb
 6XnpHJJd9f9zdhOn8+ESTag=
X-Received: by 2002:a2e:91c6:0:b0:24b:f77:9ea with SMTP id
 u6-20020a2e91c6000000b0024b0f7709eamr8590645ljg.353.1649333086867; 
 Thu, 07 Apr 2022 05:04:46 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a19644b000000b0044b09e88d68sm1262725lfj.256.2022.04.07.05.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 05:04:46 -0700 (PDT)
Date: Thu, 7 Apr 2022 14:04:44 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-7.1 02/18] hw/intc/exynos4210_gic: Remove unused
 TYPE_EXYNOS4210_IRQ_GATE
Message-ID: <20220407120442.GA10629@fralle-msi>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404154658.565020-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Zongyuan Li <zongyuan.li@smartx.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mxwguoh4H6M/

On [2022 Apr 04] Mon 16:46:42, Peter Maydell wrote:
> Now we have removed the only use of TYPE_EXYNOS4210_IRQ_GATE we can
> delete the device entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/intc/exynos4210_gic.c | 107 ---------------------------------------
>  1 file changed, 107 deletions(-)
> 
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index bc73d1f1152..794f6b5ac72 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -373,110 +373,3 @@ static void exynos4210_gic_register_types(void)
>  }
>  
>  type_init(exynos4210_gic_register_types)
> -
> -/* IRQ OR Gate struct.
> - *
> - * This device models an OR gate. There are n_in input qdev gpio lines and one
> - * output sysbus IRQ line. The output IRQ level is formed as OR between all
> - * gpio inputs.
> - */
> -
> -#define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
> -OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE)
> -
> -struct Exynos4210IRQGateState {
> -    SysBusDevice parent_obj;
> -
> -    uint32_t n_in;      /* inputs amount */
> -    uint32_t *level;    /* input levels */
> -    qemu_irq out;       /* output IRQ */
> -};
> -
> -static Property exynos4210_irq_gate_properties[] = {
> -    DEFINE_PROP_UINT32("n_in", Exynos4210IRQGateState, n_in, 1),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> -static const VMStateDescription vmstate_exynos4210_irq_gate = {
> -    .name = "exynos4210.irq_gate",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_VBUFFER_UINT32(level, Exynos4210IRQGateState, 1, NULL, n_in),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
> -/* Process a change in IRQ input. */
> -static void exynos4210_irq_gate_handler(void *opaque, int irq, int level)
> -{
> -    Exynos4210IRQGateState *s = (Exynos4210IRQGateState *)opaque;
> -    uint32_t i;
> -
> -    assert(irq < s->n_in);
> -
> -    s->level[irq] = level;
> -
> -    for (i = 0; i < s->n_in; i++) {
> -        if (s->level[i] >= 1) {
> -            qemu_irq_raise(s->out);
> -            return;
> -        }
> -    }
> -
> -    qemu_irq_lower(s->out);
> -}
> -
> -static void exynos4210_irq_gate_reset(DeviceState *d)
> -{
> -    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(d);
> -
> -    memset(s->level, 0, s->n_in * sizeof(*s->level));
> -}
> -
> -/*
> - * IRQ Gate initialization.
> - */
> -static void exynos4210_irq_gate_init(Object *obj)
> -{
> -    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(obj);
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -
> -    sysbus_init_irq(sbd, &s->out);
> -}
> -
> -static void exynos4210_irq_gate_realize(DeviceState *dev, Error **errp)
> -{
> -    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(dev);
> -
> -    /* Allocate general purpose input signals and connect a handler to each of
> -     * them */
> -    qdev_init_gpio_in(dev, exynos4210_irq_gate_handler, s->n_in);
> -
> -    s->level = g_malloc0(s->n_in * sizeof(*s->level));
> -}
> -
> -static void exynos4210_irq_gate_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -
> -    dc->reset = exynos4210_irq_gate_reset;
> -    dc->vmsd = &vmstate_exynos4210_irq_gate;
> -    device_class_set_props(dc, exynos4210_irq_gate_properties);
> -    dc->realize = exynos4210_irq_gate_realize;
> -}
> -
> -static const TypeInfo exynos4210_irq_gate_info = {
> -    .name          = TYPE_EXYNOS4210_IRQ_GATE,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(Exynos4210IRQGateState),
> -    .instance_init = exynos4210_irq_gate_init,
> -    .class_init    = exynos4210_irq_gate_class_init,
> -};
> -
> -static void exynos4210_irq_gate_register_types(void)
> -{
> -    type_register_static(&exynos4210_irq_gate_info);
> -}
> -
> -type_init(exynos4210_irq_gate_register_types)
> -- 
> 2.25.1
> 
> 
