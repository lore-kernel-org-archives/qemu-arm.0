Received: by 10.25.0.6 with SMTP id 6csp103523lfa;
        Tue, 30 May 2017 18:23:47 -0700 (PDT)
X-Received: by 10.200.56.56 with SMTP id q53mr28895744qtb.36.1496193827287;
        Tue, 30 May 2017 18:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496193827; cv=none;
        d=google.com; s=arc-20160816;
        b=O5++E/twrjG5KDeGiAMfC2Xgfm3sWprRxE0SG6hfuadb4j5q/p61glOLusXpCf7nHE
         i07aTKIBbESDgb66i6fahEKkdAWTVIvW0+roBoo8M8NE5zS16AcnRzbtosHvHziRmXFT
         qQCxd3nQb+Hd7Leu+7ddZ5v3SUiF6XHUdNQ4luK8CndKQ4yrI7mGMY12P3qDtUxn+tQW
         CJPr6/JkBKPiG+P7SQaTRnZKKtJwHddAA9JG1UEDNRpNAuoe8Ho6p2EEdigC6XKDAjrP
         Z8MGtVD6iKUcsHs/L+CwKU5njfUjdF4zh/AjoShl5fI8yEr/L7KZED9ydeCgf4cwfrUp
         yRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=COC2926Uf6uCCY5KiLg82kM6IqltYwiXp9gBay0HzvA=;
        b=u1/6mrAApYbnQ6PnnBUlRyf/f0RhXJ9WdBCm4znm/1LkiBl61T5jXkstjcvXeY+ef3
         RKB01XAfrjPqPcesgzeXy+HNTlq6CIhXPcxwlR8lno4DN/2l3iUgPHsWRmJ/gpfWXpeV
         5ZtMfktzRnsid5zzPht71TYAcfZmznrKSiF5NpMUM1+Hb5o/RQK/4o/ZJZxjowWccVvA
         u4huyGJ2jalTV/YrQdEZ/xQmdQbXhx2QCuPwU0665IA1A5pU7U9EkBf/YpVkNgz1MT5r
         HgwSCYrXZhzkfSonl51Ln3xUNiV/9GIAppE3Y/TsfBnZm12xOelhJA2UYzqkaOLNAi6W
         2L1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o191si9151493qke.59.2017.05.30.18.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 18:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFsMS-0000Nu-KS
	for alex.bennee@linaro.org; Tue, 30 May 2017 21:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dFsMO-0000NW-Pm
	for qemu-arm@nongnu.org; Tue, 30 May 2017 21:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dFsML-0000jz-Gq
	for qemu-arm@nongnu.org; Tue, 30 May 2017 21:23:40 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1dFsMK-0000j0-Tg; Tue, 30 May 2017 21:23:37 -0400
Received: from 172.30.72.53 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.53])
	by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AOO04852; Wed, 31 May 2017 09:16:48 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Wed, 31 May 2017
	09:16:38 +0800
Message-ID: <592E1971.8000008@huawei.com>
Date: Wed, 31 May 2017 09:16:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>
References: <20170529173751.3443-1-drjones@redhat.com>
	<20170529173751.3443-3-drjones@redhat.com>
In-Reply-To: <20170529173751.3443-3-drjones@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.592E1981.00CA, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5ed3f6b770d82da20b347fff74e339a9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.189
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: fdt: generate distance-map
 when needed
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HayWplzdN6k



On 2017/5/30 1:37, Andrew Jones wrote:
> This is based on patch Shannon Zhao originally posted.
> 
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/arm/virt.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c7c8159dfd59..4db2d4207cf2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -219,6 +219,27 @@ static void create_fdt(VirtMachineState *vms)
>                                  "clk24mhz");
>      qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vms->clock_phandle);
>  
> +    if (have_numa_distance) {
> +        int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
> +        uint32_t *matrix = g_malloc0(size);
> +        int idx, i, j;
> +
> +        for (i = 0; i < nb_numa_nodes; i++) {
> +            for (j = 0; j < nb_numa_nodes; j++) {
> +                idx = (i * nb_numa_nodes + j) * 3;
> +                matrix[idx + 0] = cpu_to_be32(i);
> +                matrix[idx + 1] = cpu_to_be32(j);
> +                matrix[idx + 2] = cpu_to_be32(numa_info[i].distance[j]);
> +            }
> +        }
> +
> +        qemu_fdt_add_subnode(fdt, "/distance-map");
> +        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
> +                                "numa-distance-map-v1");
> +        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> +                         matrix, size);
> +        g_free(matrix);
> +    }
>  }
>  
>  static void fdt_add_psci_node(const VirtMachineState *vms)
> 

-- 
Shannon

