Received: by 10.182.158.201 with SMTP id ww9csp175196obb;
        Wed, 9 Dec 2015 17:51:02 -0800 (PST)
X-Received: by 10.140.25.145 with SMTP id 17mr12478599qgt.96.1449712262491;
        Wed, 09 Dec 2015 17:51:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 85si2111450qha.128.2015.12.09.17.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 17:51:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6qNq-0002GW-55
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 20:51:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a6qNo-0002Ej-4I
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 20:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a6qNn-0003w0-7Z
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 20:51:00 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:50418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a6qNg-0003sl-Fi; Wed, 09 Dec 2015 20:50:53 -0500
Received: from 172.24.1.48 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAO59781; Thu, 10 Dec 2015 09:50:39 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Dec 2015 09:50:30 +0800
Message-ID: <5668DA65.5080700@huawei.com>
Date: Thu, 10 Dec 2015 09:50:29 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, <qemu-devel@nongnu.org>
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
	<1449704528-289297-25-git-send-email-imammedo@redhat.com>
In-Reply-To: <1449704528-289297-25-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5668DA71.002F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b642d418d1f67fdc2909e73594271734
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 24/74] acpi: extend aml_interrupt() to
 support multiple irqs
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
X-TUID: 6Cl1bHz3iODS



On 2015/12/10 7:41, Igor Mammedov wrote:
>  static void acpi_dsdt_add_virtio(Aml *scope,
>                                   const MemMapEntry *virtio_mmio_memmap,
> -                                 int mmio_irq, int num)
> +                                 uint32_t mmio_irq, int num)
>  {
>      hwaddr base = virtio_mmio_memmap->base;
>      hwaddr size = virtio_mmio_memmap->size;
> -    int irq = mmio_irq;
> +    uint32_t irq = mmio_irq;
>      int i;
>  
>      for (i = 0; i < num; i++) {
> @@ -152,15 +152,15 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>          aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
>          aml_append(crs,
>                     aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, irq + i));
> +                                 AML_EXCLUSIVE, &irq, 1));

This looks not right. You could move uint32_t irq = mmio_irq; into the
for loop and make it as uint32_t irq = mmio_irq + i;

Thanks,
-- 
Shannon

