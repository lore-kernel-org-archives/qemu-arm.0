Received: by 10.182.158.201 with SMTP id ww9csp2751322obb;
        Mon, 21 Dec 2015 05:12:51 -0800 (PST)
X-Received: by 10.55.76.11 with SMTP id z11mr24222827qka.83.1450703571465;
        Mon, 21 Dec 2015 05:12:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e38si29361768qgd.22.2015.12.21.05.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Dec 2015 05:12:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aB0Gg-0006r7-PQ
	for alex.bennee@linaro.org; Mon, 21 Dec 2015 08:12:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aB0Ge-0006ny-7j
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 08:12:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aB0Gd-0002mz-7y
	for qemu-arm@nongnu.org; Mon, 21 Dec 2015 08:12:48 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:7305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aB0GX-0002kY-98; Mon, 21 Dec 2015 08:12:41 -0500
Received: from 172.24.1.51 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.51])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DBG72667; Mon, 21 Dec 2015 21:12:21 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 21 Dec 2015 21:12:13 +0800
Message-ID: <5677FAA8.3050901@huawei.com>
Date: Mon, 21 Dec 2015 21:12:08 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>	<20151219203841.GC25389@redhat.com>
	<20151221140042.5a74f8c9@nial.brq.redhat.com>
In-Reply-To: <20151221140042.5a74f8c9@nial.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5677FAB7.010F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b50aeb3c3901ac66e57642fe677e9474
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	ARM ACPI Subsystem <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/74] pc: acpi: convert DSDT to
 AML API and drop ASL templates support
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
X-TUID: JKvVk/07hCKE



On 2015/12/21 21:00, Igor Mammedov wrote:
> On Sat, 19 Dec 2015 22:38:41 +0200
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> > On Thu, Dec 10, 2015 at 12:40:54AM +0100, Igor Mammedov wrote:
>>> > > Due to huge size, CCing only cover letter instead of individual patches.
>>> > > 
>>> > > Series consist of 2 parts the 1st part prefixed 'acpi:' adds necessary
>>> > > AML API functions and the second part converts DSDT using existing and
>>> > > new AML API.
>>> > > 
>>> > > Series does exact byte by byte conversion and passes ACPI tables
>>> > > 'make check' tests.
>>> > > The conversion first moves common for PIIX4/Q35 parts, getting rid of *.dsl
>>> > > includes and then converts PIIX4 and Q35 parts of DSDT.
>>> > > 
>>> > > Diff-stat looks nice but actual code base is reduced by ~2000LOC
>>> > > while the rest of 10000 removals is dropping precompiled AML
>>> > > templates from tree.
>>> > > 
>>> > > There are some AML parts that could be optimized/simplified and shared
>>> > > between PIIX4/Q35/ARM but doing it will break exact match with original
>>> > > tests, hence it's left out of the scope of this series.
>>> > > 
>>> > > CC: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
>>> > > CC: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI Subsystem)
>>> > > CC: Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM)
>>> > > CC: Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
>>> > > CC: Richard Henderson <rth@twiddle.net> (maintainer:X86)
>>> > > CC: Eduardo Habkost <ehabkost@redhat.com> (maintainer:X86)
>>> > > CC: qemu-arm@nongnu.org (open list:ARM ACPI Subsystem)
>> > 
>> > I think this is a nice series, and I think we can live with the fact
>> > make check warns in the middle.
>> > 
>> > I sent some comments I'd like to see addressed.
>> > 
>> > Main points
>> > 	- one v2 patch seems garbled
>> > 	- please don't create functions with tons of parameters
>> > 	  which just do if (a) on each of these internally.
>> > 	  instead, move common code into a small function that
>> > 	  can be reused without so many conditionals.
>> > 	- I really dislike local variables starting with a_ for
>> > 	  no good reason.
> Michael,
> 
> Could you apply already reviewed AML API patches 1-24
> and push it to master early, pls?
> 
+1

BTW, Below patches are already in master.

[PATCH 15/74] acpi: support serialized method
[PATCH 24/74] acpi: extend aml_interrupt() to support multiple irqs

> That will help to reduce collisions with other AML
> patches on list and provide more complete API for others to use.
> 

-- 
Shannon

