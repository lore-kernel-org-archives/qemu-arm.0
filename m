Received: by 10.25.87.130 with SMTP id l124csp1017lfb;
        Mon, 5 Sep 2016 00:53:09 -0700 (PDT)
X-Received: by 10.55.159.82 with SMTP id i79mr11598378qke.12.1473061989430;
        Mon, 05 Sep 2016 00:53:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f62si16849470qkj.127.2016.09.05.00.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 00:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgoiK-000690-PA
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 03:53:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bgoiC-00065s-8H
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 03:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bgoi7-0004QZ-64
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 03:52:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bgoi7-0004QJ-0S; Mon, 05 Sep 2016 03:52:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1CFE80084;
	Mon,  5 Sep 2016 07:52:53 +0000 (UTC)
Received: from localhost.localdomain (vpn1-6-211.ams2.redhat.com [10.36.6.211])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u857qp7X021808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Sep 2016 03:52:52 -0400
To: Wei Huang <wei@redhat.com>, qemu-devel@nongnu.org
References: <1472852809-23042-1-git-send-email-wei@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <599049c8-534e-e29e-f4d1-749945fae8b2@redhat.com>
Date: Mon, 5 Sep 2016 09:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1472852809-23042-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 05 Sep 2016 07:52:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] ARM: ACPI: fix the AML ID
 format for CPU devices
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rrSqPTGYLRRH

Hi Wei,

On 02/09/2016 23:46, Wei Huang wrote:
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Tested on Cavium ThunderX.

Many thanks!

Eric
