Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp68343lfc;
        Mon, 2 Dec 2019 07:20:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7c5alkrz6rWEf67eTFehfyaLTSkGmNHAHgH//heYRV9d98ENXP4cKBTxyyYfSSxxr0fgd
X-Received: by 2002:a17:906:4098:: with SMTP id u24mr78050100ejj.220.1575300038451;
        Mon, 02 Dec 2019 07:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575300038; cv=none;
        d=google.com; s=arc-20160816;
        b=LAL/4OHIswra8WQ1sTCA13w0fpKYT9uEE1XImPVvUiEbjP3GDu3+fiSi/orfLNCkSR
         rp88tETpwaFMxKMoiLDPcKGTETmrujbBgD+9K/mOs0jrpX2hp7FA9P71NNAjPm3m5Sif
         YwfMXU6MnwPlCzzdqshbwKT4Fu/ygLQTuhoYRN7b7ZPjwDh/i+TIjoODAvDoeU6efG8U
         SGuCDAi+z84aledL0DPDvrh4Aob9BVpt39h4Xiwgz6j4Q2LFBtWRHgNOv6HTRxhwJrCz
         4JvWIzEKip4Ob+wTkBL5kvQMBbDWSdW1iWXG8tceH79NYAGydaw91ArF8QEuWcQN8ztg
         hjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5j5sc6m+3Do9c2vsFcfFanl3eE/9mKLyTDuX+zpAuo=;
        b=E+nSoB4PunisZ+TRVGHxBMtS6lGnBEC6grAXbeKH1WWte1xgSYuDUZJ5qODz+VuEmh
         tpxsftoGCqB+sjtVtddj178eB8GId05w8W8aCllnew/Fa4v4zqx3eaZMSgo3gjwNtwpT
         2NPzK74QWvzVSYqPXkjbRSLaEv4b9VGyYvvc6plz0wT7Qi8pM9QsfLXlH2xHOIj5owG1
         rygE4dmOWKmAeB1s2Cy+hD4fbEaL+W440HP9Frgrhk63qZDN4b7qicCpc8nJc+PWoHO3
         YrOj8hbImC2yJAaSTz+IRwQP1qGa1YdwseXm7vxfU/hmQdvy9PIwILS45l3uHZVrwulT
         BNKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyAIufo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn24si24802988edb.251.2019.12.02.07.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 07:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyAIufo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibnV7-0001kH-F4
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 10:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnUw-0001k5-76
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnUv-0007F9-19
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:20:26 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:46012)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibnUu-0007Eh-90
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:20:24 -0500
Received: by mail-io1-xd44.google.com with SMTP id i11so30044720ioi.12
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 07:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5j5sc6m+3Do9c2vsFcfFanl3eE/9mKLyTDuX+zpAuo=;
 b=RyAIufo82LnEb0ct0nMaUs7kc8wpVYDWbPPW3mKWWlNAsm8EuRwYjJtmjUNhTlP+81
 3zau4PFNO7L8psABWAT60N5D/v3rt1I1WLVcPAfptoodzwRToEvmEETHyjDbq5V6deWK
 hAgB5F66pjxx9bqQtuY7yXkckAS8JCk3+8NvNaH46zxrbd0ZVVHRQF3zm/XRws6huGZj
 zbu2kaCVMCeu5o6r6S2/TiVNk82c5iJc0bGDMe4ORSk7EfcfOduP9bJPs2Iujl7EgA1S
 TTYeZ05x/EW2Kld72q4NBfpiE4ILQ3o7o3oh4bvWWPUiBYU+E6Gsq9Wg2yS8vo4SY2AC
 l3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5j5sc6m+3Do9c2vsFcfFanl3eE/9mKLyTDuX+zpAuo=;
 b=et4GDHrM9BRPRkF90MgX/K+hehwlDNEHkok5tYkrKY9+73O/e4yseLPouy3/ve8D1m
 qTrRQL3+8EOwgFuWixiyrBtEDQgeG69iY6erch4Snss+cOVMiYI7rSkmfqEhAwXM7Ppe
 aKxkVfl97wAZg24G0jd0AhmtKwp9DrtQDuYJvieWHijO0tjISVIOnyscmUY7ihAE6Ngo
 OmCA9lA0s/5uwRYJfvLVPE8gkHV3Sym4UwgzJaNPbZSyS59A3AlSAx25KOsJe+/9t8Ut
 kQjU035cqWLJ0wy3n/ZY1vKdXvGx4EsCf/ZIY/sE7wY1ttZReylv4nlYTxq9YaO5ZYpG
 uHpw==
