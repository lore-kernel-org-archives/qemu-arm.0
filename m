Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1227209wrx;
        Thu, 4 Apr 2019 01:51:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHbdZwAuUu/X5uVyGEAeE+PbqFyvEzTPNYtzkDCR8unPkdKLZZS7OrCZ0tl4w+AP8LVfq+
X-Received: by 2002:a5b:487:: with SMTP id n7mr4202488ybp.424.1554367881960;
        Thu, 04 Apr 2019 01:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554367881; cv=none;
        d=google.com; s=arc-20160816;
        b=yzu91LYWJ4QfFbu5fOkL0N1VQghT16NE/xXg/M/Ta9xj4+oRihYbe/uXh/a9CsRKH9
         51H64woafCiypKEES3+/NDhbYSkACzfswjM9w98jm5pxEIwPC5qtrEHMMspcVb8VnrXP
         u8dzQGoCF6Z0egopY9SmGRtS3hVURcGIQdSOM2DrA9CZxaRk3e/3rTSGNLgAjsTMdcV3
         QOxrcvDE4iu9bCeOgrkCtxsVUtfeiaFeOdNkKRMa100nGBJaTXZL+HqZuM4sdaaCs0a0
         61vUXTEFz/2e3io2V4xPoOCFZCnxBw0D9seluGiPRFrh5V5mEWsWSsjTthhytOAjjGpi
         UJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWsAYtJ4ey4WGTqY2+zBtEHqIwx1IAFJ9YdlxIf2Wa0=;
        b=ajD4lClqmtTqMwOSayX9ZwHmA7iIbDzhA6oIh+JarLXkKzSVBg4sLSvQQXSo97ZTII
         FMzw0Mmh3Pwie1jrZ4fRbLR3DYmTUOUPBw6S6uBFICmXJx+00MM2nFdHLFJFhRf5QAus
         QEea+x3X1gfn4LTMADxMR2xy5aOzq1VfzCDR80YGgkOjBRVsH45VEomw3UCFAD8B898W
         vX8agPBwoNzo9jcSG84Y4hBFFbOofFV3a4z0PnjyWH17mMAhcQ1rVwLgcMoV7LZReHlz
         ndrRpOsuLCTnmh5xnFOLLASH7HvSvOEp9l4o/Tiwy5AMUtqhd6devnxFD/HbSoUg8Aqj
         ZbuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZxm6rm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q128si12054862ywb.51.2019.04.04.01.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 01:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZxm6rm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBy5h-0003iQ-EK
	for alex.bennee@linaro.org; Thu, 04 Apr 2019 04:51:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <radoslaw.biernacki@linaro.org>) id 1hBy5U-0003hl-2J
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <radoslaw.biernacki@linaro.org>) id 1hBy5S-0002Gg-8V
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:51:07 -0400
Received: from mail-yw1-xc30.google.com ([2607:f8b0:4864:20::c30]:40011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
	id 1hBy5P-0002DC-3J
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:51:04 -0400
Received: by mail-yw1-xc30.google.com with SMTP id p64so674635ywg.7
	for <qemu-arm@nongnu.org>; Thu, 04 Apr 2019 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EWsAYtJ4ey4WGTqY2+zBtEHqIwx1IAFJ9YdlxIf2Wa0=;
	b=XZxm6rm4rf2ffvdxWX0EJVzpnKyldIuJC8IWviSMG/GIiHb8ayvtXQ5+9OdTRuHlhj
	wxHSr8AaPJlFluPBq2P2WWIoGt+ZsLZK+iKMO+PGvZunJXLdrphghk1d95Lkbjy/kMaT
	Lly8FHw5vLO9rf9iIUqZ6rOhVZOTBjEYWrW55W7PaUueGugE3nNhMFA+09PPSmysFHmh
	THjeWwePT9Rye8T36YFo9mPTPizq80mZlEO1pSJEZyFswBfvHMSyGH2M0TJUs8cLpj7l
	APSJx6tU5MaYYZ/J/rx/v9pJ9Pfz4M+VKQAcgeugtNCdOb1u3jD2c8f1fEzeC9VIQ2s4
	9VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EWsAYtJ4ey4WGTqY2+zBtEHqIwx1IAFJ9YdlxIf2Wa0=;
	b=qB3FSHgk3orEvxw0ov3nvlYsljk9vHbMNgRNFVjj5aDkAJndH1W49BTMVH6YaYu7BR
	Kv8gZ2InnL7BSvLqxOrDUfGQUSNcdH1rSMjFifuuPTp4YadLPbvyN1hoyWIqMjjVa99J
	Re2/Eu2CJei5rXn0pUCaRa4VUofjroAX5im+LGsGhvU2gj2eAme/6ez7ZyCrMy33pQ1k
	Wwfz/3WYygpt/jRM6WassVOHHpFr895Fg+2zrqRJfheP2nnbgflv7JkjpPt2FST3ElWp
	4YkFr4h9L8gmg+j87NqHNslT7qR6ohooM8EDD0HJO5tPEz8R5fQ2UrAfTfgrUxeTQ2Xg
	7AsQ==
X-Gm-Message-State: APjAAAWwmzhZth4W6yjTNEtmHpqT5cOaCX0JU0MgwHpGIjaWnpsKFKFQ
	fqBT5kGi0974BeYYPR3MJUYONJgVFF2daI8QVt5GzA==
X-Received: by 2002:a0d:e2d0:: with SMTP id l199mr3359480ywe.331.1554367861647;
	Thu, 04 Apr 2019 01:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
	<CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
	<CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
In-Reply-To: <CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Thu, 4 Apr 2019 15:50:49 +0700
Message-ID: <CAEK-wKnY=VutLC6Ke=UeuswfxGkGohahhxwFiq=kqRdT-W0rPQ@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003e85db0585b078c0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c30
Subject: Re: [Qemu-arm] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qdTB8rnjTQeG

--0000000000003e85db0585b078c0
Content-Type: text/plain; charset="UTF-8"

There is one additional need which we just discovered with Fu Wei.
We need second secure UART for RAS and MM from EL0.
I'm adding a patch here (not sure if addresses and IRQ's are in your style
so please check those).
I will adapt FW to your changes in next patch.

