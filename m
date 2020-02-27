Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4472980lfg;
        Thu, 27 Feb 2020 05:49:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZgJrTGIzfJGzvYvE1yHzKVx1bJqb1OrRctiQlX9YUFmlE/LdduyAK/ubGFglzjQ34aXrw
X-Received: by 2002:a0c:e014:: with SMTP id j20mr5480208qvk.165.1582811380266;
        Thu, 27 Feb 2020 05:49:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582811380; cv=none;
        d=google.com; s=arc-20160816;
        b=tpeZ7L+5WCKKBhS49Tnchio097EfXd5Spwc72+Q91/y5bJm8AE2WV3ro+UoKg9kUXa
         Pb/JGFyljUZJBBPO6wdUSZtNPO6E6T/Rge9uAS6i4PbUBKzuHEXy8WTKm0TPh0AWnxGm
         w6YEEmmG/J5Ev7N0vRFsCjX4wQtIRCDtTkCtnvW6YTDQjBKQJj7BexA+UNPpPxy0QatF
         FTBclqnLm9dHDzbzZtVE6d4SaXP3GQqyvmtvV9LYxGRGAbqMwV+zpvC7xa9FHrnnMzxo
         bPUliNElJ9ahGd9jkyjlEL7vxa1wYNgTs6UtBCGdLKF4nm6Sre/0ggwiujQN64fJBiEO
         vFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1hYv2W5oVXano1ZG8azGgIHJRbr+8/TKjUIu0Hge0mU=;
        b=jtWMoobCrBJVUnNbyPgunCpHVTiGE900TTof4fuJoiDKYdGqvUq9/TeR03f6awWcrv
         d8WTPOMxT2edEvtvx0c4VOlq98wwVoqcm1DTmXekfCFEEZKRQ8am3Gz8widIur3mP3Uw
         T94yP2I8l8g31ACtIo6gx0GNkxmRRxOYRNqvzvgL5P68oWPmrjI/HDJb+IUuQnJCjf3i
         UmMqhBrBJB2s4A3gT7hzzCZJ9RNX9VeFhVuyMSs4Ze9bPX0TFq2RAjGcFi/16huwSOq9
         gC1aJBqsNYx7th1mKWUuFhrl3CQaIjyg7Zb4+tI06O18uOmPV5Q8ZurY03JNfcdE8C2v
         p1kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M27hpjZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si1447570qtk.149.2020.02.27.05.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 05:49:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M27hpjZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7JXn-0001ET-Lf
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 08:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7JXf-0001Bq-4H
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:49:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7JXd-0008Vs-Or
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:49:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38298
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7JXd-0008VM-Kl
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582811368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hYv2W5oVXano1ZG8azGgIHJRbr+8/TKjUIu0Hge0mU=;
 b=M27hpjZ4LpAvnbXB2KI2fIcnM30gWi/Gj7xO/HurxsJA7t9pBuUrBARrWvSHnDE1ta4mcG
 pyzqaDVDbIJeI29KO430wkbXb0g5b9G6C+iLh2wdGumpry3e7/jalgHnCsaSkII95C1te6
 5iv2p+L5NIbJ96cCYXdEPS9jyxu59Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-H0W1fCkDNlKPnyEZqHdjOw-1; Thu, 27 Feb 2020 08:49:22 -0500
X-MC-Unique: H0W1fCkDNlKPnyEZqHdjOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C2AB8010C7;
 Thu, 27 Feb 2020 13:49:20 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5356C92981;
 Thu, 27 Feb 2020 13:49:12 +0000 (UTC)
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200227111717.GG1645630@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <431cb39d-833c-6d02-d7b3-02b3e90446e2@redhat.com>
Date: Thu, 27 Feb 2020 14:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200227111717.GG1645630@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1cdarFPA7jQ2

Hi Daniel,

On 2/27/20 12:17 PM, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Feb 14, 2020 at 02:27:35PM +0100, Eric Auger wrote:
>> This series implements the QEMU virtio-iommu device.
>>
>> This matches the v0.12 spec (voted) and the corresponding
>> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
>> are resolved for DT integration. The virtio-iommu can be
>> instantiated in ARM virt using:
>>
>> "-device virtio-iommu-pci".
>=20
> Is there any more documentation besides this ?

not yet in qemu.
>=20
> I'm wondering on the intended usage of this, and its relation
> or pros/cons vs other iommu devices

Maybe if you want to catch up on the topic, looking at the very first
kernel RFC may be a good starting point. Motivation, pros & cons were
discussed in that thread (hey, April 2017!)
https://lists.linuxfoundation.org/pipermail/iommu/2017-April/021217.html

on ARM we have SMMUv3 emulation. But the VFIO integration is not
possible because SMMU does not have any "caching mode" and my nested
paging kernel series is blocked. So the only solution to integrate with
VFIO is looming virtio-iommu.

In general the pros that were put forward are: virtio-iommu is
architecture agnostic, removes the burden to accurately model complex
device states, driver can support virtualization specific optimizations
without being constrained by production driver maintenance. Cons is perf
and mem footprint if we do not consider any optimization.

You can have a look at

http://events17.linuxfoundation.org/sites/events/files/slides/viommu_arm.pd=
f

>=20
> You mention Arm here, but can this virtio-iommu-pci be used on
> ppc64, s390x, x86_64 too ?=20

Not Yet. At the moment we are stuck with the non DT integration at
kernel level. We can instantiate the device in machvirt with DT boot only.

Work is ongoing on kernel, by Jean-Philippe to support non DT integration:

[1] [PATCH 0/3] virtio-iommu on non-devicetree platforms
(https://www.spinics.net/lists/linux-virtualization/msg41391.html)

This does nor rely on ACPI anymore.

Originally the plan was to integrate with ACPI (IORT) but Michael pushed
to pass the binding info between the protected devices and the IOMMU
through the PCI cfg space. Also this could serve environments where we
do not have ACPI. I think some people are reluctant to expose the
virtio-iommu in the [IORT] ACPI table.

But definitively the end goal is to support the virtio-iommu for other
archs. Integration with x86 is already working based on IORT or [1].


 If so, is it a better choice than
> using intel-iommu on x86_64?
Anything else that is relevant
> for management applications to know about when using this ?

I think We are still at the early stage and this would be premature even
if feasible.

Hope it helps

Thanks

Eric
>=20
>=20
> Regards,
> Daniel
>=20

