Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp962960lfk;
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ff4bGgER1jMLGhUcUHu9ftR2YgTI7UhPhkY5H/QR8bgCxeJn4b8YlUM//wr6E1U7kjjr
X-Received: by 2002:a67:d19d:: with SMTP id w29mr69428670vsi.26.1637166905018;
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637166905; cv=none;
        d=google.com; s=arc-20160816;
        b=itCHByEI3VV0kGICgKEEdR9yTAV+UDqD6i/bEtpJV9ESVgszVDtqeKDYlkRVwL5BVj
         PYJfh9X5hbw1Qcm6U1cdAc+oyfllraekPOT9mFcoszoQMo1X3UZfLzT7hhy+9pA8039Q
         lSPZ1T6Dq3VgG0uwvS6k9oTP+DCdGh3gOXkVeugOL5PmQdzNYyr8A5psk7FkKinwqxZu
         wIsXYcLq7N89WTvVixRuv+EPbs3bTeYSzqITABIOhdAzz98Yc9I4F5xD9H9S0QiKpHAY
         Fr47P2X4hCTG/tqHHjbLHjHBCh8FvYtbNrzK2zHKGW4XecLLWYiqDIQPuvg8OIU5eQoN
         1hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZJwQU4w8VmhCqL45WDYwISlZ94BAmtX/oVcRCe35xsM=;
        b=bIYqQ9DHPGTCpcr6Ym1y7+Tw3sSXxilfPCZEzmmZ4TgscGMXYKdKxI6OhDRYDSXODt
         L8cmsoV00DsmsoEDGMGhDQNvA9KzHSgPct/hIRaflDbWNRv7afPImsqlok7oQbslOWYQ
         wL8etBMmS7n7qaOOHjZEgKiHVJj1jDAgApj2a4HAzPq2UFdJFkm9FbevqX10hm2xNUDs
         fUdVQVaR4xfEHYIvSHNkMSbvpD/kJvpZH7qehjjOeVe9CuXPTugaZKCDHy1y/IEjctCN
         moH7IQ5Q/+fwCmKtm3mLpE9HSnlLXSNId//5yneBSuHTdpI2YIRdWEOLU1wSOwSan37z
         pWVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLgbf55r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si664762vst.169.2021.11.17.08.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 08:35:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLgbf55r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnNto-0003Ok-CU
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 11:35:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtE-0003Mb-I9
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt7-00088A-Cw
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 11:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJwQU4w8VmhCqL45WDYwISlZ94BAmtX/oVcRCe35xsM=;
 b=LLgbf55rjkXk6QuxJeQU1TBKC0miWvYceAWdjrU6zSbQNCxKhppmJkei3W8Y0V3rK3TArH
 DXB9mOsYbwmXkPul407fkGfu1O5n30XSAdviVF1V0xMMmnGLniDBhBJw8gCqG7nd7UdryV
 eJBZoR7WOJy9e8klLgK2nhGO54Em9aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-5IarRvImMOW4jSuEP9ggDg-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: 5IarRvImMOW4jSuEP9ggDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8362B804140;
 Wed, 17 Nov 2021 16:34:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146B25C232;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EE1F11380BA; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] hw/arm/npcm7xx_boards: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:33:59 +0100
Message-Id: <20211117163409.3587705-4-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyXmXAQ3f4iu

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "quanta-gbs-bmc" connects just one backend with
drive_get_next(), but with a helper function.  Change it to use
drive_get() directly.  This makes the unit numbers explicit in the
code.

Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/npcm7xx_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae5..d8a49e4e85 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci)
+static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
 {
-        DriveInfo *di = drive_get_next(IF_SD);
+        DriveInfo *di = drive_get(IF_SD, 0, unit);
         BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
 
         BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
@@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
-    sdhci_attach_drive(&soc->mmc.sdhci);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1

