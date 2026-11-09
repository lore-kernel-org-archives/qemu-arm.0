Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4D606A322
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KkHB9Bpg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQQTo-0007zr-M1; Mon, 09 Nov 2026 09:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQQTm-0007zV-3C
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 09:36:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQQTk-0004vd-9Z
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 09:36:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so11407275e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 06:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234970; cv=none;
 d=google.com; s=arc-20260327;
 b=L616bH5fo98ErefcHuIJMaOan2uzKrRK5M3MCyd8/VVoAQLXTFu6krHz1wELvRVzvl
 W7s9zc5H19dZsTIwMiX7r4XS7+1BuKVco2SSzN2U6Rx/e+2bUGqc5E+I6npxK7GJyLhq
 ipkWTWC3iVbjIeFBlu+f5GQWw77sBWeExSvAEf16vmyJVzzdG8vHUSw7HuONG0hzn6Lb
 94c7ugO1/oFZuDFmCO+cmahfiQpgCRYRyCTUl5kvaGUmnHyehfzIHpFWilbu0dPUmNqv
 uMGbkIcwPbN3fow4dYhMrSEoyMNOCnfRK/mQZkqZ4BG3cQ23JKNIAha1KPFwU3F0Xm8Y
 3vJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TVBu8g/B5Kvwm6IESzpiTvkWGu1aiceIrlaNOatg2jY=;
 fh=V71vuT2lEAWJDcs77ZyDoWS8o7tmhUzdJp+lY9Rau8Y=;
 b=HiesakV/5ufDQ9xPFFTmTonVgW27rc/Ww7HdAe2YOCXkzniY5VWWY/rTVchz8Z9jl6
 ydpbJQOm5ddcdffrll1HyxsBI0Y9GEGXhSoqm6K+ZcF0tr0QYFrP1rUhQrCZTPQAejXv
 nqZ1o+WUlvBiORoSkabiHhPHraXRaCEZMbxpBghohXRnyvItn7HBl+jxjCpYYE8Gw3k5
 CtcYZ6Bwal/eNbOJheF6LwMNB4wVORqcggnAoYNlgr6UAySdoSEcEpmCS7JeRHOXB3Br
 iVtjLTKkIH+SmZiYnS6/qKWpgcze3NkKCsHAmwOxBIoBNuvPRGmbLjJICTGmFefbJV2M
 zEqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794234970; x=1794839770; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TVBu8g/B5Kvwm6IESzpiTvkWGu1aiceIrlaNOatg2jY=;
 b=KkHB9Bpgmb47xAMWMtSgJT+cId6K7lT2VzCnNJVzVC85SIylTiRfKDqrCSXtLHRGNs
 JxqdN8y82r5UmlM+2Q6mfVX1kwbV2Tur+QXwJtihy9O774odt+OfjNju3nEcnuNh9b8+
 XdTpRYv3JTvULaYOvk9icR+zmGPwGKaVpV9ly2zA+1oggWYuXMXIZ95kgWXSxo+g5jnH
 kyjE1ShsV/v3ufuu0q/mzWTo+zhDi5cT0rIMBFaHdADYnxCLXcdFvKv6YVEffqva2xJK
 V2mLwc4dTScE2xy0AZ4thDxSxGWWh0mERexxElSsq68H4e9+iqpfPpEY+KNTwiiFTB0M
 22cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794234970; x=1794839770;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TVBu8g/B5Kvwm6IESzpiTvkWGu1aiceIrlaNOatg2jY=;
 b=rCv4Y8CLOVAIOEJHR64f+IfqElE7wyHIdrWrZrjPnkLz8THWSa98zge76VOhRN1iot
 PZc3CVGMt4G2WMKYhm6wqOsaDnYm8i+nOqrs4+XmiKbBWrweLUWkedFZ209Cji+FXNx4
 IdyvC6zKIVdDCM7qoyTQdhS5cFaymk3P1QwM0+9Zpg8ETckOwAENYpQBF+1iva7Moy3d
 7XKTOYZE9mSRn3HpONAlpIieWBHyajI6bvUreJbXo8VbBE3ZteEp/nmMArm+8ox/NjQT
 tNc/6utIFfSbO0rZJjISXXthCQANwZXfXqeWV5B3fSN0xqgCEbyPg08JTIfoJjHMGI36
 7ejQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG0d9U6CFCYivRh8EGHYRyV4J1hcN7FnKJ+2/rA3g0tYS4ZIF9bL+aeBLKxoWgPUwnrnF7qmHlcIg==@nongnu.org
X-Gm-Message-State: APuU4Z+OXrxx6oFUytHaHHFw38eYQQdp0n5Ne4o3Ctvdro+3KYJVSvjy
 4Z3ncqko8EnswjILAShXsHp4S6F0nM6zVHUpP93ihyTjY47dA+Qsf9LFLxoU0YKED3ot6i2ZNH5
 rqvCW4Mhkbr913+QLiwiJ51if/bvwH98=
