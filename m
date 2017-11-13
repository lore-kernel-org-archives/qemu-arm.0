Received: by 10.223.150.237 with SMTP id u100csp2422023wrb;
        Mon, 13 Nov 2017 05:02:09 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZY8egbqDEiApOtDAW+goeMM7tlVJTLzpNUQ/LX2QKEJePF7zMPlWlGJLA0aR8R9qU5U3IN
X-Received: by 10.37.109.6 with SMTP id i6mr5217264ybc.338.1510578128915;
        Mon, 13 Nov 2017 05:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510578128; cv=none;
        d=google.com; s=arc-20160816;
        b=eZJS7uXVHG7x5FLhL+YIQNJ2BgMUF7KRteg0APpJClMJ0Z6xUTCNM9wFtWvgXLdzbu
         IoaWJ5B1Ui/qVzrhbDCI2VYSrQZFl0OyK5ZMJCILvBd21CQ05HLFy8ts3vnW4T86nyhn
         nLYejJ8aUG2XVpFS3FL9l8Cg7lmVpIMAzGnrNg8+eRalmQLyN9OX6E/jvbEFuEWbcJFk
         dHkDOsyQT+b23CI7fkiorm2l/dnYHf9p5hwU93Yds/tYEBKlnoBtKzpx185BTB55cPcX
         8kRSXRNl0wdDjLaRdtFReZEeGvaQBtIT1HgvAHsI7sz4pi7q0CwcC3W0vGcQTuEjOw7j
         Juqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=9CMRVxMesEDm1Bjecy+k8VCLdqRx5ToM7BAdXloLhkg=;
        b=IPj5xgMweMi628IdJFDLpeJ0ayaUnAT/W8q5KUH8yMQ9anM7Y4stmuZh7HnfWob6ye
         Rz3rJ8XKZLvD4EjIOoiZ1R8hjyn/pmGDmMrGMtfgR/n7UBQSRix2drqqzbRGRuV6d6VX
         WnjXKOBx3mhfvTEgNafUPQdDRxJIF9ZKCIJdrzV7OtaIntkO3JObYuUT61lWW70xqhsY
         Br+X+mH6x2Z5ARDhmtsKbS49m7cPusAMiI9lGU5OPU13y4w5+swlz2IX1diUQ48faRiH
         uz4tlmA6ciunxeDaoGIzxwDQ3X29IlkGd4AHrEKAxXdYXH7yd53Pe/mlUnYRRQiRRYJL
         NWsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si3628542ywb.790.2017.11.13.05.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 05:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEENM-00088O-Cm
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 08:02:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eEEN9-00088G-6H
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:01:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eEEN6-0006v3-2w
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:01:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eEEN5-0006sI-RV; Mon, 13 Nov 2017 08:01:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AFA46A7EC;
	Mon, 13 Nov 2017 13:01:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED89E749A0;
	Mon, 13 Nov 2017 13:00:49 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-16-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-BfvNFMFpiQd-XwGPYGasV3D-w3oDcqfHRoAXOAT17Fg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <40a0ece3-7498-0dda-9e13-234ba09bedf1@redhat.com>
Date: Mon, 13 Nov 2017 14:00:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BfvNFMFpiQd-XwGPYGasV3D-w3oDcqfHRoAXOAT17Fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 13 Nov 2017 13:01:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 15/20] hw/arm/sysbus-fdt: Pass the
 VirtMachineState to the node creation functions
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: evIZT3XOwKoJ

Hi Peter,

On 09/10/2017 19:47, Peter Maydell wrote:
> On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
>> The VirtMachineState contains some dt phandles that will be used
>> in some node creation functions. For instance we plan to use the
>> PCI host controller phandle in the smmu node creation function. So
>> let's pass the VirtMachineState handle down to the node creation
>> functions by enhancing the involved datatypes.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/sysbus-fdt.c         | 3 +++
>>  hw/arm/virt.c               | 1 +
>>  include/hw/arm/sysbus-fdt.h | 2 ++
>>  3 files changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index d68e3dc..d92a983 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -36,6 +36,7 @@
>>  #include "hw/vfio/vfio-platform.h"
>>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>>  #include "hw/vfio/vfio-amd-xgbe.h"
>> +#include "hw/arm/virt.h"
>>  #include "hw/arm/fdt.h"
>>
>>  /*
>> @@ -47,6 +48,7 @@ typedef struct PlatformBusFDTData {
>>      int irq_start; /* index of the first IRQ usable by platform bus devices */
>>      const char *pbus_node_name; /* name of the platform bus node */
>>      PlatformBusDevice *pbus;
>> +    VirtMachineState *vms;
>>  } PlatformBusFDTData;
> 
> sysbus-fdt isn't virt specific, so this doesn't belong here.
Correct. I plan to replace this by MachineState instead.
> 
> More generally, why is sysbus-fdt involved in this at all?
> I expected that instantiating and wiring up the SMMU would
> be the job of hw/arm/virt.c, like any other device we
> might have on the board.
I wished to have the same type of option as for x86 where
"-device intel-iommu" is passed to the QEMU command line. smmuv3 device
being a SysBusDevice, a natural framework to handle its node creation
function is sysbus-fdt. Having a -device approach is practical to pass
other options to the device (this was typically the case for the
"caching-mode" option). On Intel there are caching-mode, passthrough
(pt) options.

Although the smmu caching-mode option may not survive in this form, we
can foresee other options to come. In the future we may pass the PCI bus
number we want to plug the smmu into.

Also the invocation method would be identical for virtio-iommu.

I explored the other (and simpler) alternative of passing an option to
virt machine but I think this approach is less flexible. Also as you
pointed out, by default, smmu would be on, if we stick to the existing
convention. Given the perf overhead I don't think this is what we want.

Thanks

Eric
> 
> thanks
> -- PMM
> 
