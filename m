Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp322664ejq;
        Wed, 24 Jan 2024 06:16:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi0etmuhckW3C84lJDzj6orl55AaXqjkbmR7sY84IU+aGq6g+fXnSHRpE/WCuicjzJ5U+d
X-Received: by 2002:a05:622a:8c:b0:42a:5997:26b8 with SMTP id o12-20020a05622a008c00b0042a599726b8mr1685790qtw.86.1706105787348;
        Wed, 24 Jan 2024 06:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706105787; cv=none;
        d=google.com; s=arc-20160816;
        b=VYXJKsTMUoTwFFuwdVnJ7CvCXrjzrZZrnfd8SyFqL0ISgQR58uR/bDpNJGwuO6Nj5V
         QbwFEzqkiRAlD/H+7vPDd9Lp9BgWbEYecx3FQtRNZPmPaokfnugfRzlfpiyidzXrdkiZ
         DvcEoWGp2+J9d66I3fBilRGFDyiQZh9zYHWpE+0F21WENGd/wpV6xgXKkeYcJQ1rCB3u
         mXorXbvmvInxkfQMBhov/VEeJTNhZw6549HXA4wgrTWBSoAJS4vFRqB0rq1zfnaUkoVy
         9I7Guc3p8K8zoqR5R23VzZZIRUw/yDicRO5QOrF50SRwS/Txwwm68YdJg73aWB5010K1
         vlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=elOfKOGNedOe/JPT/oWJQXKuQpjws5ocJG2TnWB9sGs=;
        fh=+DbHuwQxOH5Y1MExgGR0QTb9lqNLs+bF00viykL2xOM=;
        b=hKTDHOYW2HX49PXWv1KRS4CmlAMG5maZ/gtL+V779bgWzSW8gc017CLYhrOfrR2RPU
         mBvFK8bninSbArqi2TDAJhD/RghVtlIQ2RD/gysLZJV3rb6iBhvNYYEX4HWnppwk+NP2
         C1pU4vh/DHWekqrcDtJajmeVr+lpZJvqOl+d3IHra/tKf4DDnhprawwTN8qIWGKbIi/B
         LMw/TsI0q49FZBgexkDr8kuhR91okoT/jKi3HfoauakVydpI6u7TXRj2oDVq4XWWb3YD
         GVW0mnv+dKCuJ3O2OHiYMloP0tn8ZJp/YpenjR9CRg7Ig1VTezvgTXB6azdOzLeTPGNJ
         XgEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XHkNO6rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a00d200b0042a46344f9bsi5588043qtw.674.2024.01.24.06.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 06:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XHkNO6rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSe2j-0004Yn-QL; Wed, 24 Jan 2024 09:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rSe2U-0004Ke-7D
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 09:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rSe2S-0001PA-C8
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 09:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706105735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elOfKOGNedOe/JPT/oWJQXKuQpjws5ocJG2TnWB9sGs=;
 b=XHkNO6rSmLl1LUqqYfZhBEgCG+Gz6KL12bDVdqTmQ27FBWfLPfJ6Aa3UlGi+G2EqTeSAUv
 nhNfGLqFlQRkDrIMkLsru3a36luNVYivReWEyLTyMB89fAPezZrH6I05JWig7gMYxj4zIb
 NfZh4MVkVrBfvM2bJgbQ4N6B/KAlaeA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-abszN509PRK8n89Is7S2QA-1; Wed, 24 Jan 2024 09:15:33 -0500
X-MC-Unique: abszN509PRK8n89Is7S2QA-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7baa6cc3af2so570441639f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 06:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706105733; x=1706710533;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=elOfKOGNedOe/JPT/oWJQXKuQpjws5ocJG2TnWB9sGs=;
 b=K8yekcf5F+3CebZoEnzvfZV1v7a6gwVy5Ul5RWk6SsW9layUOL3/E83YdM2QI44qp1
 8pueKXV3YzALG9lCfuPThbkuKMuwFopvUd9DsXuGT5FWyn0Mhqs1ZMojKnuXfVY/Db3z
 uE8X00HriQqFiQUpZ4fxjV53R12JVKzsDmrfOlpefNhs97AIrz/wcZgOrFIjnb1jibci
 K0hOiqDQbqcfZ2MIo7sWfA5HF88CpRShOrzwH91pwlbg+6BJEgQ2OEkocyE5AbPG8f3M
 Az4/2pEwV6UEbpzqxVC4BsIjByBavoDrOQfV3lgBEQj9S5lqYY1CdurnDiFkf+I9KNQJ
 LLEw==
X-Gm-Message-State: AOJu0Yy2GYRWQptKLkbdnoLVEXCuaQZ+uZxkmLhOln2gOZfcWcM4Esqc
 iPKvo2dQdb/nTGFPvWoA7/4INtWJf9IX15JSqaCyBqYfuyOH4sUl9C12XiUCIOi1sYqDx8xoq9q
 hD3ns0/q1PkP0OdtQT1xTQl9m7IDIFOG4u5Yu9crq5IplZCQgyA==
