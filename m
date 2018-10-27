Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1719159wro;
        Sat, 27 Oct 2018 01:46:27 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cNWfLHQ1XiL8FZTVsnwV5ub2b0d9zVHQtDrOyALJaRoOduEx520VRhCSqgH2wAzpUSdV6m
X-Received: by 2002:a0c:948e:: with SMTP id j14mr6190467qvj.155.1540629987448;
        Sat, 27 Oct 2018 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540629987; cv=none;
        d=google.com; s=arc-20160816;
        b=ENtGPzyuWLbnFl1J+xQ12XE8IR9GHm74rnP52ZugXeaUscaS2s7N40y97fk5vWySIn
         pF7rWWfnatCWKJcnTLIRoTOf7oRr0eIM0L9yd2ItR72Lo/2XRDgzENGyscBSFZIrnbHZ
         fmBitziOgLjGjE5RBPbhEz1KaVQC5ufZ9kbMI/7CKoWULat+6zcWw6hhG74XiUWdardJ
         ZKFuDWc4EJiRpcQrFKyfKCWY2rizwsyoDc55kIrqMR5xRNQQvWQ5QThcxH98ZqZ3BxTu
         G/vGDeWxHFtR1yrFNk+0o7OgRb77Bgcr4k0Pqa6/7CVOzWDIOXxD9m9tD+1r2TMwliea
         WV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKtjpQ/xfevJSsz+wKCfNayQJCeGcB8nTU1mm+HrZig=;
        b=K+CHkFSZ9XTJtYWv+DohvC7nphGfh+2deNMX65Z6QcBr/KDaGAn8e/2/AXSnoXWha1
         kG/uvl7BznMDe0w3zrO2L/8gS1h465xsUjPzb8GMnd//Z1tbf8KUexxy4auPHoI2wtHd
         et7/geqCqVNFVtUMdBCP1RkFdmec44bm7/8kaKejhIAWT5kX+Qt/KyNiG+b0lsZRwqY6
         2avfT21C7095l1toco56hpc0KyBLlfKH/1gq874veYuOMMqbkSljZtcvAa+zh5+rswH4
         66kgWa+BV0d0mB+89JhNwGtYCjyjBpOTWsxQZeHznupp/Eei4y2whe+zSvC9koEj/c94
         p1bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UeP8gBrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si4598346qki.262.2018.10.27.01.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 01:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UeP8gBrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGKEk-0003G4-Vy
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 04:46:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gGKDr-0003Fy-UM
	for qemu-devel@nongnu.org; Sat, 27 Oct 2018 04:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gGKDo-0002XP-7f
	for qemu-devel@nongnu.org; Sat, 27 Oct 2018 04:45:30 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gGKDk-0002Sc-KT; Sat, 27 Oct 2018 04:45:26 -0400
Received: by mail-lj1-x242.google.com with SMTP id g8-v6so403678ljk.1;
	Sat, 27 Oct 2018 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VKtjpQ/xfevJSsz+wKCfNayQJCeGcB8nTU1mm+HrZig=;
	b=UeP8gBrznH9FHwDD0GqQaTYWJubTxKwkhPphpfZt6HBvEYMZLv4b+z0KOQlAeaTMDf
	Vp2TbkIc9yxqb33rm8mZWckknGjnH6Rw6NWJGKH1YnOE9XLQS0/cU+AEeZJHT0oYGh30
	1bpVgWPBIm4WVitVt/PtKXkwwALj61YwHuqRBYuFRcDnD07n623fyGCH0GY0IH2G2acX
	sL7bAgdGqgtwDYk/em10Kr2xckfZtfpX83Og3X/RSlZSPOE0Dtt9OgBQ3MyMEYtY3gqn
	soY0zIykPzpt6ELcLTbG0hQ1iEhHw8xn1aHQDELjx4ybYArsAgCbI/pOuummWc0EaCh1
	V+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VKtjpQ/xfevJSsz+wKCfNayQJCeGcB8nTU1mm+HrZig=;
	b=SYbmJX5LxSjubFOwl1LW8cmvP+DlojqAaxQ4NWhU9eeOvPQfs8dH6FyjuLbVJrWan3
	X4kSxIei7dq+k9KCQeWQ4wcg/OZVgbnvBGUGh3jxlWEK1qJrNI0AYSm/i2GvH5TFb9BP
	DtcITuIctLd3DY4p6dMXt+nA/h+Jm1LtQMNCSqzHMXUc8gH7i0h13kGEcuaHNvRyBS0W
	cs9Eiu67qp0ovICn08H2jzzeH4VXPKWdqp50w37c1jIS+FBmTiyGnrKwz80jo6Uv7+qA
	VstNcxxOIDABDuPyg1i8PbxHYISFbqRgMv/bVxTFlvEQBlPd/UFJRgUJEawagNcdgF1w
	AMnw==
