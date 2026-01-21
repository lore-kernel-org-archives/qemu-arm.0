Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4391AD46951
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 16:54:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vibTP-00088l-Uf; Wed, 21 Jan 2026 11:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vibT1-00081Q-V9
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 11:54:05 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vibSz-0004aE-I0
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 11:54:02 -0500
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-501511aa012so140721cf.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 08:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014439; cv=none;
 d=google.com; s=arc-20240605;
 b=T8QsTZZRzycPnOBpSiLiZ/kOerX36cjSbe9KGK7OC26xMMiJHhXbDN8swN2yGwOhIo
 SSccB2rJWSdG2bTJiTzFo0EzmIzsSNnBZdGlbl67Lfrdf8hZvo1d5kX0vIU4BNXh1hAb
 +HroYTfx/iH9UKMj6eYn9gm+4ubMvRe6LBUnbRNAm8I23A8bzLoihxZQkA0ONtK4oL89
 VkdV39v6PkufI98phZBV+pCZ1JowHLp6Npb3eM6gkwZfIWkZplyf+oObmFwoynctXBx/
 TZWXHeogOHv8Bt2uHNxaZ2BARkcDBzZFjJuKze+kVHfy5DW7Vv5My3yQtxMCIpmZ8EI0
 DrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zVBXv97/W8tGi1TQadV2BmfMIlfNcnjKlrvG2zWQQpo=;
 fh=2vgElyDM/dKjDKpL1Rv4++BNMvDmmW0E+OUjUTHx6kc=;
 b=fZhV9cLpsqaUFPKq02iErh5matYp0CM8VFEufKspWn//akJ17Lx0zcaPs+MJPSZd5D
 qy/v6Dhzh+qioul9KItIz+bjhvhS8j/g/O1Hs6aVIM2lpvezQLZLJhsO14tSipnNkrCO
 fhtYx7MU197+ZAkxrN0+KUHGrIJWCR6b6I4AEY5auZ6+aM7optZQ8bpiMYpQXC3Co+yi
 m2OpBJH39D/h/mfiR2OrnJnyFwYpPTW1hN+o83iz9TSegRqLlXBu/IFHTXjuf791cHL/
 fp4LbspkEbq69fr8Ek/PG0wRLe8nMvLx60up9z/SaxknYmF4vy+zpb1mvNukA5uicd6V
 pYZg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769014439; x=1769619239; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVBXv97/W8tGi1TQadV2BmfMIlfNcnjKlrvG2zWQQpo=;
 b=UW+E8ABvCoA5kYC3gxo3woGV76JyHGjav8SL/F7BaqBT0C72+JSnvvijoZTGkVro/7
 jYjRf69MXBPVkMdx7EnAyZbxzLikb/IOhgEdtoa2+Jkaqoko5gx3riv6HHfCfUI7Sz2u
 /oesFiN1XR7FLlyrn6Fx8yEulc1mgmAjRXdZzRR6tPtDXS66Mzmb6JvRg6G0zK6pSrXq
 GcODieJ+hfCfso9pxo0otl1qmUvRJTwMxpA96YYAjXxmzfAnu4B8ya2WEZHhd/y3osp6
 dIulTqpnhfhB0oGqWWBnYUNC35PdIsWSy4N2ar8kiLpPslzkem1yFuidtfQtET3634bj
 MN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769014439; x=1769619239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zVBXv97/W8tGi1TQadV2BmfMIlfNcnjKlrvG2zWQQpo=;
 b=tOgsJbbPOIyE+wNQvAfoootUy4Oubkb9s9dMbtp0MDPO0ESt08Gdze7YyMnribYnCH
 xkdMnbHUdhfda0NvwGt5AnH9yy5qE2pmzYr9qbpC4fhcTxiv663M3iOL7+FyZMZgt8xG
 nJTPTXYHW/+ADBOs34rzM70RPaHK85CAo2VNx15QH5Kj2N4q+Cv6ktBRCOFwlFNiZzla
 4mJdnNcO3xaX899OtOAA6ZtLQK+TX6hxgIqo+wiOViyDywLHEKbyaY8LlXeIVD2xYamI
 eSvycomwzqi+iOIZADfOzUnxj8tDkyi0xUoh0AwipwcPWznetF+ffaeJySqNqAh5w8Jp
 6nCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQiKzraRM9yxE+BI/Kwn5+MUNx0/kVtD8n2MMOlQHUMX9Nlnm/ZuLVCIIL5pWe5/SvVwh9ObqV5A==@nongnu.org
