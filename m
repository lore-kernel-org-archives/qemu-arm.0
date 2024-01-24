Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp298980ejq;
        Wed, 24 Jan 2024 05:37:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEouRRkumc0y24yJ+Zb6OqyLjCLIygiqAnL1op5RWRI9IA1PawaQcW9K2zeX0yA5SWCXF+f
X-Received: by 2002:a05:6870:e245:b0:214:9f87:277a with SMTP id d5-20020a056870e24500b002149f87277amr1552548oac.25.1706103459644;
        Wed, 24 Jan 2024 05:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706103459; cv=none;
        d=google.com; s=arc-20160816;
        b=NP5wPscbsanOq7Md13X6RDfnyWa9Z166fT2KUhsvN6re6jgfgbQX+Gw5LMJE5M1QvA
         FS5ofTGmF6U586NAmv5kGj4Vp0U55vgc+JGNYQlPnQvACl6eIdFd4zjcRnoy7DAVjhDk
         5U0KPspNzGx/pW4+ERkLbEIb2N85rY65NRX/z0xHBHubreXHh+IsC2lUCxN0Col3Jeqy
         HiJQTOPISDVlJztbKg05n444YUmEOlNroqc9jrX3IV54txP7q7yl4RTM6cY82TRaQqKd
         lauNy+6MzaReCmnBPO9Hm0mE0fQIjZaFtNmRM7KikFtVUItt0GefF999pJckBAXZt0XH
         9L5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=od6VM9/RvmIKeJ6TC2wZtgEazuqsbs4NThCk6V91RLo=;
        fh=+DbHuwQxOH5Y1MExgGR0QTb9lqNLs+bF00viykL2xOM=;
        b=PzLbvH4gXF1UvsWuqLBOsKM+9wXwxXiwnx1IFHJrshQDxwThPEeZ5yxpNf49gsumBw
         TE1t+G5QhpicyD11Su2KApkz/RDYkUEqark6rHLBFVec30fTFXO3cvUBOHvO1Y9t91vN
         BXhqrWZtYQs1F93j8aKZ5/koNz16/ltGkzPnQB6bPpCul2fplzCZWixwS1qYy0UnsR8e
         zcJIZ0UmtbyjiQ9tRDMIonyb6IwswgdIMto0eFxcMmrhRq3vIxS1U6UdT8EM4E4FJAFa
         UrECYAjylVJrmELjrJ5lGvNnmI9O0oU8ya59maAFCGi/xiEwScTN7QlBIuxUpbMEleUT
         mH3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F94BhItX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ac857cc000000b004257cd80ab3si10447988qta.146.2024.01.24.05.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 05:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F94BhItX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSdRG-0006gJ-LY; Wed, 24 Jan 2024 08:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rSdRD-0006fr-Jx
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rSdRB-0001jN-DU
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 08:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706103424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=od6VM9/RvmIKeJ6TC2wZtgEazuqsbs4NThCk6V91RLo=;
 b=F94BhItXjN9GEOGrYK8936QaA2VKWkboY96ttnHvKPSCZOqr5rzf56PIYQ3QMfykpUCka+
 KxYPZh4cvIRRXouEfuGVTYdt0PKI5JrWEm/qXalZ6i4NdVTsgS5VUCT6Jp/00gqvU+qu6P
 qAbeDjFiqMwW51yK5qy2wIBCc+YRmBA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-i6Q3QQntN6OP1Hb68NZYLw-1; Wed, 24 Jan 2024 08:37:03 -0500
X-MC-Unique: i6Q3QQntN6OP1Hb68NZYLw-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7bee3ad7bcfso562467539f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 05:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706103422; x=1706708222;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=od6VM9/RvmIKeJ6TC2wZtgEazuqsbs4NThCk6V91RLo=;
 b=mYQJ0n3AOmGQzGoeTR7TVi6uZiYb6XV3oXEeETvC6SWabeyifFoiWUzC9u/D/ImAp8
 sVNtDNlq2x1JuxP026i4+rkS33rDc8f/ZGrTCNRsAVs75GGcxYmxnytql1zQXup221A7
 q4NabtmLJktdnVh6TeURFx5tKz9Vmh8hTp7X8Frdxdj7U7/nfFpyGRJurOrEWYvUUSCT
 /KD+u0W+9gaWdZ9dROQJqTwEyGJN1sayc1b+aY1bFJ3pudaKEkQEC6NX5qWcmlM9b58O
 Xz/diVYuFP7e5vUkmx6mKUFqP1HZcIcdj6u7eYN6PJCXwn/3DMySTrC6lCGG95NTaMfq
 R9kg==
