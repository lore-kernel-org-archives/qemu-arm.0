Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200BAC61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 11:04:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzXuD-0005kP-QJ; Thu, 27 Aug 2026 07:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXuC-0005jK-U4
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 07:04:24 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzXu9-0003kr-VV
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 07:04:24 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-856114a8247so25200647b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 04:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828660; cv=none;
 d=google.com; s=arc-20260327;
 b=MXZqtHo7sWTPtaneIWtISR8Bm3RoSlEcDO1gxDBjd04zrzfbMsz/Jamo4sMH5aVL8V
 i8MSKibmJCiS0d9CDx6q/1nHv4KXJr4CNLyEvMtr7wSD32C/qEssX7yVV0nnMOI+7JyC
 uy26IjiHtzy/QTwxZwhNqjJ+9O5RZ8tUNM4tV1Z/WiOdjjqdAJyf7ioWrni64lJPuzKA
 G2X0dcM860Iip+4iAkz8kpfSGNcsBmp5IVcKN96cXOVe+O5uNH69VN4//EzuvcMWG0YV
 RDtENX/kukV64T3FzA3FoO3QfczSdW5NyHwjmBIzz75z1eRfAgVG3/vP16SANZJth72z
 0a9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 fh=7+T5wWJdYnK4Ok+BgYL1GUngfJp+IVPI5037OsCmPrg=;
 b=AQ6GrwtweULO5YIR1XI49094LwMCH59JLgfJUhPkBMBDhGhPgblz6+UEPOYrY9dI+f
 lvh0yQ0wqOfxh+nLjdjAWTZkXjBvuSCFry9LcAzvmei/UxorEZ82TiMX5f3VFTD8WLpx
 xdA9c3JA/Ev5ujy4oVlHIQXzN3LpdJFuHCQLeeCFLI4wB84BCx0b6/fLBJZQfUmVQqAg
 ELhbZ2WD6AQJ/nrtt8sCFXD8J1GIVKO+PSBdD5r1nNdkYjsTXLdf6RK7aLwUaY4fJXEH
 oLUF3yUiOf+Y0dhZz1ppfKXOY+6p33nCEAvMniZGxhYqx9cfn8qmUW8mTndE6M1ZHg7Z
 5fvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787828660; x=1788433460; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 b=JzB2CeTDmjOetgIY81T2uuUGxHJfGv6Ks+LfIXdcOsKptODdxu/gU8JiqLal6K9CUF
 x1ilPnXOA1rltU8dXqtaq60Bn4K/1kQ6KfF8PkARy6yP1Q8xTHRf63SjxOlG4WbEzg1p
 cttRJ0GfvqACBaZZqh62D34NWOdWRr3y7gyH+TLHHkDvt5GLiM3gJ+vnTmFm4vvdLtUI
 V/OCZQWfIAjGM30kVk9GJ7fqBptMavuJpW4RRBbzGJ/8N1kyfN1ay1ysRocBRGZMx03A
 stgop1qTmcjbkC3UeVJ8yc5GTyIs9HVAdgf3a+P2QEBJ3EWQ4YE4z0irdBx1CyC2Sl7k
 fJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828660; x=1788433460;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Iu0DYiwTBjZAqxBhxvWkXCRfBRIlAnV57KmL/gKnpn8=;
 b=tJWRxTuJ5SXmvB3oelcwx80Y8a33Yc1VkqIYpiAgHms5T2nDgkv7fiRbQiF6SwGEYE
 jy0omkIC/hzz3yOvmBmfkfkgu1mtYj36CIMvu4aZVXJiFpQF5XK3iuI5qSdRnH1CLE8K
 JrCVyOR3Zs1FWTG0H46fY7Mlg0WqSyAs0klXqTNp4HqSl6Q/N2VWvMdf7sBvuqXRlveq
 9Y6hpTn88X4OeThgcIG34s9vYdERvkjUW3+dE995DLIZmMzblNRqOeebFFYiDNdbvrlx
 9visqTFNPwDdMew6MBJPn52H2I/yWS0vFMfYiDuGdEaAgmJvHGi5IFTSNLyZpAuQueNZ
 u89A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqjrjHhIkupwP7pb6rE+2dcI5T2p5jHNCJsTk/Pu/gXGiz+/Yc8JBnOm82u0sN+hfruJ3YUsVJa/w==@nongnu.org
