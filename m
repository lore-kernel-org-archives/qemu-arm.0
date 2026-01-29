Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ED0D6B06C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 15:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlU7W-0006kb-Bl; Thu, 29 Jan 2026 10:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vlU7V-0006jT-15
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:39:45 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vlU7R-0007pE-Rb
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:39:44 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-4094f6f4b7bso391728fac.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769701180; cv=none;
 d=google.com; s=arc-20240605;
 b=IdgSMuKvoiVYDur5UXqP4d3WapHM9IawJxbl0NUkFou+J/feX1uAm3yKcELo5/xzGf
 LSYFpEX/s4NC0mIt02CavSkEBj2rcqKNgcLR3ovRmVvoEOJyyEqZQOvlVCVrC4tn5J6h
 d4uuw4NBniQLVDwWmgiC/cujnSSyStKQ+/1F6V/4BDlRDYpHFolrra1wOuTRLhODs9o8
 zRUIUn5ohdgDKBhVSysWu1E/hIRTlV/iY9aMpN+Kxcs2QyHZh16bqZkn+FFpcY3YUhgz
 k0KZ4f3INxUrC9qEHE9npHpCbeM/BUrL2UIMF/0CoO9/B4JFF76mC8hbptfFc1O7D/XJ
 cZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hEmJ1d08zjU19RtyUfXQra+AqA02eeUaggV6EWhQ9Cs=;
 fh=OQo/JUzp017a+SvOrZmJAyn7kKeYimNr6LETaAa2Pos=;
 b=hKEphvD7Cd33WO9BF7BPHjU1bjpztE+uUOQcJnpOiglASV2C+OlcUe3qwAf1Qg4kxl
 43LGXnn1M1PzCHUVdyG/IDjnKDu6rF7BscWidrKir338uqTQOKMZ/6qpl67r4vNF0ft0
 /x6ITJl8ch1n0aGtVBpNCInY7q3QX7bbKXdyJUu/0CE7m78NucKjV10llv9DiXkrgxoq
 xfqrgsJ3SKxpo332/1MXNknKOnM1dDmMhdUwoOJ3CDrbLPHQctIKrIylWAVD3w3a/G0B
 wzm0oLPKj2o6EJv9Mmy7agzNyIue1Jo1XbSPP9Tf4KWLedly0+gR8+X1W9hdwbNbYfEe
 g5Sw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769701180; x=1770305980; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEmJ1d08zjU19RtyUfXQra+AqA02eeUaggV6EWhQ9Cs=;
 b=cqq9ag411GWmB4yOVyNQRWXQY7yu4JAanIAXBt0GqkekqQWH2+pd2Gaug9VVmf8dZK
 UPI9cNNnGkl1r1TmqE75HPPecLwRG5Jt7jigoLupJ7RVsxHCPdVLcs4d18YF7u52af0R
 8dwZ/MJkIVWM48QR5SbQGBdVciSybBBt89I7rSug0PutkwICuwhTyCT2PA6Pl1Jdrdxf
 Ys4X92Cxme1cN436fDDxDhhUuguk7dQRwsCnQHSVh2UenOcKRJOiZ2DrQpnug9fhy1h5
 AkFJ5b3HfZXi3CcyLZULjdW5jdsDGE+wgB/xhrCD0BqCsMla6cxs0U2NLJkFI2/fT460
 bqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769701180; x=1770305980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hEmJ1d08zjU19RtyUfXQra+AqA02eeUaggV6EWhQ9Cs=;
 b=X1xOrD88g9h1h8OeAZ4ANJQsQSmdiu5ALy/UFFkeMGHuRjjAmZRfU4gj4fYrRzdIT0
 iTIb2IeHzi5onQtBpPlaRnDxesY5jNWQ+Nra36jcTM2hlN0oxatyLLukrTxm23dt2jYj
 HV91D6pVT/Mgg4xXbbgFgjWS0lLfWIMWpw26vako+0+w2cXpw7sACF2XUF4t0mSBGqT6
 7JR7++Ueh7jCXF8nfyKtCh9e3P/PXSiwS0WFNzYii9qtDLPxn5fKXCgJblFfx2RhaaGk
 cMiTWFSfhP3L/OM4QZ3aPIJMON5L7WAVoi2s6spAxxuUZHZb0gZwP8pmE2Nv87nids6H
 57Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6YbnSUODyGoqGGENg+XmsWCilXFtbps6JdVP//tTXIGxCg4IHVBXhqiX6MAPvRUxPQznNS1HWA==@nongnu.org
