Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp531946lfp;
        Wed, 29 Jan 2020 04:56:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSv1KobfJybaQ2Nlpk5nUg/g/vEQGwJTA9FKymmImQEUrpND0FVNkM/H2kJfStqwWy/cDG
X-Received: by 2002:aed:2a87:: with SMTP id t7mr26654854qtd.384.1580302593427;
        Wed, 29 Jan 2020 04:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580302593; cv=none;
        d=google.com; s=arc-20160816;
        b=enT068AfApn1kFSDPmkrux6qgyyr3Hb+dIY1EpnxC+uJ+dmaBrUKfRiuKW6AlMWBvB
         Mh4Ok9uCvY1GUrLMElTlIsz/B6/KVMrggUlEOArhbV1LUhE6jt8DkfzQwDthTUaSY1Bi
         n/kd8oxDpkhviLqw5mDYD/A7jIOuN8u/y8WvYFYIdkEAhZmUYvIb3xHL5cXS8wHhlHir
         0DOzzABOWF1iZir/sr+d0DyBiRlvqOpmkI/csxDphIvKS4lCsKrNXEQ0z1g5OM5N1dxj
         TJ4LpNtcH00aioLq289yCNA1Qj6aObgJRutsnpd1cEgEQ0ffAoWabq28tXD08rj2/+kO
         h4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=505e89Xe9veYwGr0Vs0Wdk32Nd+Nx0P4PmgWQuT7620=;
        b=JkJEYP8OM0LazzaibqQLaXeuzXJBarJXgL4iQvH1ayp7aTduAUdRw9b1Pv4XfnEmch
         jMLM4QErsfzGN5Fj/cAes87pQ5vLR9voYQC/ENkzRcfWPofBDkCa+IjWVaT8Satl2mrO
         SbfXgez10ONio7wyDRnnYVCw/ZFZvdX7B+TAp2drKkDiU4taBwCgMe0Ot1BaVL1x7Ill
         5Lf6mJVVcJTsJL++/WXkGQgFJhXHbVZq2eqBAmQUZ4Htf9CjncD/VhWbt3pOJDUs+Lnr
         f9QUHvjtMmOk+H61R/EZTo8mPw8Z6HCYKsA3l3D4JysLJN3gr7XAnwCHeCftTsIz+CfB
         3LVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cDRvKX18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u38si1083510qtb.395.2020.01.29.04.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 04:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cDRvKX18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwmtU-0004G6-Ry
	for alex.bennee@linaro.org; Wed, 29 Jan 2020 07:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwmtL-0004FY-5z
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 07:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwmtI-00026z-Pa
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 07:56:22 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58239
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwmtI-00023N-FH
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 07:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580302579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=505e89Xe9veYwGr0Vs0Wdk32Nd+Nx0P4PmgWQuT7620=;
 b=cDRvKX18FzQfZa2lzV8cSBZ1c0tEDyi1/xMFYfPSWQnGy0HdJZ6Bbdll8jUkKJPb5odrr1
 Ey4OgZ5rpptxrweNVNn0JFlDvZKI2STCIWeHtTRkRX9lwNFGfGUrbFM6c920EbHFJ3vQ/H
 gGn+SCSTaHecepbCutzmvyEPJNT/7o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-CprbglcmMkKZwZBFNyXgxA-1; Wed, 29 Jan 2020 07:56:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5520E107ACC5;
 Wed, 29 Jan 2020 12:56:10 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDAEB60BE0;
 Wed, 29 Jan 2020 12:56:02 +0000 (UTC)
Subject: Re: [PATCH v2 0/7] ARM virt: Add NVDIMM support
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <7b338b7c-fd47-930b-53d5-894711c69941@redhat.com>
 <c0528fddc5424471969a7d41e02cce2b@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1a4e3737-31cc-0d9f-8089-bb1048e736ec@redhat.com>
Date: Wed, 29 Jan 2020 13:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <c0528fddc5424471969a7d41e02cce2b@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CprbglcmMkKZwZBFNyXgxA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SYHFyU3nxwwi

Hi Shameer,

