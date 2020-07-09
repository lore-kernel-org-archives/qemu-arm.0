Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1545309lfm;
        Thu, 9 Jul 2020 08:48:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXOmOF+wN4Qid9KwlmoXtrvDAAGOD4aXeAdGBL5tp6wfrSlBeNFfFtBB/VxL7yl8T6KH1t
X-Received: by 2002:a25:7b47:: with SMTP id w68mr100051391ybc.143.1594309721602;
        Thu, 09 Jul 2020 08:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594309721; cv=none;
        d=google.com; s=arc-20160816;
        b=DD51XTrR5QSt3BmETn0Rtg6AjD5K5EvYcS2fQN4tTLnWpfPv4EvYH4goL8XSxO9rTm
         BaqUlGsBqn6Qz6rr1lRMPg2A5JNOXuwMTulWp9tQk9vRrEvwIQ98Da8+74rapDWCbsRu
         9Ba8sg80Fyl2jYV6zVKhAzoLntRvfBN2TOSGbTTRlVwwF27e1VfwOWxSN1MTBlA9XNw4
         DoW3hg9bqqfp33rHmbPoZIhVjdhshILJpdUMyIXEEGgPZgnUS31WOImJea+Gk7trSNVa
         XPhDYGUJiMcFLHFD2OqBJA2kYp7ShU6dSmwc8BmtujN0fYinHY1QXHBrZczG5n11ezwp
         Q2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Fpa8HUPV37FoOLZoHXCskLa20ZEOASDoIll7jYCiy28=;
        b=nryNd8M3heLseihaMFLaKiXHGxPlBeHygM++WLaG9N2taoqVosxuG/OdC9UH0Az7/K
         QAiglonSbHggpjSmFiMwZeMXMYWia2IX/juyaH+laBYBrMPC4iSReIHTxrpFD1oZ42Ry
         zReQNOGtmiuVcvPmI2+FKqmvEdSOytyTE/02OiyhcUMwOi2bn9prupI2LW3DMDOcsNG5
         i2DUQuwnwbbmOXRZ2q+PCGFBUscvpYMfprsQLFL5YJaN0VcOfFyd00ZUPb5in9bODrPv
         nYL70+1ymukvtqrT/kbMjrHPCe4nEOGpt40vI5btqZFSwzPpqzazNTTvkkLbSvzLvyL+
         QwIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kLmoLImE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2873932ybk.329.2020.07.09.08.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 08:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kLmoLImE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtYmu-0004gz-VG
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 11:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtYme-0004dv-Hi; Thu, 09 Jul 2020 11:48:25 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtYmc-0005zz-4J; Thu, 09 Jul 2020 11:48:24 -0400
Received: by mail-il1-x141.google.com with SMTP id r12so2437231ilh.4;
 Thu, 09 Jul 2020 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fpa8HUPV37FoOLZoHXCskLa20ZEOASDoIll7jYCiy28=;
 b=kLmoLImEQcINmXRT9MWPkIQua1OmQxr5WN+gkxkD6zxbnsQFqsVCe4bYB2cciSLVF+
 1obXhuydOV6lts/NAl7XkgLBG9OHMp0GVaIlSJ2hTwlDVuRFEyyN290Sp491qdueDbI+
 Udc03xeRSwQb69CyhxkBM3ee54IQU/uhjOcLxpJ5uOsogSWgIgE3tjNQzk61aQqqpZdf
 GV8DuFA42Cm3H7brgjK4ZaujAuLCwIPXs++fUgaC1gz4AITKiSPBOoen/ZfgAZsdPfD2
 Qcy7+bhJFuSi5ScLatM5VouMIdJxSvtNeVJklZLd7L4WJyPfkuW1m7P6i39hRboo3ILM
 11Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fpa8HUPV37FoOLZoHXCskLa20ZEOASDoIll7jYCiy28=;
 b=pQgAGqi089Vv6g3EWT7JhWPllq21A1x8vO+jlJBUa2+jIn9d+zNnAM1yQp7q6ciUY7
 2CwZz3FOAN11ayaswvk7zTnUE0mSnFPrbN+qgVghHbDBfQhnpIHsbSkmKwoh9Rz/4zfA
 XR3cgAzN1u00MhLyOGKih5iUGVX9qXq5mNpXyNnNr2IgORUfOYdEE0g6REekg2f/s1pP
 uKpIBma6HFLki/EgH5/a/oFgmFVbbvi6eWbcyU7XKXKTOWQ/DmlJqzdOlm5e/YQ7mEAo
 9kPSZ9CAY/JP6WCK1ZOEfU9oXB/zBQ+npcrL8b8tzcO1I75zFDqIxshDzWIesmWqkfoN
 /yEQ==
X-Gm-Message-State: AOAM5312+F1sunujMXVla/o27oG+yPPNbjcry+2NSO3U/4OeHb1eWBbq
 HETB06EwiaNXm5jR/J1Xjhp5w6UjIJwE7f7NFdQ=
X-Received: by 2002:a92:c213:: with SMTP id j19mr48011468ilo.40.1594309700335; 
 Thu, 09 Jul 2020 08:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200709152337.15533-1-f4bug@amsat.org>
In-Reply-To: <20200709152337.15533-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2020 08:38:28 -0700
Message-ID: <CAKmqyKNhCRC_tGFiM29cBrn01AiKG39C9TKZaD3s8xTaiGaaFQ@mail.gmail.com>
Subject: Re: [PATCH] hw/cpu/a9mpcore: Verify the machine use Cortex-A9 cores
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Randy Yates <yates@ieee.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iyTp3hE9qtPi

On Thu, Jul 9, 2020 at 8:23 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The 'Cortex-A9MPCore internal peripheral' block can only be
> used with Cortex A5 and A9 cores. As we don't model the A5
> yet, simply check the machine cpu core is a Cortex A9. If
> not return an error.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/cpu/a9mpcore.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> index 642363d2f4..1724baf17c 100644
> --- a/hw/cpu/a9mpcore.c
> +++ b/hw/cpu/a9mpcore.c
> @@ -15,6 +15,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
> +#include "cpu.h"
>
>  #define A9_GIC_NUM_PRIORITY_BITS    5
>
> @@ -53,8 +54,18 @@ static void a9mp_priv_realize(DeviceState *dev, Error =
**errp)
>      Error *err =3D NULL;
>      int i;
>      bool has_el3;
> +    CPUState *cpu0;
>      Object *cpuobj;
>
> +    cpu0 =3D qemu_get_cpu(0);
> +    cpuobj =3D OBJECT(cpu0);
> +    if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9=
"))) {
> +        /* We might allow Cortex-A5 once we model it */
> +        error_setg(errp,
> +                   "Cortex-A9MPCore peripheral can only use Cortex-A9 CP=
U");
> +        return;
> +    }
> +
>      scudev =3D DEVICE(&s->scu);
>      qdev_prop_set_uint32(scudev, "num-cpu", s->num_cpu);
>      sysbus_realize(SYS_BUS_DEVICE(&s->scu), &err);
> @@ -73,7 +84,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error *=
*errp)
>      /* Make the GIC's TZ support match the CPUs. We assume that
>       * either all the CPUs have TZ, or none do.
>       */
> -    cpuobj =3D OBJECT(qemu_get_cpu(0));
>      has_el3 =3D object_property_find(cpuobj, "has_el3", NULL) &&
>          object_property_get_bool(cpuobj, "has_el3", &error_abort);
>      qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
> --
> 2.21.3
>
>
