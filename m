Received: by 10.25.77.65 with SMTP id a62csp279212lfb;
        Thu, 9 Feb 2017 18:54:12 -0800 (PST)
X-Received: by 10.200.48.14 with SMTP id f14mr5835978qte.236.1486695252059;
        Thu, 09 Feb 2017 18:54:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o132si241153qka.50.2017.02.09.18.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 18:54:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cc1Ld-0002rZ-EI
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 21:54:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cc1LW-0002pQ-5J
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 21:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1cc1LS-0002mv-9g
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 21:54:02 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:10485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1cc1LR-0002lx-H8; Thu, 09 Feb 2017 21:53:58 -0500
Received: from 172.24.1.47 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DYU36236; Fri, 10 Feb 2017 10:50:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 10 Feb 2017 10:49:56 +0800
Message-ID: <589D2A50.5030500@huawei.com>
Date: Fri, 10 Feb 2017 10:49:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, <qemu-devel@nongnu.org>
References: <1486644810-33181-1-git-send-email-agraf@suse.de>
	<1486644810-33181-4-git-send-email-agraf@suse.de>
In-Reply-To: <1486644810-33181-4-git-send-email-agraf@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.589D2A61.0046, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2584fc7f9be5da567c8536e35325c3df
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] hw/arm/virt: Declare
 fwcfg as dma cache coherent in ACPI
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
X-TUID: IvLck2IQAppx



On 2017/2/9 20:53, Alexander Graf wrote:
> Fw-cfg recently learned how to directly access guest memory and does so in
> cache coherent fashion. Tell the guest about that fact when it's using ACPI.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 8955a9d..0835e59 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -90,6 +90,7 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>      aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
>      /* device present, functioning, decoding, not shown in UI */
>      aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
>      Aml *crs = aml_resource_template();
>      aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> 

-- 
Shannon

