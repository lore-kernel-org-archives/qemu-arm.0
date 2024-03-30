Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2429654ejv;
        Sat, 30 Mar 2024 07:48:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtwxcw5UTQ9+GYEq4EOl1tkgH06UQhzPm3LFPQHLrzTOTjnsS3VOh6QfBvedLdX7kVHVCMxO0ot303mGmtF07GAeuCmqQP
X-Google-Smtp-Source: AGHT+IHZzjlE+Fb/ku2GEDYaxStbSZ7UQGCZgENqYmmMS7BlbQuwTKrj+rRdJXXd6K75dheBTzzv
X-Received: by 2002:a05:622a:4e:b0:431:3163:c32d with SMTP id y14-20020a05622a004e00b004313163c32dmr6075264qtw.48.1711810124177;
        Sat, 30 Mar 2024 07:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711810124; cv=none;
        d=google.com; s=arc-20160816;
        b=JLcz6H+1lxGIWGEwJhEh7AKRLlPppoHu2uy0bHKW54HFtoCmBec8Myg6XBB5reAGRc
         fvtd6hYCeRzgUSZN0aep7ZiMlbg3ulqJ4awF0n9BHlb8y1eKKtw0Juz0gJaBZ7n5PLk3
         KFpjp3BwocuE0uWCwyQe0BmHMvRJQ7mKwJ682Ff2S83XJ8LOeTkfsB7u/vmxcmkGxZEd
         tkSfOrgkZ65Y3lV7OYawyQm/C2ZzD9T3O572h5OZuCPI4tiKQN6h6SljD1frI7YYacsF
         slQK2exE6ibfl9/eSROQ5sXm8g4C29xSQJo/YqCKXhcDI0Q1Z6SMxTRgSQkXxz59Efkq
         A5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wLcvsATfM2+/owsmomcHUczf3j2FECJ4z6goPaJVor0=;
        fh=V866iNOyH15Wh8P4+67BpRbYpF9zpTB5GoGDIMSkA+Q=;
        b=kbhh5YfeOJezPrbjNsJIwbbT7O7tPAH8+nVvNSSDQlt7angZniRvnTWj2FPJU0oDxY
         tnDqPBZIDX7vXVI3W5/virVTWgbBA1ovbCjNTISKuHEGDyIkle4jZ8DivG/ehkW6ml5s
         LYoYJ/yJu7XyuZfV+DfI53Vf2eltHUbAv3eyekd7Xmw0jlyF+FC4QCBJxtLlkH2RGYx+
         ByDwbvJ2sUoNbaFD7YGNCNTwvEafAciR6kpw9f5fBCfh6PLu2Im6ZNfkRbIpgMP9sDqa
         7oFtgxIMPeIGcYtrHLpMOYS7aQXY/rU3nqVjt25QAHm9/ElD7xJ+b4x4IMKeDigt7gG4
         jgPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lNULilpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a05622a135200b00432d55595ecsi434217qtk.383.2024.03.30.07.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 07:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lNULilpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqa0Y-000282-L0; Sat, 30 Mar 2024 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rqa0Y-00027n-1N
 for qemu-arm@nongnu.org; Sat, 30 Mar 2024 10:48:34 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rqa0W-0006xV-AI
 for qemu-arm@nongnu.org; Sat, 30 Mar 2024 10:48:33 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-515a97846b5so2876224e87.2
 for <qemu-arm@nongnu.org>; Sat, 30 Mar 2024 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711810110; x=1712414910; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wLcvsATfM2+/owsmomcHUczf3j2FECJ4z6goPaJVor0=;
 b=lNULilppURZoij4XHF+rvLFzyg/48b2+8wfLL2X/pMYYN8kzSZr3b95SddkI9yKymO
 OKAT011e5EiAAc36LTaOLHlYjetK0Fum3cvprGwd0lhwqDaMpLXRaWfyk4KwBF+VQ81v
 sIrX1/ye+07ztjgSaRODXgdcLAYKxhnhOQjXsPYMaIGgk9gc/5lV5Qe1GYNBapLodE9h
 frXZKWMH4ChoVTmRD9DoKvuzA5ZYKIivgvq2/1Ce5ULyBK0Y1mnRo6w6JMu0btZ42spJ
 6OtsjE+OtjQ80OwL6/xYvfSDHP+j0aLU5KihmtTz8L/6SE93gJoVG5tuyViNlPtOwtxy
 oR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711810110; x=1712414910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLcvsATfM2+/owsmomcHUczf3j2FECJ4z6goPaJVor0=;
 b=cv7uatHGFVSGoI8qaMKXp5DyQw9ZvjbBfqmbfz6RSfB1aHyZHhmctXnKcGLNdoQ1DT
 ZpCz9PsKr81fBLGWaNsGuFiwqKlJGfVlLGJtUWzpG5PLF80VGJA6aKcjc/2RtksmgBW0
 XYDtLD0+K30Tg8YHrJPW9Djmp/J+5jmOIyZHbi1hS5U7yTtjFdCj5aXA4b3iRjKXhhzv
 ZKg2EOkvJnwiVQfJLJFROlFFsrH+m7DRCEuRFB+WH1qSP7mn03W6kRHQXb0ZONvjMbPX
 4SCGeB6qY7I5kbVmhVwgTvgi8cYXvhPB715cFzMzlSkBHL658DMOSR41MIbnLSU80QJJ
 M6lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXShAybHUWMtHzdAmydTP6qyG/2TFesn9IHTvl/0AHitc35B8DKlZHqC41oVtAQkSa8B3mo+xxB8yCfY4Bj3J+NnmiZ
