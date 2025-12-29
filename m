Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D334E92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ4a-0004bH-Go; Mon, 29 Dec 2025 14:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4J-0003yi-7q
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:16 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4H-0000Ho-QL
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:14 -0500
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3867651cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037092; cv=none;
 d=google.com; s=arc-20240605;
 b=SXzyhGuioDcArNJvfHqjeGcUbwPqTZjwhOp9IBqCyo6cy5t3ksFSVFLIXxiKmjEQhJ
 mcANJfLdFZqtKo/6vqzDPq4mnBLTCJiQ5g91ypndjW7e9MOW8vWoMd1Y5Ai78373Yvu0
 ikri81faAGEYioGle+crKKhDIhETgyp8XjIFhMa9Bm1muXbfS3Oi49j5Cl9341juWn5n
 hGjzMPVOqpnamvsj5yB0wmjQMh8oMWxBwlS5+B+sCbYBCtA9XgtfslTjZziXYmYBnsGw
 XBom5G37UBJGGCAQlFZm2jV01JP77O8arfkG6v7NrlmKB22EkCoDUai/ELsWSmh0hxNM
 Veyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PMCl7q5Mo6Dtiuu4MLU6KbTf+Uhgc0v2z/UxK4COyTM=;
 fh=8HdWx6IPXwJi/AqiNbWRdF9yakJDiGHzpxxserC3c7Q=;
 b=cvn8Y8uLbH4b/7s4Fa6lvt+GU6HWAGe8P/wwHuBLVaKMwhj+P4SD8wftz3NgTZe/0q
 y4K7JZ/rPV7oyDRUSNIzhNhr3sXXiwvdwMyLLEpdz+4H76c42RvBe3l9BH5l5YJwfZgu
 W8vwWB4C699YZk5GxjatywxB5A6VRyCoR2YqeefzsbiDmYzZTLzPjsFJchs732mkKaRR
 rlS/AAyyiDNAH2SLEWoZysK0YKF/Xt+BkkbQ1W0nkYY0bsoYPyjCao4rkBic60vfciwe
 qXmczUiDPdcWNawn5Z4dtINrulyS5myxiCGUygyrKj7zvRU19Sm2/1E6eBA+ftKK+MRg
 VWgw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037092; x=1767641892; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMCl7q5Mo6Dtiuu4MLU6KbTf+Uhgc0v2z/UxK4COyTM=;
 b=wrpIwqG1+4e1hLOTQi6lLkqStfyvGeKBPI8g6GSDMP2m8xkbSIoGnJRwuskOcIEKJR
 R8NTzqjidT3mo2MvWKxor2BuFbv+qdTYbYPxFsDL9mU7/VY4bG3vULMaovpibj6luF6n
 4GLTE19vlusmQb9A5vcLwZrBQXNDB8GRkPmCsLboWTKeHHlkX8442CQ8aNB32g4qKW1s
 QFYbjx+bLgjiO1iDQZcSom2wKZt9dggINYVJp6ZlAgjl90ag8ge8Toj/EFYuNNb7RyyN
 GoVTnb4NnG2BR2fPuoT/edWikYmN3y6FWQtEWlcvT47bVLRRTJ+0LMsuemjrSvyUc2pr
 tVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037092; x=1767641892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PMCl7q5Mo6Dtiuu4MLU6KbTf+Uhgc0v2z/UxK4COyTM=;
 b=AK37Vofuf4TZ6VQ6csTvlUPClUb143i4VVORksVT9dr1YvmAPLiZOh73BfjOJDi2T8
 Y3yT9WwM//7/SpYXwhiCsSYxjHVqa0yWW89KIGw1P/ZRvJKs4lDSHZiCGu6qQJKWc9i6
 iMfdUn+U7dgWTG6GLb2TFcdnzTdvLWQbHaZtnQ7/tzPnzPHkbqZ2cmfIphTOhu3ZG+TJ
 zxKEe1v+P6GrGXyBoksqX/bdF3PpjvD6ZJweLd9K1uh/JRrqnhsqgSY+SDNAcASC9GSw
 TwXNWkC1RSnGGTz4R1gTc36VsaYQg/ulzwBwV29+LRZ9Mgu8moKX8X71Pz2AaLjvFmDk
 hBKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnm46UAq02tl8d8LaHSTl04GfQGLyWrNKXtri/7Zk1R7AYKV/zgo91a8tx1XMqa2l08IVltttHDQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTMr9EtDajprNIIbbfG+1zJ64D+Yo07MF9TpzOyOKpSGymrrHT
 7IelUr7b8c/yYJ+F40doquA73vaXqCtqddRQoJIsjTxomOqBPrhqhURi3ekQMODoS2FK7xYgdIX
 4Wv2lVM/xkGGZXnvpydwFZ31wdPrcSXw8hA3i3F9okSz+CrIkAw0M9+7Bjdg=
X-Gm-Gg: AY/fxX5Fq4GUFpgmzjZadfi5xAaJ3aCbbbO0pC2+ig27+byIcwtlIxjHA22hwCgDb2t
 HbBCOrRtlYbSQQ/UHiywfTt0iLBd5o124YrakrjG9GkbezdHOhfz1f7nLH3RHAPre7DazsBLoEg
 o+AmA1VBR6GteiyfvPfhDK89oGVLsTEvzgCv9E4r/Q5KYtpIxFvmcSAqEeqN9Pb8BRfZzKI8LX6
 /ZnbyprK6qeIWJNZ/bDu9+eX5CxQghmYI5X/wta3HkAakaYJtXx32cDCzw8tGda9xuISxFDoVel
 AGt/DGtkXL6JZyf1WAX3n6sifWvNSonBJdG2
