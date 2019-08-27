Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5430296wrs;
        Tue, 27 Aug 2019 09:07:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVXbm5Q4g+ervYqWfpBgIflx033oDbXnJcR3CTwXeyS/sGgH1Fp6nwdFPjIOCr2L0Yzhzg
X-Received: by 2002:a17:906:b20c:: with SMTP id p12mr21065902ejz.207.1566922077383;
        Tue, 27 Aug 2019 09:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566922077; cv=none;
        d=google.com; s=arc-20160816;
        b=1GgwfjYO6ScckQU5Hnc92N0tYSU2IgHhcvhk3BQuRZAWllhytwqshRD6yO7MSkLEhs
         R0+nkEsh5/MUTjiyRqXS7iRwZJd7UTQUzsBdkPwRu5qLcfvoFITgxnjFkhS0UEHaG0T2
         Cpla3i4d9Qly5Lv5wCa/YTt13C1w+fFWWjPrUF6CSQKsE3+Ypryi2Fku9K73KiZAImn4
         Ok9B6IZNTjFurKfh6udsD3Uet5HXm7JfvqseQ1qKUYr2dacuoT8TIPZ+UuHZ09c0gKxw
         jCsZ1mOBQNFrKiOPIHAIQfLc55dhxGQDcxafeDqIG7cvJpceb5YVBVApNPA3POgqAO8t
         /acQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Z3r+7Q2U/cKRp/go2L0coLIYv/3h3JP/vMhwCxihiXA=;
        b=fV++zijKMXslgQ4VQE/K7JcrHekOpXWXGA1uhhQsY4AWRFXTZmxvt+qAmorLdjkavN
         bURSEK4O9B+NBjbe6KRDlC9f/a+MhPuQ4C0+MhbzXy/wGj5L8WNxjU0UhuaoHI6SpWhK
         lWbcwTJw0k1gJwm64u2cPHEcpIxPWRfmUIhZX57oPTBq7zcVPwRS1kVOm2W89N4g/4zF
         NSCwKo1DelWzl7Tq6/xQf0TnsUXlM8gfZXbkiOUeYK9cUqfv/kfNWeCXhmJzx0iC70Z2
         owiyJSrpraHkOx9MF0giBMsKJQF2+LnM08P0Xf+3Auoa4QsrkuzUuLB9d1Q5akEB2hCu
         Uv3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si7443185ejx.353.2019.08.27.09.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 09:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2e0i-0004Ri-9Z
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 12:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i2dz1-0003Bf-SW
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i2dz0-0002Dn-NK
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:06:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36380)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i2dyx-0002Cj-WE; Tue, 27 Aug 2019 12:06:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 425D57BDB0;
 Tue, 27 Aug 2019 16:06:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4541001B17;
 Tue, 27 Aug 2019 16:06:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Aug 2019 18:05:53 +0200
Message-Id: <20190827160554.30995-3-eric.auger@redhat.com>
In-Reply-To: <20190827160554.30995-1-eric.auger@redhat.com>
References: <20190827160554.30995-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 27 Aug 2019 16:06:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC 2/3] intc/arm_gic: Support PPI injection for more
 than 256 vpus
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBv0UBZoQAua

Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
allow injection of PPIs along with vcpu ids larger than 255. Let's
encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
ABI when needed.

Without that patch qemu exits with "kvm_set_irq: Invalid argument"
message.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/intc/arm_gic_kvm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index b56fda144f..889293e97f 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -56,6 +56,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int=
 level)
      * CPU number and interrupt number.
      */
     int kvm_irq, irqtype, cpu;
+    int cpu_idx1 =3D 0, cpu_idx2 =3D 0;
=20
     if (irq < (num_irq - GIC_INTERNAL)) {
         /* External interrupt. The kernel numbers these like the GIC
@@ -63,17 +64,20 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, i=
nt level)
          * internal ones.
          */
         irqtype =3D KVM_ARM_IRQ_TYPE_SPI;
-        cpu =3D 0;
         irq +=3D GIC_INTERNAL;
     } else {
         /* Internal interrupt: decode into (cpu, interrupt id) */
         irqtype =3D KVM_ARM_IRQ_TYPE_PPI;
         irq -=3D (num_irq - GIC_INTERNAL);
         cpu =3D irq / GIC_INTERNAL;
+        cpu_idx2 =3D cpu / 256;
+        cpu_idx1 =3D cpu % 256;
         irq %=3D GIC_INTERNAL;
     }
-    kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
-        | (cpu << KVM_ARM_IRQ_VCPU_SHIFT) | irq;
+    kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) |
+              (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
+              ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) << KVM_ARM_IRQ_VCPU2_=
SHIFT) |
+              irq;
=20
     kvm_set_irq(kvm_state, kvm_irq, !!level);
 }
--=20
2.20.1

