Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2258439njk;
        Fri, 20 Dec 2024 02:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxiug7US7ERRaXP6zQnMd5WzzQ+ALmZjGR370YvzitBVfGwOYfCuYVed1EIpjZhs0bfaxJUsJ6BsleYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGeQ7Eyds+6vfOBB1SVaNaw/pF6tL1FDOq1GoTgAcoImPQsM7iUGg7AcIfm4u2+1Fuveagd
X-Received: by 2002:a05:6214:b69:b0:6d4:4100:75a1 with SMTP id 6a1803df08f44-6dd2339b960mr41552736d6.39.1734690856423;
        Fri, 20 Dec 2024 02:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734690856; cv=none;
        d=google.com; s=arc-20240605;
        b=ONliFQDknIBK4NW/BscFaIo5DfaqYH/4bh0lGYIoPUpdLn9/W5BXyu2RwgO3NaVz9P
         uxsn1ViPHdASS7X4J6M4k66X7htvmgNi9KZGEZBSBQl64KhHVz0NRJIcLD+OBWgbSHR6
         gAqe67zvKTsv1QyWOfUSpa6PwxR6Ypp0zcCzGJzn9HvcSKK+3eUl3y4PV1Z0SN048YJz
         cuO831cEyPYcbzx+5sFHMn6lfUfyzWWred8N+z6aNwOdDkQZJZ0uEeF8L2/eU1tA2qI+
         Qb8Dh062Wv60Og82w4VgbFezxvAbN3Oqr6JqkGSmk+eDLbixMJ6EPuMRi/PkG6Ew/UIa
         cudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=PZluEGjhSABT6GuVDfj/6KegVyZAvNJxtVcEMZjfbaA=;
        fh=2RoJnLytn+omQJgbX6v205NVl/Jk3t3pV6vCWat/gzU=;
        b=ACmICfbaszO82pNVUZ5ZerjkktfaTSGfzb8p/rGzBUMNFzivgkBQVVauQ/6tM987mI
         jR7BxbKF1YzSYW5qKp1u4GV/Ja32qfA9u70lDWbY9WR6uGEuwsFQJCv7tHvTRvrUthSH
         U5/FDDkEUIb05/D6YdmhUX1P695RoVLcLpv0CxKQDItyIi4heZc04yGmmoUjXfRqTQFv
         SjnceiVpF8ETX7ZYUJ9SHqUBNlB4SoQ08vdJtj7ABbnABo1dfrQUigIQUcLNGTAnmct8
         k3dZMxFW+FFovlht9Gn0ct/8KI8xuLMusVC8ZeldgPzTSW53NgRZTRo6egz9Vz4b0hgF
         1rcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18101660si38498806d6.105.2024.12.20.02.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 02:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tOaKU-000633-S7; Fri, 20 Dec 2024 05:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tOaKQ-00062G-Kc; Fri, 20 Dec 2024 05:33:54 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tOaKO-0003Lc-Qu; Fri, 20 Dec 2024 05:33:54 -0500
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 3270C1F9E1;
 Fri, 20 Dec 2024 13:33:45 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru
 [10.177.185.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 20 Dec 2024 13:33:42 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.51.228])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YF3fr1rJcz1h04s;
 Fri, 20 Dec 2024 13:33:39 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Anastasia Belova <abelova@astralinux.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH] hw/arm_sysctl: fix extraxting 31th bit of val
Date: Fri, 20 Dec 2024 13:33:17 +0300
Message-ID: <20241220103320.83385-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb,
 {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;
 new-mail.astralinux.ru:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 189970 [Dec 20 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/20 08:31:00 #26907965
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
X-TUID: SyQzUkxCUOqT

1 << 31 is casted to uint64_t while bitwise and with val.
So this value may become 0xffffffff80000000 but only
31th "start" bit is required.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 hw/misc/arm_sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 69e379fa10..ce8be44b6e 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -520,7 +520,7 @@ static void arm_sysctl_write(void *opaque, hwaddr offset,
          * as zero.
          */
         s->sys_cfgctrl = val & ~((3 << 18) | (1 << 31));
-        if (val & (1 << 31)) {
+        if (val & (1ULL << 31)) {
             /* Start bit set -- actually do something */
             unsigned int dcc = extract32(s->sys_cfgctrl, 26, 4);
             unsigned int function = extract32(s->sys_cfgctrl, 20, 6);
-- 
2.47.0

