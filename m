Received: by 10.223.173.107 with SMTP id p98csp384338wrc;
        Thu, 28 Sep 2017 00:54:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBZ0GqkogtBiGPky58+7ge22hoXxh869pTdOWjrGnwYlOl4MA0KEoGF4uU34wxKeMF2mdc4
X-Received: by 10.55.104.150 with SMTP id d144mr5708739qkc.185.1506585287087;
        Thu, 28 Sep 2017 00:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506585287; cv=none;
        d=google.com; s=arc-20160816;
        b=KksPZNZHj0uZwKdOCuaSNsj2c0ConCtXihLH/ouD+m5gGhJnZNQat2gxx+1mBrDXrv
         L/HQoVaXlYOQ+9Vhz+kF2ohud6QEsHmq+xR6LCm01jRJhBcKhODu6GmvvslBok56QENv
         Eqc3oaHQYe0Dcl6bbIwKc2rjJ3Gr8n1moxx1hWT32oMS2RuawaiZ8+s1dmcLOeud69DY
         2ess7UC/Y4cjEnaZ93QEV0mVFr16eRDZOhSU/8UsqpDQzGtfNjpvk9FYBnNyxD0wUQWu
         5n7kMiEb1VFZ8FhHsGPxrC0scJEa/h92PZpjoRjl6oZNSIB+vix00QdwGwciDAi7kahB
         biLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Np2Y8uvSlftToUs2pYNsyq5yCTwtUxzNc24ZJeCvOSQ=;
        b=WwjP/TkLvYktYCUts7qplmwxINbl/7Jm5gbmBGimsn5Y5L11tLwgFsa7ygG6TQIm7R
         B5SHkEkKVIKu+2Vtl/4WrpxynpvGJE+I14CF6lPWthpB/o9TOQdo0yawLYaa6yPVZaqu
         Mmf2JvL5Xj8ErGOedKDzylZR4xXcvQoCrUmsRKju2ympVYnTIvsd7eQaTW+Uw4Gd7k8X
         jak+7+Vll6HDXCFWpnVM3omH7AR3Res21QPJV5EuH4Qpu8GRolMvXNDmG1Ef5NjiPr54
         NGOq/nErz+XDrvJ+AuJjnEusfisp4P5LXJCyCDLpk5oQVvfMfhrOajRuNFZxQWrSDNE4
         B/8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si1038007qta.516.2017.09.28.00.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 00:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxTee-0006s8-TC
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 03:54:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxTeV-0006rz-UZ
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxTeV-0003va-0t
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:54:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxTeU-0003vA-Nw; Thu, 28 Sep 2017 03:54:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DD2CC059B6C;
	Thu, 28 Sep 2017 07:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6DD2CC059B6C
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E41586E60;
	Thu, 28 Sep 2017 07:54:22 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>, Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20170928064312.GA1544@virtx40>
	<20170928071359.GG17044@pxdev.xzpeter.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <42a551e1-ccc4-f162-51d8-c61ca5f86790@redhat.com>
Date: Thu, 28 Sep 2017 09:54:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170928071359.GG17044@pxdev.xzpeter.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 28 Sep 2017 07:54:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/20] ARM SMMUv3 Emulation
 Support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, prem.mallappa@gmail.com,
	robin.murphy@arm.com, eric.auger.pro@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rOwtgeCIpWuk

Hi Linu, Peter,

On 28/09/2017 09:13, Peter Xu wrote:
> On Thu, Sep 28, 2017 at 12:13:12PM +0530, Linu Cherian wrote:
>> Hi Eric,
>>
>>
>> On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
>>> This series implements the emulation code for ARM SMMUv3.
>>>
>>> Changes since v6:
>>> - DPDK testpmd now running on guest with 2 assigned VFs
>>> - Changed the instantiation method: add the following option to
>>>   the QEMU command line
>>>   -device smmuv3 # for virtio/vhost use cases
>>>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
>>> - splitted the series into smaller patches to allow the review
>>> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
>>>   is isolated from the rest: last 2 patches, not for upstream.
>>>   This is shipped for testing/bench until a better solution is found.
>>> - Reworked permission flag checks and event generation
>>> e testing:
>>> - in dt and ACPI modes
>>> - virtio-net-pci and vhost-net devices using dma ops with various
>>>   guest page sizes [2]
>>> - assigned VFs using dma ops [3]:
>>>   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
>>>   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
>>> - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
>>>   with guest and host page size equal (4kB)
>>>
>>> Known limitations:
>>> - no VMSAv8-32 suport
>>> - no nested stage support (S1 + S2)
>>> - no support for HYP mappings
>>> - register fine emulation, commands, interrupts and errors were
>>>   not accurately tested. Handling is sufficient to run use cases
>>>   described above though.
>>> - interrupts and event generation not observed yet.
>>
>> While testing with vfio-pci, observed that the below two  Qemu command,
>> results in two different behaviour. Is this expected by design ?
>>
>> Case 1:
>> # -device vfio-pci,host=0002:01:00.3 -device smmuv3,caching-mode
>>  Here iommu is not attached to the pci bus in Qemu backend, since
>>  pci_setup_iommu is not called before vfio_realize.
>>
>> Case 2:
>> # -device smmuv3,caching-mode -device vfio-pci,host=0002:01:00.3
>> This works as expected, iommu is attached to the pci bus.
> 
> Not sure about SMMU, but VT-d should have similar issue - the vIOMMU
> device needs to be created before the rest of the devices.

Yes this is an expected limitation right now. I should have documented
it though. As you noticed, the pci_set_iommu() is called on virtio-iommu
realize and it relies on the fact the PCIe devices already are realized.

Maybe we could relax this constraint by calling the pci_set_iommu in a
machine init done notifier.

Thanks

Eric


> 
> Now for VT-d the ordering of devices should be assured by Libvirt:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1427005
> 
> For your reference only.  Thanks,
> 
