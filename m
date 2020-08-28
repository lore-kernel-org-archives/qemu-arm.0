Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1702000lfc;
        Fri, 28 Aug 2020 11:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5PNMht+ZZ+DBSSR534q1fziXecqQMGtn0fp4WWJBr17X6qGvqBgMGTjHBpBQeD+uUe9z3
X-Received: by 2002:a25:a091:: with SMTP id y17mr4446087ybh.82.1598641019205;
        Fri, 28 Aug 2020 11:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598641019; cv=none;
        d=google.com; s=arc-20160816;
        b=zEHnNlqtSlI6oRjaxnwXbiThRjFRYEnu4Wp9rIe0Ok5bBdZbaFUYO4AfmoBLCEA7tx
         Bvp9e+WiUmGUH49jh9NlEN6BIhfLGgEStjo7SUCDXVGfHLXBWE7UvIldlWZ/8j14x7gm
         ZkRwQzJsVlvkSiHmHoZjcIaPrLdmZcdtpyZAh6dE0Q1nNjws+8uPEGFuwii1v56kJmql
         rr96dXqUrKMPvvzrQg0FJI9MkDfhdSWvqhYfqrah4VMnk8Cqzda8VFok3tUd2wfNoYvn
         O+3ALmWcmQt0wGXv8wv6NafDqzWAwRmjbHO9GcaQ+RB/S9ZYTLvlQcMMcFPwf6Py45L3
         ugAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TREnSHe4zwXCO3R6kjDkigN6MElrl2moo++OyEa5mKc=;
        b=tmZ+8B66dx0G6nby18Q/iYvsK2qvIh+eEt7s9lmdIgr5W01IPlr3EtaMIPiDyvNIm+
         LS9vKtxGu4DBWXYtvB9AaZ6Qyffopdo9xLpjUKX+F6tHljTXC2c9GJwICeNB/wTlWbJV
         eSGmcb7vCJSDIU5DXM8wQ7hmbiaW6/4KqvdOySGleczqT1PkC2bs4QGM10jB76J8SwJv
         Xi7CQnNraXxD5qr3rH6ixUPbTnEMGVUWRLxeqS6HjIC2/nH2LBPsG3lC6H4wQJzS5xkE
         izvF/NiQ0JZssONEuhhqyFa1mb+qrjOiS+zjCyBnqQOIMERg/7nNVVE7H/oc7HY5T1nT
         HMIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfq+Rl0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si127658ybn.57.2020.08.28.11.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfq+Rl0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjYY-00052m-Fm
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjDE-0003ZE-9F
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:56 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjDA-00068f-Qa
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id c19so184262wmd.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TREnSHe4zwXCO3R6kjDkigN6MElrl2moo++OyEa5mKc=;
 b=jfq+Rl0GI537tIkPzFFZAwjohvmge7gflDWsQo7jXXHGXk2HVCuDNcCDpbW89YFEY0
 qWNgJaoS9U96U9Wj3xIQ3P7gOCAifaxlPCZ14Xxogw0nW9aXKXYK4wYmYc6K0AmfGwXG
 kPsB4Hw/shvv3QwegfhCes/bo2DnDkqzTyGdA9kStzS90Un8p5OI/11ki4s+brH2IAt2
 WnmB27jzFiXu0MS6b1Sr0d+sRjLISPNW1IxCLKSwsRwH+8qp/MocfiPDwlf+rGCFU8aU
 U8KhXVN3E/3z6Muu2QBuYzoRHO+a0rlRv4A9zs1O8x1KZcL1YEVfZLDR0CGDO6dqVHUu
 HeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TREnSHe4zwXCO3R6kjDkigN6MElrl2moo++OyEa5mKc=;
 b=ZuLOfTrh59Nys1u3lRLoF7EKE1LiHZQuCcx2uej0l9oXXcDsr9kkmVbjE7civAGhl2
 SCHnOquikIHuyA79s5YJgcg2WLyxpFS7EDBBiq7fqJ5/oIxS8x/2nWmzId0fby6qLBjr
 AY3YmSwxC7u0/1+7O1O7QLTte7pC3X5PHWI+c5j1k9KnRCa46Ltzd0eI3B/0Tpk/P7o+
 TUs12DGj4JAFQGDekFohIunGr3hIsOXl7/f8hDpkUFNH1YIYNywsOw/QPGhm1DyU+Xc8
 Tqrm0eZ6kBpLUMPwXMqtUlS+7X9+EzDT6v0PYKJLEte2CAKkpN6g96ZKpxbd34vl4GQG
 ZNVA==
X-Gm-Message-State: AOAM5328UnlRgUOtpVC6F8/cqIo+L6cbYAI/deiszMHplR08IgaVHu4l
 CMAWeumkIK0kl1+Gz4FuUfvyn+TlkldLfmxV
X-Received: by 2002:a1c:e1d6:: with SMTP id y205mr42748wmg.92.1598639690466;
 Fri, 28 Aug 2020 11:34:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 45/45] target/arm: Enable FP16 in '-cpu max'
Date: Fri, 28 Aug 2020 19:33:54 +0100
Message-Id: <20200828183354.27913-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: do6XMF54lJGD

Set the MVFR1 ID register FPHP and SIMDHP fields to indicate
that our "-cpu max" has v8.2-FP16.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b382fcd60e..c179e0752da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2143,7 +2143,8 @@ static void arm_max_initfn(Object *obj)
             cpu->isar.id_isar6 = t;
 
             t = cpu->isar.mvfr1;
-            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support */
+            t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+            t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
             cpu->isar.mvfr1 = t;
 
             t = cpu->isar.mvfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd696183dfb..3c2b3d95993 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -704,12 +704,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
         cpu->isar.id_dfr0 = u;
 
-        /*
-         * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
-         * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-         * but it is also not legal to enable SVE without support for FP16,
-         * and enabling SVE in system mode is more useful in the short term.
-         */
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+        cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
         /* For usermode -cpu max we can use a larger and more efficient DCZ
-- 
2.20.1

