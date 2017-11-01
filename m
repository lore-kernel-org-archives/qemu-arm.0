Received: by 10.223.161.27 with SMTP id o27csp300702wro;
        Tue, 31 Oct 2017 19:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QySTO8ETsIbpZV4lqhez6KTlLYV3EYrx/cKkRqQSfG5+sdKyswRk0Ewu0rNIveRfmMYq2A
X-Received: by 10.13.215.73 with SMTP id z70mr2453133ywd.284.1509502203273;
        Tue, 31 Oct 2017 19:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509502203; cv=none;
        d=google.com; s=arc-20160816;
        b=TudxEee84m6ln2bWsvCG5v11FAoUDTs9Z0hi72JWIgHzacrtnZrA4lmpwJOYmLIfd4
         2houP1hgU8jXhjSMTXpa465cmwbAvfPYv/rX2qyBAHJJ1rkAsMFKA83st3ioC2yI+WHN
         WEyjDWTPSKs/5C6dv3CTYUeWOCUqV2FbYXD1+3cFaqSmLHxYPThnUB8aCTySni+z0vpj
         iHvA65oWqf6ptjqge773CYvLhJGrhy3zNcI5w5LZy5x5np1Te/tCODPSIeCGDjkgMNGm
         lRfKcaPgEIA1jga+/dCfCnvtLaphJM8GCMC+4LG24CVHuG9RC+xF+YtW/R2fav9dRv+O
         VSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=JoPmvkfT4QTAGpIOCnNl8gTQ1r8ol/wm1JzgoZTZKgg=;
        b=Cgh0/nvGP6AyTcbk0jkbgnAzuf+OGg3nSLA2d5PoZ1XgoWSsQ7vse3Wht/DoGjxH9q
         wo4poxNsEZwGPpPP5eBCe2NssRNXni1KQlyKhi+WXlWBovwgvX75QPGsh+U4dLtEVaKY
         l1b0NR/URMX6EQUa/dGFIqUb70Olg2j35F/Wwzz6EwHBI1mHBRb7PzqOi+Gtx2beJcRq
         awakGKgdqXklNwc12ONtBc/pqOkPvA+jzbWp1TMWbW/VN8UPWjjfV9xd/fas9bG8yXhO
         GM+pUbZg5aXVC/AFEzVKWZg8DwsL/tPkpmxZ9zakbqen1WgbbGTsdaO0atZyePTH6lDd
         9GPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11si163550ybk.730.2017.10.31.19.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 19:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9iTi-0007nY-N7
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 22:10:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9iTW-0007nS-Nv
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 22:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9iTR-0007DF-Mt
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 22:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9iTR-0007Ct-E3; Tue, 31 Oct 2017 22:09:45 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F0EA6218D0;
	Wed,  1 Nov 2017 02:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0EA6218D0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 31 Oct 2017 19:09:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_rOYq8NuhrbnJc4D7M+EenXPkPeqTBBJJzoBnAPxVLnw@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710311909010.1707@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
	<CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
	<alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA_8cimWtic=2OdvCmAN-mJ5MGGnVzDGYA5VgXGJG-fKhw@mail.gmail.com>
	<alpine.DEB.2.10.1710311147570.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA_rOYq8NuhrbnJc4D7M+EenXPkPeqTBBJJzoBnAPxVLnw@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: julien.grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wj05y5PoibmT

On Tue, 31 Oct 2017, Peter Maydell wrote:
> On 31 October 2017 at 18:51, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Tue, 31 Oct 2017, Peter Maydell wrote:
> >> On 31 October 2017 at 17:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >> > Fixing QEMU is harder than I expected. Would it be possible to update
> >> > id_aa64pfr0 at CPU reset time? Like cpu->id_aa64pfr0 |= 0x01000000; ?
> >>
> >> At that point we've already called register_cp_regs_for_features(),
> >> which is where we read cpu->id_aa64pfr0 when we're creating the
> >> cpreg. So if you change it after that it's too late. But that
> >> function is called at CPU realize time, which is before we've
> >> created the GIC object...
> >
> > What about something along the lines of
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9e18b41..0851071 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1401,6 +1400,10 @@ static void machvirt_init(MachineState *machine)
> >              object_property_set_link(cpuobj, OBJECT(secure_sysmem),
> >                                       "secure-memory", &error_abort);
> >          }
> > +        if (vms->gic_version == 3) {
> > +            ARMCPU *cpu = ARM_CPU(cpuobj);
> > +            cpu->id_aa64pfr0 |= 0x01000000;
> > +        }
> >
> >          object_property_set_bool(cpuobj, true, "realized", NULL);
> >          object_unref(cpuobj);
> 
> Definitely not -- the virt board should not be poking about inside the
> internals of the CPU object.
> 
> The slightly cleaned up version of this idea is that you give the
> CPU an object property for "claim the GICv3 registers exist in the
> ID registers" and have virt.c set it. That feels like an ugly
> workaround for something we really ought not to have to tell the
> board about at all, though.

Something like the following?

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..369d36b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1401,6 +1401,9 @@ static void machvirt_init(MachineState *machine)
             object_property_set_link(cpuobj, OBJECT(secure_sysmem),
                                      "secure-memory", &error_abort);
         }
+        if (vms->gic_version == 3) {
+            object_property_set_bool(cpuobj, true, "gicv3-sysregs", NULL);
+        }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
         object_unref(cpuobj);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 88578f3..259cad1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1690,6 +1690,7 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
+    DEFINE_PROP_BOOL("gicv3-sysregs", ARMCPU, gicv3_sysregs, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 89d49cd..0015b37 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -657,6 +657,9 @@ struct ARMCPU {
     /* Should CPU start in PSCI powered-off state? */
     bool start_powered_off;
 
+    /* GICv3 sysregs present */
+    bool gicv3_sysregs;
+
     /* Current power state, access guarded by BQL */
     ARMPSCIState power_state;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37af750..6f21900 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4687,7 +4687,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
-              .resetvalue = cpu->id_aa64pfr0 },
+              .resetvalue = cpu->gicv3_sysregs ? (cpu->id_aa64pfr0|0x01000000) :
+                  cpu->id_aa64pfr0 },
             { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
