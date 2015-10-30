Received: by 10.182.105.169 with SMTP id gn9csp909431obb;
        Thu, 29 Oct 2015 22:36:22 -0700 (PDT)
X-Received: by 10.55.197.216 with SMTP id k85mr7239803qkl.77.1446183380840;
        Thu, 29 Oct 2015 22:36:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g18si4523907qhc.82.2015.10.29.22.36.20
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2MO-0006RF-FT
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:36:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LT-0005K7-Hs
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LS-0002Pp-BU
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:23 -0400
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:35426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LS-0002Pe-5l; Fri, 30 Oct 2015 01:35:22 -0400
Received: by pasz6 with SMTP id z6so63139729pas.2;
	Thu, 29 Oct 2015 22:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vL/U2vQEINvt51m+yUV96NNeQ9GbpuCpkrfwALYcaYU=;
	b=b50oL1HDjiFSpWHYdXemQumoEBiMZcmJH20dGZ+nnuLwxpFI7YfgBahyZmSOdP3RhV
	TQuY0IvRPYpxceQniXoEkU+KoaIlYD8Zy4pcHLZ1fbNMkZXPqGicQHZJgGQtkgTPpu3q
	l18SLPF7jBO0S6v8KCkttnTpziDOSx36fMn3Auf9JyKT8aTiNNBpUc5l3oZj1SS0e7/8
	EsLw1tF+PmrYKPBHeYJ3XEXO1kQdH+3czqnP3Vj80PXI5szVBbgarX9BMan4pFovifzA
	DBXTau9zJEPiLz1hBclH9B/6ri0wecyf9ycqpdFdPg7QLMYQHwlfGMY3he6SpbY3nCEW
	i+Tg==
X-Received: by 10.66.124.200 with SMTP id mk8mr6361890pab.25.1446183321791;
	Thu, 29 Oct 2015 22:35:21 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:21 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:34:59 -0700
Message-Id: <8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
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
X-TUID: JHn4GR1k+Ss8

Add a flag that when set, will cause the primary CPU to start in secure
mode, even if the overall boot in non-secure. This is useful for when
there is a board-setup blob that needs to run from secure mode, but
device and secondary CPU init should still be done as-normal for a non-
secure boot.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/arm/boot.c        | 3 ++-
 include/hw/arm/arm.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0879a5..6680d45 100644
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

