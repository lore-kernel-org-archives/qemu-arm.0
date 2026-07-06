Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC78C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 17:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgn75-0003gY-Iq; Mon, 06 Jul 2026 13:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wgn74-0003gF-CP
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:28:10 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wgn72-000306-G4
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 13:28:10 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66493875766so4923013d50.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 10:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783358886; cv=none;
 d=google.com; s=arc-20260327;
 b=aszviWLq5MkRULQg9scoWEAnleq3uYc0Y3x+nr0MgHW1omATKUBddaWd8b34DoJ3J1
 vLoREgLnDkkhZ26cJlbh8jlkuEBeVd7S9SwT6PLXOScCTLr3//1UQKjRbmLdt63mFYjk
 8s8zZkH3TRAXwB+ZJgk0hp+YbFh98BHci8MIFDSkGLGd3icdeDlA1kKWlXtMp25DK+oN
 XsLhXQJ0P2T8qpZLxo3L0ajvhA59B/R9PBAlhXHAykTwp8nJO65LhxY7Mve1FD9Nff5P
 oOunwloRiEBwm6jIwyYNBfXbKmSUfb83hDY1JrvkqI7iuMfo/NGEqMr+hjEH1mYT/OEv
 02yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cV8jyNViLscs0Onpr029wrq4ZKuWT+tA/3BeKUtyGmU=;
 fh=vlaJQzZGwDfotb/um3rHniyYMY26Rd0QwuUr84cXeJw=;
 b=r0iei4hiGx80uC+Kma/k1vpKLUQCiB2AIyWZyPsDALxVxZ6fSq2q3dOSQNSAoxBi3I
 n/QgfyyL1AsfeJmvkfImGZbF0030/uwHX9wfsvfxMYUgEoN+0F7RM634Wyv7w2P0KJxq
 lJMsOpBtB2LZ+GX3y/Bttb0pvbDgBBO6g2cnZMVGuZBtdcaSLXW6OisY1i3c2T8pBcEo
 RSVIlxZ8Mg6QDnspTXWI1m6jR5X3W9vsMEYyOLKjUWeTIOs0uVa5NXVyHVdMvzYrDt7Q
 976uhfsKTWJqJDOGiYq8I0iVTbW4ugK2kqVPnpdzdtU0WGoGeLvjrnHGOEjMEJHST1TR
 C88g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783358886; x=1783963686; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV8jyNViLscs0Onpr029wrq4ZKuWT+tA/3BeKUtyGmU=;
 b=WfzuN1EIXbi8v3inw22kkVL97nweXeRWZjev77nYl4r2U2wQDff8TKsRaC1Vy1a7fx
 2gkq/pW/oH2bbwX1b9sOjZiJaSz8GmA4H3YhRGaOdd7VTxOZ5f67WTojKkMqAHA05wEe
 x75qopgkdbHiXbZh/NwM/lUu3rTFnhAi0FnCabI7a+pBN7JH9zIpO1vOo5CRs2EzSn8m
 7YoFzV1aN0VoYeaY4NrUHVuTzi/hzonckQgUpA4fwEiirPmUYmmMslo+Lv3tUXX0k7+V
 5M+SXl9pEMh9EACa7lmra4B8LYoNigf9ahRn/1X5TRcjdPvkHOiCjrWuVvk+HJVw+h9+
 IKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783358886; x=1783963686;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cV8jyNViLscs0Onpr029wrq4ZKuWT+tA/3BeKUtyGmU=;
 b=kOO3yISb14yrI0mXmDQEaRDrBnnAapBQqU4i0C4gWzGS+QxyEH2YrEEdWfop8C9QTQ
 7HEzC3MHq65be4cEMIF2SQqD7ObTP1f5fUZgWBcxsrFn1i8W1JG14JLlfzPuIjvHJZxD
 a+nmYJTzDjdbBlt1UGlaMNf2nfTkZ1d5dHWjQYqC0kyqePB80U+dSYLnXP3LkPuYKGP3
 ZWmIV72LPTqJtqnBFfLoMwGgNC6hxuHReJpXFXTyNv2WBZnFLkSAmPL+jA9Dw2aVR2jD
 m4FwOMQGKmzxpAJSzuTKEx3OhFm6L/o8aL6yyPWbTwHwvC+4PRS0Zt7O4xZApagrnfaT
 Z7rw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqfX6yCCgPRb0JhvD2vJysW5jzpTdSscxSt10HAdrxvIQTI4OGEC6i4ysbUIEJ+HcQZWEfWEYcFnA==@nongnu.org
X-Gm-Message-State: AOJu0YxPqvwW49aHZ83idyVTVYhz1uzTjR/4vFDXr/HvbLq3yV5k7qE+
 hh3SJ6p2zRqtszt7ZYNW5lkDIe7hllsCycli1wkTgUJ+3O7ZVyy4PcLjSuC/R5sYyxALfzmJl3t
 bBqQepUxn8n1F0nOU/IpF9x1VtyVNx40=
