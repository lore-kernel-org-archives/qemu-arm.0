Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1524675lfc;
        Tue, 12 Oct 2021 00:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsbymi4zrk/K/AKetjVI2IDmShblPHtVD0fYXqQXurO1HBLKJPwVG/Rg/GV+1JEHH/M/7E
X-Received: by 2002:ac8:411d:: with SMTP id q29mr20786090qtl.349.1634024671557;
        Tue, 12 Oct 2021 00:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024671; cv=none;
        d=google.com; s=arc-20160816;
        b=inD+vnKpP9bjX26OB9FGFyzNg4L1duVvtIQzmZTVUmSRBB9dP8Ef9cVw0Y4Z/+W6YI
         IVNvd/xlYSZtTY4pxXCcxVhqwfEdeMg3qWWDX/iFBUCdB8q0jgnWTaNz3td3i82VWxsB
         iYohwb9bz5rESoV10kXyunRQTOjccCybtzwLl8OKAXluE6OvV06EWQ5oPGMjznyiTiAp
         jRd2zNwZfe8wWU8FhtfJvfTDYSsRPq2WyQgrrM6y5BHhthoHD4PavDIJw8ksBoSjoYkI
         qWAmEE6SvtZ211yE08J8u+RyBT8O6ukpNv8Y3gisYyZMJD5HoAKf6UVdTB/3PwQN2jzs
         2GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=oqcmsEKXmYP0GUCp0cx6qTZCdSRzH9mzZKniA3ocUyk=;
        b=grnowfb6KQnM3kMiTjud0sOBW9iyfx0wYvpb2BItoOekzlhh226pYYZkAzbYopPeuc
         0EcD5FOYwVNWUwHKh+74dxnAbUpmY9aPmt0W9kXi09jzuEEYRWa08IdbOAxTfhpi4wUS
         i//cVUDbkKNepvD+0GSRwYWLmLuF0jIAJZFuJ59/hZWKgEAdGrp/zLtlJZUmi/s/Z7Nr
         d4StXUabwwnpeAS9vZk4yY0SuakG2i2rSAxTz03oS/l8XuM5jEd4/aa0PceuQVIh8KHO
         kkajM+cqojJoEGVp2JL8ZNl8AyWP36nCp0apf+IoOJV2wPOo4sisiYkjUwLZL0I6UQzz
         pOkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si2448021qth.20.2021.10.12.00.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCSb-0004i8-Qy
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCMB-0000Tw-Ln
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:52 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:47943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM1-00052v-Us
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DA9B621109;
 Tue, 12 Oct 2021 07:37:38 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00695eaa9d9-fb53-4639-a02e-0b1442ca50ba,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/18] aspeed/wdt: Add trace events
Date: Tue, 12 Oct 2021 09:37:27 +0200
Message-ID: <20211012073728.257748-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4d4a0f72-0318-4a48-b3a8-46cdbef37ec9
X-Ovh-Tracer-Id: 4269975399963069289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkFiEPZc1LH6

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c | 5 +++++
 hw/watchdog/trace-events | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 69c37af9a6e9..146ffcd71301 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -19,6 +19,7 @@
 #include "hw/sysbus.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define WDT_STATUS                      (0x00 / 4)
 #define WDT_RELOAD_VALUE                (0x04 / 4)
@@ -60,6 +61,8 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
 
+    trace_aspeed_wdt_read(offset, size);
+
     offset >>= 2;
 
     switch (offset) {
@@ -140,6 +143,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
     AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
     bool enable;
 
+    trace_aspeed_wdt_write(offset, size, data);
+
     offset >>= 2;
 
     switch (offset) {
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index c3bafbffa911..e7523e22aaf2 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -5,3 +5,7 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK AP
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
 cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
+
+# wdt-aspeed.c
+aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.31.1

