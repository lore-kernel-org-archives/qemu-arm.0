Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5426383lfq;
        Wed, 30 Sep 2020 04:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsdfEIcnannRgxu1w2/w1CHEBRo6eOmzGT9MlRWHi/JySM/KJT96f+PWfk2cYYjzX7BUv/
X-Received: by 2002:a25:6994:: with SMTP id e142mr2384724ybc.470.1601465234058;
        Wed, 30 Sep 2020 04:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601465234; cv=none;
        d=google.com; s=arc-20160816;
        b=jZmYyMPLvEo1E7zOYiR95VPn1l+hmxXrKs5CHDhPdwSt7U7ekZ/NxgWmwP2QYp8WBP
         GSLAIUDYImd93q2eEbl78Y4Fzd3k23UuKBD76UrPz1oIDFcFS6iC6gcr8XVw/9CZt4yL
         w0bfpiPTUecDVcBHmIFehll3O+93ToWKcniiW+GKM6eURcO9xWPNd3H4ToKoqf/wL+z5
         Dvg6K+nluHPo8fYWcQV+TjWbbKPdjyXnN4EPWstr7D5vbRR0Oiwu/1WkuLQvPh+hhV3F
         1dXdKopYL4kAGrGeo+VZ5wA/wxQtk791ABscS5tSoTXDu7Ljt0tdbtlj8nPJKazl/7Uj
         3TbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=nuwo6wTqmKPM/+6VKyIEOOZ+mB+9GUOk5BUu6NSDWD4=;
        b=kQRvWWLqU1gD9EVvMxlDEeNvnT0BdUwnQd0wmt8XtuuHx6a932RMStHtj1AmCnsxoI
         fXqvpK4dNreoE/2wbFDVKA1WKYGoUoln4+zOVNjcXZeC+uCUQmC5TRm0IjDl8aiATMIp
         Mj6W+se7oM0HvWEq4sd5X3gsJaDwfRtSIRgMr9Wmbc5wFVlhwZuuDKxuXV/+KnDXmgHf
         G7w4Lg4ZVinBscXg5I63EHi6eVfMzcRJwuBhSlndl+BaxkpL2cKTEOtk2AZcD/CyHt8S
         qX3RmtW072nFUWaiQwyR6kdRyTWXa+xLMEVN+kiYEMRRJ4eHxy42buNfvSidRDc0frPO
         rfvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKb9C83y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si1388827ybb.240.2020.09.30.04.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 04:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKb9C83y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNaGP-0000Rp-CR
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 07:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNaGG-0000PF-0k
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 07:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNaGD-0003Y3-Ht
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 07:27:03 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601465220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nuwo6wTqmKPM/+6VKyIEOOZ+mB+9GUOk5BUu6NSDWD4=;
 b=SKb9C83yz7UNLLxh0drNlHXh+cnXmfxkV9w+f/DJeo58Z2vx7RPNXB9nWiOWjxafBgxqsA
 ezuaV8nV4bUxeG/s6Fb0wz8+VSpyQkzFXOdvuGsrdsdErTE1jaibYntrQTMXTCkcwklc2s
 rCTIpbW+7bMuOxsRWO3UNT1SEwwJeMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-X0uurgzANA-wOhnoIUAVmw-1; Wed, 30 Sep 2020 07:26:57 -0400
X-MC-Unique: X0uurgzANA-wOhnoIUAVmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D233E10059AA;
 Wed, 30 Sep 2020 11:26:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C227B5D9D2;
 Wed, 30 Sep 2020 11:26:50 +0000 (UTC)
Date: Wed, 30 Sep 2020 13:26:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 0/5] hw/arm/virt: Introduce kvm-steal-time
Message-ID: <20200930112648.e4teztyiqbweyzh4@kamzik.brq.redhat.com>
References: <20200916092620.19161-1-drjones@redhat.com>
 <20200929144733.2ukomccx5in5r346@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929144733.2ukomccx5in5r346@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oKD93QbB86XR

On Tue, Sep 29, 2020 at 04:47:33PM +0200, Andrew Jones wrote:
> 
> Hi Peter, Eric, and other interested parties,
> 
> Here's a gentle ping for reviewers.

Thanks for the review Eric! I'll send a Linux header update patch and a
rebase of this series with R-b's.

drew

> 
> Thanks,
> drew
> 
> On Wed, Sep 16, 2020 at 11:26:15AM +0200, Andrew Jones wrote:
> > Previous posting:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg727588.html
> > 
> > v3:
> >   - Rebased: 5.2 machine type and kvm32 drop now included
> >   - Switched to using new KVM cap that has been merged upstream
> >   - Picked up some r-b's and some of Eric's comments from v2
> > 
> > KVM supports the ability to publish the amount of time that VCPUs
> > were runnable, but not running due to other host threads running
> > instead, to the guest. The guest scheduler may use that information
> > when making decisions and the guest may expose it to its userspace
> > (Linux publishes this information in /proc/stat). This feature is
> > called "steal time" as it represents the amount of time stolen from
> > a guest by scheduling out its VCPUs. To enable this feature KVM
> > userspace must provide a memory region that will be used to publish
> > the information to the guest. The memory region is typical migratable
> > region. The GPA of the region is given to KVM through a VCPU device
> > ioctl interface. This feature is only available for 64-bit guests
> > per the Arm PVTIME specification (DEN0057A).
> > 
> > This series provides the QEMU support of this feature. It will
> > be enabled by default for 5.2 machine types and later, but may
> > be disabled with a new CPU property "kvm-steal-time".
> > 
> > Thanks,
> > drew
> > 
> > 
> > Andrew Jones (5):
> >   target/arm/kvm: Make uncalled stubs explicitly unreachable
> >   hw/arm/virt: Move post cpu realize check into its own function
> >   hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
> >   DO NOT MERGE: HACK: Add steal time KVM cap to kvm.h
> >   hw/arm/virt: Implement kvm-steal-time
> > 
> >  docs/system/arm/cpu-features.rst |  11 ++++
> >  hw/arm/virt.c                    | 110 ++++++++++++++++++++++---------
> >  include/hw/arm/virt.h            |   5 ++
> >  linux-headers/linux/kvm.h        |   1 +
> >  target/arm/cpu.c                 |   8 +++
> >  target/arm/cpu.h                 |   4 ++
> >  target/arm/kvm.c                 |  16 +++++
> >  target/arm/kvm64.c               |  64 ++++++++++++++++--
> >  target/arm/kvm_arm.h             |  94 ++++++++++++++++++++------
> >  target/arm/monitor.c             |   2 +-
> >  tests/qtest/arm-cpu-features.c   |  25 +++++--
> >  11 files changed, 281 insertions(+), 59 deletions(-)
> > 
> > -- 
> > 2.26.2
> > 
> 
> 

