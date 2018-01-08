Received: by 10.28.173.206 with SMTP id w197csp2617742wme;
        Mon, 8 Jan 2018 07:50:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBoui1B6EfcLWXkfpfrVD6G0SKMMOIwSepnZM76N07hBasMyolumOonZJ1zhWP9n4o7jlMrck
X-Received: by 10.37.198.205 with SMTP id k196mr11378712ybf.257.1515426652674;
        Mon, 08 Jan 2018 07:50:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426652; cv=none;
        d=google.com; s=arc-20160816;
        b=svUe0ANiWtjPcQOlxu7np4y9h30JyIR8P0shD53p0QfbeWLhioXJYKM2O/GHyQnyCS
         ekpbx7HHI4GxwRMqEF6X1LqL+gEGP4+XlkpaM6UnYmAYhXyZYnLfG4UPQpHyAjM2qeiQ
         PzWrjv3olKYCGCL+xmuWQ5L5/pnMh3CrOZMJxXzte/Rrwg5/UI1hrPEBje+gdOMDoRxn
         RXGwGu8u1FmnBzgLZPndtQTTRMuaFQrGubMR0ojsLiQuv5fm/Ge2fZBBqMdYL10FkCFn
         MMtUOCOtAbD3CKo5A14YgpjQ2d2XmMSy8NTM/C17uCVdXtjA/pTlAMXgzs9fud5/x1mv
         vXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8HpQu2bWF8IQpWCPLuKLgYH+jB8N2ED1FIN0AVDOkMc=;
        b=OHekUM8WDt+ezzYQPkLuN3iK9JHqeTN9zKGoKs5g3N0TIHMoULEpEVP4BmdEKlx8G/
         dwEVk/wNZUw2wrmBArCtDUgd4WOTW6Hi81KxLuZ0fqK7+zeVXbCOXliTNTj2f356Ukt/
         F+QvypqTzoz2Kqvf953UZG8DQokNhfhl+yrSMCWl+uNWuADjUtBN9zyFJHJI3YtHBc/U
         PvFY/ZcCzrIid1xoyzKQ7bXJ1oMZq2es4Y6myILTdG7cn6KL7I3McR6cs2vE/KoHFvhR
         q6Bl2yvYlXTd3g1HDZXdtALo/JMNBdBv/ZDO1EjiXwzH5IdKgCpNXqXfGvlHEP+VmAQw
         hp9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Oef6H/zE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17si2524625ywd.411.2018.01.08.07.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:50:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Oef6H/zE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZhM-00076e-2t
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:50:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb2-0001rM-ME
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb1-0007X3-W5
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:20 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZb1-0007Wp-RP; Mon, 08 Jan 2018 10:44:19 -0500
Received: by mail-qt0-x242.google.com with SMTP id r39so14069237qtr.13;
	Mon, 08 Jan 2018 07:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8HpQu2bWF8IQpWCPLuKLgYH+jB8N2ED1FIN0AVDOkMc=;
	b=Oef6H/zEBxzpZpZIn7KQhChBXIrNPo9R6ZeWzGgehMiOIFWyI/rsGk+3hb1SY7loCf
	x6NTF8VeLQbkiK33uEfgIZ+dv8vwNJRsTQnjQZyBzhDrlFiR21T5LcR2/OJvLdsSWXBt
	3f1bSbmnExkSBcjQo+JsOUbgx8iQ/K80yjfdej36JX6x5nVtmtHay/Tf38Oe4/e8o92A
	fMz7ck52yoC3rgbcKixd599OEJPFRHXN/fvXBdKego01fs2Rdsf/u3jK8qcwVO3oPKLk
	eUIXNGsiyB9GXx7d0ESWFHgh807Fs3fZdz74bhwzW0BtPcpYpSbFOYpTKI5wJfTSWVEf
	Egdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8HpQu2bWF8IQpWCPLuKLgYH+jB8N2ED1FIN0AVDOkMc=;
	b=rciJO/BiS/qOQ1lBBmHMDxWp0zEtuoNABQMVAFcFFdw9vRFQ5oi1yTX5+TbpjsXhZG
	0ljeNfHfMBMC+mRGvO/jjAeAFW3/NHowCsiPtmfnd+0oLPyL6S1MRgE6JsH8tqEWI17+
	FRea4cQjE5rtyL+1bjZImN+A2h4VPnuQaCKNqHvXBgnfC9v4ErzQqQxeqzLkLdSyAWeh
	tsrSB7fMnCmFRl23apG2hJ2cWSEm/A2GqBpYbJtpvI1K8W7CdQFHP85x41aYaKjhEHkM
	LIEGW4RWGzfIwHwxrgTVRIxVMsJX17VIoEqyBGuAjAE7ms6Tumc5TvbWCv88vVJNJInl
	wK4A==
X-Gm-Message-State: AKwxytfuAiKfZscRfrIMTrkHVHO1x72+Ba31a8e6s8I+847enkjxF+I4
	VA+3EoZFDB+UvbrhyXdwt/Y=
X-Received: by 10.200.55.227 with SMTP id e32mr15466893qtc.227.1515426259302; 
	Mon, 08 Jan 2018 07:44:19 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:43 -0300
Message-Id: <20180108154303.6522-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v5 11/31] hw/arm/exynos4210: use the "samsung,
 exynos4210-dw-mshc" device
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rPNOwYs+Ox3/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..eb95131221 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -75,7 +75,6 @@
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
 /* SD/MMC host controllers */
-#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
 #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
 #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
                                                 0x00010000 * (n))
@@ -377,13 +376,10 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         BlockBackend *blk;
         DriveInfo *di;
 
-        dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
-        qdev_init_nofail(dev);
-
-        busdev = SYS_BUS_DEVICE(dev);
-        sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
-        sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29, n)]);
+        dev = sysbus_create_varargs("samsung,exynos4210-dw-mshc",
+                                    EXYNOS4210_SDHCI_ADDR(n),
+                                    s->irq_table[exynos4210_get_irq(29, n)],
+                                    NULL);
 
         di = drive_get(IF_SD, 0, n);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.15.1

