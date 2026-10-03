Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1108CA5FDD
	for <qemu-arm@archiver.kernel.org>; Sat,  3 Oct 2026 04:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCrD8-0004nS-B4; Sat, 03 Oct 2026 00:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xCrD6-0004nD-Kr
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 00:18:56 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xCrD5-0000Fl-2h
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 00:18:56 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-671563fb8beso129468d50.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 21:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791001133; cv=none;
 d=google.com; s=arc-20260327;
 b=a8i14Mfa3ISY47aqYcexuA2dnspNJerFIZlwF8VhNY0Inw4+j8sNbjdS5q4EWgp99Y
 S6lSxNTT8H7nCY04I24FlDmwevB5WlrihUdmhasD2ZrtbdppNTgNuOIS2opbN1sLlu3l
 txM5qPTcHvZG/KCeGRNgNbhSWy55z4w2+ghTE/jOTC8aJWVW/Xfeaqz6ejAIbwP4hX8S
 Xn6gfu0jIKufGJnrvUVoEPqt0ibqHCRjT7Adut4eliKEpJ55TpVW7W3K/wkpFHTOm3z7
 0Xw9SWmblRvbYbeX4gvj2ZqLdRM6dduyIgk7iNYZSc6gojx7PHuLFlL7y6fXVkiLnS0m
 BCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3W98YOUyb323d6w7Sew5w2q9CviWlMY/DBh/jjeDhSY=;
 fh=NME0xS03Omj5t3y4eNClU0Nra9ktgN1lsavFSCHv4IM=;
 b=Jq+G0IrX1H7f9NCUWm6JIpV+YLt3kJyDmuhOedB/FnRhOZ+VHVRe+57pN7dLrPAGnn
 K0WlSIRDCWiy0ZIXhmhBnxjxwRC9qgrlugARCKMMP3Xfp2VvAI+E8moIPSVMzqQhSHmx
 4+dKGLq43xpwnVou55DS0cbXWzh+BeqFSAOmxcfeTt4WqxfzlibLPi67oo1QQX15W1NU
 p1fXThPniCErnjpfoMEuJAWehWg1v6U3bfBSg1/dGi7/BZVshjhw4KkFMlW6k7+QBnjs
 rZqA5iaVBWlyrC2WTk6fequetbRP4llX2n6n0rJTumWE74GlSNbm5hh3iXUE/OVL+uUl
 vwZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791001133; x=1791605933; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3W98YOUyb323d6w7Sew5w2q9CviWlMY/DBh/jjeDhSY=;
 b=fYeLiO5h+9/iB2AmRWZHU0WpThVz+oY8OaCXnEd7zqbzApxjgPSXFALf5sKyOTbfSQ
 qlZ4Prkss2zcQwZyYmrQglzXxQ34tw5RdcNg7sQ9SqqZnhc9yXJCdU8N15xF7m2hmoVJ
 Mm5c0eN0O3+g0MinXlIWvy05E5G6SDUAyCwy6o32tVGo/qHeiPymKB6jwKT77zfJz52/
 MHEyAdsgCZUvmJpjSVumTgvotVXRn4wz52C9+0/ZLOMybZcIJzi5ioO+9RFSLjfJu/hN
 mzcPdNpG31PuB8OFOrN5sGiQ78YmAiRy8DJHVL9EXJsBKHgIXvrRLoxU1FVC0O6rbvVY
 IlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791001133; x=1791605933;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3W98YOUyb323d6w7Sew5w2q9CviWlMY/DBh/jjeDhSY=;
 b=EIVD+8lOT8gsF0zdvG2G1STP2gRCUM9/hUKk7k3TJdRYFeM1ENvTLNDWTjrdGPykTw
 qcRF+S2J4Hg4xXIYb0iy4F5WRLqEsf6SDmgmpO0X1MkDEKBWu4w/RWvWlf9QIwOAde9J
 0fBAvUf4P0b0P7+mW2Ch75jQd/nDY+ZgE7ZxDAQc/pnT9Q9BDBikmaLUsZc8L4t73SQy
 Q907ySXnxZnzSoX0zCP87KB320c2nc9X+RekyLX4y6hV9d2BulAT0rj3SWE7kAE7Y73T
 D7viVIhZHy9gnV6YqeQ3jl6c9PVlR9iyXqsYjtBoVaWl2v8tj7of9PuKQKOOshrTGE29
 glVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8FTqBTanB2sfGq5IcgTg/KCpQOh+B/T3FZHgTRlH6aqclENBvnpGOQx85B3jaI03bV5wYzFceRw==@nongnu.org
