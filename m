Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0C606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U57pBllH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLloQ-0006AA-SO; Tue, 27 Oct 2026 14:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLlo3-0005by-Hb
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:21:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLlo1-0004Wm-3R
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:21:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so1497945e9.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793125311; x=1793730111; darn=nongnu.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=g1Dp0siwNaEU/SWF0WZH7nuxMTFpn3Zi7hKwgiaKNzQ=;
 b=U57pBllHbz5Vd0dQ+f4CfhaaO0J7FOqbNRmcyn/usKhtyuzf5FeBqXD3Ar7X3oGK0q
 SJJWMMFgiHvVwUDNBJQv06h6nOqjPQp3zq8UZ2f7V2GeD5X40B1bqNho7FfliUZEwumM
 npvW3sXNmHTE7sIQ/FDEnNe/TEjtW6mY5LfG2d4JWl7WCO/Ki0jxZ2McdBrcgqtMAgs1
 pWYhqamyMo5tzds/4J9d2mgh2fpX9YHwzhda3a4TeTVpEWWcqW371h66vtP/tdelEUZg
 oqzLbRuGHlGFEVY5O0OIt3CxGM+AIIjgN6y1TWsGLTQiyFZsnt74JRcRz6FHlApy4Esd
 JL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125311; x=1793730111;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g1Dp0siwNaEU/SWF0WZH7nuxMTFpn3Zi7hKwgiaKNzQ=;
 b=GzyefA1UBfxQkT6u8k78OUntEqS+1SK9FgMbP0hGhucSS5zcEOImV/bnJfIRx0MW6b
 8obtz1RlNLwdLTXvOHzemUtpzwaJrKWyvfNAlLagb5mFHRPx6u5MKJJg4pwFD1mfuBYl
 d8Dp/mh35RCoHiQWIX5/nsVrUhFF+KXkx+qcuoRpU4H1ghi5FLJ3QVP06UsbVODmZDxs
 nDJmu1YpI6jOuUZChS1I+eNU7cjLoJWM6FKAfOt1Mtbw91vvVN83FVzcF7UyJmYCtJKQ
 fGcJmD+7M6npYuKDMvq+Wye8hHj47QA2MVZinFG8rcMHuOf4TXfEdTptqNCgdnEZXQm5
 N+kw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzeazeq2nzogh/mfJofH+ykPAdctSyQpgVfPTQmQg+OwuFQ128jlYtqbPc9E2LdbiUS6WKS1guVzg==@nongnu.org
X-Gm-Message-State: AFq9FYKh5XbjUqoEEO5JmVPaM5YGQTo0rt5lT5bFVP1DAZH858/3ZSBb
 arcEKvHG+3AiHz14pNMjIgKysQdS+3eI2tZe/+1dd6EbplnqsHE1+dku
X-Gm-Gg: AYBFou2XDXuE6FbPfO9qQKoJlxdc0VN1SpvWrEqJapVIwO0Y3cWlDMha0PG8KdsOaem
 F5l8Cr5XyjCW+b/PDjcsFswe3zmMa+exXsRLtWwhR1X0TA5Db8eU8BxFYEgd3Eb7RCHFgG7koIt
 VynoIqehWw3OWdEK7NhBs3c8plTBaCeOAjUQxJ6VJp3bSYjfJTFrWu9TjZwXJtlNTN1VgS2UacO
 i24hlh1GfB615uDWQBQLIWIdsfGYPYihJSw/mHwN6EbbmE/F+F1xewSjVjzUSLs1xWF4OLh1i0c
 TheW3CBAepLoGiYQkFiMio20SretuX5fQ5VVomLSYukv8uL+8RoZOBFuZ+pk/8JNgW0V+zJi3TD
 YqvZy2hiANxwGaPOiUMkW/Sfx3/RAfIyAwrqCoah4CoMZtJOkXqkmz/fFKOfg0H00swrjO2T7gb
 cYWj/UNrTttlA7BfVQytrsy5nGt1wc2pCoyVo/bydy4cRxgtbOB7iVnkT5dHNozkmRC46B+kV5X
 5tvf2n1R3jJqyxGeTg4YVnd+NS+2dP4JixMKOK33ne+sqM+TGjCl46tbZh8PKhprh/cVUiWg094
 h5DYBR7RBzJDVO+sWDE=