X-Gm-Message-State: AFuF++lPUSLgJmlt9VjCSUGJWlNXnARdq5DslV1wHcQK+SJ6hr0Uk3Q7
 chYk6/I8tZvstYbih4rqjdyZJo4/POArgVoOyPvigSsIeyd1nx14gKPNuX0paiVDNkBbp9fWuTi
 2l+OKvYrhRKdhtp6xxoJwZ0rCytrWT1lXJsYt1ZJrkw==
X-Gm-Gg: AR+sD10MWy86m7OjKIbmcmlloRF6bbWjqGSAY2mctRThkpqlZH7PWLOMba554iYf+yK
 Rm/nhUIWr7oxir9xWfecoKuhG701MrUogN7R5Zw3vLwAndzz50ctDJUenZrNvm6O2Vdb9TNJY8u
 nA4JHn3s/SHzCfSi9A98rmsyNPtSkmZ36qGisHLi2mqCxUjXJ+Cv2JhsbZOzAfmTtGOwILftqbH
 AE/DQGgKh8QhuYT1xwCjIsN2RW75p6EBUqmBkX0x3mjmb7XMbztiHVXhk9Vtf14lDTTHMhV58NY
 Ty4qJlQP1gxLBf900WCRKi8p2FA6U7pd/JfxpqfWEbrsrqxTdKz5i7gA+7l+WHx8tISRIbuWJNw
 MpnMCOfr4Ur+RzoRkekTc5RWzvAtG
X-Received: by 2002:a05:690c:6712:b0:80c:f6bb:565d with SMTP id
 00721157ae682-8573f8d4651mr64851937b3.19.1787828660205; Thu, 27 Aug 2026
 04:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <20260825040452.1322251-4-stephensportia@gmail.com>
 <CAFEAcA8h4JwFFxnTQwxgC2HPAE_YA8CnLSgJo6pdhFcJeLyGmg@mail.gmail.com>
 <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
In-Reply-To: <CACYNXwKkh6zAha=ChX_456TF0pyaS-mQsdZsJ_JtP7Fq7EP2RA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 12:04:08 +0100
X-Gm-Features: AcwNN1WRfq0VDNfulzacLodd4hvR8x9Yz0LzdqgafYzvSA0joHTAn0j5Gax1e2w
Message-ID: <CAFEAcA_PS9VWXh7tagR3_kYHJQwZkVzhfxNS=9c293B3mdp54w@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/strongarm: Fix dropped upper byte of ssi
 transfer
To: Portia Stephens <stephensportia@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Thu, 27 Aug 2026 at 11:53, Portia Stephens <stephensportia@gmail.com> wr=
ote:
>
> On Thu, Aug 27, 2026 at 7:09=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Tue, 25 Aug 2026 at 05:05, <stephensportia@gmail.com> wrote:
> > >
> > > From: Portia Stephens <portias@oss.tenstorrent.com>
> > >
> > > The strongarm model intends to transfer a 16-bit value over SSI. Ther=
e
> > > is no machine using this model with a peripheral attached so it is
> > > impossible to know what the intended SSI peripheral is.
> > > There is no in-tree peripheral support for 16-bit transfer, update to
> > > use 8-bit transfer.
> >
> > This is the strongarm synchronous serial port; the manual says it
> > "is used to interface to a variety of analog-to-digital converters,
> > audio and telecom codecs, memory chips and keypad controllers
> > as well as other miscellaneous serial devices". I don't know
> > if it's actually connected to anything on real 'collie' hardware,
> > but if it is then  I don't think QEMU's ever emulated the connected
> > hardware.
> >
> > The data is between 4 and 16 bits long. I think the intention
>
> In this case, how can the device transfer function know what the
> expected transfer width is? From my reading of the current
> implementation, there is no way for the device's transfer function to
> know what the transfer width the controller or guest software expects,
> only a value is passed, or am I missing something?

The device is just implemented as "I am a device which has a fixed
transfer width of X". The software running in the guest knows "the
device on the other end of this PL022 is specific device A which
has a transfer width of X", and it programs the PL022 with that
width X.

thanks
-- PMM