X-Gm-Message-State: AOJu0YywENRTqUvDTRxZG8qHujyM1iAiT3ondqG7AN4rUboG7m8WoaLE
 BJ6/+Y4/N6qFI7AqPcBNaP72pw32CvJuebS5LjAoJPDrhjVX5J3R13Ipv38vUXozCAdlKPaQiUK
 f4NcccpVT3iAH6pKpVaTFCG38CtHatObiDYofww==
X-Received: by 2002:ac2:5f86:0:b0:513:cb7a:7cf7 with SMTP id
 r6-20020ac25f86000000b00513cb7a7cf7mr3133868lfe.63.1711810110296; Sat, 30 Mar
 2024 07:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-18-ruanjinjie@huawei.com>
 <CAFEAcA_p6i5KNcQW3NLZY=kwUXuUPXM+8ncC8T-gPNVUWJ6CHA@mail.gmail.com>
 <8263a597-298d-158e-524a-21ac906363b4@huawei.com>
In-Reply-To: <8263a597-298d-158e-524a-21ac906363b4@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Mar 2024 14:48:19 +0000
Message-ID: <CAFEAcA8E8iLmO=qrgeNOM=cLY14RyqpY6NjOdtwRPY8wbVz7uw@mail.gmail.com>
Subject: Re: [PATCH v10 17/23] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: 3WUzx6AiqpA/

On Sat, 30 Mar 2024 at 02:44, Jinjie Ruan via <qemu-arm@nongnu.org> wrote:
>
>
>
> On 2024/3/28 22:50, Peter Maydell wrote:
> > The NMI bit also exists only in the AP1R0 bit, not in every AP
> > register. So you can check it before the for() loop, something like this:
> >
> >     if (cs->gic->nmi_support) {
> >         /*
> >          * If an NMI is active this takes precedence over anything else
> >          * for priority purposes; the NMI bit is only in the AP1R0 bit.
> >          * We return here the effective priority of the NMI, which is
> >          * either 0x0 or 0x80. Callers will need to check NMI again for
> >          * purposes of either setting the RPR register bits or for
> >          * prioritization of NMI vs non-NMI.
> >          */
> >         prio = 0;
> >         if (cs->icc_apr[GICV3_G1][0] & ICC_AP1R_EL1_NMI) {
> >             return 0;
> >         }
> >         if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
> >             return (cs->gic->gicd_ctlr & GICD_CTLR_DS) ? 0 : 0x80;
> >         }
> >     }
> >
> > Then in icc_rpr_read() we can pretty much directly write the same
> > logic that the pseudocode uses to determine whether to set the RPR
> > NMI bits, after the point where we do the shifting of the prio for
> > the NS view:
> >
> >     if (cs->gic->nmi_support) {
> >         /* NMI info is reported in the high bits of RPR */
> >         if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
> >             if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
> >                 prio |= ICC_RPR_EL1_NMI;
>
> It seems ICC_RPR_EL1_NSNMI in pseudocode:
>
> // GICv3.3
> if HaveNMIExt() then
>     if HaveEL(EL3) && (IsNonSecure() || IsRealm()) then
>         pPriority<63> = ICC_AP1R_EL1NS<63>;
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> else
>     pPriority<63> = ICC_AP1R_EL1S<63>;
>     pPriority<62> = ICC_AP1R_EL1NS<63>;

I'm not sure what you have in mind here? For QEMU,
ICC_AP1R_EL1NS<63> is the ICC_AP1R_EL1_NMI bit in the
icc_apr[GICV3_G1NS][0] value, and ICC_RPR_EL1_NMI is bit 63,
so the C code seems to me to match up with the pseudocode line
that you highlight.

thanks
-- PMM
