Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4205451wrw;
        Tue, 13 Nov 2018 02:39:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5dRnNb+CxxYHCb/MBFBbQG7Uvi7rPBQfdiC/7LOfrXURF7q2UYNJAV9MlSosN+6TFUXpZJC
X-Received: by 2002:a0c:d065:: with SMTP id d34mr4454692qvh.209.1542105542066;
        Tue, 13 Nov 2018 02:39:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542105542; cv=none;
        d=google.com; s=arc-20160816;
        b=E9Hk5wWFz+lslWZmp+zipxYEXePU0a5KEqzFGTZ/9pEntI5/jBV37GHeLFR1SeYW5l
         VdYktQnQObrsA0mj9gljAr2ZQbmqilHuTrwGHuNt+xDPYSvK7GvWmkCT5rkILMwwP1Ou
         UzrVzgRIB6Tu0M0R1PQLCtU2yi6c4amB/aVrh8a+scqPvI198+yRluy5F7IQSa7i5JQT
         GfIuCibMxF4IPGP4YNNoFx3B4ZMxVrnWBZP3lLvyd6ytZycbJt/SbHDjqVguPp7z3BNq
         Ju5ckUIb1FhJB5g8WNv3Ah0n54SVgbfWw5uYIH4leM2Xpc6PadAg2SZfSP0Ul/zT7ERz
         NHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=jtVEvg+h7w5DYsQdAGFuCgOaBvQcpBv7Il2gjghU32A=;
        b=YJvag8o6/2bpdGtsb5dhe3CKwTdd5tLwhoNAp2U7e/WW/kD3UXqhQ6VIuzLm+Q45Ql
         4J+Bu6O8cWP5X5hzqhyNtoiv0m/mRCEkMupWI4l7jOU6rKADjxyiMvS2BfF5mGoG7Yri
         lrznq/MU6WWL7UoLZ2zCyDpiaRtmlRc1ejU1UfYh+isy3fvBN6YpaAnjuvpmRbU6s8yS
         CRtFwFs+bbtsE7nPIqKzWTllde66nXAFKZqtn6fmWWEGWnTk+hnK6EfwaabrcOJNfD9U
         cOoo5sC0+t+m9QN7sIHA4eVTQ7a5wfhjoN0M4A/YU5ExXZrNu3seRI8UNgb1dMcsOqqw
         qocw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dC+XBR6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si771810qte.269.2018.11.13.02.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 02:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dC+XBR6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMW61-0000tc-FG
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 05:39:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMW5p-0000sK-0S
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 05:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMW5n-0006fI-He
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 05:38:48 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMW5f-0005wy-9P; Tue, 13 Nov 2018 05:38:40 -0500
Received: by mail-lf1-x142.google.com with SMTP id b20so8406202lfa.12;
	Tue, 13 Nov 2018 02:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=jtVEvg+h7w5DYsQdAGFuCgOaBvQcpBv7Il2gjghU32A=;
	b=dC+XBR6BSCv876nJ5NCAC8IYTwl3gnc17Rx5fvAOLe01fvV49NiZdjRtf6alvJK/zX
	qwY17BpNWXILMSF/UxiWbuw1fmPmAjgRtdMqXJWwXQGgKgnthHqDZzavOlWmLaPqaEca
	ldL2luhP+RYUTpl7n2Z5uhuljOCz2vMxUnYLVzNiOYkQoDp6tSQlibydiUU+bakOVD+k
	LSE94vD44MiuhmhaoKttfZyZxnThLVNWKGQ/4bDnC3tJmz/qf5YdoreIdRdkPVuuDVkB
	W+rrKfoxv+5NsxFbusXV/HBp+M0wLn9vvYj2m0QElkYicRYb9nCOp7lPeCBbhPQLdDbF
	ByeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=jtVEvg+h7w5DYsQdAGFuCgOaBvQcpBv7Il2gjghU32A=;
	b=Ts1ysMgQWNol0ly+8GunOfVZW3qx8sOnB1GP9LIlpxdVm9M4Zs7T63K2ucwCb5FjAk
	XByZKE8SCsYuQrfNebYr5fHr3J/AQF4h84dCaSfGVDF7eIoc5cW7Bwi7m01GKLRCZ2hy
	4JPbHPRzvz9SC3Sa9KZ+3zfuiIeqWQeta4NKWPYFDeZNAqB2jSpfTpTwcGMMIDE8vej6
	KU4KjIuCVcK1sL4RBdQFpcINW9/8NH6oCAmMwFqulv0YjlIuXU1arhWC6LB2VN63S7Be
	9H1ZQ9w2+4IUhO0KZ/0stTY+G7Gc21rzknYfENBmbKd/hCP1uD8+IErMud7Iqs0BRP0L
	MGqg==
X-Gm-Message-State: AGRZ1gK4UbeFLgxrGknFebJJf4/V5A5qBjgFN+MLIpNLNc9cqa6tKpMt
	u9Hrbt8HuOTslxjh+8aeiqs=
X-Received: by 2002:a19:980f:: with SMTP id a15mr2802755lfe.103.1542105506827; 
	Tue, 13 Nov 2018 02:38:26 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	s24sm3190851lfc.30.2018.11.13.02.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 02:38:25 -0800 (PST)
Date: Tue, 13 Nov 2018 11:38:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181113103824.GF1148@toto>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-2-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181110081147.4027-2-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [PATCH v5 01/16] hw/cpu: introduce CPU clusters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X0wIazp3/VS1

On Sat, Nov 10, 2018 at 09:11:32AM +0100, Luc Michel wrote:
> This commit adds the cpu-cluster type. It aims at gathering CPUs from
> the same cluster in a machine.
> 
> For now it only has a `cluster-id` property.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
>  hw/cpu/cluster.c         | 59 ++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS              |  2 ++
>  hw/cpu/Makefile.objs     |  2 +-
>  4 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/cpu/cluster.h
>  create mode 100644 hw/cpu/cluster.c
> 
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> new file mode 100644
> index 0000000000..11f50d5f6b
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
> +#ifndef HW_CPU_CLUSTER_H
> +#define HW_CPU_CLUSTER_H
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
> index 0000000000..e0ffd76152
> --- /dev/null
> +++ b/hw/cpu/cluster.c
> @@ -0,0 +1,59 @@
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
> +#include "qemu/osdep.h"
> +#include "hw/cpu/cluster.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +
> +static void cpu_cluster_init(Object *obj)
> +{
> +    static uint32_t cluster_id_auto_increment;
> +    CPUClusterState *cluster = CPU_CLUSTER(obj);
> +
> +    cluster->cluster_id = cluster_id_auto_increment++;
> +}
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
> +    .instance_init = cpu_cluster_init,
> +    .class_init = cpu_cluster_class_init,
> +};
> +
> +static void cpu_cluster_register_types(void)
> +{
> +    type_register_static(&cpu_cluster_type_info);
> +}
> +
> +type_init(cpu_cluster_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 126fe0be7e..8e20b0e672 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1022,11 +1022,13 @@ Machine core
>  M: Eduardo Habkost <ehabkost@redhat.com>
>  M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>  S: Supported
>  F: hw/core/machine.c
>  F: hw/core/null-machine.c
> +F: hw/cpu/cluster.c
>  F: include/hw/boards.h
> +F: include/hw/cpu/cluster.h
>  T: git git://github.com/ehabkost/qemu.git machine-next
>  
>  Xtensa Machines
>  ---------------
>  sim
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
