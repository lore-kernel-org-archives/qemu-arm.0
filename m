Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4951192lfb;
        Mon, 30 Nov 2020 01:53:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg41uG8RhqnZKrUhFLwUdylcGlBiKEg0oPnfwHaFUrjWKNLwQA5Y8NwaDMnf9m+LRGIVEv
X-Received: by 2002:a25:d94:: with SMTP id 142mr24402390ybn.258.1606730037696;
        Mon, 30 Nov 2020 01:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606730037; cv=none;
        d=google.com; s=arc-20160816;
        b=bw6cQRywSQH/u174eTyTvc61+4IOVVKoIJu449N4J6BkWz3WuHgD6fLFEvhsXZuEcf
         5mmcVb2l0tprMlx5eMn6sQ0hnmpBzFJvGfBJX/UFQHtkoN1Q3WBSSbLrknWXF34f/3Iw
         uVJBgyhYNZ3iq9oiR3/3tr3b1NpYjfkXkIRj//UDlTDsbT2tiG2Ddm+P4LQ1S0KnDE3n
         y4m+ZRjefBID4zF3GJGBOpXVLKpiO/E7RcsLJKygLBneSYzbmbngXOaicd6tTL8sSPu5
         POl0t68qlV7+9GEYdxjbQdz2yFI/VJw9D+/U7WnNDBQM1lmeO9SSoUk7KP1ypm2jl7+y
         o1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zzQ4cnB1O7rUreryUKOOa+chKIwPtH+wE/zUOq3hVjc=;
        b=sTuQrXyjeKPJIDw/ubRtzQp+J7z5PR/OKkpt1+SJJdHXlgNOacMO8l9Y3HNdEcSpw5
         giqukK7XVlKDCHltsp8cg3PYa4fTarZmeAUnDyc12aHQgCAQRLuzFFLU93meEp3fqd/X
         5R15luHJwboycUBBIrBZMy9t/cbKOlqjyNwUpiGeX9K+VMK1mxZ8HjxQEZGUzMv4TsXd
         gtjVxCUJ/S+m39RrA+rclZy819O3jGoE8U4NOGHXFasb0xfVBnHWM1KG2jr32ibpgFPd
         VHqLdNnX6CqBCA4a4RdyK2btPcuhjlyL3fHDMO1m/9dviGS2RJkboOeJxRnLkXUvP4td
         6LBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yT/DsMWk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si16668982ybp.313.2020.11.30.01.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 01:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yT/DsMWk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjfsb-0002t7-3d
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 04:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfrg-0002rs-TP
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:53:01 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjfra-0000i6-Fh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:53:00 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so20534729ejj.5
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzQ4cnB1O7rUreryUKOOa+chKIwPtH+wE/zUOq3hVjc=;
 b=yT/DsMWkNTTWadpHsUMMd0wD5aPC0cGywP32RERCiiDqo/wja+9frQWrRwDC+FZgD5
 riP03ZNL/EqEcfgL3R1Sv4rg5kxIzry5X1bQwfWWDfK5SDLyp5rTi9WOECHm0zAHXahr
 pS6ys0IrBZ0Q/vfgaFgpXSCI6Y40khKQZBBfrJFG1XrPrzJWIH+E6EGwl+kmIt8WzUqa
 W2N7xXnYAY+vAZiiElijuYQxCL28RzcTrM9r8o629msSG/5qmKoAGh0Jg5V9yHlJLXSm
 JvmnwAZLCX2+YpsS3/WD9U0eTScj4p9Q+0+hGshQ0H0MlwuzYIcHUq80DNjZcJf0vOFi
 ALXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzQ4cnB1O7rUreryUKOOa+chKIwPtH+wE/zUOq3hVjc=;
 b=QW2U0Cv/6o7DYCT4LjG4KoBNABH3Q0DV6PKE39opY06IirVeYBRe+tJnHObUY4gh1I
 7eND3wS+uPhJQDOo/AwwPJv89nLP+xNwWIkZVI3N6PDpNdnB3wzJlG0tWVe1NQpeSCUG
 QtYGHNtaKgeot6Y/2noOSvEYixyun0MMHm1P4qPIzveN5AGAPgNwL8ldysWrIxvoiEeL
 Hrh7kjf3M35mxBOk09uH4Bae9WWtVra3OI2LRQZSp3tjOvLkKi5a5X+el74OshM1p5Vf
 lCww5JX5C4HBggTgPjvSYdQT5T1wuLab7EmX8unXf7zf0S8s6VVcPrj65L1CUwrJCoWn
 mPEg==
X-Gm-Message-State: AOAM531VGoWBrssbRpr4l3/y8Hz5JNBvH4nQ/8USXzZjcjWrejqz2bQi
 QFOo4gXBJZ5EcF/e4IyBtuhgtRSuPwhL8kB9KvXZcw==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr18779243ejd.382.1606729972150; 
 Mon, 30 Nov 2020 01:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20201130030723.78326-1-agraf@csgraf.de>
 <20201130030723.78326-8-agraf@csgraf.de>
In-Reply-To: <20201130030723.78326-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 09:52:40 +0000
Message-ID: <CAFEAcA8utMuT55R5TzV_3N1Emdu-AjSE7CJ1Oqhs0Vsc4OzEYQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2+skh1ShypD

On Mon, 30 Nov 2020 at 03:07, Alexander Graf <agraf@csgraf.de> wrote:
>
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
>
> Known limitations:
>
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

> +static const struct hvf_reg_match hvf_sreg_match[] = {
> +    { HV_SYS_REG_DBGBVR0_EL1, offsetof(CPUARMState, cp15.dbgbvr[0]) },
> +    { HV_SYS_REG_DBGBCR0_EL1, offsetof(CPUARMState, cp15.dbgbcr[0]) },
> +    { HV_SYS_REG_DBGWVR0_EL1, offsetof(CPUARMState, cp15.dbgwvr[0]) },

> +};
> +
> +int hvf_get_registers(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t ret;
> +    uint64_t val;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
> +        ret = hv_vcpu_get_reg(cpu->hvf->fd, hvf_reg_match[i].reg, &val);
> +        *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
> +        assert_hvf_ok(ret);
> +    }

Please don't just blat straight into the CPU struct like this.
Compare KVM's handling of the cpreg list (data structure set up
in kvm_arm_init_cpreg_list() and the various write_*_to_* functions
that use it), where we look up the cpreg by its encoding and then
that gives us the field offset if necessary and also various flags
including ones that say "don't sync this". You'll need to set up
the cpreg list for migration anyway.

thanks
-- PMM
