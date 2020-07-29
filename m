Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1603081lfy;
        Wed, 29 Jul 2020 06:52:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgktQX7qQXElZ/sn1yLXI0GIur8lgNfNHZoRWgkdHY6h1AewpEk28JdctcXscxdT0ikhLE
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr5678308ybt.416.1596030754196;
        Wed, 29 Jul 2020 06:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596030754; cv=none;
        d=google.com; s=arc-20160816;
        b=ggJpXletEktwuYwV/scjHUEzFYj+ue+U/pYSxVntNmMeEz9AZI4p696ewxpIVk10sS
         rF0QOJoameviOh+ws0scFkWAUmbQ+FFO/JcEmaGPQbbOs+N1tk3iPSdXQCP0ZNVy9I8f
         Zn0AZFlC9W1N+W4iQBkpNyxfmCR9f5wW/vZc1vpmlg8NoLaDbyxRlxAYy7UKfHv9ubPO
         wlLWVouMT64LzdyF8Qwfo5k5utep8LciGX7EyIRIzMTbFoO8DVJcZhekH9uQjfY2FxTU
         pqTh3ENj80hyw6amhnDtnF0H1bk0JYxWVyOngsMGhwmnrTF0jora7r2HVxUCrZypPXNX
         K3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ULdUanWJmi9bhg+8k30eioa+t0A08/puSuGiBih9dKI=;
        b=q45kyE+ov22apw8eR3e693xjWJijHmEXMd8Yv/jXH7lDBPEtOtDi4z2cXmL2wW8JyQ
         A/yvQtnqs27b4Xq+9Af5BX16/n0NKIzwxZbXJ7FjcPBhRXIu56PXl8wpgMxWdawXQB7Q
         ykGBi+QGMGTHUrTNMm2dz7muQw6+BCYWGq4vlDtiEjU0gJhWfhpcRcq202P+uvylL8oK
         gb9SXBvUtMjo78FHhY/iCvu5cUwi3FWysIuMN6YFELSGk84jyH3J17X09rrmTMfPPzTC
         0mSkuFMhBn4SS0/8hyEprp7wH8YyIg9fY7zvS+FFPRezAmIcf8tX39DovH/zpwuFnrXw
         ONOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qsaprp+I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si1938876ybb.15.2020.07.29.06.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 06:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qsaprp+I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0mVV-0006qe-JR
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 09:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0mUr-0006Ps-Tb
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 09:51:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38685
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0mUp-0004WR-8b
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 09:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596030709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULdUanWJmi9bhg+8k30eioa+t0A08/puSuGiBih9dKI=;
 b=Qsaprp+I30leg9WKY/xX2dKPSqxWsvx6yn1Wlf9S2aHrNmg6NtIZy2UduaktvUKr5jiwEu
 cPLJikRZyKHzBdYXgLoNMD6wne3atGTgga8MF/IlTt6WvW9qKJDgrX76yv5UDAaQrAsGO9
 yvFzUlerl2DIn37bk50DmwJatxbKbOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294--uOwMKg4N8S7eI8DgX07Kw-1; Wed, 29 Jul 2020 09:51:47 -0400
X-MC-Unique: -uOwMKg4N8S7eI8DgX07Kw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A58E80047C;
 Wed, 29 Jul 2020 13:51:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D2F7191C;
 Wed, 29 Jul 2020 13:51:44 +0000 (UTC)
Date: Wed, 29 Jul 2020 15:51:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
Message-ID: <20200729135142.mquvlhf2iuxiw7zc@kamzik.brq.redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-3-drjones@redhat.com>
 <CAFEAcA93VMoQxPSvk7YNkkbXhrFufuFN8R9Sqjj6C97Xz2buvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93VMoQxPSvk7YNkkbXhrFufuFN8R9Sqjj6C97Xz2buvA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yPTeLkhzzDVX

On Tue, Jul 21, 2020 at 11:02:30AM +0100, Peter Maydell wrote:
> On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
> >
> > Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> > virt_cpu_post_init(), which is a more appropriate location. Now
> > fdt_add_pmu_nodes() is also named more appropriately, because it
> > no longer does anything but fdt node creation.
> >
> > No functional change intended.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/virt.c | 33 +++++++++++++++------------------
> >  1 file changed, 15 insertions(+), 18 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index cb2fa99b1ef5..63ef530933e5 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -521,30 +521,15 @@ static void fdt_add_gic_node(VirtMachineState *vms)
> >
> >  static void fdt_add_pmu_nodes(const VirtMachineState *vms)
> >  {
> > -    CPUState *cpu;
> > -    ARMCPU *armcpu;
> > +    ARMCPU *armcpu = ARM_CPU(first_cpu);
> >      uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> >
> > -    CPU_FOREACH(cpu) {
> > -        armcpu = ARM_CPU(cpu);
> > -        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> > -            return;
> > -        }
> 
> So previously we would say "if the CPU doesn't actually have
> a PMU, don't put the PMU nodes in the FDT", but in the new logic
> it looks like we put the PMU nodes in the FDT unconditionally ?

Ah, an unintentional change in this patch with no intended changes.
How about adding something like this to the top of fdt_add_pmu_nodes()

    if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
        assert(!object_property_get_bool(OBJECT(armcpu), "pmu", NULL));
        return;
    }

where the assert is optional - it just mirrors the consistency check in
virt_cpu_post_init()

Thanks,
drew

> 
> > -        if (kvm_enabled()) {
> > -            if (kvm_irqchip_in_kernel()) {
> > -                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> > -            }
> > -            kvm_arm_pmu_init(cpu);
> > -        }
> > -    }
> > -
> >      if (vms->gic_version == VIRT_GIC_VERSION_2) {
> >          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> >                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
> >                               (1 << vms->smp_cpus) - 1);
> >      }
> >
> > -    armcpu = ARM_CPU(qemu_get_cpu(0));
> >      qemu_fdt_add_subnode(vms->fdt, "/pmu");
> >      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> >          const char compat[] = "arm,armv8-pmuv3";
> > @@ -1678,11 +1663,23 @@ static void finalize_gic_version(VirtMachineState *vms)
> >   */
> >  static void virt_cpu_post_init(VirtMachineState *vms)
> >  {
> > -    bool aarch64;
> > +    bool aarch64, pmu;
> > +    CPUState *cpu;
> >
> >      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> > +    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> >
> > -    if (!kvm_enabled()) {
> > +    if (kvm_enabled()) {
> > +        CPU_FOREACH(cpu) {
> > +            if (pmu) {
> > +                assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
> > +                if (kvm_irqchip_in_kernel()) {
> > +                    kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> > +                }
> > +                kvm_arm_pmu_init(cpu);
> > +            }
> > +        }
> > +    } else {
> >          if (aarch64 && vms->highmem) {
> >              int requested_pa_size = 64 - clz64(vms->highest_gpa);
> >              int pamax = arm_pamax(ARM_CPU(first_cpu));
> 
> thanks
> -- PMM
> 