X-Gm-Gg: AYBFou0qQaYhtFvqGedVhsFlSxLakD1Eof6/PIH1mtedHXJoSKyBFpaCW4J/ZqWmBFr
 ri91H12X/gG9tCoErHlI1S5khVboQqmcFGABfL4xVhtg83qXtKodID9qGaDbk7agyqtN4z2eo18
 w9MWdio4/U05DMjOi9AE6U0o4kmP7BHzAs2r2ELDEVaNL0TkbRMiRscbJUBNogpRJ4w0HjmNYmV
 a54deG0vSxX/7hOsZDDR1IzVXiO43iloqBidRPVxFXthChbM11rksoTljv6d2e8irKTRXMJMItx
 SRDRgU2ml14HwXpGbyAB1mnpl1f9dZCwYA/JOkKdxT3/39DRuUliZVbZHl6kKmAv8GzX8/dbUl4
 xVw4Jkk8CGj1MUwZtClMN3ebVkLIV2TwSEmB14zscHxKwKSG6mwFe1Ta99SFtn/pq0xiVqP69GI
 To
X-Received: by 2002:a05:600c:3b8e:b0:4a7:9006:b176 with SMTP id
 5b1f17b1804b1-4b9633cf5b0mr99246795e9.7.1794234970303; Mon, 09 Nov 2026
 06:36:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927075108.3621107-1-bin.meng@processmission.com>
 <6047095a-2957-4d8d-99aa-055a63d753e8@oss.qualcomm.com>
In-Reply-To: <6047095a-2957-4d8d-99aa-055a63d753e8@oss.qualcomm.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Nov 2026 22:35:53 +0800
X-Gm-Features: AclHuK_73O5XZBJwLrja-nTfhBi1T3yczL4izwOEthIrvrEZtdSUsx5R4gUt_jA
Message-ID: <CAEUhbmU7McatVYi4ONnsc2hGbiQy1wzbNGPTk2O+CDGDdyyZNQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: cadence: Honor subword lanes in the GEM
 registers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x334.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philippe,

