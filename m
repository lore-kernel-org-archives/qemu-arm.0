Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp471825lfq;
        Thu, 17 Sep 2020 04:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+ZuvjtoXewUQxy34fLVulZffUh4rtTJh7fX8t7IjzF6hCQfLBmjgGsbt+eGstaPOJFEbm
X-Received: by 2002:a25:b31b:: with SMTP id l27mr9139694ybj.166.1600340513880;
        Thu, 17 Sep 2020 04:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600340513; cv=none;
        d=google.com; s=arc-20160816;
        b=VXa+wGkOMjpWyE/9ZnmegdJlmx+O2Np3oXVpJ+t/HXeTLNLBi33xRWg/frw+Gs0aV5
         2+Z2Ie3hnbPF9Ivd9bsy8cORPAwJ02Y16uR8fXMCmkTGcu0czZcU0mvlh6fCLPZ3d782
         uA37NAzRERA4YdAkJP7Ni0bc1PPjt03Kv22R3nPJP+XhMMx6GbraHbSmz14jrXWCPCGL
         6JyG0CPbBfac0YFRlKZievRPzSpLNXfWyPIKxkY7ER85kA9unER+BF0/eJ+TSp82RKSH
         fJXb7fsaWT2K5V9BOdLQxTJUBmGC+OUxdMIciLcp59nHK7uwESHt4Ec5Wy4anKHfFPgh
         opxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ej/hvssTnJCJxA3zx+Yhtavtrh7pF2Z5g5HrQ24eKvg=;
        b=wCfuY5pPdmR+Fq4n3MMIpTaStSWQcWNQjWbYxNq+hDd8c7184GUGVSxmCMn1Gnfp9s
         cGFRJ556l2BbU6y3bdXz0G8Y3am8qR6SWxhiSxoRmbXhfWP28wg1PIQJ014OmvJBAlHH
         Zp9+maO6MeIVx0Z1xdLaGUvJ2/rbAkP9t+pOC1ThyybV5qPUGHM7ZHpv8vJPqM8vYGac
         FiPi/T+RbBQ1JCPbL2U3BXzvfhJM4cW2FcH8gWJAJAD53QXah4nAaghmv8RQ0e0DG0W/
         WsI+w72UcOGs4HUrxuY6yzG2cHjN204rFyhq3CzxwdlGUDne7SnPrvWfLRPOzwmpVzst
         nnvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SU0n1w8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p130si20805879yba.25.2020.09.17.04.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 04:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SU0n1w8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIrfl-0007Mn-7v
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 07:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIrfY-0007La-Bp
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 07:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIrdi-0001AJ-A7
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 07:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600340385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ej/hvssTnJCJxA3zx+Yhtavtrh7pF2Z5g5HrQ24eKvg=;
 b=SU0n1w8chtuuC/o9EhUz3jKM5DvNfWotkYgNTp6EvQ5m91nwZAjYY4H3y76pmCLSTzmUYi
 aHiDcRz79mFORqUPNkeOdA18wm+fX+OVyXq2EBDJKmhb4q0blAQUNFViZkbH9iQ4zUWfp3
 ojXr44dyDTVholBe58I291YuLCArJ7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-KxbfH2Y5PI2GfCXGxIPvPw-1; Thu, 17 Sep 2020 06:59:41 -0400
X-MC-Unique: KxbfH2Y5PI2GfCXGxIPvPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9E6AD682;
 Thu, 17 Sep 2020 10:59:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1FC1002D5D;
 Thu, 17 Sep 2020 10:59:37 +0000 (UTC)
Date: Thu, 17 Sep 2020 12:59:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 02/12] target/arm/kvm64: make MPIDR consistent with
 CPU Topology
Message-ID: <20200917105934.3rki6xwv5t4glxxi@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-3-fangying1@huawei.com>
 <20200917075330.7sx3xm7gd4mwqqtq@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200917075330.7sx3xm7gd4mwqqtq@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6YdWdpcuUHd

