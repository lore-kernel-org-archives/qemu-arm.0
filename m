Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp209859eje;
        Tue, 13 Feb 2024 07:42:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTFUwOWuBM9bSjvgWIIUrcLDRavmqmHA0lsUU4GZGfmRKFxNp43B+DnZxPun4/oA/JHpgB
X-Received: by 2002:a05:622a:34f:b0:42d:afd3:7b69 with SMTP id r15-20020a05622a034f00b0042dafd37b69mr1764248qtw.63.1707838929455;
        Tue, 13 Feb 2024 07:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707838929; cv=none;
        d=google.com; s=arc-20160816;
        b=SCHzk11qjY1fRaKLDYUZeKihBSwDxbBePGEa/8zbF566kD2wzzcEzjFvI1RQE4kW0b
         CZG4qHNpczNUA9HmIkYPwFanvP+oHR2KlIh4XCZaOzo7PsXLxofJ7dCpZshIpD+YxJNb
         XJhuI7FrrB2ziwXduE72fMGn4sSRDVUG/P+dS5pFQJsb07v/m3Meh4O5B4T5+FoDRe+3
         V4z4t3UWRPtBV5Mzhev5cf6EzH904m79StXVs7jt0yjtGqWUmy1XXIg27+V8dBKNVTDd
         qUabpnZd6ZR3IOs+Cq96ctIPXe/tqju9yoBlbORPEaOpb5s7lZJQhffKnkdLdQv8qtHD
         /fZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=kQMBVf6ot6L5yvYqDah4DqdCtJLRoOoiC0tHLvg2ukM=;
        fh=PC1HMB1mMpikk1cNeJz8XGYolx9Onh/ZjJhFnU6jvh8=;
        b=TzMeN8bprM6nEW2Iv+yfTwFNSeNuxptMQW8XPmK4jVsMUiTphbEpuLtvbcTccp4M6Z
         jxPWcsW1y4E5f+JhZqBeDpyQ5bzzIR8ngosNBj3a9usjl4AIwfGIEZIvqQbl1ogyGZNs
         Jqp3kIOS9hICkeyicGsYkn8b7noqoF9XtwdeMNHKDG5pXf0u/hvYoh5mGrDAtL/Qf8os
         pQfFT1Hf781qAjq/tXL+FjYYOUrGqW/ua363ixEK3fJVhXWic/IFG7hIK77Hhi8jlvCW
         REpRcfvmvRLlW2Q/g3f6ayBfSXcdbgZGGdbNa2in0r0/qTBd0dDKJbLgY7cti3df12dS
         ZXzQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQFTtplX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVkRHcyxLM5ozgXtb1HZCtBvEoMgeRdw+qUa1erIRhjsrAbwdx0YzCztCwUqMD9mGDZfXHJngaZX7AFHU9vwL8P/g64xd+E
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020ac85154000000b0042beb743fcbsi2871253qtn.446.2024.02.13.07.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQFTtplX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZuv3-0005kH-LL; Tue, 13 Feb 2024 10:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZuv2-0005k9-Vc
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZuv1-0003kh-7j
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707838918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQMBVf6ot6L5yvYqDah4DqdCtJLRoOoiC0tHLvg2ukM=;
 b=gQFTtplX4ueuIIDNgKCFvaGEhe1R2kk0bqlL3DZOGSDL29qz8iEPdJEMySdfw2GLwUD0f4
 AeZikoXqMPt1WcR++om7BuhlBG9IpH9H3TH7/5koMcHUxra0vCOj3xH1P412rvzShWyaTn
 /+ELkN4X9gX0E9JLW7VQCmxVklcpqHs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-TQFoXPd1NbGNtc01VnqL7g-1; Tue, 13 Feb 2024 10:41:57 -0500
X-MC-Unique: TQFoXPd1NbGNtc01VnqL7g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33b316fcaecso1677474f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838914; x=1708443714;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kQMBVf6ot6L5yvYqDah4DqdCtJLRoOoiC0tHLvg2ukM=;
 b=cMs6t2UQ3JM3G7T3Wnc2GwB3hVTRbZnxM5+s/+v0jHqtt25sy9ZMI6wxehqFYcVINb
 lrTlbybAyiDatq1sb7DK9dO0rZkkqIrKHA9KA28MkNK/n22NxeHtMf0HOajfD0Gk2sH6
 GMI0kweasl5SWqlKeNnkv4Os3aqxQ2Enl6peB5KF3QhioAiG9h4BvJSerguLYzWkdcGB
 yqbBV/K9Tl59WJRr6sUib36kK0TJsAw3741YwD1qc6R7Zb7CGqVB/gC4InOaQuJIZicQ
 Jl/qHKREfJXx8dwvIMzhFo3Om8FUVzvtZZb2gigSkLjodmoaKiO9fFzTBW5h4p5dxxD/
 /YOQ==
X-Gm-Message-State: AOJu0YxOXHqpLRxF/3q9xIyvLur+YDqe0zTDGO7nHSphitNQAJ6TgEeG
 Qb6YGpfsTuAcC0H2HPB0JfXPdi84frvpRGNYnLXbLFZrlUIijQhhlXuwbyHvyz2Cl8XT/EuAxss
 Q5fcquRcoAZ6uR1tiW8plfuFPOjcAI6HVdvJasHGPNSPo7eUwkg==
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id
 s12-20020a5d424c000000b0033b2633b527mr6018914wrr.20.1707838914624; 
 Tue, 13 Feb 2024 07:41:54 -0800 (PST)
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id
 s12-20020a5d424c000000b0033b2633b527mr6018896wrr.20.1707838914214; 
 Tue, 13 Feb 2024 07:41:54 -0800 (PST)
