Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6249652njk;
        Fri, 27 Dec 2024 02:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrel2GzV9ZHHjxIqW1KcCy0mtm1vjc246DMNsyPYh6IjMNySuUzaoFG7otrdkFVmgGBvKEm4Zy1BjJFg==@linaro.org
X-Google-Smtp-Source: AGHT+IFL+bslLV6ajQJVuQKkTwfpG0zawJVRGWcKg4nhPdAJYixkRMp5LdPXcNTXR2Jr2XcNNsAr
X-Received: by 2002:ac8:59c4:0:b0:467:6b59:423 with SMTP id d75a77b69052e-46a4a9a4378mr464859171cf.55.1735296457302;
        Fri, 27 Dec 2024 02:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735296457; cv=none;
        d=google.com; s=arc-20240605;
        b=GHmGw8Ll5iWmEBMeKMWiGhb4p09x2NXU4TtqdzbAZLQwsEKMOK1rxdDWKAyVlbYnpZ
         inNn8Zs8APZSdvJ7MdfMV82y9Mk2CuNg4meY4eQgASjYFE/BYqUy3CHLyM/FQgsp/0a/
         sp+bBRiQTSRowwJt3L66xZJJ80Kh7Es1gCsuOTyT8AALEoiJ08tJvdy6nBfLJAsj4KlH
         PcEXWPdYwACDuuW/rDFuHS279QIgW+TEhbJmQiRhZc2QKtMD2/MjkoOqGYaulljzl1HD
         /QJY0WByYL1S67tWnT9rdgQr04SMzz1b8pZ4p2z6foP4PNkNtBJhiVqptzewf9NAjPLP
         E4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=/Rls6WahG5VbJBrYKohJ6+/KtStWzH/omqg4pvMOCCE=;
        fh=4Sz2A6IY8u2hdYLnZOZRoQCxHhvwWNxClzpeKVvtQOE=;
        b=VPVWyfM0iOhfsBNiKWWaD5K1p3aCNKowmnugQd34yhklfcXs5Bib0LjiNoZcE2Ahms
         J8wosFW6IG0HZgifJteA7qnhc2iN6r6/H0sX6SxTUAxZGktZeo+INk+T+LzVhSk2auh+
         4NLspnck0cQmibORm5oetjNHCo6I+rb4BxL+xEZ3qvLDvWbxgNtMOTaBIJC5KHZJsfPm
         egXxx6TMh1BuJJznDgvOyxcBd8s9jIG+/hQ663upn15n65U2LqCmwcdMBFRy/XuC6biy
         oNwAPtQf8YaVbj9btytPe8UH3u6Ow8NteUiXFSRzaD0OvwrC6F7PpM81YXbK4kyvIBLu
         ox9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebbac4dsi190294651cf.360.2024.12.27.02.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 02:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tR7s7-0007Vc-6C; Fri, 27 Dec 2024 05:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tR7s4-0007V8-HX; Fri, 27 Dec 2024 05:47:08 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tR7s2-0002xY-GQ; Fri, 27 Dec 2024 05:47:08 -0500
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 793861F9CC;
 Fri, 27 Dec 2024 13:46:52 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru
 [10.177.185.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Fri, 27 Dec 2024 13:46:51 +0300 (MSK)
Received: from rbta-msk-lt-328534.astralinux.ru (unknown [10.198.18.100])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YKMcp43mWz1h04s;
 Fri, 27 Dec 2024 13:46:50 +0300 (MSK)
From: Tigran Sogomonian <tsogomonian@astralinux.ru>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 sdl.qemu@linuxtesting.org
Cc: Tigran Sogomonian <tsogomonian@astralinux.ru>
Subject: [PATCH v2] hw/misc: use extract64 instead of 1 << i
Date: Fri, 27 Dec 2024 13:46:18 +0300
Message-Id: <20241227104618.2526-1-tsogomonian@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_internal2},
 {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;
 astralinux.ru:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190099 [Dec 27 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/27 07:57:00 #26921502
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
Received-SPF: pass client-ip=195.16.41.108;
 envelope-from=tsogomonian@astralinux.ru; helo=mail-gw02.astralinux.ru
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
X-TUID: wZQGjN7SFrdR

1 << i is casted to uint64_t while bitwise and with val.
So this value may become 0xffffffff80000000 but only
31th "start" bit is required.
Use the bitfield extract() API instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
---
 hw/misc/mps2-fpgaio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index d07568248d..04a3da5db0 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
             s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
             for (i = 0; i < s->num_leds; i++) {
-                led_set_state(s->led[i], value & (1 << i));
+                led_set_state(s->led[i], extract64(value, i, 1));
             }
         }
         break;
-- 
2.30.2

