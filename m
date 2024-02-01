Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp348179ejb;
        Thu, 1 Feb 2024 08:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzATTexgA8BokLK8Yuk3eZbT4f63aE6F8KL5fcyyn7Xtz38EesipBEZhIdagmLfxmjB8zH
X-Received: by 2002:a05:620a:118c:b0:785:445f:6ab2 with SMTP id b12-20020a05620a118c00b00785445f6ab2mr2501732qkk.22.1706804721323;
        Thu, 01 Feb 2024 08:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706804721; cv=none;
        d=google.com; s=arc-20160816;
        b=MCegQCiPd6UQ0Zlw5AYU7Jnkhbk036DgMbAznBeFCnXW0V5vlraoCJslBJWJmmrg1j
         SgcZGOxIQ4Iau6u1E3/sQWM36NIE/mm3iy7L11h/tmYh7DuJtURshuWAx8TJ1MkCLV7+
         iskg6tEohmTjA/h1nB/92G1NPjB0DGY5SGucTBMFFco2iEIsCXQ0E4zQ14RcZ5f7BYL/
         un1Z5dW20wIUFjMA9vOZLqJXCfY+EY5sycS4O/FamlNPcPzxTOLYZd0+wrLGC6F0XMIG
         V2tAwnekWPrNqUMhYJWkqdsRg6gvUF/9CPZaobZKfRPkwtg42WwCEw/O7A/t3zzodSK0
         a/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=46NHSLFImFJJig2UxV3k7PaJBS9adhECauo8jMROZHI=;
        fh=a20p6u4mqZsCpiFeDMZVx3b+nCT9vUzZyqukJ37ooTI=;
        b=o/GT5sv27Ov8MniLTVXiaXTGE7Nnh0fao62cb6ZQqLELKMQ/ZIjBKEdIN3L4Dn5fBU
         z55m6PYmaQJJXgaACYEia8WU+m0E8yyUOD9DEnJfLl3wuLyI0ecY+dgIZTrfMUkEGLWo
         K7HIBf573NEsHQbmnL8DiEJ1h16Xs/8NA/gFySjA92tsGYO0Sqqo41p9XsTTsxgJTh7f
         C858BXpjbZxOaURBvRXuOm/M6HCu6yCyEjspbaWGCRfiaU3Y3ml/rVUGSVBsWEJan+2x
         Ygoeb26WnysAEVPrGjROluKPVNWD6H/mV9QAlXDJP5oR2GVfPScCsXeSqDy1sRzWMcxp
         Nbzw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO5/dXmr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUir4zF34b2d2Dz3OsD6JHqmgsgQjCqtzKUAMkflRkFgyXqlO59WuIGHt+36QR5+aDUVOH4K92MSGC0MQBU9xzxP2aMqGji
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y29-20020a05620a0e1d00b007838d947f3csi14250044qkm.219.2024.02.01.08.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:25:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XO5/dXmr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVZrx-00005l-Rw; Thu, 01 Feb 2024 11:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZrj-0008VN-DV
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:24:45 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZrf-0004hz-IS
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:24:37 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cf591d22dfso13012081fa.0
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706804672; x=1707409472; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46NHSLFImFJJig2UxV3k7PaJBS9adhECauo8jMROZHI=;
 b=XO5/dXmrrYLRl48fa2VAc3qzqz115Kd2dsHsM73r52RnieePXMB6p14XkyxEVf+NN2
 lJHH8CgA1j1i+afuckmaf+qWL39pYvnBu2cbj06YMCKMaBvXXhNiXUOrD/4gzekOl+mS
 iYZ1tkd9fmD8ir2Gg/8lo34c/bWYPo8LDdw5jGonyHSgps7b3P6dBVHsh9mIUK/Jzbjq
 JeA/Ju8fqDU8GyEm8u0/N/+cd63/YMAEJ/sBGe1TpiPg+8PIxgrJeiqtkUi6SGSmRJu6
 tfO/W18gxczfCaWO8LceOv8EsLKFG2oFyZR5rWwZu//Hcc5GUGGMpA673e70WeAHb/1f
 xWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706804672; x=1707409472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46NHSLFImFJJig2UxV3k7PaJBS9adhECauo8jMROZHI=;
 b=VinF8SaO1zq5ActM9HwsbZN+Sj+jCcFDwJW5hEfYmhMkgWG4KAZdK2zTFd1Sc1L81J
 oXRE8FCfz6P+55lLBSHMcka9LHgOLVWs8MsubSrBqJ2SN4tV62LFxMtp99QwjxFVAVR/
 akFaoV+JMqANtiJJG+im0303n+jIKFxP8gDt1TmMBv13POsNTdoWM+77AG27czgPAFSC
 Y84z19pZL9em1Ghbylag9GamD/DmRwmE/kzT4oGBJNQ1J9SvyqEfiSpDwRr9L4z/oOPS
 689SbZ5rdqQqvtirT9fZD+cIFIhKRuOYnSvHWtk/pBxO1jijCr2msmzKly8f0G5GsfzN
 h7Og==
