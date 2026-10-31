Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AF606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 02:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaip4Rj+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMzHX-0000W5-Bu; Fri, 30 Oct 2026 22:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMzHC-0000Tu-WC
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 22:57:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMzH8-00016e-96
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 22:57:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso1726580a12.3
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 19:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793415416; cv=none;
 d=google.com; s=arc-20260327;
 b=Wb1d9XL+gCKq4dZ2ffqlilBzb/6FfZ2uYdgEX9Bv4ZloqTineUY5mlApMTnveIltrC
 QP5jz9zBYVjYsjcG0nDOec61BQ355cjg2XrgWBNinqt5BXvh6sdN/UFFoFV/r1BmHT3x
 Py6hFMfbM/GBlj7+kXWdrcPxY+2XjU6ZjpicDy+TICNVrj2Xv/1g8t+Xc9cmbhUbyL39
 FqxaTQVgy3BJT6P8tl+2sV3uC8JLylel0K2p+mHFXrQ1nhk0hk/0XGgYir5vy0Dv7ZMm
 VpYsa2SqR2TzTmJWZ1isL9y4Z1sub9at7LXoBeGGRMxNf+pgxfmmaqAxGE7/FfRHKJCy
 pmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
 fh=AvDXzJsxrLPNA735B8KsUpkxLoMNk39gPwpnKdiY9Yc=;
 b=rjni5ZHTlFYq1q4yXUxCjaVKyA4fBjNSs5WSp2W7CXxctuxiAxMwJD9SVgGfobouGo
 UL42QnimbrScwKz676GgOSSGjZph+bH9mwFyORA9ycd50DNsSlmLzYMHVj8blx9RhsxI
 6MLl24gqJ6fYmmYx2JEZ9Wh2rHf6YZzE+nVNaJFm7DSD1W13B9/0XByq/C1wmBJdUpj9
 E6qbSNC4/js9I756Uv1Do5lakivylLbIno9hXNnw4IKoaa2RPbNExMcCGLWtKqLw0c0c
 9EXts0NBDZF/hMpkTZHNyGlXZUaLXrh8QO1FxpB8bVmwosSrwY2KCLWT/2tAVGeg6gdX
 OhgA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793415416; x=1794020216; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
 b=aaip4Rj+DWQOZoxBdg64wvKGI/E8DTdbMOvRTtrcreiNVzZYPZX3v00iPdQ+iU0bTt
 kqm1Dpmx/Apoxb/fn1ILE2KcWanyHXmFDmMHdc5QzjOsTPUPJ226ez7DHmHcUNc7rVMq
 tEVBfoAZjCu9erbP65NTKacAW6lysMGcT7F1+xBd5EN3IqkO9XaMxNF8ryZhTKisKFV0
 vgymGLrgdeXNvNvhz7oma2ZfbOMMAzP/foXO6RMa7WC/fHolRtpZjSPaW6I2O2ClwN1x
 42ZsaMLvBpKjMPNct7seh9TOSkvTTDlma4CkURHdeYcwml0NYiSVvNL2o5P2+JIRmhPN
 /Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793415416; x=1794020216;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IrJEK4Rz34flPDpX3IpkuF++CG2fC1jTcOILK6FoJl8=;
 b=hgK/lNt1IPOWkmnRe2ygOtA1eOBFhWZokMeMX8o7O6SSLjmxL+JuuLAllxlGr5AM7p
 MWVxzKIt/RpNhr4AVgoGUC9dcwPn2x2wwAQsNmkvfOSzSdGSRAL3B0oIadot10m73Skt
 lcDnL4rwM3HO9O5UbdbtK60h2Z8Ik3ygzjQ1lZMWAXqluQ/R74Pw8It/jnvAHlt66deF
 V3ecqozmzBhx98geSgse18Af6NbchPaXiT15XkPYKri5Zl/dKCzuoWDyJJlWok1A6WGM
 kmvEhlpH2xNAhagze+OtIub7SQgWIsiw0M0ZxmQSG3zPnBUL4l6SWZX7sXXH2BYtoJ9w
 5l+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMWkK3BBaAXr1uOVk6pG9cGszvHrxZPWHE4sew790eKCN9dfiMgy+hVrUjY/lS51v66bJcqNDvTg==@nongnu.org
X-Gm-Message-State: AFq9FYLz1ZrdZAcrQnOfnTaqn5frnC+yRgy+bGuCTorJ0Z2Z3JrRlsK8
 1qXc1brPUy1ARJkgCJAHSQBadhSQb7gAI+/gNKpHUc+YxQs7U+pVpCO4raOmTP5Z5Pi5jwkx2VG
 xu4lsgAfUcjSNucJizvkE69duPzXDUg8=
X-Gm-Gg: AYBFou0vJ6OpHDA2EDIi9fsnmPv252qdCuF332h4uLipGBajjh5Nm/m/16vAonEERgt
 omOLFEkGeEKp3lycvjCITs5z076c8nG9ye6XSyWctvn5iSkoVrHQJZCg2V1KRtibQdaFCBtffZu
 bRYwl2mbuiDVpEx88xhTE6S5AXMkC1nEVLnFpfBQYWa8dzsBqovEL7BdCDfHYHji5fQiAcWj34t
 FT9cJOFhqSOYpT2XT3DvsQv5rpMvKXeP5OHgdBCwQL6ic8GWiVTPvogmeRtFjVU6nQxOIxSqU7p
 zZ1aPABDWPRH2krX5aRPRFwXx9csHRW4W+Jm++A5uuavwNHFyy0zhec7LD1AZOHbYgDAHX69+so
 k0Cb/GFtOwXe2oUss16IdMUd5Jg540jEMhXxR
