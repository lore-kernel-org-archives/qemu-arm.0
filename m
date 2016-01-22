Received: by 10.25.159.19 with SMTP id i19csp4083894lfe;
        Thu, 21 Jan 2016 17:32:49 -0800 (PST)
X-Received: by 10.140.150.129 with SMTP id 123mr547818qhw.14.1453426368924;
        Thu, 21 Jan 2016 17:32:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 134si4394483qhz.5.2016.01.21.17.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 17:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMQam-0004xi-9w
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 20:32:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMQak-0004x1-4t
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 20:32:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMQaf-0003d4-BJ
	for qemu-arm@nongnu.org; Thu, 21 Jan 2016 20:32:46 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:33847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMQae-0003cU-O7; Thu, 21 Jan 2016 20:32:41 -0500
Received: from 172.24.1.50 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAH72571; Fri, 22 Jan 2016 09:28:19 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 22 Jan 2016 09:28:09 +0800
Message-ID: <56A185A7.5080800@huawei.com>
Date: Fri, 22 Jan 2016 09:28:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>
References: <1453380893-26174-1-git-send-email-drjones@redhat.com>
In-Reply-To: <1453380893-26174-1-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.56A185B4.002F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8017636add939542d7f7d2c3954770e6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org
Subject: Re: [Qemu-arm] [PATCH] virt-acpi-build: add always-on property for
	timer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NrrreBbQYyYS



On 2016/1/21 20:54, Andrew Jones wrote:
> This patch is the ACPI equivalent of "hw/arm/virt: Add always-on
> property to the virt board timer". The timer is always on, and
> thus setting this informs Linux that it may switch off the periodic
> timer. Switching off the periodic timer substantially reduces the
> number of interrupts the host needs to inject.
> 
> Testing note: AArch64 guests (the only ones currently booting with
> ACPI) do not actually need this patch to determine it can turn the
> periodic timer off. I therefore used a hacked guest kernel to ensure
> this patch works as the equivalent DT patch does.
> 
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 87fbe7c97d99b..f6e538f3d02ea 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -443,7 +443,7 @@ build_gtdt(GArray *table_data, GArray *linker)
>      gtdt->secure_el1_flags = ACPI_EDGE_SENSITIVE;
>  
>      gtdt->non_secure_el1_interrupt = ARCH_TIMER_NS_EL1_IRQ + 16;
> -    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE;
> +    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE | ACPI_GTDT_ALWAYS_ON;
>  
>      gtdt->virtual_timer_interrupt = ARCH_TIMER_VIRT_IRQ + 16;
>      gtdt->virtual_timer_flags = ACPI_EDGE_SENSITIVE;
> 

-- 
Shannon

