Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1373862lfa;
        Fri, 16 Oct 2020 03:07:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0tBhHeC5SkUqQbJwB7IXbJn3Z33vkiNa7OVrvh6pnAgbBYBFmZtKgluOmmbswmQpZmH2W
X-Received: by 2002:a0c:8d84:: with SMTP id t4mr3008286qvb.36.1602842858523;
        Fri, 16 Oct 2020 03:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602842858; cv=none;
        d=google.com; s=arc-20160816;
        b=r8w44arYz+oF4b3Vj2KYKna57Yzic55AUODD5+kaP9WDXMAm6Yxuam3dSFSRNZCW0q
         DyZSAeKeVrKRJUMsRf3SuWmeJve5rJRQduN32wPhjpHff5EHqFoxd2VA8jGZFNz2NdZt
         BkCHY7LTC53/gLJXdcAZ9S4W/YxWTOd5NMwgUPMR5fZx5PSuvyhETQOV3y+EnIaIH9Mt
         SLU2Cj/Q1pqGBmsmb0dY4bspD3JuqnfzfJ6OLNYZb9Av4sCcR4rz8/0Y9mh+LN7VHCwB
         JkogeAByaYUYzQrIAKhYqOMSBPzeO1hxeKaldQbvuJaAVJ8FhOQAMS2G5OSvSCmbpgDi
         OQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pS/7/1Hx5WmhRrIlsEQ55ucPyMcTQrVbVu2Ntnop5MY=;
        b=JHa4Z5/R0uoisw79/P68QPP26nPUCmr8uAM25i1W0ji7j//Aw/Xsp4Li0T7MTH5Afh
         faBzDDM23pvCZgYXtLEuG9tYmD2T4QejsNsOdRU+rT6jJNkV9LW3LGp/KErQk2IfdrVF
         p63hfDSJC0MnZ+m3Je4qJCmrWlkOYPhKPWS6uHplLxBrBMCDt0iwDaxTGyZpbPdKHv38
         p/1KrV5lNtGJjH0iLep8UKsVR7HejAFDRpyR3giCMAkiyw+Gz2/cgNnYUlNn9Hyj7AwF
         cHecqQtOzSGZthtxxcDLCXYW5JvLHtacDzGkSZ5bgvO0EYdeP5UEKOZZgETgV1Lxi0xU
         QWlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cGohm9IX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si1117577qkj.374.2020.10.16.03.07.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 03:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cGohm9IX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTMe9-00025v-Tw
	for alex.bennee@linaro.org; Fri, 16 Oct 2020 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kTMdo-00024m-TC
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 06:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kTMdl-000256-UI
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 06:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602842831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pS/7/1Hx5WmhRrIlsEQ55ucPyMcTQrVbVu2Ntnop5MY=;
 b=cGohm9IXXranUuYWU9TgCFxJiLp+w/vaNRs0MSOZfH7SMl+zBj2R/3zIV3FG5QGKI5HHPA
 N4CyuJmKBPvTztP6VCiToiE16jpsnTUYjchJ8o5YUyrvpUdnkEdaXO4qqrG6MCoP41dVU8
 jcz6AoCEmzdIMGA+6Uyyh3FsnCd638U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-FlTR62XQNPOJI53NFO-lTQ-1; Fri, 16 Oct 2020 06:07:09 -0400
X-MC-Unique: FlTR62XQNPOJI53NFO-lTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ACA886ABD2;
 Fri, 16 Oct 2020 10:07:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0496EF54;
 Fri, 16 Oct 2020 10:07:04 +0000 (UTC)
Date: Fri, 16 Oct 2020 12:07:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 00/12] hw/arm/virt: Introduce cpu and cache topology
 support
Message-ID: <20201016100701.7oojzwpgh6ka4fq6@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <678F3D1BB717D949B966B68EAEB446ED49E0BB94@dggemm526-mbx.china.huawei.com>
 <20201013180840.yzkncsw34xvwtoll@kamzik.brq.redhat.com>
 <7491ca46-92b2-09e0-67a8-55a90203b9cc@huawei.com>
 <20201015075900.ukz3y6cl2vhwmctx@kamzik.brq.redhat.com>
 <4b9472ec-b90a-8b22-16ba-670e7298c9c9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <4b9472ec-b90a-8b22-16ba-670e7298c9c9@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q39iuCZcHynM