X-Received: by 2002:a05:6402:15c7:b0:6b1:b5ea:2590 with SMTP id
 4fb4d7f45d1cf-6b4d438bb92mr2317970a12.12.1793415415904; Fri, 30 Oct 2026
 19:56:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
In-Reply-To: <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 31 Oct 2026 10:56:42 +0800
X-Gm-Features: AclHuK84ZjRzywlmKa-ru9qdyZRxP4WT2vvy0q6jx4JGmonAqySpYfbI_27IcMQ
Message-ID: <CAE2XoE_oqCTTz0y4gmpEyMZqcf-hCDWG7P6_B09Dmjn8XqsNgA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org, 
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 9:51=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> >> type_init
> >> function that calls type_register_static(). A later change needs to
> >> pass a
> >
> > That's the point of the macro to hide the boiler plate code.
> >
> >> target mask into that registration, and the macros have no parameter
> >> for it.
> >
> > Couldn't you just change the macros to take that parameter instead of
> > expanding it everywhere?
> >
>
> Problem of macros is that they don't have default parameters, so you
> need variants for everything:
>
> DEFINE_MACHINE
> DEFINE_MACHINE_EXTENDED
> DEFINE_MACHINE_WITH_INTERFACES
> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> and now would need a new variant, with variant for other existing ones.
>
> In the end, it's just simpler to remove this and add the boilerplate.
> It's written once and never modified, so using a macro just save typing
> those lines once.

Yeap, as now I have a working TypeImpl::targets and TypeBucket locally, tha=
t
looks minimal, so I am moving forward. This series is reject, then let
us delay the EXPAND
of DEFINE_MACHINE_* macros work later.

>
> > Regards,
> > BALATON Zoltan
> >
> >> This series expands every caller first, with no behavior change, so th=
e
> >> follow-up only replaces the type_register_static() call.
> >>
> >> Each machine file gains a class_init function, a TypeInfo, and a
> >> type_init
> >> function that calls type_register_static(). The last patch removes
> >> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards=
.h.
> >>
> >> Yonggang Luo (15):
> >>  hw/alpha: expand DEFINE_MACHINE in dp264.c
> >>  hw/m68k: expand DEFINE_MACHINE for M68K machines
> >>  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
> >>  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
> >>  hw/arm: expand DEFINE_MACHINE for ARM machines
> >>  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
> >>  hw/core/null-machine: expand DEFINE_MACHINE
> >>  hw/mips: expand DEFINE_MACHINE for MIPS machines
> >>  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
> >>  hw/sh4: expand DEFINE_MACHINE in r2d.c
> >>  hw/sparc: expand DEFINE_MACHINE in leon3.c
> >>  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
> >>  hw/xtensa: expand DEFINE_MACHINE in sim.c
> >>  hw/xtensa: expand DEFINE_MACHINE in virt.c
> >>  hw/core/boards: remove unused DEFINE_MACHINE* macros
> >>
> >> hw/alpha/dp264.c                    | 18 +++++++++--
> >> hw/arm/bananapi_m2u.c               | 18 +++++++++--
> >> hw/arm/cubieboard.c                 | 19 +++++++++---
> >> hw/arm/digic_boards.c               | 18 +++++++++--
> >> hw/arm/imx25_pdk.c                  | 18 +++++++++--
> >> hw/arm/imx8mm-evk.c                 | 20 +++++++++---
> >> hw/arm/integratorcp.c               | 14 ++++++---
> >> hw/arm/kzm.c                        | 18 +++++++++--
> >> hw/arm/max78000fthr.c               | 17 ++++++++--
> >> hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
> >> hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
> >> hw/arm/msf2-som.c                   | 17 ++++++++--
> >> hw/arm/netduino2.c                  | 17 ++++++++--
> >> hw/arm/netduinoplus2.c              | 17 ++++++++--
> >> hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
> >> hw/arm/orangepi.c                   | 19 +++++++++---
> >> hw/arm/stm32vldiscovery.c           | 18 +++++++++--
> >> hw/core/null-machine.c              | 18 +++++++++--
> >> hw/m68k/an5206.c                    | 18 +++++++++--
> >> hw/m68k/mcf5208.c                   | 18 +++++++++--
> >> hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
> >> hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
> >> hw/mips/boston.c                    | 18 +++++++++--
> >> hw/mips/fuloong2e.c                 | 18 +++++++++--
> >> hw/mips/malta.c                     | 12 ++++++--
> >> hw/ppc/amigaone.c                   | 18 +++++++++--
> >> hw/ppc/pegasos.c                    | 21 ++++++++-----
> >> hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
> >> hw/ppc/prep.c                       | 18 +++++++++--
> >> hw/ppc/sam460ex.c                   | 18 +++++++++--
> >> hw/ppc/virtex_ml507.c               | 18 +++++++++--
> >> hw/riscv/boston-aia.c               | 18 +++++++++--
> >> hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
> >> hw/sh4/r2d.c                        | 18 +++++++++--
> >> hw/sparc/leon3.c                    | 18 +++++++++--
> >> hw/tricore/tricore_testboard.c      | 18 +++++++++--
> >> hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
> >> hw/xtensa/sim.c                     | 18 +++++++++--
> >> hw/xtensa/virt.c                    | 18 +++++++++--
> >> include/hw/core/boards.h            | 48 -----------------------------
> >> 40 files changed, 605 insertions(+), 142 deletions(-)
> >>
> >>
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