X-Gm-Message-State: AOJu0YyStSeCIwyqmUzG4FJofBRuUD+N+qvVNLTJW9A/f/j0ivncDdCs
 KxLCoZLSxBuzdwoiKeWPx1MhxCWssqqSxy7rxaJ7GloNEZsOjb8CyhzVCGr3tPG2Bp8P7U0P5HM
 EEDF9vwqCJcY6BXIaQhsaFWCmkMYCGHI=
X-Gm-Gg: AZuq6aKtQgSiOjpdvsihOTF/3AqWyoTae6DLCWgt4Winrqup2I2b/5kc9akY49grnY6
 tclSUVB9orYBdcIjcDzbVYLxDEn3xqUSBeUDTpkDOGwV3U9zAIcj5RSedqROLpVDblWD29ZXOOK
 zxfJ0AMcM96hdRM8tlXdfANWkPWaXBUp/7JP4EuoPMCf213lgKTEXMGd6NV/duas1cngbQvVDHq
 tOHvijOSXCYSNxdcusYXvyWYKcmKYibHvtD/yBmIgAFNzknRGvoEpN7cVp75mLBnDWw402i
X-Received: by 2002:a05:6871:5209:b0:403:f8ca:3fb2 with SMTP id
 586e51a60fabf-409a6b1ffbbmr12735fac.17.1769701179796; Thu, 29 Jan 2026
 07:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
 <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
 <87ecn9aas7.fsf@draig.linaro.org>
 <c2224358-ed7e-1bb9-5eaa-7ae1bafdb37a@eik.bme.hu>
 <87zf5w8v6h.fsf@draig.linaro.org>
In-Reply-To: <87zf5w8v6h.fsf@draig.linaro.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Thu, 29 Jan 2026 16:39:27 +0100
X-Gm-Features: AZwV_QiheFmo0aORK03owPFM5M7xA_04Aifxg1FNMYA77eUAjCc6vPEOYoUA14o
Message-ID: <CAN-aV1F5SjqBw-OP7v68mOAy=3+53HgqjBCrCOUAwTMHUUJAHw@mail.gmail.com>
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oa1-x36.google.com
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

