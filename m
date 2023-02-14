Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1467098ejb;
        Tue, 14 Feb 2023 09:20:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/xKO/hMeC/GHfyAuR6eIxQXFavzLLcc4KkAvpidwHm0ZxanHA8tRuWmzfcnoGiWqFxerbf
X-Received: by 2002:ac8:7f93:0:b0:3b8:26a7:d608 with SMTP id z19-20020ac87f93000000b003b826a7d608mr4940933qtj.19.1676395227222;
        Tue, 14 Feb 2023 09:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395227; cv=none;
        d=google.com; s=arc-20160816;
        b=suU8tYOFpFtws6KjorTgNiXH6aVOzFMV329jTnjMdGO4GM5AmAELS6RylxKgdo8Ko8
         EOGv46k7vZSGj4C5nfYimbvCb5K38vW83rcdPsKfupMA1ItiIWwpAn+Bd4VCWybVsGMC
         pCqJb+q+JNm8taUnpzuq7Rk53yjNQqhZ0rQIHyqfMS1iRewGA7AX8Yqu9uDbGqJgyFbz
         CuxxxmYqGAu4Qk+7vsra5GbXnbpBJxWCtazPkoDFhD2NQljpkEqNPI8xWE76nGBMJq/d
         F4Invgqs9IPX3slgIRWTDBbzSSg6O1Wp4AegcWX5OMaqnflLUYK2X35hRPH41bc72kxJ
         cy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=jEl9fPS7WkatVNQFL2DBd/SLXOWoZf/BnWDKMwHq8oA=;
        b=s0e2dSeXJlOE96r7HQqF/VIoUs7OKRQVMDL55YrUk+TXPLnpy4vxJt8pi0m9dvk1HY
         HgPy6MGQNl9F9Ojk+zjolFwuEn71WxWDSNt2d6PjHFYW5ks4AAUNA3VLMqkl5pMmfqM3
         ebwy1L9Sevr/WdPDPewhjvpaO865/QPitV3yWKQkAw7FhEcM63MUHqyFpJH3URKi+itU
         0e5WuKT/lQJYoLf62ALqMK7WUaxBsmnsXYKKe860HR4CfMWj9eyaAO7VybcHahS2HCAD
         TsJcq1wa7aqV42/MjGSHltbZtXZ7PXpPOp/sPBkZ0dB68OgcsLHFhdH2Oq3Q7j7K8YJ9
         KPOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a165200b003ae3fa38754si12600697qtj.56.2023.02.14.09.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyxF-0001h3-GJ; Tue, 14 Feb 2023 12:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxD-0001fi-VF; Tue, 14 Feb 2023 12:18:55 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxB-0004qO-RY; Tue, 14 Feb 2023 12:18:55 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSbm5FMBz4x5W;
 Wed, 15 Feb 2023 04:18:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSbh5Pxsz4x5Z;
 Wed, 15 Feb 2023 04:18:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/8] m25p80: Improve error when the backend file size does not
 match the device
Date: Tue, 14 Feb 2023 18:18:23 +0100
Message-Id: <20230214171830.681594-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VhMsKUFDvRwE

Currently, when a block backend is attached to a m25p80 device and the
associated file size does not match the flash model, QEMU complains
with the error message "failed to read the initial flash content".
This is confusing for the user.

Use blk_check_size_and_read_all() instead of blk_pread() to improve
the reported error.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221115151000.2080833-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

  breakage with commit a4b15a8b9e ("pflash: Only read non-zero parts
  of backend image") when using -snaphot.

 hw/block/m25p80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 802d2eb021..dc5ffbc4ff 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
+#include "hw/block/block.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
@@ -1615,8 +1616,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
-            error_setg(errp, "failed to read the initial flash content");
+        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
             return;
         }
     } else {
-- 
2.39.1

