Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F63CA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 06:58:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDGAs-0005kX-J7; Sun, 04 Oct 2026 02:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDGAq-0005jx-Rp
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 02:58:16 -0400
Received: from mail-yx2-x16.google.com ([2607:f8b0:4864:41::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDGAp-0003c0-0x
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 02:58:16 -0400
Received: by mail-yx2-x16.google.com with SMTP id
 00721157ae682-8abc87cbd93so4477597b3.1
 for <qemu-arm@nongnu.org>; Sat, 03 Oct 2026 23:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791097093; cv=none;
 d=google.com; s=arc-20260327;
 b=fgZxNx52CuSjzItHExKtQXnLnitADNmfGBa0/dnUGmLItQWd6pez7Bl8DEjMERalX1
 T9044nEzPsqJmbrmQ+WeBkcbcVORokfESYozxHDo4/lvWHwOTEKuYnxRZLVu1jGSYcUI
 ZyLgWd41dDG0/gFa7LXkAUumjGgkKeW2Akx/ceyJD2DTxZGK9TN3JbT8SWJiHnI5/Ae9
 Lt7edCtzDUlU0gQpaT8489w0rX0XLzuH5iCGlP/G2ER3+zVPJZo7tbRC0wm7EmI6s1l8
 27+a4Jb4k25ZgmWEU7WvQ0eDCua/1BLN9AeiOKs9xl30EIHdfy1ol93i25kcl34y9MYv
 vUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TLREEsVF71675AkImm7FuFPVubfqGxq+5JsUZBr5yo0=;
 fh=2liNg84DD8E1NwWEhuy9LB7XQVNB5oX3kphOlDumAvY=;
 b=fab8DXkjjqyA09j0M+WbSaczpbgnol0EXa33MMayZLJ9FWSlTZDPwd6PQ0WCmByM4G
 +WR6+1+voGmjAGaF/9Nsp3ztZYS+AJn6+13XmXJpRAVn/SDL4mqf9ZiglUfqEnsIMxf3
 GfvE7y0/eHoa5I9zq3VxYEMav65XxfrEBF5gOaogYT4cBF0OM2Sh/GU/rrPYoWFq1OLc
 ouniULIxqEHsoa/GJWLh2ivBRvVHykzUOmXNGNKm8deBsV7UBTf1s4mDwZCleBABpKxn
 Fg2pXAbbb75TcTE4T1GOBOrpE/C8D2PjarJoQrAiz5IER5KiThsoQWjDX14Ul8OVkdHX
 zZCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791097093; x=1791701893; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TLREEsVF71675AkImm7FuFPVubfqGxq+5JsUZBr5yo0=;
 b=kQRpwcb1NVMb/qfiRwZFIocyW2FNJFZK7ykiytYBCEdxtIOVMDEK+x1F9Q8W/fGU/c
 /2fG0rpqSggrUvIbld5jswerHsxGVt6PNVrmT+PhCyPkLuBuGz1G0RysP0t3bnxErrQl
 jnV/cRj+VXbQGTXg51bv8Pbc4Q6YsNBOm/3sI8M4iWwSBZMxHGhQDFUvlAOckuX/UWqR
 4y9eTFrk8i+IKIlGZhK9qhYa1uxzvxxB+4kpN+cPj9H48PoyYf1MsfYz5300Z3+PHIxq
 XBGJ1EwbcRtl71Sn5DksexfcIoM69/rV3/32Dr/35ZqKle9xh/fp+xHIbKCKKP84BeZC
 t8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791097093; x=1791701893;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TLREEsVF71675AkImm7FuFPVubfqGxq+5JsUZBr5yo0=;
 b=XDva4VadZ6k7QF0cntjtAiFCNQje4BGUK8bFEf76NF96NfpkR9AJwWwQlu6yQQpXto
 Tc+8cki72puqQw/FHlGfkOWrGfZK6BJcrQoY9fbwHcj1AvLt3fYN4QXKnjbPWgN3Wncq
 AFVL0+W8Y6I6pFiU+NSS5+h/FVZA890NezRABG3nG6pS7xLun1H5JqHZLrsw+lD8KDdH
 dC39ciZfPSyixPGnAuOQERbc6J6fIyCXi0k0wp9cdyiBW9v/nFAJwo6ki+8Zg5IGEd47
 GS2nUoSE2Hkk0iDoe81X8w4R1JggrVgY9WZ+TYqaNSErb48txcWbCfYtW5N1c0yrP05o
 FdrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx3wnNO4Xe/+IaPj1CK6l57a2iiG3ZKB3GOUcfUKjvgfbbabmISivLWE4r24J2hIRMGhQ7Nj1H1pQ==@nongnu.org
X-Gm-Message-State: AFq9FYJppdjt+8/w6xe26LnvoW1CnI44V9f/tEqgPgPUgGX8dnAVw1nO
 2RGWj4Xk+tAI9UfX6vaDNNxPIoVNgoo7HywQJQKfClBkwyzZetaxHsDG4OWapR/FSzW4uLfII6f
 T1HxnIsVlaxMwSwbogKzTfKDTSfiqwuFdLrN4/k4=
X-Gm-Gg: AYBFou17qHPjAspdGxWKnzDM+STLjcMh2AMtJEto9SanDd96Ydely8z2WYTncnmkpR3
 JOpz8s8McwnRUsbyfENqzufqCCWcgr7opbAbD8/PUncJ8YUdkZ0VTrLIii/PYIQKVL8Ix8fMV4H
 8fxFUB4ebM8TwZ6cRqehHzlj7mb2YT8csvS9gt+mWpsdvauz/uaDl7hYh5C+xMxLs+8DX6t8N31
 vt5KtbmXor5mbyVXrUYQjWPf9WuaSjOSJd9occAtnqEOdcW9BgJK+O/ep8okLtSQf4H71mGcC+z
 l0Dt7uE0TR9aRLukZ0zlUiWUQ/k72Kgb7BS/S12hD8p8Jww37bRTnKNCNhqymR7MxDePKTWyRrr
 kqiMD163C/LtmCXqJuBIp5rut4+I=
X-Received: by 2002:a05:690c:3481:b0:8af:fa5:c081 with SMTP id
 00721157ae682-8af0fa5c4bbmr3403947b3.1.1791097093331; Sat, 03 Oct 2026
 23:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260904161438.3838261-1-bin.meng@processmission.com>
 <20260904161438.3838261-2-bin.meng@processmission.com>
 <CAFEAcA-p=UaNk-Qddid99o7zeGS4WqmvqAugxtjtBKZwv9ie8Q@mail.gmail.com>
 <CAEUhbmX3N2u732mUZ8wG0pdtN+vCrVf4rdX3TR+vHPeRunsGPQ@mail.gmail.com>
 <CAFEAcA91O71cLf9ogos_xuTx+9fn-jdUGP5u80RD6hOxAQNQOw@mail.gmail.com>
 <CAEUhbmUeeuKiZiaTrU2wm3Gi8NbZ+o9XVegUf-gLNBr-+rogVA@mail.gmail.com>
In-Reply-To: <CAEUhbmUeeuKiZiaTrU2wm3Gi8NbZ+o9XVegUf-gLNBr-+rogVA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 14:58:01 +0800
X-Gm-Features: AclHuK8QNIe2_FQNCXM1830SkbuIfVJvuFPtxNht4XXr9kkrpjYxwC7iGtqiM3I
Message-ID: <CAEUhbmVO363T1sKmV56N9_uwhV_pGnY+aK0WOmORYQNBirExGA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] hw/arm: fsl-imx6ul: Add SCU compatibility window
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::16;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x16.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Oct 4, 2026 at 9:19=E2=80=AFAM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Peter,
>
> On Wed, Sep 16, 2026 at 12:13=E2=80=AFAM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
> >
> > On Tue, 15 Sept 2026 at 16:52, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Peter,
> > >
> > > On Mon, Sep 14, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@=
linaro.org> wrote:
> > > >
> > > > On Fri, 4 Sept 2026 at 17:15, Bin Meng <bin.meng@processmission.com=
> wrote:
> > > > >
> > > > > +    /*
> > > > > +     * U-Boot's shared i.MX6 CPU identification code reads the
> > > > > +     * Cortex-A9 SCU configuration register on i.MX6UL. Cortex-A=
7
> > > > > +     * reserves this address, so provide only the compatibility =
word
> > > > > +     * needed before the console is initialized.
> > > > > +     */
> > > > > +    create_unimplemented_device("a7mpcore-scu-compat",
> > > > > +                                FSL_IMX6UL_A7MPCORE_ADDR + 0x4, =
4);
> > > >
> > > > What is actually going on here, though? Why is u-boot reading
> > > > an address that's only here for the A9? Has this been reported
> > > > to u-boot as a bug? What does the real hardware do?
> > >
> > > I suspect the reason is that the imx6 family contains both A9 and A7
> > > based SoCs and it's a leftover when imx6ul support was introduced in
> > > U-Boot. I do not see a bug report against U-Boot yet.
> > >
> > > >
> > > > Whatever the answers are, I expect the correct fix is not going
> > > > to be "fake up this specific 4 bytes to ignore accesses in the
> > > > imx6 SoC model".
> > > >
> > >
> > > Apparently the real hardware ignores the scu access on A7. So IMO it
> > > could be accepted as a workaround for buggy software although guests
> > > should not do so.
> >
> > Mmm, but I don't think the fix is going to be just this 4 bytes,
> > and possibly it shouldn't be in this SoC specifically.
> >
> > What does the TRM for the SoC say is at this address?
> >
>
> The TRM for the SoC only says 00A0_0000 - 00A0_7FFF windows is for
> "ARM Peripherals: GIC400 Only visible to ARM core(s)", then in the TRM
> for Cortex-A7 the address 0x0000 - 0x0FFF is marked as reserved.
>
> I plan to submit a patch to the U-Boot upstream to see how the
> maintainer thinks.
>

After further reading the GIC-400 TRM (DDI0471B), I found chapter 3.1 says:

The following information applies to the GIC-400 registers:
=E2=80=A2 The base address of the GIC-400 is not fixed, and can be differen=
t
for a particular system
implementation. The offset of each register from the base address is fixed.
=E2=80=A2 Access to reserved or unused address locations is RAZ/WI (Read-as=
-Zero, Writes
Ignored).
=E2=80=A2 Unless otherwise stated in the accompanying text:
=E2=80=94 Do not modify reserved register bits.
=E2=80=94 Ignore reserved register bits on reads.
=E2=80=94 All register bits are reset to 0 by a system or power-on reset.

It seems we should create a 4KiB unimplemented window within GiC-400.

Regards,
Bin

