Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2005362lfg;
        Tue, 25 Feb 2020 10:24:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqw59vyfu1tvYf3vyr15GK7cOQHuRQ/NjaW0P35F2BhTULTsge6qNUL7bSCSUdZn+o5K7j6O
X-Received: by 2002:a05:620a:686:: with SMTP id f6mr176820qkh.86.1582655091966;
        Tue, 25 Feb 2020 10:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582655091; cv=none;
        d=google.com; s=arc-20160816;
        b=Zdt01NWYA/Fvk1Qg79zGMqI6tHNwdtoR4L6q7dZSUIoJ+imPs05PpR+P5J9KRgzEYM
         BLE8QDSHHQQrKgc8pw68V2SGo2mS/vz7a4LmKrAlPoqLxAA4qWbIa8ul5Bnp8aDtya7W
         a8CUGMI1z/7nKbmuCPnH2Sfj4BE/BAbsZyb+XHMzz9CYg+NKP4oP0e/ujyzSo5IDQk4T
         6b5K9J2Rle57AcmPm1L9X3YMqJQUj1vqYe2gGQiGk8mEGnwysbt5Tgs3vDVtsLh/yMeI
         iKkFpqOp+17Ihyuiy4qQTOucV4a099NRqcuRqpQtW95QFxpyGFqsxet15GS/ThV6ikTg
         mdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hlelqfIWVmI72/3gUGEctsr+NvJ/BDNB42f/K9zNjaU=;
        b=RrKj91oqreCp+XLioWlsOQWrqglCzMVM2LW743kyW9b36f2RpSTn4kIi/0m7svzF0b
         S01Chug1ikfFdScqTHlVL9avRWC1cF9S2S3UGfy3uG5xOUMhmL+31Km8eXMH/rJgBQVN
         VVweS4YBPuaWScerxLg66+Qp/eJJwLAN94ykVOSrWK+R1GrIpK8D80WFP2LWni05wLFr
         1GBD1Ynj3pMU2eVUWgTzv/Sh++BZFlu29GpcIF1rhXtrQWCgKJmaH4N6R6M5NFzQSxRt
         fgw4Fs7gHpagluHCKhHZqHVcam2WMP1f+UVsqGaKo3p15munLAA2tKs0XNcEl5Lk70G+
         Kizw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqXuYXG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si160235qkj.184.2020.02.25.10.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqXuYXG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6et1-0003us-F3
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6esr-0003ti-U4
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6esq-0003sH-Ls
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:24:41 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40537)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6esq-0003qS-Fh
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:24:40 -0500
Received: by mail-wm1-x343.google.com with SMTP id t14so184194wmi.5
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlelqfIWVmI72/3gUGEctsr+NvJ/BDNB42f/K9zNjaU=;
 b=SqXuYXG30MjayQimou0Dob2Aq+HcMKVWvxQLDs8XnHnebdZYDAhutN0Lk1IsflJleB
 O/U7IzrRUijfCYTJCtvH7Ia1TquxohchnGW57hYfmqNMzYFxHMhE4NRUdBjY5CrMZBXy
 xLOAY2X6gxJlr7/xDTZctLBORvmRMeCTetN1EH++iuah6VGriAE5nj+tk7tDEGHNnjkG
 i3fodrKetr9/2z0e79vMDpAMCz0ymfqlJXRb2sfAxDK9tdfVv6NbOXNK4ykz02+lTvR0
 UY95CX3CEhD0iP4d/5ferpVkuPjMbLlwnrDVDxiGHg8XHoXRyM6ocWjMURbWsewcMXrG
 mnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlelqfIWVmI72/3gUGEctsr+NvJ/BDNB42f/K9zNjaU=;
 b=uG4H7/vqF5xVAEJXlDxV3zmdr0iqaUXkrfXr2+cQ4hkm0wBbqezQKf4KV2tcOOH05o
 Gf7vgeMEa93hfVyNwHmXcJ7zWQTWyShWOoPmOSpIJso16fzOhfimP8Gw4MXOHS/AqguA
 2OpBb3uz68WCOPhOtsmcI6OZqR88aduZzSUPCPzhr7HqLwyPnGhkUhAa3uuxx4s6GSDD
 N1BkJlUIGRfm8/guECc6lXIOhBjWEKcPQ3SRosbWhjhSj1iRSlqNxminVMfhUcAUpZCs
 xjq0LhsrfuLmDjoFGjFDNdUP0xhG5t1XAAphscbISF9gI2FxcU4plYZ7hDqxigMgDj9o
 B0rg==
X-Gm-Message-State: APjAAAV7lpDa0UTn+cIcv0Ox6VpReQiMd31ctJ7BaMoK4C8RMzaGK0uZ
 LCgfgdMN+7n32t9A6i6fVqp19OqtmRON+A==
X-Received: by 2002:a1c:7f0d:: with SMTP id a13mr479289wmd.182.1582655079012; 
 Tue, 25 Feb 2020 10:24:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm4794560wmb.8.2020.02.25.10.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:24:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gic_kvm: Don't assume kernel can provide a GICv2
Date: Tue, 25 Feb 2020 18:24:35 +0000
Message-Id: <20200225182435.1131-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmRwD9OIdYty

In our KVM GICv2 realize function, we try to cope with old kernels
that don't provide the device control API (KVM_CAP_DEVICE_CTRL): we
try to use the device control, and if that fails we fall back to
assuming that the kernel has the old style KVM_CREATE_IRQCHIP and
that it will provide a GICv2.

This doesn't cater for the possibility of a kernel and hardware which
only provide a GICv3, which is very common now.  On that setup we
will abort() later on in kvm_arm_pmu_set_irq() when we try to wire up
an interrupt to the GIC we failed to create:

qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
qemu-system-aarch64: failed to set irq for PMU
Aborted

If the kernel advertises KVM_CAP_DEVICE_CTRL we should trust it if it
says it can't create a GICv2, rather than assuming it has one.  We
can then produce a more helpful error message including a hint about
the most probable reason for the failure.

If the kernel doesn't advertise KVM_CAP_DEVICE_CTRL then it is truly
ancient by this point but we might as well still fall back to a
KVM_CREATE_IRQCHIP GICv2.

With this patch then the user misconfiguration which previously
caused an abort now prints:
qemu-system-aarch64: Initialization of device kvm-arm-gic failed: error creating in-kernel VGIC: No such device
Perhaps the host CPU does not support GICv2?

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I spent a while wondering if the PMU code was broken before Marc
put me on the right track about what was going wrong (ie that
I hadn't put "-machine gic-version=host" on the commandline).

 hw/intc/arm_gic_kvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 9deb15e7e69..d7df423a7a3 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -551,7 +551,16 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
                               KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true,
                               &error_abort);
         }
+    } else if (kvm_check_extension(kvm_state, KVM_CAP_DEVICE_CTRL)) {
+        error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
+        error_append_hint(errp,
+                          "Perhaps the host CPU does not support GICv2?\n");
     } else if (ret != -ENODEV && ret != -ENOTSUP) {
+        /*
+         * Very ancient kernel without KVM_CAP_DEVICE_CTRL: assume that
+         * ENODEV or ENOTSUP mean "can't create GICv2 with KVM_CREATE_DEVICE",
+         * and that we will get a GICv2 via KVM_CREATE_IRQCHIP.
+         */
         error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
         return;
     }
-- 
2.20.1