On Fri, Oct 16, 2020 at 05:40:02PM +0800, Ying Fang wrote:
> 
> 
> On 10/15/2020 3:59 PM, Andrew Jones wrote:
> > On Thu, Oct 15, 2020 at 10:07:16AM +0800, Ying Fang wrote:
> > > 
> > > 
> > > On 10/14/2020 2:08 AM, Andrew Jones wrote:
> > > > On Tue, Oct 13, 2020 at 12:11:20PM +0000, Zengtao (B) wrote:
> > > > > Cc valentin
> > > > > 
> > > > > > -----Original Message-----
> > > > > > From: Qemu-devel
> > > > > > [mailto:qemu-devel-bounces+prime.zeng=hisilicon.com@nongnu.org]
> > > > > > On Behalf Of Ying Fang
> > > > > > Sent: Thursday, September 17, 2020 11:20 AM
> > > > > > To: qemu-devel@nongnu.org
> > > > > > Cc: peter.maydell@linaro.org; drjones@redhat.com; Zhanghailiang;
> > > > > > Chenzhendong (alex); shannon.zhaosl@gmail.com;
> > > > > > qemu-arm@nongnu.org; alistair.francis@wdc.com; fangying;
> > > > > > imammedo@redhat.com
> > > > > > Subject: [RFC PATCH 00/12] hw/arm/virt: Introduce cpu and cache
> > > > > > topology support
> > > > > > 
> > > > > > An accurate cpu topology may help improve the cpu scheduler's
> > > > > > decision
> > > > > > making when dealing with multi-core system. So cpu topology
> > > > > > description
> > > > > > is helpful to provide guest with the right view. Cpu cache information
> > > > > > may
> > > > > > also have slight impact on the sched domain, and even userspace
> > > > > > software
> > > > > > may check the cpu cache information to do some optimizations. Thus
> > > > > > this patch
> > > > > > series is posted to provide cpu and cache topology support for arm.
> > > > > > 
> > > > > > To make the cpu topology consistent with MPIDR, an vcpu ioctl
> > > > > 
> > > > > For aarch64, the cpu topology don't depends on the MPDIR.
> > > > > See https://patchwork.kernel.org/patch/11744387/
> > > > > 
> > > > 
> > > > The topology should not be inferred from the MPIDR Aff fields,
> > > 
> > > MPIDR is abused by ARM OEM manufactures. It is only used as a
> > > identifer for a specific cpu, not representation of the topology.
> > 
> > Right, which is why I stated topology should not be inferred from
> > it.
> > 
> > > 
> > > > but MPIDR is the CPU identifier. When describing a topology
> > > > with ACPI or DT the CPU elements in the topology description
> > > > must map to actual CPUs. MPIDR is that mapping link. KVM
> > > > currently determines what the MPIDR of a VCPU is. If KVM
> > > 
> > > KVM currently assigns MPIDR with vcpu->vcpu_id which mapped
> > > into affinity levels. See reset_mpidr in sys_regs.c
> > 
> > I know, but how KVM assigns MPIDRs today is not really important
> > to KVM userspace. KVM userspace shouldn't depend on a KVM
> > algorithm, as it could change.
> > 
> > > 
> > > > userspace is going to determine the VCPU topology, then it
> > > > also needs control over the MPIDR values, otherwise it
> > > > becomes quite messy trying to get the mapping right.
> > > If we are going to control MPIDR, shall we assign MPIDR with
> > > vcpu_id or map topology hierarchy into affinity levels or any
> > > other link schema ?
> > > 
> > 
> > We can assign them to whatever we want, as long as they're
> > unique and as long as Aff0 is assigned per the GIC requirements,
> > e.g. GICv3 requires that Aff0 be from 0 to 0xf. Also, when
> > pinning VCPUs to PCPUs we should ensure that MPIDRs with matching
> > Aff3,Aff2,Aff1 fields should actually be peers with respect to
> > the GIC.
> 
> Still not clear why vCPU's MPIDR need to match pPCPU's GIC affinity.
> Maybe I should read spec for GICv3.

Look at how IPIs are efficiently sent to "peers", where the definition
of a peer is that only Aff0 differs in its MPIDR. But, gicv3's
optimizations can only handle 16 peers. If we want pinned VCPUs to
have the same performance as PCPUS, then we should maintain this
Aff0 limit.

Thanks,
drew

> 
> > 
> > We shouldn't try to encode topology in the MPIDR in any way,
> > so we might as well simply increment a counter to assign them,
> > which could possibly be the same as the VCPU ID.
> 
> Hmm, then we can leave it as it is.
> 
> > 
> > Thanks,
> > drew
> > 
> > .
> > 
> 

