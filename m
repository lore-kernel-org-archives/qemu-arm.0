Received: by 10.25.21.156 with SMTP id 28csp1506694lfv;
        Mon, 15 Aug 2016 09:13:09 -0700 (PDT)
X-Received: by 10.55.159.82 with SMTP id i79mr34144498qke.192.1471277589424;
        Mon, 15 Aug 2016 09:13:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g23si14172684qtb.82.2016.08.15.09.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 09:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZKVg-00019n-SO
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 12:13:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZKVc-00019R-It
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bZKVW-0004JF-I3
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:13:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bZKVW-0004JA-Bn; Mon, 15 Aug 2016 12:12:58 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D23CF13D02;
	Mon, 15 Aug 2016 16:12:56 +0000 (UTC)
Received: from [10.10.54.99] (vpn-54-99.rdu2.redhat.com [10.10.54.99])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FGCscG023583; Mon, 15 Aug 2016 12:12:55 -0400
To: Andrea Bolognani <abologna@redhat.com>, qemu-arm@nongnu.org
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<1471253464.3003.5.camel@redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <57B1EA05.2050908@redhat.com>
Date: Mon, 15 Aug 2016 11:12:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1471253464.3003.5.camel@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 15 Aug 2016 16:12:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V1 1/1] arm64: Add an option to turn on/off
 host-backed vPMU support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PpoMz2O5mGcb



On 8/15/16 04:31, Andrea Bolognani wrote:
> 
> On Sat, 2016-08-13 at 00:52 -0500, Wei Huang wrote:
>> This patch adds a pmu=[on/off] option to enable/disable host vPMU
>> support in guest VM. There are several reasons to justify this option.
>> First, host-backed vPMU can be problematic for cross-migration between
>> different SoC as perf counters are architecture-dependent. It is more
>> flexible to have an option to turn it on/off. Secondly this option
>> matches the "pmu" option as supported in libvirt tool.
>>  
>> Note that, like "has_el3", the "pmu" option is only made available on
>> CPUs that support host-backed vPMU. They include:
>>      * cortex-a53 + kvm
>>      * cortex-a57 + kvm
>>      * host + kvm
>> This option is removed in other configs where it doesn't make sense
>> (e.g. cortex-a57 + TCG); and the default pmu support is off. This patch
>> has been tested under both DT/ACPI modes.
>>  
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>   hw/arm/virt-acpi-build.c |  2 +-
>>   hw/arm/virt.c            |  2 +-
>>   target-arm/cpu.c         | 13 +++++++++++++
>>   target-arm/cpu.h         |  3 ++-
>>   target-arm/cpu64.c       |  6 ++++++
>>   target-arm/kvm64.c       | 10 +++++-----
>>   6 files changed, 28 insertions(+), 8 deletions(-)
> 
> Did you already try driving this with libvirt? It should work
> out of the box.
> 
> If you haven't, I will do it :)

No, I haven't. All tests were done based on command line to QEMU. :-)

-Wei

> 
> -- 
> Andrea Bolognani / Red Hat / Virtualization
> 
