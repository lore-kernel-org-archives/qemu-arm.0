Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3021921lfc;
        Mon, 18 Oct 2021 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGU5ummf3uZ121vzcQfvs9PaX9diHU8Jp/p9lVgSmL4bBn16bW8RXUoDIMzK8eS1XEj0h7
X-Received: by 2002:a05:6102:3711:: with SMTP id s17mr21835015vst.60.1634564490230;
        Mon, 18 Oct 2021 06:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634564490; cv=none;
        d=google.com; s=arc-20160816;
        b=WPq40VM4ZG/Q6EBFIRHGivXW+51Gsz0MH06cPUIFpobgwTe5flCIsEJUbm6afIT4Y8
         SLBblXaUQxhpwtnWJjUWxW7QJrEgsKmS55OYW5mGI/083zvoqOIlkPsB+YtVDooC/EY/
         QBIIFatwczwDcGEruZPm+6bGB9K/c2gTIDoHKDMyATCxgnLX59akheSCGaZLyZNPZwjj
         gE8+eo5r+rRTueuadDcacyocPlRFFVTYFyvp1PQOzOkepoYa3CH9t7WhChdH8Yo3gAyA
         jRIdrcII7DC5i1uFlJ03FKA0XpbRi5PRAldYWMcUFLAb6zROgH5/V/sRbZNdHfOCxKU4
         Q20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ojuEq+0g68dX2kHDNSioeRUCklOWBEsOZnsrDZB/414=;
        b=kZVynB69fGgmtq6ujan6czO9ywy0LxHZeXMMSPrvqARFRJLSFTBHnpL2wBLxLzoWex
         XjihdWCT79szzhrtVJgEUbYcs6vnU8M5x3/4OOZWaJyVeqfmHihit+ufhQpARBR63YVE
         L8F/nGuAu4APqp1x6IL1acHsN699lsWbHJwzx9paAkTBwZCIqkPep/aOG9ljOMojL1E6
         FXAx4E7CcBqSepSUWc91Llts/PqWgSiGRaNig4a81ZtqGJoWgqnO6W85ONMl1bV9GCM4
         MmGHY6VGoElFe4WsgrryAhu6ESCOcQ9lypiWkKVQr1myZuJz7pMrHWWz8LFsWFADzcYp
         YUOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n63si11019751vsc.229.2021.10.18.06.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 06:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcStN-0001kl-Jn
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSei-0002wF-01
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:21 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:42225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSef-0006ED-Ln
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 734BD1FFFA;
 Mon, 18 Oct 2021 13:26:14 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00177649be0-59b1-4f34-957c-ba3fbdc143c2,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/5] speed/sdhci: Add trace events
Date: Mon, 18 Oct 2021 15:26:09 +0200
Message-ID: <20211018132609.160008-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9093df4e-e7b5-419b-ad91-ec691fe96755
X-Ovh-Tracer-Id: 8499699875552791401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZUWmwHkPusV

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/aspeed_sdhci.c | 5 +++++
 hw/sd/trace-events   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 3299844de6dc..df1bdf1fa4ed 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -14,6 +14,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 
 #define ASPEED_SDHCI_INFO            0x00
 #define  ASPEED_SDHCI_INFO_SLOT1     (1 << 17)
@@ -60,6 +61,8 @@ static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
         }
     }
 
+    trace_aspeed_sdhci_read(addr, size, (uint64_t) val);
+
     return (uint64_t)val;
 }
 
@@ -68,6 +71,8 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
 {
     AspeedSDHCIState *sdhci = opaque;
 
+    trace_aspeed_sdhci_write(addr, size, val);
+
     switch (addr) {
     case ASPEED_SDHCI_INFO:
         /* The RESET bit automatically clears. */
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 3cc2ef89ba6b..94a00557b26f 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -68,3 +68,7 @@ pl181_fifo_push(uint32_t data) "FIFO push 0x%08" PRIx32
 pl181_fifo_pop(uint32_t data) "FIFO pop 0x%08" PRIx32
 pl181_fifo_transfer_complete(void) "FIFO transfer complete"
 pl181_data_engine_idle(void) "data engine idle"
+
+# aspeed_sdhci.c
+aspeed_sdhci_read(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
+aspeed_sdhci_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
-- 
2.31.1

