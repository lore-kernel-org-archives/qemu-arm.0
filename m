Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp337643wrw;
        Thu, 8 Nov 2018 08:28:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5cx6wpdYswsGotDiXMmhaVIyXYHQE+QEanyPofe45eJhGcnXrB/oJ+MM7fKjWpvCBDJ6Ow3
X-Received: by 2002:ac8:1308:: with SMTP id e8mr5069345qtj.201.1541694523906;
        Thu, 08 Nov 2018 08:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541694523; cv=none;
        d=google.com; s=arc-20160816;
        b=h1u9D7QU14EmUhIF5UaR8zYM5rV2XzPto9wUWgQrE1gtb4/CS+zE0HOiog1sR46a8K
         fdO3HxoSGd9IXvcB1H3uRb+mjmolLy7tZrExLjOx2nRObuxz0tXYCtlrvJ4cgPTtP6sB
         g6vAYf3l/SfmwTyMloYNKAFRvR3hewXCEKNMBxOTl2Ij7EPsA/o/kOVeWlRZ4WqA3HWJ
         +zz1juIo4uk75tEvcnIv3267/2oJKP2oJpY7vcx+95zIW+ydE4kBiL+xhwf3jNEQRjwd
         axJrQluombaoXQFEdhpTKPYL1wBJfrfba2+Cj43Tob2QyDfPjcj5yWvdZZ+YugIxoVdG
         Sinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=KX2nWj8COXKeymxHpps/ju9qtihGh/vwxtsM5+jLOsw=;
        b=fxaxyuYe065t6wgIFnZBH3cE9A6gU6caK0kfXAdDwXfhQ32SWXuf92ujuCF33eLglG
         IodddUdSPscf6ppVCaItFeSPYuVSVUZvyEeaouz3aELjSVHKckYMidgoA6rMBprwb5ML
         HegrHUyxEpOT8p91zk41l8BNHikD4jZV3f1DsFiC7kpuB8SBoGlLPaYZx9EOUcDnGAWP
         Xy5VvfxKedcqYxg8B5TpHDb7NPn8TrHsuSfvnC/aa02hD+emeRdlvMhOwOXETEjuZDZ/
         mC/ieWNOIaKc9SGGxTi6pJeDcQAgHgDfAkKeCiMSi4U4mbX++NfQpyIts6AUvBIy0Cyv
         3ocQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si1099049qkf.127.2018.11.08.08.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 08:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKnAh-0001XS-7n
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 11:28:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gKn5m-0006DN-32
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 11:23:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gKn5b-0007Na-TR
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 11:23:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1gKn5b-0007Mt-Jx
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 11:23:27 -0500
Received: by mail-wm1-f66.google.com with SMTP id w7-v6so1869306wmc.1
	for <qemu-devel@nongnu.org>; Thu, 08 Nov 2018 08:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KX2nWj8COXKeymxHpps/ju9qtihGh/vwxtsM5+jLOsw=;
	b=WNKnC+0jV8X7TUeKZwOBBiWkR7ioWPWfW8QAoX5z94xmk7B+w+wwOl7XsBzoaNdlor
	0dElNz8sKvp3vaJKAsrkn31HBhZhzYD9+W1vH7+Zm4fCaO7y87+ftCCf2UtEflZ0Vbhh
	IpH56Xtst7nhR58TO07n4x2o/M0D/OXgzyiQRO+abSRDbWhAXJmc7O4L2tfYA6sbuCv/
	zVPfaZfiHssOrPpl4r4kDC0gsiqriR+VLAml6wYSNW+10RLEV1qLtNnr/TQP31DZpjlo
	BCJ+7hmmRZms22IymHp/SNgqQNDvbr0WqvDLNm8Xeph/isQzaEYautt+47j+8negsQmy
	AfhQ==
X-Gm-Message-State: AGRZ1gIGz4BlpVpk+lKwAHD01WOJ6nnMT/OjYWl1M6qlZh4t2imkFuef
	bd37y09YWYEYgmrfISoNHxo/zV6nZoe2fAsbjM2EjQ==
X-Received: by 2002:a1c:5885:: with SMTP id
	m127-v6mr1737501wmb.118.1541694206655; 
	Thu, 08 Nov 2018 08:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20181106110548.4209-1-luc.michel@greensocs.com>
	<20181106110548.4209-2-luc.michel@greensocs.com>
	<28f0188a-e8fb-ad21-0c1d-9aaa5b81d261@redhat.com>
