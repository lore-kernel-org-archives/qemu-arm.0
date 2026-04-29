Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF7FF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 12:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI40C-0008JT-Pd; Wed, 29 Apr 2026 08:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wI40A-0008Ib-Sc
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 08:26:50 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wI409-0003W3-0N
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 08:26:50 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6501d242e3fso12029948d50.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 05:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777465607; cv=none;
 d=google.com; s=arc-20240605;
 b=Fg7tPxjV1fVvgXXzCR2KVpF5nV5YUZQ9AUm8c9iXlMKZqrqr6tOQaMl/zhnGNqidZq
 AXRyeC2B7V83LgV0IyupoWogZJtf7SzsTdMZLE1JpBNyYAF20S2dwJf5rQKh8czVPg7H
 lhyZ+AHxWGjwIvTQgyf1AeI0duwmgBdlGpavMJDtrrBNeH5XsPOTvHo5OaTGXHIEPnH2
 9W3nAKPS9zs4Hokt1X704zUOg4svgngkov3tLAtQ4MakOBj4nCXM28P38FFP4xx1HDQ0
 5ts8Vs50gV7b1L7T7jPPR0x1ZPkoSI9+ut9J0e2+MdJuQO1mbYD2xUWzQcE/bZIzEgP7
 ekcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EwGdksgi20BRYKCVCuNf0F+Y5NNX3iBGHIlo8Hqvv+Y=;
 fh=vBBDEUEujA4PLUJwbOMxsKqiWyFrOgo/fw7VdiRjIfE=;
 b=BhhW5JNu2qYOG8NlHUOKznsCa5ylg3AYI9Z7UijjkrVKTebGkmGCvKnOdzX1kY7c6R
 82kI34M1+WoawmFE+OROlQMt2NqQkU/+j9S2hHueQTr/jOafXf4jumdQg7xKALYPvjYm
 R0LKOjSWkkuXTK4qJ8s3keKhd4LbYyLV46xm9/cydm9/UNsIIerkUrQwIUq/h8DIAkzJ
 UrRRtZ9bgnVNNuBKlGgmBbGbV0Dk3UtNSA45rOifUR1v1GbsodK3hboGhTniwkb9/ii+
 0vTu3GIbBFt9AdbkdRXN5dtvn7rIMcitB/SrDGgRe+9wIyWq2T8xAW8bisIHpdnXnzhV
 tC0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777465607; x=1778070407; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwGdksgi20BRYKCVCuNf0F+Y5NNX3iBGHIlo8Hqvv+Y=;
 b=p1/r/kkmtqIYXxBIVAe1EwAN9wEbXNXWXKrhWQs+b1ssY1kzWnrXWVCYWr/ndo2A51
 Fja0wTtkWMbhjPhxc3dRdM8h9VlKW96mahBcG6Ix0XBvC+9705jgF37OY2XI3HFdCj0o
 C11Jx7qZtEVnKJTs0PKs54ysV1S6eVk4OBiSPDfjrZrSqYE+qn58wOn++jL2+jlnLR8i
 dSNDPSnBPbnlNDEjSMrJvZd1RmHeQ5LYsmsVymq7Fg2K0huTQtX/QtvvOHaUnGWKsKB/
 KCa3x8WJv/4SuTNDCOSHJjP+AluQ24pi+ISpK4pdX7FxmvaCVkwk0LDTU33ZrA/HlOox
 yisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777465607; x=1778070407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EwGdksgi20BRYKCVCuNf0F+Y5NNX3iBGHIlo8Hqvv+Y=;
 b=sBarVGyP408QotAHQ/JDHgJ2JYeq0w6Bu4jNoYytLLUju9rWmig2Pg+gsgeqvWCWvf
 Qr4PSS58ci8rnnHT5XGAYGSBZo8dVnd8jOjkPHUVtZLrDM1p1oOdgRajFmgIonf2fZUb
 1q4iBirQY04PZ6h1KYYOLmqtH7uZycRxfsnkf/teU4uZx9DR2+Nsu/vse0n/rOLxfFFC
 REeN21cwoH5OQkQSFQgQpmnG71sKem5MzTxMp9dyF3tY+ZFCT275IxWt0fcJn2Z8yHXj
 p/KyVj9zjiP3/NL58Be0Ij/g3oiY8X29mY9qxKIeTfl55PfzTHusTzYy0paPJv/mLGzs
 Uj6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9U5iGffbpdw9GBJJVJj86CZkH/2skISX0ZFyBGQ0jaxWAYfjzd3j3FARQ851DStMFOVmlxC8/l+g==@nongnu.org
