Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp315186lfq;
        Tue, 5 Jan 2021 13:12:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4Bq3wcg8l0BS6HYHtRa43OVEqbh+62tH5mdCqJTy10P3glpKFovKBrjiYVC1BJK7zWPv5
X-Received: by 2002:a25:24d5:: with SMTP id k204mr1808552ybk.167.1609881179320;
        Tue, 05 Jan 2021 13:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609881179; cv=none;
        d=google.com; s=arc-20160816;
        b=OuugrQ4PO4lL1ft4UbaeO4pEzXtso4BEB5TLUC6q0IXeZGLF5Qy40/P90MVGj5CYLJ
         Hl1M+hTJc93n9dQl3KEfV5BOgi0F83bjCuTmJtQdCJRCJjvCXVKVjLEOftADNHonCUko
         O2SUMttpB1sb9VtS8EAApu6hb4bbwszUHCZl1qKNE9/M3o0tZ8aoJDIxW4kwIps4pJ6l
         hxtvG8ti2yjrZUbE3URgeUhrLQHuY7CUNarAga9A3S8rFHZFlFguJ9wRJsZPwZG/Hx38
         KU1/fLRzatsgCNXiV0b2jtZaCqF9op+WxAVzutwaKdfYaU935KG8ZDklfoJAf+2/N5gn
         njIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CJzM8vGuJJ7uphomVoIK3FvyeywCzrMEff/uX/RUGhQ=;
        b=zgpx9pxQcx4hquZBit5ACUhv0y8vswLBSbORkk23hoY2pfrlyYnjH6hfsWC2WKhM9D
         7IjpZs7YrN3IqH6pE0yBBGMOgmmqfQtilmojmtpXdIxNdDv5Dram83HH+NIChStBAySO
         IjCJD2D6dWTAQfiTuO89fYcYRGBwFxbgUv17VGW9hTPR+pqGgdi7OQv47ry4/HW8CbOC
         Xi6mEC9WS3CHH7/i90JClzFG8pMsxA0pD07rjSQNotf6xkAIy+aLxUtCZYN22Y/K4lgo
         wA9I863yZpo9kmw++5J0s/hfPTv2NX6Ii+MAmRFYUt1G4zX3vFpvnJY6JppoBiqvhiOQ
         HFFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nQoLdb9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r35si467668ybd.310.2021.01.05.13.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 13:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nQoLdb9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwtdS-000599-Oc
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 16:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtdJ-00057q-EE; Tue, 05 Jan 2021 16:12:49 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtdH-0005vM-QO; Tue, 05 Jan 2021 16:12:49 -0500
Received: by mail-il1-x132.google.com with SMTP id k8so1070622ilr.4;
 Tue, 05 Jan 2021 13:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CJzM8vGuJJ7uphomVoIK3FvyeywCzrMEff/uX/RUGhQ=;
 b=nQoLdb9HSjZeeEmET9F+xZE56nPZqliJIuRKKXgFOdKhGagTfNZ0qEN+AtOWa48GzE
 T7c+xuq6FfNPxyJ1WeonzqRCIJDY9Qiwjb9aV11C5bY8YM1ALCb95amsyED28LAt8rjY
 FxHQ66FEzKu2fmhEb2g8LhFyx+pTSJf6U1JJUAebc+mv+0h4fSmk4bX4N9WBi0NJKgGJ
 2SJjVBosLF1XejAKXA9oNPTf6Jhx1V9vPyOA5dY/MvRuak1igQbxBLlWTh12qs3UkFnK
 o56Wdsv6WEJi7td88Ym4aAzwpmqgieiSe2ZK5p1tDVH4SHLflCmWoIMpqv3Kmf/ntBa6
 o44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJzM8vGuJJ7uphomVoIK3FvyeywCzrMEff/uX/RUGhQ=;
 b=Wn0nZBS1ExFgINeFwwdUZKgLX9S4916cD/zwGCEt2PBf2bLXegft5qaMf8rHPmcOsh
 a8kVPaKEZpmo1ArsKDvebwTCmXCSmXjPPc9UPvfmheM2iwPBQT4H1pd3cwT3IkNYJRDg
 KjrO+O5tOImah8s4DnIAcOZYh/2RTift1uGFlZi+wJiOkZLXo+Qsnbs+1bGEAbpHLU5Y
 BQELvfihQYOG0QHWsVjdvI6i2v4g/t+f+Y3VNYkUwkly1FGxSaTHBmKGtQtNgaM686d8
 qTWKt4KMUSvoilqzsoRK8Hf90ZNN3RImqfnXHd+TPFCgbA/E0RyFWtjC4pxY8gvYtrf8
 vLxg==
X-Gm-Message-State: AOAM531h8fUSgZ9QEqccm/7gM1KTVlILtIB6KzL4iseIssNz7TC2vVSg
 Pu0m0arV89dmQdX0JPKoQmDh8f5IfgoWkNV9bouCGVasp0Q=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr1471370ilg.40.1609881166022; 
 Tue, 05 Jan 2021 13:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
In-Reply-To: <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:12:19 -0800
Message-ID: <CAKmqyKPGpNvvhvsZ_vUrjasj_sjy+yHP0n5VdkNnBpv3CfbwRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3/HAORBRMJe/

On Tue, Jan 5, 2021 at 1:08 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> It should be reviewed by Jean-Christophe and then probably go via the ARM tree.

Ah, I just realised I apparently have `hw/ssi/*` listed in
MAINTAINERS. As this file is specifically mentioned somewhere else in
MAINTAINERS and I know very little about IMX I'm going to leave this
alone still.

Alistair

>
> Alistair
>
> >
> > Regards,
> > Bin
> >
