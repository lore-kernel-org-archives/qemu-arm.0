Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3746260ejf;
        Wed, 10 Aug 2022 05:46:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Vv+w9MbTx6MPYydqTnQDDXvGBLbKhI0IOEMaBiGZoIoEz7fKNHwGVT9S5tQafzZuIWZRV
X-Received: by 2002:a37:45d1:0:b0:6b8:62a6:ba6b with SMTP id s200-20020a3745d1000000b006b862a6ba6bmr20399168qka.406.1660135594845;
        Wed, 10 Aug 2022 05:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660135594; cv=none;
        d=google.com; s=arc-20160816;
        b=ulQzD8rvjXr6/vWQ4+vL846LcD+fYdNtCztI3FT/v+oec/QNp2vKaNFkVjPe8GbQXV
         RTHlccAyTORujLKikTbaa+cd5RQKk5uMckOyZNvcMoiH5EQ/fQ9E2hpvqI194hzL15BR
         XIMtb27BeT0YaPBZqzoLHDQODs6i+z7TQ4jhklmwXwCmYzYY03jJBXHrihR4gB4bDrQX
         0B3PeguPdWLPo7jRTqoYeKS1RlJdIT6D0oHwU5kYxAPKwCRi21cngD1TQVeVqM6apOFt
         YgJ3T89l5+Jrq2CBJ54xKMehQ9RfdNQTYfIudEttlBLZ8WoiEP+1ovOatjUkASncUxSN
         noRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lCNEjUUOL+K7ivB3Bsp5vnl640q/xKKPyEI979dGd7E=;
        b=HWWUDnbI+cHPThwOLTjKUoyq4AX6eIppDm49WuDrqM/+WvAJ9gCPS2cni6v9HK+gFV
         3pIJAzqkLYTqcFxRqQReQBoooD1CHylOWIjNqgdV5RdBnonlZjDIaGNluuKtfiMSuA6U
         Vtw9+nelibK/0XqvJIL6Lh2/pn+s2TcOWud/3VFRPVWc/E3sbYfqetqYac4QXmXmWVw4
         RBjbodjQaHRL7UX8MoAKolZRuRWkcUQivvOsbREgitzLFw6mDZRDOJeX0GV3iTE2GIar
         ts2+5MCUQMrxgVfb+TzoZ8E/fYp1M3OINqj3JPWWr+p+Nqnj5bpA5fOisOovdouW9zCN
         PRGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Q5muJBqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac856f0000000b0033da79267d5si10146922qtu.327.2022.08.10.05.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 05:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Q5muJBqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLl6Y-0006jH-9y
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 08:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkwU-0001je-Jx
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:36:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkwT-0004VX-14
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:36:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id z12so17584438wrs.9
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 05:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=lCNEjUUOL+K7ivB3Bsp5vnl640q/xKKPyEI979dGd7E=;
 b=Q5muJBqAiD0aaRMbnHFR3339WU1V+ABAzWuc9rnhShfqfe2qNBFBmJaLZQe9PIHXN+
 xsvESEEbf9woe7sXaa9E278h0rfmGRZW08inLt0WanABBE7hzi0w0huivhFesv4LZhab
 C/AI0QDiXj/rffzqO4Qfsbjm2adPrAycIoshbTGjkw+/7HJGxaB5/SUPkAnPgsXPfL/t
 GVRb35ERN7YRXNlDAZr1jZVFBNRCbUQP3Df6sfcb2QwipZz5c8o2ugwRmBUqmqwDZ3O3
 uo0bk1NU2qRrxKTx66H23+88YclFDRd6wrCz0x9i7gqkYyKnLbUHsoMMyNldlTy4wxVY
 FBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lCNEjUUOL+K7ivB3Bsp5vnl640q/xKKPyEI979dGd7E=;
 b=eEztiRHRh5I6nrTrm+Lt/KVE7p2ZDZxR9a30H5XMAvK+CmKz4HmwmFtWaEbzuUbKSn
 D5rlNgXpzs8pbHlF33TMYd1KWobce3SoJMieOtNZjdez9WHO4dUYSMPP8cyiHqiFJNHQ
 nN6/79MRCLaLZK4BOGRrx2j4uyBbPvR1Jvo11ddF2QgFvbNKTOpxan/McftUgBHjsXzA
 MoHHGc4Dzaou1qZO1UcrkbAPMZykFZZ3axCzVCsfd/hKzg05EDGBEJ2uXgsGak4+XnY8
 /qZMhzmlBDC8o6Oew74DffkxM6ubhpL0h4i5LG64VAfjAl8u4I00AkYM6x/GN+XNbqgr
 GvyQ==
X-Gm-Message-State: ACgBeo1ovVwLQb9Ko7BQp1jmr7zxWAZMYIztL6/QjZOJkHn/KDgQDya5
 /DpjtVN8/24SDixT4AY1KEm5cA==
X-Received: by 2002:a05:6000:985:b0:223:8131:e1f4 with SMTP id
 by5-20020a056000098500b002238131e1f4mr1500759wrb.65.1660134967617; 
 Wed, 10 Aug 2022 05:36:07 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b003a30c3d0c9csm2628871wms.8.2022.08.10.05.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:36:06 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:36:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 5/6] hw/mips: use qemu_fdt_setprop_strings()
Message-ID: <20220810123605.rsn4vjduxxyd7zln@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-6-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-6-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpmesAXFT6R6

On Tue, Aug 09, 2022 at 07:56:39PM +0100, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/mips/boston.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index d2ab9da1a0..759f6daafe 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
>      MachineState *mc = s->mach;
>      uint32_t platreg_ph, gic_ph, clk_ph;
>      char *name, *gic_name, *platreg_name, *stdout_name;
> -    static const char * const syscon_compat[2] = {
> -        "img,boston-platform-regs", "syscon"
> -    };
>  
>      fdt = create_device_tree(dt_size);
>      if (!fdt) {
> @@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
>      platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
>                                     memmap[BOSTON_PLATREG].base);
>      qemu_fdt_add_subnode(fdt, platreg_name);
> -    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
> -                                 (char **)&syscon_compat,
> -                                 ARRAY_SIZE(syscon_compat));
> +    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
> +                             "img,boston-platform-regs", "syscon");
>      qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
>                             memmap[BOSTON_PLATREG].base,
>                             memmap[BOSTON_PLATREG].size);
> -- 
> 2.35.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
