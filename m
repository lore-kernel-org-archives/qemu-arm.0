Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp399136ejb;
        Thu, 8 Dec 2022 06:58:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZIUaUDHxJ7ZvtP0MsmO6i3wVkenxtUKLJmggTUs52JZPzVKHMagYVEToelSxoqZnpMEJZ
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id v4-20020a05622a014400b003a5361f9819mr4822808qtw.18.1670511514343;
        Thu, 08 Dec 2022 06:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670511514; cv=none;
        d=google.com; s=arc-20160816;
        b=Xuas+/SXGpxlf5Ob+sxfzaktr2fcnUKNeg3n046cuTARVTy+k+NQvZlaxaJFA9oNe6
         B67clSQDjx3gMGPOW0l+9giyrgno9ijQZwEJfp5xS9UkUYVUFazZNDwnHQov7oDrp10X
         4sIGgXH2HdT4xgfqyuWIiB1okYwipdHb7AssiRyvIU3o93ctf0cmzzo7TfKXPkocehW9
         pHl4CiEBDbln3I9+0EkI1D47EgGHt/RpHjtuLxMssmoO+9YZP7NR4zHFWD1yQ+qqQdfY
         WkB6lAPei1FG9p4b67G//iRIrC3IfGoO9hQ6xgouKB3F0llfif2FTj+D8BOwYo8PsCkD
         1PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4RFPA6eEeHI4Jv4yjfcr8VKG9mhfAMp+FIXSx/wsDxM=;
        b=IhBKmR8PYHyW9AmTHaPSPwMh2PDrMVQWoKYpQ7dHNQlp/aZtm0NnsmIO2ugfFmsXbl
         qaxWeYqtlrQ/GocBdX1td8Tmitqw0gigvv19AIDpOWUjrv0OKSpQfkCNFJ4qcK8Rif1x
         df8n8HArduMPQrfHKEvUj/QdPb8Xbq1Ime20iZ7WhKsyfMRnG28g1S2Etj1fE+wUgu8t
         51la2+JrLo36Jp4lwWQ2mNvQPOOofh5ceWuipT+D/ebnBKYkeyS3wMs1MAXryfm41pUq
         ZpUE1ZJAABVNnqM0AYF6FR6QwWsEpkDwLwJVOkJB2GRWX4bOjU6hE4MYqyk2UrTj96Vr
         3pvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VB0Wjf3J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm45-20020a05620a1d6d00b006fec16fe25asi5015005qkb.762.2022.12.08.06.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Dec 2022 06:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VB0Wjf3J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3IM2-0004rQ-Bs; Thu, 08 Dec 2022 09:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3IM0-0004nr-Pt
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 09:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3ILj-0001QP-P5
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 09:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670511490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4RFPA6eEeHI4Jv4yjfcr8VKG9mhfAMp+FIXSx/wsDxM=;
 b=VB0Wjf3J3qr9Nm1LF56FourOboKaHk5vgPSwtYYSFYeI/23YzTOrVCe7ilw5Ak+yx8Be8+
 j8euw+wPApBM7PfX3vMI/HGeaeOITWEgIoWTfuy2vpkLOq7KcskS/8Crm5OiRQGe1Cfm8k
 OP5t3UVqw1BfHh8POODf2ubp/NsI0QU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-soOPzw7nPVmUxBnV1ayDHA-1; Thu, 08 Dec 2022 09:58:09 -0500
X-MC-Unique: soOPzw7nPVmUxBnV1ayDHA-1
Received: by mail-qv1-f71.google.com with SMTP id
 71-20020a0c804d000000b004b2fb260447so1578573qva.10
 for <qemu-arm@nongnu.org>; Thu, 08 Dec 2022 06:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RFPA6eEeHI4Jv4yjfcr8VKG9mhfAMp+FIXSx/wsDxM=;
 b=b1U/wqzlKe7MLWdjqJIIuus92T8hlbOUF4uZnwsa5OedULqCT+5JJ6sWN66hbB2a9j
 rs2G6YzygHPuA17SsKYTx7Skv6cPJaGshfm22BFRe4pBn7RrFjdNZ6w7dM/I0grycJb+
 fOhRp9j0cijLtN9FHrr7L1M6uTqTpOw6YlIwrBZ9e8tiRCMjdSsD5iK4ffzZYkWyFn1U
 5j9J7TI/jtE4CcyQkfbfJmS1hbm9Xlr2a9UOULE7Ag8gi3JtE+A4jFZBFkNGKzZtkmo5
 CzDqRc9yIyawr2a7buAvyuYOa897d4y6osY4NaNEjPJhUilscNgeMAVMXEDZbYJRpFXk
 /OZg==
X-Gm-Message-State: ANoB5pl9ZAJl9zIAst2v/V8Gta0UP7qwkBuA3JMGe25YAPG5T8+YS9l+
 kkhr3SWnujFl2zFpsjGmvTGGZ3kYBk+QECT9ZfonpAFbGg8/DgwwcLTc+FDW1CqGSO5edGTZGs0
 8QHLnJbbf8WMI
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id
 v4-20020a05622a014400b003a5361f9819mr4820797qtw.18.1670511488736; 
 Thu, 08 Dec 2022 06:58:08 -0800 (PST)
X-Received: by 2002:a05:622a:144:b0:3a5:361f:9819 with SMTP id
 v4-20020a05622a014400b003a5361f9819mr4820769qtw.18.1670511488474; 
 Thu, 08 Dec 2022 06:58:08 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 s190-20020ae9dec7000000b006f7ee901674sm18683355qkf.2.2022.12.08.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:58:07 -0800 (PST)
Date: Thu, 8 Dec 2022 09:58:06 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org,
 bharat.bhushan@nxp.com, alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <Y5H7fu2ikdXU8b3i@x1n>
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
 <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fWnNDtbGTA8s

On Thu, Dec 08, 2022 at 08:48:09AM +0100, Eric Auger wrote:
> Hi Peter,

Hi, Eric,

> 
> On 12/8/22 00:49, Peter Xu wrote:
> > Hi, Eric,
> >
> > On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> >> When assigning VFIO devices protected by a virtio-iommu we need to replay
> >> the mappings when adding a new IOMMU MR and when attaching a device to
> >> a domain. While we do a "remap" we currently fail to first unmap the
> >> existing IOVA mapping and just map the new one. With some device/group
> >> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> >> ranges onto existing ones.
> > I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> > we were working on the vt-d replay for vfio.  The issue is whether DMA can
> > happen right after UNMAP but before MAP of the same page if the page was
> > always mapped.
> 
> I don't think it can race because a mutex is hold while doing the
> virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
> map, unmap), see virtio_iommu_handle_command.
> So I think it is safe.

It's not the race in the code, it's the race between modifying host IOMMU
pgtable with DMA happening in parallel.  The bug triggered with DMA_MAP
returning -EEXIST means there's existing mapping.

If during replay there's mapped ranges and the ranges are prone to DMA,
then IIUC it can happen.

I didn't really check specifically for virtio-iommu and I mostly forget the
details, just to raise this up.  It's possible for some reason it just
can't trigger.  VT-d definitely can, in which case we'll see DMA errors on
the host from the assigned device when the DMA triggers during the "unmap
and map" window.

Thanks,

-- 
Peter Xu

