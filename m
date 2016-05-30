Received: by 10.25.27.66 with SMTP id b63csp1455051lfb;
        Mon, 30 May 2016 04:15:27 -0700 (PDT)
X-Received: by 10.55.81.3 with SMTP id f3mr25232469qkb.35.1464606927477;
        Mon, 30 May 2016 04:15:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si27563294qtb.34.2016.05.30.04.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 May 2016 04:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7LAM-0005Xx-Rt
	for alex.bennee@linaro.org; Mon, 30 May 2016 07:15:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1b7LAI-0005XM-RP
	for qemu-arm@nongnu.org; Mon, 30 May 2016 07:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1b7LAC-0006aG-Um
	for qemu-arm@nongnu.org; Mon, 30 May 2016 07:15:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1b7LAC-0006a9-M9; Mon, 30 May 2016 07:15:16 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CA2563171;
	Mon, 30 May 2016 11:15:15 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4UBFAJx016218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 30 May 2016 07:15:12 -0400
Date: Mon, 30 May 2016 13:15:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160530111509.hvjswcrxbwaq24u6@hawk.localdomain>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 30 May 2016 11:15:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/22] GICv3 emulation
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScHwiqbfWASt

On Thu, May 26, 2016 at 03:55:18PM +0100, Peter Maydell wrote:
> This series implements emulation of the GICv3 interrupt controller.
> It is based to some extent on previous patches from Shlomo and
> Pavel, but the bulk of it has turned out to be new code. (The
> combination of changing the underlying data structures, adding
> support for TrustZone and implementing proper GICv3 behaviour rather
> than borrowing fragments of GICv2 emulation code meant there wasn't
> much left to reuse.) I've tried to reflect this in the various
> authorship credits on the patches, but please let me know if you
> feel I got anything miscredited one way or the other.
> 
> Key points about the GICv3 emulated here:
>  * "non-legacy" only, ie system registers and affinity routing
>  * TrustZone is implemented
>  * no virtualization support
>  * only the "core" GICv3, so no LPI support (via ITS or otherwise)
>  * no attempt to work around the Linux guest kernel bug fixed
>    in commit 7c9b973061b0 (so you need that fix for your guest to
>    boot with this GICv3)
> 
> I have included the "support KVM save/restore" patches from Pavel,
> reworked to use the new data structures, but they are only RFC
> status because the kernel API is not yet final (there are a couple
> of loose threads there to be followed up). Those patches are at the
> end of the series; I think everything else is in a commitable state
> (give or take code review).
> 
> Testing: I have confirmed that we can boot a Linux guest kernel,
> but not tried any other GIC-using guest code. I've done some light
> stress-testing using 'stress', and checked an SMP (2-cpu) boot.
> I've also tested booting a guest kernel via UEFI.
> 
> Design: all the code here is in hw/intc/, split into several
> files to avoid them being huge. The interface between the CPU
> proper and the CPU interface is a bit ad-hoc (you can see the
> awkward seams that result from the choice to think of the cpu
> i/f as part of the GIC device rather than part of the CPU itself),
> but I think that if you put the cpu i/f in the CPU you'd end up
> with an ad-hoc interface and awkward seams in the other direction.
> The GICv3 device currently assumes it is always connected to all
> CPUs; we can change that later to allow some kind of QOM link
> property to specify the CPUs explicitly, but I think this is OK
> for now (and it's already a pretty huge set of code changes to
> have to review).
> 
> Code review, testing, attempts to run guests other than Linux
> welcome.
> 
> Changes v1->v2:
>  * I have dropped the kernel bug workaround, since it didn't work for
>    boots via UEFI anyway. This means that you will need kernel commit
>    7c9b973061b0 (or its equivalent backports to stable) to boot a Linux
>    guest with this emulated GICv3
>  * make bitmaps and arrays be GIC_MAXIRQS in size rather than
>    GIC_MAXSPIS in size; this uses an extra 512 bytes or so per
>    vcpu, but makes bugs of the "forgot to add/subtract GIC_INTERNAL"
>    variety less likely to happen (and indeed a few were found and fixed
>    in making this change...)
>  * fixed GICD_CTLR NS read to use correct bitmask
>  * moved ARMELChangeHook related prototypes etc into cpu.h from cpu-qom.h
>    (needed after Paolo's recent header reshuffles)
>  * added missing 'inline' qualifier to arm_is_el3_or_mon()
>  * fixed missing reset of GICD_NSACR
>  * fixed icc_activate_irq() to call gicv3_redist_update() rather than
>    gicv3_update() when it changes redistributor state
>  * make sure (and assert) gicv3_update() isn't called for out of range irqs
>  * add missing "bad num_irqs values" checks from gicv2 code

I've lightly tested this with kvm-unit-tests (I say lightly, because
it only does IPI testing so far). Although I did try with 123 vcpus,
the max mach-virt currently supports. I'm not sure the testing is
enough to warrant any tested-by's. I mostly just advertising the
unit test, which is here
https://github.com/rhdrjones/kvm-unit-tests/commits/arm/gic

Also, below is a follow-on patch for mach-virt, which might be
of interest.

Thanks,
drew


From: Andrew Jones <drjones@redhat.com>
Date: Mon, 30 May 2016 12:58:26 +0200
Subject: [PATCH] hw/arm/virt: gicv3: use all target-list bits

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e77ed88afb8a2..753c9ff8ccd64 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1204,6 +1204,16 @@ static void machvirt_init(MachineState *machine)
         }
         cpuobj = object_new(object_class_get_name(oc));
 
+        /* Adjust MPIDR per the GIC's target-list size. */
+        if (gic_version == 3) {
+            CPUState *cs = CPU(cpuobj);
+            uint8_t Aff1 = cs->cpu_index / 16;
+            uint8_t Aff0 = cs->cpu_index % 16;
+
+            object_property_set_int(cpuobj, (Aff1 << ARM_AFF1_SHIFT) | Aff0,
+                                    "mp-affinity", NULL);
+        }
+
         /* Handle any CPU options specified by the user */
         cc->parse_features(CPU(cpuobj), cpuopts, &err);
         g_free(cpuopts);
-- 
2.4.11

