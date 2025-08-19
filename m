Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A40CCA0EEB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 15:26:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoODw-0002Ek-OD; Tue, 19 Aug 2025 11:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoODv-0002EF-P4
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:26:07 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoODt-0007c1-Sc
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 11:26:07 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e933a69651dso3168638276.1
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755617164; x=1756221964; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r2QXCMIO4z0sNO0fyaO/mu9Yn7X4g6WvSYCK977bQks=;
 b=bt/It1fEznow/9ZED+4H7h+A1hxNSxCp4uyeDQL4OZGNGQmSNNrtujZK6c2PIk2TRE
 zg92CTVX7Nu70FbMf1Q5WrUOlJHmRl8VMVC7M8SJMBooccu+Omo/M+kliUjvhd2W4Fvp
 /32Yy1MKt6xt7dcmZmZyUlJYXkngpYDWaUw+mNzm3YDJ+ahWJLIlNKE2pNmGmOQIicEW
 GuQi+NoyHSxvjRrhle4vGXTQlsIHuI0MrEW9iOr8S5GrHylhGINpE71ERzrsdH5WqXj1
 pln6rVhj4AnYbrR1kg22XsQAt6Z67GQcItMpPgogG4xfWx/jXsR7ryz4gPul26rVIsvI
 84Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755617164; x=1756221964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2QXCMIO4z0sNO0fyaO/mu9Yn7X4g6WvSYCK977bQks=;
 b=B1vH/PexEFcb1LV7cuVdePdSgeznvfkm6ANqcfFGLTTJBnkxjq0yucTk+E8fwgxkp8
 LAkGLUKNnt0OabQ7vRS3WJD5IqdDiJjgDlvHVxi84/lzVlZlRpZ88SS/VlAYafeW5I78
 Nw9TzLlN6V+rU5oaSTMkB4Xi7jT7nftwQHryhM1Q/CxA3Rp3crS/TIBGxNvGOgy70fmM
 dGqwxrqUhff6GijSWO6gr+BTkol9M4Qwpxkl4ohbVPwUhPqLeHmSVFYhykVuBh611xYI
 Jw2SW8SlNKcCJKxlrNcFBF5bbPxosW+mpuiBYvyXQd6W2BgTelXT34xKDjIDFsyfO3mF
 Agjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXj1jMx8o8Rxw9liqPaL2mlFpAsgcnKqh1B4g+oXlbYmUDc/uTL+IacjWwGVmLCerTQMkxGS5sSQ==@nongnu.org
X-Gm-Message-State: AOJu0YzgqUrRFR1PeRuOloBPRJ73jvXQ9weO4bNth0jeJ9WgZ6jOtWhG
 06wEVz97qu/39pDhTRTH4xlUMMCmEsfVIjpvYUjGG02voD8reIQxKVOH7Z3BMbUhVNCi17Qrt1l
 glGSzdJT7jN76eqD8c5OXb/Cn8YFLvO0WAGIa1g0Arg==
X-Gm-Gg: ASbGnctbaasuU72EsgENbmW3HU0OY8PjRIhICHczdPCChYHjqV7pcY6AAOz4iRXY/xn
 CvKZ+6DmfQaLjcFKUXW9/yUzU+bK57DfyR1dGeYDmXIdHKngxQXYv8Jpa6v4HGdUPRy2eClMIhb
 FuGbjdE+S6lFFBXhBIDbhxji4prHjCY7eCpiO2FTGrGurW7fNxQm3oit1GpEnPbg1kmHeG8RXhD
 0UK04J1
X-Google-Smtp-Source: AGHT+IEt3XagP2Oi5KUl6Ld6I0idSNtE/A6jnBOP2p4uhrPCVpm8tIN1WrhebB4VD5E+HZMK5dFWt60K2lmADRjaV9s=
X-Received: by 2002:a05:6902:6005:b0:e90:2ed6:3dd7 with SMTP id
 3f1490d57ef6-e94e61bc94emr3303743276.17.1755617160608; Tue, 19 Aug 2025
 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250716095432.81923-1-luc.michel@amd.com>
 <20250716095432.81923-14-luc.michel@amd.com>
 <CAFEAcA-x_CYWPM2TeGSTLjCj==3JY_uyvfFmR=nLi4pRLw-P2Q@mail.gmail.com>
 <aKMrBdNhtqHVHRYw@XFR-LUMICHEL-L2.amd.com>
In-Reply-To: <aKMrBdNhtqHVHRYw@XFR-LUMICHEL-L2.amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 16:25:48 +0100
X-Gm-Features: Ac12FXwJcpCimU7_fBUTUlYbs3nMnxybwgP6YJH5S2_zc_mChZM0PFguK1x88SU
Message-ID: <CAFEAcA8eop95ojfZw3YbDrWfrv1fZ5QYSmwx_oDThxMCiMMeDg@mail.gmail.com>
Subject: Re: [PATCH 13/48] hw/arm/xlnx-versal: VersalMap: add support for
 OR'ed IRQs
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Aug 2025 at 14:30, Luc Michel <luc.michel@amd.com> wrote:
>
> Hi Peter,
>
> On 13:24 Mon 04 Aug     , Peter Maydell wrote:
> > On Wed, 16 Jul 2025 at 10:55, Luc Michel <luc.michel@amd.com> wrote:
> > >
> > > +static qemu_irq versal_get_irq_or_gate_in(Versal *s, int irq_idx,
> > > +                                          qemu_irq target_irq)
> > > +{
> > > +    Object *container = versal_get_child(s, "irq-or-gates");
> > > +    DeviceState *dev;
> > > +    g_autofree char *name;
> > > +    int idx, or_idx;
> > > +
> > > +    idx = FIELD_EX32(irq_idx, VERSAL_IRQ, IRQ);
> > > +    or_idx = FIELD_EX32(irq_idx, VERSAL_IRQ, OR_IDX);
> > > +
> > > +    name = g_strdup_printf("irq[%d]", idx);
> > > +    dev = DEVICE(object_resolve_path_at(container, name));
> > > +
> > > +    if (dev == NULL) {
> > > +        dev = qdev_new(TYPE_OR_IRQ);
> >
> > Here we create a device...
> >
> > > +        object_property_add_child(container, name, OBJECT(dev));
> > > +        qdev_prop_set_uint16(dev, "num-lines", 1 << R_VERSAL_IRQ_OR_IDX_LENGTH);
> > > +        qdev_realize_and_unref(dev, NULL, &error_abort);
> > > +        qdev_connect_gpio_out(dev, 0, target_irq);
> > > +    }
> > > +
> > > +    return qdev_get_gpio_in(dev, or_idx);
> >
> > ...but then we don't save the pointer to it, so the only
> > thing still hanging onto it is the QOM tree.
> >
> > If you want to change "embedded device struct" into
> > "allocate memory to create devices" that's fine, but the
> > SoC should still keep track of everything it's creating,
> > so that (at least in theory) it could clean it up on
> > unrealize.
>
> I'm not sure I fully understand your point:
>
>    - The OR gate device is parented to the "irq-or-gates" container,
>      which is itself parented to the SoC. So finalizing (freeing) the
>      SoC would trigger a cascade of free calls to the children,
>      including those objects right?

Ah, I hadn't noticed that we add the object as a QOM child
of the SoC here.

It does mean you can't ever get back to the OR gate object
except by walking the QOM tree, but I suppose that's OK.

It would be helpful if you could run "make check" under
the clang leak sanitizer with your patches added, to see
if it complains about anything. (Unfortunately it will
definitely complain about at least some pre-existing
leaks, I suspect.)

thanks
-- PMM