X-Gm-Message-State: APjAAAVPv78vJMgvtmrt3mF0Xz1UwLYhoSsj8pXrBEqOw/r7jz6pKO+G
 G8Lqqx4VtfikJaOOtJ8QbcAQSbGCMA859Kkcc4yuxw==
X-Received: by 2002:a02:55c3:: with SMTP id
 e186mr28436075jab.143.1575300023375; 
 Mon, 02 Dec 2019 07:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-8-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-8-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 15:20:12 +0000
Message-ID: <CAFEAcA_mmBeVnx5TsdeEaEU=jNnkFR9aa-nziaTQD7par7GpoA@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] hw/misc/zynq_slcr: add clock generation for uarts
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9yKh3Y2wKMP

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Switch the slcr to multi-phase reset and add some clocks:
> + the main input clock (ps_clk)
> + the reference clock outputs for each uart (uart0 & 1)
>
> The clock frequencies are computed using the internal pll & uart configuration
> registers and the ps_clk frequency.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Review of this and the following two patches by some Xilinx
person would be nice. I've just looked them over for general
issues, and haven't checked against the hardware specs.

> ---


> +/*
> + * return the output frequency of a clock given:
> + * + the frequencies in an array corresponding to mux's indexes
> + * + the register xxx_CLK_CTRL value
> + * + enable bit index in ctrl register
> + *
> + * This function make the assumption that ctrl_reg value is organized as follow:

"makes"; "that the"; "follows"

> + * + bits[13:8] clock divisor
> + * + bits[5:4]  clock mux selector (index in array)
> + * + bits[index] clock enable
> + */
> +static uint64_t zynq_slcr_compute_clock(const uint64_t mux[],
> +                                        uint32_t ctrl_reg,
> +                                        unsigned index)
> +{
> +    uint32_t srcsel = extract32(ctrl_reg, 4, 2); /* bits [5:4] */
> +    uint32_t divisor = extract32(ctrl_reg, 8, 6); /* bits [13:8] */
> +
> +    /* first, check if clock is enabled */
> +    if (((ctrl_reg >> index) & 1u) == 0) {
> +        return 0;
> +    }
> +
> +    /*
> +     * according to the Zynq technical ref. manual UG585 v1.12.2 in
> +     * "Clocks" chapter, section 25.10.1 page 705" the range of the divisor
> +     * is [1;63].

Is this the range notation the spec doc uses?

> +     * So divide the source while avoiding division-by-zero.
> +     */
> +    return mux[srcsel] / (divisor ? divisor : 1u);
> +}
> +

> +static const ClockPortInitArray zynq_slcr_clocks = {
> +    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback),
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
> +    QDEV_CLOCK_END
> +};
> +
>  static void zynq_slcr_init(Object *obj)
>  {
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> @@ -425,6 +559,8 @@ static void zynq_slcr_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
>                            ZYNQ_SLCR_MMIO_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +
> +    qdev_init_clocks(DEVICE(obj), zynq_slcr_clocks);
>  }
>
>  static const VMStateDescription vmstate_zynq_slcr = {
> @@ -440,9 +576,12 @@ static const VMStateDescription vmstate_zynq_slcr = {
>  static void zynq_slcr_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>
>      dc->vmsd = &vmstate_zynq_slcr;
> -    dc->reset = zynq_slcr_reset;
> +    rc->phases.init = zynq_slcr_reset_init;
> +    rc->phases.hold = zynq_slcr_reset_hold;
> +    rc->phases.exit = zynq_slcr_reset_exit;
>  }

We're adding an input clock, so doesn't the migration
state struct need to be updated to migrate it ?

thanks
-- PMM
