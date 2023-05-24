Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2387091ejb;
        Wed, 24 May 2023 01:06:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QlX7EIjRjjgmNhfy1nVMEnC1f2n5UQyYiY+wBSFcBXicXGI+E6QilCfBi1Av+ZHmMVCDC
X-Received: by 2002:a05:6214:c43:b0:5fe:dffc:fefa with SMTP id r3-20020a0562140c4300b005fedffcfefamr24541954qvj.41.1684915582004;
        Wed, 24 May 2023 01:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684915581; cv=none;
        d=google.com; s=arc-20160816;
        b=0JFIh0Ys1lVgzph5oQ/lSd7RaPkJ0q/hUpDJ/EROptQgy878KjqHg+I3dE2p4lk4NC
         09KU8Le1Rlu1SosWTGeyg1nS1b7fBbLc6gKqbp/MsS0lrCIGr0BzfrvWF7N/qGsjdbgx
         Ri6VLcvLYur1Xt4AHPK3X55TSO8DsHM88VkYtwdEvwlxqajJba/AaqYrYKtPXVhcxU9g
         7xokUAsXX0IMUolbLPwAjWSGjIlRaS6QnuTPHlKrhXZ6eZgms19LlYHeMwjxCtM6sBG2
         taE2tTby+499JPyjTG0iFH3dBg2dfOEsDX5/Oj9Hcx9vhWAILgyC7lef4hPEBv9wi20/
         2hWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9+Nxse1LAa+AyxITWogSvUxMXxtHYuw21NV1s81zX7A=;
        b=SEsZvBlUucmrj1Y87olhll/QisJmGOZ4GZGBXvpvneXTLv1Fjkz+snFgamSZbE9dhg
         QZoDjZhfoWi37hBApm5YqZuvuUItpmopjJhTImJPUDn2uirZvZOOaPxr+MLj58AO8pUw
         FwSNrc851wW5PArSauLJDiJG/xBysAXMEr1TFCg7KFNKqe1bYh7VlzMhTJBBVGQDZX3z
         ggG9x0NaWyI/0qB3gdJ6zcX2d5yJgd0zZH4q2NeVdxsvo87vD6oQv5B9eVMJeQd5nJ2G
         h/7YSA/uUnVQ5Az+/lFDRcAvcjDPLfUWsP0YleAFM70fRtcrZ7O6V6h8ghrHPHXtJo61
         3Jvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jWUWF6uy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a138e00b003f57ce75042si6283225qtk.732.2023.05.24.01.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jWUWF6uy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1jVc-0006KN-L6; Wed, 24 May 2023 04:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1jVb-0006Je-2G
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1jVZ-0001DB-La
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684915569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9+Nxse1LAa+AyxITWogSvUxMXxtHYuw21NV1s81zX7A=;
 b=jWUWF6uy+4XfvwuWvpcwaWbW9q2G9k9msw3uTYyvIm9eCPIBzd07nDVsyNKk1rzYaDJYp4
 DnT0ev4WSy+2cWKtNaqIDUrVN6epJIBo+ZgTZb8L0vt4GQ+dBcTzf1DjPr5cpHGbKiTvmu
 NinvfD16/uectmknlk+RDgXTKukDhDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-GIux9CQOOaqQQ5T-ZXhe8Q-1; Wed, 24 May 2023 04:06:04 -0400
X-MC-Unique: GIux9CQOOaqQQ5T-ZXhe8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A489F8015D8;
 Wed, 24 May 2023 08:06:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658F9492B0C;
 Wed, 24 May 2023 08:06:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH] tests/qtest: Run arm-specific tests only if the required
 machine is available
Date: Wed, 24 May 2023 10:06:00 +0200
Message-Id: <20230524080600.1618137-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4p8IGudkandZ

pflash-cfi02-test.c always uses the "musicpal" machine for testing,
test-arm-mptimer.c always uses the "vexpress-a9" machine, and
microbit-test.c requires the "microbit" machine, so we should only
run these tests if the machines have been enabled in the configuration.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 4c5585ac0f..087f2dc9d7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -198,14 +198,15 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
+  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') and
+   config_all_devices.has_key('CONFIG_MUSICPAL') ? ['pflash-cfi02-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
   (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
+  (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
   ['arm-cpu-features',
-   'microbit-test',
-   'test-arm-mptimer',
    'boot-serial-test']
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
-- 
2.31.1

