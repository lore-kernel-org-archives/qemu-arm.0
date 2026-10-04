Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC1FCA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOtC-0001hO-2x; Sun, 04 Oct 2026 12:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOt7-0001gn-Cg
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:34 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOt5-0001Fl-Bg
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:33 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-836c4474028so7660257b3.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130590; cv=none;
 d=google.com; s=arc-20260327;
 b=Bw6Kp8S0jZOmrSQ6K+PNSdKXH3LYYk+eEoURzNtDPu0kl/HrrJlozp+TcwCzjTqApq
 C+VwpuA/39lZBEJCiCC8boFjdYE6DV19V3Ngt+Wf9SRsx/7OuTNY8koBZbCmKTim/2Ke
 IuwkeWlKR5tsh/dNXSK/vnLywmEHAohgozH+UQ/i3eZwotCTNlO/t4QNVlGBMdAb33mm
 p25vD1gWS0BWgz51L6M956FPfrvPUvYv4EzmLFxQN6eCFAwynJI8g3s1cwkZIySc5w8U
 7pSaz0NHPopjWTqfqTHMzC7Z3m0gYzvVNbOJ1n28K5QZw5n/EnO2hiejoGuNVSyEAE0L
 mhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LFkBz0kiFGpXIG60naKeN63E33Lv1fvvnIZO4dy6v04=;
 fh=Y2VhytRUxvtq/dul5XKN+uLstTQKEYJctz+apXReHGo=;
 b=ByC0PlJNiHa/7H6ogq67tj56XZMZBgM6XbdQ10mJ+s7Mz8xLX2ADo4/WQExV3Nn7J0
 nNxKMFUl7DeqrOyGXqXTEP+1ppIdCAYR33vbualWpJ4EPRj8AdsBUATb1GOjNw6z50E1
 3H+ADhk+r73TfFRD/ieRFMvHbNpy1wbssum4TmIHmDLmoyNFi7YJl+cKUZADBtwhBg8Y
 TnzgdtG4GpNqQ8fNxSbYjah8WdvJ1oAHLMb9x+kbk2oDbCuUG1HPU9sfuA1mUDTQXrCy
 WGQJuKtS/kGZd3Gxx8HbSvDYPUzKZ6v3tlQl4rL2jSsxvpqLgzvT9zeoIHWBMB1NHaM5
 2K2A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130590; x=1791735390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LFkBz0kiFGpXIG60naKeN63E33Lv1fvvnIZO4dy6v04=;
 b=sTytDdJJ4jGP3HAFylYjaqwwswH6u8touzDRm8N03SMrW5wtq8FB/3yoMslp8s92UL
 MgUYZ6oGDnDG3u26YRXC3eKA+dozd72TMJElgnfukK0kxq99/cts0uSVhdxGBQEb8w+U
 IHOTBqC5u+szK36ssP/LXMkE7A/0OYK9d3RrlwgYiCLBHb0lMgDbzA+PDk2mdwQ78QMz
 5GPAp/GVODMY6CVQbjgbPwvO2vmmWjc9S0BzWFH4SLokT8TfghYqIr9hFCbRbEcm8lcy
 GJsJDQCartTAdgV0L52b3auYJeXC6i3iELvFGgl87e3k+4z0Hyz6vGeUwBfzyCWcuE9/
 /6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130590; x=1791735390;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LFkBz0kiFGpXIG60naKeN63E33Lv1fvvnIZO4dy6v04=;
 b=ts5//IV0crl33K/oMhtbRnn91ynkilFqkWI2Lpt+68GsRbkl1IUHS02jZCjNZghOpH
 aaXMH3hJUvQc/ZCcIVKgo+3sSp9Cgn4otng8vK1FcMu5m8TPksF4jjGWedJrpAJdhjcG
 9S5JvzIcdga4If3azoVNA+iqxYczkt7QghelkHEGDFjjS0p62NeNvciw+uWnKPNUkGFJ
 h6M8sMNc8D4WrLI/m2a2R2C4WvmA0XgrgKVSwcg1pUun+trJ24U9ZIPpuAuWIt7LUGyf
 RRSJb76zoLGd5FGHZeaITLVtL3Dsyw5/m//t6cS4AZZJP1YM8hSPl+qXDv5xrtAqk2EX
 H1CQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByjrFdr9EkFGrhaA6clbdZdh38ckRKG0ud//hEq91s55MexLb2Aq9OolGafMHnnWwz6qupU58M/JA==@nongnu.org
