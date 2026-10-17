Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F5CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 15:16:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI69O-0001x4-2f; Sat, 17 Oct 2026 11:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xI69K-0001wf-Sl
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:16:43 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xI69H-0000Eb-Nl
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 11:16:41 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8ac525c1f05so6146757b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 08:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250198; cv=none;
 d=google.com; s=arc-20260327;
 b=XzI/nrHrNjihb9/Qqi8MNfGmBJrV4PfeCNJ4thV1hCKMRqmgbUNn38H961VP1eSLyJ
 Bj1h09t4boR1iQfiUt7+iKgtqeOB/wwJQEq8lWy04xdbbVT7F+rEtmiYfD0LzOT3QwQa
 cPSyGvhYYmIcRZjrfS5P49MIaYg1cIbo/KWTBVNuYjqNhCFGuBefdluq9nDiQ1b5WLWP
 t4G43htcS1LZln1m9ATT1GNN47XyJdwxMVsyn+yd5VR7yFpcGL8By6C6iyUe+UZzow15
 VtD8r5TF+fLMWZ3c8PcW+kOGrr5InywI4CcejeJn7OZM2Nrgajq6OaAZvc8NoLkb/U5F
 Kouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:dkim-signature;
 bh=maaAqlgh83vcmnpfx6TsWNN/WbZcgj0cRWJY5xLvsdQ=;
 fh=vgVSfzLf4xceDPqB7JhBxqkoPRBs93r8XOlhg1XilqQ=;
 b=eIdnqJc/8oF43uFpAR9EyqfV9SSRF03zi7qMAN90e5x6zcp88c/73wFfB2mJLAbr3v
 xv5qNVtdI8qFuRICehw2+eJOWQTZRd8P6Zr7t3dmIaqCg+Efz6KBsqFoFnZ1wWMxcSTu
 OVZ5t3Nq9y/i5/7pmu1NWIxn4vcO7ehS2ObNypqGs0GXfwZuNQmO000JY27pLqvEYNQm
 oLlLYTCBdPxEpQ+D1AvxygAMUalbTOQWpFnzfmKjbNhcssfCH7KWV499c9CdpZIOG4hW
 CJgM0XI7Qrcz/Dg/vyvn4eQI28YVM9VAIKu2LyjBoYRD0KjIG1qb1AdOXjirg1l5leWJ
 U7Yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792250198; x=1792854998; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=maaAqlgh83vcmnpfx6TsWNN/WbZcgj0cRWJY5xLvsdQ=;
 b=eaCqrZDtNNR07euLHrEgZtO17BLN/hDDrhCQtaGCdRAy+VlvH9l+gemsy1ppDJZMLw
 MKdsrv0O4wtjr9y6WoFKVZbzsSJH62EGE9+czJ8W/8DjiSp9fPiCsGys5ne+OPO/bHL6
 7fuw46gDAsU6gq0H/9Wx7rmDQkmcm+++Ew6f0IVma887v4hMYSXesbdGlIfur/+hN98d
 6W+bepA9CrcHHDnBiUOqc9LQ+JdR5blBVfM/C3LZSae1lFOC5l6XR1UWJ7KfkX2Su55X
 b2r/rFgc+esRxu6cFwGCqMKy0TcUrCZOth5Mng7G4+UDKj9YC3rJ/4+gIoSpAK+DGAtK
 5K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792250198; x=1792854998;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=maaAqlgh83vcmnpfx6TsWNN/WbZcgj0cRWJY5xLvsdQ=;
 b=KR7JjodR05Ia5BxLFvWOAAdXNpJ+hYLrRd0bsXmEGiZK9+R26JPrr8SO8mjlBxxJCJ
 F7HgLjzEUlEdXEhRaLt/NvkyrciJAT6kV1uXTxMeCmJfMrrJS4qNXqSwwEu9LIxw2TKZ
 itZlRk8QNM9h8wVDSDObO3tA45P46HL36uYTwQ9CROvLgjO1XcUM1pQGt4gxYFfcknuh
 3Do3hapzVuCcxtOne94Lvvp88rqzYlZernSmZirmg6mkNVxjJLEtGgRO2pNa93HAshdr
 2zQNQjHyFK7nuWtLfcBLjBH9DJfHjrZNPyIXWG/Z8CrU6Uj6QwAuUFCzgTZEww6BFRxs
 ruqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRPNbkyI8UEiXzVMlAEB3tiVXVVmQ9aEdV9LFlcp7gL6QeKDd1fyHHM/rx3KG+lsqaZDNVzm6qsg==@nongnu.org
X-Gm-Message-State: AFq9FYKOrj9rNDkQmHmLvw41mAFTut9dh5/0KDhFYM1dIsvFchpkwicB
 9ezugaWKiZq+IO4jf8uzPDJLAcYdg0muiDwlVy2AZUmBlJuIvCPQ+kzx+zLdtBQA2RqLvbM0z1a
 bvgNbcHKuIVXFZ5f7PsMxN1WAfIuCCqI=
