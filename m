Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4526533ejv;
        Wed, 3 Apr 2024 04:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLalAVcomb/TACkUTV0Xd2qLoRbUFC2DW+YAk1tplA+jK6Copp9RkGc8lfcOjGAlfAZuaZKqZx/fTznUX+n/XwsM4QAc+w
X-Google-Smtp-Source: AGHT+IHnjrG9xG2v60ABxPpu83IRtkEXqyBIX8zJ1lLchIfDkDZF6nh2tLLhWVXWUvQ4V4C+pLAm
X-Received: by 2002:ac8:7d81:0:b0:431:3963:14a9 with SMTP id c1-20020ac87d81000000b00431396314a9mr3229797qtd.31.1712145026375;
        Wed, 03 Apr 2024 04:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712145026; cv=none;
        d=google.com; s=arc-20160816;
        b=Zak9FCe9I9LcH/YW0mkQnZZ+T6h2bV7H4JeS4BeA3WpgVdKcHeN1AhFqjJEL1Y74C0
         U4WeoLsJ0DcP2GjPgON2XkM+rLdXtYMa8JcSD0KGRkn68phUwn+WixnNPzIfDLGeJTey
         IrilQIlNF8MGDoEvi7QHbeWzGeBIl/5Tj6rRqzhNslRgMxU2AYxGz8u5OmePmEMxPHCO
         wmKCfB1kOT0b9O+KNjuI8M87FVUGOcMk/MGbjO68kQUgjC0yRqee1Ch/RrM3iiXglgEe
         VcoS1zfgWxQ0iKnsEL2a1kmdYfW5jox73HYgB+8yCgzhz6IiS2pY7JrE1B5xGxQ9B3AD
         l1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q04MB9sbtDquxr5tfECR0Pc+WkFOv2d45d7auHnPkmA=;
        fh=/p1foQEaIva2b7/ljiBpkBD5abxvpgufgbCeIglQfWQ=;
        b=y+SFw343iOC8WQhtkqXMbEW53IXQg2eY93LmjHTmVwXEMpewkdoA+IYcLgzx6SE27r
         MSpBhL15kSvz9WPmWNquwUbO4tlzXPg2Bk0eZ/b9W3Mu/5wNAj6PSPk+9wDBS9mjm3+w
         T2d+TiOY81uY/whgbtg9dj/Mu9vlUyMBXpa9YPqHVLNHKBkI2QPBfJYp89GlhUI9XFRd
         7jGnrSAy9sW2D6DIwxIGJ9C/ZkdZ/nCpt7yCFejYFnNuPAs6Kd+S0CQ57OuKyP25r+a5
         W0odBNQej3rwIZcCL4N/JuPbBoQ1uku/BJeg7D14mmKH5EDPKqjeMYD/UqMVNxJdM9Eo
         laIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTiKymSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b00432b30bc544si14120736qtx.800.2024.04.03.04.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 04:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTiKymSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrz7p-0001o6-4a; Wed, 03 Apr 2024 07:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrz7k-0001md-O7
 for qemu-arm@nongnu.org; Wed, 03 Apr 2024 07:49:50 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrz7j-0006GN-0x
 for qemu-arm@nongnu.org; Wed, 03 Apr 2024 07:49:48 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-515c50dc2afso6974289e87.1
 for <qemu-arm@nongnu.org>; Wed, 03 Apr 2024 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712144984; x=1712749784; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q04MB9sbtDquxr5tfECR0Pc+WkFOv2d45d7auHnPkmA=;
 b=rTiKymSVsIfF0jepYx6m/kQe83jNR5mGrtY54lYY4QrHbOhr3c9jNhm6pBd1cDsNu2
 kJTUnEH55fY0RTyjBqcZbEnPJ2Wsz6aEOZVRyJJMQ85SMoHiJG26jnGHq9CsG1hTDI9t
 jdpypGuPQZKcbzGT8BXrqlfvQuPafI8CaT86f0su1N2sEUVXRfNPT5u5se9lvTtMcGXN
 T9Igj/aH7Z479P6wwHYk0c7iaJ27zApJPsY0SQIRyc/b96grSXhwAz5rId2qjFRuI7TA
 Z3hBrLeyJ7E3pyryHvci3dAWz+V0SlT5QHPk5jxaRjAhDlm/ApfLXvEgT0Yngrv4oTni
 YoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712144984; x=1712749784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q04MB9sbtDquxr5tfECR0Pc+WkFOv2d45d7auHnPkmA=;
 b=TdIJwbUIGfOusIn3Dz63wABL5rT1cFu1ej3AY3uT4nkNpUHK2w+/auVymJngdfEyPC
 axi5iE8uAjo+dyzKj95i0kykrk3okqKKQTq4AHYh2AwiEbrlFWWlwstnSGfkCaAFg94M
 j9bDWCjddueEYcunILYPLc2Yq8/d4i+xXVkfxO3DP+iIKNwYG4ObrkgNYtD3SczjFzYD
 7e3R3LX380YwGL2hI4+b5CBYI8STLikjbZqkYD2XmFFrRMTyQ5iVKyRzyoi0CW29IK+0
 ZWswrdqcRFhJqZqmYIVYi2gc1oyCA0mvUuWf2JrmylJ+Bcge52uBkGHzGhu+w4AIufvb
 nT+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTEsUKtLXkfWgPscabZs/QVsBiODW4G6Ro1wxP3W7zKZwa9Io/sbI7tLRG7BmNanOj61he8GqCuPVgzeSAHaYsJa/B
