Received: by 10.182.105.169 with SMTP id gn9csp1007474obb;
        Sun, 8 Nov 2015 23:11:39 -0800 (PST)
X-Received: by 10.140.175.65 with SMTP id v62mr5625609qhv.75.1447053098612;
        Sun, 08 Nov 2015 23:11:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si10128533qki.50.2015.11.08.23.11.38
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvgc6-0008HN-DJ
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:11:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbT-0007QN-Ch
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:11:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbQ-0008DR-4w
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:10:59 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:33778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvgbP-0008DG-Vl; Mon, 09 Nov 2015 02:10:56 -0500
Received: by pabfh17 with SMTP id fh17so190157616pab.0;
	Sun, 08 Nov 2015 23:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tHv2SdHr3SXh+cFWaVzsccgTu0dQwdb4LvAk5yj1A2E=;
	b=Qi9AoCm3l/um7FnS4kAPuNzU/NDIq/9eV2sy1sGPuxkT+Bbx3D12sOsKxyeYJANdTk
	X0+TKFn7HnDY0yH6d+gSRa0Dvdb2pbL5xn4HdWrWZovkAiHLR7qecH/1eJ5LEruWSdOw
	yEUgs9b9WVuFBe1tFzeZDnVu4MWzwvQV3XXm71uyR5B5r6/Jx8i0uoeSq60E61JEw1Sq
	9H7gs0AMBDDg9O8cLNVjLQbKpr1AxNSrzEFQUE/muAtUxMUveeVXpfGmxlB0N08b3Xey
	Q07HA+dRul+tFlWx5a+6UcOrNJd+WSWfUNBVUe9oxg5rIS1ggTm8+rU4v3KAnI3GdQLs
	a/ng==
X-Received: by 10.68.204.133 with SMTP id ky5mr33854246pbc.134.1447053055438; 
	Sun, 08 Nov 2015 23:10:55 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-248-219.mycingular.net.
	[166.171.248.219]) by smtp.gmail.com with ESMTPSA id
	vl1sm14294818pbc.31.2015.11.08.23.10.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 23:10:54 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 23:10:32 -0800
Message-Id: <d1170774d5446d715fced7739edfc61a5be931f9.1447007690.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH for-2.5 v4 1/3] arm: boot: Add
	secure_board_setup flag
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iVSi6ZcfVoSn

Add a flag that when set, will cause the primary CPU to start in secure
mode, even if the overall boot is non-secure. This is useful for when
there is a board-setup blob that needs to run from secure mode, but
device and secondary CPU init should still be done as-normal for a non-
secure boot.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
changed since v3:
Clarified comment for assertion.
Changed tcg_enabled() check to kvm_enabled().
changed since v2:
Assert if running KVM and board_setup_secure is set

 hw/arm/boot.c        | 10 +++++++++-
 include/hw/arm/arm.h |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0879a5..75f69bf 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -11,6 +11,7 @@
 #include "hw/hw.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/linux-boot-if.h"
+#include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
@@ -495,7 +496,8 @@ static void do_cpu_reset(void *opaque)
                 }
 
                 /* Set to non-secure if not a secure boot */
-                if (!info->secure_boot) {
+                if (!info->secure_boot &&
+                    (cs != first_cpu || !info->secure_board_setup)) {
                     /* Linux expects non-secure state */
                     env->cp15.scr_el3 |= SCR_NS;
                 }
@@ -598,6 +600,12 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
 
+    /* The board code is not supposed to set secure_board_setup unless
+     * running its code in secure mode is actually possible, and KVM
+     * doesn't support secure.
+     */
+    assert(!(info->secure_board_setup && kvm_enabled()));
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
 
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 67ba7db..c26b0e3 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -97,6 +97,12 @@ struct arm_boot_info {
     hwaddr board_setup_addr;
     void (*write_board_setup)(ARMCPU *cpu,
                               const struct arm_boot_info *info);
+
+    /* If set, the board specific loader/setup blob will be run from secure
+     * mode, regardless of secure_boot. The blob becomes responsible for
+     * changing to non-secure state if implementing a non-secure boot
+     */
+    bool secure_board_setup;
 };
 
 /**
-- 
1.9.1