On 1/29/20 11:44 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 28 January 2020 15:29
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com
>> Cc: peter.maydell@linaro.org; shannon.zhaosl@gmail.com; mst@redhat.com;
>> xiaoguangrong.eric@gmail.com; xuwei (O) <xuwei5@huawei.com>;
>> lersek@redhat.com; Linuxarm <linuxarm@huawei.com>
>> Subject: Re: [PATCH v2 0/7] ARM virt: Add NVDIMM support
>>
>> Hi Shameer,
>>
>> On 1/17/20 6:45 PM, Shameer Kolothum wrote:
>>> This series adds NVDIMM support to arm/virt platform.
>>> The series reuses some of the patches posted by Eric
>>> in his earlier attempt here[1].
>>>
>>> Patch #1 is a fix to the Guest reboot issue on NVDIMM
>>> hot add case described here[2] and patch #2 is another
>>> fix to the nvdimm aml issue discussed here[3].
>>>
>>> I have done a basic sanity testing of NVDIMM deviecs
>>> with Guest booting with both ACPI and DT. Further testing
>>> is always welcome.
>>>
>>> Please let me know your feedback.
>>
>>
>> With this version, I do not get the former spurious warning reported on v1.
>>
>> I can see the nvdimm device topology using ndctl. So it looks fine to me.
> 
> Thanks for giving it a spin and confirming. 
> 
>> Unfortunately we cannot test with DAX as kernel dependencies are not yet
>> resolved yet but this is an independent problem.
> 
> True. I did previously test DAX with "arm64/mm: Enable memory hot remove"
> Patch series and that seems to work fine.

Yes you're correct. I tested with v12 which unfortunately missed the
next kernel merge window if I am not wrong
(https://lkml.org/lkml/2020/1/21/1217). With that series we can
effectovely test with DAX on guest.

ndctl create-namespace --force --mode=fsdax  --reconfig=namespace0.0
mkfs.xfs -f -m reflink=0 /dev/pmem0
sudo mount -o dax /dev/pmem0 /mnt/mem0
[  539.970608] XFS (pmem0): DAX enabled. Warning: EXPERIMENTAL, use at
your own risk
[  539.972947] XFS (pmem0): Mounting V5 Filesystem
[  539.977978] XFS (pmem0): Ending clean mount
[  539.979343] xfs filesystem being mounted at /mnt/mem0 supports
timestamps until 2038 (0x7fffffff)


It is useless for me to send my Tested-by at this point as you need to
remove the tiny conflict. However as soon as you respin I will be
pleased to send it.

As for the 2 first patches, I do not feel sufficiently comfortable on
that part to review them it in decent time and I cowardly leave it to
experts :-(

Thanks

Eric



> 
> Cheers,
> Shameer
> 
> 
>  
>> Thanks
>>
>> Eric
>>>
>>> Thanks,
>>> Shameer
>>>
>>> [1] https://patchwork.kernel.org/cover/10830777/
>>> [2] https://patchwork.kernel.org/patch/11154757/
>>> [3] https://patchwork.kernel.org/cover/11174959/
>>>
>>> v1 --> v2
>>>  -Reworked patch #1 and now fix is inside qemu_ram_resize().
>>>  -Added patch #2 to fix the nvdim aml issue.
>>>  -Dropped support to DT cold plug.
>>>  -Updated test_acpi_virt_tcg_memhp() with pc-dimm and nvdimms(patch
>> #7)
>>>
>>> Kwangwoo Lee (2):
>>>   nvdimm: Use configurable ACPI IO base and size
>>>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>>>
>>> Shameer Kolothum (5):
>>>   exec: Fix for qemu_ram_resize() callback
>>>   hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output  buffer  length
>>>   hw/arm/virt: Add nvdimm hotplug support
>>>   tests: Update ACPI tables list for upcoming arm/virt test changes
>>>   tests/bios-tables-test: Update arm/virt memhp test
>>>
>>>  docs/specs/acpi_hw_reduced_hotplug.rst      |  1 +
>>>  exec.c                                      | 36 +++++++----
>>>  hw/acpi/generic_event_device.c              | 13 ++++
>>>  hw/acpi/nvdimm.c                            | 68
>> +++++++++++++++++----
>>>  hw/arm/Kconfig                              |  1 +
>>>  hw/arm/virt-acpi-build.c                    |  6 ++
>>>  hw/arm/virt.c                               | 35 +++++++++--
>>>  hw/i386/acpi-build.c                        |  6 ++
>>>  hw/i386/acpi-build.h                        |  3 +
>>>  hw/i386/pc_piix.c                           |  2 +
>>>  hw/i386/pc_q35.c                            |  2 +
>>>  hw/mem/Kconfig                              |  2 +-
>>>  include/exec/ram_addr.h                     |  5 +-
>>>  include/hw/acpi/generic_event_device.h      |  1 +
>>>  include/hw/arm/virt.h                       |  1 +
>>>  include/hw/mem/nvdimm.h                     |  3 +
>>>  tests/data/acpi/virt/NFIT.memhp             |  0
>>>  tests/data/acpi/virt/SSDT.memhp             |  0
>>>  tests/qtest/bios-tables-test-allowed-diff.h |  5 ++
>>>  tests/qtest/bios-tables-test.c              |  9 ++-
>>>  20 files changed, 163 insertions(+), 36 deletions(-)
>>>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>>>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
>>>
> 
> 

