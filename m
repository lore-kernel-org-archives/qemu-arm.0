Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp70394lfp;
        Wed, 13 Jul 2022 00:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2atXH31EAORAU7G8rnprT6UnPFaXoQZ62U1zpsT6ZKNZykWv7291VayyTddGcD+k87Y7/
X-Received: by 2002:ac8:6f10:0:b0:31e:b648:98ab with SMTP id bs16-20020ac86f10000000b0031eb64898abmr1679791qtb.297.1657699163006;
        Wed, 13 Jul 2022 00:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657699163; cv=none;
        d=google.com; s=arc-20160816;
        b=eECxHgI/5viaUmSh8Fsi1JpyheIqNvARuxGTmgyqU7hVmsfbtDixAl8UFAIzetAQXW
         TpKoqDQnb6LsPhrsnFenNt61D/of0lR81bVcCxwgoU/DuvyeihIxtaicnWB5vSioUawX
         CNmvr2k1Ah4U1lwW2zYXgzeP0Is+IFheB0tj4xVQYrl3R3hH+iiMe9duBHW5QjTLXYJR
         43HqtNJL3hdtWbC3JZ0jXMepinajPTF3x6J2pwS29b3PnmFE+sZs4QfhujDJnVL+FT6V
         +2YaARyRLmyhg5syW2MQ+Z4OMZMx6fJXe9LeK0oajAUpwDQOGYdlLfv7wJttRBYEJsnE
         dO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CwiwkIOELvKwE+iA/ctPD7gAgGqhCKKtXUJJfHL+2Xw=;
        b=MJxJzpuM0dKdTwK/mNd2UagAMEXm1kqBFUXTFN2SuC7CjPelAQxjqieAdgx2YV6qJE
         KwHdmHIVQHvLDpXyNpPQL4ZM9j3gROpIcLQtOs9w1otcFStEHlwtF0/ODglm88HhKx4l
         gJIGPzaGVRlOu8zatrbKeUPq1Vf4+7zmPk/7bB5y2FZPO9eNiSG0ETwpYJG81tZOeuBH
         sUkqRZiEqgSni1HB0SAxPtDtI77wwVW3NkuL4r3/XYX9FDHJJv0GjdvXBQwsHt6rByEf
         JU871ro7Wz6PLiL4szFBlXgJc7pboivUIyvskiRndWtY9dXjyVx/ZYjBRx6ABfnFCU0M
         Laig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ae9d60f000000b006af2ed0a1c9si5231448qkk.274.2022.07.13.00.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXHG-00073q-Gr
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBY-00080U-46; Wed, 13 Jul 2022 03:53:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56591
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBW-0002Yr-Fi; Wed, 13 Jul 2022 03:53:27 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVH764VKz4ySl;
 Wed, 13 Jul 2022 17:53:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVH55bBhz4ySW;
 Wed, 13 Jul 2022 17:53:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/19] aspeed: Make aspeed_board_init_flashes public
Date: Wed, 13 Jul 2022 09:52:43 +0200
Message-Id: <20220713075255.2248923-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JYsKHKrzf18H

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
index e287a76e2843..b4355ee26a45 100644
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