On Thu, Jan 29, 2026 at 1:23=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>
> > On Wed, 28 Jan 2026, Alex Benn=C3=A9e wrote:
> >> Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:
> >>> On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell <peter.maydell=
@linaro.org> wrote:
> >>>> On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
> >>>> <ruslichenko.r@gmail.com> wrote:
> >>>>>
> >>>>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >>>>>
> >>>>> This patch series introduces new ARM machine model, arm-generic-fdt=
, and the underlying infrastructure required to instantiate a QEMU machine =
from a Device Tree.
> >>>>
> >>>> I'm afraid this has been a feature that has been suggested from
> >>>> time to time, but which I don't think is workable in general.
> >>>>
> >>>> Device tree files are designed to provide enough information to
> >>>> the guest kernel to allow it to find non-probeable hardware. They
> >>>> are not designed to provide enough information to QEMU to allow
> >>>> it to create and wire up all the hardware present on the system.
> >>>>
> >>>> There are specific niches where it can be made to work -- I think
> >>>> Xilinx have or had a setup where they were generating an FPGA
> >>>> model and a device tree and a guest kernel all from the same
> >>>> single data source, so they could put everything necessary into
> >>>> the dtb, for example -- but I don't think it works in the
> >>>> general case. As one simple example, the DTB doesn't generally
> >>>> have any information about how the Secure world works in an Arm
> >>>> system, because Linux doesn't care about the Secure world. It
> >>>> also doesn't usually have information that the guest OS can
> >>>> probe for itself at runtime.
> >>>>
> >>>> There has been periodic discussion of more flexible user-driven
> >>>> board creation, but that has generally been with the idea of using
> >>>> the QMP monitor to orchestrate creation and connection of device
> >>>> models.
> >>>>
> >>> I agree that a guest Device Tree is insufficient for describing a
> >>> complete QEMU machine model.
> >>> However, we separate the guest configuration from the machine
> >>> definition. The -hw-dtb option allows the user to provide a
> >>> QEMU-specific system description.
> >>> Those hw-dtb would not be passed to Linux Guest VM.
> >>>
> >>> The fact that this workflow has been successfully used in production
> >>> by AMD/Xilinx demonstrates that FDT is a feasible format.
> >>
> >> Where are the extensions to the FDT used for hw-dtb documented? How do=
es
> >> it deal with PCI devices and the Secure world?
> >
> > PCI devices don't need to be included in a machine description as they
> > are not part of the machine only the PCI host is. PCI devices are
> > plugged into the host with -device as with boards defined in C.
>
> But if we are talking about a general purpose HW description DSL then we
> do need to describe systems with embedded PCI busses and soldered on PCI
> devices.
>
> > For
> > PCI devices that are instantiated by default on some machines
> > including a node below the PCI host should likely work. I know nothing
> > about secure world, that may need some extensions but fdt is basically
> > describing objects and their properties so if it's one or a hierarchy
> > of QOM objects that needs to be instantiated with defined properties
> > it should be possible to describe it in fdt.
>
> OK - hence I was asking for the documentation for how this is done. You
> can't just assert that anything can be described in DTB because its
> original use case is purely for OS descriptions. If we want to explore
> this series further then I would suggest including some hw-dtb's in the
> series to replicate some of our more embedded machines in the next
> revision.
>

Sure, we can consider more functional examples for the v2 patch series.
Would you like to see some specific machine constructed with hw-dtb?

Also answering the previous question regarding Secure world.
We can define parent nodes in the FDT that represent Memory Region
containers, which are then mapped into the CPU's Secure Address Space.

Any child devices defined under these nodes in the FDT are automatically
instantiated as subregions of that parent container. This ensures they
are only visible to the Secure World.

> >>> In contrast, QMP usage may end up even more complex and less
> >>> maintainable for the task of full system modeling.
> >>> To my understanding, this would need to generate too long configs,
> >>> which may eventually require some intermediate format by itself.
> >>>
> >>> I am proposing to use FDT as a serialization format to describe a
> >>> machine configuration. Theoretically we can use other formats, like
> >>> XML, but in my opinion FDT perfectly matches the requirements.
> >>
> >> The QMP interface is self-documenting and introspectable and used for
> >> the management of QEMU including things like hotplug. It is also QOM
> >> aware so a natural fit for dealing with the underlying QOM machinery.
> >
> > QOM seems to be more about operating a machine rather than defining it
> > for which fdt is an already established common way.
> >
> >> Previous discussions have entertained the idea of making the parsing o=
f
> >> hw-dtb an external script which would then translate into QMP commands
> >> to build up the machine.
> >
> > That would be possible but it seems that directly parsing fdt in QEMU
> > could be done with very few code and with some additional support from
> > devices the latter of which is probably also needed when trying to
> > interactively define a machine from command line, monitor or QMP.
>
> I agree QMP would need some new APIs to support this - and also have
> some examples of how to replicate the existing machines over a pure QMP
> interface.
>
> >
> > Regards,
> > BALATON Zoltan
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro

