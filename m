Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4282676lfm;
        Mon, 13 Apr 2020 15:28:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypL6i33ubmuLGHI3dpLClMve7+pTHYpL5QIXJM4dfEwvP8ucklmqT7jozDVKdI8sM3G6hWNU
X-Received: by 2002:aed:2558:: with SMTP id w24mr1225124qtc.29.1586816907158;
        Mon, 13 Apr 2020 15:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586816907; cv=none;
        d=google.com; s=arc-20160816;
        b=Ld961LUoar2TLvwgXae2gy3KWdqDkeXTLrRVlVapFlF/hAUxUwaT9jRr3OwNblWcxG
         gFBMe3tNKoc0A2whCd8JmSdKN0YICgDgxBoPWWzJl54RE1zyDtuE91W/wuU2vPSQAyd2
         4hENLcmPro6KtWFm4g+sme7cOA4rr7o0ApTo5mOBM0nXsJ6oIaPUxRZxJn8xto3hL4P6
         kvZPhLns2qW19sgoruNyqWyvM1WIwPp+rIIY0SQg53aa/C6Ec7pi7fCd94JpB4uky/qk
         iaV+oFizvnfRmpAgiG006G5M206GsQBXcCrmdQ64jRgy/gMoV4tj+kUTwTUcqjVIKB16
         y2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IgQGUuxle6BaPq/Rsmd+GO9sIThVBU3XLIo15nIFw6Y=;
        b=iVAKc/pJ9RuWF4OpIDFNsF3e0ZGZJcYcfUvGCMN20SD92q71H4Ptz8+VcNy/lU5qSG
         WzJJzGBHicBrtr9w1U1zv7QJcKjSzoS6gip+b1ups2ZuHyX9xDnwy883raLZMUns1Mnj
         uu/EboUWWLFPREPvoq/+aYDoDZvovY6EQqekScROzcHc05JPSO2RE05maDed+hPG/lIn
         WhjcMvKoB38BAvDkFHK6mr8byJfbZNaskWqebxmfioo+nDkCYyiQUqr3h0/0B9PSfhW1
         tpMCm6l0usjD1lCNZBcXDaTn2Urtp1d29cUlPjGkqnUrSsnVLJNx+v+Xf2OEU5gPs+7E
         B3vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IXfBCMKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si2967177qke.315.2020.04.13.15.28.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 15:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IXfBCMKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO7Z4-0007Gy-Ih
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 18:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Yu-0007Bt-Kg
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Yt-0007Jp-G2
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 18:28:16 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:37516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Yo-0007IG-In; Mon, 13 Apr 2020 18:28:10 -0400
Received: by mail-vs1-xe43.google.com with SMTP id o3so6501475vsd.4;
 Mon, 13 Apr 2020 15:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IgQGUuxle6BaPq/Rsmd+GO9sIThVBU3XLIo15nIFw6Y=;
 b=IXfBCMKiTUzw0OzD9s23PjVBfWlyuPBXznGIbW0C7gaZrEG87YjAYGAfWDdXSkpL7r
 yR4ZfVCzZz9TCIqbi45m7nqBMqZgD4UIVo74Y5Vd3g4gqZgk5oefmoS9bMt2WSrXhzhy
 rSRHWGdmx7ua9GPFvEA2MDydtnKMI+O/OA53il2Vx9AdaaJRQ1Qh+kJXeAV4wHhE6W9n
 RNXTl6b/HZy6z0V+hXnEwZxj0JhOCy35rkMXhTMcihwJy88fHsFpEB+rqGRpjIXy+wFw
 7jQx3XoMU7/JBd/ETHB01H5y9qTiMciTfd9fXOgHJimT4vBSp2wxQnRVkzanQg8opXQf
 JxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IgQGUuxle6BaPq/Rsmd+GO9sIThVBU3XLIo15nIFw6Y=;
 b=XdfTTgL45noLLsNn/qL90lv3XcTMUrbe4WMeQCRmDcNy6l7Wj4muK9kvneEroSTVHz
 4k39ID8VJPB8CqvGfRpVMLGD9dsXXZA+4LRBrp2z3LQB+xdLwQo8Vj4el3/X1hi4rjti
 7DMJqUVk3hPrxfqP17r4M48jVLJmFYcBrnKOGprIVanRBK4uSb5j157wkR/sxw/+ZcHU
 l6GPYBoWLsMPK72kB1puHpDB/0ROtPtGh0wrn4CWuFsv1hH+0zEoYW+eArO3wwHcV/g+
 28Xl+yRYNZM4ns7YuQhx0MiWnaAOMKjCCzmVtdYlAkyS2sNl7MpHc8erivqRnK2DYoye
 WOTw==
X-Gm-Message-State: AGi0PuaYdc4SbuOET7sQPKRcxh++YyIyKhnV9kX+W5wO4SI58y+qJr8q
 MAYTUBCZDCQ62JUrbNRDLB3ErD3yYCsrnxRC5zo=
X-Received: by 2002:a67:26c2:: with SMTP id
 m185mr14426951vsm.180.1586816890037; 
 Mon, 13 Apr 2020 15:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-18-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-18-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:19:54 -0700
Message-ID: <CAKmqyKPWaMei1uw0UhnPmqpo_RTp0hvcVBjPxqdKOvsoHYpzAw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 17/24] hw/microblaze/xlnx-zynqmp-pmu: Move some
 code from realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGnBSZ4P4SsF

On Sun, Apr 12, 2020 at 3:44 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle reported:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/microblaze/xlnx-zynqmp-pmu.c
>   >>> possible moves from xlnx_zynqmp_pmu_soc_init() to xlnx_zynqmp_pmu_s=
oc_realize() in ./hw/microblaze/xlnx-zynqmp-pmu.c:79
>
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/microblaze/xlnx-zynqmp-pmu.c | 46 ++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
> index 028f31894d..2aa602cf85 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -63,24 +63,6 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
>
>      object_initialize_child(obj, "pmu-cpu", &s->cpu, sizeof(s->cpu),
>                              TYPE_MICROBLAZE_CPU, &error_abort, NULL);
> -
> -    sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
> -                          TYPE_XLNX_PMU_IO_INTC);
> -
> -    /* Create the IPI device */
> -    for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> -        char *name =3D g_strdup_printf("ipi%d", i);
> -        sysbus_init_child_obj(obj, name, &s->ipi[i],
> -                              sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IP=
I);
> -        g_free(name);
> -    }
> -}
> -
> -static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
> -{
> -    XlnxZynqMPPMUSoCState *s =3D XLNX_ZYNQMP_PMU_SOC(dev);
> -    Error *err =3D NULL;
> -
>      object_property_set_uint(OBJECT(&s->cpu), XLNX_ZYNQMP_PMU_ROM_ADDR,
>                               "base-vectors", &error_abort);
>      object_property_set_bool(OBJECT(&s->cpu), true, "use-stack-protectio=
n",
> @@ -99,18 +81,36 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *=
dev, Error **errp)
>      object_property_set_str(OBJECT(&s->cpu), "8.40.b", "version",
>                              &error_abort);
>      object_property_set_uint(OBJECT(&s->cpu), 0, "pvr", &error_abort);
> -    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
>
> +    sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
> +                          TYPE_XLNX_PMU_IO_INTC);
>      object_property_set_uint(OBJECT(&s->intc), 0x10, "intc-intr-size",
>                               &error_abort);
>      object_property_set_uint(OBJECT(&s->intc), 0x0, "intc-level-edge",
>                               &error_abort);
>      object_property_set_uint(OBJECT(&s->intc), 0xffff, "intc-positive",
>                               &error_abort);
> +
> +    /* Create the IPI device */
> +    for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
> +        char *name =3D g_strdup_printf("ipi%d", i);
> +        sysbus_init_child_obj(obj, name, &s->ipi[i],
> +                              sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IP=
I);
> +        g_free(name);
> +    }
> +}
> +
> +static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    XlnxZynqMPPMUSoCState *s =3D XLNX_ZYNQMP_PMU_SOC(dev);
> +    Error *err =3D NULL;
> +
> +    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> --
> 2.21.1
>
>
