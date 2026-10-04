Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7819CCA5FDD
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 01:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDAtd-00039J-Sj; Sat, 03 Oct 2026 21:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDAtZ-00035U-JO
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 21:20:06 -0400
Received: from mail-yx2-x20.google.com ([2607:f8b0:4864:41::20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDAtX-0003KY-VV
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 21:20:05 -0400
Received: by mail-yx2-x20.google.com with SMTP id
 00721157ae682-8ab41af29caso3631477b3.3
 for <qemu-arm@nongnu.org>; Sat, 03 Oct 2026 18:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791076803; cv=none;
 d=google.com; s=arc-20260327;
 b=GpCJnn+cknfdesciY2xHme7gxgivP7v5nsS3av4LrYMSu81SrJ23CxiwSKiB6NPUs7
 gghLo4Btw/G3oKzu9GKnGMbj3hSCRb0mRa0J7HO0kfIiDgiiTWVjCRsV+KeiS36GhnRL
 +Wl/ubaLJqyi+BFoIeHk/e4skv2Bo0lYjMtVVVH68OIO9+No/lj2pzdlhPxchNvesgWn
 Os0mYSzgAItnauUMjoEfiOAEK50A8TLcrVcuEfXbFmMqo+uCjsmB3dmgAlZp0L/KG7sP
 K/OBKapA7EEttGz0n126uw4wzO70Dveb/ubEpS5V0WsbNCArw0SRIWRdXXd64rae0REy
 81Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=W6pCVEfc1+l0CJAgHWpRs7RM2mUmGEWIEO5KudN0MVc=;
 fh=LSMDnzRRHAJKH8e7EZD60fB4kLWeWjs/9cex23jTKN8=;
 b=lX3NE5U1AzgqY7ryCEODt/nNQxkSklRLNmimSNg0ydeZRMrzNEjm803nXTfdn7pflI
 yUfeWQPyXX0OhGdcgN4l+5JcCZG1H8S0otZnfMuhhDhpszkG8l/PqQ7+C5yiUVzk37JS
 IYKK9c2ti0/SNu91p8EiHOMt61w80r9Fm8msUjYIaiQWrHsGTH0Px9/puEzh2QC31egi
 7W6AWt58oNcQBrbIsf2Hojc5lNCQhPYspQfKM7rdzIQtDglupiB25NTgCD0J7Wvz61vk
 9C+PGBUCeR8scBfVRzG/ERUkQiRSIcPbxfl+8bTRzAEKjOGsPCtE3F3weIBNmkHYEUIu
 1WkA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791076803; x=1791681603; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W6pCVEfc1+l0CJAgHWpRs7RM2mUmGEWIEO5KudN0MVc=;
 b=NyDsZDq7uYBjGbwS4gFIOhNqe1/wbWwp/04YwjvXVKLxWyKpyUOvi9iccIRIsMuykN
 JS0tcOObvlVmmy2pjpU4q3nU686v1Q2ZzL6hboSZPoAWrLwgJHo8maQqLm1xEKPjFQ6b
 2nYL/dehkqvzkVF5v6efIzpS7sXUp8NO90Ki9ruyjxeWyWjBqW2jY1Gn61e/nWCwajW1
 /jma7FoxexKnmyZPx2TmOS3KNEJXJ9sJikRGg8Co39fz9dxebqqarwut7Uy/iAQFvfu+
 StwNceqTf1aZFrJZBqWiWK+PW6vAf7RGMgxCfKWMqd4BrIOgqbf+oNEh12e6/vxtZpIs
 rd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791076803; x=1791681603;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W6pCVEfc1+l0CJAgHWpRs7RM2mUmGEWIEO5KudN0MVc=;
 b=0rBqRzuTP7FRXaLMBvbzZBGo4Nhb9sU5UehGyusZn6mpjpgJnMNJTCEXxXsinmfJki
 etk916zmhG+havGJe7C6lXykfvG+a4DEq20TRg20nd57JB9L2XmtaHGmTNBMBe5OxmZP
 ueHm/86oTU/2LFGcMhR1cVIMvGQ9BEtRsVXuk/p3LsNR7Hrc9q83VZoSZZLhMW7Un8k/
 iE4RYIgHRSQSakNQYfeQeWXFRxZDoWHh7o1w1dNgsQdGB1/3DuFg1HyJFR1+CdJoHCk2
 tDoA21m4n/SBG5SJRBcdUx8ONAppqgFWLvRJTf+AWziJYiRoZxl79CQ1vpDSa3hJDH3K
 bK4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwV8PA6guplcjRqqzttjNc6h82tKx9o/BNmyg7fkMvONfkWRO8zy8/NK10Dv0tiecy1GEwDBQknew==@nongnu.org
X-Gm-Message-State: AFq9FYKXCwCwOFld1yxhOXa2kVQSHyEhT8pk7vNOjqhk+eXpXIC2dAZO
 2rTWTkW2SxuR0UaAuUMNoqnohpl9GPsHbpGgpPcwQaDEsicWCu8Br/jYriBWpr2tVRSsB0lgGrL
 RTwndlqiqTbnmuDs9VD1YDHxyR4aBMY0=
X-Gm-Gg: AYBFou0lS0to/Ciys4Lfb08jUk9X/uBNj+HxqMc+UeehGOuFVtie0lCoA7FN6NYr55T
 7GFcYqu7SdgayK07Eu4h/Hg4hdxOh4gcxikgcPwZZZcfMerJXZsEKkGSvSP0FwyUiNgbdO8E53A
 n5B8Ns96DWo9J1bUackPzqhpm+0XxXHSKLLhymrmfxGeHORAL80qPJVIOhATecnLJjRQvszeGHk
 MjDayYtZDxSpWlwywy4WvqhKoiv2LsziV8vbX4YxQLhdRUtTksBRi2gK9uUvtW1RQxCPmuZgdTt
 J0OZGNUdSI8vx/XYm8PoLKV84DkLRl30jGf6ofIFU3dKQ7XurGP5AbJ7P8zKka5tZEJcE1yEw+1
 ZNtjYzT4tc7XmALs=
X-Received: by 2002:a05:690c:6987:b0:8ac:c329:67e6 with SMTP id
 00721157ae682-8ae38eafcefmr34042927b3.16.1791076802573; Sat, 03 Oct 2026
 18:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260904161438.3838261-1-bin.meng@processmission.com>
 <20260904161438.3838261-2-bin.meng@processmission.com>
 <CAFEAcA-p=UaNk-Qddid99o7zeGS4WqmvqAugxtjtBKZwv9ie8Q@mail.gmail.com>
 <CAEUhbmX3N2u732mUZ8wG0pdtN+vCrVf4rdX3TR+vHPeRunsGPQ@mail.gmail.com>
 <CAFEAcA91O71cLf9ogos_xuTx+9fn-jdUGP5u80RD6hOxAQNQOw@mail.gmail.com>
In-Reply-To: <CAFEAcA91O71cLf9ogos_xuTx+9fn-jdUGP5u80RD6hOxAQNQOw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 09:19:49 +0800
X-Gm-Features: AclHuK8-6iTzb4hOTo4dqedK0rv7xlSGConn0L0ynMFv4dao_GjPbhVkAmtAh1o
Message-ID: <CAEUhbmUeeuKiZiaTrU2wm3Gi8NbZ+o9XVegUf-gLNBr-+rogVA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] hw/arm: fsl-imx6ul: Add SCU compatibility window
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::20;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x20.google.com
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

On Wed, Sep 16, 2026 at 12:13=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>
> On Tue, 15 Sept 2026 at 16:52, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Peter,
> >
> > On Mon, Sep 14, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> > >
> > > On Fri, 4 Sept 2026 at 17:15, Bin Meng <bin.meng@processmission.com> =
wrote:
> > > >
> > > > +    /*
> > > > +     * U-Boot's shared i.MX6 CPU identification code reads the
> > > > +     * Cortex-A9 SCU configuration register on i.MX6UL. Cortex-A7
> > > > +     * reserves this address, so provide only the compatibility wo=
rd
> > > > +     * needed before the console is initialized.
> > > > +     */
> > > > +    create_unimplemented_device("a7mpcore-scu-compat",
> > > > +                                FSL_IMX6UL_A7MPCORE_ADDR + 0x4, 4)=
;
> > >
> > > What is actually going on here, though? Why is u-boot reading
> > > an address that's only here for the A9? Has this been reported
> > > to u-boot as a bug? What does the real hardware do?
> >
> > I suspect the reason is that the imx6 family contains both A9 and A7
> > based SoCs and it's a leftover when imx6ul support was introduced in
> > U-Boot. I do not see a bug report against U-Boot yet.
> >
> > >
> > > Whatever the answers are, I expect the correct fix is not going
> > > to be "fake up this specific 4 bytes to ignore accesses in the
> > > imx6 SoC model".
> > >
> >
> > Apparently the real hardware ignores the scu access on A7. So IMO it
> > could be accepted as a workaround for buggy software although guests
> > should not do so.
>
> Mmm, but I don't think the fix is going to be just this 4 bytes,
> and possibly it shouldn't be in this SoC specifically.
>
> What does the TRM for the SoC say is at this address?
>

The TRM for the SoC only says 00A0_0000 - 00A0_7FFF windows is for
"ARM Peripherals: GIC400 Only visible to ARM core(s)", then in the TRM
for Cortex-A7 the address 0x0000 - 0x0FFF is marked as reserved.

I plan to submit a patch to the U-Boot upstream to see how the
maintainer thinks.

Regards,
Bin