X-Gm-Gg: AYBFou171ctUXv3Y4S9WGYBVIDgRIvuTZUJZEKUfOzHcwuTAxGVywQsnx6top3xJmpz
 olB4+98kT874HpLljasVWEylKR2q7kr3SNOP8p9WtooQ9jHH7eS+iRJknFuz62JYKSUFHfCIFqP
 D0nNyMzrqlBTbFXxSokREpQugYiEEevZeRt30hn0UBRmQNg7uoDIiWMqz43e3CBZ2JuG//u1gxp
 n4J2mItbtprNWEKwa7p2v824GuEWcmdp3p1psyLdfD6efHuQ10Rr51yOvqGOtoZFXTF4rHFURY7
 R33a4S651ItMxuuZ8GEi+HhhgR/1LXtSb0g4/at5Af/rJVYjE/wocxa1eEvU83rGvqHAPsutlNI
 diCsjx/2oDs1gHRqv0ANXdpu1ZWGpSHnzUtrQhU+hlnZBRAThNQ==
X-Received: by 2002:a05:690c:c512:b0:8b0:e030:8999 with SMTP id
 00721157ae682-8b0f2140293mr12299287b3.19.1792250198367; Sat, 17 Oct 2026
 08:16:38 -0700 (PDT)
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 08:16:37 -0700
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 10:16:36 -0500
From: Marcelo Manzo <marcelomanzo@gmail.com>
In-Reply-To: <CAFEAcA85iTUU=Pf8h-Ojc3jiBbW44V-1XRheVW=JqN-4xNLc=Q@mail.gmail.com>
References: <CAFEAcA85iTUU=Pf8h-Ojc3jiBbW44V-1XRheVW=JqN-4xNLc=Q@mail.gmail.com>
MIME-Version: 1.0
Date: Sat, 17 Oct 2026 08:16:37 -0700
X-Gm-Features: AclHuK97vYZWIUo4wythsN_IAmCNHFzwyBOrTwm2dZXqnRhE1JpkdOaZzM1a314
Message-ID: <CAGaQodL0CNKahvtmSj3ssbZpVdXZEEZ_oR=Pcbr=Gnh-jUmaWw@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v3 15/16] docs/system/arm/raspi: move PCIe/GENET
 from missing to implemented
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: multipart/alternative; boundary="0000000000006c21de065e0ac499"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=marcelomanzo@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000006c21de065e0ac499
Content-Type: text/plain; charset="UTF-8"

On 17 Oct 2026, Peter Maydell wrote:
>
> Does the system end up with the "msi_nonbroken" global set to
> "false" or "true" ?

It ends up true. aspeed_pcie_rc_class_init() sets msi_nonbroken, and
class_init runs for every class at startup, so any qemu-system-aarch64
has it set whichever machine is selected. That's why qemu-xhci ends up
with MSI-X enabled and needs msix=off.

thanks for the R-b
-- Marcelo

On Sat, Oct 17, 2026 10:24 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 17 Oct 2026 at 14:31, Marcelo Manzo <marcelomanzo@gmail.com>
> wrote:
> >
> > On 17 Oct 2026, Peter Maydell wrote:
> > >
> > > Do you know what's missing for the MSI support to work?
> >
> > I think it's the controller's built-in MSI receiver, which we don't
> > model.
> >
> > From the Linux driver (drivers/pci/controller/pcie-brcmstb.c): the guest
> > programs an MSI target address into PCIE_MISC_MSI_BAR_CONFIG_LO/HI
> > (0x4044/0x4048, bit 0 = enable) and the message data into
> > PCIE_MISC_MSI_DATA_CONFIG (0x404c). A device's MSI write then goes to
> > that target address (0xfffffffc, or 0xffffffffc if the inbound window
> > extends above 4GB) with data 0x6540 | vector. The controller is supposed
> > to catch that write, set bit <vector> in its MSI_INTR2 block at 0x4500
> > (STATUS 0x4500, CLR 0x4508, MASK_SET 0x4510, MASK_CLR 0x4514), and
> > assert the second interrupt of the pcie DT node ("msi") towards the GIC.
> >
> > Right now none of that exists: the MSI_INTR2 registers are plain backing
> > bytes in regs[] with no status/clear/mask behaviour, nothing in the PCI
> > bus address space claims the target address so the device's write goes
> > nowhere, and the "msi" interrupt isn't wired to the GIC.
> >
> > I think it needs a small doorbell MemoryRegion in the PCI address space
> > at the target address, the INTR2 register semantics, and one more SPI --
> > on the order of 100-150 lines. I left it out of this series since INTx
> > covers what I've needed, but I'm happy to do it as a follow-up if you'd
> > like.
>
> So if I understand right this is because the SoC doesn't implement
> MSI interrupts by having a GICv3 ITS or a GICv2m, but it does it
> in the PCIe controller ? Let's get the base support in before we
> think about implementing that. (The aspeed pcie controller also
> handles MSI interrupts, so we have some existing code models to
> look at if necessary.)
>
> Does the system end up with the "msi_nonbroken" global set to
> "false" or "true" ? I think since we don't have a gicv3 or gicv2m
> we ought to have it still at its default "false" value, but if it's
> false I'm not sure why we need to explicitly turn off MSIs
> with msi=off,msix=off.  (This isn't worth spending too much time
> investigating, though.)
>
> Anyway for this patch
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>

