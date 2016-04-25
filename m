Received: by 10.25.208.194 with SMTP id h185csp761329lfg;
        Mon, 25 Apr 2016 00:51:48 -0700 (PDT)
X-Received: by 10.140.102.50 with SMTP id v47mr31723598qge.99.1461570708619;
        Mon, 25 Apr 2016 00:51:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si264125qge.32.2016.04.25.00.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 00:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubJ4-0006s8-91
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 03:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubJ2-0006qd-N4
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubIz-0000ms-Hc
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 03:51:44 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:20860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubIy-0000mW-Vg; Mon, 25 Apr 2016 03:51:41 -0400
Received: from 172.24.1.60 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAM75713; Mon, 25 Apr 2016 15:51:32 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 25 Apr 2016 15:51:20 +0800
Message-ID: <571DCC5D.8010405@huawei.com>
Date: Mon, 25 Apr 2016 15:50:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
	<1461402396-11776-5-git-send-email-zhaoshenglong@huawei.com>
	<20160424170049.mxfial3f5xbmfmxs@hawk.localdomain>
In-Reply-To: <20160424170049.mxfial3f5xbmfmxs@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.571DCC86.0030, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f033a1bd330a59edc13e8e1ea0832d3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 4/5] ACPI: move
 acpi_build_srat_memory to common place
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
Cc: peter.maydell@linaro.org, david.daney@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZbGtGrMk808



On 2016/4/25 1:00, Andrew Jones wrote:
> On Sat, Apr 23, 2016 at 05:06:35PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Move acpi_build_srat_memory to common place so that it could be reused
>> > by ARM.
>> > 
>> > Cc: Michael S. Tsirkin <mst@redhat.com>
>> > Cc: Igor Mammedov <imammedo@redhat.com>
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/acpi/aml-build.c         | 12 ++++++++++++
>> >  hw/i386/acpi-build.c        | 20 --------------------
>> >  include/hw/acpi/aml-build.h | 10 ++++++++++
>> >  3 files changed, 22 insertions(+), 20 deletions(-)
>> > 
>> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> > index ab89ca6..d167003 100644
>> > --- a/hw/acpi/aml-build.c
>> > +++ b/hw/acpi/aml-build.c
>> > @@ -1563,3 +1563,15 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
>> >      build_header(linker, table_data,
>> >                   (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
>> >  }
>> > +
>> > +void acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>> > +                            uint64_t len, int node, MemoryAffinityFlags flags)
> It looks like functions like these in hw/acpi/aml-build.c usually start
> with 'build_' not 'acpi_'
> 
Ok, I will rename it to build_acpi_srat_memory.

>> > +{
>> > +    numamem->type = ACPI_SRAT_MEMORY;
>> > +    numamem->length = sizeof(*numamem);
>> > +    memset(numamem->proximity, 0, 4);
> This memset thing is still weird...
> 
I will add a patch before this one to fix the definition of proximity
and use uint32_t as you said before.

Thanks,
-- 
Shannon