X-Gm-Message-State: AOJu0Yyf+HcZE7Qv0bIHuXnlCnhMELTtsv8O5/VhtASo5NwJc9uzW5iS
 Y97XFIUWEkbjOO1CGRT1MbKnXpPeWPYqTmLsicSnbWTlRgJy6D2krjr5lNSusLycvrUAvzJhUXG
 hFVEsAWmfXZ+LlfPD3eZ5kGyLsY/JCSzCf5tNbF//a+F7lR59Sw==
X-Received: by 2002:a6b:6302:0:b0:7bf:928d:3149 with SMTP id
 p2-20020a6b6302000000b007bf928d3149mr1671064iog.26.1706103422344; 
 Wed, 24 Jan 2024 05:37:02 -0800 (PST)
X-Received: by 2002:a6b:6302:0:b0:7bf:928d:3149 with SMTP id
 p2-20020a6b6302000000b007bf928d3149mr1671050iog.26.1706103422121; 
 Wed, 24 Jan 2024 05:37:02 -0800 (PST)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6bc90f000000b007bf05f618f3sm7778526iof.55.2024.01.24.05.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 05:37:01 -0800 (PST)
Date: Wed, 24 Jan 2024 06:37:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH 1/3] virtio-iommu: Add an option to define the input
 range width
Message-ID: <20240124063700.67c8c32c.alex.williamson@redhat.com>
In-Reply-To: <a35c4fad-a981-4fbf-81d1-be5625a537b9@redhat.com>
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240123181753.413961-2-eric.auger@redhat.com>
 <20240123165141.7a79de34.alex.williamson@redhat.com>
 <a35c4fad-a981-4fbf-81d1-be5625a537b9@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Vb+sOgr3pwQv

On Wed, 24 Jan 2024 14:14:19 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Alex,
> 
> On 1/24/24 00:51, Alex Williamson wrote:
> > On Tue, 23 Jan 2024 19:15:55 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> aw-bits is a new option that allows to set the bit width of
> >> the input address range. This value will be used as a default for
> >> the device config input_range.end. By default it is set to 64 bits
> >> which is the current value.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  include/hw/virtio/virtio-iommu.h | 1 +
> >>  hw/virtio/virtio-iommu.c         | 4 +++-
> >>  2 files changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> >> index 781ebaea8f..5fbe4677c2 100644
> >> --- a/include/hw/virtio/virtio-iommu.h
> >> +++ b/include/hw/virtio/virtio-iommu.h
> >> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
> >>      bool boot_bypass;
> >>      Notifier machine_done;
> >>      bool granule_frozen;
> >> +    uint8_t aw_bits;
> >>  };
> >>  
> >>  #endif
> >> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >> index ec2ba11d1d..e7f299e0c6 100644
> >> --- a/hw/virtio/virtio-iommu.c
> >> +++ b/hw/virtio/virtio-iommu.c
> >> @@ -1314,7 +1314,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >>       */
> >>      s->config.bypass = s->boot_bypass;
> >>      s->config.page_size_mask = qemu_real_host_page_mask();
> >> -    s->config.input_range.end = UINT64_MAX;
> >> +    s->config.input_range.end =
> >> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;  
> > What happens when someone sets aw_bits = 1?  There are a whole bunch of
> > impractical values here ripe for annoying bug reports.  vtd_realize()
> > returns an Error for any values other than 39 or 48.  We might pick an
> > arbitrary lower bound (39?) or some other more creative solution here
> > to avoid those silly issues in our future.  Thanks,  
> You're right. I can check the input value. This needs to be dependent on
> the machine though but this should be feasable.
> Then I would allow 39 and 48 for q35 and 64 only on ARM.

AFAIK AMD-Vi supports 64-bit address space.  Without querying the host
there's no way to place an accurate limit below 64-bit.  Thanks,

Alex

> >>      s->config.domain_range.end = UINT32_MAX;
> >>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> >>  
> >> @@ -1525,6 +1526,7 @@ static Property virtio_iommu_properties[] = {
> >>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
> >>                       TYPE_PCI_BUS, PCIBus *),
> >>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> >> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
> >>      DEFINE_PROP_END_OF_LIST(),
> >>  };
> >>    
> 

