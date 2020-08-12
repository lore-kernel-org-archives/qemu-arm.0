Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1293423lfy;
        Wed, 12 Aug 2020 03:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi6q1Pl8DThZVWguFfXcyPdTpYxj6oPqCN9KfcEAGZK2MpNjfEZPsBocqULoMXp6hQ7FMm
X-Received: by 2002:a25:4883:: with SMTP id v125mr50005818yba.503.1597228012609;
        Wed, 12 Aug 2020 03:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597228012; cv=none;
        d=google.com; s=arc-20160816;
        b=lZkJv7LIkqmLs5aUAF1rhgrxQIa5aQqL14SXnnAx0KUmeIwRfgZyzfydmR5plnL8t9
         n+fkKMW/am0Y3I0LN6KMG5W9YrynVuG/TD4JyzPWJ5hgVDqAuWBNru3rxbGUshQxc2sI
         VlbrHED72mbxu79nsTAQkd9eF7t0jpEo8qIu2n03U84PuUdN3m9xlUx/XChzM50GLnad
         aMWKNLsMAfd/X3yL/D1PhoThIIkFPKYJDslym+vcI9YYtxXx1WE4mlQn83pA6/qGyUgQ
         PQmDjBlXu2lwhcj59m/WswcXR/VMZ4U4YFZpDqB/ogiJzWnnhx51zUkNAqVvxF2cC5Lc
         49hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LeoH579yIlvqbo9BdYkGUtcrLYiZxYC+3+AjxHS+R38=;
        b=H+cqwiNVXJKxKtaq150Ff1SWvIa4Jy/cO/kbNMDJQ8C3rHNgjofN84Z1Gzl5X4CFMG
         bTR9FPNzNcp1Y8ywl0Sw1JBZxMvqOuFdhncCA4VHQSho9yoZ4x3UE2/B9s0iciWzjHIr
         uCwZR+gM6/lywu3iWl/PkscO80as8wA5cXFMY+GKWtXG96vc4UMrfxzqp8lOmP7SbJwZ
         FuN/wxV8xpPEv8UBfGYgOsTAfW6ntaIjZ8dqszVbd2J7kRZyyzE2YFZoabalwhCu7HYP
         qcSFPAd/miEertlN1UwkDeVv3t4rnSfTu9mHo7vOugAK/iQhjRPxLyug8tIHRPbRu8Nu
         f4rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IhEF1pxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si1962033ybe.393.2020.08.12.03.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 03:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IhEF1pxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5ny7-0005na-WB
	for alex.bennee@linaro.org; Wed, 12 Aug 2020 06:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k5nxz-0005n3-6V
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:26:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59250
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k5nxw-0004YU-Ks
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597227999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LeoH579yIlvqbo9BdYkGUtcrLYiZxYC+3+AjxHS+R38=;
 b=IhEF1pxX8j0yM83A7ytNbvuz2pZGr3kaUb37dtaOpqugX2CN6RYJnLi7BzFDBGXevQ3OFK
 gk63hhtXtGqEdtE5/s6n3Xpwzsu1HqS+icrh60oM3G9J0j/EMv2retMJQP1JlKb45cNItz
 6Oj+yN0nf/8XFByWLBNzUJiuNjzH/OU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-zTYkTZT3PoaqLLGsiP1Wxg-1; Wed, 12 Aug 2020 06:26:38 -0400
X-MC-Unique: zTYkTZT3PoaqLLGsiP1Wxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2765C106B242;
 Wed, 12 Aug 2020 10:26:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12BFF5D6BD;
 Wed, 12 Aug 2020 10:26:31 +0000 (UTC)
Date: Wed, 12 Aug 2020 12:26:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/5] target/arm/kvm: Make uncalled stubs explicitly
 unreachable
Message-ID: <20200812102624.zali24olzg5zeqqd@kamzik.brq.redhat.com>
References: <20200805091640.11134-1-drjones@redhat.com>
 <20200805091640.11134-3-drjones@redhat.com>
 <b26a7bf5-ad7c-9376-78ab-600b7ea9fed8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b26a7bf5-ad7c-9376-78ab-600b7ea9fed8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 04:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WAzsDr++Mpw4

On Wed, Aug 12, 2020 at 12:16:43PM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 8/5/20 11:16 AM, Andrew Jones wrote:
> > When we compile without KVM support !defined(CONFIG_KVM) we generate
> > stubs for functions that the linker will still encounter. Sometimes
> > these stubs can be executed safely and are placed in paths where they
> > get executed with or without KVM. Other functions should never be
> > called without KVM. Those functions should be guarded by kvm_enabled(),
> > but should also be robust to refactoring mistakes. Putting a
> > g_assert_not_reached() in the function should help. Additionally,
> > the g_assert_not_reached() calls may actually help the linker remove
> > some code.
> > 
> > We remove the stubs for kvm_arm_get/put_virtual_time(), as they aren't
> > necessary at all - the only caller is in kvm.c
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/kvm_arm.h | 44 +++++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 17 deletions(-)
> > 
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index adb38514bf20..0da00eb6b20c 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -344,16 +344,10 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
> >  
> >  #else
> >  
> > -static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> > -{
> > -    /*
> > -     * This should never actually be called in the "not KVM" case,
> > -     * but set up the fields to indicate an error anyway.
> > -     */
> > -    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
> > -    cpu->host_cpu_probe_failed = true;
> > -}
> > -
> > +/*
> > + * It's safe to call these functions without KVM support.
> > + * They should either do nothing or return "not supported".
> > + */
> >  static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
> this one also is guarded by kvm_enabled() in target/arm/cpu.c
> don't you want to add g_assert_not_reached()?

Yes, that would make sense. I'll do that for v3.

> >  
> >  static inline bool kvm_arm_aarch32_supported(void)
> > @@ -371,23 +365,39 @@ static inline bool kvm_arm_sve_supported(void)
> >      return false;
> >  }
> >  
> > +/*
> > + * These functions should never actually be called without KVM support.
> > + */
> > +static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> >  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> >  {
> > -    return -ENOENT;
> > +    g_assert_not_reached();
> >  }
> >  
> >  static inline int kvm_arm_vgic_probe(void)
> >  {
> > -    return 0;
> > +    g_assert_not_reached();
> >  }
> >  
> > -static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
> > -static inline void kvm_arm_pmu_init(CPUState *cs) {}
> > +static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> > +{
> > +    g_assert_not_reached();
> > +}
> >  
> > -static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}
> > +static inline void kvm_arm_pmu_init(CPUState *cs)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +
> > +static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> > +{
> > +    g_assert_not_reached();
> > +}
> >  
> > -static inline void kvm_arm_get_virtual_time(CPUState *cs) {}
> > -static inline void kvm_arm_put_virtual_time(CPUState *cs) {}
> >  #endif
> >  
> >  static inline const char *gic_class_name(void)
> > 
> 
> Besides,
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks,
drew