Received: from redhat.com ([2.52.26.67]) by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b00410c44a39bfsm1055068wms.1.2024.02.13.07.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 07:41:53 -0800 (PST)
Date: Tue, 13 Feb 2024 10:41:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 zhenzhong.duan@intel.com, yanghliu@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v3 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
Message-ID: <20240213104100-mutt-send-email-mst@kernel.org>
References: <20240208101128.655167-1-eric.auger@redhat.com>
 <20240213053502-mutt-send-email-mst@kernel.org>
 <63c2eb75-6379-4c84-8b83-24392bcf3e35@redhat.com>
MIME-Version: 1.0
In-Reply-To: <63c2eb75-6379-4c84-8b83-24392bcf3e35@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zS0RTL6PfBcd

On Tue, Feb 13, 2024 at 11:38:06AM +0100, Eric Auger wrote:
> Hi Michael,
> On 2/13/24 11:35, Michael S. Tsirkin wrote:
> > On Thu, Feb 08, 2024 at 11:10:16AM +0100, Eric Auger wrote:
> >> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
> >> protected with a virtio-iommu is assigned to an x86 guest. On x86
> >> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
> >> whereas the virtio-iommu exposes a 64b input address space by default.
> >> Hence the guest may try to use the full 64b space and DMA MAP
> >> failures may be encountered. To work around this issue we endeavoured
> >> to pass usable host IOVA regions (excluding the out of range space) from
> >> VFIO to the virtio-iommu device so that the virtio-iommu driver can
> >> query those latter during the probe request and let the guest iommu
> >> kernel subsystem carve them out. 
> >>
> >> However if there are several devices in the same iommu group,
> >> only the reserved regions of the first one are taken into
> >> account by the iommu subsystem of the guest. This generally
> >> works on baremetal because devices are not going to
> >> expose different reserved regions. However in our case, this
> >> may prevent from taking into account the host iommu geometry.
> >>
> >> So the simplest solution to this problem looks to introduce an
> >> input address width option, aw-bits, which matches what is
> >> done on the intel-iommu. By default, from now on it is set
> >> to 39 bits with pc_q35 and 48 with arm virt. This replaces the
> >> previous default value of 64b. So we need to introduce a compat
> >> for machines older than 9.0 to behave similarly. We use
> >> hw_compat_8_2 to acheive that goal.
> >>
> >> Outstanding series [2] remains useful to let resv regions beeing
> >> communicated on time before the probe request.
> >>
> >> [1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
> >>     https://lore.kernel.org/all/20231019134651.842175-1-eric.auger@redhat.com/
> >>     - This is merged -
> >>
> >> [2] [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for hotplugged devices
> >>     https://lore.kernel.org/all/20240117080414.316890-1-eric.auger@redhat.com/
> >>     - This is pending for review on the ML -
> >>
> >> This series can be found at:
> >> https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v3
> >> previous
> >> https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v2
> >>
> >> Applied on top of [3]
> >> [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default page_size_mask
> >> https://lore.kernel.org/all/20240117132039.332273-1-eric.auger@redhat.com/
> > So, I applied this without that patch until we agree whether there are
> > compat issues in that one. Seems to work without or did I miss anything?
> To me it works without compat by checking the input stream version and
> if <= 3 apply the previous default.
> 
> maybe I miss something but I tested mig between v2 and v3 and that worked
> 
> Eric


Can you rebase without that other change?
ATM it fails make check for me:

▶  44/462 ERROR:../tests/qtest/virtio-iommu-test.c:37:pci_config: assertion failed (input_range_end == UINT64_MAX): (0x7fffffffff == 0xffffffffffffffff) ERROR         


https://gitlab.com/mstredhat/qemu/-/jobs/6162397307



> >
> >
> >> History:
> >> v2 -> v3:
> >> - Collected Zhenzhong and Cédric's R-b + Yanghang's T-b
> >> - use &error_abort instead of NULL error handle
> >>   on object_property_get_uint() call (Cédric)
> >> - use VTD_HOST_AW_39BIT (Cédric)
> >>
> >> v1 -> v2
> >> - Limit aw to 48b on ARM
> >> - Check aw is within [32,64]
> >> - Use hw_compat_8_2
> >>
> >>
> >> Eric Auger (3):
> >>   virtio-iommu: Add an option to define the input range width
> >>   virtio-iommu: Trace domain range limits as unsigned int
> >>   hw: Set virtio-iommu aw-bits default value on pc_q35 and arm virt
> >>
> >>  include/hw/virtio/virtio-iommu.h | 1 +
> >>  hw/arm/virt.c                    | 6 ++++++
> >>  hw/core/machine.c                | 5 ++++-
> >>  hw/i386/pc.c                     | 6 ++++++
> >>  hw/virtio/virtio-iommu.c         | 7 ++++++-
> >>  hw/virtio/trace-events           | 2 +-
> >>  6 files changed, 24 insertions(+), 3 deletions(-)
> >>
> >> -- 
> >> 2.41.0

