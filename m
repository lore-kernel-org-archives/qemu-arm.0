Received: by 10.25.77.65 with SMTP id a62csp111807lfb;
        Thu, 26 Jan 2017 01:20:29 -0800 (PST)
X-Received: by 10.55.160.206 with SMTP id j197mr1644975qke.249.1485422429574;
        Thu, 26 Jan 2017 01:20:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b189si688873qkd.197.2017.01.26.01.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 01:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgEE-0004KO-Nc
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 04:20:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgE3-0004Fo-Kd
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgE2-0003r3-SS
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWgE2-0003qj-NA; Thu, 26 Jan 2017 04:20:14 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D02D57FB67;
	Thu, 26 Jan 2017 09:20:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q9K4vY003187; Thu, 26 Jan 2017 04:20:11 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 26 Jan 2017 10:19:39 +0100
Message-Id: <1485422381-29019-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 26 Jan 2017 09:20:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 2/4] hw/intc/arm_gicv3_kvm: Rename
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDzxwG4PXzp0

Rename KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS into KVM_DEV_ARM_VGIC_CPU_SYSREGS
as exposed in the kernel user API and pulled by update-linux-headers.sh.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

KVM_DEV_ARM_VGIC_CPU_SYSREGS may be fixed at kernel level instead
---
 hw/intc/arm_gicv3_kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 267c2d6..d8ecbc3 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -108,7 +108,7 @@ static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
 static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
                                    uint64_t *val, bool write)
 {
-    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_CPU_SYSREGS,
                       KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
                       val, write);
 }
-- 
2.5.5