In-Reply-To: <28f0188a-e8fb-ad21-0c1d-9aaa5b81d261@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 8 Nov 2018 17:23:14 +0100
Message-ID: <CAP+75-XPStesboG8yybAaknYHg0k6nxwsihJdEVeHJnOJHNKNQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH v4 01/16] hw/cpu: introduce CPU clusters
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlFWsFwgCUpt

On Thu, Nov 8, 2018 at 5:17 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
> On 6/11/18 12:05, Luc Michel wrote:
> > This commit adds the cpu-cluster type. It aims at gathering CPUs from
> > the same cluster in a machine.
> >
> > For now it only has a `cluster-id` property.
> >
> > Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
> >   hw/cpu/cluster.c         | 59 +++++++++++++++++++++++++++++++++++++++=
+

Eduardo are you OK to cover these files in your "Machine core"
MAINTAINER's section?

> >   hw/cpu/Makefile.objs     |  2 +-
> >   3 files changed, 98 insertions(+), 1 deletion(-)
> >   create mode 100644 include/hw/cpu/cluster.h
> >   create mode 100644 hw/cpu/cluster.c
> >
> > diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> > new file mode 100644
> > index 0000000000..0e5f121ec2
> > --- /dev/null
> > +++ b/include/hw/cpu/cluster.h
> > @@ -0,0 +1,38 @@
> > +/*
> > + * QEMU CPU cluster
> > + *
> > + * Copyright (c) 2018 GreenSocs SAS
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, see
> > + * <http://www.gnu.org/licenses/gpl-2.0.html>
> > + */
> > +#ifndef HW_CPU_CLUSTER_H
> > +#define HW_CPU_CLUSTER_H
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/qdev.h"
> > +
> > +#define TYPE_CPU_CLUSTER "cpu-cluster"
> > +#define CPU_CLUSTER(obj) \
> > +    OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
> > +
> > +typedef struct CPUClusterState {
> > +    /*< private >*/
> > +    DeviceState parent_obj;
> > +
> > +    /*< public >*/
> > +    uint64_t cluster_id;
>
> As it or reducing this type:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > +} CPUClusterState;
> > +
> > +#endif
> > diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> > new file mode 100644
> > index 0000000000..a23d55054a
> > --- /dev/null
> > +++ b/hw/cpu/cluster.c
> > @@ -0,0 +1,59 @@
> > +/*
> > + * QEMU CPU cluster
> > + *
> > + * Copyright (c) 2018 GreenSocs SAS
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, see
> > + * <http://www.gnu.org/licenses/gpl-2.0.html>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/cpu/cluster.h"
> > +#include "qapi/error.h"
> > +#include "qemu/module.h"
> > +
> > +static void cpu_cluster_init(Object *obj)
> > +{
> > +    static uint64_t cluster_id_auto_increment =3D 0;
> > +    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
> > +
> > +    cluster->cluster_id =3D cluster_id_auto_increment++;
> > +}
> > +
> > +static Property cpu_cluster_properties[] =3D {
> > +    DEFINE_PROP_UINT64("cluster-id", CPUClusterState, cluster_id, 0),
> > +    DEFINE_PROP_END_OF_LIST()
> > +};
> > +
> > +static void cpu_cluster_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->props =3D cpu_cluster_properties;
> > +}
> > +
> > +static const TypeInfo cpu_cluster_type_info =3D {
> > +    .name =3D TYPE_CPU_CLUSTER,
> > +    .parent =3D TYPE_DEVICE,
> > +    .instance_size =3D sizeof(CPUClusterState),
> > +    .instance_init =3D cpu_cluster_init,
> > +    .class_init =3D cpu_cluster_class_init,
> > +};
> > +
> > +static void cpu_cluster_register_types(void)
> > +{
> > +    type_register_static(&cpu_cluster_type_info);
> > +}
> > +
> > +type_init(cpu_cluster_register_types)
> > diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
> > index cd52d20b65..8db9e8a7b3 100644
> > --- a/hw/cpu/Makefile.objs
> > +++ b/hw/cpu/Makefile.objs
> > @@ -1,5 +1,5 @@
> >   obj-$(CONFIG_ARM11MPCORE) +=3D arm11mpcore.o
> >   obj-$(CONFIG_REALVIEW) +=3D realview_mpcore.o
> >   obj-$(CONFIG_A9MPCORE) +=3D a9mpcore.o
> >   obj-$(CONFIG_A15MPCORE) +=3D a15mpcore.o
> > -common-obj-y +=3D core.o
> > +common-obj-y +=3D core.o cluster.o
> >
