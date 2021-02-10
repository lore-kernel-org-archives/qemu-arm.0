Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1071753lfc;
        Wed, 10 Feb 2021 00:13:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh/NI9jImGEcur9eXEKiRYEIE+Y3DiJTu7n/gI0fawKMqGQQgpI/69zj6isqPjvb4IDgOp
X-Received: by 2002:a25:7d03:: with SMTP id y3mr2608430ybc.444.1612944813380;
        Wed, 10 Feb 2021 00:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612944813; cv=none;
        d=google.com; s=arc-20160816;
        b=wb+bR0MkXTcYy2KfeD5lnYO8Wbuim2dAyp9CSEciE2UPFixad1NH+FVA/Kg1R15Piv
         f+sHnXQYX9cNVVpA/zJgE/Ckfo9MJ/c97sXTjtVbUjfP96wFaDN/Tx/JMDJzYj0azYha
         u/26mMwJHh2w9vnImA3hH6/FV8ovRnxkQ/V9SsBwu6gtmMfgCgDCXIPpfHCW79VvIbfN
         mHCV+WpVJODGS0b9cpucngR2iatXR1t1EByJ1TkQ4iwVVkzVONMEV4n3wT3ANtepLBjU
         HfpQUt+LLCNQEkmrYFMRZMf0ZSIRvqmUJb+395sL9LBt2UZZZRjTro8Si49IqWq91cLM
         KQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1VU2PNEs/Qz6MNJFxfBG3cTEyHXBfApkVTAe1HRIAzs=;
        b=qiYJ6bKX1rf+hUmOcMV91Tt9chb1TCQp82EZCnX0JCKTD5GvdQ/fBfyNbMOib389Ff
         7UuJ5IDj2JNS9ehZ/Nod1LHk6ISBQHxo/7HXSaNIi4J3areKANCTtNlI/Khx+i21o0N3
         goWcVNuE9ifoZSBnLzJ2IvQgT3CRTm6hu4+JZ0MxAEbHjurN2gF+pB2nO7PEObjSAwV6
         E/6UTM63V7TMJTxpYQ5D1FjmhXsMaZDuNTkWvPgKwTcwuEJ50NYbo1FzZgwEbEb7eHeh
         /xtwVi2a7LGWAYTdq6bg6bHz32Vg4C/ltSUDIGma4E3I2cnZyNJFYINoyeR5+qOZ+Com
         znHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KL04KaPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si1227339ybm.402.2021.02.10.00.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 00:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KL04KaPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9kcu-0002C8-Nx
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 03:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kcT-0002AO-Q5
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:13:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kcS-0006RJ-Cs
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 03:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612944783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1VU2PNEs/Qz6MNJFxfBG3cTEyHXBfApkVTAe1HRIAzs=;
 b=KL04KaPDwMvAxg12go1029PMiuk1JruJKUGwd55mF8KiKxYBtlwfS1JkDTdyJ6ZUtJZs89
 1tDUomiXgFo+3tRQjLKMgNlkK4mEgZUZYc0b6KxUYJE+vp2Q78y8GlXljvgKpadOPpueGy
 T5EQKGlcwiAFzMOmFjLyHOePp2R0Jng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-oPyoPPSkO4C_Z6MjyXgDDw-1; Wed, 10 Feb 2021 03:12:59 -0500
X-MC-Unique: oPyoPPSkO4C_Z6MjyXgDDw-1
Received: by mail-wr1-f70.google.com with SMTP id n18so1293324wrm.8
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 00:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1VU2PNEs/Qz6MNJFxfBG3cTEyHXBfApkVTAe1HRIAzs=;
 b=G73fYnQynPqxw285JmU41paQJT0ml+I8viQk8Yr06lyqGpSv2bTo2mV7jJtXm8V9t8
 Q5iWUxHIlmCm1NpirQMSRmwIVNv9V+XGOW7bbCBHTP7alv1HUiufGaeDa0NzzkIfJi/W
 VdsxV/7opny0bWLjhUndgfZQy3/HpM2jE4frFyydddh26SYf/RUkEXQZ+nYeE4dn7Swh
 hoFBvKR5YE+RwHJYUpIFt1+dqEIe7ud0qBvU2WDHKm20IdShGH9L7rf0zb0+ayinCx+g
 81N/PXy3ECMW02aEjez6OmIzUHuGfOhbNTVMOUAimskGKhC8PYS3gfPC5FAT4/QoMs/b
 KqBw==
X-Gm-Message-State: AOAM531Fx66HflMzTCD2KBUperI5tHKmcjULUUN7xnI/z8Zg2jFMFjUV
 hlWd5KJtNndOJjbGype7QV+4Vtf2MDG8r/ObBRTW0/cVnuDyTWwhnJ+5RJZAyHU+NWwl8Eo+KKS
 E4SteDZOUZK0G
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr2298987wrs.106.1612944778847; 
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr2298963wrs.106.1612944778667; 
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id v1sm1494387wmj.31.2021.02.10.00.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
Date: Wed, 10 Feb 2021 03:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
Message-ID: <20210210031242-mutt-send-email-mst@kernel.org>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, groug@kaod.org, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPK2qzkuV0lg

On Tue, Feb 09, 2021 at 10:32:33PM +0100, Eric Auger wrote:
> Previous work on dev-iotlb message broke spapr_iommu/vhost integration
> as it did for SMMU and virtio-iommu. The spapr_iommu currently
> only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
> VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
> and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
> spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> registration.
> 
> Reported-by: Peter Xu <peterx@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/ppc/spapr_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 30352df00e..24537ffcbd 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      struct SpaprTceTable *tbl = container_of(iommu, SpaprTceTable, iommu);
>  
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "spart_tce does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>      if (old == IOMMU_NOTIFIER_NONE && new != IOMMU_NOTIFIER_NONE) {
>          spapr_tce_set_need_vfio(tbl, true);
>      } else if (old != IOMMU_NOTIFIER_NONE && new == IOMMU_NOTIFIER_NONE) {
> -- 
> 2.26.2