On Thu, Sep 17, 2020 at 09:53:35AM +0200, Andrew Jones wrote:
> On Thu, Sep 17, 2020 at 11:20:23AM +0800, Ying Fang wrote:
> > MPIDR helps to provide an additional PE identification in a multiprocessor
> > system. This patch adds support for setting MPIDR from userspace, so that
> > MPIDR is consistent with CPU topology configured.
> > 
> > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > ---
> >  target/arm/kvm64.c | 46 ++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 38 insertions(+), 8 deletions(-)
> > 
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index ef1e960285..fcce261a10 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -757,10 +757,46 @@ static int kvm_arm_sve_set_vls(CPUState *cs)
> >  
> >  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
> >  
> > +static int kvm_arm_set_mp_affinity(CPUState *cs)
> > +{
> > +    uint64_t mpidr;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +
> > +    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_MP_AFFINITY)) {
> > +        /* Make MPIDR consistent with CPU topology */
> > +        MachineState *ms = MACHINE(qdev_get_machine());
> > +
> > +        mpidr = (kvm_arch_vcpu_id(cs) % ms->smp.threads) << ARM_AFF0_SHIFT;
> 
> We should query KVM first to determine if it wants guests to see their PEs
> as threads or not. If not, and ms->smp.threads is > 1, then that's an
> error. And, in any case, if ms->smp.threads == 1, then we shouldn't waste
> aff0 on it, as that could reduce IPI broadcast performance.
> 
> > +        mpidr |= ((kvm_arch_vcpu_id(cs) / ms->smp.threads % ms->smp.cores)
> > +                                    & 0xff) << ARM_AFF1_SHIFT;
> > +        mpidr |= (kvm_arch_vcpu_id(cs) / (ms->smp.cores * ms->smp.threads)
> > +                                    & 0xff) << ARM_AFF2_SHIFT;

Also, as pointed out in the KVM thread, we should not be attempting to
describe topology with the MPIDR at all. Alexandru pointed out [*] as
evidence for that.

However, we do need to consider the limits on Aff0 imposed by the GIC.
See hw/arm/virt.c:virt_cpu_mp_affinity() for how we currently do it
for TCG. We should do something similar for KVM guests when we're taking
full control of the MPIDR.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=3102bc0e6ac7

Thanks,
drew

> > +
> > +        /* Override mp affinity when KVM is in use */
> > +        cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
> > +
> > +        /* Bit 31 is RES1 indicates the ARMv7 Multiprocessing Extensions */
> > +        mpidr |= (1ULL << 31);
> > +        return kvm_vcpu_ioctl(cs, KVM_ARM_SET_MP_AFFINITY, &mpidr);
> > +    } else {
> > +        /*
> > +         * When KVM_CAP_ARM_MP_AFFINITY is not supported, it means KVM has its
> > +         * own idea about MPIDR assignment, so we override our defaults with
> > +         * what we get from KVM.
> > +         */
> > +        int ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
> > +        if (ret) {
> > +            error_report("failed to set MPIDR");
> 
> We don't need this error, kvm_get_one_reg() has trace support already.
> Anyway, the wording is wrong since it says 'set' instead of 'get'.
> 
> > +            return ret;
> > +        }
> > +        cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
> > +        return ret;
> > +    }
> > +}
> > +
> >  int kvm_arch_init_vcpu(CPUState *cs)
> >  {
> >      int ret;
> > -    uint64_t mpidr;
> >      ARMCPU *cpu = ARM_CPU(cs);
> >      CPUARMState *env = &cpu->env;
> >  
> > @@ -814,16 +850,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          }
> >      }
> >  
> > -    /*
> > -     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
> > -     * Currently KVM has its own idea about MPIDR assignment, so we
> > -     * override our defaults with what we get from KVM.
> > -     */
> > -    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
> > +    ret = kvm_arm_set_mp_affinity(cs);
> >      if (ret) {
> >          return ret;
> >      }
> > -    cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
> >  
> >      kvm_arm_init_debug(cs);
> >  
> > -- 
> > 2.23.0
> > 
> >
> 
> Thanks,
> drew 

