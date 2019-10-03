Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp429393wrp;
        Thu, 3 Oct 2019 08:48:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziMIgKiynhPTOaIDA3v00Cp8pkSTjBI4UE7nyPdqFDHtsirlLGwk0Qf7zCyJ1oCozuQPde
X-Received: by 2002:a05:6402:709:: with SMTP id w9mr10201954edx.85.1570117722991;
        Thu, 03 Oct 2019 08:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570117722; cv=none;
        d=google.com; s=arc-20160816;
        b=UFyPKkmZAAzynci8ax4fh+VywurJQYXGFKHAOb5y6yI+Jh8ZAkFbRLHWAIcadEpkyM
         tKFgL1IbUtcLBJoZMCl4/5ySrZMvu7p/++kDIC6/koVU1LfYXAA4v2oHDO32LZ1QfqTT
         cceqsRM+pgVd2w6hd8Ryz2rYt7jy521yqnmQrjUkyisoES16D4sE8bgld6h0xp+haI/G
         E8BuHj4V+b2kH9HXw6FFYQhQjxBNogUTxHV5drI4fs7udvwTmhIczN+z9NlWqalz0FGg
         +BvaJabB7PmgNYKxJXXN+Kn/TJBFjdc70UhZXheFM2vePKkRTCJ8Hm8HL/VANk/aJQf7
         +POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=W5QtKBOh/pRKAEkIlTyead1b46VUfSe2iBfsgY13ucQ=;
        b=XhHGNdhc+OZQt+gXhuyLJ7jf+YguvKK0F3fpycfJnaDbtoUa7qNjxNAa1I9dZVG1Pt
         P0WS/uxb9aYKxyc1UL9RmGUoQZB1TpW4FO7RAFapCz6zrEEHJQ2Y+XMC6smHvaBPyfUs
         biqdifdEB2NWMefhEby29XE6Q316LVmG6EDPCL+MwJ89cJ0hibFYbrUiFAWby+0+urYe
         k7lmuWdsx5vTL7PXFcpZp6/IkuyzVqTNLOZvZS+VXAUvLA8SmcDMb6YjFC9nct5VGCtw
         ILeIq4tYChvMk87xmZBb0PLjNjyDmpfS+/z7RVaiW828rB0J8E2MOc0JpcDx13oU0R+z
         Nq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox28si1428308ejb.130.2019.10.03.08.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 08:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iG3LN-0004bW-CJ
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 11:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iG3Jg-0003BC-DQ
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 11:46:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iG3Jf-0006LV-96
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 11:46:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iG3Jf-0006Kv-3d; Thu, 03 Oct 2019 11:46:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 506B418C427B;
 Thu,  3 Oct 2019 15:46:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C86019C7F;
 Thu,  3 Oct 2019 15:46:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 3/3] ARM: KVM: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for
 smp_cpus > 256
Date: Thu,  3 Oct 2019 17:46:40 +0200
Message-Id: <20191003154640.22451-4-eric.auger@redhat.com>
In-Reply-To: <20191003154640.22451-1-eric.auger@redhat.com>
References: <20191003154640.22451-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 03 Oct 2019 15:46:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LwHEiPPsHp/D

Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=3D512
for ARM. The actual capability to instantiate more than 256 vcpus
was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
a single KVM IO device instead of 2.

So let's check this capability when attempting to use more than 256
vcpus within any ARM kvm accelerated machine.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>

---

v2 -> v3:
- Implement the check in kvm_arch_init as suggested by Peter
---
 target/arm/kvm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b10581fa06..b473c63edb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -182,6 +182,7 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
=20
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
+    int ret =3D 0;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -195,7 +196,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
=20
     cap_has_mp_state =3D kvm_check_extension(s, KVM_CAP_MP_STATE);
=20
-    return 0;
+    if (ms->smp.cpus > 256 &&
+        !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
+        error_report("Using more than 256 vcpus requires a host kernel "
+                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
+        ret =3D -EINVAL;
+    }
+
+    return ret;
 }
=20
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
--=20
2.20.1

