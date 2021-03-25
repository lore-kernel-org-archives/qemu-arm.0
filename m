Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp466201lfg;
        Thu, 25 Mar 2021 07:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVGLmjI5dcFQaJvmGDnrVP26ei3+SzdgC+kQ280KCIqiGnhBH4BPoXLdFBE13Wlw3PY4/9
X-Received: by 2002:a92:c150:: with SMTP id b16mr6660992ilh.202.1616682515373;
        Thu, 25 Mar 2021 07:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616682515; cv=none;
        d=google.com; s=arc-20160816;
        b=Xmf/k+6IsFJ4xdtQsbzZ63gMsZMyPVyAiatP56ylqkKrmJxH6PFmvmEycbhQFCmxAn
         SwrxjVDQngLBTNoPbZ9mqdeNg73SoEsdQOcgHGnyd+mNfBz66CozCJjqnhXPU8ghF7M7
         cv+nuatC8VnY76hifB89JJErMsvZ7KAClxEvDbFLmuTpwrPpuIjZPkV8e/Z2J5BTjbWY
         3hfU8FMT2FfrO+Mzmws3twDrkcl1nx9E34hpcARdklaOwrVToV4GnEmCOOC0NauPlLNr
         dgjbiUJvaW2u76Pl8P4R/fo5XPzNe/EEfXYSmW8J/t910VJzSIEEj0OMN0zs+3zPfvWB
         KTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=CPN8yavTCmDc0Hivb+O7jqMVSfCeTuHjahPBbbrDQTM=;
        b=hNfoFjL/br5WqHeJNwxKwMgKkm6r7VhMZy61NFKjBIu2h3M0BXKUuozS9juSLUuESy
         YEgfrnw7ifEkQRqRV3akcdWwZ7urjwDFqU4OGeu9CE4qqK62Q0Ymp4R0XLVHFw1+EXfq
         FRISlpBL9z4SYdAH5oWv/YtdKr3GVwSJUHFLoETuS03HnzKL4a9af2pPgGdZJF7HUqFI
         jk0GZHeLeaxF5+LQDFBRrU7nLQTPeT2GH6ZOCnFi50dfMxEfSIk2UO/7RbtBb2CS9Kc7
         fV/twwPpybIXsccVF0apuZ21pdbFnGiM43Gj+OIGHHfhl8hHZ37F1a4nRaEsFZgMPBtM
         n8dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si4270245iow.105.2021.03.25.07.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 07:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPQyQ-0002KZ-OM
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 10:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQxM-0000tQ-PS; Thu, 25 Mar 2021 10:27:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQxK-0008Rm-6a; Thu, 25 Mar 2021 10:27:28 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5nRw3tCKzPltK;
 Thu, 25 Mar 2021 22:24:44 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 22:27:07 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
Date: Thu, 25 Mar 2021 22:27:02 +0800
Message-ID: <20210325142702.790-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pIN29PmGiVB/

They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
translate callback") but never actually used. Drop them.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/smmuv3-internal.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index b6f7e53b7c..3dac5766ca 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -595,13 +595,6 @@ static inline int pa_range(STE *ste)
 #define CD_A(x)          extract32((x)->word[1], 14, 1)
 #define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
 
-#define CDM_VALID(x)    ((x)->word[0] & 0x1)
-
-static inline int is_cd_valid(SMMUv3State *s, STE *ste, CD *cd)
-{
-    return CD_VALID(cd);
-}
-
 /**
  * tg2granule - Decodes the CD translation granule size field according
  * to the ttbr in use
-- 
2.19.1

