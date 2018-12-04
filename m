Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8070697wrt;
        Tue, 4 Dec 2018 05:31:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vt1Boi4TQAbI56T+k4fHLOpLknYQkCeL2Jd1p6jnzk8DXUd2R8dr51yorluge5HPJaKsAR
X-Received: by 2002:a37:b942:: with SMTP id j63mr18816969qkf.67.1543930274455;
        Tue, 04 Dec 2018 05:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930274; cv=none;
        d=google.com; s=arc-20160816;
        b=NGl+4wC/sy+nzcTxf6Amam7gysH2IOp+cJ8TbwgVgrgZICAgW0knVWn75INAV+LD0Y
         Q/dkf89pD+KsygwT+fdp326sAdBrjMK/c5sHSV7ZdEpiG9karfzRCeO3hsoi2r4t8Txx
         I3QHYX7+6XfIhnC2O1FqkKl4Ocy97BI7GR1SlMeAlPPLBny74ANDWYfwObtYgiR3dBaS
         axbiVPSyPzHAlWAWSEBPjm3HbftWXPubhptYwYSheJmAfd8+znrV5O1j0k/wjRPP8iDX
         3BDS5Ug2atzBmSRqWOtLhIKv+Xjtg6O0eBwDVW3RcsHJpghBtk/aWvwjUKJtn31AlSYw
         jk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mamUj2zWB24ciEZclPxo44bBVi9Ux6pp4DxcjmW26iQ=;
        b=amZHNDY4xylgs1emYsB4r7hqy1MA8nxFMq5P6Rds5o1U0L5PmLv3BmWHddNrqP2bw4
         BzH6Bex45ET4ZrlYFYczWnDZgxtxXpzDxFWXLBywdgqEqtPoSm7rR+Ej713ykZ41W3Gi
         qCp9uvvSoilxmRj6AIuVushIu95dII8OJseEyOLzoul7EnY4nMhElcgMwDnIBBwlfAUA
         vE9F3vpsBDCKKSHpbPsV9t7PBrL3irV7IItvvlifBJJqKrQF/ej+Zso0bzXWWyZZ4lQ3
         Vqq5JVpNlsI1LtqB0iNgHEudD4fkHYOgc2Qm/6zQ+kZJa5SNdmsj8j9qJDGTpXaLiIl5
         MfVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128si2656143qka.151.2018.12.04.05.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAnC-0008MG-05
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:31:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm9-0007jI-0h
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm5-00010a-29
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:08 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm4-0000pO-ML; Tue, 04 Dec 2018 08:30:04 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlu-0008CI-Ke; Tue, 04 Dec 2018 13:29:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:50 +0000
Message-Id: <20181204132952.2601-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204132952.2601-1-peter.maydell@linaro.org>
References: <20181204132952.2601-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/5] hw/sd/sdhci: Don't leak memory region in
 sdhci_sysbus_realize()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ryByv6MsELPD

In sdhci_sysbus_realize() we override the initialization of
s->iomem that sdhci_common_realize() performs. However we
don't destroy the old memory region before reinitializing
it, which means that the memory allocated for mr->name in
memory_region_do_init() is leaked.

Since sdhci_initfn() already initializes s->io_ops to
&sdhci_mmio_ops, always use that in sdhci_common_realize()
and remove the now-unnecessary reinitialization of the
MMIO region from sdhci_sysbus_realize().

Spotted by clang's leak sanitizer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/sdhci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 81bbf032794..83f1574ffdc 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1371,7 +1371,7 @@ static void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
                           SDHC_REGISTERS_MAP_SIZE);
 }
 
@@ -1565,9 +1565,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
 
     sysbus_init_irq(sbd, &s->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
-            SDHC_REGISTERS_MAP_SIZE);
-
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-- 
2.19.2

