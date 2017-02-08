Received: by 10.25.77.65 with SMTP id a62csp2731449lfb;
        Wed, 8 Feb 2017 08:28:21 -0800 (PST)
X-Received: by 10.200.48.235 with SMTP id w40mr22526486qta.72.1486571301370;
        Wed, 08 Feb 2017 08:28:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si5957977qtf.18.2017.02.08.08.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Feb 2017 08:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbV6Q-0007c3-Mh
	for alex.bennee@linaro.org; Wed, 08 Feb 2017 11:28:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbV6K-0007bs-L5
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 11:28:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbV6G-00041W-Kp
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 11:28:12 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36023)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1cbV6G-00040r-Co
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 11:28:08 -0500
Received: by mail-wr0-x22d.google.com with SMTP id k90so63334593wrc.3
	for <qemu-arm@nongnu.org>; Wed, 08 Feb 2017 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=XBSRExGFNd5y5JtcKSn9VZTsDnsyNP3wz49i/fELnTQ=;
	b=c1OSacjx/HPH3ywpWBi2KiVXSxFqQekp6KkUK9YdxkrntSMkWf6ahh1Ly3PK3lIbjg
	h6Tg9pCzX1bHIYyinvs8AhXigYtIGCupAFPkH5Ql8Ra2J6ejNkZtrCKFjgSwF1VYoCig
	SaDrirnvtGjHn9NZWT8zMKp5/hGeSIkuv4C3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=XBSRExGFNd5y5JtcKSn9VZTsDnsyNP3wz49i/fELnTQ=;
	b=B8UFu4XgSN+4TMJUhIonFFWphc7WMtwwaHAnL7WVz9mB5CS7m0+/e6rqhKcpMNjjrN
	CoHBidv0pykNe7GRreJ2KeKE5dQzi6wCiJn4RPKOWw+VHjElLhEa3XPnUv0t4RtsUpXb
	SNDoeHtROn3vuWLRyRRy95lFCEha2J7hJoAezsC2qM/NS6hfO3f0KlbD+xJvSHafBvVT
	mYVJat6LOPZyHfImcXhl0i2CdEE41x25gm46VzQ/uEU4aNlDap9V6dpXTKA2ZVgocMVV
	VaDdaC3y2qZRhFFhJCs4OcjDdUjwbI9iMbMW0IZz7Pxtu8SyBRITZMA8rvMzJzMhpKpa
	uEow==
X-Gm-Message-State: AIkVDXLpbuISmnqgtALE5B+6neWr0YW9DUY1BnM6E4zzJwbxSYGSo0/m+i0YG2SlcH9KLdAB
X-Received: by 10.223.153.135 with SMTP id y7mr19821593wrb.55.1486571285574;
	Wed, 08 Feb 2017 08:28:05 -0800 (PST)
Received: from [105.130.36.101] ([105.130.36.101])
	by smtp.gmail.com with ESMTPSA id y65sm4159704wmb.5.2017.02.08.08.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 08:28:05 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
X-Mailer: iPhone Mail (14D27)
In-Reply-To: <c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
Date: Wed, 8 Feb 2017 16:27:54 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22d
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
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org, mst@redhat.com,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qqff080ghCwm


> On 8 Feb 2017, at 16:17, Laszlo Ersek <lersek@redhat.com> wrote:
>=20
>> On 02/08/17 17:12, Alexander Graf wrote:
>>> On 02/08/2017 04:29 PM, Laszlo Ersek wrote:
>>> CC'ing Ard and Shannon (I recall this property from earlier):
>>>=20
>>>> On 02/08/17 14:31, Alexander Graf wrote:
>>>> QEMU emulated hardware is always dma coherent with its guest. We do
>>>> annotate that correctly on the PCI host controller, but left out
>>>> virtio-mmio.
>>> I recommend to reference the following commit here:
>>>=20
>>> commit 5d636e21c44ecf982a22a7bc4ca89186079ac283
>>> Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> Date:   Mon Jul 4 13:06:36 2016 +0100
>>>=20
>>>     hw/arm/virt: mark the PCIe host controller as DMA coherent in the DT=

>>>          Since QEMU performs cacheable accesses to guest memory when
>>> doing DMA
>>>     as part of the implementation of emulated PCI devices, guest drivers=

>>>     should use cacheable accesses as well when running under KVM.
>>> Since this
>>>     essentially means that emulated PCI devices are DMA coherent, set
>>> the
>>>     'dma-coherent' DT property on the PCIe host controller DT node.
>>>          This brings the DT description into line with the ACPI
>>> description,
>>>     which already marks the PCI bridge as cache coherent (see commit
>>>     bc64b96c984abf).
>>>          Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>     Message-id:
>>> 1467134090-5099-1-git-send-email-ard.biesheuvel@linaro.org
>>>     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>=20
>>>> Recent kernels have started to interpret that flag rather than take
>>>> dma coherency as granted with virtio-mmio. While that is considered
>>>> a kernel bug, as it breaks previously working systems, it showed that
>>>> our dt description is incomplete.
>>>>=20
>>>> This patch adds the respective marker that allows guest OSs to evaluate=

>>>> that our virtio-mmio devices are indeed cache coherent.
>>> As noted above, commit bc64b96c984a ("hw/arm/virt-acpi-build: _CCA
>>> attribute is compulsory", 2015-11-03) had done the same in the ACPI
>>> description of the PCIe host controller.
>>>=20
>>> Thus, do we need _CCA in the ACPI description of the virtio-mmio
>>> transports, to parallel the DT change? See the LNRO0005 device in
>>> acpi_dsdt_add_virtio().
>>=20
>> Yes, we should also annotate it correctly in the DSDT. Today it's not a
>> deal breaker as Linux always assumes virtio-mmio to be dma coherent, but
>> it would make our platform description more accurate.
>>=20

The _CCA property is mandatory on arm64, and there is no default. So this is=
 a bug nonetheless, even if the de facto default matches the platform. So ye=
s, let's get this fixed please.


>>> If that's the case, then I propose that either the patch please fix
>>> both DT and ACPI, or that at least we file a bug "somewhere", for
>>> adding _CCA in acpi_dsdt_add_virtio().
>>=20
>> I agree that it should happen in the same patch (set). While I don't
>> care a lot about ACPI right now (since dt is preferred on upstream
>> kernels), I can take a look.
>=20
> Thank you!
> Laszlo
>=20
