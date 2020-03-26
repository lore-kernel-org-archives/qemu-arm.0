Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2176976lfi;
        Thu, 26 Mar 2020 10:36:37 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvsbJPtO17ctO5wvXKMabQZiQx5HPWUzq5tmB6ahfUkKv0woqW9OBTdAyjFEP5ItkzUmhPb
X-Received: by 2002:ac8:777b:: with SMTP id h27mr9606153qtu.16.1585244197096;
        Thu, 26 Mar 2020 10:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585244197; cv=none;
        d=google.com; s=arc-20160816;
        b=QRbmvmQgzZej3oEz4x/1ur73p1AVYWkb6Uf859VcvYne3EYSu1uLVPIel/VD1hMNds
         ha4RWaCnpDxnKXRCwjzyeQoPQQRh3X2bK7oZzb8Ps9u260spAKMcTo1f4sbCyTwqv4UQ
         x9jUOxgNTkDm0wgoUkP3SCpwukvTnVh6EtT8bO7urW0HgbB8dWX8FrSOm4Cm3Uhz/qEB
         k+97iQqMdYngaMjKK0WeRIC3KRQ3GBMLBZByqJBO7+L9GeAzmjdf4QEbcEFoKTu+wrm7
         27ZUQkauE/sLjj/xnGX7rQVTLIqYo1/SopC+X4psdz7XdSreFCounN4CFe55jSQyueMk
         cOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tSXRKJ3jjJIKb5g83cbWtnsMmNgKqEK0FvYZddqErZM=;
        b=lLfw3DAUAcPIvw/YyjJjwHXJ/LG+7QM7TkHsoL/qkNXHOkQqGhfmJkPsN1maDg8amo
         /q2fSgdvLyqDi2dn0AsbxOoJOtLoU701D47ugz6Tf/sbJ7hesQZRwpnFWSCaEoZxhVEy
         xPfVj5X3P+NYLWJurU5ixLIcUy0++OjXBhDHVrMbwR25EPAKP/L6BpwntAkYuDz/mnGS
         68eb3K0B41stxQ61ehpYMb+rXHPIrJuUJVEcg/YKFVjt8Ay08nmzcqaZ40B/0RqkLe9m
         sB6RaQWKPzajDlr29F6FR4embuP9fwH4/XYThXEsQVPzdyfXC0Q5/fmnCpjl4JpfXiPJ
         ch9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3kQHm1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n207si1716515qkn.281.2020.03.26.10.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 10:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3kQHm1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHWQm-0000Nk-IV
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 13:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHWQS-0008Up-6U
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHWQQ-0007Wi-KZ
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:36:15 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:40100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHWQQ-0007VV-8f
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 13:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585244173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSXRKJ3jjJIKb5g83cbWtnsMmNgKqEK0FvYZddqErZM=;
 b=D3kQHm1YZj7EN2vx3caNGBICe4rRY1EbBxSm4BJCtf/JduZn+GtI1ITrqN0JNm74wj8sqt
 WKnsWUN/aNZge/PaapD4O06b7pd3CT+KYneHee66PIqJtf4eDyaCzUiv7JjNQ9aPz7hTNu
 m0omUT4swi73F1hYkgaXAXBbcKsishI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-cJRT_C-yOpqInvlBp49sKA-1; Thu, 26 Mar 2020 13:36:10 -0400
X-MC-Unique: cJRT_C-yOpqInvlBp49sKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88285190B2A0;
 Thu, 26 Mar 2020 17:36:07 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA0D5C1BA;
 Thu, 26 Mar 2020 17:35:50 +0000 (UTC)
Subject: Re: [PATCH v9 1/9] hw/vfio/common: Remove error print on mmio region
 translation by viommu
To: Alex Williamson <alex.williamson@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-2-bbhushan2@marvell.com>
 <20200323170835.5021f845@w520.home>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8ec6af3c-6bd7-a3dc-c531-16db6b2089c5@redhat.com>
Date: Thu, 26 Mar 2020 18:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200323170835.5021f845@w520.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, drjones@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, linuc.decode@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ak5A6XX6oq+i

Hi Alex,

On 3/24/20 12:08 AM, Alex Williamson wrote:
> [Cc +dwg who originated this warning]
> 
> On Mon, 23 Mar 2020 14:16:09 +0530
> Bharat Bhushan <bbhushan2@marvell.com> wrote:
> 
>> On ARM, the MSI doorbell is translated by the virtual IOMMU.
>> As such address_space_translate() returns the MSI controller
>> MMIO region and we get an "iommu map to non memory area"
>> message. Let's remove this latter.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
>> ---
>>  hw/vfio/common.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 5ca11488d6..c586edf47a 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
>>                                   &xlat, &len, writable,
>>                                   MEMTXATTRS_UNSPECIFIED);
>>      if (!memory_region_is_ram(mr)) {
>> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
>> -                     xlat);
>>          return false;
>>      }
>>  
> 
> I'm a bit confused here, I think we need more justification beyond "we
> hit this warning and we don't want to because it's ok in this one
> special case, therefore remove it".  I assume the special case is that
> the device MSI address is managed via the SET_IRQS ioctl and therefore
> we won't actually get DMAs to this range.
Yes exactly. The guest creates a mapping between one giova and this gpa
(corresponding to the MSI controller doorbell) because MSIs are mapped
on ARM. But practically the physical device is programmed with an host
chosen iova that maps onto the physical MSI controller's doorbell. so
the device never performs DMA accesses to this range.

  But I imagine the case that
> was in mind when adding this warning was general peer-to-peer between
> and assigned and emulated device.
yes makes sense.

  Maybe there's an argument to be made
> that such a p2p mapping might also be used in a non-vIOMMU case.  We
> skip creating those mappings and drivers continue to work, maybe
> because nobody attempts to do p2p DMA with the types of devices we
> emulate, maybe because p2p DMA is not absolutely reliable on bare metal
> and drivers test it before using it.
MSI doorbells are mapped using the IOMMU_MMIO flag (dma-iommu.c
iommu_dma_get_msi_page).
One idea could be to pass that flag through the IOMMU Notifier mechanism
into the iotlb->perm. Eventually when we get this in vfio_get_vaddr() we
would not print the warning. Could that make sense?

Thanks

Eric



  Anyway, I need a better argument
> why this is ok.  Thanks,
> 
> Alex
> 