X-Received: by 2002:a05:6e02:13e7:b0:361:a9c7:d5c3 with SMTP id
 w7-20020a056e0213e700b00361a9c7d5c3mr1387347ilj.31.1706105732772; 
 Wed, 24 Jan 2024 06:15:32 -0800 (PST)
X-Received: by 2002:a05:6e02:13e7:b0:361:a9c7:d5c3 with SMTP id
 w7-20020a056e0213e700b00361a9c7d5c3mr1387328ilj.31.1706105732483; 
 Wed, 24 Jan 2024 06:15:32 -0800 (PST)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 br5-20020a056e0223c500b0035fb30380bcsm1848590ilb.58.2024.01.24.06.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 06:15:32 -0800 (PST)
Date: Wed, 24 Jan 2024 07:15:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH 1/3] virtio-iommu: Add an option to define the input
 range width
Message-ID: <20240124071531.44bd7164.alex.williamson@redhat.com>
In-Reply-To: <a92a2023-7448-4b74-bfd9-e412c6092270@redhat.com>
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240123181753.413961-2-eric.auger@redhat.com>
 <20240123165141.7a79de34.alex.williamson@redhat.com>
 <a35c4fad-a981-4fbf-81d1-be5625a537b9@redhat.com>
 <20240124063700.67c8c32c.alex.williamson@redhat.com>
 <a92a2023-7448-4b74-bfd9-e412c6092270@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LOAcU5j+w3d5

On Wed, 24 Jan 2024 14:57:41 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Alex,
> 
> On 1/24/24 14:37, Alex Williamson wrote:
> > On Wed, 24 Jan 2024 14:14:19 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> Hi Alex,
> >>
> >> On 1/24/24 00:51, Alex Williamson wrote:  
> >>> On Tue, 23 Jan 2024 19:15:55 +0100
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>    
> >>>> aw-bits is a new option that allows to set the bit width of
> >>>> the input address range. This value will be used as a default for
> >>>> the device config input_range.end. By default it is set to 64 bits
> >>>> which is the current value.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> ---
> >>>>  include/hw/virtio/virtio-iommu.h | 1 +
> >>>>  hw/virtio/virtio-iommu.c         | 4 +++-
> >>>>  2 files changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> >>>> index 781ebaea8f..5fbe4677c2 100644
> >>>> --- a/include/hw/virtio/virtio-iommu.h
> >>>> +++ b/include/hw/virtio/virtio-iommu.h
> >>>> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
> >>>>      bool boot_bypass;
> >>>>      Notifier machine_done;
> >>>>      bool granule_frozen;
> >>>> +    uint8_t aw_bits;
> >>>>  };
> >>>>  
> >>>>  #endif
> >>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >>>> index ec2ba11d1d..e7f299e0c6 100644
> >>>> --- a/hw/virtio/virtio-iommu.c
> >>>> +++ b/hw/virtio/virtio-iommu.c
> >>>> @@ -1314,7 +1314,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >>>>       */
> >>>>      s->config.bypass = s->boot_bypass;
> >>>>      s->config.page_size_mask = qemu_real_host_page_mask();
> >>>> -    s->config.input_range.end = UINT64_MAX;
> >>>> +    s->config.input_range.end =
> >>>> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;    
> >>> What happens when someone sets aw_bits = 1?  There are a whole bunch of
> >>> impractical values here ripe for annoying bug reports.  vtd_realize()
> >>> returns an Error for any values other than 39 or 48.  We might pick an
> >>> arbitrary lower bound (39?) or some other more creative solution here
> >>> to avoid those silly issues in our future.  Thanks,    
> >> You're right. I can check the input value. This needs to be dependent on
> >> the machine though but this should be feasable.
> >> Then I would allow 39 and 48 for q35 and 64 only on ARM.  
> > AFAIK AMD-Vi supports 64-bit address space.  Without querying the host
> > there's no way to place an accurate limit below 64-bit.  Thanks,  
> 
> Hum this means I would need to look at
> /sys/class/iommu/<iommu>/amd-iommu/ or /sys/class/iommu/dmar* to
> discriminate between AMD IOMMU and INTEL IOMMU physical IOMMU. Would
> that be acceptable?

I'm not necessarily suggesting that we look at the host, I'm mostly
just stating that enforcing 39/48 bits on non-ARM is incorrect for a
large portion of the non-ARM world too.  There might even be some
interesting use cases for a 32-bit IOVA space, so maybe just set
defaults tuned for compatibility and accept anything between 32- and
64-bits.  Thanks,

Alex

> >>>>      s->config.domain_range.end = UINT32_MAX;
> >>>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> >>>>  
> >>>> @@ -1525,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
> >>>>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
> >>>>                       TYPE_PCI_BUS, PCIBus *),
> >>>>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> >>>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
> >>>>      DEFINE_PROP_END_OF_LIST(),
> >>>>  };
> >>>>      
> 

