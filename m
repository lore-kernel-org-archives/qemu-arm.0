Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3986565lfp;
        Mon, 4 Oct 2021 08:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9vkJq8pTeOJ+9sYR+Q/m2gv7z4nlwjzBQtm38aWRgRMp9Sm6U/ENHDpsxXKn9Zxsdlvyc
X-Received: by 2002:a05:6e02:1c04:: with SMTP id l4mr10309573ilh.83.1633362589245;
        Mon, 04 Oct 2021 08:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633362589; cv=none;
        d=google.com; s=arc-20160816;
        b=RxBC1jZc2gkrld4GvJ/V8IWyWP/pdtZ1EU5HoxMyjGdg8VIoCKAadSehUiNV+tj1go
         qyIpNtvpZHQuXI4Ys7ll/1Dyd2crRv4uHFRC7Rg4PUMJlDKWHF3tzOT+L6Q1aK1nYC+G
         0NDLKVmkCR27o3rFn6gLQHRWlo9a1WHovBCsMZZNWlT4GtNv/2N5FxYC7CpSZlQginzU
         QEgcyCAjZo0geZ+J9H7kT4s415etTJiqa1ReHzH33MMRHRmjrnHLh5rIUeoNB44sOpzU
         W56pKuIWOzZeBBJzjT3jXriMKMgSWFNNuAwZWgxlr7xI4Wb7oGGyKXDsWbVs3QjABHuf
         o1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=d9kfuGOTy2gq8cVvreQk6/35wYH7KxhTHVziha29VYA=;
        b=UIIDBP+bSu7xRFhec79UvXjMTy5DcRYYjakXaYzXiRD2Hq8I9GEZE0EQW9tVE+syzn
         LWTg8jo7ev6x3ZHl7rsv47XyiZiH/MokU7fUNV8DIZV87YNl9G11EBAqgR002Re32fmx
         6NdcRg2KlOfWmqe17L5pud90R/P58um+IvIeNxNHIb0PGTZV9gbzqDzX+yek0HblO6ZI
         SKlSH7HR3E+In7GURyXRgeoNzsnHNPwUA+cfKHkghLb21r7FWstJ1GFzau2rta2ywKsS
         RmuZwjmel0O8y+FTpKXASKjfJgJxgysFbGSZVEnW4pOCBGa3JldIPRrsPP27rzYxgQCf
         w+mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si5483531jat.43.2021.10.04.08.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 08:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXQDs-0003F0-Iy
	for alex.bennee@linaro.org; Mon, 04 Oct 2021 11:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAu-0000zj-2Y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:44 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:57911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAs-0001Cd-3T
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0597721C77;
 Mon,  4 Oct 2021 15:46:38 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002017bd19a-9c25-4f92-8aa3-05a66f16e2c8,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/4] aspeed/wdt: Add trace events
Date: Mon, 4 Oct 2021 17:46:32 +0200
Message-ID: <20211004154635.394258-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004154635.394258-1-clg@kaod.org>
References: <20211004154635.394258-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b9a2107d-e1c2-48bd-bee0-8228989132b2
X-Ovh-Tracer-Id: 2440106576764570406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXcrWcC5grSL

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

