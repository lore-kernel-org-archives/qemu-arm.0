Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2197975lfa;
        Tue, 13 Oct 2020 11:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ZhsyK3uPS6o/zv1qebs8Ad3QXNjLm36SYGAvuodnJta04yGtZBrFnTCuz7IG/qf5LK1r
X-Received: by 2002:a25:cb53:: with SMTP id b80mr1653324ybg.518.1602612571919;
        Tue, 13 Oct 2020 11:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602612571; cv=none;
        d=google.com; s=arc-20160816;
        b=Za9MAR+vaEgqQ7rcajO7jIz+YNZIF8unpY0malkU9iyAzh5JUVMSNFb7ScFmuHXyPb
         GSLtYMCrlJR67frtvreGQaTEBMH1P4aTTLeKjn/4wGS5W07ALwww9XGCNbXHh6x1k3dw
         cLpa+wQ8vrfqLMXL9XFzlHXRpiT85q/yB6RXhxjY/K9Kuw7W/EUR6iSQknfXVpZJUCPQ
         qbjjxnm2CbwvjjYXGMgMINE0IcuslexPcAxbNKtuqWLFFlZG8M1/HdfRbHLlz8SmHKKJ
         iFTYFWnu6nSat1byzjBFChZKvGjOnNC6nje3oYJH1oJpwYSf4q/CdA6/tI50sMwiLRep
         3c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=vVnYd8w1GiyKi73VjbGybwSaZ+1w801n0cpHH/aHarQ=;
        b=j+xG7mkYGDIsmsTGN1N7jT1/VqHb5el+rOLeELSQEUgVAH9lp6ZZzk1+zNydR4UCiy
         0t0CJJY2ERMPr+YuwiLDf7jKPvOPHw051iZxoyGHIjOtVKy4rTLDqQrPhzloif2TyyIx
         D4nkDkkGLDi+ji+0UkG2z1D41b68PPCtTNbo9tjeAo8FwmEV5VGCY4arp4ZIbxd7GyeQ
         GM/Ec0hR2vZn4l3G3qyERibxhlQe+I1fDjwDjJWDsGyzDwh2ENLDmmQcIeLXcwyIJFpq
         PnwtLnfEJj+9uSSpnFI+C1hvYYeejhIHWsq+vv149XvkzMQ1VT6mwGkSvfnKSex+PynD
         5pJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KdK4FLrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si560846ybt.440.2020.10.13.11.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 11:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KdK4FLrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSOjr-0007xI-Af
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 14:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kSOjL-0007b4-9n
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 14:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kSOjH-0006vQ-2M
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 14:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602612531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vVnYd8w1GiyKi73VjbGybwSaZ+1w801n0cpHH/aHarQ=;
 b=KdK4FLrSgU3o0SiUHI6wPO4v4ox58JqiyNEqbgKFt8oPmtG5cpnJO3M3Zcxx5XmjVXZUN7
 My7elSY2QSRHiOBf3U15lV75pi5n5k3HaxCOJag5J4DavVchhf2NkJqVxQqDPxW5rGKDtj
 rvbLwIG/tDZK4sdbff1gAC6IFJ/ZXTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-OcyazgRnMLK9utnZf7-gBw-1; Tue, 13 Oct 2020 14:08:49 -0400
X-MC-Unique: OcyazgRnMLK9utnZf7-gBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7555818C35A2;
 Tue, 13 Oct 2020 18:08:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 783CA5576C;
 Tue, 13 Oct 2020 18:08:43 +0000 (UTC)
Date: Tue, 13 Oct 2020 20:08:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: Re: [RFC PATCH 00/12] hw/arm/virt: Introduce cpu and cache topology
 support
Message-ID: <20201013180840.yzkncsw34xvwtoll@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <678F3D1BB717D949B966B68EAEB446ED49E0BB94@dggemm526-mbx.china.huawei.com>
MIME-Version: 1.0
In-Reply-To: <678F3D1BB717D949B966B68EAEB446ED49E0BB94@dggemm526-mbx.china.huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 fangying <fangying1@huawei.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oZmuk/KkHFh

On Tue, Oct 13, 2020 at 12:11:20PM +0000, Zengtao (B) wrote:
> Cc valentin
> 
> > -----Original Message-----
> > From: Qemu-devel
> > [mailto:qemu-devel-bounces+prime.zeng=hisilicon.com@nongnu.org]
> > On Behalf Of Ying Fang
> > Sent: Thursday, September 17, 2020 11:20 AM
> > To: qemu-devel@nongnu.org
> > Cc: peter.maydell@linaro.org; drjones@redhat.com; Zhanghailiang;
> > Chenzhendong (alex); shannon.zhaosl@gmail.com;
> > qemu-arm@nongnu.org; alistair.francis@wdc.com; fangying;
> > imammedo@redhat.com
> > Subject: [RFC PATCH 00/12] hw/arm/virt: Introduce cpu and cache
> > topology support
> > 
> > An accurate cpu topology may help improve the cpu scheduler's
> > decision
> > making when dealing with multi-core system. So cpu topology
> > description
> > is helpful to provide guest with the right view. Cpu cache information
> > may
> > also have slight impact on the sched domain, and even userspace
> > software
> > may check the cpu cache information to do some optimizations. Thus
> > this patch
> > series is posted to provide cpu and cache topology support for arm.
> > 
> > To make the cpu topology consistent with MPIDR, an vcpu ioctl
> 
> For aarch64, the cpu topology don't depends on the MPDIR.
> See https://patchwork.kernel.org/patch/11744387/ 
>

The topology should not be inferred from the MPIDR Aff fields,
but MPIDR is the CPU identifier. When describing a topology
with ACPI or DT the CPU elements in the topology description
must map to actual CPUs. MPIDR is that mapping link. KVM
currently determines what the MPIDR of a VCPU is. If KVM
userspace is going to determine the VCPU topology, then it
also needs control over the MPIDR values, otherwise it
becomes quite messy trying to get the mapping right.

Thanks,
drew

