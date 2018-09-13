Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp239378wrd;
        Wed, 12 Sep 2018 23:40:45 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbjSY4qBSFmsyB+DFlwprSirhJarKnbY0USGlKUIm8K4tMzDuiMKVBzlJC3wKEMnJYc1QN/
X-Received: by 2002:a37:8903:: with SMTP id l3-v6mr4029669qkd.337.1536820845470;
        Wed, 12 Sep 2018 23:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536820845; cv=none;
        d=google.com; s=arc-20160816;
        b=0FermRKHnQjoPUKiaWpk6jqf4n2TdnD2O1pQRSxiMgTpy1ME+eA+24O44hWeAtldxW
         IfrXgAT8u1crdqZKJtutJe7/qJU4bZgOmuYOqowTJHGqDBPWg3C15u19Ap1D7vSET/1z
         n3elC7di2FDmWFgUh50VCoF7CguYGDMp+ZP+trAJlslPyJkHcgWyiqb9xaumCjKTqvxQ
         FXytQrlNvNcHqwA/yQ/+Z5n3qn3I8VnZIG6Kmlk+tV6IOgn5ZIagNr6vfUQKZGZbBl7B
         cIgldlRbRvRUPHMGVhWSOnqkcUEZTK3FU5tamkNUPjWuwnk+iKcyEg8NtI7YIYOFDZj0
         HKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=UkIRcF792BE6ZsWA3OGakrXWRsrH7ZdH3jovr2hOowo=;
        b=mgk3O79Y1AiQli40zzAkcH/sCm4LFYHuEceUtbHvfjV/hHiLLX4y2wN/dNkMnFXwTi
         ICBmEy785bwTJt8bre0xIdCZjSVu0N0cBIuVhgAj9R1hT7p7RcrLIYPwrsOFipZMSjzx
         NCoQV4kTE59idlMBA63tXIOQmrFukKsP3X0QpECKkUubnKRoSelqIk0REm9tNCktUdEW
         eNA37nBu0aUFrVQvAn0VFI4+Um2IPP2UnLYfibNdhObK2xru2CzX98ndC9W08dO/QWDb
         MX/2yPDcor3Dy3bCAWA9zPdbb1soTZO86kRGlavRVW2T3he+vsDRaxjY7XD7FgCEbaCR
         C4wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z136-v6si2503225qkb.299.2018.09.12.23.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Sep 2018 23:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g0LIy-000135-VI
	for alex.bennee@linaro.org; Thu, 13 Sep 2018 02:40:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g0LIj-00012j-Od
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 02:40:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g0LIf-0004yU-QL
	for qemu-arm@nongnu.org; Thu, 13 Sep 2018 02:40:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1g0LIf-0004xu-KN; Thu, 13 Sep 2018 02:40:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84BF53082B24;
	Thu, 13 Sep 2018 06:40:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 951415D6B3;
	Thu, 13 Sep 2018 06:40:22 +0000 (UTC)
Date: Thu, 13 Sep 2018 08:40:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <20180913064020.xcxjof5466emyplp@kamzik.brq.redhat.com>
References: <20180911112643.19296-1-shenglong.zsl@alibaba-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180911112643.19296-1-shenglong.zsl@alibaba-inc.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 13 Sep 2018 06:40:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: Add a
 check for memory-less NUMA nodes
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wIW7T2I8ig10

On Tue, Sep 11, 2018 at 07:26:43PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhaosl@gmail.com>
> 
> Like commit 16b4226(hw/acpi-build: Add a check for memory-less NUMA node
> ), it also needs to check memory length for NUMA nodes on ARM.
> 
> Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>  hw/arm/virt-acpi-build.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ce31abd..5785fb6 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -562,10 +562,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < nb_numa_nodes; ++i) {
> -        numamem = acpi_data_push(table_data, sizeof(*numamem));
> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> -                          MEM_AFFINITY_ENABLED);
> -        mem_base += numa_info[i].node_mem;
> +        if (numa_info[i].node_mem > 0) {
> +            numamem = acpi_data_push(table_data, sizeof(*numamem));
> +            build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> +                              MEM_AFFINITY_ENABLED);
> +            mem_base += numa_info[i].node_mem;
> +        }
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
> -- 
> 2.9.3.windows.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
