Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp4188669qvk;
        Mon, 24 Aug 2020 09:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKjG1Nv68XG3dN94lCJbUnrtJwnWnXc2iK54cUHbLY7+tb+FSbWAYvy94fQHChJdmejaW3
X-Received: by 2002:a25:f304:: with SMTP id c4mr7615737ybs.209.1598286064749;
        Mon, 24 Aug 2020 09:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598286064; cv=none;
        d=google.com; s=arc-20160816;
        b=WmmXRI1zUr6rfsdpu6WvQ9+CX+YFbrCwdZAUuFlYuxyHzd8H3St8GkT8n8W84STCCN
         3tLkZvm1NTVNoGmIZwAxes7WQEukeIQzhyzBFDbp7TN4veGWQ1f43hZ68ylmoPkZclyW
         neS5fThJoke8Hjr3Wr0ogFcWQe1vg43VuGjKrk6r8rqm2moqVkCquAww9W7hSAPE9Cjh
         Jgfn14Qrv27782pCrE3aLCsub3OdJckHxSvOAbCY5DfcoyPPN8Qc3tpZy9EexX2qKgCs
         40fJifLcOHPALB9bGCEsBEyxtaPGjviGpB7BGfQ0Ds0WcFpZd8QZehKy/adnHHps7uEV
         u3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=EZPqO0i9nwV9cKVEOUZrqTFf+kRqEfBSBGBt9p29VPU=;
        b=bg2izJ7hvy8cTFTfV+8CG7f9LgO5xDaoHv3WxOXrg7DSYZInjVySwPTuDbPoJvpsGp
         w+uvhhGaINnsvvKBsdpp6WxJbDISPZep+gkyDA4hEwQN92Q4kh9GcSTZQrVpDQH+xHch
         91xAeTjC70rp/pSRNNeMXMdaP9fcVsIGSPpCgVX66Odx24sICg5jkFZolujIWTzMHn5b
         lVb5X5cPePUl4RFdI0xlY45HqhmveILx3ZPUvRB3hno4NLYg0CHJRTiyAgetxe91HXUb
         tddN9XbSxtrf07RSImNXDL8/BEeFfR1PJ+AbP+sp0OcTQRZMrAM5Ck7eUwO7bvCyj9OC
         pdNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A031VXBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si12006502ybh.172.2020.08.24.09.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 09:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A031VXBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAFDU-0007qm-7d
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAFDL-0007ou-GI
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:20:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54249
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAFDJ-0004f1-Tz
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598286052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZPqO0i9nwV9cKVEOUZrqTFf+kRqEfBSBGBt9p29VPU=;
 b=A031VXBuPqfmFc5XSYFyhmDsRteFCj6/fULWdklZCPhYdpnouLw/bdqfjMjzrXOBKcLihh
 L+5eiwuKM98qIcuC6SRzg0UQLM0hDW0ewHIxAFCNQl34KUQ+YuM/QckB+fF3Am8WiyhFjq
 nKvg5uwlHNYaseBfx4vPFIcqbsoJEcs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-e5S-JYE8MI6p5y2V52A7NA-1; Mon, 24 Aug 2020 12:20:48 -0400
X-MC-Unique: e5S-JYE8MI6p5y2V52A7NA-1
Received: by mail-qt1-f199.google.com with SMTP id q6so2570040qtn.15
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 09:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EZPqO0i9nwV9cKVEOUZrqTFf+kRqEfBSBGBt9p29VPU=;
 b=Ta3QMY49LJ4DMzRYCKJyvvQrgfBV/fCRgLosGW2I3NQmr69kwrWq1xE2NLiWCIriN4
 aiVLYkyhhxRDuXc2GIRk20kJX7lkDA16FveIA4emftoBB2Gx62EDPmH9MSUbusEcD3kA
 UXy6HQJ1a9EtooqDk2xAwffafsI+Ltowe3q14G1QsoIC5PsCJibkp2N9Tb+2p3r93s4+
 Fdsiq7B8Z3CLz8H70CDaLqczK1LEmgqaNGyTACcQHHobvXzbm0vrCC+TfSer7lGKpXLT
 OsxJGFr/q1IynnbHBru4HCuHxSmH6BS2rMvHyIJImR4MRH4c+fb5/b1yEP2XJQNU4Lo5
 T7WA==
X-Gm-Message-State: AOAM530izCV130sb58vhDjy/YUGxPy39JvnTyel2G2L3brj0IkCNZCiV
 XbdMISPoQSIafkUVF2ThqhrghjW6UByklgtgAzGnLL3SqbdxfiaAU3yOwK8iQhKI7FWRrjerSVn
 0wBhdocrK1F6h
X-Received: by 2002:a05:6214:1709:: with SMTP id
 db9mr5617591qvb.142.1598286044395; 
 Mon, 24 Aug 2020 09:20:44 -0700 (PDT)
X-Received: by 2002:a05:6214:1709:: with SMTP id
 db9mr5617562qvb.142.1598286044064; 
 Mon, 24 Aug 2020 09:20:44 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id j72sm9555088qke.20.2020.08.24.09.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 09:20:42 -0700 (PDT)
Date: Mon, 24 Aug 2020 12:20:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v5 3/3] intel_iommu: Do not notify regular iotlb to
 device-iotlb notifiers
Message-ID: <20200824162045.GA6424@xz-x1>
References: <20200824104738.20664-1-eperezma@redhat.com>
 <20200824104738.20664-4-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200824104738.20664-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:21:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U2+hYk7gPImL

On Mon, Aug 24, 2020 at 12:47:38PM +0200, Eugenio Pérez wrote:
> This improves performance in case of netperf with vhost-net:
> * TCP_STREAM: From 1374.81Mbit/s to 1845Mbit/s (37%)
> * TCP_RR: From 6559.36 trans/s to 7916.29/s (21%)
> * UDP_RR: From 6705.39 trans/s to 8199.39/s (22%)
> * UDP_STREAM: No change observed (not significant 0.1% improvement)

Good to know that we can get such a perf boost by removing the extra
invalidations!

> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 2ad6b9d796..d539a9f281 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1959,6 +1959,12 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
>      vtd_iommu_unlock(s);
>  
>      QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
> +        if (vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_DEVIOTLB) {
> +            /* If IOMMU memory region is DEVICE IOTLB type, it does not make
> +             * sense to send regular IOMMU notifications. */
> +            continue;
> +        }

Though here IMHO a cleaner approach (rather than checking explicitly against
DEVIOTLB flag) is to add a notification type into IOMMUTLBEntry.

Then for domain invalidation, the caller is responsible to pass the type
IOMMU_NOTIFIER_UNMAP into the type field. memory_region_notify_iommu_one() will
automatically skip the message if not registerd by the notifier.

Also, it would be nice to have this new type before or when introducing the
DEVIOTLB message, otherwise the DEVIOTLB patch can be still slightly confusing
by itself when notified as UNMAP.

So here's some patch layout I'm thinking:

  - patch 1: rename function, we can keep it

  - patch 2: introduce "type" for IOMMUTLBEntry, so far we only have MAP/UNMAP.
    Modify all callers of memory_region_notify_iommu*() to fill in the type
    correctly into IOMMUTLBEntry with map/unmap.  Won't hurt if we still keep
    filling in UNMAP even for DEVIOTLB since that's after all the same old
    behavior.

  - patch 3: introduce DEVIOTLB, switch the type field of dev-iotlb
    notifications to the new type and let vhost registers only to that.

  - patch 4: at last, fix the assertion since we've got the DEVIOTLB messages.

Would this be slightly cleaner?

Thanks,

-- 
Peter Xu

