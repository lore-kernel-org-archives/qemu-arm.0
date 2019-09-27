Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3953207wrp;
        Fri, 27 Sep 2019 13:18:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3be1taoYb2Yoq57LzB2FdV7c+bt/N21njNzlUD3kvF8AcPhq9ejZ7FmxCZyme8nouNyN0
X-Received: by 2002:a37:c441:: with SMTP id h1mr6480905qkm.16.1569615536086;
        Fri, 27 Sep 2019 13:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569615536; cv=none;
        d=google.com; s=arc-20160816;
        b=IrlsT0rEktjevIxmzf5iYX4e6D/73z0Rv2e8AIFFYToHdL7Q40o/vhxcdPyuxZfK7Z
         jBWEumB8vJjiT8V6Klq1f7Zs2yT+pVTRfqFTueRvyP5FnltfPY0iw/atqOKUWe6cVOSv
         6HIsoYTbZf0cGsV627BOOIeZJ73jiC616Q/I+J1JrJVyrr1iRputZROPTNG7D7+FEAYG
         /CWKFUCWLw8+EVS7+ubhkIX5AGmm7wnER/0j021C4dRc9jvVlNQtiHDp0+PTjRdYPPGd
         FiBxh9hWew1eyYQ3oD9TwOFkG5EjC2N1cdJ46LldTfQl0MM/Bm48NzaDAt2uUpGrYszY
         8YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=VYIARQZeSo4eqIGZ7/+Ci3Bhjf7+cEZeiTX0M8qC638=;
        b=oaOIIEEq/kcbeLmYxIGbSebwSO/dwgZWkJAUjRh5tR6OQr8kcAIVdcEUs9g886EdLx
         egjXeNxwBakDSrll5FBkWzSFA3GagVJaVVGbDCN3/MZBiy2/1pY7EbWypVjwN0ZWfrtP
         QhoecvYjbnndPv6y5qOxJgoBGZSkOpigAzTarch18wRe+iQEDgM2NElAE9/M8J56KVww
         WL0nREYKmeES2uRfqV7TlIHEcBiIBsDQ42qDL1vjqSU1Dkbp91L64yNQstnduUCzJCDa
         tWz9s7FO/hHr8XYWlx0iNjO6LSC6HBXfEejafbgdsG5CKomBYiEsINVw1C1/7npLoZkr
         IvYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si3344385qkb.277.2019.09.27.13.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 13:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDwhb-0008NJ-GU
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 16:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iDwhL-0008K7-2H
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 16:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iDwhI-0007yT-Bb
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 16:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iDwhI-0007y3-2I
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 16:18:36 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C07E550F4D
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 20:18:34 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id l6so1599196wrn.2
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 13:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYIARQZeSo4eqIGZ7/+Ci3Bhjf7+cEZeiTX0M8qC638=;
 b=HII18IDy1grciG3HC0dyrD550dd3ar8qrOLWFbq/er7AyIudTWipWfuNmGQWJKuXNC
 bIfntxUxIb/yiDeXvR9yPHv4lQDLbmy9jaLHqGXE7CNpyfQBuAARDlCKLlz93TJ2sgCe
 20UciUQ0xk2pxXCBXj4WwjO6ZbGnWBNfr2FEU0A4F6mNvpbcsPnmbA3wHbw3mudraFIi
 q0T45t4UtWz9XvorGxFUfVxCpCOz0u2CI+WeMWpFUA3CAnrjQnhL99ghxsOQJ7oOXHit
 3Xb7aYNJ5oKKf6xl56sJ4N10DzEvj0GVT5p8wZB2eY5I1VwX0LcLli4eGovvq8t7MK4Y
 nZmQ==
X-Gm-Message-State: APjAAAWRBs+n3VRCcHF28WU++52QRZxB+eKnw1qrOsLoWLVvYUdXnrOX
 UwyyLXCVXUOf4A9pITto1KPYx5kLBytpxe7+LlgfEm1WDVyB9ayks47SADV0sGIFUgpa8b54J2l
 IS31oCQ/8IMxv
X-Received: by 2002:a5d:6647:: with SMTP id f7mr4458077wrw.170.1569615513355; 
 Fri, 27 Sep 2019 13:18:33 -0700 (PDT)
