Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429BD29C2E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 14:57:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhqgN-0008VX-J3; Mon, 19 Jan 2026 09:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhqgL-0008St-9z
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:56:41 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhqgI-0001sU-9c
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:56:41 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-78fb6c7874cso47020787b3.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 06:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768834596; cv=none;
 d=google.com; s=arc-20240605;
 b=DD/vcExFQpE6XxXydUsvRjTvTj+E4GA4nDKGJOTowA3s2F56JU+G3NRqNjfizrSG/G
 2OABKeaZHFlp7/w7m7NryxOEhyOMR0d3Oodf8MZ6Fpzf8ES3QBQPZwhw5M8h1e0ArWWZ
 aAaxqEGYz4aDnS+hmgwOP8twBKJV1RD81IgKCZKPdWkOwXsH05I48I5XT6e596AkeaDs
 ojB9zLXAZs8JKFzxxs02rRlbYOYrCwB0swagxhNkCwJNdEg/yuHFK4Tb75nsq6C3XjHy
 uT5nGvLH65KB3vFXVBKMxK9jGw9uMWNAA3tJIkb8W9oTZzlJSK8By10oIjaO8kaw9uPG
 3/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PV3uDDHeBQqQAA+JqObzoR5c3i9CNy2IcPcrQh2YKDk=;
 fh=dW7qvJU/Zdnq6eQX5xttBWNfVbF5QwVn37iAYaR256U=;
 b=D9HZT1xf4UyYc/TOz/J04A4+tDDFZh133oBPA56x0gdpKVzvh1DSde5SajLgQppg2C
 +ziNsjIA2GiCPFk7o0AA8IyVmwuHF0lxkH+eGt/idRl7ynfr0MB/GdjzFRcpVZhXz2M4
 NcFLD8hIm27M9iTHoBEIl41R6o5dSfMZDwRqwtIN65ec0vKPJERvW570aoXZjHeDCTBX
 eEcHS0+K39M3ehc4G1GzVdMiKSdJ0jAHawxZs6KlMf3Ozgnj2qIabOxpf8fS4WE9zBrX
 hG0XtfnZyXlYAFR+1Dijk1cldgOsS2hck00W7FVIBPKh8D1hw+1jpEKkTNB/Z6L9rx3f
 41zQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768834596; x=1769439396; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PV3uDDHeBQqQAA+JqObzoR5c3i9CNy2IcPcrQh2YKDk=;
 b=CZDRoI2b3ddzfpiPyRuSQwdJzv+Al2w4/7jx1WQpIFEVUSCXJd3MGmitRFDQVlr3Yp
 XNUodPQutlzSipPj/Qk3f4vRuO+TN524yKbX2oo+PWMmsKrrvVn8zO5OIH6nC7dWy95F
 DY3C5LxGZ78XUwnF8RLO5J1+DvH50uJ7sU5P6bLNCLJATt4CE4cBjtdWcq4jh9sC/SFQ
 QuJLNkjNwfT+Ki4n5IwCTLlqMBzt2vjag3yU6yxPucexh4t9zpBq1RSUPvJ9kF7SKoVG
 07fGuHHHMWFTn27ge/Z0cYhXdOLkHRxGlASyEyOXzmfW04H11uFJJdwP/gKnEoQUYAnx
 YMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768834596; x=1769439396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PV3uDDHeBQqQAA+JqObzoR5c3i9CNy2IcPcrQh2YKDk=;
 b=FSG37Fafv1/iVqadgr9uxgwZgnEsHGNwDaD1qFQz+DGWhqx5soYngvcr0u/V6ilTUK
 sc/5PkxLPlIt5yHEx5Q9N71qZJ+AfM8OKP2dxqqYQ0OpwRCXhZ2W7z+k9GTxqHyy7sIk
 /Sim3Ju5hMEKPeI8Wgc8S/p8o/hS1UDrevnLWrahyl3o2/Kg/JK8sBeCdBd8pfoYATUB
 ihJvkadDrF+0z889TwYwUqMPqeJ3zY7kiZ5MwdYeB5F7D4/GLwTG0TsL068E/XxRHqu2
 TYGGL0a1CPpBC/jjaBCuJ84/bpH5Gc0mQccaj6LJuQwhC45xAttylPzlMz+TDFY8W3oY
 5UhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdpLueOUdM8/BE5KzqXSoPzg2Eh0F0ZmmwsSZRd/cXnmG82iXiqwMwzna7P2+Zd4TK5/Yr6Tnzlg==@nongnu.org
X-Gm-Message-State: AOJu0YyLvrrNxNh4Xw2RCFyWwEQhJPLCT50XzgvfH+71zM8tItdlw4LO
 iWEwcH1dEOnhD5zveKO7oOSHXasMWpkO4soG7ThJCnEdJtDTQxhMlYNA5yKQdVDvkUu2z90gZuw
 f8+kMj8bX+m/rRZ1jjSTPUQ2vcTMbLwRf6JUkJsRY8Q==
