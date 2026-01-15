Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC57ED41176
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgLiX-0000hR-Em; Thu, 15 Jan 2026 06:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLiV-0000g2-EN
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:40:43 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLiS-0006XR-DL
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:40:42 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7927541abfaso7423397b3.3
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 03:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768477239; cv=none;
 d=google.com; s=arc-20240605;
 b=Bta/kxLs1hsEkR4bK+9+JLbZLpXvyenXRtY93IzkCATJ/ciYAnceen4I7illGfiT6a
 EA4egcSKsVTtX0/sBVs77m/A6bUewgbw2lIcp31FwproQTz7LEXVmVuR8cYJVa7qxrr7
 xPItavxz5SpSrATpYgKT1MNm6Vn8qERvxut19hOgsEHexqcmLefVk2J/LQuLencUSWrJ
 PjsA8BnPZ2HuoWVzhDO+/9R/RllhsM7tD9Lthc/+roM+414aVw19FcC5q7ir0r7vNaKp
 QhC89zW31T+2n+1PgNzwdpXbrbaqRkvd/3oLQck2FCEOuWMQ028K66wn73ab+ohfRo1H
 VmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fFFx7OzskZAfL50UvXSLyWt2Znq4Ui3kmVewWPOvWWk=;
 fh=6mBT1OA6mWuN04XwLDKqFQFwTa1fLLn/e4jLxGRkPao=;
 b=ZxE9oTxrR8O1zNHEZsPmaBZZxdV4d/x4TiBla7ylmcp6RQFvu/Ql6hA27A+nvMfeJ5
 qmr+PMF1rKO1WYdQ/i2NE5RJNqN8i4NDVxyfGcrSLuupbuUe+b3WntZQmvmzdx4xPsHJ
 9wQ6gZudLG8YPdN5UXbePbBf4WSuCVczCdrv13J5V+/xZiFEQ7x2EXi0WRbCOSb9T9Xf
 47teM1KqL3WvM73OLe717raANl+6sskEXtH4DghiijVyZsHkabVNKe9XzSILLEqxu9cA
 1EOfQthRIz81iczZmJ2d5S7POnxwmZoquJDtJK7nhDxeX31jg+KMNsdTGWgccz6/Bjgw
 0Twg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768477239; x=1769082039; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFFx7OzskZAfL50UvXSLyWt2Znq4Ui3kmVewWPOvWWk=;
 b=Mmw9IcAZcgKoBh2Hw98mri7ea4Uo/nx00fSKdAEoJ5dnKJBKxOLkQrn3Wv1DDY4fwS
 lbTPKG+7M+n88eWW+EeDKRGSimHdprbgFiHFJhfbywkyiH7fWZe4Ar2vfXNJALxNmmDq
 5UwCw30VlC1osvbpWywOsAX80yqhpsK43KRp8TvZkjuCpl6RPofW3rpDeYfdyAJ9irOw
 85IzkP4A9h3xtTqL3upCBLup32fhoupD8czey9xRJpruD2pwMY6fcZFBgbXytq1VZ3my
 LadEYF1wnu0pxZKcABSEmlRkk4RFo3c0a3KdAeFW8ouArH9emJMMkzU/RvBUlh02CB2g
 jHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768477239; x=1769082039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fFFx7OzskZAfL50UvXSLyWt2Znq4Ui3kmVewWPOvWWk=;
 b=VhH1jdREbfs9q+TXAbXurU81Jhvw3QCl0Kb2P4UvISRUFjWQxLECP820oKUkWCytU6
 89xEsd+tpgTR9X3t5p6kzNc2orPU6blLb97mUR1JwFqSTevaRuXmIU4r91GDdOoal8wQ
 RHPdC7pn2QOrxTE24PA0nIfhaBVWM1iKiB92jxMKwX8OvYKg0ahmZ0WPPJJwSh4Tv9js
 Mfaj6Lhi3LntWnhd8IQJMjI/w8RKR+mqR095F9Feiq85YBmne8ncGVDi8kF1iyg/EEwg
 u7Z4IbSeabq+IPAsLOQiyEL/m3zfojGO9YA8cS7AsdUvYS8MGflwdhSPPlRPg7UR2NmA
 pjUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLEjuDwfwkDYoyhKsSTqhf/WeVTUNRqcbphlqufS0QhjO5QWSVtCsE23PGrinOHzwBdlcr7SM9qQ==@nongnu.org
