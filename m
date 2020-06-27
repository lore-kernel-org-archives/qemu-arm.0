Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1151121lfm;
        Sat, 27 Jun 2020 00:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVwEiKTXJQKl2fBamg5DO43SY+9uhfTDjaX1zXVJ02tFXQgxpATmr7UKWvREJqnRojU6kO
X-Received: by 2002:a25:14d5:: with SMTP id 204mr11763308ybu.446.1593241764925;
        Sat, 27 Jun 2020 00:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593241764; cv=none;
        d=google.com; s=arc-20160816;
        b=FLIUdL9EOs6H4QJlbhoJTVghV5GzBolSQy5GLJtOqu11Eak3BGsLWI2Mc0yNGnL1WZ
         R4TJQ6mDa9lDi2c0tAOKCYDJyHcqJupdNF/3Xn0Fdzz+kxjsIfmKSzwR6hRTOWX/m70N
         4FXlh1KFCltJ3gnoyYKJJWpL4nWpXJN1LWuRX7A6A7Kry17wWTCuVnDREJXzhGDfAtQ1
         4INxaIFd0EpYeXVKuqdO2jsra02C1j/B4cHZ5Sy4pKsL5rpqG6Dd6Zbmjt4BRmzGXYz/
         HkGktOVlJkhgancRx/fIiT+Yxnsfy0WbN/c+385Yb/gI7tsuj9sim3vy7jE2U0LxWRbf
         5lUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NOn49XQbTNLqq1dBtdJeCbo7D1tw7r7WRbE2fG7w1ZA=;
        b=WicWCyUbkBzKF74UE824yDrDCFlvf+lForCQK4PsV8UV/aT9JLnkukWeOn00Pn4cri
         k0+0WnkipbUJoNJQRlr6Yg26v8GBt1yjPeyZH2mNEuH9cDExeZTD5yGxRCIyl51vy/lA
         RJ7ZyCcj3mvN0llKrEiTczDQh1YqacM3W3qwSH94j+A39gyWK/HttFaokTtxjwqNz21S
         Atvd7/Bn99xmMknOJATuDLDge6Tc2sVb9DxWD6mlbLOAGARS3UbFru0RIvFFBDJHsNG6
         yqvuN18+S2bDADYk7uIHmm1QVYB/AQ7IIKn3ZucZ79t8fDZQTbKzaPT5tHug1b/yP+PX
         T3mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WpFBtZKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si27100678ybf.291.2020.06.27.00.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jun 2020 00:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WpFBtZKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jp4xo-0005xp-6W
	for alex.bennee@linaro.org; Sat, 27 Jun 2020 03:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4xe-0005wt-M7
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:09:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30774
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4xc-0004zZ-U9
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593241752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOn49XQbTNLqq1dBtdJeCbo7D1tw7r7WRbE2fG7w1ZA=;
 b=WpFBtZKRErdNLS2bNRONTUs+VJsIRtswiphGHgqw9zhP3+AyIAZmx2k2qduDMGVm+3Flaz
 qtzxoCvysiDUKHtrIL+rclb/Oayml+bVyRfSXKSoj+DmTePBtLSzsgOdcix98WPvOAwhsr
 738WRd83DDwv8zUne57hqi6jUVomxqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-hd-87jSuP5K1ND4nXhxiKw-1; Sat, 27 Jun 2020 03:09:10 -0400
X-MC-Unique: hd-87jSuP5K1ND4nXhxiKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF1918585A3;
 Sat, 27 Jun 2020 07:09:08 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F34CE121A2F;
 Sat, 27 Jun 2020 07:09:00 +0000 (UTC)
Subject: Re: [PATCH v6 4/5] virtio-iommu-pci: Add array of Interval properties
To: Markus Armbruster <armbru@redhat.com>
References: <20200626103057.11263-1-eric.auger@redhat.com>
 <20200626103057.11263-5-eric.auger@redhat.com>
 <87sgehrnws.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <28b42389-6abb-6ed4-c903-fbdca29ab7b1@redhat.com>
Date: Sat, 27 Jun 2020 09:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87sgehrnws.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VSkl5f690CzM

Hi Markus,

On 6/27/20 9:03 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> The machine may need to pass reserved regions to the
>> virtio-iommu-pci device (such as the MSI window on x86
>> or the MSI doorbells on ARM).
>>
>> So let's add an array of Interval properties.
>>
>> Note: if some reserved regions are already set by the
>> machine code - which should be the case in general -,
>> the length of the property array is already set and
>> prevents the end-user from modifying them. For example,
>> attempting to use:
>>
>> -device virtio-iommu-pci,\
>>  len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1
>>
>> would result in the following error message:
>>
>> qemu-system-aarch64: -device virtio-iommu-pci,addr=0xa,
>> len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1:
>> array size property len-reserved-regions may not be set more than once
>>
>> Otherwise, for example, adding two reserved regions is achieved
>> using the following options:
>>
>> -device virtio-iommu-pci,addr=0xa,len-reserved-regions=2,\
>>  reserved-regions[0]=0xfee00000:0xfeefffff:1,\
>>  reserved-regions[1]=0x1000000:100ffff:1
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v5 -> v6:
>> - check the type value
>> - removed Jean's R-b
>>
>> v3 -> v4:
>> - added examples in the commit message as suggested by Markus
>> - added Jean's R-b
>> ---
>>  hw/virtio/virtio-iommu-pci.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
>> index 632533abaf..9c9bda9490 100644
>> --- a/hw/virtio/virtio-iommu-pci.c
>> +++ b/hw/virtio/virtio-iommu-pci.c
>> @@ -33,6 +33,9 @@ struct VirtIOIOMMUPCI {
>>  
>>  static Property virtio_iommu_pci_properties[] = {
>>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
>> +    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
>> +                      vdev.nb_reserved_regions, vdev.reserved_regions,
>> +                      qdev_prop_reserved_region, ReservedRegion),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> @@ -40,6 +43,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>  {
>>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>>      DeviceState *vdev = DEVICE(&dev->vdev);
>> +    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>>  
>>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
>>          MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
>> @@ -54,6 +58,15 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>                            "-no-acpi\n");
>>          return;
>>      }
>> +    for (int i = 0; i < s->nb_reserved_regions; i++) {
>> +        if (s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_RESERVED &&
>> +            s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
>> +            error_setg(errp, "reserved region %d has an invalid type", i);
>> +            error_append_hint(errp, "Valid values are "
>> +                              "VIRTIO_IOMMU_RESV_MEM_T_RESERVED and "
>> +                              "VIRTIO_IOMMU_RESV_MEM_T_SMI\n");
> 
> Actually, valid values are 0 and 1.  Something like
> 
>     -device virtio-iommu-pci,len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:VIRTIO_IOMMU_RESV_MEM_T_SMI
> 
> will be rejected as invalid.

> 
>> +        }
>> +    }
>>      object_property_set_link(OBJECT(dev),
>>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
>>                               "primary-bus", errp);
> 
> Sorry for having to torture you this way!  Have a
Nah In french we say "when we have no head we have legs ". Anyway there
is a type s/SMI/MSI ...
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> with the error message touched up.

Than you for your patience!

Eric
> 
> 

