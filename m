Received: by 10.25.87.130 with SMTP id l124csp1729651lfb;
        Sun, 4 Sep 2016 18:43:54 -0700 (PDT)
X-Received: by 10.237.41.225 with SMTP id o88mr37153857qtd.18.1473039834468;
        Sun, 04 Sep 2016 18:43:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si16112836qtu.94.2016.09.04.18.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 18:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgiwz-00060M-UN
	for alex.bennee@linaro.org; Sun, 04 Sep 2016 21:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bgiwv-00060B-K1
	for qemu-arm@nongnu.org; Sun, 04 Sep 2016 21:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bgiwq-0004yI-Ir
	for qemu-arm@nongnu.org; Sun, 04 Sep 2016 21:43:48 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:3458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bgiwp-0004wb-U2; Sun, 04 Sep 2016 21:43:44 -0400
Received: from 172.24.1.36 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DMQ36276; Mon, 05 Sep 2016 09:40:14 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1; Mon, 5 Sep 2016
	09:40:04 +0800
Message-ID: <57CCCCF4.9050804@huawei.com>
Date: Mon, 5 Sep 2016 09:40:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, <qemu-devel@nongnu.org>
References: <1472852809-23042-1-git-send-email-wei@redhat.com>
In-Reply-To: <1472852809-23042-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.57CCCD00.0031, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7fcafccead55d95a801036d834db1a85
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [PATCH 1/1] ARM: ACPI: fix the AML ID format for CPU
 devices
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UtV/9+TQlOt6



On 2016/9/3 5:46, Wei Huang wrote:
> Current QEMU will stall guest VM booting under ACPI mode when vcpu count
> is >= 12. Analyzing the booting log, it turns out that DSDT table can't
> be loaded correctly due to "Invalid character(s) in name (0x62303043),
> repaired: [C00*]". This is because existing QEMU uses a lower case AML
> ID for CPU devices (e.g. C000, C001, ..., C00a, C00b). The ACPI code
> inside guest VM detects this lower case character as an invalid character
> (see acpi_ut_valid_acpi_char() in drivers/acpi/acpica/utstring.c file)
> and converts it to "*". This causes duplicated IDs (i.e. "C00a" ==>"C00*"
> and "C00b" ==> "C00*"). So ACPI refuses to load the table.
> 
> This patch fixes the problem by changing the format with a upper case
> character. It matches the CPU ID formats used in other parts of QEMU
> code.
> 
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..295ec86 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -53,7 +53,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>      uint16_t i;
>  
>      for (i = 0; i < smp_cpus; i++) {
> -        Aml *dev = aml_device("C%03x", i);
> +        Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>          aml_append(scope, dev);
> 
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

Thanks,
-- 
Shannon

