Received: by 10.80.166.35 with SMTP id d32csp297104edc;
        Fri, 14 Oct 2016 07:03:55 -0700 (PDT)
X-Received: by 10.55.23.105 with SMTP id i102mr11345062qkh.301.1476453834980;
        Fri, 14 Oct 2016 07:03:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k22si9802672qta.5.2016.10.14.07.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 07:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv35W-0001MP-H2
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 10:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv35O-0001Li-FY
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 10:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv35I-0007Li-Jk
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 10:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bv35I-0007LW-Dc; Fri, 14 Oct 2016 10:03:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8F12C04B927;
	Fri, 14 Oct 2016 14:03:39 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-131.ams2.redhat.com [10.36.4.131])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EE3aF9017727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Oct 2016 10:03:37 -0400
To: Andrew Jones <drjones@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-2-git-send-email-eric.auger@redhat.com>
	<20161014144218.10d072b5@nial.brq.redhat.com>
	<20161014133239.p7czyawvp45b33li@hawk.localdomain>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cb8dfdcd-1073-2608-90a6-6586fd9da80d@redhat.com>
Date: Fri, 14 Oct 2016 16:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161014133239.p7czyawvp45b33li@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 14 Oct 2016 14:03:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] ACPI: Add IORT Structure
 definition
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
Cc: peter.maydell@linaro.org, tn@semihalf.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	prem.mallappa@broadcom.com, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FZLkizjpQNe

Hi Igor,

On 14/10/2016 15:32, Andrew Jones wrote:
> On Fri, Oct 14, 2016 at 02:42:18PM +0200, Igor Mammedov wrote:
>> On Fri, 14 Oct 2016 10:54:54 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>>
>>> ACPI Spec 6.0 introduces IO Remapping Table Structure. This patch
>>> introduces the definitions required to describe the IO relationship
>>> between the PCIe root complex and the ITS.
>>>
>>> This conforms to:
>>> "IO Remapping Table System Software on ARM Platforms",
>>> Document number: ARM DEN 0049B, October 2015.
>>>
>>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> Preferred way to build/pack ACPI tables info is to use
>> build_append_foo() functions.
> 
> We've raised this before with Shannon, but it was already too late
> for most tables. Now all tables in hw/arm/virt-acpi-build.c are
> done in the style of this series, and I'd prefer we keep the style
> consistent. If I ever get some free time to experiment then I might
> try rewriting all of them in the build_append_ style to see how it
> looks though.

Thank you for the info. Well so let's keep it as is if nobody objects.

Thanks

Eric
> 
> Thanks,
> drew
> 