X-Gm-Message-State: AOJu0Yw+v8Q4M0mGrKmJKHGD7j2JEErXyfmCnb5FUldzr3EAwDGaralO
 j8wZhRKN9asAgYNYW53i0Vuq4OKWcNf7eaBeSNv68kcfXjwZzWT613otJN6uSvr9nFSpJTx7/UB
 0g0297tFJnUptqNK+t7xmEy8O5THDLHNezn3BlbjZ
X-Gm-Gg: AZuq6aI6+8RW5JeZfiwixVNaBASAKw9u3t+dEQG7EOiJw1XZ6Ane2vAWxz1fEM0Y78c
 F9fvbbuNpHqclGPUQcKvbEXs2IxIa1qhU972/mJQIZ2dxKvcgCuMi0o4XSaGEtuZfdYCZSfilo3
 CrJoCZA/Om0uF7ZFT5kpccT3y9oIoLo/elQm4UXMJ9nRMWJ0PfmZmXlS4fKCxE78AIjCOfMFOrQ
 uTGYhok9Hg3vSF6sHAVTGFWfmknxNLMUUY/6thbTY4YzirtW761SXj1AVfTlJzAOWKTEst4QW0p
 D7WJR5nlEVfwH25+HscssmBiAqbLUGJY0TtZCw+LnvXYwScOenbL9XHLMfxpboYpwuwFxcLv1lg
 wNUOj8NGtfPKlqMQsCopa
X-Received: by 2002:ac8:5a54:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-502e1a9caf0mr10764851cf.15.1769014438997; Wed, 21 Jan 2026
 08:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20260120211116.1367476-1-nabihestefan@google.com>
 <98c165bb-3f39-4254-96f4-7965bba8fcf2@kaod.org>
In-Reply-To: <98c165bb-3f39-4254-96f4-7965bba8fcf2@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 21 Jan 2026 08:53:46 -0800
X-Gm-Features: AZwV_Qjg5CgB9KpdltIBMWSc1TH9TuPwv9maHpPYQ1QiQHbkSZZLVLCTvqugsIo
Message-ID: <CA+QoejUoZkY8UgA7u0_gd2+ydFbefrC61qm3C_jUrOcjyuvdHw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/aspeed_i2c.c: Add a check for dma_read
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, steven_lee@aspeedtech.com,
 leetroy@gmail.com, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, 
 joel@jms.id.au, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -177
X-Spam_score: -17.8
X-Spam_bar: -----------------
X-Spam_report: (-17.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Jan 20, 2026 at 11:43=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:
>
> On 1/20/26 22:11, Nabih Estefan wrote:
> > If aspeed_i2c_dma_read fails in aspeed_i2c_bus_send currently, we get
> > stuck in an infinite retry loop. Add a check for the return value of
> > aspeed_i2c_dma_read that will break us out of said loop.
>
>
> Have you ever encountered this kind of problem ?

I did when testing the AST1700. In one of the patchsets we had the
DRAM memory initialized but not the address space (v5 has this fixed)
but it took me a while to figure out what was happening because
instead of failing a `i2cdump` or `i2cget` command, it would just
hang. Presumably it can only happen on misconfigured or failing
devices that have some address space issue, but since aspeed_i2c_dma
returns an error if its fails I figured checking it had no real
downside.

- Nabih

>
> > Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> > ---
> >   hw/i2c/aspeed_i2c.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 1b8ac561c3..3de72db652 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -272,7 +272,11 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
> >           }
> >           while (bus->regs[reg_dma_len]) {
> >               uint8_t data;
> > -            aspeed_i2c_dma_read(bus, &data);
> > +            ret =3D aspeed_i2c_dma_read(bus, &data);
> > +            /* Check that we were able to read the DMA */
> > +            if (ret) {
> > +                break;
> > +            }
> >               trace_aspeed_i2c_bus_send("DMA", bus->regs[reg_dma_len],
> >                                         bus->regs[reg_dma_len], data);
> >               ret =3D i2c_send(bus->bus, data);
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>
>
> Thanks,
>
> C.

