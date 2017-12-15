Received: by 10.223.159.74 with SMTP id f10csp7090347wrg;
        Thu, 14 Dec 2017 19:16:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBoscq05Z9BkgnWb38r/RTK8TjuoTJ75JegVIMpdGnE8v/Vp+yLXLK1rDf5yaG0H9xn3yWsDS
X-Received: by 10.37.40.68 with SMTP id o65mr5771475ybo.433.1513307805118;
        Thu, 14 Dec 2017 19:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513307805; cv=none;
        d=google.com; s=arc-20160816;
        b=G8PcMRBC30MHozKsoC0bwe13qtpK6gXJcOI9Jhk8wYR5kmYknk9PvAMS3iQ2kDes1N
         3F0s9PuEEaXakwgTgN97vlyjFnjuVyx8bES3gE0l2PmjtHrka7UUyjYI92/kGi9PVVgc
         1jKCnjfjU8DFloZvpdzO+QBnsC4uFFS65W5hr/P5eGLyCzbzr+0SDBgx4PV17CRx0wgl
         EbP0Jfe4yhkVxhsCeuf6CCyaFiki/lVmSW4SUrNUYuZahEOxw9li/MhwAwQE6us6Zz4V
         nT+OVgJqDFHt0o+9PBnwykQgSlAfO2fVkCgfUeJSbs+gyzMvD0chor8oWkROK/+ElBC6
         wfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kKcbw0KUGCls87IUzcd7cjWqwoZDu2LOJa90opkzhDE=;
        b=Y6bBdkX7E49kfrKkv8gYF4fHoo1cyRv07InhAWyUojlcN5aSTllo3TBD6EVuEtBzvZ
         RcBdTpayuY8E3ncLKfQoE/zvFiwanARnXzF+6+3UQEvOhq8kcI850DhSJjti7XDIbVlb
         Ffhmt6mwxa7lKWR6ROIdn1632iKs+ia8YEYaRNX4l4V0cKWvbKuPKdkUaQ6igA3o6S0P
         3SFWLGiL/2rGlLzML4mlhb9Dd4Kbc6baVDWPfiOYTg0C9t5wuSKiVu5ZQwtQxA3cJLrN
         gAbuoKpS6CeYqG0aG6on7+Hy2+lfu2YJcIxw1ivo+x6kq9YwU/3R+qVIJDKjlbX2zQFN
         04Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZEreRIte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si1102814ybl.613.2017.12.14.19.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZEreRIte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgUO-0005ga-GG
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:16:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTq-0005V6-63
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTp-0000iL-9c
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:10 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:41070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTm-0000fy-Tv; Thu, 14 Dec 2017 22:16:06 -0500
Received: by mail-qk0-x242.google.com with SMTP id r184so1157761qke.8;
	Thu, 14 Dec 2017 19:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kKcbw0KUGCls87IUzcd7cjWqwoZDu2LOJa90opkzhDE=;
	b=ZEreRIteO5gwZwX390ZujViHYKRUc01UAc3LCHLQcHEyIVzzABo8brR/v2Vi9peZX8
	kYBNLsEn8Xs2jqr09b33pvn4snw2GjZiJgkPY8W3mRvNeoL3yiwD/2mjavnSY7a878qY
	ixiPZIyVIyX6ddbgPtq4OLEuDMMIxKTH2COZAqGAfZPNo1Ht8ovQEJG3B71pZgRP/crW
	YRz3mYxl1IfwgpYaPyo7s8DwYw1teiQJ/V8WxpSAh+EWKzCx+dM8DF0DjMFDh8J7yKaR
	LKJoTDCevTzD7Hm/CrvjepUY/NqcHWi1qTtaKPMy9W2UwyAI2UI+xQ7K0EfhdgwwEzED
	Mh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kKcbw0KUGCls87IUzcd7cjWqwoZDu2LOJa90opkzhDE=;
	b=Qs6hyMuagDt+DOH2C65awMq37U4biMMW7dXDxoYe5IYOMu/t851Lzr7Y3JF34MA/gy
	whtG8lGtyuqczq6JL1D2unW5U1uVc07EbK/GaZnXY6zjXw9TZus1mOEr099ocnCjx6is
	IatimKn3QYt6YngmEm4wt4k5J5a3oPJws8ukpfXsTr3jLhG991JEpfs7ZmJ8rCdwMZSk
	y+HP0eOts22pCRqTqbTMFUD+JhKblP2Z64cq4quja6PkF6jbCW6699nJJpdLx9uadDaa
	+qufWK1nqbOZAn4O7L9Z63ehvMGZbiDhn96TPevn2MJEMZiiAN90s8gJBT2381lE8BvV
	KVQQ==
X-Gm-Message-State: AKGB3mIMWgRPFEn/2fBUfT9ElpERRlHvFQwzjT11KinoxmCyHFVpRa4f
	ediih6lNcF3gm8Rjp3xo2UI=
X-Received: by 10.55.56.135 with SMTP id f129mr19499318qka.350.1513307766435; 
	Thu, 14 Dec 2017 19:16:06 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:28 -0300
Message-Id: <20171215031547.31006-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v2 01/20] sdhci: clean up includes
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g+wdKcj0L3Vf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci-internal.h | 4 ----
 include/hw/sd/sdhci.h  | 4 +++-
 hw/sd/sdhci.c          | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 161177cf39..248fd027f9 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -24,8 +24,6 @@
 #ifndef SDHCI_INTERNAL_H
 #define SDHCI_INTERNAL_H
 
-#include "hw/sd/sdhci.h"
-
 /* R/W SDMA System Address register 0x0 */
 #define SDHC_SYSAD                     0x00
 
@@ -227,6 +225,4 @@ enum {
     sdhc_gap_write  = 2   /* SDHC stopped at block gap during write operation */
 };
 
-extern const VMStateDescription sdhci_vmstate;
-
 #endif
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 0f0c3f1e64..1b6a98d578 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -26,17 +26,19 @@
 #define SDHCI_H
 
 #include "qemu-common.h"
-#include "hw/block/block.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 
 /* SD/MMC host controller state */
 typedef struct SDHCIState {
+    /*< private >*/
     union {
         PCIDevice pcidev;
         SysBusDevice busdev;
     };
+
+    /*< public >*/
     SDBus sdbus;
     MemoryRegion iomem;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index b064a087c9..b7d2a20985 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -29,6 +29,7 @@
 #include "sysemu/dma.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
+#include "hw/sd/sdhci.h"
 #include "sdhci-internal.h"
 #include "qemu/log.h"
 
-- 
2.15.1

