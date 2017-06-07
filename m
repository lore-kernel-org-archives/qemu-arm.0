Received: by 10.25.0.23 with SMTP id 23csp2009627lfa;
        Wed, 7 Jun 2017 03:17:12 -0700 (PDT)
X-Received: by 10.237.35.34 with SMTP id h31mr35557566qtc.148.1496830632412;
        Wed, 07 Jun 2017 03:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496830632; cv=none;
        d=google.com; s=arc-20160816;
        b=Xg7CJBpk5DspB2W7hAvv1o8g1v0ckvEezI/iA9DEK9TTmld5M5yTz5KLp8Bj/vRs9c
         9iHhMGSJwDD8MHDT+a4R8LwPV2yBATqMEBoekux2EuMctdwPfr99z5XQ/C+It0XUI8lN
         OiJRZB44pJQYEr8VwsIyqJr5ViWHM9MvHr/Uq9CGqClZ7opoxQHw7xMn3g1tVj33ZJ3p
         p8CVuBcqHL1oG/bDLYAAbhXJv6xbFBVJoQKVT8TmWb57q29nWiNAbULpmMQFusoEwQ4M
         KJraCYR1C3oeOB+LwoFZJ1bcNbidBn5Ht0WUExv/o6N2GPw8Edbj+mSLjNI2m+4Nf7vL
         EnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=hcWcRBig62CriIA4CkjYO0d/VZWtNZnwMQbqB6TRUI0=;
        b=lfyCsE0BUXCMSbyYjYaZqPzobCmu0PE6GvdBjcswxzKCq3O2Egu2Pup9NyxgPx254S
         mxgCfiVUa6dbdcGbHLUxP1fTz0OQuoQXTODFk6Qs4P8e+jfjMkxlPyjhE/j4X9zrWSQ4
         JbFmqlpAbUkafpMgwpd/nhxAL14ChC/g8o6YVkeQ0GSQrz6zNgaI0C1xm7316kfvSZ0y
         HAw498fbwFEhLDWyS2K4VVTkze1mKzBiAHOuXlqZYiRWSBbofWiAgz47BvzkeyXq7lEd
         wadcuwkapp7Ij4s7yZWktwzUZ6nxKI98SUixTiW0oeXQvDYfqkSr/aMUVgWfFH8zSGxL
         rLzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si1461578qte.111.2017.06.07.03.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 03:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIY1V-0000m3-N3
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 06:17:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dIY07-0008Nk-I7
	for qemu-devel@nongnu.org; Wed, 07 Jun 2017 06:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dIY06-0002oC-EE
	for qemu-devel@nongnu.org; Wed, 07 Jun 2017 06:15:43 -0400
Received: from foss.arm.com ([217.140.101.70]:38046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dIXzz-0002lh-S9; Wed, 07 Jun 2017 06:15:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D25980D;
	Wed,  7 Jun 2017 03:15:33 -0700 (PDT)
Received: from [10.1.210.58] (e106794-lin.cambridge.arm.com [10.1.210.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EB4E3F587;
	Wed,  7 Jun 2017 03:15:30 -0700 (PDT)
To: Jason Wang <jasowang@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	eric.auger.pro@gmail.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
	<03f4d3b6-a678-56b8-4320-ac002dfeeb8d@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <8bd10202-75a2-2dee-1d75-9070217f65e0@arm.com>
Date: Wed, 7 Jun 2017 11:19:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <03f4d3b6-a678-56b8-4320-ac002dfeeb8d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [RFC 0/8] VIRTIO-IOMMU device
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, robin.murphy@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AP2sZH0K5Gpb

Hi Jason,

On 07/06/17 10:17, Jason Wang wrote:
> On 2017=E5=B9=B406=E6=9C=8807=E6=97=A5 16:35, Eric Auger wrote:
>> This series implements the virtio-iommu device. This is a proof
>> of concept based on the virtio-iommu specification written by
>> Jean-Philippe Brucker [1]. This was tested with a guest using
>> the virtio-iommu driver [2] and exposed with a virtio-net-pci
>> using dma ops.
>>
>> The device gets instantiated using the "-device virtio-iommu-device"
>> option. It currently works with ARM virt machine only as the machine
>> must handle the dt binding between the virtio-mmio "iommu" node and
>> the PCI host bridge node. ACPI booting is not yet supported.
>>
>> This should allow to start some benchmarking activities against
>> pure emulated IOMMU (especially ARM SMMU).
>=20
> Yes, it would be also interesting to compare it with intel IOMMU. Actua=
lly
> the core function is similar to the subset of intel one with CM enabled=
.
> Since each map and unmap requires a command, it would be very slow for
> dynamic mappings. I wonder whether or not we can do any optimization on=
 this.

In general we will have to send the same number of map/unmap requests tha=
n
the number of invalidations needed for an emulated IOMMU such as the Inte=
l
one (if I understand correctly with CM there are invalidations both on ma=
p
and unmap, to avoid trapping the page tables). Using virtio allows to
reduce the number of round-trips to the host, by batching map/unmap
requests where possible. Adding vhost-iommu in the host could further
reduce the latency of map/unmap requests.

To actually reduce the number of requests, I see two possible
optimizations (loosely described in [1]), both requiring invasive changes=
.

* Relaxed (insecure) mode, where the guest batches unmap request or
doesn't send them at all. Map will override existing mappings if
necessary. You end up sending far less unmap requests, but there is a
vulnerability window where devices can access stale mappings, so you have
to trust your peripherals. I believe the x86 IOMMU drivers in Linux
already allow this.

* Page table handover, which is a new mode orthogonal to map/unmap. This
uses nested translation - the guest has one set of page tables for
gva->gpa and the host has one set for gpa->hpa. After setup, the guest
populates the page tables and only sends invalidation requests, no map. I
think that with the Intel IOMMU this would only be possible with PASID
traffic. But nested translation will inherently be slower than "classic"
mode, so it might end up being overall slower than map/unmap, if there is
a lot of TLB invalidation and trashing. This mode is mostly useful for SV=
M
virtualization.

Thanks,
Jean

