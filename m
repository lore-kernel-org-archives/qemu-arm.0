Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4317331ejb;
        Tue, 13 Dec 2022 07:23:06 -0800 (PST)
X-Received: by 2002:a17:903:48c:b0:189:5e96:702 with SMTP id jj12-20020a170903048c00b001895e960702mr20139763plb.46.1670944986172;
        Tue, 13 Dec 2022 07:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670944986; cv=none;
        d=google.com; s=arc-20160816;
        b=O6zcfsAmXQ3ddZ/SM/fBgr49K+gFbyFfdKv7IkwqAlxNcA3bZ4O7dLQEJ5WIuRL0kK
         PpPG62RpfeHbrwsHgeOJsGlu0iL/78ShsSesVJ0lWl9mHM8B8V1ybAS8icqZsYTcFVX8
         juwpznzgNumAxS6qNVhXhPCocuA+n/uxrkab5bIzpmgP18mjIKHg5HEuBoReGhRM5Jqx
         NXoiA7ix4fy+Ka9+OVpKTCLbns/HX5B+kla6Udb7+XQueDRvNQtZ8phcD/hUT9FP3T1v
         6HLWLTT60MhTugzwTUlW8HuabGtsgAtOvQXrMOJsi12BcunBJQkThxeapeWKOBayMOi0
         zm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CLPrxvN2vhl7PqYYsY+X3xD5u++6hJb3p4C3MzhkKTY=;
        b=Itb6QQ6+0JgKxWVN25Tzo1N4jcHQHkdqYY+2MFrm7FiAtATChFy9isHr8jf+BZkBQ0
         xz1psmaqdm9TSZk9QDzJ8IXpc+EjHgLVtREUGZzotE79bDonhrXeviMUAsH38qzV63kv
         Lh1X9IZwCeNfHcI36bfRH3RG6yIQWxMuHsFkaPbJKB/aq4dDB0vcmij2aqtSTmUXvcbn
         F4pp5R7Ja/Y303mKDjSFKyaU/vqP7CRiafYFpWAIAD10bBGIfvftyZIkdpDy5GUeJx36
         5+x9ubFDfZNaiPB5evkFMV5PnJpEwyu/cb1t2QeZ5rqIjMY7klyjhMsZnLSg4QIx4M+V
         ZV0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTuA60uo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a170902cf4300b00186985d2478sor65219plg.25.2022.12.13.07.23.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 07:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTuA60uo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLPrxvN2vhl7PqYYsY+X3xD5u++6hJb3p4C3MzhkKTY=;
        b=mTuA60uolpj3Hnjg5CvxOxYigaHdRxbL9Opx1gdjKxKMniLx7Kw30hrPgO3NWTXn4D
         k7TL8pJbEUG+esU4qGm7Z+dL4EvzoqVPrZgMgPnyKx106hTh51dPgPoEPeBq+1p1463u
         iSvED6v89Zov1zmugG8EHYBCoVn/avLSg12XwPlx7zxLEZPnfVwYX1U6lom9xX/oSXTk
         7/CxoLAsYPbj0vIV6xujOQJ6A6x+8g0JjOQbWMoeA0YNZfD8ixtx4oR7OPIla/CVmf2T
         HVVOdi9FBcnhIvJXn5REtDq1Jq9pPU4pl9Tn1owsrbHtxzFty+5uZf87qxXmWUmbFUBC
         TQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLPrxvN2vhl7PqYYsY+X3xD5u++6hJb3p4C3MzhkKTY=;
        b=nAILbqtqADkufIGfvax+Wa9qbZQPaz0Nan3+AmVMqbvwbt2Zv/qrqsHN58Cpmi8ecO
         ZHcndVLAEgzi841GYF61XDa+S6ON82E7G/5Ja9c1rKD3zyNYAAUUR/MzfbBL86Nbbsql
         bSK0XZcpZAP1TVoHE9hxi0VLylMxfheSRrwpcgoC1wmNwKugLlixwaNIO6IUBY/mflHm
         UkTky9aLtk7AYcbF+eVVhut4C26NoZeLAoGPAEdEJl71jLcNdr3ILl0GjI5uwmCV821b
         HBmH9nvV3O4gV2+jFFR5kXE4nX0VpIdmnTJhQAtGSO++XFmSphoadQyzH9FYYUxEQu7h
         crWg==
X-Gm-Message-State: ANoB5pmwULgX7055hRT8QudpnOdZbtPrur46rhtk6El5p60j8rm8/YNa
	bs3Udd/t818MMJXl8Nt6ZxaJKcWkWOvi8aOX154x69hF
X-Google-Smtp-Source: AA0mqf45Y3as3YWNjcZQyC8sBItvyUj3eQY6dBLOSMXyoELd/vHf8d0+QUX4IJB5tp6eCatx4tQh2kFx/jPUNaFpaZY=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36093850plt.60.1670944985737; Tue, 13
 Dec 2022 07:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto> <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
 <Y5iK7VFi9B1HwHf/@toto>
In-Reply-To: <Y5iK7VFi9B1HwHf/@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 15:22:54 +0000
Message-ID: <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ghM1bT31OvWG

On Tue, 13 Dec 2022 at 14:23, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> > >
> > > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@l=
inaro.org> wrote:
> > > > >
> > > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > > Simplify byteswapping to/from brams") which states the
> > > > > packet data is stored in big-endian.

> > > > This is a change of behaviour for this device in the
> > > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > > previously on that system the bytes of the rx buffer would
> > > > appear in the registers in little-endian order and now they
> > > > will appear in big-endian order.
> > > >
> > > > Edgar, do you know what the real hardware does here ?
> >
> > > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > > should be modelled as plain RAM's (they are just RAM's on real HW).
> > > Because we're modeling as MMIO regs, I think we get into endianness
> > > trouble when the ethernet output logic treats the content as a blob
> > > (thus the need for byteswaps). Does that make sense?
> >
> > As a concrete question: if I do a 32-bit load from the buffer
> > register into a CPU register, do I get a different value
> > on the BE microblaze hardware vs LE microblaze ?
>
> Yes, I beleive so.
>
> If the CPU stores the value and reads it back, you get the same. But
> the representation on the RAM's is different between LE/BE.
> But if the Ethernet logic writes Ethernet packet data into the buffer,
> LE and BE MicroBlazes will read differient values from the buffers.
> These buffer "registers" are just RAM's I beleive.

Thanks. That suggests that the current code for this device
is correct, and we would be breaking it on the LE platform
if we applied this patch.

I don't suppose you have a guest image for the boards which
uses ethernet ?

-- PMM
