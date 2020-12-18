Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2168622lfq;
        Fri, 18 Dec 2020 02:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAua7DuWTVPcve7ygosRSlREBCJf54aWnizWA5hATKs8jN4K5NMad23X84KWzoCXwP1P2r
X-Received: by 2002:a25:ef46:: with SMTP id w6mr5080350ybm.458.1608288555474;
        Fri, 18 Dec 2020 02:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288555; cv=none;
        d=google.com; s=arc-20160816;
        b=z3DrSYCzkQTlbeNwhvpNcbpu6xkrXV30b0XkncIrVRvc2LMPl/Qhuq2qMfi3qYObDv
         69msSPuVo3LniS68nDV15kx+S9UZ4oAkaDB3GQkAPnPn7OANgl8q1pij3rsojGu7RoFw
         W2Wls31GuN10YUAYtD0Rx1w2lqSUT70RTo+6LTVZ0y3TGVC/FJVn8hFBKzfbswWsvQAD
         J+Zkqpg35dmxJzhOqCES4HNIvdjo7scSnl09mZMQbLKkyAw4Ssq/QJlJiOFbwR1dYgKg
         OFGD4vLVQyM+9RhoHDTMME0XMTr3s+kmrfJ+UAThqZPgi0bl1UO25WSTeb0pEds+WobO
         Xg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=H6C/lf13wWcpitBq/wn6yWP85z6Nse+R51SOfoVLrh4=;
        b=wD1fP+McqAXYPP8d+pb2rMIo2mVKxBJcmAUVuP5QgwzrjfkB4JdlFmb7zcNUQr0Q6y
         FAetbTWCRNi4ZVs0dK9O4/nWz9i//Abt/It4Rbfnc9tgvpGeNXoSqCLbL4DABR8gh6qm
         EfKnk5a1rKbX8iLf8OmEYDMzcEjadFFW/2C1SQbUiz2zvpAgWqxxWERp7S3Brez8K+r3
         WClxjZWeGgPJPMTQlpby4a8kgud/aDO19bzB2aIF+8cJDUb0rKdsaR6hfgFtIqG3WuWk
         caskZU+BjBtczoi2ebHFxqgzrgtpVCh0FbtkuC5LRgshxtPJt+qsQ6OnpX8u1oC0hBhn
         Mt4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a91si8611577ybi.318.2020.12.18.02.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDJy-0002ll-Pz
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9Z-00074V-AL; Fri, 18 Dec 2020 05:38:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55298
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD9W-0003L7-NM; Fri, 18 Dec 2020 05:38:29 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id DD64D60413;
 Fri, 18 Dec 2020 11:38:02 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 12/18] target/arm: translate NS bit in page-walks
Date: Fri, 18 Dec 2020 12:37:53 +0200
Message-Id: <20201218103759.19929-12-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dIF8CNF40qZz

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4b6ffcd326..ff69b46d43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10433,6 +10433,18 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
+
+        if (arm_is_secure_below_el3(env)) {
+            /* Check if page table walk is to secure or non-secure PA space. */
+            if (*is_secure) {
+                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            } else {
+                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+            }
+        } else {
+            assert(!*is_secure);
+        }
+
         addr = s2pa;
     }
     return addr;
-- 
2.29.2

