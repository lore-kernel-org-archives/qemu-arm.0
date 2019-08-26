Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3980909wrs;
        Mon, 26 Aug 2019 07:34:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrOKlIuhmRgjpe+AmnVr+mY0mXHMpLnXJ2EJ5NDLUmfCTRvIUOq1UJgxJzLtpBBc8RFWom
X-Received: by 2002:aa7:ca02:: with SMTP id y2mr18905862eds.205.1566830084649;
        Mon, 26 Aug 2019 07:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566830084; cv=none;
        d=google.com; s=arc-20160816;
        b=nPcimpi2bByOXxHzfY/U5qrQFuV5Nq3eJK/Xl1IwFvsr+qk1I7+lz29uKknYnmOp+v
         jfyOr0c/iRP769YflRop13Gj/LLLujCs3v/3xyj14jDnufpvylESY395Kunaa/1pb1AL
         aXG98jXqYpjso9cFXc9BL15BKgS7ZFWwxcOaanOcgcPqLDYsgsaaBJ/+lI0WBlI3QZ4L
         2QyKPUrOEii+cnI4rXB1wsfGiBLbwWbx2gjMSegD/mAdJdchKrxk74IbaYSsceYSpIlm
         dq3UHMg1BsFeyRmt4UTjXxu/3AffPnuw41oIcXlXIksv3c+QfJahe0xk6svEA4wjqbJ2
         htmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dYDFpDtzRFfAO9EOOiVDcYUEyfTzZGEBm8+iEpK3MfY=;
        b=VZ1zhGcrpY6OBBOm/dIMOT+vrm8ohP4B1PUTTVMTLYMfEi3AIXdUCKoJda1DuBjlVJ
         l26UR47EpblLIzjkwEkOdtGCSmScoKeD6v3WVd7+V9nC0VGSw4NoUm234jOsqTuIbXvs
         FPLvYFKKTu6iTkwZVljk4BGEH97aLzg5j40TYJe7IRr/o9dpn/y0RJoLN2KBrZVvaw1M
         K6U1LtDdvawBhvL2oOfmyNgAcYP0+saRc3C9UYiWu7rW0BnI08bzIopKVmJ403T7A9vq
         pHKSDzbjSYLUc4/1QRh0nezMlF58i1sEGMrl5WYi5Qt+c3lwVQFg6CqL+xJCvhJDzVet
         B/Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si7224826edb.149.2019.08.26.07.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2G4w-0000q0-HL
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpx-0004aF-DT
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpt-0000TG-Mv
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:11 -0400
Received: from nsstlmta18p.bpe.bigpond.com ([203.38.21.18]:34232)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2Fpl-00008j-T3; Mon, 26 Aug 2019 10:19:02 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep18p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141857.DCXX10803.nsstlfep18p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:18:57 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomheqpdhrtghpthhtohepoehggihtsehmphhrtgdrphhkuhdrvgguuhdrtghnqedprhgtphhtthhopeeomhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukheqpdhrtghpthhtohepoehpvghtvghrrdgthhhusggssehnihgtthgrrdgtohhmrdgruheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghp
 thhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440DDB0FB8; Tue, 27 Aug 2019 00:18:56 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:36 +1000
