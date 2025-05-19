Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4233517njb;
        Mon, 19 May 2025 09:26:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKBb5Mon2hTvb5FHXb+1Ujz1a3tO1VVZnZWgrp9LzthuH2dHQO2YK25aN5N0aKbh54IrMlYVW44jxvrg==@linaro.org
X-Google-Smtp-Source: AGHT+IERnI2TA1in/TcAkGIn/QKqRs4FIxUOsF8Tarm5NOJu+vkG/ooc874Ud16OeWjwylYT7UzR
X-Received: by 2002:a05:620a:40cf:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7cd4679cbc3mr2440411085a.36.1747672007167;
        Mon, 19 May 2025 09:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747672007; cv=none;
        d=google.com; s=arc-20240605;
        b=cchtmB7rq8EfkB+GYWNQQceW0R7N1ZcAew2D321VuHu6yHIrG1ovf1aE2t6IBC/gf2
         VEZxclU1+MXAu4Ntodo6/KNTi0MuWluxvIl8eyT0ZAdpTR1Kr4fKgjk5jYBaE1K6Jp8X
         tf/JvVhgBVRnkhZoKaKhzjBVYHOnnEPDRXZMJ4deqW65UyK8UJFpnGlwgWUNBnA5dvPv
         3jrv9koG5NCeMGNZoAiZm0RNzTkl3ynyAedVIUbpm8NVRVgzLzZRmg2mKpwseShb3IL8
         pcNAvukFa51LKr+C5GIOnYIcSEULZ5Zz3XLH363Ghp2WzceAHZyO8ObMSEkz8J7hD1Io
         y6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QDePMuaeX4+id5gfLnVYD0IxFWe/H7JpIkSEbEkpsMk=;
        fh=2UclCpTt/4JPUjmRYI01mTCmwyx/AE9zBv7c8VOoYI4=;
        b=d1pKpJv2FuWxGIbB6S60WrIuS+/zEkyKeQ65vH1Byvzc3ze0iL2sEJF+/err27kAUb
         y20rcm5ZeMWQz1tQBPnd1GNsfarPjnu/8fa57Bes9FAxu6TAl/0j9rVPEbKbt1FzMpmy
         1EqwXsR/A13Gbh/f8qHgO2E/ohRcLTU3E5xFQbryfamLVYw5zF8qy+JRzabOR30T7x9N
         DZXjz5EXIUvd1hMlyGetg8S9bY+gj5TKTA022GS8gzFlf67OcrgiD2AYxOE6rYvpQpVI
         y+NZZBiypo4je+gzK1tRbKbAnnwfJE3POTI9kYzI1+LfczbgodC9Ck73Zz8N7d7euVpS
         SrOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eADzZl1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468d221asi907801385a.573.2025.05.19.09.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 09:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eADzZl1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH3Jt-0005zf-1Z; Mon, 19 May 2025 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH3Jp-0005yN-Iu
 for qemu-arm@nongnu.org; Mon, 19 May 2025 12:26:25 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uH3Jn-0004YL-MS
 for qemu-arm@nongnu.org; Mon, 19 May 2025 12:26:25 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-708ac7dfc19so42944467b3.3
 for <qemu-arm@nongnu.org>; Mon, 19 May 2025 09:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747671981; x=1748276781; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDePMuaeX4+id5gfLnVYD0IxFWe/H7JpIkSEbEkpsMk=;
 b=eADzZl1dbMuOHoahsVh4/iX31eKLsLiWEdVYnSF1MDn5MeAlSAWsGtFQE1V/elqIpY
 D/KmOnXKpMlNPQ9tqyPSe6XIwoTaU5TFDO9BtVJfodMqopjWDtwUu6+oQ6NnA1wrR1IX
 5XvxdNaiGn0YcVB89YTGvqKJhcHpnTSbmpbRp3mbSCE2oF3kr8HxwSG8vN/Qtb/XMair
 qlP4M6GkGLWO64JJAFWh+6jr3psy/UEytlMSgU02m1+E8sEKuh4Uzc+T5JCYuzcLRPl0
 1SRrddLeHWhFJGyU8TOfy5Kv14ny9N2YzGPRwTEJKFiHSHh5jSIpBVpK2Jb1pHeOoyRO
 aBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747671981; x=1748276781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDePMuaeX4+id5gfLnVYD0IxFWe/H7JpIkSEbEkpsMk=;
 b=jtTEbsh7dFQAmb0KzkdYkTCTwJWIefpGmEIG8EWp9MrvIrzons1FMdMNYj3Ly2wjFd
 qM0rIgGSPhrGhBoRMIMu3aeCSd1VuHa82Jngsu/wh6Vy1bYVG906zhoFYfoT2HpTh5mo
 FKu6T6z5MwF+yQg7bQNf1HXvvUSvUgc8EF6Y3pXV42ndhkygQuvHaYux0GE5k4aISacE
 MKpfq9YSNUrLnDk+sCULR6bXJT1HEXspNQluTfyeN+bsFmttGi6MBedG0ECYtFrZalre
 9Xs2eZ8PKNql5ER+/1IeoCeDzvWrddMZ/h0hkM+KKY+vklYO9eVJWhKOtgHVUFElsczH
 2T9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFtdorXMd/FYbpVKfcAKGG7Hm5JmrB/Bp+HtnTXSx9i8rGbLwifROSQMzuH9DpmhkeVVTSZ3PpRQ==@nongnu.org