From fbc84e29b966f94a27fe84195987e6ba0c55c1bc Mon Sep 17 00:00:00 2001
From: Radoslaw Biernacki <radoslaw.biernacki@gmail.com>
Date: Thu, 4 Apr 2019 14:41:21 +0700
Subject: [PATCH] Add 2nd secure uart Rebase of Fu Wei patch

---
 hw/arm/sbsa-ref.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 6b26111840..dcfb34ff5b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -67,6 +67,7 @@ enum {
     SBSA_PCIE_ECAM,
     SBSA_GPIO,
     SBSA_SECURE_UART,
+    SBSA_SECURE_UART_MM,
     SBSA_SECURE_MEM,
     SBSA_AHCI,
     SBSA_EHCI,
@@ -105,7 +106,9 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
     [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
-    [SBSA_SMMU] =               { 0x60040000, 0x00020000 },
+    /* The UART is a secure UART for S-EL0 OS testing */
+    [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
+    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
     [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
@@ -126,8 +129,9 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_PCIE] = 3, /* ... to 6 */
     [SBSA_GPIO] = 7,
     [SBSA_SECURE_UART] = 8,
-    [SBSA_AHCI] = 9,
-    [SBSA_EHCI] = 10,
+    [SBSA_SECURE_UART_MM] = 9,
+    [SBSA_AHCI] = 10,
+    [SBSA_EHCI] = 11,
 };

 /*
@@ -645,6 +649,7 @@ static void sbsa_ref_init(MachineState *machine)
     create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));

     create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
+    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem,
serial_hd(2));

     create_rtc(vms, pic);

-- 
2.17.1


On Thu, 4 Apr 2019 at 15:27, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:

> I would like to wait for more days to see if there are any further
> comments, and if no I will send another iteration with memory map
> slightly changed.
>
> On Wed, 20 Mar 2019 at 18:27, Ard Biesheuvel <ard.biesheuvel@linaro.org>
> wrote:
> >
> > On Mon, 18 Mar 2019 at 03:39, Hongbo Zhang <hongbo.zhang@linaro.org>
> wrote:
> > >
> > > On Fri, 15 Mar 2019 at 18:41, Ard Biesheuvel <
> ard.biesheuvel@linaro.org> wrote:
> > > >
> > > > On Fri, 15 Mar 2019 at 11:08, Hongbo Zhang <hongbo.zhang@linaro.org>
> wrote:
> > > > >
> > > > > For the Aarch64, there is one machine 'virt', it is primarily
> meant to
> > > > > run on KVM and execute virtualization workloads, but we need an
> > > > > environment as faithful as possible to physical hardware, for
> supporting
> > > > > firmware and OS development for pysical Aarch64 machines.
> > > > >
> > > > > This patch introduces new machine type 'sbsa-ref' with main
> features:
> > > > >  - Based on 'virt' machine type.
> > > > >  - A new memory map.
> > > > >  - CPU type cortex-a57.
> > > > >  - EL2 and EL3 are enabled.
> > > > >  - GIC version 3.
> > > > >  - System bus AHCI controller.
> > > > >  - System bus EHCI controller.
> > > >
> > > > Hello Hongbo,
> > > >
> > > > Apologies for bringing this up now, but I seem to remember that the
> > > > EHCI does not support 64-bit DMA. Did you run into any issues with
> > > > this? Or was this fixed in QEMU in the mean time?
> > > >
> > > Hi Ard,
> > > Which EHCI do you mean?
> > > This time I use a newly introduced system bus EHCI, commit 114529f7
> > > and I only tested USB mouse and key board, didn't test DMA function.
> > >
> >
> > The host controller doesn't work without DMA, so if mouse and keyboard
> > worked for you, and no DRAM exists below the 4 GB mark, this has
> > apparently been fixed in QEMU.
>

--0000000000003e85db0585b078c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">There is one additional need which we jus=
t discovered with Fu Wei.<div>We need second secure UART for RAS and MM fro=
m EL0.</div><div>I&#39;m adding a patch here (not sure if addresses and IRQ=
&#39;s are in your style so please check those).</div><div>I will adapt FW =
to your changes in next patch.</div><div><br></div><div><div>From fbc84e29b=
966f94a27fe84195987e6ba0c55c1bc Mon Sep 17 00:00:00 2001</div><div>From: Ra=
doslaw Biernacki &lt;<a href=3D"mailto:radoslaw.biernacki@gmail.com">radosl=
aw.biernacki@gmail.com</a>&gt;</div><div>Date: Thu, 4 Apr 2019 14:41:21 +07=
00</div><div>Subject: [PATCH] Add 2nd secure uart Rebase of Fu Wei patch</d=
iv><div><br></div><div>---</div><div>=C2=A0hw/arm/sbsa-ref.c | 11 ++++++++-=
--</div><div>=C2=A01 file changed, 8 insertions(+), 3 deletions(-)</div><di=
v><br></div><div>diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c</div><d=
iv>index 6b26111840..dcfb34ff5b 100644</div><div>--- a/hw/arm/sbsa-ref.c</d=
iv><div>+++ b/hw/arm/sbsa-ref.c</div><div>@@ -67,6 +67,7 @@ enum {</div><di=
v>=C2=A0 =C2=A0 =C2=A0SBSA_PCIE_ECAM,</div><div>=C2=A0 =C2=A0 =C2=A0SBSA_GP=
IO,</div><div>=C2=A0 =C2=A0 =C2=A0SBSA_SECURE_UART,</div><div>+=C2=A0 =C2=
=A0 SBSA_SECURE_UART_MM,</div><div>=C2=A0 =C2=A0 =C2=A0SBSA_SECURE_MEM,</di=
v><div>=C2=A0 =C2=A0 =C2=A0SBSA_AHCI,</div><div>=C2=A0 =C2=A0 =C2=A0SBSA_EH=
CI,</div><div>@@ -105,7 +106,9 @@ static const MemMapEntry sbsa_ref_memmap[=
] =3D {</div><div>=C2=A0 =C2=A0 =C2=A0[SBSA_RTC] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x60010000, 0x00001000 },</div><div>=
=C2=A0 =C2=A0 =C2=A0[SBSA_GPIO] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{ 0x60020000, 0x00001000 },</div><div>=C2=A0 =C2=A0 =C2=A0=
[SBSA_SECURE_UART] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x60030000, 0x00001000 =
},</div><div>-=C2=A0 =C2=A0 [SBSA_SMMU] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0{ 0x60040000, 0x00020000 },</div><div>+=C2=A0 =C2=
=A0 /* The UART is a secure UART for S-EL0 OS testing */</div><div>+=C2=A0 =
=C2=A0 [SBSA_SECURE_UART_MM] =3D=C2=A0 =C2=A0 =C2=A0{ 0x60040000, 0x0000100=
0 },</div><div>+=C2=A0 =C2=A0 [SBSA_SMMU] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x60050000, 0x00020000 },</div><div>=C2=A0 =C2=
=A0 =C2=A0/* Space here reserved for more SMMUs */</div><div>=C2=A0 =C2=A0 =
=C2=A0[SBSA_AHCI] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0{ 0x60100000, 0x00010000 },</div><div>=C2=A0 =C2=A0 =C2=A0[SBSA_EHCI] =
=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x60110000, 0x0=
0010000 },</div><div>@@ -126,8 +129,9 @@ static const int sbsa_ref_irqmap[]=
 =3D {</div><div>=C2=A0 =C2=A0 =C2=A0[SBSA_PCIE] =3D 3, /* ... to 6 */</div=
><div>=C2=A0 =C2=A0 =C2=A0[SBSA_GPIO] =3D 7,</div><div>=C2=A0 =C2=A0 =C2=A0=
[SBSA_SECURE_UART] =3D 8,</div><div>-=C2=A0 =C2=A0 [SBSA_AHCI] =3D 9,</div>=
<div>-=C2=A0 =C2=A0 [SBSA_EHCI] =3D 10,</div><div>+=C2=A0 =C2=A0 [SBSA_SECU=
RE_UART_MM] =3D 9,</div><div>+=C2=A0 =C2=A0 [SBSA_AHCI] =3D 10,</div><div>+=
=C2=A0 =C2=A0 [SBSA_EHCI] =3D 11,</div><div>=C2=A0};</div><div>=C2=A0</div>=
<div>=C2=A0/*</div><div>@@ -645,6 +649,7 @@ static void sbsa_ref_init(Machi=
neState *machine)</div><div>=C2=A0 =C2=A0 =C2=A0create_uart(vms, pic, SBSA_=
UART, sysmem, serial_hd(0));</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=
=A0create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));</d=
iv><div>+=C2=A0 =C2=A0 create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sy=
smem, serial_hd(2));</div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0create_=
rtc(vms, pic);</div><div>=C2=A0</div><div>--=C2=A0</div><div>2.17.1</div><d=
iv><br></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, 4 Apr 2019 at 15:27, Hongbo Zhang &lt;<a h=
ref=3D"mailto:hongbo.zhang@linaro.org">hongbo.zhang@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I would like =
to wait for more days to see if there are any further<br>
comments, and if no I will send another iteration with memory map<br>
slightly changed.<br>
<br>
On Wed, 20 Mar 2019 at 18:27, Ard Biesheuvel &lt;<a href=3D"mailto:ard.bies=
heuvel@linaro.org" target=3D"_blank">ard.biesheuvel@linaro.org</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Mon, 18 Mar 2019 at 03:39, Hongbo Zhang &lt;<a href=3D"mailto:hongb=
o.zhang@linaro.org" target=3D"_blank">hongbo.zhang@linaro.org</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 15 Mar 2019 at 18:41, Ard Biesheuvel &lt;<a href=3D"mailt=
o:ard.biesheuvel@linaro.org" target=3D"_blank">ard.biesheuvel@linaro.org</a=
>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, 15 Mar 2019 at 11:08, Hongbo Zhang &lt;<a href=3D"ma=
ilto:hongbo.zhang@linaro.org" target=3D"_blank">hongbo.zhang@linaro.org</a>=
&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; For the Aarch64, there is one machine &#39;virt&#39;, i=
t is primarily meant to<br>
&gt; &gt; &gt; &gt; run on KVM and execute virtualization workloads, but we=
 need an<br>
&gt; &gt; &gt; &gt; environment as faithful as possible to physical hardwar=
e, for supporting<br>
&gt; &gt; &gt; &gt; firmware and OS development for pysical Aarch64 machine=
s.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This patch introduces new machine type &#39;sbsa-ref&#3=
9; with main features:<br>
&gt; &gt; &gt; &gt;=C2=A0 - Based on &#39;virt&#39; machine type.<br>
&gt; &gt; &gt; &gt;=C2=A0 - A new memory map.<br>
&gt; &gt; &gt; &gt;=C2=A0 - CPU type cortex-a57.<br>
&gt; &gt; &gt; &gt;=C2=A0 - EL2 and EL3 are enabled.<br>
&gt; &gt; &gt; &gt;=C2=A0 - GIC version 3.<br>
&gt; &gt; &gt; &gt;=C2=A0 - System bus AHCI controller.<br>
&gt; &gt; &gt; &gt;=C2=A0 - System bus EHCI controller.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello Hongbo,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Apologies for bringing this up now, but I seem to remember t=
hat the<br>
&gt; &gt; &gt; EHCI does not support 64-bit DMA. Did you run into any issue=
s with<br>
&gt; &gt; &gt; this? Or was this fixed in QEMU in the mean time?<br>
&gt; &gt; &gt;<br>
&gt; &gt; Hi Ard,<br>
&gt; &gt; Which EHCI do you mean?<br>
&gt; &gt; This time I use a newly introduced system bus EHCI, commit 114529=
f7<br>
&gt; &gt; and I only tested USB mouse and key board, didn&#39;t test DMA fu=
nction.<br>
&gt; &gt;<br>
&gt;<br>
&gt; The host controller doesn&#39;t work without DMA, so if mouse and keyb=
oard<br>
&gt; worked for you, and no DRAM exists below the 4 GB mark, this has<br>
&gt; apparently been fixed in QEMU.<br>
</blockquote></div>

--0000000000003e85db0585b078c0--
