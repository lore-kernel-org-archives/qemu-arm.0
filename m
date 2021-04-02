Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1274995lfg;
        Fri, 2 Apr 2021 03:06:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6Vy++H6NVR/8/TNIGOLVoPBrorLqVPI0eqfZVvUJkpSDl6Eri1oT1re9uyjYHgRd1yRHw
X-Received: by 2002:ab0:7316:: with SMTP id v22mr7907873uao.134.1617357994509;
        Fri, 02 Apr 2021 03:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617357994; cv=none;
        d=google.com; s=arc-20160816;
        b=klPNBBfsURgnGEdothjMc+UYcvoieqU9qyZsn27N/zdoIxhgIVXx9q4JXTddzsTNk/
         CDZqr8Wm7s0H3wxqAFnPNdIk6JtVzuC7PGEAA9PteJud0/GPwZRGPir8FgrmqO2+uS2x
         x/Sdryca4y2wGgTVdRUIiiS3SJ/QN3O6ihi/VyhNHTGSAlpiJ2W4Hnsd8oWIfCZUX5Si
         liZF308Re+l1BQcw161d5xJ6F9nTlIREIp2aHxoPJ+S4RM17HjVM4zBEQZhTaYLrx1ij
         Xg2Wz2WD+7PVTNWDwjd3+JWCeJaGc//pCyHt/9UcK+GfvtTBFVjpCZqZtuXn1yVS66P4
         HWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=8bNvV5ohHuOEJMXQHmTAuS7JTmdOnOrzQWQYUQGg6+M=;
        b=Tv5WS3OuNSMsk44v1qRAARafm/kGx6ll0ul+HD7skaAY05IPJjaTsgCQSl6I/rytkR
         dHFf2DE48Glxb7nE9hTRhJyWMbzMagLaR0L65UT/F2txnAKmzyjWt3MDd9Y5Kh9Zfdig
         oao7efYaQAYEDN15oTNY9TFV5aQjxyp2wEB5b07/yzFojgxKiPWW6bCs/EoqwVWIr3s/
         ibfMq6PYFf90UyRaGiQkls9mnL6opiinQRxGvpN55n9KdKfaCj3JgXak7PZrjvXEpPTQ
         spVCodim2ug7jnm0xgvc1bAI83IERR4ys3oiueLf/RRdGtgLmX3FvbJ8jJ5Lv/ic/L3y
         eM2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si2089055uae.115.2021.04.02.03.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 03:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSGhF-0000eS-Pd
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 06:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSGgK-0000Fg-Lh; Fri, 02 Apr 2021 06:05:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSGg8-0004hq-U2; Fri, 02 Apr 2021 06:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FBbGH3PHZz9vwQ;
 Fri,  2 Apr 2021 18:03:03 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 18:05:03 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of
 StreamIDs
Date: Fri, 2 Apr 2021 18:04:49 +0800
Message-ID: <20210402100449.528-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yuzenghui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QkodLemn3S3

In emulation of the CFGI_STE_RANGE command, we now take StreamID as the
start of the invalidation range, regardless of whatever the Range is,
whilst the spec clearly states that

 - "Invalidation is performed for an *aligned* range of 2^(Range+1)
    StreamIDs."

 - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
    aligning the range to its size."

Take CFGI_ALL (where Range == 31) as an example, if there are some random
bits in the StreamID field, we'll fail to perform the full invalidation but
get a strange range (e.g., SMMUSIDRange={.start=1, .end=0}) instead. Rework
the emulation a bit to get rid of the discrepancy with the spec.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/smmuv3.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..8705612535 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
         {
-            uint32_t start = CMD_SID(&cmd);
+            uint32_t sid = CMD_SID(&cmd), mask;
             uint8_t range = CMD_STE_RANGE(&cmd);
-            uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            mask = (1ULL << (range + 1)) - 1;
+            sid_range.start = sid & ~mask;
+            sid_range.end = sid_range.start + mask;
+
+            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
             g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
                                         &sid_range);
             break;
-- 
2.19.1

