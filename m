Received: by 10.25.0.144 with SMTP id 138csp1714815lfa;
        Tue, 18 Apr 2017 06:37:17 -0700 (PDT)
X-Received: by 10.55.88.4 with SMTP id m4mr12122811qkb.84.1492522637665;
        Tue, 18 Apr 2017 06:37:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189si10000194qkd.225.2017.04.18.06.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Apr 2017 06:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0TJl-00054b-51
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 09:37:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1d0TJg-000539-15
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:37:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1d0TJd-0007BS-Eg
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:37:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1d0TJd-0007BF-8G; Tue, 18 Apr 2017 09:37:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECE8A7D0DC;
	Tue, 18 Apr 2017 13:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ECE8A7D0DC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ECE8A7D0DC
Received: from [10.36.118.2] (unknown [10.36.118.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50A244D744;
	Tue, 18 Apr 2017 13:37:00 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20170417215916.12431-1-ehabkost@redhat.com>
	<20170417215916.12431-4-ehabkost@redhat.com>
	<9cbafe84-88bb-ca3c-d85e-dae71af438ff@redhat.com>
	<20170418133005.GL25239@thinpad.lan.raisama.net>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <9fb8997c-0e16-2ded-4cc1-81ba06fe3465@redhat.com>
Date: Tue, 18 Apr 2017 16:36:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20170418133005.GL25239@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Apr 2017 13:37:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 3/7] pci: Change pci_bus_new*() parameter to
 PCIHostState
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
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	David Gibson <dgibson@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkf0M0hUUUyg

On 04/18/2017 04:30 PM, Eduardo Habkost wrote:
> On Tue, Apr 18, 2017 at 04:27:23PM +0300, Marcel Apfelbaum wrote:
> [...]
>>> @@ -431,7 +430,7 @@ PCIBus *pci_register_bus(DeviceState *parent, const char *name,
>>>  {
>>>      PCIBus *bus;
>>>
>>> -    bus = pci_bus_new(parent, name, address_space_mem,
>>> +    bus = pci_bus_new(PCI_HOST_BRIDGE(parent), name, address_space_mem,
>>
>> If you request the parent to be PCI_HOST_BRIDGE, why don't you change also the signature of
>> pci_register_bus ?
>
> I do it on patch 4/7.
>

Yes, I saw it :). at least it means I am following the patches...

Thanks,
Marcel