X-Received: by 2002:a5d:6647:: with SMTP id f7mr4458051wrw.170.1569615513010; 
 Fri, 27 Sep 2019 13:18:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36?
 ([2001:b07:6468:f312:9520:22e6:6416:5c36])
 by smtp.gmail.com with ESMTPSA id b16sm6044423wrh.5.2019.09.27.13.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2019 13:18:32 -0700 (PDT)
Subject: Re: [PATCH v4 0/2] Allow memory_region_register_iommu_notifier() to
 fail
To: Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20190924082517.13724-1-eric.auger@redhat.com>
 <20190924153144.0a656a41@x1.home>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e91b5121-44f9-6afb-cf0a-3016cbc7913d@redhat.com>
Date: Fri, 27 Sep 2019 22:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924153144.0a656a41@x1.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, aik@ozlabs.ru, qemu-devel@nongnu.org,
 peterx@redhat.com, qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJ/YFUQJcAdm

On 24/09/19 23:31, Alex Williamson wrote:
> On Tue, 24 Sep 2019 10:25:15 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> This series allows the memory_region_register_iommu_notifier()
>> to fail. As of now, when a MAP notifier is attempted to be
>> registered along with SMMUv3 or AMD IOMMU, we exit in the IOMMU
>> MR notify_flag_changed() callback.
>>
>> In case of VFIO assigned device hotplug, this could be handled
>> more nicely directly within the VFIO code, simply rejecting
>> the hotplug without exiting. This is what the series achieves
>> by handling the memory_region_register_iommu_notifier() returned
>> value and Error object.
>>
>> To propagate errors collected during vfio_listener_region_add()
>> we now store the error handle inside the VFIO container instead
>> of a returned value.
>>
>> The message now is:
>> (QEMU) device_add id=hot0 driver=vfio-pci host=0000:89:00.0 bus=pcie.1
>> {"error": {"class": "GenericError", "desc": "vfio 0000:89:00.0: failed
>> to setup container for group 2: memory listener initialization failed:
>> Region smmuv3-iommu-memory-region-0-6: device 01.00.0 requires iommu MAP
>> notifier which is not currently supported"}}
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v4.1.0_register_iommu_notifier_fail_v4
>>
>> History:
>>
>> v3 -> v4:
>> - added Peter's R-b on 2d patch
>> - 1st patch: restore hw_error, remove useless ret assignment, improve
>>   DMA host window error message, remove local mr variable
>>
>> v2 -> v3:
>> - also pass an Error handle (suggested by Peter)
>>
>> v1 -> v2:
>> - Intel IOMMU now handles the problem differently with machine init done
>>   notifier and machine hotplug allowed hook.
>> - use assert(!ret)
>> - message rewording in SMMUv3
>>
>> Follow-up of "VFIO/SMMUv3: Fail on VFIO/HW nested paging detection"
>> https://patchew.org/QEMU/20190829090141.21821-1-eric.auger@redhat.com/
>>
>>
>> Eric Auger (2):
>>   vfio: Turn the container error into an Error handle
>>   memory: allow memory_region_register_iommu_notifier() to fail
>>
>>  exec.c                        | 10 +++++--
>>  hw/arm/smmuv3.c               | 18 ++++++------
>>  hw/i386/amd_iommu.c           | 17 +++++++-----
>>  hw/i386/intel_iommu.c         |  8 ++++--
>>  hw/ppc/spapr_iommu.c          |  8 ++++--
>>  hw/vfio/common.c              | 52 +++++++++++++++++++++++------------
>>  hw/vfio/spapr.c               |  4 ++-
>>  hw/virtio/vhost.c             |  9 ++++--
>>  include/exec/memory.h         | 21 ++++++++++----
>>  include/hw/vfio/vfio-common.h |  2 +-
>>  memory.c                      | 31 +++++++++++++--------
>>  11 files changed, 120 insertions(+), 60 deletions(-)
> 
> For series,
> 
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
> 
> Paolo, would this go in through you given the memory API changes and
> greater girth in patch 2/2?  Thanks,

Fine, queued.

Paolo


