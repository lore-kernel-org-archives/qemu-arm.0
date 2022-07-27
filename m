Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp171966lfg;
        Wed, 27 Jul 2022 03:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGw89SqAyuo4kQ+AO/J68e4g64Xo7tMO0OmOXoNGo65TxzWAW7QDgEtH5dm0oJejLchY4h
X-Received: by 2002:ac8:5f0f:0:b0:31f:3966:3f87 with SMTP id x15-20020ac85f0f000000b0031f39663f87mr10413732qta.578.1658917966173;
        Wed, 27 Jul 2022 03:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658917966; cv=none;
        d=google.com; s=arc-20160816;
        b=fWU7Trh1CeN4qJhC0AJFs6IoMpay15eqmQ/GZIVc2n0/0KSaKd9NQnA0CW4LdZ8OqS
         DlOtniH+C1Dqj93ejcqSrMirOdCs1XMEfay0sUGPkw5MiXyqkGLoLTRGHfKDGs2itf9W
         BcNKLUgdEzC8K/pxHBBrWyUM/GQH2YvSesPWTF54CdRk2eCPGa/BdhAVEtTyHBgA6txX
         UrxBtnFz4TvOj/xWEaR5bmTZ8SMFWESAFNN6GXNBZFfSGWT865rpU2QoR+DED3GGLNgU
         DxNavr5okj1TP9moVSAmpwoyiquSzuwZkcnc2T80L35nClcLNglzsQNDX64Zy3FP1KzW
         6l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=sYcksN8fjsamWTt1crTxsApkAbJZDKHBI6jIxkWZRCg=;
        b=D2affiP2hYjNvxbVc48E1Ccdme838oJkFkngpK+XAXM2vevHQxEH4UUHxYnFjjt/Lh
         5iz8uX9h/2wloWMCDjitbOeLasTa+IlYt2bjeCXf/qTndlXrelZvIu0yvmvckvrLq/cc
         n74HxUREkx+3w+NDy0C+3N4n3R+rAPmVR6NqhuO/uC6f1ie4qJTMu2NPUxJV2DHsQja7
         Y52vRFp00Sg5TmlhKaUk8ajSXtWm47fXE4lla/ZXlWncFnMRK/SMIyR9nGBKjxFaiUVj
         fANYeFSEGN/CBCi6EthtFfmu0w3F/z91+9ty11Ba637TX0d1lwoGE2+CswjFfJN1+xlQ
         BP6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020ac84d81000000b0031f36ef0ce0si4283082qtw.652.2022.07.27.03.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 03:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGeLN-0001g6-BI
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 06:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGQ-00069n-Ao; Wed, 27 Jul 2022 06:27:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGJ-0004VB-W4; Wed, 27 Jul 2022 06:27:36 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lt92N2y4wz4x3v;
 Wed, 27 Jul 2022 20:27:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt92L2JL8z4x1N;
 Wed, 27 Jul 2022 20:27:22 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for 7.1 1/2] aspeed: Remove unused fields from
 AspeedMachineState
Date: Wed, 27 Jul 2022 12:27:13 +0200
Message-Id: <20220727102714.803041-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727102714.803041-1-clg@kaod.org>
References: <20220727102714.803041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=RDWM=YA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: sONZArg4OP4d

Fixes: 346160cbf2af ("aspeed: Set the dram container at the SoC level")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4193a3d23d1d..b3bbe06f8fa4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -38,8 +38,6 @@ struct AspeedMachineState {
     /* Public */
 
     AspeedSoCState soc;
-    MemoryRegion ram_container;
-    MemoryRegion max_ram;
     bool mmio_exec;
     char *fmc_model;
     char *spi_model;
-- 
2.37.1