X-Gm-Message-State: AOJu0Yyn/q0oknJ5i6E3h3Ixw6RBioJYhWSQ5gZkO6lwNX5WlnyAvSO9
 wagOU9Zxgy3WETBBOskXYAGx2Pgs1o7j8WwKCopFqm0nkFhV4XxxjyWiuOpjityo7uU4bglTdts
 b4CLe5Xsu2E2lCGHM4Qo91XbTK5ol5q1dL7j6DA==
X-Received: by 2002:a2e:3318:0:b0:2d0:770d:5c1c with SMTP id
 d24-20020a2e3318000000b002d0770d5c1cmr1712965ljc.11.1706804672528; Thu, 01
 Feb 2024 08:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-3-philmd@linaro.org>
In-Reply-To: <20240130190317.25692-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:24:21 +0000
Message-ID: <CAFEAcA_e3QOvfvJScUgtmjGacKZX1OHyY5a-BWSAhNURyO2Rgg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm/stellaris: Convert I2C controller to
 Resettable interface
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dYa4U09CSipE

On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index afbc83f1e6..284b95005f 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -607,8 +607,11 @@ static void stellaris_i2c_write(void *opaque, hwaddr=
 offset,
>      stellaris_i2c_update(s);
>  }
>
> -static void stellaris_i2c_reset(stellaris_i2c_state *s)
> +static void stellaris_i2c_reset_exit(Object *obj)
>  {
> +    stellaris_i2c_state *s =3D STELLARIS_I2C(obj);
> +
> +    /* ??? For now we only implement the master interface.  */
>      if (s->mcs & STELLARIS_I2C_MCS_BUSBSY)
>          i2c_end_transfer(s->bus);
>
> @@ -658,8 +661,6 @@ static void stellaris_i2c_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &stellaris_i2c_ops, s,
>                            "i2c", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    /* ??? For now we only implement the master interface.  */

I'm not 100%, but I think this comment is a general one,
not reset specific, so it should stay in the init function.

> -    stellaris_i2c_reset(s);
>  }

I think that the i2c_end_transfer() should be in the
"enter" phase, and the clearing of the state fields in
"hold", and then the stellaris_i2c_update() call in "exit".
Though usually we don't bother to do an update in reset
if it's just "device has reset and now its outbound IRQ
line is not set", so we could alternatively just delete that.

>  /* Analogue to Digital Converter.  This is only partially implemented,
> @@ -1382,7 +1383,9 @@ type_init(stellaris_machine_init)
>  static void stellaris_i2c_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
>
> +    rc->phases.exit =3D stellaris_i2c_reset_exit;
>      dc->vmsd =3D &vmstate_stellaris_i2c;
>  }

Also on the subject of resetting i2c controllers and buses:
https://patchew.org/QEMU/20240126005541.1839038-1-komlodi@google.com/
That patchset proposes that the bus should basically drop
any pending transactions on the floor at reset; it would
also be possible for the bus to do the "end any transfer
in progress", so the individual controller model doesn't
have to. No idea what the overall Right Thing is, so
let's not block this tidyup on figuring out general i2c reset
cleanups.

thanks
-- PMM
