Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3448540lfq;
        Tue, 12 Jan 2021 03:07:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAy/BBN/WuVY66gsvWQTEKaz7rrEqq52jl8HqSogBAk/OjhKKqv44QWU3CwZVTYgtqA72W
X-Received: by 2002:a25:d088:: with SMTP id h130mr5542320ybg.442.1610449625744;
        Tue, 12 Jan 2021 03:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610449625; cv=none;
        d=google.com; s=arc-20160816;
        b=dN5JFLfYIyE7o8v8Uvvlp/o+h4eSK/XAbbYBAFxdGlFpPTE8OWlbjN7TgLqkhmsS6J
         G+8etq27xtA5hzgtSaZOceJFyrUOZkOZv2+ki3hyIw+zfcsWTSFtKlwaSH/LSPcoWdeu
         22lW+wA7EEJUNV4qcxN4GlfJREGSSubPpMbxp79rjNkLweLs1r9X2DYxlBelwOzCBKIm
         JIzrqwOEvyMCAA/+wMVtE5gISgtSgPmM744Q6xncGsutKMJUdlTicKzWa/WrHikEZ52m
         4HyQL/HmZZLqbpWz9geAt++1oY3nCJdtskZt2HMHMzJbml2ii3Dz1/Pw6+EHEoXBSwfI
         nUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=p1wF924/yMa7j9FVToshxLfNs29URqIejCH9WDARL1o=;
        b=mi+VgPHYHr9qibSFVis5HC+xOwo/64n+cbqreD073YWE9zKjLDyMmv0Hm1nQl5wqAd
         8hdoXqF2NuL30lRRHUFlxiB5bDy9F3hz+9YPp9SA2ABfWKDsrLpiYhNg6rA4qLmC2nK8
         QqBDf4LgPuCXry2Rtk5Hqecmi6lyOAhrefk8iCtXu0fbJ9nSJ7/fSbGOwDl7A+rSa/wX
         M5Ft2mHnGzo6a2stikYxAEhnR4D6JftDKjHujJaxNkRhc4y3zFbdxDpBLxo5i9o3aMeF
         yZfErhZUr6X9F+NaYrq9BOdYwcDJyF15KBskTqZzpDNkx6zOadXRJkFNN7vcJs43X2Y3
         HMng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r35si2810913ybd.310.2021.01.12.03.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 03:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzHVx-0008LY-1Q
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 06:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBT-0003vD-O5; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56726
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBO-0003UH-6G; Tue, 12 Jan 2021 05:45:54 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 9845B604F4;
 Tue, 12 Jan 2021 11:45:14 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 12/19] target/arm: translate NS bit in page-walks
Date: Tue, 12 Jan 2021 12:45:04 +0200
Message-Id: <20210112104511.36576-12-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
X-TUID: tyAiODygyAQt

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d96897f9a..fe95c2965d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10429,6 +10429,18 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
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
2.30.0