X-Google-Smtp-Source: AGHT+IGJut74XaYQNflz4GLTzSaem63scZXNB/Kw/QrbsbZ/0MZYbk6XMz4qdb3buEkMkfyQRn9EIQX/ZDSJV6EJzZY=
X-Received: by 2002:ac8:6216:0:b0:4f4:e645:2b6 with SMTP id
 d75a77b69052e-4f5fb649f7amr16610151cf.2.1767037091739; Mon, 29 Dec 2025
 11:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-8-kane_chen@aspeedtech.com>
 <98d22733-ef05-430c-8b4a-4a227f9b3f98@kaod.org>
In-Reply-To: <98d22733-ef05-430c-8b4a-4a227f9b3f98@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:00 -0800
X-Gm-Features: AQt7F2octzCuoTa9u-yvrxegZMIBf-hSCrwTeNjMfb7FWSS8ZDGGEnmALtQXtMc
Message-ID: <CA+QoejVDA-C3uwTGNGBejFLm5as2kNCLAGoRc5=8VQU5CAyMwQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/19] hw/arm/aspeed: Attach LTPI controller to AST1700
 model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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

On Wed, Dec 24, 2025 at 2:41=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 12/24/25 02:41, Kane Chen via wrote:
> > From: Kane-Chen-AS <kane_chen@aspeedtech.com>
> >
> > Connect the LTPI controller to the AST1700 model by mapping its MMIO
> > region.
> >
> > Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>


>
>
> > ---
> >   include/hw/arm/aspeed_ast1700.h |  3 +++
> >   hw/arm/aspeed_ast1700.c         | 27 +++++++++++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> >
> > diff --git a/include/hw/arm/aspeed_ast1700.h b/include/hw/arm/aspeed_as=
t1700.h
> > index 2a95ebfe89..b9ee4952d0 100644
> > --- a/include/hw/arm/aspeed_ast1700.h
> > +++ b/include/hw/arm/aspeed_ast1700.h
> > @@ -9,6 +9,7 @@
> >   #define ASPEED_AST1700_H
> >
> >   #include "hw/sysbus.h"
> > +#include "hw/misc/aspeed_ltpi.h"
> >
> >   #define TYPE_ASPEED_AST1700 "aspeed.ast1700"
> >
> > @@ -18,6 +19,8 @@ struct AspeedAST1700SoCState {
> >       SysBusDevice parent_obj;
> >
> >       MemoryRegion iomem;
> > +
> > +    AspeedLTPIState ltpi;
> >   };
> >
> >   #endif /* ASPEED_AST1700_H */
> > diff --git a/hw/arm/aspeed_ast1700.c b/hw/arm/aspeed_ast1700.c
> > index bb6ca2ce9e..eeb586102f 100644
> > --- a/hw/arm/aspeed_ast1700.c
> > +++ b/hw/arm/aspeed_ast1700.c
> > @@ -14,6 +14,14 @@
> >
> >   #define AST2700_SOC_LTPI_SIZE        0x01000000
> >
> > +enum {
> > +    ASPEED_AST1700_DEV_LTPI_CTRL,
> > +};
> > +
> > +static const hwaddr aspeed_ast1700_io_memmap[] =3D {
> > +    [ASPEED_AST1700_DEV_LTPI_CTRL] =3D  0x00C34000,
> > +};
> > +
> >   static void aspeed_ast1700_realize(DeviceState *dev, Error **errp)
> >   {
> >       AspeedAST1700SoCState *s =3D ASPEED_AST1700(dev);
> > @@ -23,8 +31,26 @@ static void aspeed_ast1700_realize(DeviceState *dev,=
 Error **errp)
> >       memory_region_init(&s->iomem, OBJECT(s), TYPE_ASPEED_AST1700,
> >                          AST2700_SOC_LTPI_SIZE);
> >       sysbus_init_mmio(sbd, &s->iomem);
> > +
> > +    /* LTPI controller */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ltpi), errp)) {
> > +        return;
> > +    }
> > +    memory_region_add_subregion(&s->iomem,
> > +                        aspeed_ast1700_io_memmap[ASPEED_AST1700_DEV_LT=
PI_CTRL],
> > +                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ltpi=
), 0));
> >   }
> >
> > +static void aspeed_ast1700_instance_init(Object *obj)
> > +{
> > +    AspeedAST1700SoCState *s =3D ASPEED_AST1700(obj);
> > +
> > +    /* LTPI controller */
> > +    object_initialize_child(obj, "ltpi-ctrl",
> > +                            &s->ltpi, TYPE_ASPEED_LTPI);
> > +
> > +    return;
> > +}
> >   static void aspeed_ast1700_class_init(ObjectClass *klass, const void =
*data)
> >   {
> >       DeviceClass *dc =3D DEVICE_CLASS(klass);
> > @@ -37,6 +63,7 @@ static const TypeInfo aspeed_ast1700_info =3D {
> >       .parent        =3D TYPE_SYS_BUS_DEVICE,
> >       .instance_size =3D sizeof(AspeedAST1700SoCState),
> >       .class_init    =3D aspeed_ast1700_class_init,
> > +    .instance_init =3D aspeed_ast1700_instance_init,
> >   };
> >
> >   static void aspeed_ast1700_register_types(void)
>

