Received: by 10.25.27.66 with SMTP id b63csp2091692lfb;
        Tue, 7 Jun 2016 09:15:46 -0700 (PDT)
X-Received: by 10.200.41.198 with SMTP id 6mr246181qtt.104.1465316146491;
        Tue, 07 Jun 2016 09:15:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u38si9339093qgd.82.2016.06.07.09.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 09:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAJfN-0008IE-TD
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 12:15:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bAJev-0007zp-6X
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 12:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bAJeq-0002hI-5I
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 12:15:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bAJep-0002h3-W0; Tue, 07 Jun 2016 12:15:12 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D63BC049D68;
	Tue,  7 Jun 2016 16:15:11 +0000 (UTC)
Received: from [10.72.5.208] (vpn1-5-208.pek2.redhat.com [10.72.5.208])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57GF77c007717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2016 12:15:09 -0400
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
	<CAFEAcA_FU3LdJLWrYLcv0WAugiYfnOxfDFgs6oRFVRaUEs1L-g@mail.gmail.com>
	<20160607155149.wpqsavmouhdr63iq@hawk.localdomain>
From: Wei Huang <wei@redhat.com>
Message-ID: <5756F30A.2070102@redhat.com>
Date: Wed, 8 Jun 2016 00:15:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <20160607155149.wpqsavmouhdr63iq@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 07 Jun 2016 16:15:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V1 0/2] Versioning ARM virt
 machine types
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3cQRAr8bpH7Z



On 06/07/2016 11:51 PM, Andrew Jones wrote:
> On Tue, Jun 07, 2016 at 04:17:09PM +0100, Peter Maydell wrote:
>> On 11 March 2016 at 17:36, Wei Huang <wei@redhat.com> wrote:
>>> We start to see more features been added to ARM virtual machine models.
>>> For the purpose of backward compatibility (e.g. migration), it is time
>>> to consider versioning machine types for ARM VMs. As a beginning step, this
>>> patchset defines an abstract machine type for ARM VMs. The current
>>> "virt" machine is re-written based on this new abstract type accordingly.
>>> These patches have been verified by booting existing VMs.
>>>
>>> RFC->V1:
>>>  * Rename the machine type to "virt-2.6", matching the imminent QEMU version
>>>  * Remove mc->is_default (Peter's comment)
>>
>> So is there a plan to provide a virt-2.7 for the next release?
> 
> Yup. I was planning to send it as part of a small "hw/arm/virt: add
> cpu-map" series I pretty much have ready, but didn't finish and send
> yet because I got distracted working on the larger plan (among other
> things). The motivation (larger plan) for cpu-map is full cpu-topology
> configuration, but working on that has led to an smp parameter rework
> RFC (hoping to send this week...) Wei or I can just send the virt-2.7
> patch now though to get it done sooner than later.

It makes sense to go with Drew's patches, so he doesn't need to re-base
his existing current implementation.

> 
> Thanks,
> drew
> 