X-Gm-Message-State: AOJu0YyrTLzL4yWsp8c7JwEeefpobWo3uD857myN8oTMWtjKqvtI3JTO
 58+xBq+Av/kmJnRp7NSguaD1gTgo1mb+6rDUTeYcJTp11TNnd0d1XKtRFv4+6qJD+TwbbQU945O
 Ls+qGtnuKnOgOLOwW+PeVVY94V2nb02hPTBdmg3C1Aw==
X-Gm-Gg: AeBDiesHuTygrNPvvXLRAxIT0ibv0ugGn6LUXhSECTmiGLaUzHfpkVh1ao+EV7CKzZh
 Lal69vMBS7AEp7piCXsUCHXbR0EwYX6D0/9s50OGME87pc83cJH0pnMNfLKRostEfQOnP1nJgAm
 /ej9P8B93kDvkaQCJmJuHJRO7Ecpuulc5ucM8yZyO9/Nf4/OOR6ZiMBrBl+fGURap4ygHz9pA9F
 nH4WMRrJfX+EAmklrZ9FyuD3QDqHW2f4VbT0SHPClQvMr9XayVv93hSPt5xNF6XBsCGRm66z+xz
 QxxjwuIwIos4U3LbrlTQxGvT84Q05PFvb5anOAtbXQkLLVCOo3csaLDjtGTlyc+uOirVxDP2pMG
 lXA==
X-Received: by 2002:a53:e1f9:0:b0:650:88fa:f716 with SMTP id
 956f58d0204a3-65bfb893165mr2750693d50.65.1777465607457; Wed, 29 Apr 2026
 05:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-3-peter.maydell@linaro.org>
 <22ce7f65-39ee-45cb-a021-ac275d036f38@linaro.org>
In-Reply-To: <22ce7f65-39ee-45cb-a021-ac275d036f38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Apr 2026 13:26:36 +0100
X-Gm-Features: AVHnY4JVCX6KjxR99iaIxZWBDvVmLgSRQLNyiwHMWrkbUUU8yGX0gEHpw0qFbTI
Message-ID: <CAFEAcA8SpD+X0kLg-6kQ+TR2VSJqhtMpzQrfsOqEZE_EzfkW3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/npcm7xx_fiu: Specify .impl for
 npcm7xx_fiu_flash_ops
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 29 Apr 2026 at 08:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 28/4/26 11:33, Peter Maydell wrote:
> > Currently npcm7xx_fiu_flash_ops provides no .impl substruct; this
> > means that it gets the default of "implements 1, 2 and 4 byte aligned
> > accesses".  This is more constrained than the device permits in its
> > .valid substruct, and also narrower than the functions are written to
> > handle.
> >
> > Add a .impl substruct matching the .valid substruct; this means that
> > all guest accesses are handled directly by the read and write
> > functions, and are never synthesized by the memory subsystem
> > performing multiple accesses to the device (which would not behave
> > correctly, as these read and write fucntions have side effects).
>
> Typo "functions".
>
> >
> > Based-on-a-patch-by: CJ Chen <cjchen@igel.co.jp>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/ssi/npcm7xx_fiu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> > index 02707de350..2d5bed005a 100644
> > --- a/hw/ssi/npcm7xx_fiu.c
> > +++ b/hw/ssi/npcm7xx_fiu.c
> > @@ -250,6 +250,11 @@ static const MemoryRegionOps npcm7xx_fiu_flash_ops=
 =3D {
> >       .read =3D npcm7xx_fiu_flash_read,
> >       .write =3D npcm7xx_fiu_flash_write,
> >       .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .impl =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 8,
>
> IMO this device should be adapted to have byte granularity ops handlers,
> thus .max_access_size =3D 1.

Looking at the implementation that doesn't look like it
would be possible. The implementation does operations
to start an SSI transfer, then transfers the number
of bytes written. That makes "guest does an 8 byte
write" different from "guest does 8 separate byte writes",
and so the read/write fns need to really handle all
the possible access sizes.

thanks
-- PMM

