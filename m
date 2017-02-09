Received: by 10.25.77.65 with SMTP id a62csp295042lfb;
        Thu, 9 Feb 2017 04:32:38 -0800 (PST)
X-Received: by 10.200.55.37 with SMTP id o34mr2494717qtb.48.1486643557943;
        Thu, 09 Feb 2017 04:32:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33si7864857qtl.327.2017.02.09.04.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 04:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbntr-0000MV-6R
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 07:32:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbnsv-0000KK-Dp
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 07:31:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbnsu-0000Wf-Az
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 07:31:37 -0500
Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230]:34699)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1cbnsu-0000W8-6t
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 07:31:36 -0500
Received: by mail-it0-x230.google.com with SMTP id k200so39893270itb.1
	for <qemu-devel@nongnu.org>; Thu, 09 Feb 2017 04:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f9dx+bPpQcQA0E3dwWXh+fwpeyTSRPqrT54P9hKEy3E=;
	b=dksjcthEQoV9vFwdWHpARDzf7JX98meXUAeo3vBeeTdvRwZE/oRfeyIxZVPDLXBaFT
	DPwNfTHhEKx8t0G/0ugjzWhV+lLbWTmwndrNiCeIpfcmMycRMtzhw8Hb7JMpPDqjXHYX
	UQjIIrE4uzHbslFU9wNHG5QZD296wm00xqHz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f9dx+bPpQcQA0E3dwWXh+fwpeyTSRPqrT54P9hKEy3E=;
	b=MOprawPQaCJAhekF5Pq1q9mbV6eWz0v5WLEvfvmWcyGJDvPz3358ilUXikWdO0SXMn
	WizcnVOxa2TaQxTOPt9AOMX2/orgGRJgHfyhEtl3CWB+jAvG0ro8cbISQ6uk2plSPixG
	BBmE6JD4JVeroL5y3/lOR+v+4ww7X3dbAVYc5j9FNVUw1hTWFfXWzvl9u8YAbXYWeEdB
	h+J19NNXZPX2VjA+ZrBSnwnCzztuOLPq9UnNttwRzCL97rqp7o+HDxb8M6pf5xDThJTg
	1osDm4qd2ra3LMtNDafHET3qOkMj2NNL44FmEkJLti1H5KjMOb8ydHsL/MUoKbjKZXx2
	MyoA==
X-Gm-Message-State: AMke39n5ZaI4FP6n0ePlMDOsuCvsPq6ZBg3RUq7qvwPx4pSXYfJ8m6sYg4rIgXXNKKMWxtkF5tAERw8ZhjwAHGlF
X-Received: by 10.36.77.10 with SMTP id l10mr2824082itb.59.1486643495475; Thu,
	09 Feb 2017 04:31:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.144.139 with HTTP; Thu, 9 Feb 2017 04:31:34 -0800 (PST)
In-Reply-To: <52f06298-6ddb-2ff7-a213-d5738bdcfbc5@suse.de>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<52f06298-6ddb-2ff7-a213-d5738bdcfbc5@suse.de>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 9 Feb 2017 12:31:34 +0000
Message-ID: <CAKv+Gu-ZZQDMG7CEcYs4ep6jXMBrgDDOJx8vQ--7f16voUHxsw@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::230
Subject: Re: [Qemu-devel] [PATCH] target-arm: Declare virtio-mmio as
 dma-coherent in dt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSY9yMsmJuIq

On 9 February 2017 at 12:29, Alexander Graf <agraf@suse.de> wrote:
>
>
> On 08/02/2017 17:17, Laszlo Ersek wrote:
>>
>> On 02/08/17 17:12, Alexander Graf wrote:
>>>
>>> On 02/08/2017 04:29 PM, Laszlo Ersek wrote:
>>>>
>>>> CC'ing Ard and Shannon (I recall this property from earlier):
>>>>
>>>> On 02/08/17 14:31, Alexander Graf wrote:
>>>>>
>>>>> QEMU emulated hardware is always dma coherent with its guest. We do
>>>>> annotate that correctly on the PCI host controller, but left out
>>>>> virtio-mmio.
>>>>
>>>> I recommend to reference the following commit here:
>>>>
>>>> commit 5d636e21c44ecf982a22a7bc4ca89186079ac283
>>>> Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>> Date:   Mon Jul 4 13:06:36 2016 +0100
>>>>
>>>>      hw/arm/virt: mark the PCIe host controller as DMA coherent in the
>>>> DT
>>>>           Since QEMU performs cacheable accesses to guest memory when
>>>> doing DMA
>>>>      as part of the implementation of emulated PCI devices, guest
>>>> drivers
>>>>      should use cacheable accesses as well when running under KVM.
>>>> Since this
>>>>      essentially means that emulated PCI devices are DMA coherent, set
>>>> the
>>>>      'dma-coherent' DT property on the PCIe host controller DT node.
>>>>           This brings the DT description into line with the ACPI
>>>> description,
>>>>      which already marks the PCI bridge as cache coherent (see commit
>>>>      bc64b96c984abf).
>>>>           Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>>      Message-id:
>>>> 1467134090-5099-1-git-send-email-ard.biesheuvel@linaro.org
>>>>      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>>
>>>>> Recent kernels have started to interpret that flag rather than take
>>>>> dma coherency as granted with virtio-mmio. While that is considered
>>>>> a kernel bug, as it breaks previously working systems, it showed that
>>>>> our dt description is incomplete.
>>>>>
>>>>> This patch adds the respective marker that allows guest OSs to evaluate
>>>>> that our virtio-mmio devices are indeed cache coherent.
>>>>
>>>> As noted above, commit bc64b96c984a ("hw/arm/virt-acpi-build: _CCA
>>>> attribute is compulsory", 2015-11-03) had done the same in the ACPI
>>>> description of the PCIe host controller.
>>>>
>>>> Thus, do we need _CCA in the ACPI description of the virtio-mmio
>>>> transports, to parallel the DT change? See the LNRO0005 device in
>>>> acpi_dsdt_add_virtio().
>>>
>>>
>>> Yes, we should also annotate it correctly in the DSDT. Today it's not a
>>> deal breaker as Linux always assumes virtio-mmio to be dma coherent, but
>>> it would make our platform description more accurate.
>>>
>>>> If that's the case, then I propose that either the patch please fix
>>>> both DT and ACPI, or that at least we file a bug "somewhere", for
>>>> adding _CCA in acpi_dsdt_add_virtio().
>>>
>>>
>>> I agree that it should happen in the same patch (set). While I don't
>>> care a lot about ACPI right now (since dt is preferred on upstream
>>> kernels), I can take a look.
>>
>>
>> Thank you!
>
>
> In fact, don't some other devices also suffer from this? Fw-cfg is now DMA
> capable IIUC, so that should also get a _CCA attribute for example.
>

Correct. Any described DMA capable device should have a _CCA attribute