--0000000000006c21de065e0ac499
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div dir=3D"auto">On 17 Oct 2026, Peter Maydell wrote:<br>&gt;<=
br>&gt; Does the system end up with the &quot;msi_nonbroken&quot; global se=
t to<br>&gt; &quot;false&quot; or &quot;true&quot; ?<br><br>It ends up true=
. aspeed_pcie_rc_class_init() sets msi_nonbroken, and<br>class_init runs fo=
r every class at startup, so any qemu-system-aarch64<br>has it set whicheve=
r machine is selected. That&#39;s why qemu-xhci ends up<br>with MSI-X enabl=
ed and needs msix=3Doff.<br><br>thanks for the R-b<br>-- Marcelo<br></div><=
/body></html><br><div class=3D"gmail_extra"><div>On Sat, Oct 17, 2026 10:24=
 AM, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.ma=
ydell@linaro.org</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, =
17 Oct 2026 at 14:31, Marcelo Manzo &lt;<a href=3D"mailto:marcelomanzo@gmai=
l.com" target=3D"_blank">marcelomanzo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 17 Oct 2026, Peter Maydell wrote:<br>
&gt; &gt;<br>
&gt; &gt; Do you know what&#39;s missing for the MSI support to work?<br>
&gt;<br>
&gt; I think it&#39;s the controller&#39;s built-in MSI receiver, which we =
don&#39;t<br>
&gt; model.<br>
&gt;<br>
&gt; From the Linux driver (drivers/pci/controller/pcie-b<wbr>rcmstb.c): th=
e guest<br>
&gt; programs an MSI target address into PCIE_MISC_MSI_BAR_CONFIG_LO/HI<br>
&gt; (0x4044/0x4048, bit 0 =3D enable) and the message data into<br>
&gt; PCIE_MISC_MSI_DATA_CONFIG (0x404c). A device&#39;s MSI write then goes=
 to<br>
&gt; that target address (0xfffffffc, or 0xffffffffc if the inbound window<=
br>
&gt; extends above 4GB) with data 0x6540 | vector. The controller is suppos=
ed<br>
&gt; to catch that write, set bit &lt;vector&gt; in its MSI_INTR2 block at =
0x4500<br>
&gt; (STATUS 0x4500, CLR 0x4508, MASK_SET 0x4510, MASK_CLR 0x4514), and<br>
&gt; assert the second interrupt of the pcie DT node (&quot;msi&quot;) towa=
rds the GIC.<br>
&gt;<br>
&gt; Right now none of that exists: the MSI_INTR2 registers are plain backi=
ng<br>
&gt; bytes in regs[] with no status/clear/mask behaviour, nothing in the PC=
I<br>
&gt; bus address space claims the target address so the device&#39;s write =
goes<br>
&gt; nowhere, and the &quot;msi&quot; interrupt isn&#39;t wired to the GIC.=
<br>
&gt;<br>
&gt; I think it needs a small doorbell MemoryRegion in the PCI address spac=
e<br>
&gt; at the target address, the INTR2 register semantics, and one more SPI =
--<br>
&gt; on the order of 100-150 lines. I left it out of this series since INTx=
<br>
&gt; covers what I&#39;ve needed, but I&#39;m happy to do it as a follow-up=
 if you&#39;d<br>
&gt; like.<br>
<br>
So if I understand right this is because the SoC doesn&#39;t implement<br>
MSI interrupts by having a GICv3 ITS or a GICv2m, but it does it<br>
in the PCIe controller ? Let&#39;s get the base support in before we<br>
think about implementing that. (The aspeed pcie controller also<br>
handles MSI interrupts, so we have some existing code models to<br>
look at if necessary.)<br>
<br>
Does the system end up with the &quot;msi_nonbroken&quot; global set to<br>
&quot;false&quot; or &quot;true&quot; ? I think since we don&#39;t have a g=
icv3 or gicv2m<br>
we ought to have it still at its default &quot;false&quot; value, but if it=
&#39;s<br>
false I&#39;m not sure why we need to explicitly turn off MSIs<br>
with msi=3Doff,msix=3Doff.=C2=A0 (This isn&#39;t worth spending too much ti=
me<br>
investigating, though.)<br>
<br>
Anyway for this patch<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000006c21de065e0ac499--

