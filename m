Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp319237lfb;
        Wed, 1 Sep 2021 02:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynv/kd1AYPZMgAazYyHdBEREMVqbmKmZI3ijtYfjovqtHfsX66H4BN0qeWq+YL/QdxWEaT
X-Received: by 2002:a05:6e02:f91:: with SMTP id v17mr23122037ilo.0.1630489832785;
        Wed, 01 Sep 2021 02:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630489832; cv=none;
        d=google.com; s=arc-20160816;
        b=or440iU/8CYVghCawZN1Se+nIzLbYxYAX5+Sazd9l27Fdq0+N5tbEh//nRK1YogI5+
         bfnnbHZlA78fYC/BXnpoz3XF/6X8kheTluPUhWAdZkKQNIccM7wsc/i+6gtUZzhTMUlp
         5XWWaOUTRpwSjvBPCA+K9BfLz1Ea2bmDFfNqumMB91tODfvKu2gtwrHxtJmJ6OOBtapr
         p0qjeCaU5zEjmXboAwCLU0wnrdEDmZvEiJYFUDZC52CiOtsgPp49b6T+Ln3V49mq/NkK
         lfo/6ulQpNamSmK626m0ztihT+CDUjbXzadhTED6ZmEJuf8SE0M9yohTfKf4IFjJkxD8
         nYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=revcarSj6np8LZ7OO5CWS3GjDmDv5IaOhcyAlm58VXM=;
        b=XTnlP4fZ9dmwYcazkgkbnjp/3eSbwRNiqDtuWbgDnaxyYvWezVpREWwxB8jQi+ocXv
         adxDpvyG8Cnw6aev82JAWpyUvuRN/LVspenRAumLTl6EBk3Z7KOa4MPwg9PZO2l2oD1o
         URAaHhna2BPPWFRftuZyK2fDijfpmjzA3D7Jp/+/2Q5sjInOo3kw5GLkcZ6732zQCxXB
         JCbxIlp+RQVYO5nhQeFac/EdnNPgCOQjFLIr7HxrO+1rGjWQXzWoB0ITx/9KNbk5bABJ
         T9BMqIAdDSwLxtoqixYLH6gQiys25jdEfr5hBuegINYi7k+iBXCi/+gkHWUcSJfNr90p
         Zcyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xjmD+YlH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si19319867ioq.14.2021.09.01.02.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 02:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xjmD+YlH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLMt6-000805-3D
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 05:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMpH-00016c-BD
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 05:46:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMpF-0004Pt-AQ
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 05:46:35 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so4300070wme.1
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=revcarSj6np8LZ7OO5CWS3GjDmDv5IaOhcyAlm58VXM=;
 b=xjmD+YlHSPuso9/pKY8Uhg/pR8sMSSn83fzKQIfo+uISfaN83A1F6sDqfiGz+7qZ+U
 BcvUlB3JTTEUpn3Czz/gdp5hbEoCI926TqeV/XfX5Kz8lJoUMWl5s6RQXY99V1oMIFMC
 pywybdlNyO2jS43EKXVxgVs8lRQlndXMEM9l0fmzikDN12j32y6NDIPzKpBK6P5T0MNS
 rB9ASBnLJLIXG8GB1LdMgbBu75azbOx11mMO654rjPFGxnF6LynqUsqg1ozZtO1mQxZi
 CiDyFSE34bwTZnJy31EWl/ki6NZrbN9wkx+/Ini1YWHhQgJ9r3iE7NSw11vulRGZZAi5
 0w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=revcarSj6np8LZ7OO5CWS3GjDmDv5IaOhcyAlm58VXM=;
 b=d5w1gNv2sOUsbxEf0GpUyUMMVcfcSjijiUjYEQQPZTQOouqWf4GZij1QZJmMeSlPyV
 Jq6bfnG9LIAjL+Ov5iEMr/3Slh3Kl/MpHyF0HfpHkHhv39cfTrLXsU2qAgwOQ/Xt1Xya
 6ieAhdMfCiKpxf1f8fHNVryfrZNXw/knupyrmiIHN4+Y8k72dWfnqtkaJ1nZKS0P3XkV
 EfBqlgYfZP89clFRK7u0dCLxy3FytdVoocyYNcIXDNIYkv4awCe4boZM31cwXCBGzhs8
 fIQ+7T+MgBxiUO6cV9LYewQ2qOJCFgcQz4yRcMBcBMEVmxrAHnUec2ZDwCgElnLtRknB
 mffQ==
X-Gm-Message-State: AOAM5314E5qK3VZTWmda9aSsSjBNsFB5MQvVvjjVwdBbom4eRvwDFUsA
 CMtOHEWoWv1suHYgBajdbIWT9zoRn2nSyJpTDdc/YQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr8708926wmj.126.1630489591715; 
 Wed, 01 Sep 2021 02:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
 <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
 <20210901110207.13b3e34d@redhat.com>
In-Reply-To: <20210901110207.13b3e34d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 10:45:43 +0100
Message-ID: <CAFEAcA_vT5ox=7r245qhNOCBpYz1SGEGPzkWX5gqL=_GAGzD+w@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nab2Gb0g7t/q

On Wed, 1 Sept 2021 at 10:02, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 1 Sep 2021 09:06:41 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote=
:
> > >
> > > not directly related to the patch but while I was testing IORT testca=
se
> > > (https://github.com/imammedo/qemu acpi-tests)
> > > after rebase to 6.1, I get test failure due to change in MADT table v=
s
> > > expected blobs made in 6.0 time and it does look like ABI change
> > > (what is bad, it also happens to virt-6.0 machine type).
> > > Can ARM folks check if we didn't break something?
> >
> > >  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt=
 Distributor]
> > >  [02Dh 0045   1]                       Length : 18
> > >  [02Eh 0046   2]                     Reserved : 0000
> > >  [030h 0048   4]        Local GIC Hardware ID : 00000000
> > >  [034h 0052   8]                 Base Address : 0000000008000000
> > >  [03Ch 0060   4]               Interrupt Base : 00000000
> > > -[040h 0064   1]                      Version : 02
> > > +[040h 0064   1]                      Version : 03
> >
> > This says the GIC changed from GICv2 to v3. What QEMU command line are
> For the test case, I'm more interested in if the rest of numbers are corr=
ect for defaut virt machine type.
>
> But in case of virt-6.0 we might have problem.
>
> > you using here ?
>
> -machine virt -accel kvm -accel tcg -nodefaults -nographic -drive if=3Dpf=
lash,format=3Draw,file=3Dpc-bios/edk2-aarch64-code.fd,readonly=3Don -drive =
if=3Dpflash,format=3Draw,file=3Dpc-bios/edk2-arm-vars.fd,snapshot=3Don -cdr=
om tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu host=
 -machine virt-6.0
>                                                                          =
         ^^^^^^^^

With KVM enabled you get "whatever interrupt controller the host has",
so the configuration is not stable across different host machines. So this
is not a usable setup to generate or cross-check the ACPI test blobs.
(It should get you the same configuration across QEMU versions but on
the same host machine, though.)

(All the diffs you quote are interrupt-controller related in one way
or another.)

-- PMM
