Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2351614lfq;
        Fri, 18 Dec 2020 06:37:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+Ot+qy10DPzUzWseaXfhORsPdS3aZ8nVviE5KAnYkrWMO/SW2L0JprZp8pF6LVWGoV3ZN
X-Received: by 2002:a5b:44d:: with SMTP id s13mr5677227ybp.300.1608302255946;
        Fri, 18 Dec 2020 06:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608302255; cv=none;
        d=google.com; s=arc-20160816;
        b=DEi4D5nsHFONZNn8XUbgsWtPO6jDMi6HjQvwOG65+TTQLyjX/7vudar+JYRUtKxfii
         /0G8hhrReVJB4L99dUK2JpVibC8yJT9Brnkv1GQHmupSyYFJugMQQH+RETWl9ewlvQ4N
         RlN22LZLeVGxIo1rCmvAa0FQP8ebmhdZjJ1eVN3NHpthCWJvlodiGox2uwAImfehl+Gd
         +0dgqM7vjM8UwAx1ejVe76sTNR9sy7f/srEK4H1/bhgsYujsoCKXHe4mOK8ZswGmpn5y
         p/DydO/9r0Q2wL7fwRgP+yq/KzYzsteTqQaKVe8HySr1jQtNprHsbWFfEsFnb2PZdAGk
         Bgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=tQwn4qVMdGLGDq3gfktgy6B9oXejqFnPXqmiWAII9dk=;
        b=Bo0E4ixG5cqKpK44wSLPGz0ebLEe+5bxkxL5XY+yiNjNpZS1KOkgQi8B2OFZD393S2
         yGaU/EJBQf7XQp1fWpTeW2oi43jHH2UPu/791BZULR7fGIrE4M16pYtr8ZUxcR0CJP/s
         fOIRHwQ8Jp8tib10VtCC2qTGRt7P9efjUGmGM6M8BFu/xDQ+tNfTQQBeTBQ5zQE2ZYWw
         fWATqB7f9gOss9JEu+WoExG4MQugzwXbhnNCggm8E1hQe+ews+Z/4poNiv4LGO4H/rUh
         GYruoQBaXuNCBGAUiaaqWnUAhCtchMR1cE+0tXXq62ITbTnmlU7MadLS8mbJziiCWqT7
         J/RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si5027577ybr.179.2020.12.18.06.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 06:37:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqGsx-0005Je-Cy
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 09:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGox-0001VZ-6A; Fri, 18 Dec 2020 09:33:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56806
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGov-0007Y9-27; Fri, 18 Dec 2020 09:33:26 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 6BE025FC85;
 Fri, 18 Dec 2020 15:33:21 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: keep translation start level unsigned
Date: Fri, 18 Dec 2020 16:33:19 +0200
Message-Id: <20201218143321.102872-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7884934.NyiUUSuA9g@basile.remlab.net>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rhZRA/javRy+

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df195c314c..b927e53ab0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10821,17 +10821,12 @@ do_fault:
  * Returns true if the suggested S2 translation parameters are OK and
  * false otherwise.
  */
-static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
                                int inputsize, int stride)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
 
-    /* Negative levels are never allowed.  */
-    if (level < 0) {
-        return false;
-    }
-
     startsizecheck = inputsize - ((3 - level) * stride + grainsize);
     if (startsizecheck < 1 || startsizecheck > stride + 4) {
         return false;
@@ -10856,6 +10851,9 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
             if (level == 0 && pamax <= 42) {
                 return false;
             }
+            if (level == 3) {
+                return false;
+            }
             break;
         default:
             g_assert_not_reached();
@@ -10871,7 +10869,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         /* AArch32 only supports 4KB pages. Assert on that.  */
         assert(stride == 9);
 
-        if (level == 0) {
+        if (level == 0 || level >= 3) {
             return false;
         }
     }
@@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
-            startlevel = 2 - sl0;
+            startlevel = (2 - sl0) & 3;
         } else {
             /* 16KB or 64KB pages */
             startlevel = 3 - sl0;
-- 
2.29.2

