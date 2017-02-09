Received: by 10.25.77.65 with SMTP id a62csp293665lfb;
        Thu, 9 Feb 2017 04:29:52 -0800 (PST)
X-Received: by 10.55.87.194 with SMTP id l185mr2372648qkb.209.1486643392470;
        Thu, 09 Feb 2017 04:29:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j34si7871268qte.61.2017.02.09.04.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 04:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbnrB-0007Tx-3n
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 07:29:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cbnr3-0007Sk-Tf
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:29:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cbnr0-0008Mu-Rm
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:29:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:53271)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1cbnr0-0008Mk-IF; Thu, 09 Feb 2017 07:29:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6E672AD09;
	Thu,  9 Feb 2017 12:29:37 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
From: Alexander Graf <agraf@suse.de>
Message-ID: <52f06298-6ddb-2ff7-a213-d5738bdcfbc5@suse.de>
Date: Thu, 9 Feb 2017 13:29:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Declare virtio-mmio
 as dma-coherent in dt
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: COcOSSx3m1LT



On 08/02/2017 17:17, Laszlo Ersek wrote:
> On 02/08/17 17:12, Alexander Graf wrote:
>> On 02/08/2017 04:29 PM, Laszlo Ersek wrote:
>>> CC'ing Ard and Shannon (I recall this property from earlier):
>>>
>>> On 02/08/17 14:31, Alexander Graf wrote:
>>>> QEMU emulated hardware is always dma coherent with its guest. We do
>>>> annotate that correctly on the PCI host controller, but left out
>>>> virtio-mmio.
>>> I recommend to reference the following commit here:
>>>
>>> commit 5d636e21c44ecf982a22a7bc4ca89186079ac283
>>> Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> Date:   Mon Jul 4 13:06:36 2016 +0100
>>>
>>>      hw/arm/virt: mark the PCIe host controller as DMA coherent in the DT
>>>           Since QEMU performs cacheable accesses to guest memory when
>>> doing DMA
>>>      as part of the implementation of emulated PCI devices, guest drivers
>>>      should use cacheable accesses as well when running under KVM.
>>> Since this
>>>      essentially means that emulated PCI devices are DMA coherent, set
>>> the
>>>      'dma-coherent' DT property on the PCIe host controller DT node.
>>>           This brings the DT description into line with the ACPI
>>> description,
>>>      which already marks the PCI bridge as cache coherent (see commit
>>>      bc64b96c984abf).
>>>           Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>      Message-id:
>>> 1467134090-5099-1-git-send-email-ard.biesheuvel@linaro.org
>>>      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>
>>>> Recent kernels have started to interpret that flag rather than take
>>>> dma coherency as granted with virtio-mmio. While that is considered
>>>> a kernel bug, as it breaks previously working systems, it showed that
>>>> our dt description is incomplete.
>>>>
>>>> This patch adds the respective marker that allows guest OSs to evaluate
>>>> that our virtio-mmio devices are indeed cache coherent.
>>> As noted above, commit bc64b96c984a ("hw/arm/virt-acpi-build: _CCA
>>> attribute is compulsory", 2015-11-03) had done the same in the ACPI
>>> description of the PCIe host controller.
>>>
>>> Thus, do we need _CCA in the ACPI description of the virtio-mmio
>>> transports, to parallel the DT change? See the LNRO0005 device in
>>> acpi_dsdt_add_virtio().
>>
>> Yes, we should also annotate it correctly in the DSDT. Today it's not a
>> deal breaker as Linux always assumes virtio-mmio to be dma coherent, but
>> it would make our platform description more accurate.
>>
>>> If that's the case, then I propose that either the patch please fix
>>> both DT and ACPI, or that at least we file a bug "somewhere", for
>>> adding _CCA in acpi_dsdt_add_virtio().
>>
>> I agree that it should happen in the same patch (set). While I don't
>> care a lot about ACPI right now (since dt is preferred on upstream
>> kernels), I can take a look.
>
> Thank you!

In fact, don't some other devices also suffer from this? Fw-cfg is now 
DMA capable IIUC, so that should also get a _CCA attribute for example.


Alex
