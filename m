Received: by 10.25.0.144 with SMTP id 138csp399264lfa;
        Wed, 19 Apr 2017 11:41:50 -0700 (PDT)
X-Received: by 10.55.155.131 with SMTP id d125mr3897547qke.32.1492627310167;
        Wed, 19 Apr 2017 11:41:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si3215393qtc.81.2017.04.19.11.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 11:41:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0uY1-000608-NR
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 14:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1d0uXx-0005zq-Sd
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 14:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1d0uXu-0003GQ-Oy
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 14:41:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1d0uXu-0003Fx-FS; Wed, 19 Apr 2017 14:41:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F9F08123E;
	Wed, 19 Apr 2017 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7F9F08123E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7F9F08123E
Received: from [10.36.116.61] (ovpn-116-61.ams2.redhat.com [10.36.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB07A5C8AC;
	Wed, 19 Apr 2017 18:41:23 +0000 (UTC)
To: Cornelia Huck <cornelia.huck@de.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<20170419002926.GC23273@umbus.fritz.box>
	<20170419014207.GT25239@thinpad.lan.raisama.net>
	<20170419140522.391f0b50.cornelia.huck@de.ibm.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <387c438e-d993-bd59-a59a-83c58d447eab@redhat.com>
Date: Wed, 19 Apr 2017 21:41:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20170419140522.391f0b50.cornelia.huck@de.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 19 Apr 2017 18:41:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Scott Wood <scottwood@freescale.com>, David Gibson <dgibson@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OxvCiU1qY7VH

On 04/19/2017 03:05 PM, Cornelia Huck wrote:
> On Tue, 18 Apr 2017 22:42:07 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
>> On Wed, Apr 19, 2017 at 10:29:26AM +1000, David Gibson wrote:
>>> On Tue, Apr 18, 2017 at 07:17:21PM -0300, Eduardo Habkost wrote:
>>>> pci_bus_new*() and pci_register_bus() work only when the 'parent'
>>>> argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
>>>> are meant to initialize a bus that's in a PCI host bridge.
>>>>
>>>> The new function names are:
>>>> * pci_host_bus_init() (replacing pci_bus_new())
>>>> * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
>>>> * pci_host_bus_init_irqs() (replacing pci_register_bus())
>>>
>>> I like the idea, but I'm not terribly convinced by these names.
>>> Aren't functions which allocate objects usually called whatever_new()
>>> rather than whatever_init()?  And pci_register_bus() appears to do
>>> more than just initialize irqs.
>>
>> I agree the names aren't terribly clear. This is what they are
>> supposed to mean:
>>
>> * pci_host_bus_init(phb) initializes phb->bus.
>> * pci_host_bus_init(phb) initializes phb->bus using an
>>   already-allocated object.
>> * pci_host_bus_init_irqs() does the same as pci_host_bus_init(),
>>   but also calls pci_bus_irqs().
>>
>> I plan to submit API documentation comments later. I am open to
>> alternative name suggestions.
>>
>
> pci_host_bus_init_irqs() sounds as if it would only init irqs. What

Right! This is what I thought too.

> about:
>
> pci_host_bus_new()
> pci_host_bus_new_inplace()
> pci_host_bus_new_with_irqs()

I like the names, but a following patch (5/6) modifies
the above functions to return void and create the bus
as a side effect.
So now we have a pci_host_bus_new that returns nothing?

Thanks,
Marcel


>
> (the last one might be a bit long, though, especially as it takes so
> many arguments already)
>

