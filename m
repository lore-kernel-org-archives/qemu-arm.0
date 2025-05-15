Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1692022njb;
        Thu, 15 May 2025 01:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeTD/Z7xJXsqwzpk0r0+siMoAu3CsGzjPlFSACTC6LASgcqFunZUd91K3mJ3wl37BDT0jLTpECMezxNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGgi7XuRH7xaPqAJZqunmnTDvN/QKC9eQQoFyoyMNbzm3PpORhVx7DOewLwPq4a/+0S6GDU
X-Received: by 2002:a05:622a:559a:b0:476:5fd5:4df8 with SMTP id d75a77b69052e-494a33b4668mr29718201cf.45.1747296815284;
        Thu, 15 May 2025 01:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296815; cv=none;
        d=google.com; s=arc-20240605;
        b=Ln0uA0+x9hlOJWY/i4vySbEpyfW70jeaHLq5TCV7GzSb51lkTC7j+aRoLfvh0+XoDB
         AUPi13TjoQ8Um+saevI/g8y3TQNFBVRr7XiwblzMehCT1JBR4hmDBNPE4flJyLl+24AH
         mVTRvb5/2H8v/S2HyXXLzeaAYBW0aQXsiois4kwV1JZpCs9V7qxxDmMEXbg8cAStxJrX
         8Jd1vfFfMuKshxoVg/0Cf5WXKr0T+eW7478UAzDg/rapiDfW/v3X1cIR9rlL/vHz1hxf
         dV2H/opdChGfYM0kRTHK8mDD8OlUH7BMxvosMUk6Fv0kXTpk9n9AtKPyTkkZ4hx9NLvM
         Tdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=XE7jUlX6zwvz5Nap7pgcEm5JDJLQme+Kx9NI0U6R9kk=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=YrOpfyHDNEKFcejtnkA+0jkR8kZ2xz9WsFGu3qEQ4UfPPbX0m6VaPWRIDNoggE67ga
         ECG9DP5oisUAEdpodEqHsuvKfjJyp7Uo0UEO/6OY3SoVBBXoT1g1qVv43cekDil8vKKi
         JMj5jfCoc6fltCRGRFBJXXs7YzI288u+QW8OweZ9ItSc3/p6c/7JuHlL5ttn/BN2Bvpo
         8KkOx9EcU/TcJyWq+XZ/3/ehaanMY8olnQgDjjlNRiZWXsLb92ybfLwSXohb7q1u0ZQD
         N/BiBf6tZIJo+PcFXl6eJw0KjzW1RSybBKyzdhbdJNNs6d8WMyWM965dL+jZP+pQtGkD
         yqWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452557ec6si157814061cf.331.2025.05.15.01.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFThU-0000cg-Dz; Thu, 15 May 2025 04:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTgn-00063Y-MJ; Thu, 15 May 2025 04:11:38 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTgf-00018W-6S; Thu, 15 May 2025 04:11:31 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:14 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:14 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 17/28] tests/qtest: Reorder aspeed test list
Date: Thu, 15 May 2025 16:09:49 +0800
Message-ID: <20250515081008.583578-18-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
References: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PI8bNUNE+FV7

Reordered the aspeed test list to keep the alphabetical order.
No functional changes in test behavior.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3136d15e0f..6b5161a643 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -211,9 +211,9 @@ qtests_npcm7xx = \
    'npcm_gmac-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_aspeed = \
-  ['aspeed_hace-test',
-   'aspeed_smc-test',
-   'aspeed_gpio-test']
+  ['aspeed_gpio-test',
+   'aspeed_hace-test',
+   'aspeed_smc-test']
 qtests_aspeed64 = \
   ['ast2700-gpio-test',
    'ast2700-smc-test']
@@ -360,6 +360,8 @@ if gnutls.found()
 endif
 
 qtests = {
+  'aspeed_smc-test': files('aspeed-smc-utils.c', 'aspeed_smc-test.c'),
+  'ast2700-smc-test': files('aspeed-smc-utils.c', 'ast2700-smc-test.c'),
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration/migration-qmp.c',
@@ -381,8 +383,6 @@ qtests = {
   'virtio-net-failover': migration_files,
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
-  'aspeed_smc-test': files('aspeed-smc-utils.c', 'aspeed_smc-test.c'),
-  'ast2700-smc-test': files('aspeed-smc-utils.c', 'ast2700-smc-test.c'),
 }
 
 if vnc.found()
-- 
2.43.0

