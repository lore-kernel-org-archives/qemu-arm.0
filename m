Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1181319lfg;
        Mon, 16 Aug 2021 02:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCBbWtqwINfYHgyVikxWDLxrW7405k2GnHsdYwfQWDoMq5IR4e/NcPqpeueN+TBzflnG2D
X-Received: by 2002:a92:c946:: with SMTP id i6mr11230541ilq.228.1629105477897;
        Mon, 16 Aug 2021 02:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629105477; cv=none;
        d=google.com; s=arc-20160816;
        b=usxkTdNSLVJ90cYsuatQrOPCQ0am6ZUq9bTdQ/EGgEZtxRnXhdafczBuTr5bkrw8a2
         z0K4WJK9Q8Xc7/ms5oNvUjqAxXluE5ihS4uW0Tvd7WOrsK0k89enRhqDYCGhcWuNljOc
         e6jlZslP+8RAwPKpucEldqqQI9LYHWq/ulXG2/8AVw9g6yNlvGl49cpq7NbeR8Tvq094
         o7lLVRE4lA1qoCZSq5Fzp9irVGNModxPYKo/n0ZRpDs2c4lezLBXoWTaSx5dWbXy4iDK
         HGeOCWhbf6rXArfvsEVOezZT0Os6Wd/t0zxphUCIOz027QLMKt+C6snqGo6aH1BFmFeV
         43pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BejzJrfPr9TzOSRCBM9tXuBkmhK84ecuQRNd/mlvEvw=;
        b=PuYcUQDNUO/PcyoE9mbRe2vLoOMZjHwNapjgKNwC7+ljF3Qyuq+lvoEkK22k9ybcYW
         XGLtZbBR/KL1SLBSjsvFTHFvofe8Zb2cVZZf8g9vydXmkxSPSYQGU4INPyXugN7T/Whp
         cJtTPpXe+bBHL2cURpZ0Uf3/VKSDK+Cv88DKDa0sE44YX+I0JD10hT0mrUvQvGRdD5e+
         3IBxCDp+VBewqm2Eod9VwFxxDD7wmBFE2rHgZazLPRcUTP46dUdbDkDDGlJ69rEixd/y
         ZsMMP5lcVsf7X//zXX/WyOXSE+HQVYQQIeLV/eQvfI0PAdm95QJgUX6/tOpDSNJRxT+/
         ymnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tV4zvHAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si11867363iol.83.2021.08.16.02.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 02:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tV4zvHAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFYkn-0001FU-16
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 05:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYkb-0001EN-HT
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:17:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYkX-000434-9f
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 05:17:45 -0400
Received: by mail-ej1-x635.google.com with SMTP id gt38so9330661ejc.13
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BejzJrfPr9TzOSRCBM9tXuBkmhK84ecuQRNd/mlvEvw=;
 b=tV4zvHAKqtt6HFBanaEUYJQLApci3QoiDEvJRQcBiT8LInWLxYQ/0tRr1Gzum18BsS
 9cp8upaTn1rlyMM9xWm1GKOdRQYzVQ6s4Eak57B88go6OQt7R/nqlhZ+mEZ2MN8ZOG+D
 eP4BTaNxT4kJ3P1NdOQvmtTdEbUoZOOUle2+7rjeWomvyHHZ1h1ocyGq5+HA//UU6Pco
 jDIlHw1rzx20YU/6EdxDEW+In3RvUjz5y/XxOEgcX79VlB5u6nf/iSnq3qB9co5tbB1C
 vlm+I/9KupQO8ErsKZhyuRddbyNlAgvadrCZleHUbez8lsAxzuKsv32t1JsXBd/Mk+Lu
 /OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BejzJrfPr9TzOSRCBM9tXuBkmhK84ecuQRNd/mlvEvw=;
 b=QR30tbYZTWRmRr38WmuLxzbjiKhe4p5m7yoOhM1CQnkbSI3seAWrwEpxZVA5P4LQNu
 AH5MTmJBk6r24xLTBJLi+eRi5QFTCFxiv+zX5cSATJ/aO5SSbGw68B9XtzGDjR4S3qkq
 fyMgOJFPh7NgN2KMIot7KPrimxons0mUcR/3Ptt+jfzpakxk8dgzssPvfoREqYpWVXXM
 V1xQtwd27zE1DYzLeLL6FMw4KtoIG+vNvdIWIASQi4Qj0SOqUUkt2Oq3/D+/mpi+Xs+Q
 GyJhRQBqaR8psPu0SIUw+zQVmhq/5vTSHuBse2IlQMZEDyxfUKMmskFkG7Uyr9sOES8Z
 RSVg==