On Mon, Nov 9, 2026 at 9:58=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi Bin,
>
> On 27/9/26 09:51, Bin Meng wrote:
> > The GEM MMIO callbacks ignored the low address bits and access size.
> > Byte reads therefore always returned lane zero, causing guest driver
> > that reads the station address byte by byte to turn four unique MAC
> > addresses into the same value. Partial writes had the corresponding
> > lane-selection problem.
> >
> > Extract the requested little-endian read lane and merge partial writes
> > with the current register value. Preserve the existing read-clear,
> > write-clear, and command side effects, including dynamic queue
> > pointers.
> >
> > Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >
> > ---
> >
> > Changes in v2:
> > - drop the gem_get_register() helper
> >
> >   hw/net/cadence_gem.c | 55 +++++++++++++++++++++++++++----------------=
-
> >   1 file changed, 34 insertions(+), 21 deletions(-)
>
>
> > @@ -1636,35 +1639,43 @@ static void gem_write(void *opaque, hwaddr offs=
et, uint64_t val,
> >           unsigned size)
> >   {
> >       CadenceGEMState *s =3D (CadenceGEMState *)opaque;
> > -    uint32_t readonly;
> > +    uint32_t access_mask;
> > +    uint32_t writable_mask;
> > +    uint32_t write_val;
> > +    unsigned shift;
> >       int i;
> >
> >       DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsi=
gned)val);
> > +    shift =3D (offset & 3) * 8;
> > +    access_mask =3D MAKE_64BIT_MASK(shift, size * 8);
> > +    write_val =3D (uint32_t)val << shift;
> >       offset >>=3D 2;
> >
> >       /* Squash bits which are read only in write value */
> > -    val &=3D ~(s->regs_ro[offset]);
> > -    /* Preserve (only) bits which are read only and wtc in register */
> > -    readonly =3D s->regs[offset] & (s->regs_ro[offset] | s->regs_w1c[o=
ffset]);
> > +    write_val &=3D ~(s->regs_ro[offset]);
> >
> > -    /* Copy register write to backing store */
> > -    s->regs[offset] =3D (val & ~s->regs_w1c[offset]) | readonly;
> > +    /* Copy writable bits in the accessed lanes to the backing store *=
/
> > +    writable_mask =3D access_mask &
> > +                    ~(s->regs_ro[offset] | s->regs_w1c[offset]);
> > +    s->regs[offset] =3D (s->regs[offset] & ~writable_mask) |
> > +                      (write_val & writable_mask);
> >
> >       /* do w1c */
> > -    s->regs[offset] &=3D ~(s->regs_w1c[offset] & val);
> > +    s->regs[offset] &=3D ~(s->regs_w1c[offset] & write_val);
> >
> >       /* Handle register write side effects */
> >       switch (offset) {
> >       case R_NWCTRL:
> > -        if (FIELD_EX32(val, NWCTRL, ENABLE_RECEIVE)) {
> > +        if (FIELD_EX32(write_val, NWCTRL, ENABLE_RECEIVE)) {
> >               for (i =3D 0; i < s->num_priority_queues; ++i) {
> >                   gem_get_rx_desc(s, i);
> >               }
> >           }
> > -        if (FIELD_EX32(val, NWCTRL, TRANSMIT_START)) {
> > +        if (FIELD_EX32(write_val, NWCTRL, TRANSMIT_START)) {
> >               gem_transmit(s);
> >           }
> > -        if (!(FIELD_EX32(val, NWCTRL, ENABLE_TRANSMIT))) {
> > +        if ((access_mask & R_NWCTRL_ENABLE_TRANSMIT_MASK) &&
>
> This new TX-enable check should either be in a distinct logical
> patch, or described in patch description.
>
> > +            !(FIELD_EX32(s->regs[offset], NWCTRL, ENABLE_TRANSMIT))) {
> >               /* Reset to start of Q when transmit disabled. */
> >               for (i =3D 0; i < s->num_priority_queues; i++) {
> >                   s->tx_desc_addr[i] =3D gem_get_tx_queue_base_addr(s, =
i);
> > @@ -1679,37 +1690,37 @@ static void gem_write(void *opaque, hwaddr offs=
et, uint64_t val,
> >           gem_update_int_status(s);
> >           break;
> >       case R_RXQBASE:
> > -        s->rx_desc_addr[0] =3D val;
> > +        s->rx_desc_addr[0] =3D s->regs[offset];
> >           break;
> >       case R_RECEIVE_Q1_PTR ... R_RECEIVE_Q7_PTR:
> > -        s->rx_desc_addr[offset - R_RECEIVE_Q1_PTR + 1] =3D val;
> > +        s->rx_desc_addr[offset - R_RECEIVE_Q1_PTR + 1] =3D s->regs[off=
set];
> >           break;
> >       case R_TXQBASE:
> > -        s->tx_desc_addr[0] =3D val;
> > +        s->tx_desc_addr[0] =3D s->regs[offset];
> >           break;
> >       case R_TRANSMIT_Q1_PTR ... R_TRANSMIT_Q7_PTR:
> > -        s->tx_desc_addr[offset - R_TRANSMIT_Q1_PTR + 1] =3D val;
> > +        s->tx_desc_addr[offset - R_TRANSMIT_Q1_PTR + 1] =3D s->regs[of=
fset];
> >           break;
> >       case R_RXSTATUS:
> >           gem_update_int_status(s);
> >           break;
> >       case R_IER:
> > -        s->regs[R_IMR] &=3D ~val;
> > +        s->regs[R_IMR] &=3D ~write_val;
> >           gem_update_int_status(s);
> >           break;
> >       case R_JUMBO_MAX_LEN:
> > -        s->regs[R_JUMBO_MAX_LEN] =3D val & MAX_JUMBO_FRAME_SIZE_MASK;
> > +        s->regs[R_JUMBO_MAX_LEN] &=3D MAX_JUMBO_FRAME_SIZE_MASK;
> >           break;
> >       case R_INT_Q1_ENABLE ... R_INT_Q7_ENABLE:
> > -        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_ENABLE] &=3D ~val;
> > +        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_ENABLE] &=3D ~write_=
val;
> >           gem_update_int_status(s);
> >           break;
> >       case R_IDR:
> > -        s->regs[R_IMR] |=3D val;
> > +        s->regs[R_IMR] |=3D write_val;
> >           gem_update_int_status(s);
> >           break;
> >       case R_INT_Q1_DISABLE ... R_INT_Q7_DISABLE:
> > -        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_DISABLE] |=3D val;
> > +        s->regs[R_INT_Q1_MASK + offset - R_INT_Q1_DISABLE] |=3D write_=
val;
> >           gem_update_int_status(s);
> >           break;
> >       case R_SPADDR1LO:
> > @@ -1725,7 +1736,9 @@ static void gem_write(void *opaque, hwaddr offset=
, uint64_t val,
> >           s->sar_active[(offset - R_SPADDR1HI) / 2] =3D true;
> >           break;
> >       case R_PHYMNTNC:
> > -        gem_handle_phy_access(s);
> > +        if (access_mask & (R_PHYMNTNC_OP_MASK | R_PHYMNTNC_ST_MASK)) {
>
> A byte write to another lane no longer starts a PHY operation;
> worth mentioning in the description?
>
> > +            gem_handle_phy_access(s);
> > +        }
> >           break;
> >       }
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
>

Thanks for the review.

I will add some descriptions in the commit message in v3.

Regards,
Bin

