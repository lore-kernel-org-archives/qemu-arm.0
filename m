Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1696987njc;
        Sun, 21 Jul 2024 21:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjwRolwwoahN8VvyMgkbMj359GTIfMBn3+vvJ5s7nRB/Ivdy7JuPzpktoedldd9oUNiwk0FFhzrbix5F9DrOavrxE1Ispw
X-Google-Smtp-Source: AGHT+IEUk/xtYqpF/lPUiEMwCPncszdhCWQWiXCqljzaXaqoVDQKbGcFHiwiRFS//kX/jW0g7cNo
X-Received: by 2002:a05:6214:cc9:b0:6b5:3ca8:8b82 with SMTP id 6a1803df08f44-6b96106d589mr71865076d6.18.1721622029995;
        Sun, 21 Jul 2024 21:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721622029; cv=none;
        d=google.com; s=arc-20160816;
        b=t9a1UNHpUR5g3LAQm3bAknEEC4NwzZe04jP9v0WQ/JswRilMZ6j9f+1ql1CKrqA4OH
         Gs/blHcJHYGzmu4SsRHVWDPf/V7bbSrYIilGiAS8NwS0b1DUW2OwC5oKUqwDtl5AdrwN
         wT2DVXb3u1r8P5wfPwx7OBd37HirkO9VY7BSG95z9YmU8FUqhX1xe586SMKzlmhiBN3g
         9BHtUBwgHKscUnKWW33GSTFWInq0rwr5NQs7j7++Ti/E4003mfGOGlE5J9od5wd+3wG8
         i2HXpaIvTfIbfnNvcACqYOj5kXSdjWH3xPxJ0MQUapIKMAKOtknBWFYe8Elq/K5KJs6W
         cXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:dkim-signature;
        bh=loBEQvvBuNdrfYIzZMuRfM1SISeGaZGG8a79v0lZiF0=;
        fh=CY5E/3Lv3POg1Ssdm0MM/FBKn/QwCUfeiFqGV9GHeRQ=;
        b=wjep8a1O4qyGpq0K4+NzSdfk2ISoQcbSJmkN1QbvAa2V06blgCpRx2AoOWC9TV1GTh
         fdUS5KxzXg9X5gFqboHd7azeMfmbURzMiSWfwA4FJ+niQgCe6tW3vFELdI3HsngYSWOm
         pl2f1gbSmloq55nySJkitvVgPHUhzciwZi9pBIOmRuuz29jLqNGGGVqFuIHRtt/fdykO
         8J7CHTEXvUTUeuS76XhteCyoHnG5EFFoy5RJa71PXU5etdnsEKsKkKBl5q+kwL7Fhz/I
         JtFfAR3c9PdsYMNTEaObFt7KsB9E53Pnyx0yxBxWquNtGRMntBuqG++uMJYhrjYKIpUX
         xaeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail (test mode) header.i=@fujitsu.com header.s=fj2 header.b=jGzb39mu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acb0eb21si70833686d6.530.2024.07.21.21.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 21:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@fujitsu.com header.s=fj2 header.b=jGzb39mu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVkX4-0006sW-IH; Mon, 22 Jul 2024 00:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoxt.fnst@fujitsu.com>)
 id 1sVkMe-0003SN-B2; Mon, 22 Jul 2024 00:09:35 -0400
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoxt.fnst@fujitsu.com>)
 id 1sVkMc-0001uh-Hh; Mon, 22 Jul 2024 00:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1721621370; x=1753157370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qumiivx2cCD24Q53qJBJyPxD9WtGoUxPGPzrxWorQfM=;
 b=jGzb39muqxAbdS3v3MhiskhTQFxfMiVrZ6VT35vET03mcGwDK/87QazE
 WdiIBdt6Fymg58s0r1X67ik+wEAgYCBVnqT/hquM3xHadQXgxynDj2OZb
 KsuSOshDapWdppQTD6o4G0T+5ENCqFc6Wr0PX2PLPZtV+M4GJ1Z20a1e2
 Kf/bA8+uIEPOY3O/zPs8AU1qIjx7SQUzFP4QSEvNxXcn5udm3M9ruIBC7
 /vDkBmhzWJf+QiFr2fhQ/oI/4J7eecvBksuByIswCe2/3Y4xEMzJbwn+Q
 kCDoiEFLgcy/jblRsSlfirkxXKyNamNwKMl5nPJHNWCFM7yqPTxsYE27G w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="156091037"
X-IronPort-AV: E=Sophos;i="6.09,227,1716217200"; d="scan'208";a="156091037"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:09:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51761D922F;
 Mon, 22 Jul 2024 13:09:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93CB1BF3C5;
 Mon, 22 Jul 2024 13:09:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E8A642007CAAE;
 Mon, 22 Jul 2024 13:09:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.88])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id C7D5A1A000C;
 Mon, 22 Jul 2024 12:09:22 +0800 (CST)
To: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: Yao Xingtao <yaoxt.fnst@fujitsu.com>,
	qemu-arm@nongnu.org
Subject: [PATCH 06/13] aspeed_smc: make range overlap check more readable
Date: Mon, 22 Jul 2024 00:07:35 -0400
Message-ID: <20240722040742.11513-7-yaoxt.fnst@fujitsu.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722040742.11513-1-yaoxt.fnst@fujitsu.com>
References: <20240722040742.11513-1-yaoxt.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28544.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28544.005
X-TMASE-Result: 10-0.560200-10.000000
X-TMASE-MatchedRID: iXIp5h8ckINrFdvBEmTnvE7nLUqYrlslFIuBIWrdOeMiB3Nk/d/KPzAz
 xXEecc9kbP/Ei6ZWBVl8AX8i9OoygDcpdZ3fQiLdFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtlu/
 VKvCjKPWWCMgTNY5uqT6CF6AS8uspkU5FLuKEMQ7Xp+P1fQuP4cA3SWsItEgwlLQfiHD2BsVPwx
 Md7ySvYSQ4JrCfa4jMZO2i7mevsWiGk+xUaqdMDwHEKwHwYevbwUSxXh+jiUgkww/gwY7hMA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
Received-SPF: pass client-ip=139.138.61.253;
 envelope-from=yaoxt.fnst@fujitsu.com; helo=esa8.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Yao Xingtao <yaoxt.fnst@fujitsu.com>
From:  Yao Xingtao via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qC0/ZovPwXbS

use ranges_overlap() instead of open-coding the overlap check to improve
the readability of the code.

Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
---
 hw/ssi/aspeed_smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 49205ab76d38..cdca359e1d88 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
+#include "qemu/range.h"
 #include "trace.h"
 
 #include "hw/irq.h"
@@ -246,8 +247,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
 
         asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + i], &seg);
 
-        if (new->addr + new->size > seg.addr &&
-            new->addr < seg.addr + seg.size) {
+        if (ranges_overlap(new->addr, new->size, seg.addr, seg.size)) {
             aspeed_smc_error("new segment CS%d [ 0x%"
                              HWADDR_PRIx" - 0x%"HWADDR_PRIx" ] overlaps with "
                              "CS%d [ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
-- 
2.41.0

