Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2453611lft;
        Sun, 3 Jul 2022 02:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOIJWGdaNUkiMwHJaMBSxqDuMC25nSKJTECPz8AxE7zj5usuR3XYHvsepqKzjK+czb8IcU
X-Received: by 2002:a25:2f55:0:b0:66e:2788:2c0b with SMTP id v82-20020a252f55000000b0066e27882c0bmr6491866ybv.473.1656839821843;
        Sun, 03 Jul 2022 02:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839821; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1vxhGh1zEZMk3KyOPPU6HswsikUy4HRDcX3P1l3EYHzLVvbe0oF78XCsnRCuI1PiS
         a2mpnZuvRRlrLWyTMsexyde4kD00NLIwr3uCkdK0beKJAb0zvsf8LtoWrjYq+chTvCxx
         2bk2bSe06D6Omuwu/lv88VDBNp+WTG42nWC7Cj3bwQf6IzCuDwTZhl2EXrwFdGG9nuLa
         m4uAMwPCpNBmyyUAMa/Oy2Fs8aVYTt9IKT5UI4zxFYEGp1m6iOwLEIS1bYYfHxc4vJ2q
         MQDN+yE9dxdj/c49CaRmcNNGPhJjaV3V+w+D9LanC8Ygs2G/qZsHp8gzmWOvwR4e9GF8
         rOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=giS5ElRI5j5XP8hg8TPxbz+8XigNg6BhzCD2ooGHIgc=;
        b=E7xucEh757xEH2qh0snr8dvqSVZcQmFVUlqamttogvVXlsBqp81eOKtd6Mv8zsvKm2
         QU5Rw2q5EANxic4qTZN5f2SAiyBZG9huNtvuSW4yZnaSIW5/iGO87c7rTty9iEiA6mOm
         JlHR5tQGJ11zMcf/s2nju9k5PCLmUH8R33Kil9zqohD/Ia6BFreRZPJMr5ETVqFDBRzO
         TY/n6f0JZy+PBPh9uTSAvvxZPUivU37+YOOdgCjTKAy3t9gGOPBhY/ZnIpUt5YgqbsUJ
         O8L+ysyAyovbiXkyzeXnH39uHinCWZp6bZZMACvZos6GprcbX/B/v93/o3A14Efx8CI4
         dvzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtrSD27c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205-20020a810ed6000000b003136083a248si35232327ywo.528.2022.07.03.02.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtrSD27c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7viv-0000Ec-5r
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7vQX-0000Fj-G2
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:58:01 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7vQW-0003zt-0b
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:58:01 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i7so11610368ybe.11
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giS5ElRI5j5XP8hg8TPxbz+8XigNg6BhzCD2ooGHIgc=;
 b=wtrSD27c5uqpXMqAnRwMGDA4eUUd2kykee1jV84a2scPEf7/WMhZxInXYai8TxiXGK
 vLStaPF+EMGfLfUoxBu9l/0hWJ3yg8+kcj9YxfPIweawvn3nfAR2qmRqVDG1AKKzigIT
 acKjja43KFkjjZsFGlucUx3gN6WgUsQYDOv6amsPvuLW5CMrMkce8DCAH61OBiq7G/1w
 DKQvRQt0CWtXm+oLTKs8EEHQ23TNzuG6H0pje+wW3U30sbyBMvmkVmckFGmDs9lBlMIY
 /oTtFpAS4IFdnDMYHRw4/YHYq/7/uhHC2zMWVNcZV/fuSjY/fkalg3bTYiMuT9lqTt1v
 lxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giS5ElRI5j5XP8hg8TPxbz+8XigNg6BhzCD2ooGHIgc=;
 b=hNoYCOzLh3MYJeX/0sUfP0v6bAShlIe2+QaE82HNnN7WbARNw8aL8rJ8EbUNKBfYh7
 W7uk0CxVKF/XKNXRntk+tJ8/aZ39lSg0/7w51nlj6rhG7nJpnIVBezv6H7ApHDJWgGNM
 18B3UwIsQeC2QQB+sxl+ep74uUBWYT56AJz8JFHgrIMdm3wzaOnkws8RxiZN0g+tQCA2
 sxxQYHY84FfZUeoDWfmsMC9YBWzPetluEK2JJRuZ2ppNqFQo5MljnWBBTj8sKU9KFu0J
 hgxyITpInsvbrQ5ULV/yvye/g3ms6iF58cCbtcUpb8IDkoog48B3zQd6dDVsVJULl/ts
 wblA==
X-Gm-Message-State: AJIora8z/5yYOrfebsFBkcWiPXlkndtAM3IRVAKAs1sWePyFcbSxG+KT
 PeG5zigP3oRLUBsKxFi0i24BbwPgJnq7Hp8Wza1ojA==
X-Received: by 2002:a25:d74a:0:b0:66d:eddf:c495 with SMTP id
 o71-20020a25d74a000000b0066deddfc495mr11741128ybg.479.1656838678836; Sun, 03
 Jul 2022 01:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
In-Reply-To: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 3 Jul 2022 09:57:20 +0100
Message-ID: <CAFEAcA_E1OWmuTpdqSUXc7kQs7ZkuiHNSWf6P0KQTquaovaVSw@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: ueEurcZtElFX

On Sat, 2 Jul 2022 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 01:11, Peter Maydell wrote:
> > +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * We can't just OR together the aa32 and aa64 checks, because
> > +     * if there is no AArch64 support the aa64 function will default
> > +     * to returning true for a zero id_aa64dfr0.
> > +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> > +     * the AArch64 ID register values in id", because it's always the
> > +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> > +     */
> > +    if (id->id_aa64pfr0) {
> > +        return isar_feature_aa64_doublelock(id);
> > +    }
> > +    return isar_feature_aa32_doublelock(id);
> > +}
>
> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.

Why? The AArch32 version of the CPU is going to either implement or not
implement DoubleLock the same as the AArch64 version: the answer
will be the same in both ID registers. We only need to avoid looking
at the AA64 ID value if we don't have it at all.

thanks
-- PMM
