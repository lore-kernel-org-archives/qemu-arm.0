Received: by 10.25.77.65 with SMTP id a62csp279059lfb;
        Thu, 9 Feb 2017 18:53:31 -0800 (PST)
X-Received: by 10.55.168.68 with SMTP id r65mr6780419qke.189.1486695211230;
        Thu, 09 Feb 2017 18:53:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b65si219768qkf.245.2017.02.09.18.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 18:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cc1Ky-0002Vc-KO
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 21:53:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cc1Kr-0002Q4-VQ
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 21:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cc1Ko-0002Ye-1s
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 21:53:22 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:3348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cc1Kn-0002X8-FA; Thu, 09 Feb 2017 21:53:17 -0500
Received: from 172.24.1.136 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.136])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DUH36064; Fri, 10 Feb 2017 10:49:36 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 10 Feb 2017 10:49:25 +0800
Message-ID: <589D2A30.5030804@huawei.com>
Date: Fri, 10 Feb 2017 10:49:20 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, <qemu-devel@nongnu.org>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
	<1486644810-33181-3-git-send-email-agraf@suse.de>
In-Reply-To: <1486644810-33181-3-git-send-email-agraf@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.589D2A41.0070, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0e7943bf3f868e549ab91c9349078626
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/4] hw/arm/virt: Declare
 virtio-mmio as dma cache coherent in ACPI
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
Cc: mst@redhat.com, qemu-arm@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: seQ/bLMCwRBn



On 2017/2/9 20:53, Alexander Graf wrote:
> Virtio-mmio devices can directly access guest memory and do so in cache
> coherent fashion. Tell the guest about that fact when it's using ACPI.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 07a10ac..8955a9d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -135,6 +135,7 @@ static void acpi_dsdt_add_virtio(Aml *scope,
>          Aml *dev = aml_device("VR%02u", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
>          Aml *crs = aml_resource_template();
>          aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> 

-- 
Shannon

