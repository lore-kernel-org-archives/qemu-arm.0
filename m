Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp887041lfa;
        Thu, 29 Oct 2020 13:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg5nrauDKsxA/iMdzbfuYL4lOOrmgbp4ZINEAxKcZsiWTW1ss1C++vlu+YR+RecAU8tsHD
X-Received: by 2002:a02:b903:: with SMTP id v3mr5096196jan.40.1604003127890;
        Thu, 29 Oct 2020 13:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604003127; cv=none;
        d=google.com; s=arc-20160816;
        b=DjKcCbDk4cRGzeJAD4yWC25/FRxjjLv5mhR6IwmXA7WDYA1sfRqLW2r+2GFQI1ut3C
         3ZDQhKZ0p52H14daD8ZmQOEQfzFdFAJMEWvDBNcCNsOMqDj6IB2SISHTBCjwh6vCHJKB
         LD9tTE5u56H6wu3Jgg+CzwMZfXQG+eHAeX06uq/ugMK0Tl5bLQf3/IzsOHjPTZiIOgA5
         h2R+tsaGCzySHaxsHVRzf5LRjsU3t2JURue0zkrMVKCDm9sHSX+gPbzkgtwYrsXNrtig
         jdGi2MGmAugPfUzWHgJh9YqxqFwzpK3EAKAN9WOkJltBAsmK0Efz8ygxwM6RzkQTKHL3
         nhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=/tBmC3YcdW6vxWvQ+1fP/eEs6OdNbyx3lpcd5eWqJMk=;
        b=IEozwI9sKMAwEgqQ9zchydqu6OhnbuXq/WCB8Sn56WYnVt+9J9EuR7I5sml17F3u3j
         sloISHDAR2sNTDE9LgSK3wP8+5nlkJB0rPkI7CVAeJ0rYBT6cOX5iB3U4L7kQU3gyr4b
         lZif1VstEmRbjiR0CGu9XVkNUVj/MZQ3HlK1xgkhTazNBVGSfuZpbfEqCK3SP2ZZotbh
         lN/ejUxk+VSEmbeLNQzNZqyyLnDfafOqDl9gisQBGW8BFk54i8J4c/Hql1IoYxMviDcD
         bOQOKoxIn8DoXg5g40jh5yAeCfJQNesoW2Zb92oruvVddAqDC7Q6gcMB2peiW5vwHF7C
         DKjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si3652116ilu.65.2020.10.29.13.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 13:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYEUB-0000fu-84
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 16:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1kYEU3-0000ax-Ci
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:19 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48106
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1kYETz-0002xH-Lz
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:19 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 9FD445FC12
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2020 21:25:14 +0100 (CET)
From: remi@remlab.net
To: qemu-arm@nongnu.org
Subject: [PATCH 1/1] target/arm: fix LORID_EL1 access check
Date: Thu, 29 Oct 2020 22:25:14 +0200
Message-Id: <20201029202514.9257-1-remi@remlab.net>
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
X-TUID: w2EpGeDGTTmY

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Secure mode is not exempted from checking SCR_EL3.TLOR, and in the
future HCR_EL2.TLOR when S-EL2 is enabled.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc51175bf0..6854591986 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6679,9 +6679,10 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 #endif
 
 /* Shared logic between LORID and the rest of the LOR* registers.
- * Secure state has already been delt with.
+ * Secure state exclusion has already been dealt with.
  */
-static CPAccessResult access_lor_ns(CPUARMState *env)
+static CPAccessResult access_lor_ns(CPUARMState *env,
+                                    const ARMCPRegInfo *ri, bool isread)
 {
     int el = arm_current_el(env);
 
@@ -6694,16 +6695,6 @@ static CPAccessResult access_lor_ns(CPUARMState *env)
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult access_lorid(CPUARMState *env, const ARMCPRegInfo *ri,
-                                   bool isread)
-{
-    if (arm_is_secure_below_el3(env)) {
-        /* Access ok in secure mode.  */
-        return CP_ACCESS_OK;
-    }
-    return access_lor_ns(env);
-}
-
 static CPAccessResult access_lor_other(CPUARMState *env,
                                        const ARMCPRegInfo *ri, bool isread)
 {
@@ -6711,7 +6702,7 @@ static CPAccessResult access_lor_other(CPUARMState *env,
         /* Access denied in secure mode.  */
         return CP_ACCESS_TRAP;
     }
-    return access_lor_ns(env);
+    return access_lor_ns(env, ri, isread);
 }
 
 /*
@@ -6738,7 +6729,7 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
-      .access = PL1_R, .accessfn = access_lorid,
+      .access = PL1_R, .accessfn = access_lor_ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
-- 
2.29.1

