Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp102220njb;
        Fri, 7 Feb 2025 02:32:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvp4BWNPjZt/5ElKeumxMc3CakxE5K9Y//Jj8/i+UGbCShqPXOAJvA1k562M2GHc+TT26A/LdzjkQW+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ9IcnFemuXlZ8Kl1pC+x9z2vmf5tM5ofUqfVODYiflvNMOHGFxq7G3KbIDq3gD/vVd/pc
X-Received: by 2002:ac8:7d91:0:b0:456:919a:11e4 with SMTP id d75a77b69052e-471688d7098mr29924811cf.20.1738924365491;
        Fri, 07 Feb 2025 02:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738924365; cv=none;
        d=google.com; s=arc-20240605;
        b=cBg/rhxs2xRiRtPhVT57tIqTNjJ19mcuk7YV8NOYEwazRXd0m3oEReVsoniOizYxCj
         GFlikIlGxgfLSweYqkZfRy94jLx0vW1zYMjPiU+W0HDD3JEi4H0wmQfwpr4DVxqbeaRH
         XuO+xP3q7KVEj4eH9DMyG8iXPDrizy1xDYO4F12OKibk/HzTRZn4qyG1R4LR1yf1j6oE
         at6PEthgDsMLh99pkBk0M/iYBeo8iLe0JomuJ1mnMbe6RvEF3dnfe4U4LnusVRQHSZEz
         jRkmzU1W+KvwJnEItTOS17o3yzMoFqkEjQpwMSV81a8VSI5DBMtsbkPx95j041BfzHN4
         +iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cYON/ac7rrwzuIo7pa6yNVlgoKhgQR6vYpbr0jgJN6Q=;
        fh=onmIvNudB7oyAGNoEVnvU6r0KTQ21jE2j09Zzry1QTw=;
        b=Rmw8LkLyK2Oexp/NLdSslBPHzxzp8+f7wdtTHrrFGHSdqktUwFiPB9Awty7L+qCCFH
         4u1VOpCyF4XsQcEO8/hOM68YCn36GBDRb7A5KOjidJrfUEM2/yRnWbvTY6a4P9DV5b/3
         3J3hXJjeS1suPjt7bYFpZ+89fddH051QZnT8slMs6KxXQMx+rAjDUjgdDVBZZvZX0hDO
         Mr3YyVnlt9DuswlFxoucfmK5PzkskM/mdKUZ97iiiZLdxG4ZerPLLYZ4VC8ENUIJvROh
         zuyShV00jbhaRWm2BfFFoI76gmLHTTo4c1v0jPNk4TzR/MIG9KXO559oome3+X/01Agd
         t8zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eazl51Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b93fb5si29285801cf.430.2025.02.07.02.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 02:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eazl51Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgLen-0002PA-FM; Fri, 07 Feb 2025 05:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tgLel-0002Ok-Io
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 05:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tgLej-0003I5-R5
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 05:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738924336;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYON/ac7rrwzuIo7pa6yNVlgoKhgQR6vYpbr0jgJN6Q=;
 b=Eazl51KghH5wA38gm15cdb4scKHcdzRl7Bld6xlxZoJQ+S88vIxQMPrdFZpg03asMqR6rI
 glKF5VcYUJQTyUwxXpTW2O9Yb1m4m7tnIHu/z5oOsOF9ZmrQf1SGiXXf+kg3+DdyLGeg0I
 rwH1X1+0D21qjv478BMP0+G7CqduVQ4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-WWoMm5FXPCeMH1TCHjxWqw-1; Fri,
 07 Feb 2025 05:32:08 -0500
X-MC-Unique: WWoMm5FXPCeMH1TCHjxWqw-1
X-Mimecast-MFC-AGG-ID: WWoMm5FXPCeMH1TCHjxWqw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 600FB1800876; Fri,  7 Feb 2025 10:32:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8EB561955F1B; Fri,  7 Feb 2025 10:31:55 +0000 (UTC)
Date: Fri, 7 Feb 2025 10:31:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z6XhF7VTw9jnIXCb@redhat.com>
References: <Z6TtCLQ35UI12T77@redhat.com> <20250206174647.GA3480821@nvidia.com>
 <Z6T3cX_fM-aeYbMI@redhat.com> <20250206175843.GI2960738@nvidia.com>
 <13b1d8b97a314cb28b87563fa9b45299@huawei.com>
 <20250206181306.GK2960738@nvidia.com>
 <02a0080a4a1642d69b7f5dd4707a5b3d@huawei.com>
 <20250206182201.GL2960738@nvidia.com>
 <Z6Ucj/u3wt9muakb@Asurada-Nvidia>
 <9112ba0694bd42199e279e37fbfc9dd0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9112ba0694bd42199e279e37fbfc9dd0@huawei.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: gSgYMGJTZrAa

On Fri, Feb 07, 2025 at 10:21:17AM +0000, Shameerali Kolothum Thodi wrote:
> 
> 
> > -----Original Message-----
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Thursday, February 6, 2025 8:33 PM
> > To: Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; Daniel P. Berrangé
> > <berrange@redhat.com>; Jason Gunthorpe <jgg@nvidia.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; ddutile@redhat.com;
> > Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> > <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> > Jonathan Cameron <jonathan.cameron@huawei.com>;
> > zhangfei.gao@linaro.org; nathanc@nvidia.com
> > Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
> > nested SMMUv3
> > 
> > On Thu, Feb 06, 2025 at 02:22:01PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Feb 06, 2025 at 06:18:14PM +0000, Shameerali Kolothum Thodi
> > wrote:
> > >
> > > > > So even if you invent an iommu ID we cannot accept it as a handle to
> > > > > create viommu in iommufd.
> > > >
> > > > Creating the vIOMMU only happens when the user does a  cold/hot
> > plug of
> > > > a VFIO device. At that time Qemu checks whether the assigned id
> > matches
> > > > with whatever the kernel tell it.
> > >
> > > This is not hard up until the guest is started. If you boot a guest
> > > without a backing viommu iommufd object then there will be some more
> > > complexities.
> > 
> > Yea, I imagined that things would be complicated with hotplugs..
> > 
> > On one hand, I got the part that we need some fixed link forehand
> > to ease migration/hotplugs.
> > 
> > On the other hand, all IOMMUFD ioctls need a VFIO device FD, which
> > brings the immediate attention that we cannot even decide vSMMU's
> > capabilities being reflected in its IDR/IIDR registers, without a
> > coldplug device -- if we boot a VM (one vSMMU<->pSMMU) with only a
> > hotplug device, the IOMMU_GET_HW_INFO cannot be done during guest
> 
> Right. I forgot about the call to smmu_dev_get_info() during the reset.
> That means we need at least one dev per Guest SMMU during Guest
> boot :(

That's pretty unpleasant as a usage restriction. It sounds like there
needs to be a way to configure & control the vIOMMU independantly of
attaching a specific VFIO device.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