X-Gm-Message-State: AOJu0Yz9FS4tGm/LSUdpdj1V/NW6NAve4WywrYK8xRWI8HKeVGkD4Epr
 jSKki0Y7vKyYy1zrR5k1B4MLjPEklnvpvNWwBFY4oRXWUGWAvpcnxE1gaLh0BC+KQ8i2okglLkg
 3kYkA3Lwsq7n3M5vNL3rKYD5uPGyqp4VkxRsqKg==
X-Received: by 2002:ac2:5f49:0:b0:513:ba98:36a with SMTP id
 9-20020ac25f49000000b00513ba98036amr10290422lfz.10.1712144984208; Wed, 03 Apr
 2024 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-19-ruanjinjie@huawei.com>
 <CAFEAcA_WY04voee07n6Ph606xqy=QvTkYdMyqYf5LMHUS5GcDw@mail.gmail.com>
 <6ff19301-8791-384e-bd40-5f58058f4234@huawei.com>
In-Reply-To: <6ff19301-8791-384e-bd40-5f58058f4234@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Apr 2024 12:49:32 +0100
Message-ID: <CAFEAcA_Y_0SSaX_mSAr5eZvuU2fxPUWMow-0=4Bb-+2ofY2pEA@mail.gmail.com>
Subject: Re: [PATCH v11 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: wgopPXHeXw4V

On Wed, 3 Apr 2024 at 04:16, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> On 2024/4/3 0:12, Peter Maydell wrote:
> >> @@ -776,7 +811,11 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> >>          if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
> >>              intid = ich_lr_vintid(lr);
> >>              if (!gicv3_intid_is_special(intid)) {
> >> -                icv_activate_irq(cs, idx, grp);
> >> +                if (!(lr & ICH_LR_EL2_NMI)) {
> >
> > This is missing checks on both whether the GIC has NMI support and
> > on whether the SCTLR NMI bit is set (compare pseudocode
> > VirtualReadIAR1()). I suggest defining a
> >
> >         bool nmi = cs->gic->nmi_support &&
> >             (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_NMI) &&
> >             (lr & ICH_LR_EL2_NMI);
>
> The nmi_support check is redundant, as if FEAT_GICv3_NMI is unsupported,
> the ICH_LR_EL2.NMI is RES0, so if ICH_LR_EL2.NMI is 1, FEAT_GICv3_NMI
> has been surely realized.

As far as I can see you haven't changed ich_lr_write() to enforce
that, though, so the guest can write 1 to the NMI bit even if the
GIC doesn't support FEAT_GICv3_NMI. If you want to skip checking
nmi_support here you need to enforce that the NMI bit in the LR
is 0 in ich_lr_write().

thanks
-- PMM
