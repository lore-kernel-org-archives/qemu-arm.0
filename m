Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp400123lfg;
        Thu, 19 Aug 2021 07:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeT1t87uOU0LD57vFhKghjC6sHso/hYivwkr3ZuqU4+zjKjD3TyLqhCuOgFflnQFLZkucR
X-Received: by 2002:a05:6808:1889:: with SMTP id bi9mr3072872oib.139.1629384843774;
        Thu, 19 Aug 2021 07:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629384843; cv=none;
        d=google.com; s=arc-20160816;
        b=i/5hPn/zEY0oLso6s4c9ubj5eZeZHtiMGWMvwfO1/hj54YLLx77H9F8vVj9J0pCf4f
         qrxvZ3GwGtZ5ebiKk/3OaDSAyBr7owMshcixv7RUhHpE9H+zl51idS4Z7oH2sB9zvmZC
         iZmJF9neA0Brw22D4pqU+SoKQxbALe0/3NJqI1W4iuSEy63ckWRgpXb4lM5eDY6A0rAb
         1dL6UlTY+tD1RtBqYZUV4R0KA9h6JCqUA0X+yHQQR5woBzgyAjKm4mIqN1X4u3yemgHI
         Yo/zpG0fVBj5pjpuUiyvOxLlyHueIU+3l3A83//Flo2c4LFQ8taXsNIDlFwHgwn8FEt5
         MddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aWC8A5IyKbDkp0J4s47b+BXsC8+tb8vaTDQSnNcprRQ=;
        b=EGnOe2UavHzkBvp0kFSdP3FdtnT9T9td/xawUjc+nSkBtHaD9c/IOwcnhHSp3vBuDw
         oWnhA1yCRTWwguPI0OGcul1bfq5irkPcvrDdyqZiT9KUVnQ0pA7w0KMDzzDLFrXU2Msd
         Q7YUPQiLqRLpNniK4S1VupyeCwfdf4yp5ngw8HO9eGozFQhJ5fHoYHRiW4VzIlpXaL82
         07r5/NcLK+kIGeec9KRuRI/kwtLh9Tx8FVJ8prrSXHlCbylNo7R/SjrQycUxE3Dl1u/m
         JFPfFDl/T8jvRtZ0aF3B3m54sa1foX4G65rWRLHGrG8jX1b+BG5YbCok8KSikBjxM2M2
         SVAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uK8wpYVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si3715940otr.59.2021.08.19.07.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:54:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uK8wpYVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjQh-0006ZZ-0x
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjQZ-0006ZJ-Ni
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:53:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjQX-0001Qh-VC
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:53:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gr13so13519106ejb.6
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aWC8A5IyKbDkp0J4s47b+BXsC8+tb8vaTDQSnNcprRQ=;
 b=uK8wpYVsEPqq3+7iyi1UAONXGaYr9D9k97fnQNz9ipvzLrRk7KLazmHeadBgJ6OZwd
 k3W7T/jn9TkoGX3Mcad7xFiUD+5V6injVw3qMNNXnkQ4V0f6evGy29EWoLsLaunbUyQH
 0BSAF0JOy6s37c3Htax/dV7/EXcr3UUCV5Cy1buNA2tmC+4AV6vmrh8PWjQHZktPnWFg
 bw4obhHQEGtRl1OkyoC7xJkVtG/UjJo1NqSrQZTij4gR//Wl1iLCkYegg7O67Yk+DdJu
 P7ZRFR5QzK/ylq0hqcHdzWDpt34+EhTBN4WQHXkmHEPs7VPY8vJYoOjH4I2sz8DQlDXx
 evVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aWC8A5IyKbDkp0J4s47b+BXsC8+tb8vaTDQSnNcprRQ=;
 b=nPYFJH272GIikfOhXVwPYwSnyIr6jzfyV+lVhpdkuWQP1GN6v3EeXE+CZrBLPweBKw
 N0JyiP67qyw4XkUBnmXD+p5Bzmaeul9xWEml2SLjJSe8bNTrm+2Xnew2KGTzh0bt6rdU
 USb+D+BKwg7SPFL2+55MOt7Akv+S6nYUwbpRMP024temcz81kBX6JjWT7XXuPCWazbCx
 A7dJ9ma5stGH2kQvH0j182cPJfpBKOHGYmSAcYelRcGczXLdBKwZq3P8ZyRARSWTyxGA
 Dn57Ap11HfDGsweL08I/Q4OdaTJSMZEffPLxGgsJT67I96tXQMrlx0elZ2a2r3Jn591W
 sx9Q==
X-Gm-Message-State: AOAM531lL6YbDjLL6bcbXinZA/kJ84OokfFqnlAFCJ60gkHh0uKrSdvS
 AAY5be9+fDvCmxAsyn2X4C7cuUeBJ+J8g10mTlUZ2g==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16421408ejz.250.1629384832255; 
 Thu, 19 Aug 2021 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210819141527.2821842-1-philmd@redhat.com>
 <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
 <055214e9-a809-7ad5-f2b6-7ef1b0ccb229@redhat.com>
In-Reply-To: <055214e9-a809-7ad5-f2b6-7ef1b0ccb229@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:53:05 +0100
Message-ID: <CAFEAcA9WS2z+vDWjfokFnHqZi8cdzNGoCWThmFsCvho_SaV0oQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FYxbKgYvBsbt

On Thu, 19 Aug 2021 at 15:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/19/21 4:21 PM, Peter Maydell wrote:
> > On Thu, 19 Aug 2021 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/dma/xlnx_csu_dma.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> >> index 797b4fed8f5..0c1c19cab5a 100644
> >> --- a/hw/dma/xlnx_csu_dma.c
> >> +++ b/hw/dma/xlnx_csu_dma.c
> >> @@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev=
, Error **errp)
> >>      s->r_size_last_word =3D 0;
> >>  }
> >
> > This is a sysbus device -- when can it ever get unrealized ?
>
> Alright. Then we should add an assertion if a SysBusDevice has a
> non-NULL unrealize() handler.

There are a few corner cases where a sysbus device can be
unrealized (eg if it is used as part of the implementation of
a hotpluggable device like a PCI card).

More generally, what are we trying to achieve here ?
I definitely agree that our current situation wrt freeing of
resources allocated during realize is liable to be a bit of a
mess, but I'm not sure trying to patch individual cases one
device at a time is likely to help.

A comprehensive attack on the problem would probably involve:
 * documentation
   + what should go in instance_init and what in realize?
   + where should deallocation go?
   + if realize fails and it has already allocated something,
     who deallocates that and how?
   + are there cases which don't need to care about ever being
     unrealized, and how should those be written?
   + helpful checklist of common functions that need deinit,
     and ones that don't because they do refcounting
 * figuring out a test setup that would let us test the
   init->realize->unrealize->deinit cycle for all devices,
   not just hotpluggable ones. (We do init->deinit as part
   of the QOM introspection test; I'm not sure how much
   leakage of what kinds we catch that way.)
 * looking at how many of our existing devices fail that,
   and whether we can have an exclusion-list or something so
   at least new code has "get this right" tested, and maybe
   we can whittle down the exclusion-list over time (and we
   can prioritize the devices where this is actually a user
   visible bug or that get maintained)

thanks
-- PMM
