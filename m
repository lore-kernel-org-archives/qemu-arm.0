Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1724317njb;
        Thu, 6 Feb 2025 10:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVy6aTpySjY7sWGKkmeNq6tfNEOmIz1pNs+F9eGm6rK093yeH65i5yGM7uVizkKa914KP16b57/Jf9Nmg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBwDFKzWf6K+x/qiF0vE2KSOMsABL4j6pZXTlAJigA9w/EsA0XPLglWvV8GI9b3N2RI4KS
X-Received: by 2002:a05:622a:2b47:b0:467:6c18:9855 with SMTP id d75a77b69052e-47167a523f2mr4062401cf.27.1738865921721;
        Thu, 06 Feb 2025 10:18:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738865921; cv=none;
        d=google.com; s=arc-20240605;
        b=JN0wEQd/U/Bexy6oYdOPuQYO/3rXf23/o8pPT6EPp67Um/p3qRM/9bqU0OBkykwDKO
         O/f7yafZZfoErL+EjfvCuRPNRMNxgMEjbo8gbMGV/jwwbQ3Gjn0lS8V5CAaKhLJeOcVK
         2RKPgsiViA1AG2CYGp2CACjFhEOCdfoAw4fJ3eA5p2HUY2JGmvZ94D2nrg9GoPJEJchQ
         WAvkum9VwI9uzM9/fc+Df+AcxoCkskVQTHCIMIbz8970eDVHkbDISzYQeOB4jhXYK8M+
         pdCRSJr5PLdnaa8ege4TUsBlH21hZRTLHX1/SUkYkwo8A7I7Tq3XuRH8k/Ef/wPTu8im
         teXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kqhvfeo5m3+UNdRAo3LDzsdwGsCk3HFH0WEizYMVF8Y=;
        fh=SM/55c4tu8kbdFn3L58O4WD3COoDgdKdTY71VD60UoI=;
        b=WMT/X5L6hhstQ/wb7LJAn0F8rMFEmZLUFjxD3EBb2sX+CvPN4hSYmT+Zi1lRVfxPco
         auz54n0B8Duhwxpby7wJbcEb1dhfRYJOd2FvgX/7rbUEhNjgu0kEAxyxziwvPDVWNzlx
         /oeFHvYsgl7WFxqGHUxgyMNHaLtGSHcvMqX+V3neUcI983T/JDS/vudejQtd0JZAAAXC
         Gf1CKanY04Lk2jZYoztLPbhVDuzL72s3xi6P99T9ckFf7orQNqcsvPYPFIyJLOPWHBE4
         uu2jHIw6QwM+mGwzp7N+f4yUaTrANSy+W/S/NK7awRGZmKozmfPffeSMG2O/nvL6bLHJ
         hFrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cogLJXwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be540bsi15014781cf.632.2025.02.06.10.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 10:18:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cogLJXwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg6SM-0007Yg-6b; Thu, 06 Feb 2025 13:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg6SJ-0007Xp-8z
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 13:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg6SH-0006Wy-Id
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 13:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738865904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqhvfeo5m3+UNdRAo3LDzsdwGsCk3HFH0WEizYMVF8Y=;
 b=cogLJXwNcFjmrq6mJ+SiMqEh6SKDyD5PQztHN4Lx+AYh/06D+JDLBoGiuVNLwJFpHcZ1W0
 TLwwmLR/vN+pxu0JBEB+UFBkb3SpU/OqIvaV+2hLvSO1jiOdkQ60gZpyXyefSWIQN81c43
 oeJn7Fsj3oS5CZLEXLsFjkrWWxm6dXo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-fzQuamUoNfGYZsc9B0sb1A-1; Thu,
 06 Feb 2025 13:18:21 -0500
X-MC-Unique: fzQuamUoNfGYZsc9B0sb1A-1
X-Mimecast-MFC-AGG-ID: fzQuamUoNfGYZsc9B0sb1A
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C9F719560A7; Thu,  6 Feb 2025 18:18:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1D891956051; Thu,  6 Feb 2025 18:18:12 +0000 (UTC)
Date: Thu, 6 Feb 2025 18:18:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z6T84XByaY0RD8TR@redhat.com>
References: <47d2c2556d794d87abf440263b2f7cd8@huawei.com>
 <Z6SQ3_5bcqseyzVa@redhat.com>
 <f898b6de4a664fe8810b06b7741e3120@huawei.com>
 <Z6TLSdwgajmHVmGH@redhat.com>
 <71116749d1234ab48a205fd2588151ec@huawei.com>
 <20250206170238.GG2960738@nvidia.com> <Z6TtCLQ35UI12T77@redhat.com>
 <20250206174647.GA3480821@nvidia.com> <Z6T3cX_fM-aeYbMI@redhat.com>
 <20250206175843.GI2960738@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206175843.GI2960738@nvidia.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HsaPcdG3l/ki

On Thu, Feb 06, 2025 at 01:58:43PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 06, 2025 at 05:54:57PM +0000, Daniel P. Berrangé wrote:
> > > > We shouldn't assume any VFIO device exists in the QEMU cnofig at the time
> > > > we realize the virtual ssmu. I expect the SMMU may be cold plugged, while
> > > > the VFIO devices may be hot plugged arbitrarly later, and we should have
> > > > the association initialized the SMMU is realized.
> > > 
> > > This is not supported kernel side, you can't instantiate a vIOMMU
> > > without a VFIO device that uses it. For security.
> > 
> > What are the security concerns here ?
> 
> You should not be able to open iommufd and manipulate iommu HW that
> you don't have a VFIO descriptor for, including creating physical
> vIOMMU resources, allocating command queues and whatever else.
> 
> Some kind of hot plug smmu would have to create a vSMMU without any
> kernel backing and then later bind it to a kernel implementation.

Ok, so if we give the info about the vSMMU <-> pSMMU binding to
QEMU upfront, it can delay using it until the point where the kernel
accepts it. This at least gives a clear design to applications outside
QEMU, and hides the low level impl details to inside QEMU.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