X-Received: by 2002:a05:600c:c085:b0:4a7:8fe8:130c with SMTP id
 5b1f17b1804b1-4a78fe81333mr72476085e9.28.1793125311093; 
 Tue, 27 Oct 2026 11:21:51 -0700 (PDT)
Received: from [192.168.1.89] (95-24-99-141.broadband.corbina.ru.
 [95.24.99.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a930a63960sm5180605e9.4.2026.10.27.11.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 11:21:50 -0700 (PDT)
Message-ID: <34d63b02b1f52fa3fa7e6c20352379c334d6ec7b.camel@gmail.com>
Subject: Re: [PATCH 5/6] hw/i2c/aspeed: fix BUSY status reading in new
 register mode
From: Timur Maksimov <gessingate@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>
Date: Tue, 27 Oct 2026 21:21:42 +0300
In-Reply-To: <931bee05-0c8e-4aca-b7cd-fe53fe5d1749@oss.qualcomm.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
 <20261027-aspeed-i2c-nonpkt-fix-v1-5-076cdde514f8@gmail.com>
 <931bee05-0c8e-4aca-b7cd-fe53fe5d1749@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=gessingate@gmail.com; helo=mail-wm1-x335.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philippe, thanks for the review. I will fix the issues in the next
patch  series.

On Tue, 2026-10-27 at 04:18 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Timur,
>=20
> On 26/10/26 22:28, Timur Maksimov wrote:
> > The BUSY status is moved to I2CC_MS_TXRX_BYTE_BUF register instead
> > of I2CM_CMD in new register mode.
>=20
> Slighly clearer:
>=20
> =C2=A0=C2=A0 '''
> =C2=A0=C2=A0 In new register mode, BUS_BUSY_STS is bit 16 of
> I2CC_MS_TXRX_BYTE_BUF;
> =C2=A0=C2=A0 bit 16 of I2CM_CMD is PKT_OP_EN. Report the bus busy state i=
n the
> =C2=A0=C2=A0 correct register.
> =C2=A0=C2=A0 '''
>=20
> Fixes: ba2cccd64e90 ("aspeed: i2c: Add new mode support")
>=20
> > Signed-off-by: Timur Maksimov gessingate@gmail.com
>=20
> Email goes withing angle brackets (same applies to other patches):
>=20
> Signed-off-by: Timur Maksimov <gessingate@gmail.com>
>=20
> > ---
> > =C2=A0 hw/i2c/aspeed_i2c.c | 4 ++--
> > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 376e113e58..a2b4c8b576 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -147,7 +147,7 @@ static uint64_t
> > aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CC_POOL_CTRL:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CM_INTR_CTRL:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CM_INTR_STS:
> > -=C2=A0=C2=A0=C2=A0 case A_I2CC_MS_TXRX_BYTE_BUF:
> > +=C2=A0=C2=A0=C2=A0 case A_I2CM_CMD:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CM_DMA_LEN:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CM_DMA_TX_ADDR:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CM_DMA_RX_ADDR:
> > @@ -167,7 +167,7 @@ static uint64_t
> > aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case A_I2CC_DMA_ADDR:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D extrac=
t64(bus->dma_dram_offset, 0, 32);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > -=C2=A0=C2=A0=C2=A0 case A_I2CM_CMD:
> > +=C2=A0=C2=A0=C2=A0 case A_I2CC_MS_TXRX_BYTE_BUF:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D bus->r=
egs[offset / sizeof(*bus->regs)];
>=20
> This patch should be re-ordered before the #2 one IIUC,
> otherwise the fix is correct:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D SHARED=
_FIELD_DP32(value, BUS_BUSY_STS,
> > i2c_bus_busy(bus->bus));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >=20
>=20
> Thanks,
>=20
> Phil.

