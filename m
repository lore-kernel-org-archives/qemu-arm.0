Received: by 10.25.0.6 with SMTP id 6csp104439lfa;
        Tue, 30 May 2017 18:27:17 -0700 (PDT)
X-Received: by 10.55.15.26 with SMTP id z26mr16858915qkg.114.1496194036984;
        Tue, 30 May 2017 18:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496194036; cv=none;
        d=google.com; s=arc-20160816;
        b=0SOfGFp9z9jXnGr8C2D68rWXIPmh+Se2Gt+Hh5Q9RbWXIJBEzilBA/V9c3t7l8dH+7
         6VPPahksqAYyWcbIFhGxtKD3J5TueOSze6Kc5D0zFEukd1AkQdVgpQKuemYMf6VMG3pe
         YTQlChqMEcW4kB9mo/bMA6GfCp0BFwopcyo+rQ3GNNKbmqtytean750z5N23Jzph3IEW
         2I2IvpJJdt788Rg/xQ3qCbOxeVLTEOasmrpwz2PLwznYC7WflkaQkvdHgDBYqT+t5ISE
         oJiBHsgcTReBcO/rD//mLsHgP/QxZSjZQO3httHyjelG71g6p5paMa0Y6AHzgH6Q3m8F
         ZjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=y1Q8NQ70WQ4mOJ+pAB2ke44dyyC4NqK8T1aOi6IPx7Q=;
        b=FGN8dUweFSnyuGtWlgF+N73X5rGZPOpV1hNOkzkL9X6FG1hhI9ykLOKD59E0xHjk5R
         Dlb5HW85V0EoCRuaPBpHYxEv2Fzkrzr2WRlLDFKOUb3ASId+NqLA3PhTRWO5jqdtjphn
         OnF3QndaiiLVfl6uwP9Qmy3w8pstwZKKCltR9kyKzN6A5GuB6+2jklQ93oPLkvUkYclK
         wsoIhHLIBM/GpFlzaHqHroU64C00oX3K4JEUJ/aK3wIu14V4XJyyxTWMzlGWUsG06rGA
         PG/ColZFIVKcA9m7hZmQgSUk7Anqt2XxN+6bS3yJMSNXgq0jfvKKddTRK4ztpeu+ny+R
         kFMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189si14525445qkf.60.2017.05.30.18.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 18:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFsPq-0001Bp-Ee
	for alex.bennee@linaro.org; Tue, 30 May 2017 21:27:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dFsPn-00017G-8X
	for qemu-arm@nongnu.org; Tue, 30 May 2017 21:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dFsPk-0001tA-0h
	for qemu-arm@nongnu.org; Tue, 30 May 2017 21:27:11 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1dFsPj-0001t3-Jw; Tue, 30 May 2017 21:27:07 -0400
Received: from 172.30.72.56 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.56])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AOM14375; Wed, 31 May 2017 09:17:28 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Wed, 31 May 2017
	09:17:20 +0800
Message-ID: <592E199C.1040602@huawei.com>
Date: Wed, 31 May 2017 09:17:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>
References: <20170529173751.3443-1-drjones@redhat.com>
	<20170529173751.3443-2-drjones@redhat.com>
In-Reply-To: <20170529173751.3443-2-drjones@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.592E19A8.0164, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 808c5ac649df91573d2feafbbe663c89
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/virt-acpi-build: build SLIT when
 needed
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
X-TUID: kExc/I5rw+h9



On 2017/5/30 1:37, Andrew Jones wrote:
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

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
> 

-- 
Shannon