X-Gm-Message-State: AOAM53210C1SwhnFkobr/EycyBKVklTD6nphiZ0u4SYQOxr9Z0ycnj0W
 jJ8GRHXhVack9MYWzwJk1na+wUspHqol3FJTsZ6rtQ==
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr11619082ejf.85.1629105459570; 
 Mon, 16 Aug 2021 02:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
 <3fc10091-832a-e87c-9866-323534f6dc9e@amsat.org>
In-Reply-To: <3fc10091-832a-e87c-9866-323534f6dc9e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:16:54 +0100
Message-ID: <CAFEAcA_EXxMPQjbA+rHwTPfZko_pcmw_Hi6yOXW+mXWAAkcs1g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0oAGtFhZBI4m

On Sun, 15 Aug 2021 at 18:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> +Peter/David
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > Currently we implement the RAS register block within the NVIC device.
> > It isn't really very tightly coupled with the NVIC proper, so instead
> > move it out into a sysbus device of its own and have the top level
> > ARMv7M container create it and map it into memory at the right
> > address.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/hw/arm/armv7m.h       |  2 +
> >  include/hw/intc/armv7m_nvic.h |  1 -
> >  include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
> >  hw/arm/armv7m.c               | 12 +++++
> >  hw/intc/armv7m_nvic.c         | 56 ---------------------
> >  hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
> >  MAINTAINERS                   |  2 +
> >  hw/misc/meson.build           |  2 +
> >  8 files changed, 148 insertions(+), 57 deletions(-)
> >  create mode 100644 include/hw/misc/armv7m_ras.h
> >  create mode 100644 hw/misc/armv7m_ras.c
>
> > diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> > index 9ce5c30cd5c..8964730d153 100644
> > --- a/hw/arm/armv7m.c
> > +++ b/hw/arm/armv7m.c
> > @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error=
 **errp)
> >      memory_region_add_subregion(&s->container, 0xe0000000,
> >                                  sysbus_mmio_get_region(sbd, 0));
> >
> > +    /* If the CPU has RAS support, create the RAS register block */
> > +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> > +        object_initialize_child(OBJECT(dev), "armv7m-ras",
> > +                                &s->ras, TYPE_ARMV7M_RAS);
> > +        sbd =3D SYS_BUS_DEVICE(&s->ras);
> > +        if (!sysbus_realize(sbd, errp)) {
> > +            return;
> > +        }
> > +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,
> > +                                            sysbus_mmio_get_region(sbd=
, 0), 1);
>
> Just curious, is the overlap really needed?

Yes, because this block is currently in the middle of the
PPB-area region provided by the NVIC, and needs to take priority
over it. Once the refactoring is complete, the background-region
will also be created in this armv7m realize function, but the
RAS block still needs to go above it.

> I see the NVIC default
> region is 1 MiB wide. Aren't smaller regions returned first when
> multiple regions have same priority?

As David says, if you don't specify the priority then it's
pot-luck which one you see. Having overlaps and not setting
priorities is a QEMU bug. (We used to have some code to print
a warning about unintentionally overlapping regions, but it was
always disabled with #if 0 and we eventually deleted it in commit
b61359781958. IIRC the reason we never enabled either a warning
or an assertion was because for the PC machine's PCI devices
in particular we thought it might be possible for the guest to
map PCI devices at a silly address and generate overlaps, but
I may well have the details wrong as it was years back.)

-- PMM
