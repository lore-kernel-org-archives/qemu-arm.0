Received: by 10.25.159.19 with SMTP id i19csp1802119lfe;
        Thu, 14 Jan 2016 06:18:05 -0800 (PST)
X-Received: by 10.28.88.8 with SMTP id m8mr34049591wmb.73.1452781074638;
        Thu, 14 Jan 2016 06:17:54 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id dj7si9933458wjc.66.2016.01.14.06.17.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKe-0008VD-3i; Thu, 14 Jan 2016 13:52:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 19/19] HACK: rearrange the virt memory map to suit OP-TEE
Date: Thu, 14 Jan 2016 13:52:55 +0000
Message-Id: <1452779575-32582-20-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: /rBHa+mfzwSh

The current OP-TEE codebase expects the secure UART to
be at 0x09010000 and irq 2 (it is based on an old
non-upstream patch to add a second uart, and upstream
used that memory map area for something else). When
the TZ support is upstream in QEMU we can move OP-TEE
on to a proper upstream QEMU and update it to use the
new UART location, but for now this hack patch allows
running a more-or-less unmodified OP-TEE.

Put the secure UART at the address and irq where OP-TEE
expects it, moving some other devices down to make space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e0ca231..1e0e0cf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -119,10 +119,10 @@ static const MemMapEntry a15memmap[] = {
     /* This redistributor space allows up to 2*64kB*123 CPUs */
     [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
-    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
+    [VIRT_RTC] =                { 0x09040000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
-    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_SECURE_UART] =        { 0x09010000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -136,10 +136,10 @@ static const MemMapEntry a15memmap[] = {
 
 static const int a15irqmap[] = {
     [VIRT_UART] = 1,
-    [VIRT_RTC] = 2,
+    [VIRT_RTC] = 8,
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
-    [VIRT_SECURE_UART] = 8,
+    [VIRT_SECURE_UART] = 2,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
-- 
1.9.1
