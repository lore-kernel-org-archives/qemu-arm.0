Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2553830wrt;
        Thu, 29 Nov 2018 08:40:26 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WivSlYFRkeauGBgF0ZxoXTlhpvnxZoKTEdKyAKoOvjHEqbyilx/xBoRIeb4jUbqe0Z9pjJ
X-Received: by 2002:a81:9244:: with SMTP id j65mr2112800ywg.36.1543509626053;
        Thu, 29 Nov 2018 08:40:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543509626; cv=none;
        d=google.com; s=arc-20160816;
        b=reX7oC0PaqIg6zDpPZu4DDLQRpcS7Y0vKqtO+VnQgf0nRHIsNh8nnJMwWYSTkEo334
         LeP2Wvj2eVIcKO8flSVX+ZZ7cP4C3e+GhyzOKtskwqbXvNpXTz7y1ppIvHl/KfL3lpK1
         XKUNLNqCqP/4KaozOcio6PWDa9U2WrGG36ArTB37NiWATxaREfG05Na7q4P1vsW9xKrQ
         kSSgvDIqgoJTPafecAbLYaeFg9bOVmONgQL44dbq4ojYfLnUUsO48nBn4UepfXin8+6I
         /NrB0xOlqxqrqrd/ijvDKHqm6I7dUCIGA7GIg4noyE665SyAhDb9ZVN9KUg78i+1bf2h
         9usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yCQBYP+c+rJdGPih61z5OTAPupDDbSWzHLcMswiIhtA=;
        b=Bd2Ot+YNBWmOnAYLEKvk8NHF7igfOP5GbSrHLKwTycXd7Cj6EKj/KFOVxnA86Er+dq
         RYTwe1kcVD3PNUH3cDT60lkSZl22cKX64JrcImIq0ElLxHNvrQPVv04EAzXYUjoJMKIl
         XdtGHxvmzeOU7u8NqES29jdtGrVz0XXGtO/R3/8HsLM+/1icTLjnBzhtobkwhIXXd8KZ
         3WloGooqo2rf23k6Wy3ekx9QpIzePSlfxWUuTVo0n7OlmPAqscgM540BOyTvAyp84Ww4
         AUSiDmlzXyR01hs19aextRmoojwu1/5jdymtJh6GgZ48aLeDed1UeECBFIuO8sjhT8d9
         +Y6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+IlHcs+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r14-v6si1442353ybk.108.2018.11.29.08.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+IlHcs+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSPMX-0000xe-7R
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:40:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJK-0006qw-7j
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJJ-0007Hy-Bd
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:06 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gSPJJ-0007HJ-0n; Thu, 29 Nov 2018 11:37:05 -0500
Received: by mail-lf1-x142.google.com with SMTP id f23so1899392lfc.13;
	Thu, 29 Nov 2018 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yCQBYP+c+rJdGPih61z5OTAPupDDbSWzHLcMswiIhtA=;
	b=C+IlHcs+fJBlefbpkBp5Eg3mspxomAzlbJjuux46k0xwPoemp8NWTrvGzaD/AHJPFP
	SaGMEunLuGimuinRnkfz98pLLxOvBSp8h3PmBN2DXF4B+N4q35Y0bUXyC2u/KIK8nl8K
	GM/vhaSsSf7jQfx7+NyKVXo/6sDyMIZSrDUnQq8ecLYGDi6A8dJRR0CkyzlM5hRHHoqj
	q6QSrB4n9+kI1Rg5lod12xpMCZxE3D3hLTp+imDQ4An+KLTvijdhA8XVAjRaVlsYCeHw
	9j2f9LsOGQraWthZ2yQCaYM+CGbt2+RkKO+4cT8LJZFSaj9g4pAYa6BPTDyp1HugsLsZ
	qusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yCQBYP+c+rJdGPih61z5OTAPupDDbSWzHLcMswiIhtA=;
	b=UY/1oRNTU9omLrN1l8oysAzoOt5p79j3Mcmf6JL/q1QGYpQoBnsdGOAZO/Ee/zpiJv
	AdGwS9xgtLgA495i98g49wUHxZPaneopV38hy5Nm8OBFK6Jx2Rto4THGhQCh2LxpIR6d
	s/3mfGYhUs+JL4NHnu85zb11p4OBpT74n0N4MMJqgdF5YDvmMWPLj5P2KOKqQH1fQp11
	3qYQxDstzjenfKP+xll3bXcTGyg9Bd34U8YYGCQQvzZY5mv9t4ESU1IsUTzp3z378+dw
	ZZI94B5Og844BCnuQaxSRrdgz772JC7CGVG9tRVPqTRc5Ovw5AQG73rw8V8L2qp5Aj7Y
	OQvg==
X-Gm-Message-State: AA+aEWasZdGlS7U8W1QfwutjVGtCjuxGDi6s1LHjLOYGUs3FC9/1YvCQ
	jqA2GzlJ61NpOIYE9yvlew0Dt44L
X-Received: by 2002:a19:6e0b:: with SMTP id j11mr1560468lfc.124.1543509423480; 
	Thu, 29 Nov 2018 08:37:03 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	m4-v6sm358065ljb.58.2018.11.29.08.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:37:01 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 29 Nov 2018 17:36:54 +0100
Message-Id: <20181129163655.20370-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129163655.20370-1-edgar.iglesias@gmail.com>
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: [Qemu-devel] [PATCH v1 3/4] hw/arm: versal: Use IRQs 111 - 118 for
 virtio-mmio
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 884DHfKrsO/7

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use IRQs 111 - 118 for virtio-mmio. The interrupts we're currently
using 160+ are not available in the Versal GIC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 4 ++--
 include/hw/arm/xlnx-versal.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 2ed6ee9934..c6feeac532 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -351,7 +351,7 @@ static void create_virtio_regions(VersalVirt *s)
     for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
         char *name = g_strdup_printf("virtio%d", i);;
         hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
-        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        int irq = VERSAL_RSVD_IRQ_FIRST + i;
         MemoryRegion *mr;
         DeviceState *dev;
         qemu_irq pic_irq;
@@ -368,7 +368,7 @@ static void create_virtio_regions(VersalVirt *s)
 
     for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
         hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
-        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        int irq = VERSAL_RSVD_IRQ_FIRST + i;
         char *name = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
 
         qemu_fdt_add_subnode(s->fdt, name);
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 9da621e4b6..76fb9de391 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -75,9 +75,9 @@ typedef struct Versal {
 #define VERSAL_GEM1_IRQ_0          58
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 
-/* Architecturally eserved IRQs suitable for virtualization.  */
-#define VERSAL_RSVD_HIGH_IRQ_FIRST 160
-#define VERSAL_RSVD_HIGH_IRQ_LAST  255
+/* Architecturally reserved IRQs suitable for virtualization.  */
+#define VERSAL_RSVD_IRQ_FIRST 111
+#define VERSAL_RSVD_IRQ_LAST  118
 
 #define MM_TOP_RSVD                 0xa0000000U
 #define MM_TOP_RSVD_SIZE            0x4000000
-- 
2.17.1

