Received: by 10.25.0.6 with SMTP id 6csp1683157lfa;
        Mon, 29 May 2017 23:58:19 -0700 (PDT)
X-Received: by 10.237.44.129 with SMTP id g1mr22855281qtd.212.1496127498922;
        Mon, 29 May 2017 23:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496127498; cv=none;
        d=google.com; s=arc-20160816;
        b=HRZfr6GWUqrKYdcbnbtbenUj0Ovjl/X3rq5VdwRmCOcn2tQPE68dwmFMtPcygz7PQ6
         eOPnzritThWH1XhYHhXl2YJYX5DsvE6iK3pGn609pcbWL+dN0wP5QBDNPNF74XnEL1BJ
         mg/GgIctKOSrE1VagUQjMd2qqMs7SjwIl+RIzJ2A3Bzou+FVjtxIuOrhr+VoOH8NHSop
         WeFf1Jfjkx2h4jM8RuQ0yGBlVbcCs/M8qvpeu+UAi182Ta7UnTEfdEFuWNYX5WpeQNdP
         8DBphM2kbNsCR0k0HSHzZ8nKY7zAzV9CqORlLs6BNRl3syth4K+tt0ji8AXTxGWsVnDS
         lIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Y7NJo3FS9YTGnZRGDEFEtfDCxFEROsZX1gUQPn4Ft6o=;
        b=wq+9i0c72jF3VK/z4DbVCztVcQlZ1m9iYTSMRud+rPFlftBXM2LPO/blKwdbPIp8ln
         O2O8xw1gEZosm5qRwYAy4CRpherUXdkNbOqIPE9xLGRCpO5vMvPqucFWdLDh/0xIQT53
         +ZZzHV0zFqzzw0nhN6lJ8LLMNn2ob3MvNPKOxjVR4SmLu8RmXwMjXYIAYNS2uB52WeZn
         UVq8MGSZ7eoEshmPksp8/6lUyiIHq76qAhz78kIpnTQnZi2QkNhIjyS5jl2Ygbt025IL
         NMoH+9xJ00em2XHT1B6VawZlm4nq/2HkL9S4+dGt1NHBS/AHQwva8T3zPAJK+NoyF7oH
         O1+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a78si11416727qkh.64.2017.05.29.23.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 23:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFb6g-0000HX-8x
	for alex.bennee@linaro.org; Tue, 30 May 2017 02:58:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFb6b-0000G0-5o
	for qemu-arm@nongnu.org; Tue, 30 May 2017 02:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dFb6Y-0004vq-6Q
	for qemu-arm@nongnu.org; Tue, 30 May 2017 02:58:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dFb6Y-0004vQ-13; Tue, 30 May 2017 02:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DFDE37E72;
	Tue, 30 May 2017 06:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2DFDE37E72
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2DFDE37E72
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C379E189EF;
	Tue, 30 May 2017 06:58:06 +0000 (UTC)
Date: Tue, 30 May 2017 08:58:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170530085802.578dc4b3@nial.brq.redhat.com>
In-Reply-To: <20170529173751.3443-2-drjones@redhat.com>
References: <20170529173751.3443-1-drjones@redhat.com>
	<20170529173751.3443-2-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 30 May 2017 06:58:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/arm/virt-acpi-build:
 build SLIT when needed
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WUiVlbRk6YMK

On Mon, 29 May 2017 19:37:50 +0200
Andrew Jones <drjones@redhat.com> wrote:

> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e5852067f5bd..2079828c22a4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -776,6 +776,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      if (nb_numa_nodes > 0) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, vms);
> +        if (have_numa_distance) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_slit(tables_blob, tables->linker);
> +        }
>      }
>  
>      if (its_class_name() && !vmc->no_its) {