X-Gm-Message-State: AOJu0YxIOFywGVfR4hEry/zpO72U8GBE/3cnL3uP/LdEhFYV4vHIB10+
 cEOivTom41dqBYY91l7Y64VjtwvF7Ah34J7TBo+hLJwXJ05sohBrJouWOTLUx8+BH8TfOm51z/L
 ClMYIKxZBj/Un54YAW2owcmJMgxUo82x4mKQ9sJ33pA==
X-Gm-Gg: AY/fxX7FjDVyIvDatN/D0fBHC740nCZNGBzpCbpZVC3Vg5xxrpE+syE5uF9eNeLJRAI
 2GuPYEL/uAfl/ePmT133eQYbAVpjiQaMAIcwW692y2fvr2sYwJZ63CKcyoUynf+cPWKw7ZXnFAi
 8tUtU8rxC+iISWkDXRyXf0SpXEVTkSKaS0CBQaYoyojv9jrD+1QM8T1BuGFpHz2oH0Qz0Y7nO8j
 1WzMsCx5RIo44vwMaIiIbrD5VVALD1qFgBPj4O5Q9XxaGxr5ZQPd25M135QuSQ/Xepx8nP04Cmc
 0lykJhifA3Cokhzrw05kKk0=
X-Received: by 2002:a05:690e:150f:b0:640:cc09:b7c8 with SMTP id
 956f58d0204a3-64901aba07dmr4671181d50.23.1768477239127; Thu, 15 Jan 2026
 03:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-9-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-9-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 11:40:27 +0000
X-Gm-Features: AZwV_QgKu58r0LIKquRSRuVzdnh7PRKVH1bqCbwMKbGE_GSVVGK8QxK32e_jsCA
Message-ID: <CAFEAcA_qY3pPREJ5bW7dLN17bTC2b_6ydLD3PLOkpPUFViOXbA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] hw/misc: Add dummy ZYNQ DDR controller
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 4 Dec 2025 at 09:35, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> A dummy DDR controller for ZYNQ has been added. While all registers are p=
resent,
> not all are functional. Read and write access is validated, and the user =
mode
> can be set. This provides a basic DDR controller initialization, preventi=
ng
> system hangs due to endless polling or similar issues.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

I have a few minor review comments below, but this otherwise
looks good to me.

> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index fccd735c24..3de37c9e1d 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -240,4 +240,7 @@ config IOSB
>  config XLNX_VERSAL_TRNG
>      bool
>
> +config XLNX_ZYNQ_DDRC
> +    bool
> +
>  source macio/Kconfig

You also need to have the "config ZYNQ" section in hw/arm/Kconfig
have a line "select XLNX_ZYNQ_DDRC", to tell kconfig that the
Zynq SoC needs this device.

> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index b1d8d8e5d2..ffbcca9796 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -95,6 +95,7 @@ system_ss.add(when: 'CONFIG_RASPI', if_true: files(
>  ))
>  system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
> +system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xlnx-zynq-ddrc.c'))

This should be "when: 'CONFIG_XLNX_ZYNQ_DDRC'", so we build the
source file exactly when some board or SoC says it needs the device.
(This mistake is what is hiding the effects of missing the
"select XLNX_ZYNQ_DDRC".)

>  system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqm=
p-crf.c'))
>  system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqm=
p-apu-ctrl.c'))
>  system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(

> +static const MemoryRegionOps ddrctrl_ops =3D {
> +    .read =3D register_read_memory,
> +    .write =3D register_write_memory,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +};

It's better to explicitly set the access size controls
 .valid.min_access_size
 .valid.max_access_size
 .impl.min_access_size
 .impl.max_access_size

explicitly, even if they happen to match the defaults. This tells
the reader you've thought about what the device actually permits
and what your implementation code can deal with.
(The default is "accept anything, never generate external abort"
and "assume the read and write functions handle all widths".
This is usually not what actual devices do or what the code
people write is intended to accept. Devices on Arm systems are
often "only 32-bit accesses are permitted".)


> +#define TYPE_DDRCTRL "zynq.ddr-ctlr"
> +#define DDRCTRL(obj) \
> +    OBJECT_CHECK(DDRCTRLState, (obj), TYPE_DDRCTRL)

Current QEMU style prefers using one of the helper
macros to generate the cast macros etc. For this kind of
"simple leaf class" OBJECT_DECLARE_SIMPLE_TYPE is probably
what you want. See for some more info:
https://www.qemu.org/docs/master/devel/qom.html#standard-type-declaration-a=
nd-definition-macros

There is also OBJECT_DEFINE_SIMPLE_TYPE which provides
the boilerplate TypeInfo and type registration in the .c
file for you, but that one is more "optional if you
prefer it".

thanks
-- PMM

