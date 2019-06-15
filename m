Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp695810wrg;
        Sat, 15 Jun 2019 09:12:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1lVZWtt59udgCShODdldxQRJrrim83OElwAjhkN1zPRSGdzhT8gqUJToDgr6pXUMSsbMZ
X-Received: by 2002:aed:3f45:: with SMTP id q5mr31639158qtf.45.1560615129849;
        Sat, 15 Jun 2019 09:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560615129; cv=none;
        d=google.com; s=arc-20160816;
        b=b7M9/MwL0kZEEg1KyGvR08DDpVoGAxlwAvwqn80ISIF6AwEj1gpQNlw33CbuFESHJx
         PYJRLdTQscZx0ByY+ZvTzvoBc2oLkzbfXwjSQ4LTvRlScjbY7RiP8HDWjyXqhjUiQiwo
         0v+dxpNUVr+a6M0br4mIIQmYQfOfeofdhzykA19NP9+gDV6sWx7BY0gXJEiVixDea2Er
         EbThFl+fGb8A9pnGqv7oIl8XfJCwRRbdRaFwGe4VJpYJrrpSu97A+oTSvt0HW2wWHz0f
         hgoZ0UsDJl0FDriZaXU2iYLhclvlcEDuJOupOZxlesQ+AR0uCmwz+E2AdH8gEl4gFh84
         f3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=g202aaCtZtQl7L6HCVCefjcOE9XQr2QYibUmXHmAgDk=;
        b=aE4KgICKEyqKG49F6Luaawl5o/zNmPDET1HnL0oMIOjC66Z91OE2EjAnmVDvHx06PH
         3Tg33hR7SmbAfzxe/0f6fHSRxYxa9bcNDjKmGxD2WKYbu4U+MTlQCa2YXnQsRAteGl+8
         yJABv/FtHp0aCLIaqh9y4vk5xWOadpRAlyKv8VKfCexAaX279FXfvw8bH/AjkqR07mK6
         6oZ0FT5fH+zPl+K2KmiA9z4/LpTNkFr580s18NXAlhzuCVt7ZQJDnmDMGmrIj2w9JspI
         x1Y9V5tCIW4XD8X1GIBJ42p4JRRVhGpujIQ+h9z/PsjFoIf9qXzQJxVNo5BLRkttDOgy
         FI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si4255186qko.75.2019.06.15.09.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 09:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcBHl-00058q-BX
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 12:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcArK-0004W5-UE
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcArJ-0001nQ-Pm
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcArJ-0001k8-JF; Sat, 15 Jun 2019 11:44:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7AFC307D854;
 Sat, 15 Jun 2019 15:44:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9578F1001B23;
 Sat, 15 Jun 2019 15:44:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:52 +0200
Message-Id: <20190615154352.26824-24-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sat, 15 Jun 2019 15:44:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [NOTFORMERGE PATCH v2 23/23] Missing symbols when
 building with --disable-tcg
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MILBfIwLDoZF

While it might be normal to disable PSCI on KVM, I doubt the
VFP helpers are correct ;)

Anyway this allow to link the binary and run a KVM guest.

Tested using:

  $ make pc-bios/edk2-aarch64-code.fd
  $ dd if=3D/dev/zero of=3Dflash1.img bs=3D1M count=3D64
  $ aarch64-softmmu/qemu-system-aarch64 \
    -nographic \
    -enable-kvm \
    -M virt,gic-version=3D3 \
    -cpu host \
    \
    -pflash pc-bios/edk2-aarch64-code.fd \
    -pflash flash1.img \
    -drive if=3Dnone,file=3Dbionic-server-cloudimg-arm64.img,id=3Dhd0 \
    -device virtio-blk-device,drive=3Dhd0 \
    \
    -netdev type=3Duser,id=3Dnet0 \
    -device virtio-net-device,netdev=3Dnet0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/Makefile.objs |  1 +
 target/arm/kvm-missing.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 target/arm/kvm-missing.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index b8aa9c032a..bf1cad2909 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -6,6 +6,7 @@ obj-$(CONFIG_SOFTMMU) +=3D machine.o arch_dump.o monitor.=
o arm-powerctl.o
 obj-$(call land,$(CONFIG_TCG),$(CONFIG_SOFTMMU)) +=3D psci.o
=20
 obj-$(CONFIG_KVM) +=3D kvm.o
+obj-$(CONFIG_KVM) +=3D kvm-missing.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
diff --git a/target/arm/kvm-missing.c b/target/arm/kvm-missing.c
new file mode 100644
index 0000000000..0b32cd4e9c
--- /dev/null
+++ b/target/arm/kvm-missing.c
@@ -0,0 +1,22 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+uint32_t vfp_get_fpscr(CPUARMState *env)
+{
+    return 0;
+}
+
+void vfp_set_fpscr(CPUARMState *env, uint32_t val)
+{
+}
+
+bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
+{
+    return false;
+}
+
+void arm_handle_psci_call(ARMCPU *cpu)
+{
+    abort();
+}
--=20
2.20.1

