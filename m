Received: by 10.182.105.169 with SMTP id gn9csp1646705obb;
        Mon, 2 Nov 2015 20:31:04 -0800 (PST)
X-Received: by 10.140.233.196 with SMTP id e187mr34791552qhc.86.1446525063983;
        Mon, 02 Nov 2015 20:31:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u186si11881957qhu.25.2015.11.02.20.31.03
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 02 Nov 2015 20:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtTFP-0002Pd-Jp
	for alex.bennee@linaro.org; Mon, 02 Nov 2015 23:31:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFM-0002Jc-H9
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFL-0000HC-KI
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:00 -0500
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:36257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZtTFH-0000Fe-IX; Mon, 02 Nov 2015 23:30:55 -0500
Received: by pacfv9 with SMTP id fv9so7110770pac.3;
	Mon, 02 Nov 2015 20:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EI5hAzI1DabJ7Xbl2lEY41boMqh4uY6Fo6LW/ap0SPM=;
	b=CjvgcbR4C26AB4AfXwzhnudyuoEEIhUjrE+CTBmmWtSvZeAkLw/3z6MDFfsvipEFMh
	hGutnQP+3i4XjuE9MvuexE6wmsF7I+V71CnnEPYl5n+bcRYCBwPepqLJyQxrAXO70nts
	wKc5vZtAbu6YfMp0lyiv9wxRVLXfxotVplVbwUaczEwSO7c3aGYgc3AZHnS1vr8H61ok
	ceZhT7H8wJZNrsOQZEvNr5urPEMA2Dlyhj49uDxTyiGCGoWZO5lEq43m03rUwBUx1dk+
	kD0udsNssJILnP9qM/6a9a114haeZO+NfL0nasWPdLE6F2q3zDEb32ZVV6wd9RCg8JoJ
	kWzQ==
X-Received: by 10.68.202.170 with SMTP id kj10mr31435565pbc.104.1446525055107; 
	Mon, 02 Nov 2015 20:30:55 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-251-070.mycingular.net.
	[166.171.251.70]) by smtp.gmail.com with ESMTPSA id
	ey2sm26830137pbd.77.2015.11.02.20.30.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Nov 2015 20:30:54 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Nov 2015 20:30:35 -0800
Message-Id: <bd4f60aa2f8ad0c5b739643459cd50b3bbe14d9a.1446428067.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: robh@kernel.org, qemu-arm@nongnu.org, linux@roeck-us.net
Subject: [Qemu-arm] [PATCH for-2.5 v3 1/3] arm: boot: Add secure_board_setup
	flag
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z/XJW+lZJD5l

Add a flag that when set, will cause the primary CPU to start in secure
mode, even if the overall boot is non-secure. This is useful for when
there is a board-setup blob that needs to run from secure mode, but
device and secondary CPU init should still be done as-normal for a non-
secure boot.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
changed since v2:
Assert if running KVM and board_setup_secure is set

 hw/arm/boot.c        | 8 +++++++-
 include/hw/arm/arm.h | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0879a5..f671454 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -495,7 +495,8 @@ static void do_cpu_reset(void *opaque)
                 }
 
                 /* Set to non-secure if not a secure boot */
-                if (!info->secure_boot) {
+                if (!info->secure_boot &&
+                    (cs != first_cpu || !info->secure_board_setup)) {
                     /* Linux expects non-secure state */
                     env->cp15.scr_el3 |= SCR_NS;
                 }
@@ -598,6 +599,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     struct arm_boot_info *info =
         container_of(n, struct arm_boot_info, load_kernel_notifier);
 
+    /* It is the boards job to make sure secure_board_setup is actually
+     * possible
+     */
+    assert(!info->secure_board_setup || tcg_enabled());
+
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
 
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 9217b70..60dc919 100644
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

