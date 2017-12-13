Received: by 10.223.159.74 with SMTP id f10csp5305400wrg;
        Wed, 13 Dec 2017 08:52:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBovGVBgTZ2GgjNlH7XNg+GlYCWFIXezuVdCYthg5LbODgy6k3v0hmtTOIZZtxQCIsKAFA88V
X-Received: by 10.129.131.197 with SMTP id t188mr2185887ywf.24.1513183973398;
        Wed, 13 Dec 2017 08:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513183973; cv=none;
        d=google.com; s=arc-20160816;
        b=ZScf7yHhiPZdIo7pv6SqrJOcGj0LfTwRo4RR7U8IHHaX9x0fv5U5LnqhZIQbedCXTt
         Nr8zP6i/pUMLULWOr3F3hIZvOA2vhUpErEanNThJuUjOH9zWiPvmpy/0OR0mmJVn3LeL
         dZxdQ/P3bpBWrnn+nOYWSf2+mEoj2fez/8CZm7CaoDpVX7T7UUYsiWVMbBlAaAximS+e
         MBJpYFqLjEw81THdb6czaeiiMfqy/8s9mIu6pVgl4PRJFJUSatSWyOXz4lHklwQ8Prwb
         fSac+Z/7wEiqdl9fhErkiCepOPlllc/Nx7RZZtya+TUASTNNALyy1GIvMvP/v6huh54f
         foIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=u38s6KJ1/xZSIqRdoq9FFsnR/cXGlKL7BFSl8xycdlQ=;
        b=JzKngBoNMC9m4YNutcyy59Ao8na7+McfLUkPlQWAQvNKv7dyEscMYaeM69OZnmgfBo
         Jqh8mi9GavhU4aj9Xvtg5I099ZD31jMoHSbB51mcOM3ldt/SHjOTr4juDnlQI8xo3hCS
         rASZo9gnTSRnhAxX+UmfYqns6RHrR4+/PWTHzu9Ruzh3KMW6Q/zW2fCwo+6sP39osfG7
         tj15jJ1TeLaYkfwxAn4x7VEDixm+zkUy18AmfrsteLKizm2SK1Mzim6qry+Tn/xhvMt9
         z2HwXLRITvnkZfmC/stkbgS2RyQSLh4IjU04nT2r6aiasNm26LhYDhRyO2eGR2Njby5/
         FvNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q136si436704ybq.589.2017.12.13.08.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePAH6-0002Y9-RK
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:52:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGi-0002Kl-E1
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ePAGh-0004JY-Cb
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:52:28 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:39072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ePAGh-0004Ee-4b; Wed, 13 Dec 2017 11:52:27 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ePAGd-0007OQ-Ga; Wed, 13 Dec 2017 16:52:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 13 Dec 2017 16:52:20 +0000
Message-Id: <1513183941-24300-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] hw/intc/arm_gicv3: Make reserved register
 addresses RAZ/WI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZe7/r5Rf5Mx

The GICv3 specification says that reserved register addresses
should RAZ/WI. This means we need to return MEMTX_OK, not MEMTX_ERROR,
because now that we support generating external aborts the
latter will cause an abort on new board models.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c       | 13 +++++++++++++
 hw/intc/arm_gicv3_its_common.c |  8 +++-----
 hw/intc/arm_gicv3_redist.c     | 13 +++++++++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 3ea3dd0..93fe936 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -817,6 +817,13 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
         trace_gicv3_dist_badread(offset, size, attrs.secure);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        r = MEMTX_OK;
+        *data = 0;
     } else {
         trace_gicv3_dist_read(offset, *data, size, attrs.secure);
     }
@@ -852,6 +859,12 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
         trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        r = MEMTX_OK;
     } else {
         trace_gicv3_dist_write(offset, data, size, attrs.secure);
     }
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 2bd2f0f..284c0a7 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -67,7 +67,8 @@ static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
                                         MemTxAttrs attrs)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "ITS read at offset 0x%"PRIx64"\n", offset);
-    return MEMTX_ERROR;
+    *data = 0;
+    return MEMTX_OK;
 }
 
 static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
@@ -82,15 +83,12 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
         if (ret <= 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "ITS: Error sending MSI: %s\n", strerror(-ret));
-            return MEMTX_DECODE_ERROR;
         }
-
-        return MEMTX_OK;
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS write at bad offset 0x%"PRIx64"\n", offset);
-        return MEMTX_DECODE_ERROR;
     }
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps gicv3_its_trans_ops = {
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 77e5cfa..8a8684d 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -455,6 +455,13 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
                       "size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        r = MEMTX_OK;
+        *data = 0;
     } else {
         trace_gicv3_redist_read(gicv3_redist_affid(cs), offset, *data,
                                 size, attrs.secure);
@@ -505,6 +512,12 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                       "size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
+        /* The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        r = MEMTX_OK;
     } else {
         trace_gicv3_redist_write(gicv3_redist_affid(cs), offset, data,
                                  size, attrs.secure);
-- 
2.7.4

