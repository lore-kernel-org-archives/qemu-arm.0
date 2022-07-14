Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp731309lfp;
        Thu, 14 Jul 2022 08:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5AX4TeDIliS2UGlIyrivFuYEkYhaK3yNoTB9JwD3PyFVFQhZXejN9owoqEI8SmvKa+NgQ
X-Received: by 2002:a37:8a43:0:b0:699:fac5:224d with SMTP id m64-20020a378a43000000b00699fac5224dmr6436856qkd.599.1657814265930;
        Thu, 14 Jul 2022 08:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657814265; cv=none;
        d=google.com; s=arc-20160816;
        b=0igpZmGtJhAr7qRYrharKw/DtykKwrQZuDkXylwqIGTeNexHxmjD6Pv4ciHKPbHL4H
         U+xGgJjg2NadehvFygnWezwGZuTHw6k0/aPEPXbI8moUjAMEXkXaf49jd2vfDMJSTtMp
         V+L3/4HYtFaIAHmrwvijLTyFNIa2+dyp0xW/sqhiteDQV9P+MGsLoKom8yU73drJI8JS
         u8Rdxq2TGkvaIcJuEhi1xO0jaedTO25uvQP12/E9O+MGygxjyUFbyWULI5kQhBk4Nfhy
         hC7O+t8eMYvwtHSuDKsIBOnnYCm1qooHlY9RTnUmIF1PokQtqW39FTceZFah3w9ATmlj
         Ocjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=nGPq7GZqXkOzUPFjbz/vMLjB7Hy3FP572iZjjDG9i1M=;
        b=uaVB/DndBNwc3NzTqNECgA2EscqWbls2pKdhq+6ZT9nJjL6QACI5/fag9knPMegWO4
         dQuz2lj5L8BcC64VBMgehwU/7F6SaBZDFdd5a6gBGe364gT6Q9ndZLbSvrlcBh1KSHw9
         VU3O6eEK4AUrTvGj8PO2T7zkV0piJiqKvEWIdMU2Tvt8OJz1m9AoCkVeRX4DHDF7yCgz
         MqwKaxPfHwLAz+8hlyklhoHeDqxTYwRqroBVJ5+4ZhlkDfBWrfa6TfD4Ejq/ejr2jYmv
         0JM+beoqtwHVkkb0poKVqS1azAr6vJoKVHw4JtQnUt/gFSDyRUCYZkXBNuL8T2OhETxg
         tsqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv13-20020ad45ced000000b0047302f487cbsi1129557qvb.41.2022.07.14.08.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC1Dk-0001qD-Dt
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11o-0005Hf-Cf; Thu, 14 Jul 2022 11:45:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11m-0000YK-P7; Thu, 14 Jul 2022 11:45:24 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjD2tvxz4ySg;
 Fri, 15 Jul 2022 01:45:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjB4X9rz4xdJ;
 Fri, 15 Jul 2022 01:45:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/19] aspeed: Make aspeed_board_init_flashes public
Date: Thu, 14 Jul 2022 17:44:44 +0200
Message-Id: <20220714154456.2565189-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MQS6JD6T21WS

From: Peter Delevoryas <peter@pjd.dev>

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-5-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 2 ++
 hw/arm/aspeed.c             | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 68e907cd64bb..8389200b2d01 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -184,5 +184,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
                                    const char *name, hwaddr addr,
                                    uint64_t size);
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+                               unsigned int count, int unit0);
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b37c3369e91..60bc2e4cf9b0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
 
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
     int i;
-- 
2.35.3

