Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B2D29C36
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 14:42:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhqSd-0005WH-AU; Mon, 19 Jan 2026 09:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vhqSc-0005Vs-JP
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:42:30 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vhqSb-0006qx-02
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:42:30 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-65e94e128beso2785457eaf.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768833747; x=1769438547; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ktxP2x58t8JG46IbkJ87ZwF8mbFsBmeiWLSfF058hQ=;
 b=Bi+0UGwhAumOtQJY8wKQvNHU9SZDmV87gzP2SiOtWshEeIERAjjZoIo5uXxhVq3vu1
 SLDhBoiYV0VRKO7SPAOZfSYCOVB9WHVzhEFbmV0QY+qEJjc5g/GYL1OaCi1DZ3akgsq7
 PdsU2yvxtfJKQXdlD3M5MVkKkrVAnbjtWdeeRk2XA3Hp/0l+X73ZH7hvztx7FlrxSZo6
 LGkM3fwbZ4ykk0sHcSrBojd7VTmgC1+NnXBw2sPOZ4h+0Ob3/MtMzg0uyWTRSxa0ndQi
 Ugdt3XTb8CFHHIraEQ7/N1l+ToB25lT0+O/3brIBBaTiyn7DBDsU5jTRwqG3uFvVep81
 kguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768833747; x=1769438547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ktxP2x58t8JG46IbkJ87ZwF8mbFsBmeiWLSfF058hQ=;
 b=eHmUyOc/cxoGkRy6U+al3D5j3PYyVyTw5OsaE543SWnA2aWm9zzmG0rXOUPJTYcsaR
 fl/0WicGlsBd/h2yq1V85WcVninJzfVVouO+wrxQb4BEmYkQav5W52hKR2BlpvJGAHV+
 zA6SMHHfTiONVxhXxif09vHT/zEhsnNw5X7bV9p06WCW/Z3nh4Af1Saa91J+5/JfHEEd
 /GoeZfp1Cv9KewIzpi6KFs51IAtQtorKNGR6mTcnl9rSNA4enqg6yP3ic9kUKxdTlEdX
 xDUKHTFdlsGFwk3RgGv90OdrXLOMaHK9xQWWzDmSe44hr/hVPWGPT6Gx+JvcuwTe2nxR
 yt0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDXUAUwZcH3XBmAC+9d5vI+pe7rE8qMmtGe0NdIqsqqmEcXQUsZh5Y+BJbGhdsKK+VAnrhsNv4w==@nongnu.org
X-Gm-Message-State: AOJu0Yy5grcZR73sDuJs8WeHNcZlVdcTOztz216yg1vzjgjtHqJO4KYb
 XSIMWrnAbHpfMafN+0b+/D1c9J5F/et/PRfhaIuxx9BGux10QlHVD9UyoW1aaPHLvZgkfD0lZ9E
 SxZZ9IOQ9YpZf9ZR04PaVdTbGTQowKqo=
X-Gm-Gg: AY/fxX6E/upEqyHMu6jrSoenJKvwKNSEwKHwUXfjxiwuoIy5HdfFcIlBbV0YuINan6O
 9vkrJs+TCJNM2Uv+0SPiNtNIDX7loIOvGy6dz37uJJTmbK1xJ4GSuEm+a4INQURtjgFFGd4NAZ4
 Q7EL7ft5g8kgUU+DHW6vysUPmbxGqc1Qz8vfnCJ00RtdOFDMkRngJm8rMir0aUHp4pXLmzBJvvz
 qzkQehIgFHCIgu6LlvRAX4qkQMWUM2Az+PB7/AOZC7YWt1ATkPUzFk8+vluskA9+k00GA8=
X-Received: by 2002:a05:6820:1794:b0:661:14b1:7c66 with SMTP id
 006d021491bc7-661180e3be2mr5357633eaf.25.1768833747059; Mon, 19 Jan 2026
 06:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20251219222439.2497195-1-ruslan_ruslichenko@epam.com>
 <CAFEAcA-VYhtvXK5tyVJWfskqqKFim43DsKfWrpaMxteWueR6aQ@mail.gmail.com>
 <CAN-aV1FsbAp3JrqoPgz+c4ORayBjsGxTLWOkDMc0WyE2nD-aZw@mail.gmail.com>
In-Reply-To: <CAN-aV1FsbAp3JrqoPgz+c4ORayBjsGxTLWOkDMc0WyE2nD-aZw@mail.gmail.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Mon, 19 Jan 2026 15:42:14 +0100
X-Gm-Features: AZwV_QilJ0BMQ498EN7J-LrY2MtIw0wxqNdgKXAPwRxPNj4sSNAvrtw10YHjXCU
Message-ID: <CAN-aV1ERa6uE9U8cPArmXCv+WOJhP7ZgGAF2VEDaAEbiebyawQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] hw/arm/smmuv3: Add SMMUv3 sysbus support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: ruslan_ruslichenko@epam.com, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Jan 2, 2026 at 4:36=E2=80=AFPM Ruslan Ruslichenko
<ruslichenko.r@gmail.com> wrote:
>
> On Sun, Dec 28, 2025 at 5:59=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Fri, 19 Dec 2025 at 22:25, <ruslichenko.r@gmail.com> wrote:
> > >
> > > By SMMUv3 specification it can be attached either to PCIe Root
> > > Complex or regular IO bus devices. However, current
> > > implementation only allow to associate with PCI bus.
> > >
> > > This patch series add support to use SMMU for sysbus devices.
> > >
> > > One usage example implemented for virtio-mmio, which allow
> > > devices to perform DMA operations SMMUv3 with address translation
> > > and isolation.
> >
> > If you want virtio devices behind an SMMU, why not use
> > the PCI virtio?
> >
> > The only SMMU sysbus requirement I'm aware of is that for
> > RME we will want to have things like the GIC do GPT lookups,
> > which is most conveniently done by having them route through
> > the existing for-PCI SMMU, rather than by having an extra
> > SMMU just for them.
>
> There may be several reasons for supporting SMMU on sysbus:
>
> Some embedded platforms may not use and don't want to include a full
> PCI subsystem, but still want IOMMU isolation with virtio-mmio.
>
> The other reason is to emulate existing SoC platforms. The model may
> need to be closer to real-world HW and SMMU is widely used outside the
> PCI subsystem.
>
> One more reason is Remote-Port devices in our case, currently ongoing
> development here:
> https://lists.nongnu.org/archive/html/qemu-devel/2025-12/msg02121.html.
> Those are platform devices which are emulated by external services.
> These devices need to perform SMMU operations for DMA transactions
> when they are bus-masters.
>

A gentle ping on this series.

Hi Peter!

Do you think we can continue discussion on this topic?


> BR,
> Ruslan

