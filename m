Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1955371njc;
        Mon, 14 Apr 2025 05:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZC8y1oif6CSdbU9RkkkDzTdZgmHomFo9Q+4DeIEIAN8tfIXLDn4mhgcQgxM7zkui+MkiEuDuGOD6IwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF0ZHDj7b9PjvVROPXM3hehEFf15+/kZMXsCYJE4MW3pjdswgO5JMMbaqdGnU95rITYNYzG
X-Received: by 2002:a05:6102:d8f:b0:4bb:e8c5:b162 with SMTP id ada2fe7eead31-4c9e4ef9549mr8047538137.10.1744632955389;
        Mon, 14 Apr 2025 05:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744632955; cv=none;
        d=google.com; s=arc-20240605;
        b=TCEQBJBepM4ijM1zh8Jl8S2x2W7weXogukb3Oi/YhWvOa1BvawemTvlGEVC7PU5uSi
         Qv3cOQaro24EpRHvCzqXkVeHgOTs+TKHi1jA1EXrlupGeY6jTEnJ4iYBsTceojUE2+W7
         jGHFBVPOHGIWjn11ba76gmXUoGla++AXSNH0Jqi4N3pPdO7V6MZymtkbZm03LP9Ay7Z6
         pvU4hEghkt1TfTEmRYRkemQjy4TorgMmTl1xz0LbHV58uzjs6K17SihEeWFs48Y9S9kJ
         B89hVRnm00FBitOzkxYHuWh4BfGXzSjPeVmuV9u9pAe5oPqNqBxsa6/Yy9zJUohS6sPm
         X2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mB4qL0jaLPZz5XW6a8lKBmBBq4MF4Z/7Zc24K6JxpCM=;
        fh=dzwHjRd61Nc1o7AXwreHGlpVWNNPAUvIkFOUApgz0Wo=;
        b=GBIUKLESt+0YGxuu+BMYHZo0R9Od4FLAcrbOFtbzEUg9iV7TG3izVVpCdd3iNbTb+y
         9BH9QMOSO5sJU+zBqlLEy3RHdYu0io2jQfvmLXuqns/+rNOotJt0Yy6e6xxh8gSn5GS7
         FOS0EBvs3TLbUrQvPRj0n9zA8FLvmREqug3p0MynvPdNdd0l6z0w22WE2TLP+CYaL7DP
         2heT0UPBr9ULVSzQC2JdYWv27IN2TVBOFvbUNwzAHlJIy+u5lBQPSEWcZxdsuauyYGKn
         c5I9ica0eFA2CSChHpH6SfQCft0MJjgSuYrf9HbrMwbFjmGGeHY3EnIFhTi0R7enoqec
         L+Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QX117j0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-875572ebe9fsi2973481241.180.2025.04.14.05.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 05:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QX117j0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4Iir-0008FT-8e; Mon, 14 Apr 2025 08:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u4Iio-0008F7-UB
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 08:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u4Iin-0002sw-0x
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 08:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744632926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mB4qL0jaLPZz5XW6a8lKBmBBq4MF4Z/7Zc24K6JxpCM=;
 b=QX117j0tADSSwWUz2zWAmzw/eXt117KWOYQYXV0aaH7qiun5EvqCEzsZWGe2Bb30bKOhaa
 K1ntPL/WeK+pz7Li12QOKMgUwEoVpQ4b5p2lnZGoY7DbXiTZ8N9oz+5sryEPuM0Ckq6410
 r2tBlg2xXzllBjf3Wt0leUd1BdO+2YM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-yTPN80acOVOFuYpOKOxbsg-1; Mon,
 14 Apr 2025 08:15:25 -0400