Message-Id: <554a2f98479cd6dbf0d0a1c019fe728b0902d0de.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.18
Subject: [Qemu-arm] [Qemu-devel] [PATCH 10/19] hw/intc: Declare device
 little or big endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guan Xuetao <gxt@mprc.pku.edu.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /v4L+W1QBRnK

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if not used, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-declare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/intc/arm_gic.c              | 12 ++++++------
 hw/intc/arm_gicv3.c            |  4 ++--
 hw/intc/arm_gicv3_its_common.c |  2 +-
 hw/intc/etraxfs_pic.c          |  2 +-
 hw/intc/imx_avic.c             |  2 +-
 hw/intc/imx_gpcv2.c            |  2 +-
 hw/intc/pl190.c                |  2 +-
 hw/intc/puv3_intc.c            |  2 +-
 hw/intc/slavio_intctl.c        |  4 ++--
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 1d7da7baa2..009933952c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -2000,38 +2000,38 @@ static const MemoryRegionOps gic_ops[2] = {
     {
         .read_with_attrs = gic_dist_read,
         .write_with_attrs = gic_dist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs = gic_thiscpu_read,
         .write_with_attrs = gic_thiscpu_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     }
 };
 
 static const MemoryRegionOps gic_cpu_ops = {
     .read_with_attrs = gic_do_cpu_read,
     .write_with_attrs = gic_do_cpu_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps gic_virt_ops[2] = {
     {
         .read_with_attrs = gic_thiscpu_hyp_read,
         .write_with_attrs = gic_thiscpu_hyp_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs = gic_thisvcpu_read,
         .write_with_attrs = gic_thisvcpu_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     }
 };
 
 static const MemoryRegionOps gic_viface_ops = {
     .read_with_attrs = gic_do_hyp_read,
     .write_with_attrs = gic_do_hyp_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void arm_gic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..9b4d5bad69 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -352,12 +352,12 @@ static const MemoryRegionOps gic_ops[] = {
     {
         .read_with_attrs = gicv3_dist_read,
         .write_with_attrs = gicv3_dist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs = gicv3_redist_read,
         .write_with_attrs = gicv3_redist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     }
 };
 
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 66c4c6a188..97ff537bf1 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -96,7 +96,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps gicv3_its_trans_ops = {
     .read_with_attrs = gicv3_its_trans_read,
     .write_with_attrs = gicv3_its_trans_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index 77f652acec..5895b671b1 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -112,7 +112,7 @@ static void pic_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps pic_ops = {
     .read = pic_read,
     .write = pic_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4
diff --git a/hw/intc/imx_avic.c b/hw/intc/imx_avic.c
index 63fc602a1a..15ed512e86 100644
--- a/hw/intc/imx_avic.c
+++ b/hw/intc/imx_avic.c
@@ -310,7 +310,7 @@ static void imx_avic_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps imx_avic_ops = {
     .read = imx_avic_read,
     .write = imx_avic_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void imx_avic_reset(DeviceState *dev)
diff --git a/hw/intc/imx_gpcv2.c b/hw/intc/imx_gpcv2.c
index 17007a4078..3df4a443b8 100644
--- a/hw/intc/imx_gpcv2.c
+++ b/hw/intc/imx_gpcv2.c
@@ -65,7 +65,7 @@ static void imx_gpcv2_write(void *opaque, hwaddr offset,
 static const struct MemoryRegionOps imx_gpcv2_ops = {
     .read = imx_gpcv2_read,
     .write = imx_gpcv2_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         /*
          * Our device would not work correctly if the guest was doing
diff --git a/hw/intc/pl190.c b/hw/intc/pl190.c
index e3bd3dd121..1b474d25b9 100644
--- a/hw/intc/pl190.c
+++ b/hw/intc/pl190.c
@@ -222,7 +222,7 @@ static void pl190_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl190_ops = {
     .read = pl190_read,
     .write = pl190_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl190_reset(DeviceState *d)
diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index e018955ce8..1c8ddbd70d 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -101,7 +101,7 @@ static const MemoryRegionOps puv3_intc_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void puv3_intc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index c4cf9096eb..d12e10374c 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -136,7 +136,7 @@ static void slavio_intctl_mem_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps slavio_intctl_mem_ops = {
     .read = slavio_intctl_mem_readl,
     .write = slavio_intctl_mem_writel,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -206,7 +206,7 @@ static void slavio_intctlm_mem_writel(void *opaque, hwaddr addr,
 static const MemoryRegionOps slavio_intctlm_mem_ops = {
     .read = slavio_intctlm_mem_readl,
     .write = slavio_intctlm_mem_writel,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.23.0