X-Gm-Message-State: AFq9FYISO9nPsuz3EK9Ph+/URFhE5dIvCUZ1xO9QxqhF+8RlVegRIk+j
 c41v9DQd+OgqVX666XLAZ+Q79Rv8z4h43jNF1epSo68JhD5pMZoIrd6GdV0V3OyTdqqDBqTugxe
 B5hpc55+AXaz0oZdpwcbRF5fYQk7qwt4=
X-Gm-Gg: AYBFou0ACgJc34DEL8KgxdwmgsY6JB3vwbn8e6VgYncW7/QcX5C5bM+GIoY2djVtKUj
 VM+PXL3KuzD++d6gnJG7NCAdoXcpFSMhSbeez6iKDRaXID0VtwH/NuDJxtmBqq4EjlGPQBCZnA3
 avnPN77kmjUSDbb9QYKl08OufLfFQMufMCB0phKpj1RgrkWVlZ/h8G3UHZg8XIlbhLeZruSvtgr
 6nm7vrceOAJ+sS5+TpvdElYM2vWmWXnSst2TzVtXVncKBehOZoMiJnYRAtuW/Q+M7NEX7aKIgu7
 DFO70X7lsrtVxaLFo0+TF9nOaaxPsnHvMP+8+ctSYAtolXymVDICwubhDDPv7JnXl+genhbgXdG
 qMu3wBcB50ZQb5NM=
X-Received: by 2002:a05:690c:e682:20b0:847:d0cd:11eb with SMTP id
 00721157ae682-8ae948c7516mr15054557b3.9.1791130589783; Sun, 04 Oct 2026
 09:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-12-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-12-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:16:18 +0800
X-Gm-Features: AclHuK_3UeOHEHMVBGCcGgTyQWZR-K20t_lkFpDiy-bQlsEyh42eCjrCI2KJf-0
Message-ID: <CAEUhbmWY=JkH+H1vO7J_xMuxTpwHqpKjF79ZTzN2Rgs-iLdo-A@mail.gmail.com>
Subject: Re: [PATCH v2 11/30] hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Bernhard,

On Sun, Oct 4, 2026 at 8:35=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx25.h | 5 ++---
>  hw/arm/fsl-imx25.c         | 7 +------
>  hw/arm/imx25_pdk.c         | 2 +-
>  3 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index b68d4334a0..4bb4d5b3e5 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -29,6 +29,7 @@
>  #include "hw/sd/sdhci.h"
>  #include "hw/usb/chipidea.h"
>  #include "hw/watchdog/wdt_imx2.h"
> +#include "hw/core/sysbus.h"
>  #include "system/memory.h"
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
> @@ -45,10 +46,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
>  #define FSL_IMX25_NUM_USBS 2
>
>  struct FslIMX25State {
> -    /*< private >*/
> -    DeviceState parent_obj;
> +    SysBusDevice parent_obj;
>
> -    /*< public >*/
>      ARMCPU         cpu;
>      IMXAVICState   avic;
>      IMX25CCMState  ccm;
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 7f65f4ca4b..efb22359c5 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -317,16 +317,11 @@ static void fsl_imx25_class_init(ObjectClass *oc, c=
onst void *data)
>      device_class_set_props(dc, fsl_imx25_properties);
>      dc->realize =3D fsl_imx25_realize;
>      dc->desc =3D "i.MX25 SOC";
> -    /*
> -     * Reason: uses serial_hds in realize and the imx25 board does not
> -     * support multiple CPUs
> -     */
> -    dc->user_creatable =3D false;
>  }
>
>  static const TypeInfo fsl_imx25_type_info =3D {
>      .name =3D TYPE_FSL_IMX25,
> -    .parent =3D TYPE_DEVICE,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(FslIMX25State),
>      .instance_init =3D fsl_imx25_init,
>      .class_init =3D fsl_imx25_class_init,
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 243c30a67e..6ce3e35ee3 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -72,7 +72,7 @@ static void imx25_pdk_init(MachineState *machine)
>
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_FSL_IM=
X25);
>
> -    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->soc), &error_fatal);

This should use sysbus_realize(), as object_initialize_child() already
decreased the ref cnt on success. The same for patch 12 & 13.

>
>      /* We need to initialize our memory */
>      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SI=
ZE)) {

Regards,
Bin

