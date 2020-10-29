Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp887132lfa;
        Thu, 29 Oct 2020 13:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1vQPsvYUPcb4REujP2nG2gMiHttuaHENggJZp6v70H2i6OqUxJnbi6wUmzdhANTg3uMcJ
X-Received: by 2002:a92:d111:: with SMTP id a17mr4580175ilb.57.1604003134718;
        Thu, 29 Oct 2020 13:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604003134; cv=none;
        d=google.com; s=arc-20160816;
        b=dVgo6DxU73rPgN8zZ7UyrTePc21qeh99WFkbO9XyW/LZUBdsXiLNIlox+ivJAlUafu
         XcZXiQfpByiJUlf/WWe+y+LykayieFzesui11NTsc6NwH2orGlZYqcq0rpj2NLzLiGza
         S6Y50m8AC9KVvyTEA8lwAXmi0MkZ+2YiJotBqagWBT5JoAiczeTfCo9NU3//CjTd743w
         SOTrGx6APxKM9OPZGEqglaLf6sboXOEzeWVxDR6FknZj35YBecBCtb4ta3sZ2BwY0XVI
         erYCH9DFcsCj/AYPDHMuoItWVmNYSUs5JK0L7ZJY+sdzpFLbK15cgPKiUWNakrEWahux
         GmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=DN+r1QyZlNujFAIs0jO/MwT+wRWOADAbmjIq1WzovJk=;
        b=Du8fGG5ADQ84dUS0CXGpx7VfGEeASYwJMXi0o492ke6K7VB73X9TeoukTgiYl81VQW
         wGWUfMn0O0sospmroY5b1dvhNb5iumlMSXwBNec+prMgqkESbkVDYwmLPec4G85pMyst
         4Z41dX/dS/U4B6lrnGj921pws3g5EFvVzYSoxNqYqJvUzK7ZPSuDqK2lzU+0iYsw2Dqi
         1Pjxam6vryhNgkh6MxjX3tV+jriuSSyPzn8fzt3mMUM/Xh589xJ5kPUGVyTUvNiTPFNu
         NlMWV3OWwMvRaYr+jLgXnedRE0JIRjE0556PeCzNcg4kz7/kPfU5IHXjfKVA632/6DR1
         P5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si3459166jaq.110.2020.10.29.13.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 13:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYEUI-0000q4-3S
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 16:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1kYEU6-0000h9-R6
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:22 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48112
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1kYEU5-00031T-A6
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:22 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 77E325FC12
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2020 21:25:20 +0100 (CET)
From: remi@remlab.net
To: qemu-arm@nongnu.org
Subject: [PATCH 1/1] target/arm: fix handling of HCR.FB
Date: Thu, 29 Oct 2020 22:25:20 +0200
Message-Id: <20201029202520.9313-1-remi@remlab.net>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 16:22:01
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M/ujg44cE0ld

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

HCR should be applied when NS is set, not when it is cleared.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 97bb6b8c01..dc51175bf0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -731,13 +731,12 @@ static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 /*
  * Non-IS variants of TLB operations are upgraded to
- * IS versions if we are at NS EL1 and HCR_EL2.FB is set to
+ * IS versions if we are at EL1 and HCR_EL2.FB is effectively set to
  * force broadcast of these operations.
  */
 static bool tlb_force_broadcast(CPUARMState *env)
 {
-    return (env->cp15.hcr_el2 & HCR_FB) &&
-        arm_current_el(env) == 1 && arm_is_secure_below_el3(env);
+    return arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_FB);
 }
 
 static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.29.1

