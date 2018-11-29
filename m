Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2551200wrt;
        Thu, 29 Nov 2018 08:37:42 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U98sjEWVSECmLII6YUsnL9fWUlT/PUW1H/lKXmWbMKqcLq1sSpQlXK2ZbJJ1QOKmbpRQFz
X-Received: by 2002:a81:ac5d:: with SMTP id z29mr2075234ywj.290.1543509462354;
        Thu, 29 Nov 2018 08:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543509462; cv=none;
        d=google.com; s=arc-20160816;
        b=MquyK4IJi7li+HyTPVcVHnPjmiypvJHGMmEyBaDFLPCjk/pLt04Qz2mR+gzMIG+pfp
         GZmEJpPaf7OxIv/RHxX/o63P9MBSIfxfveJCSGPPi60KxE7rx7+DHnG5X12F6pmdzE+h
         9ssGrl5+N0gKEoADPY1ltns2kz5gSjTuUrocrpO0uIp6mdUrJdILc1hTRNby7FCOartc
         eQRzqZh97APUqFGJ5SScKfUzcQJvGpmB/N7J+GwIx/75G7295ixtYGVRO0aZ7EO28hZE
         oWSef73Q/vzLsGKy77x26TCBBIrEuKldbVJBAEhv0JLH4hGFs1aPEDSFn36OFuP8/8H+
         VlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nq9Wk2QkVEYJmKL6xIte34rg5zKDcxVJdqv/jdXiST0=;
        b=TQ1xZvAUeaPybvVG5ngrJRzUFDP/lkwp4IbvLdYJeIyStC12JumRFk2rnQ+LjcdRp9
         KzmBiMz/yH5gPtE+gcSm74Y39WU+417JVOSpwAL3J4r0218lF1HiHkeUHrsR+rZD/kUA
         jMqbgh/xFjoG6qkKh4kDwBY+4prduRYtUul7Q/H3b+zXZDoUqCxDqOOUEWnZWTUYB/+T
         t3TIA/aoWRRsPt0HFPM5N90xNT8q/Iw1JYMXA8Mf8pmAXXvKbdfzKr4QbWN6oFN7FyTJ
         ht4OThc3dKQy6hXNX5bV6CnoSQl/15mtPIBIFN8ab/vBp9wMrpyuxTUF/bV36GIex502
         2SEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HN8xbu68;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q68-v6si1500566ybq.351.2018.11.29.08.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HN8xbu68;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSPJt-0006rw-Ms
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:37:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJI-0006pw-Pl
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJG-0007Gd-Tt
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:04 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gSPJG-0007G5-M9; Thu, 29 Nov 2018 11:37:02 -0500
Received: by mail-lj1-x243.google.com with SMTP id t9-v6so2316943ljh.6;
	Thu, 29 Nov 2018 08:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nq9Wk2QkVEYJmKL6xIte34rg5zKDcxVJdqv/jdXiST0=;
	b=HN8xbu68xchsVmHeNxyaz919s2PesCLPihI2/Mgx8XtKevv7vMhUqI/d+65Lmw1gqT
	CLVAW+x+cHy8FsKKxW1QLtU+S9Xf8pRTOZLCxt/v1qkRhkRcklTxsciDtEJaykzfH/KR
	EI3vubp/CRiiMvjf95r6idrxxvRBMJHHjlM+Z6v4naQCo2fbQINmJNKQPIlgalMLYW8J
	6JE2HFAJqAmdXy5o+o3hD/VyusQvKYEzWPYiLzjdIHaxAdW9nfWE21MCnzBmRiUZ5Zvq
	VPC8umAT80xCKk5t/Yc1+xAgPUG4XF+q1j1JXLzGaq5YBl5Gk7QEkNX9U9ebhteeHysV
	IFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nq9Wk2QkVEYJmKL6xIte34rg5zKDcxVJdqv/jdXiST0=;
	b=Luxl2cmpteP/sWa92hIpgeBC3NzYYWFN+D62+TgwUercfUmsluC8K8QzNNzHTHPaCg
	9trImMHQGGdGIyVbthpHOhVYGQiEJXDX8VNnyQmMEyCFP9fvR0XwrOgXy2r4E9Q7H/Cq
	kBCFrBuAxzJfg6qT0NDxDWhBz9k3vJDrwMI8qnWeaXN+Jq0/WbtcUOo5m95LrTUV5AWj
	QIZ6LCBOjXKvMUqZX1HukGdIMyHYO379qixF7YuypoYSnTQa23oMQVCuTYOEeNsg2S3W
	drLxiTmK2HOTCbVrjiUtrOLS5Nmst3ouhzCv3ArfA35DDKq2ETbOitx/oHHPJdMZ3Fke
	b6Qw==
X-Gm-Message-State: AA+aEWaTBZfhjvJkpggtPiLpPxyJgLBzekSRvfUYdwYBCo/44I0akksB
	175CQwqmVUAhwMnXilPHbtQXSSWK
X-Received: by 2002:a2e:80d3:: with SMTP id
	r19-v6mr1574714ljg.151.1543509421067; 
	Thu, 29 Nov 2018 08:37:01 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id b17sm384192lfc.21.2018.11.29.08.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:37:00 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 29 Nov 2018 17:36:53 +0100
Message-Id: <20181129163655.20370-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129163655.20370-1-edgar.iglesias@gmail.com>
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH v1 2/4] hw/arm: versal: Reduce number of
 virtio-mmio instances
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
X-TUID: uBcDnPZ+nBNp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Reduce number of virtio-mmio instances. This is in preparation
for correcting the interrupt setup for Versal.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 41b8d801c8..2ed6ee9934 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -342,7 +342,7 @@ static void *versal_virt_get_dtb(const struct arm_boot_info *binfo,
     return board->fdt;
 }
 
-#define NUM_VIRTIO_TRANSPORT 32
+#define NUM_VIRTIO_TRANSPORT 8
 static void create_virtio_regions(VersalVirt *s)
 {
     int virtio_mmio_size = 0x200;
-- 
2.17.1

