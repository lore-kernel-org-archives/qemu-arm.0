Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323711njb;
        Mon, 12 May 2025 23:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7goNDM26atg2rz6YSY3EDsL5MCwIuK0g5o7tr4fP9n90ww9EEUViO2xlfY8RSk7mn9cJpsVsQ9oV7UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZg3Y2P2VFsMCYjE7CX3evuTaj142+iB05WZ4Z/B5WKfHbDcx3ujmd1zDEWuwkuX/Mavn5
X-Received: by 2002:ac8:7f55:0:b0:477:ea0:1b27 with SMTP id d75a77b69052e-494527626dbmr216036901cf.26.1747118058047;
        Mon, 12 May 2025 23:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118058; cv=none;
        d=google.com; s=arc-20240605;
        b=fk4MzD7RZpHjanlPTZcElFB/o4zvHMApgGqhbrOaoG8hsPLVz6Q771iT/iBwPhKm+G
         MA87J2NZ1os5c16czpPkpIjnPqZ9rHunYEajvAqRiB8H/XtdcGArmO7pnnYmXJuHUtNi
         R1Kuyrt0Fg5KBD6IgMO7MqhDYrfp6w4A5cCvx7XP9o8+mfMcRejxO6YXUlQ5jP34uC31
         OyhuaPYDKB5+dxENSLoOSdGbBQZQZyzwNnwqe6Fwsh3m26/jGp0qVZ0sIKGPa4Ja0iZa
         s8wbRCD2V0DrvdaDVvsu6Tk68Hb6YXBiM9sn4dpqNnvqN/QS0dmEiIHcpPlVYAoKMqIp
         Hwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=XE7jUlX6zwvz5Nap7pgcEm5JDJLQme+Kx9NI0U6R9kk=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=kP11DLzwd1FbjADgSR2S4RNfgTiYUHWKwvyKIJ6C0EPnJB2x7o9rAYfz/WAxYErua2
         0PxDvfwCGDmjRRUpXphU3mxS2qTh5+N+CjV1oKVgLJoGtjfzHmOYHGoGKmuk2tnLP3yF
         C09EXgksplVbz0GFG55VOdHH4VsfEzlklA6yZ19B4LsW8zSAdX5NiS4maNQbLbRtlI7b
         Rk+R9OHFas2muGXfo7qfoB3Guwj/fsQSipV5G1hEhuwte+t55ex2kBWEry9Q427eFB0I
         pkUvEwI3KdygdqrMAnTVc7oHa1GhWa7/mbvtvgZMstjE+eTcdOe0K0gbRvje2lTE5z3Y
         SFXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452599e24si102588841cf.486.2025.05.12.23.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEjD2-00080J-JF; Tue, 13 May 2025 02:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAk-0005K7-S5; Tue, 13 May 2025 02:31:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAj-00026a-6C; Tue, 13 May 2025 02:31:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:07 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:07 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 14/25] tests/qtest: Reorder aspeed test list
Date: Tue, 13 May 2025 14:28:44 +0800
Message-ID: <20250513062901.2256865-15-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P3i5bPQRYrbu

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