X-Gm-Gg: AZuq6aLfHWCR98sCqD9b1wdGGPEE0vG8+BCuCld3/BpBGNAblx1a1/HSG6CHvzw0Rmx
 0wekAvTZjtU9InRpK2nyN1UpS8fp1SJ6QeRGi7lRIKi/xqjxw81yeEvYscuIoBc+Bg5lMKo0Zr0
 Re8qnzbWARBE7+9qX2bi4uT8oi7evAx8W08pBlPMv5Pr+VrH0V6dSm0swVFEURsRRj5sUmzdxfa
 ggdChlgoMHbZB+v6wfVBr6Zq8x9UvtnLaMRwBp80KsrlWdcmNHvOrULvpk1kRzXPriMOQ==
X-Received: by 2002:a05:690c:f8b:b0:793:b660:fbd0 with SMTP id
 00721157ae682-793c66ac1b9mr87298607b3.10.1768834595674; Mon, 19 Jan 2026
 06:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20251219222439.2497195-1-ruslan_ruslichenko@epam.com>
 <CAFEAcA-VYhtvXK5tyVJWfskqqKFim43DsKfWrpaMxteWueR6aQ@mail.gmail.com>
 <CAN-aV1FsbAp3JrqoPgz+c4ORayBjsGxTLWOkDMc0WyE2nD-aZw@mail.gmail.com>
 <CAN-aV1ERa6uE9U8cPArmXCv+WOJhP7ZgGAF2VEDaAEbiebyawQ@mail.gmail.com>
In-Reply-To: <CAN-aV1ERa6uE9U8cPArmXCv+WOJhP7ZgGAF2VEDaAEbiebyawQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jan 2026 14:56:23 +0000
X-Gm-Features: AZwV_Qh3V4FzOo6fHkjykc-p0iSV0FFIVF6w4bt92UQoQMe1xA08wc4CK13j6ec
Message-ID: <CAFEAcA8D19toNxsLsRcSoLgBAGVnV8OXWLP41m7aTLsNSw++PA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] hw/arm/smmuv3: Add SMMUv3 sysbus support
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: ruslan_ruslichenko@epam.com, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 19 Jan 2026 at 14:42, Ruslan Ruslichenko
<ruslichenko.r@gmail.com> wrote:
>
> On Fri, Jan 2, 2026 at 4:36=E2=80=AFPM Ruslan Ruslichenko
> <ruslichenko.r@gmail.com> wrote:
> >
> > On Sun, Dec 28, 2025 at 5:59=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> > >
> > > On Fri, 19 Dec 2025 at 22:25, <ruslichenko.r@gmail.com> wrote:
> > > >
> > > > By SMMUv3 specification it can be attached either to PCIe Root
> > > > Complex or regular IO bus devices. However, current
> > > > implementation only allow to associate with PCI bus.
> > > >
> > > > This patch series add support to use SMMU for sysbus devices.
> > > >
> > > > One usage example implemented for virtio-mmio, which allow
> > > > devices to perform DMA operations SMMUv3 with address translation
> > > > and isolation.
> > >
> > > If you want virtio devices behind an SMMU, why not use
> > > the PCI virtio?
> > >
> > > The only SMMU sysbus requirement I'm aware of is that for
> > > RME we will want to have things like the GIC do GPT lookups,
> > > which is most conveniently done by having them route through
> > > the existing for-PCI SMMU, rather than by having an extra
> > > SMMU just for them.
> >
> > There may be several reasons for supporting SMMU on sysbus:
> >
> > Some embedded platforms may not use and don't want to include a full
> > PCI subsystem, but still want IOMMU isolation with virtio-mmio.
> >
> > The other reason is to emulate existing SoC platforms. The model may
> > need to be closer to real-world HW and SMMU is widely used outside the
> > PCI subsystem.
> >
> > One more reason is Remote-Port devices in our case, currently ongoing
> > development here:
> > https://lists.nongnu.org/archive/html/qemu-devel/2025-12/msg02121.html.
> > Those are platform devices which are emulated by external services.
> > These devices need to perform SMMU operations for DMA transactions
> > when they are bus-masters.
> >
>
> A gentle ping on this series.
>
> Hi Peter!
>
> Do you think we can continue discussion on this topic?

We would want a reason that applied to upstream QEMU. If you
have a platform that uses this that you're modelling upstream,
we can think about the SMMU parts of that at that point.
At the moment all this patchset does is let you put a
virtio-mmio device behind an SMMU, which is something I
don't want because it's a pile of extra complexity for
a use case that is better handled by using PCI.

thanks
-- PMM