X-Gm-Message-State: AFq9FYJWhnNUGEivU86Jh6piZE+zDrDTg4plCfdK2ay37K9jmHtA4LPC
 +TaPp5Eic4AEftDkRp9mj2pqNzPnN38/GW7Ngd1rheSA1o02KIshVqq76DZi97LH/zjcLSHyNMI
 0cooyAuidXkMhT/qqM4MAr879Z42+BnA=
X-Gm-Gg: AYBFou1KOzDxF6MDpcmty0CJ1OFSC+s/Ek2XtVHwZcG+m1mPCUi9nSDMO2LZQ7DOfxV
 l0FHObRLMptPnmP1h1oZZ8erMj9pzy6qLS2OuEmzvt6DVAXww+3oydUlI9U/krniV3IQvVidP1y
 M5P0hGLcWQgOtAnIdJDrl0Bb6pzQNmLCiWCjoFfYtdINVScggfpt3X1lYeC0ghldswgc0l9aiZk
 4YvqkbZV7mwbyfy78cHUzukDQvy0IWCTF3O83DP7v56M+l4XwCcvbu6wixBzM0r2MAvqngw2otC
 YEGxvcJFKpbSZD34Y3UxGZKfaM6HXE9fE/cquc9qUSuTJ0dTj6VfzsiEj8ka/lHezVa+iGBZgAk
 m/X4Qn7jMNgSzr90=
X-Received: by 2002:a53:d013:0:b0:672:f1e7:d232 with SMTP id
 956f58d0204a3-677abfbacc1mr1969669d50.26.1791001133003; Fri, 02 Oct 2026
 21:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154225.863984-1-bin.meng@processmission.com>
 <20260627154225.863984-2-bin.meng@processmission.com>
 <4c1c01709d9e903fbe93fbce5b901ff959a5a01f.camel@alistair23.me>
 <CAFEAcA8VtORuoLj4p62vj2dGtsawWmaUWUw4dW6vtxn3g5aG8w@mail.gmail.com>
In-Reply-To: <CAFEAcA8VtORuoLj4p62vj2dGtsawWmaUWUw4dW6vtxn3g5aG8w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 12:18:41 +0800
X-Gm-Features: AclHuK9fRmzkwl3tr3x7fPrJSzPM8IlRKHqIrhQdg5PMVRM-6440Pt_AzDRAjL0
Message-ID: <CAEUhbmUN2ifCOnEkrj=AYXzwuyC2R2+cpGzGu4Vdgggn+ZdvCg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: xlnx-zcu102: Fix up DTB for direct Linux boot
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair <alistair@alistair23.me>, Bin Meng <bin.meng@processmission.com>, 
 QEMU <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x11.google.com
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

Hi Peter,

On Tue, Aug 25, 2026 at 5:27=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 25 Aug 2026 at 05:20, Alistair <alistair@alistair23.me> wrote:
> >
> > On Sat, 2026-06-27 at 23:42 +0800, Bin Meng wrote:
> > > Real-board ZCU102 DTBs describe the UART, SDHCI and GQSPI nodes
> > > in terms of ZynqMP PM firmware providers for clocks, resets, power
> > > domains and pin control. QEMU does not model those runtime firmware
> > > providers, so using such a DTB with -kernel currently requires users
> > > to edit the DTB before Linux can probe the boot-critical devices.
>
> > > +    zcu102_fdt_fixup_clocks(fdt, "/axi/serial@ff000000",
> > > pss_ref_clk);
> > > +    zcu102_fdt_fixup_clocks(fdt, "/axi/serial@ff010000",
> > > pss_ref_clk);
> > > +    zcu102_fdt_fixup_clocks(fdt, "/axi/mmc@ff170000", pss_ref_clk);
> > > +    zcu102_fdt_fixup_clocks(fdt, "/axi/spi@ff0f0000", pss_ref_clk);
> >
> > I don't think this is something QEMU should be doing. Modifying the DTB
> > on the fly just seems very brittle and prone to breakage and confusion.
>
> It is something we do already in some limited cases on other boards where
> we don't model all the hardware, for example in imx8mm_evk_modify_dtb()
> we nop out some nodes and make some other minor tweaks. I'm not a
> huge fan of having to do that but it's a pragmatic thing where we
> don't have models of the hardware the kernel is expecting.
> This patch does seem to make slightly more extensive edits than that,
> though.
>

This is the minimal dtb patch that could make direct Linux kernel
booting succeed with a working UART. The SD and QSPI parts were added
for testing other QEMU models (hw/sd/sd.c and hw/block/m25p80.c) too
and I think that's useful.

Current ZCU102 documentation does not explain how to make Linux kernel
boot on QEMU thus we need a solution. Modeling the complete firmware
boot is definitely a way that could avoid modifying the dtb, but that
involves massive work and at this point I don't want to proceed with
that way.

Regards,
Bin