X-Gm-Message-State: AOJu0YzayMs2p75I/mkgw3FLvsBZ4m8bfu7d6yduY+ckl/kXQy5VJNb5
 7KUxQFyJc3d9WPeWJqmXWfy8Gn44FzbnupmaciKrn3Y7h4gnLNd7b91YSexyw+T9Eu5BXslQjiA
 NJDGQh7qrr6SRWifnxVdQTwFdwBZ0VqU4KMmrXpdGTg==
X-Gm-Gg: ASbGncvMEC/DfN9htWVvNscfTChQmUiskdlBZwZmFkgT7gBCVa/2mECuDELXYGWd5tH
 cYhSYzeIy2N1+FCnjDCw8nbNgEMuoaU5XuCeUegV7gbRSost5uTJxr6+/onBenKEdCSTyXt7Jxi
 bvP8GbAWPHwUJjjhCSoq9YKtlLhiC1Dsatfg==
X-Received: by 2002:a05:690c:3390:b0:70c:9364:2c61 with SMTP id
 00721157ae682-70ca79bf741mr174331697b3.9.1747671981113; Mon, 19 May 2025
 09:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-3-chigot@adacore.com>
 <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
In-Reply-To: <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 May 2025 17:26:08 +0100
X-Gm-Features: AX0GCFtb0YoNJ4ovClBRheo8kqJ0UEZ0YFVobJTpDtekqjz9Q9HFD0BRYODcNHs
Message-ID: <CAFEAcA8vKNkfKgp_Yymo9NA1=E2XJYXAMTgO3z6q6DHgqkAwRw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-arm@nongnu.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C8Mgk+uuWbqV

On Tue, 13 May 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 13/5/25 16:14, Cl=C3=A9ment Chigot wrote:
> > From: Frederic Konrad <konrad.frederic@yahoo.fr>
> >
> > This introduces a first-cpu-index property to the arm-gic, as some SOCs
> > could have two separate GIC (ie: the zynqmp).
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> > ---
> >   hw/intc/arm_gic.c                | 2 +-
> >   hw/intc/arm_gic_common.c         | 1 +
> >   include/hw/intc/arm_gic_common.h | 2 ++
> >   3 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> > index d18bef40fc..899f133363 100644
> > --- a/hw/intc/arm_gic.c
> > +++ b/hw/intc/arm_gic.c
> > @@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] =3D {
> >   static inline int gic_get_current_cpu(GICState *s)
> >   {
> >       if (!qtest_enabled() && s->num_cpu > 1) {
> > -        return current_cpu->cpu_index;
> > +        return current_cpu->cpu_index - s->first_cpu_index;
>
> Note, CPUState::cpu_index is meant for accelerators code and shouldn't
> be used in hw/ (in particular because it vary when using hotplug).

Mmm. I think my ideal solution for that would be that we
put the CPU index into the MemTxAttrs (requester_id, perhaps
with some extra flag that it's not a PCI requester ID).
Then every device that's looking at current_cpu to figure
out which CPU actually called it would be able to stop
doing that. We'd still have the "OK, so what number does
the GIC think this CPU is?" question, though.

For telling the GIC which CPUs it has connected to it, my
instinct is to say that ideally we'd have the GIC have
something like an array of link properties, and the board
or SoC code passes the GIC a pointer to each CPU in the
order it wants them to be.

But that would be quite a bit of fiddling around to achieve,
so I think I'm OK with the approach in this patch, especially
since the GICv2 is pretty well obsolete at this point.

(GICv3 also assumes "starting from zero", in several places
where it loops from 0 to s->num_cpu calling qemu_get_cpu().
Link properties is probably what I'm going to end up doing with
the GICv5 design.)

One note: if you add a new property to the GIC, please
also add documentation of it to the "QEMU interface" comment
in include/hw/intc/arm_gic.h.

thanks
-- PMM
