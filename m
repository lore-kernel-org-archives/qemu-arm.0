Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2334852njk;
        Fri, 20 Dec 2024 04:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXliY/7qk/tMjSjMfiD6KzR4ielNANjmLfqyOI54Hva86liT0JkuihjqTzFZfvGyrHqzfThATOslFM6DQ==@linaro.org
X-Google-Smtp-Source: AGHT+IENBs+p/h8SDO/SWmGgrBBJCVwN7/97EuL4AY5IJfOvvyjdLtnQP+sBMviHKEE0Xe04q0Ww
X-Received: by 2002:a05:6102:c8e:b0:4b2:bc6b:d3c6 with SMTP id ada2fe7eead31-4b2cd6a3c0emr1750913137.1.1734699332778;
        Fri, 20 Dec 2024 04:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734699332; cv=none;
        d=google.com; s=arc-20240605;
        b=Ca6Apha92pUFc63yc87m0MK/b0xyyEnF8GSuXiAb+PyMYdT3h3sisilV2iGHobw34P
         zWCM3hNXd/eZXxta+xNo/LngM3QkMws39GS9Kkd6zadnGhc40sdaE8IuuNKoBHhZbsaI
         kS4tYAi8PPkf/4coFtrpeIk8W918v5nXU6mEllLgG6vC+bs2zOvdgsAu3JkgChN/AfRE
         XeKHv3R+O/IvhwPrIC7rviAhW7EGySmAKL4BoB1zEaIDlKYOnlBRbGsuoZHQccAIE7jg
         vfBfDqpmXTifDyf4busAiDb4ArLxDmwGSF0c+JTjQe8GKzZEmejz1d9qhoXZ94Bq/0vx
         ZfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=KxwtGXSgdAf+TGLEl+3abaSJXdtv5zgqPz/BeWvKcD8=;
        fh=2RoJnLytn+omQJgbX6v205NVl/Jk3t3pV6vCWat/gzU=;
        b=eAKTJSmT9O1kf06vz5mCG/zZ08WUwlegi2f8yNkFH63k/DABRVVseTToyJEh+u1ETZ
         VHAbN6lqZPNuolCJGuw2FCctuvMIl/hCs6uvpWVZ0uL4xIjYzvC5ODiBL0Jg45T8VJh8
         3YjW+WeJDzrd134Z2j10Xe4idnZc49/wqjvHpaDoQ+i1kkJyHmdsBI/3rVYi+MHwX9ki
         nktZwYUU85/9obqS+xlom3/+9rgY59hisuOYjsjaqKKtHXFni0fHIwBdfrVqyrv9vBC5
         V/t1uAXPlGK+OO2uFyINnRVzsUMpJ4P90rbqrxvD9m8rekkRGGNuJISiCD6W3KfRdqBl
         XJQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfba2514si1099944137.547.2024.12.20.04.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 04:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tOcWz-0001SC-Dk; Fri, 20 Dec 2024 07:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tOcWx-0001Rh-AM; Fri, 20 Dec 2024 07:54:59 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tOcWu-0006kC-3J; Fri, 20 Dec 2024 07:54:58 -0500
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id DECE71F9B2;
 Fri, 20 Dec 2024 15:54:48 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail04.astralinux.ru
 [10.177.185.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 20 Dec 2024 15:54:47 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.51.228])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YF6nc2gFDzkWSm;
 Fri, 20 Dec 2024 15:54:43 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Anastasia Belova <abelova@astralinux.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH v2] hw/arm_sysctl: fix extracting 31th bit of val
Date: Fri, 20 Dec 2024 15:54:27 +0300
Message-ID: <20241220125429.7552-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb,
 {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 new-mail.astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 189972 [Dec 20 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/20 10:24:00 #26911498
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
Received-SPF: pass client-ip=195.16.41.108; envelope-from=abelova@astralinux.ru;
 helo=mail-gw02.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aUmtCIRsLDja

1 << 31 is casted to uint64_t while bitwise and with val.
So this value may become 0xffffffff80000000 but only
31th "start" bit is required.

Use the bitfield extract() API instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
v2: make extracting more clear
 hw/misc/arm_sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 69e379fa10..c4e93da3cd 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -520,7 +520,7 @@ static void arm_sysctl_write(void *opaque, hwaddr offset,
          * as zero.
          */
         s->sys_cfgctrl = val & ~((3 << 18) | (1 << 31));
-        if (val & (1 << 31)) {
+        if (extract64(val, 31, 1)) {
             /* Start bit set -- actually do something */
             unsigned int dcc = extract32(s->sys_cfgctrl, 26, 4);
             unsigned int function = extract32(s->sys_cfgctrl, 20, 6);
-- 
2.47.0

