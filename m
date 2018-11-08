Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp339091wrw;
        Thu, 8 Nov 2018 08:30:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5dWH94laa1PViPFP5fcOWgOH9GdlNCfR/hgbNL9Dg7MyYwk0dDiZ/KYpRQZgmQxbPbq+Itt
X-Received: by 2002:a0c:9dc6:: with SMTP id p6mr5173859qvf.217.1541694604938;
        Thu, 08 Nov 2018 08:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541694604; cv=none;
        d=google.com; s=arc-20160816;
        b=xe/wWJvKHYQVictsRvifnN8ZwQwRMmFVJgyJ95bT5Ob5AgMbs3zMSdbow+VP6urTOH
         Agmz87Ys0/wKOl6r+KVQKaw0Pc5KMzbccl07d9+6T3q9BRG/cmKOAQGkmjma871r5Vyp
         Lenzw+5tPEPTBe1CRB5HsN9JXRm1+T9MC2pJC0Hq5pkMJb72EWJsz3sbhSDBC8Zstuxn
         2BJSfEth3ypritNUL/DJQz6fWH475t4NSTssMZ4oq4Tr8d7k1tH1QrAFR+KIDnYPqKm+
         6sozG7eq02MHxLNFivJFI0gtwqBhviIpWhhKtJU8m0CQAaBM/IR9PsEjJozbl/N7hAqr
         3McQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=H3e12GPwttWw4rcRk+0Gnw48ckxhIYbnuNtV+CpB2mQ=;
        b=dfU7Xq0hMVNlj+KaB4KPS1JNr0tcxdHxr/lHGt6BHdYZkhYtdFTb300phpjBPg1Ziv
         +9NAH07FHjIKx+h3LRVkinc9/IhZhOKhdqe7CwIx3oRsfyDDb8YSZvzV89XwpaSvRBWr
         4gLhrc16g1PESPzHUteDXAtrJt2sS3CUWoFrhzFAwpAwutCJG2ff2TIdAYr6ZCKrQNhb
         pdqaN8lWLmFrK4jVwQP3LtUY/TIb4fC24LZRw3dESyQIhAlWFec4dlLbbOIDpE5K5Uxy
         ZneSqhHODLb1EzrcJu0UGdP+0+fDCVedejZHVZqxHw8iHFVfq3NYySeNP7SyN23YciJG
         2G0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t60si2023712qtd.279.2018.11.08.08.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 08:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKnC0-00052g-DE
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 11:30:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKn0E-0005hM-HP
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKn09-0000Nz-Dx
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:17:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gKn09-00006L-46
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:17:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id t15-v6so1771351wmt.0
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 08:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H3e12GPwttWw4rcRk+0Gnw48ckxhIYbnuNtV+CpB2mQ=;
	b=aSj1Xp19C70hn8V/blcAC1LqPoXh+fZ2JkGZMF8O414Fjck8f8ksxoMkUO4X86phm9
	bbmiwMonmPvBS4ZOxPcmSEWckqfPJCpCplBeqzSvqa/5c/UqCQamdYuSb+ISxn1Ca28b
	kvpYImgSaf3MALcLWx0iixUgHo4lTN+B7ljTaORQH59KCVXRDEC1of39fOaBHuxwqbd/
	IXJ7omXYRA61/RTA4h/ldMYq5FHAWXJVrENFZIHxVHu6rSfAkxpYdnuoTQ29xdMnmWaa
	7Lzknjoqqq6qjdbZS+9SF+zW7eB5cWkzBu06dPr01z3+ULNvVtvFWZgO104ATSpPPrQp
	n37Q==
X-Gm-Message-State: AGRZ1gLYkSopCCxs/r6r/wm5YQ3srOZXGrk5D+coMrYcjdtfmSni1mld
	Xg2uw8dpN8nq/u8WJRNFOB9Pe1NLtKr98A==
X-Received: by 2002:a1c:f313:: with SMTP id
	q19-v6mr1690431wmq.87.1541693849897; 
	Thu, 08 Nov 2018 08:17:29 -0800 (PST)
Received: from [10.201.33.126] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	p188-v6sm3667868wmp.31.2018.11.08.08.17.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 08:17:29 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181106110548.4209-1-luc.michel@greensocs.com>
	<20181106110548.4209-2-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28f0188a-e8fb-ad21-0c1d-9aaa5b81d261@redhat.com>
Date: Thu, 8 Nov 2018 17:17:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181106110548.4209-2-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 01/16] hw/cpu: introduce CPU
 clusters
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
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXWN7y4DwxSm

On 6/11/18 12:05, Luc Michel wrote:
> This commit adds the cpu-cluster type. It aims at gathering CPUs from
> the same cluster in a machine.
> 
> For now it only has a `cluster-id` property.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
>   hw/cpu/cluster.c         | 59 ++++++++++++++++++++++++++++++++++++++++
>   hw/cpu/Makefile.objs     |  2 +-
>   3 files changed, 98 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/cpu/cluster.h
>   create mode 100644 hw/cpu/cluster.c
> 
> diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
> new file mode 100644
> index 0000000000..0e5f121ec2
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
> +    uint64_t cluster_id;

As it or reducing this type:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +} CPUClusterState;
> +
> +#endif
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> new file mode 100644
> index 0000000000..a23d55054a
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
> +    static uint64_t cluster_id_auto_increment = 0;
> +    CPUClusterState *cluster = CPU_CLUSTER(obj);
> +
> +    cluster->cluster_id = cluster_id_auto_increment++;
> +}
> +
> +static Property cpu_cluster_properties[] = {
> +    DEFINE_PROP_UINT64("cluster-id", CPUClusterState, cluster_id, 0),
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
> diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
> index cd52d20b65..8db9e8a7b3 100644
> --- a/hw/cpu/Makefile.objs
> +++ b/hw/cpu/Makefile.objs
> @@ -1,5 +1,5 @@
>   obj-$(CONFIG_ARM11MPCORE) += arm11mpcore.o
>   obj-$(CONFIG_REALVIEW) += realview_mpcore.o
>   obj-$(CONFIG_A9MPCORE) += a9mpcore.o
>   obj-$(CONFIG_A15MPCORE) += a15mpcore.o
> -common-obj-y += core.o
> +common-obj-y += core.o cluster.o
> 
