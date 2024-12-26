Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5745137njk;
        Thu, 26 Dec 2024 05:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4mSu5l0+N87J3ZfReTf/w8sfjg+U00cGJaoN6s5SOqFuOJ7yEuDBD4B7UNfB7DzET2Pj041RgcFPclA==@linaro.org
X-Google-Smtp-Source: AGHT+IFzpjVod78agC30d6zW2F8ig44JEzkm8nbQDcIfxpfzSXIJCnms9TO0F5ICtAtcr5jRViAs
X-Received: by 2002:ac8:59ca:0:b0:467:8526:f280 with SMTP id d75a77b69052e-46a4a96b166mr346989261cf.41.1735221579859;
        Thu, 26 Dec 2024 05:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735221579; cv=none;
        d=google.com; s=arc-20240605;
        b=Dv6ZhxJYFpTbcFs1NIKRTZE6ihcaN6ogggCg1EHaU3RPidoz++wLnzqEn7fndxOhxz
         7uPgoD1It+HWFY6YH/FPk/cL7toKAUnml2YIEzc6Pkc2ZsiIX59RWJnAJBJvrRGjJ7kD
         Vs8PmdN37ReYTu66SxAumt7RNwxvMGaulTkiVHnDHbhQMS8JxJnc1hfTG5FvbCT0EECd
         kFsHAFo+p51IJlf7EHCfnR6W/HD6/X7FWUmA44wwBHEfDRTm0QQ1pLbAD3/t2cVzQc3P
         4JTYd2PynzX0ke+iGx9LjSi4FwO/X1F+u2lRyBfcxFmvbM1UWKJTxi7sf7T86EqTfKp/
         xobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=a6uebPcop7ZS+DOv5KA8AJ1rRkZ5oUn5ieiwdjI1Oic=;
        fh=4Sz2A6IY8u2hdYLnZOZRoQCxHhvwWNxClzpeKVvtQOE=;
        b=NRb+q1seraVRaWd4GaNhLSQ9oB9mlhuqOeq92bsQt0HGIPOC/NQG2sFQG9bCTXEbdQ
         Yk5Ujd8IX1hQrMpNOWUI9TDKonZRiLlLbgCEP7BgIEpHXRfFOvDOxSVhbKZwypZWXFXH
         DCKVA8LSu3lBEL+pkNGDGJlb9XUE/ZTA0Mz+PX/sy6q2Fg0zl4NFmYAjhY4G6QJ2P9FL
         25CAvlrjdhNpZdoxdxWXX+n3fI9JvRy097VpUtUmHX5zzP2KKem6PzSSwvK+byo3Mwil
         c3gc6Ra2TQvTczGmIR9IsqeGtL9UH5L0Nn/pRY8F8RDbSbudFMdfn5UGMOx9L3l2aptM
         MOpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb98e4fsi183763571cf.267.2024.12.26.05.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 05:59:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQoOh-0005UT-JB; Thu, 26 Dec 2024 08:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tQkfy-0006B3-L4; Thu, 26 Dec 2024 05:01:06 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tQkfw-0002cb-PQ; Thu, 26 Dec 2024 05:01:06 -0500
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id CFA7B1F9BC;
 Thu, 26 Dec 2024 13:00:54 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru
 [10.177.185.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Thu, 26 Dec 2024 13:00:54 +0300 (MSK)
Received: from rbta-msk-lt-328534.astralinux.ru (unknown [10.177.20.66])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YJkfF1KWZz1h05M;
 Thu, 26 Dec 2024 13:00:52 +0300 (MSK)
From: Tigran Sogomonian <tsogomonian@astralinux.ru>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 sdl.qemu@linuxtesting.org
Cc: Tigran Sogomonian <tsogomonian@astralinux.ru>
Subject: [PATCH] hw: cast 1 to 1ULL
Date: Thu, 26 Dec 2024 12:58:15 +0300
Message-Id: <20241226095815.15377-1-tsogomonian@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_internal2},
 {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; astralinux.ru:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190069 [Dec 26 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/26 09:04:00 #26918328
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Dec 2024 08:59:29 -0500
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
X-TUID: RsUsa4LlGHsn

To prevent integer overflow it is worth casting 1 to 1ULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
---
 hw/misc/mps2-fpgaio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index d07568248d..297cb1b602 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
             s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
             for (i = 0; i < s->num_leds; i++) {
-                led_set_state(s->led[i], value & (1 << i));
+                led_set_state(s->led[i], value & (1ULL << i));
             }
         }
         break;
-- 
2.30.2