X-Gm-Message-State: AGRZ1gIiZJsvOwWzu3IjLStFqaJVjwZ4QWChH03/yKnRjbCrrSV+6Sas
	k2wqvp9uwhau3+skCaGM0DlnyZRoqVB+nfhd6ws=
X-Received: by 2002:a2e:8884:: with SMTP id
	k4-v6mr4408489lji.145.1540629918983; 
	Sat, 27 Oct 2018 01:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181026081653.24602-1-luc.michel@greensocs.com>
	<20181026081653.24602-2-luc.michel@greensocs.com>
In-Reply-To: <20181026081653.24602-2-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 27 Oct 2018 09:44:52 +0100
Message-ID: <CAKmqyKNGUAScJbdp4=1_rYXZsQQ+KTVJMM7iyqGu=1J0_KLz0Q@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v3 01/16] hw/cpu: introduce CPU clusters
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gJXk+lz3m580

On Fri, Oct 26, 2018 at 9:41 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
> This commit adds the cpu-cluster type. It aims at gathering CPUs from
> the same cluster in a machine.
>
> For now it only has a `cluster-id` property.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  include/hw/cpu/cluster.h | 38 +++++++++++++++++++++++++++++++
>  hw/cpu/cluster.c         | 49 ++++++++++++++++++++++++++++++++++++++++
>  hw/cpu/Makefile.objs     |  2 +-
>  3 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/cpu/cluster.h
>  create mode 100644 hw/cpu/cluster.c
>
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> new file mode 100644
> index 0000000000..f233a47a4a
> --- /dev/null
> +++ b/include/hw/cpu/cluster.h
> @@ -0,0 +1,38 @@
> +/*
> + * QEMU CPU cluster
> + *
> + * Copyright (c) 2018 GreenSocs SAS
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +#ifndef QEMU_HW_CPU_CLUSTER_H
> +#define QEMU_HW_CPU_CLUSTER_H

You probably don't need the QEMU_ here, it's not ambiguous if this is QEMU :)

> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev.h"
> +
> +#define TYPE_CPU_CLUSTER "cpu-cluster"
> +#define CPU_CLUSTER(obj) \
> +    OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
> +
> +typedef struct CPUClusterState {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    uint32_t cluster_id;
> +} CPUClusterState;
> +
> +#endif
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> new file mode 100644
> index 0000000000..11121e6f26
> --- /dev/null
> +++ b/hw/cpu/cluster.c
> @@ -0,0 +1,49 @@
> +/*
> + * QEMU CPU cluster
> + *
> + * Copyright (c) 2018 GreenSocs SAS
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +

You should also include the OS deps here (the first include).

After that:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +#include "hw/cpu/cluster.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +
> +static Property cpu_cluster_properties[] = {
> +    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void cpu_cluster_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = cpu_cluster_properties;
> +}
> +
> +static const TypeInfo cpu_cluster_type_info = {
> +    .name = TYPE_CPU_CLUSTER,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(CPUClusterState),
> +    .class_init = cpu_cluster_class_init,
> +};
> +
> +static void cpu_cluster_register_types(void)
> +{
> +    type_register_static(&cpu_cluster_type_info);
> +}
> +
> +type_init(cpu_cluster_register_types)
> diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
> index cd52d20b65..8db9e8a7b3 100644
> --- a/hw/cpu/Makefile.objs
> +++ b/hw/cpu/Makefile.objs
> @@ -1,5 +1,5 @@
>  obj-$(CONFIG_ARM11MPCORE) += arm11mpcore.o
>  obj-$(CONFIG_REALVIEW) += realview_mpcore.o
>  obj-$(CONFIG_A9MPCORE) += a9mpcore.o
>  obj-$(CONFIG_A15MPCORE) += a15mpcore.o
> -common-obj-y += core.o
> +common-obj-y += core.o cluster.o
> --
> 2.19.1
>
>