X-Gm-Gg: AfdE7ckCCSOiA8qfPOjFQkKN1nfsAmnrEJUF7+639z7gvQYY/VyIiFT4t0GC+sHvOk0
 QBAjEHzcrO4JJyw1PtoQk8PWoEMQhioRXAbPHLQDrCc4qA5QY9sWCHoUnsnCqG2XMs40a9Re0kl
 NkKfpzDQxPv9pD6nE8sbw21Xs145ReGFwv5DT1kKVqxukyhNfZ2x69CUE+9Vf7UtuNVT4n8wh+1
 o2XdWQdXfG6Br71NYWvwyaH/cHBQyuchOU/1q/ZjRVWxw1sXLnKonI3rOejJuQxxVkP/uXIN8jb
 2A==
X-Received: by 2002:a53:d685:0:b0:664:ae68:33b2 with SMTP id
 956f58d0204a3-6677fd4b544mr1013371d50.83.1783358886093; Mon, 06 Jul 2026
 10:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260630135729.466264-1-bin.meng@processmission.com>
 <20260630135729.466264-7-bin.meng@processmission.com>
 <7410bfdc-e1b8-4cb7-8e55-5908104290de@oss.qualcomm.com>
In-Reply-To: <7410bfdc-e1b8-4cb7-8e55-5908104290de@oss.qualcomm.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 7 Jul 2026 01:27:54 +0800
X-Gm-Features: AVVi8CccFIzUZROxlZgb0GI4aUt9U36EcUho8WC8MDPxu4g_CtnqYTPxLYxPjxs
Message-ID: <CAEUhbmVs_=483r+fW1dy7seJ4Hh=eYhSGVku5BTsAxn=qwynsA@mail.gmail.com>
Subject: Re: [PATCH 06/10] hw/ssi: xilinx_spips: Fix dummy phase handling
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb134.google.com
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

