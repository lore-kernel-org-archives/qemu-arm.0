Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp34214njc;
        Thu, 20 Feb 2025 19:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKpP+twjyfGzcP5IaxIysthIL2gxJR7cm/5x7794RMC4F454cdwr0MA1YmVrDm4Fnxw8LW4F6BKIvyaA==@linaro.org
X-Google-Smtp-Source: AGHT+IG3ThtRYF/XCIZSoPpr8T/7L7j1x+ikk9kolaCxethyxq0KIJ43shw6qI1Apta/zV6UwZyT
X-Received: by 2002:a05:6214:27e2:b0:6e4:1e16:b63d with SMTP id 6a1803df08f44-6e6ae826c01mr24461616d6.21.1740107831100;
        Thu, 20 Feb 2025 19:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740107831; cv=none;
        d=google.com; s=arc-20240605;
        b=FE6M/jVdYP4Y94ObNQfFo/Xw6Sz5elGAe/xJIDZk8ZaPlANreyqAZnSli+dJhGgXzc
         tVB/bLuCkePpwDrMYRHaXxFMr1wHDg5tYoGqIVwfxfK36BWp2FJyRx0aB92KU2YMbVrm
         3U8ADVrF32o+1QwDjTzhjugrROYnuwISW2ogvUwoiloaJr43Sft+YqXANMqfhmuGdL46
         l98GHhlKrXblWyyxp9cvVIs9HzIXSr9kA/g6XHUe9Svf9uxywcTStTFWj5M2UniyHJ7R
         bCj2Fym3Vs45y6CMYO8FZ0FV7n2MGY9fyveGugQf3njPvfdSp4bQw+kP3s2jmZUeYrgZ
         3aSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vRyjzM26596g0rex81kRyahP8LmmorZ5OB4wZUpg9PE=;
        fh=NxnZD4OfFHTpMKoLcw6MAO167pwULiNLHR8SUExNbQo=;
        b=RK1ea8bAEqFXv08bBlDar/ywBZptZ7RhLg2sA/Y1FPiPFX1DP7IsKwebu2/qTL3V8+
         YE/43yAMDaA72UrtHhA21pZAXblFopWcbVDSiuWaz7yFy4Iaj7m0/sNpuaH5hoLr2S4+
         WcS33DmsmtHy93/e53NPMFh+TaBCA7cDi2+fn5WeMtQETAhytXvHhYGCrQZ3teIK6EKq
         e1yNapR3hsQPJbgwPsdd9WCpPk4oyc9rvGzZLWHz43xwqvrIUWQOjKa6QHnXiRiqX3+8
         H0XholSKHtFQ5Pqu+K5EaD4bCy/AFPsczS9SN4GmTP++Qt9wQci/tDkAuLA1K44LiAYD
         AmNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hj-micro.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9cc881si156192386d6.408.2025.02.20.19.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 19:17:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hj-micro.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tlJWR-0000sW-W7; Thu, 20 Feb 2025 22:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jansef.jian@hj-micro.com>)
 id 1tlJWJ-0000ri-98; Thu, 20 Feb 2025 22:16:11 -0500
Received: from mail-m32123.qiye.163.com ([220.197.32.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jansef.jian@hj-micro.com>)
 id 1tlJWE-0005E2-7A; Thu, 20 Feb 2025 22:16:07 -0500
Received: from localhost.localdomain (unknown [219.146.33.230])
 by smtp.qiye.163.com (Hmail) with ESMTP id bbb915e9;
 Fri, 21 Feb 2025 11:10:40 +0800 (GMT+08:00)
From: JianChunfu <jansef.jian@hj-micro.com>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 JianChunfu <jansef.jian@hj-micro.com>
Subject: [PATCH] hw/arm/smmu-common: Remove the repeated ttb field
Date: Fri, 21 Feb 2025 11:10:34 +0800
Message-ID: <20250221031034.69822-1-jansef.jian@hj-micro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkhKVk4aGhgfTR5LHUxKTVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlJSkJVSk9NVUhIVUlIS1lXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
X-HM-Tid: 0a95267c628709d2kunmbbb915e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Eww5GjIPESENMQ4RHTI5
 HDJPCRpVSlVKTE9LSktMT09KTEJIVTMWGhIXVREaFQgeHVUREhoVOxMRVhYSGAkUVRgUFkVZV1kS
 C1lBWUlKQlVKT01VSEhVSUhLWVdZCAFZQUNITDcG
Received-SPF: pass client-ip=220.197.32.123;
 envelope-from=jansef.jian@hj-micro.com; helo=mail-m32123.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hlf/+U+ivdQs

SMMUTransCfg->ttb is never used in QEMU, TT base address
can be accessed by SMMUTransCfg->tt[i]->ttb.

Signed-off-by: JianChunfu <jansef.jian@hj-micro.com>
---
 include/hw/arm/smmu-common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index d1a4a6455..e5ad55bba 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -110,7 +110,6 @@ typedef struct SMMUTransCfg {
     /* Used by stage-1 only. */
     bool aa64;                 /* arch64 or aarch32 translation table */
     bool record_faults;        /* record fault events */
-    uint64_t ttb;              /* TT base address */
     uint8_t oas;               /* output address width */
     uint8_t tbi;               /* Top Byte Ignore */
     int asid;
-- 
2.47.1