X-MC-Unique: yTPN80acOVOFuYpOKOxbsg-1
X-Mimecast-MFC-AGG-ID: yTPN80acOVOFuYpOKOxbsg_1744632924
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE5241800260; Mon, 14 Apr 2025 12:15:23 +0000 (UTC)
Received: from thuth-p1g4.str.redhat.com (dhcp-192-219.str.redhat.com
 [10.33.192.219])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 815DF1828AB4; Mon, 14 Apr 2025 12:15:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH] MAINTAINERS: Add functional tests that are not covered yet
Date: Mon, 14 Apr 2025 14:15:20 +0200
Message-ID: <20250414121520.213665-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NsAo8sXPFToF

From: Thomas Huth <thuth@redhat.com>

Some functional tests are currently not covered by the entries
in MAINTAINERS yet, so scripts/get_maintainers.pl fails to suggest
the right people who should be CC:-ed for related patches.
Add the uncovered tests to the right sections to close this gap.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f88..8f97115e890 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -475,6 +475,7 @@ F: docs/system/i386/sgx.rst
 F: target/i386/kvm/
 F: target/i386/sev*
 F: scripts/kvm/vmxcap
+F: tests/functional/test_x86_64_hotplug_cpu.py
 
 Xen emulation on X86 KVM CPUs
 M: David Woodhouse <dwmw2@infradead.org>
@@ -626,6 +627,7 @@ S: Maintained
 F: hw/alpha/
 F: hw/isa/smc37c669-superio.c
 F: tests/tcg/alpha/system/
+F: tests/functional/test_alpha_clipper.py
 
 ARM Machines
 ------------
@@ -950,7 +952,7 @@ F: hw/misc/sbsa_ec.c
 F: hw/watchdog/sbsa_gwdt.c
 F: include/hw/watchdog/sbsa_gwdt.h
 F: docs/system/arm/sbsa.rst
-F: tests/functional/test_aarch64_sbsaref*.py
+F: tests/functional/test_aarch64_*sbsaref*.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -1019,9 +1021,10 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
-F: tests/functional/test_aarch64_virt*.py
+F: tests/functional/test_aarch64_*virt*.py
 F: tests/functional/test_aarch64_tuxrun.py
 F: tests/functional/test_arm_tuxrun.py
+F: tests/functional/test_arm_virt.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -1262,6 +1265,7 @@ F: hw/m68k/mcf_intc.c
 F: hw/char/mcf_uart.c
 F: hw/net/mcf_fec.c
 F: include/hw/m68k/mcf*.h
+F: tests/functional/test_m68k_mcf5208evb.py
 
 NeXTcube
 M: Thomas Huth <huth@tuxfamily.org>
@@ -1407,6 +1411,7 @@ S: Maintained
 F: docs/system/openrisc/or1k-sim.rst
 F: hw/intc/ompic.c
 F: hw/openrisc/openrisc_sim.c
+F: tests/functional/test_or1k_sim.py
 
 PowerPC Machines
 ----------------
@@ -1828,6 +1833,7 @@ F: include/hw/isa/apm.h
 F: tests/unit/test-x86-topo.c
 F: tests/qtest/test-x86-cpuid-compat.c
 F: tests/functional/test_i386_tuxrun.py
+F: tests/functional/test_linux_initrd.py
 F: tests/functional/test_mem_addr_space.py
 F: tests/functional/test_pc_cpu_hotplug_props.py
 F: tests/functional/test_x86_64_tuxrun.py
@@ -3151,6 +3157,7 @@ F: include/ui/
 F: qapi/ui.json
 F: util/drm.c
 F: docs/devel/ui.rst
+F: tests/functional/test_vnc.py
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -3818,6 +3825,7 @@ F: configs/targets/*linux-user.mak
 F: scripts/qemu-binfmt-conf.sh
 F: scripts/update-syscalltbl.sh
 F: scripts/update-mips-syscall-args.sh
+F: tests/functional/test_arm_bflt.py
 
 Tiny Code Generator (TCG)
 -------------------------
@@ -4190,6 +4198,7 @@ F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
+F: tests/functional/test_multiprocess.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
-- 
2.49.0