On Mon, Jul 6, 2026 at 4:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 30/6/26 15:57, Bin Meng wrote:
> > The ZynqMP generic FIFO encodes dummy phases as a number of
> > dummy cycles. QEMU's SSI bus transfers whole bytes, so the
> > controller model must convert the programmed cycle count to the
> > number of SSI byte transfers needed for the selected SPI, dual SPI
> > or quad SPI mode.
> >
> > The legacy Xilinx QSPI snoop paths had the opposite problem after
> > the m25p80 dummy handling was fixed. They still treated each dummy
> > byte queued through the FIFO as a request to generate several SSI
> > transfers based on the current link width. The flash model now
> > consumes dummy phases as byte counts, so the manual FIFO path should
> > forward one SSI transfer per dummy byte.
> >
> > Update the Xilinx QSPI dummy accounting consistently for the generic
> > FIFO, manual FIFO and LQSPI direct-read paths. Also make the command
> > table report the dummy byte counts consumed by m25p80 for dual and
> > quad output reads, and account for the mode byte before LQSPI data
> > reads begin.
> >
> > This matches the ZynqMP TRM (ug1085, v2.2 [1]) description of the
> > generic FIFO dummy cycle entry and keeps the controller side aligned
> > with the flash model's dummy byte ownership.
> >
> > The description of the genenic command fifo register says:
> >
> >    When [receive, transmit, data_xfer] =3D [0,0,1], the [immediate_data=
]
> >    field represents the number of dummy cycle sent on the SPI interface=
.
> >
> > [1] https://www.xilinx.com/support/documentation/user_guides/ug1085-zyn=
q-ultrascale-trm.pdf
> >      table 24=E2=80=9022, an example of Generic FIFO Contents for Quad =
I/O Read Command (EBh)
> >
> > Fixes: ef06ca3946e2 ("xilinx_spips: Add support for RX discard and RX d=
rain")
> > Fixes: c95997a39de6 ("xilinx_spips: Add support for the ZynqMP Generic =
QSPI")
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > ---
> >
> >   include/hw/ssi/xilinx_spips.h |   2 +-
> >   hw/ssi/xilinx_spips.c         | 120 ++++++++++++++++++++++++---------=
-
> >   2 files changed, 88 insertions(+), 34 deletions(-)
>
>
> > diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> > index f6e717bc01..fa98dc2dd8 100644
> > --- a/hw/ssi/xilinx_spips.c
> > +++ b/hw/ssi/xilinx_spips.c
> > @@ -192,6 +192,10 @@
> >       FIELD(GQSPI_GF_SNAPSHOT, EXPONENT, 9, 1)
> >       FIELD(GQSPI_GF_SNAPSHOT, DATA_XFER, 8, 1)
> >       FIELD(GQSPI_GF_SNAPSHOT, IMMEDIATE_DATA, 0, 8)
> > +#define GQSPI_GF_MODE_SPI     1
> > +#define GQSPI_GF_MODE_DSPI    2
> > +#define GQSPI_GF_MODE_QSPI    3
>
>
> > @@ -457,6 +461,7 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZyn=
qMPQSPIPS *s)
> >           int i;
> >
> >           if (!s->regs[R_GQSPI_DATA_STS]) {
> > +            uint32_t prev_gf_snapshot =3D s->regs[R_GQSPI_GF_SNAPSHOT]=
;
> >               uint8_t imm;
> >
> >               s->regs[R_GQSPI_GF_SNAPSHOT] =3D fifo32_pop(&s->fifo_g);
> > @@ -484,7 +489,54 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZy=
nqMPQSPIPS *s)
> >                   }
> >                   s->regs[R_GQSPI_DATA_STS] =3D 1ul << imm;
> >               } else {
> > -                s->regs[R_GQSPI_DATA_STS] =3D imm;
> > +                /*
> > +                 * When [receive, transmit, data_xfer] =3D [0,0,1], it=
 represents
> > +                 * the number of dummy cycle sent on the SPI interface=
. We need
> > +                 * to convert the number of dummy cycles to bytes acco=
rding to
> > +                 * the SPI mode being used.
> > +                 *
> > +                 * Ref: ug1085 v2.2 (December 2020) table 24=E2=80=902=
2, an example of
> > +                 *      Generic FIFO Contents for Quad I/O Read Comman=
d (EBh)
> > +                 */
> > +                if (!ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, TRAN=
SMIT) &&
> > +                    !ARRAY_FIELD_EX32(s->regs, GQSPI_GF_SNAPSHOT, RECI=
EVE)) {
> > +                    uint8_t spi_mode =3D ARRAY_FIELD_EX32(s->regs, GQS=
PI_GF_SNAPSHOT, SPI_MODE);
> > +                    /*
> > +                     * Some ZynqMP GQSPI drivers, such as Linux, use t=
he data
> > +                     * bus width in the dummy GENFIFO entry only to co=
nfigure
> > +                     * the controller mode. The immediate value is alr=
eady
> > +                     * the number of dummy cycles for the dummy phase,=
 which
> > +                     * follows the address bus width. Reuse the previo=
us TX
> > +                     * phase mode to convert cycles to SSI bytes.
> > +                     *
> > +                     * This does not make the model Linux-only. U-Boot=
 emits
> > +                     * the dummy entry with op->dummy.buswidth, so the=
 entry
> > +                     * mode already matches the dummy phase. Its opcod=
e and
> > +                     * address phases are immediate entries, not DATA_=
XFER TX
> > +                     * entries, so the override below is not taken for=
 U-Boot.
> > +                     */
> > +                    if (FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHOT=
,
> > +                                   DATA_XFER) &&
> > +                        FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHOT=
,
> > +                                   TRANSMIT) &&
> > +                        !FIELD_EX32(prev_gf_snapshot, GQSPI_GF_SNAPSHO=
T,
> > +                                    RECIEVE)) {
> > +                        spi_mode =3D FIELD_EX32(prev_gf_snapshot,
> > +                                              GQSPI_GF_SNAPSHOT, SPI_M=
ODE);
> > +                    }
> > +
> > +                    if (spi_mode =3D=3D GQSPI_GF_MODE_QSPI) {
> > +                        s->regs[R_GQSPI_DATA_STS] =3D ROUND_UP(imm * 4=
, 8) / 8;
> > +                    } else if (spi_mode =3D=3D GQSPI_GF_MODE_DSPI) {
> > +                        s->regs[R_GQSPI_DATA_STS] =3D ROUND_UP(imm * 2=
, 8) / 8;
> > +                    } else if (spi_mode =3D=3D GQSPI_GF_MODE_SPI) {
> > +                        s->regs[R_GQSPI_DATA_STS] =3D ROUND_UP(imm * 1=
, 8) / 8;
> > +                    } else {
> > +                        qemu_log_mask(LOG_GUEST_ERROR, "Unknown SPI MO=
DE: 0x%x ", spi_mode);
>
> Is it safe to let the previous s->regs[R_GQSPI_DATA_STS] value?

Yes, the previous value remains zero and won't pass the sanity check
below (see /* Zero length transfer check */)

>
> Alternatively simpler as:
>
>   if (spi_mode) {
>       s->regs[R_GQSPI_DATA_STS] =3D 2 * (spi_mode - 1) * imm;

No, imm should be divided by 8 as we are counting bytes here, not cycles.

>
> > +                    }
> > +                } else {
> > +                    s->regs[R_GQSPI_DATA_STS] =3D imm;
> > +                }
> >               }
> >           }
> >           /* Zero length transfer check */
> > @@ -550,7 +602,7 @@ static void xlnx_zynqmp_qspips_flush_fifo_g(XlnxZyn=
qMPQSPIPS *s)
> >       }
> >   }
>

Regards,
Bin

