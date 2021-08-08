Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2114774lff;
        Sun, 8 Aug 2021 13:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjeayu3j+cSxXnvf2MjIL43wO+3mlQRU1SHdNU//zqa9xViE3Uo+vPCTseOVzYzl/8gmKr
X-Received: by 2002:a1f:600c:: with SMTP id u12mr12688897vkb.4.1628453113897;
        Sun, 08 Aug 2021 13:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628453113; cv=none;
        d=google.com; s=arc-20160816;
        b=LlJKDaV94tShAKqVUlEaU8tssKK+qw6IJkmeSShi7/DbpdaxTGx/bAZcFxJU927rIm
         +lEavGIQl83TE6Yu4aqThImJlpnl7WqMdg1T3LGuCyuKkuIgnQP4ZVByWM6Km/eLZp9i
         /l5ijIAuOq0p7Qxp6HTgimzsYWBKasyZlgz00QgZMVktbznYVLNjxXs7J4NzjTK7zneG
         2BK/I59XnNjWlWq0vpPZ6bDKKXStznMasJ852bdAl6Ll/Y/Mh9FP0H81zt1Nkyfk+PBF
         KD9mOS2xMZF0u/WyRjE8IhqpoNIQIS8232U1BmYQxFOuHc1Gi50+dFgWsqZPy1fdq0kb
         LtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ad0oRzqd+slEAoRGho7cketIboNmyDYqM7sd3qFWXr8=;
        b=fo+WmqCNnUX2WzAkyLwRRzcpGyhGpHFPzXfJx9vxHg9A2aQYYdUnnn0rES+rHbn3Uf
         uwGmYFhwxoXdAVGIKg0HCakp8N2JNQUq+ZZPp0SBVQCLVIP2u821v+si8+WeHEsgT5TN
         uNXmSnV/0HbakLfILnvLNStvHeIAJYIBND7Uec9lO9VB1FjDw7WpLGhJI2eaf2X5OXmn
         qt5vwSqI/qOVbrXJmJdoJ2KcjOp7qVCkxLHKHxnPSJR0xXEOW637XNS18vtFvPCuc1im
         Y1R4ZwxqRpwShqCUNtKejSAs1tlkmZTn8rb8CWLzYA2j0hgda2XNArMWGUrEUNq0RZ5g
         Fjzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u9ba3r/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e27si2197576vkd.93.2021.08.08.13.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Aug 2021 13:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u9ba3r/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mCp2n-0002ax-73
	for alex.bennee@linaro.org; Sun, 08 Aug 2021 16:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mCp2d-0002ZT-3R; Sun, 08 Aug 2021 16:05:03 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mCp2b-0001cC-CJ; Sun, 08 Aug 2021 16:05:02 -0400
Received: by mail-oi1-x231.google.com with SMTP id o20so20549568oiw.12;
 Sun, 08 Aug 2021 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ad0oRzqd+slEAoRGho7cketIboNmyDYqM7sd3qFWXr8=;
 b=u9ba3r/ACi9WjSDDB1YD0xUfuHQqBc9GLBeDVphVAqDNXdS8ySYR/r0LloMGKwJ7wZ
 Dox8UzCTB3pAZHLWt5ni/vWZWKxBMD9z7AzuTmgZZoW2Re802IOq0JFKS0IxsDPuypRn
 HntQtE/J9SljWI/gjTVZG2Pm4fzUpT8aB7kjOgJ58UekOvoKNJVtLqNX2PY7wwG7yPbF
 ZFxYPSs1vqARW3qC654pYm4oaVihtr9saEH5Rcsc80jUfu8E4biYFBQ+v6mJ7VjhL+Dq
 2udihhC12BIHDRe1iHqvsgsFYzL9pgolXaGxHME5syp1a5V+/gPIkr7XYPqlXrkkwWat
 81QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ad0oRzqd+slEAoRGho7cketIboNmyDYqM7sd3qFWXr8=;
 b=ah/iBvhnjN6p2xP2UfGLGtQtHIKSvimUnIKGAnSAwD1/kc0arjFo4ZJv9lSdf2RraX
 TUJAFHRvFE3EkWYRFjh5IZE1O1fM9K3DY52sjvRi0yMwmDNaFlXWmNU251R9ox0UTTGh
 mGhjcaZeVPRfS4DNvBpaanjOVl5BosiNPbDcoeGJS/NxNgglynJSQ2r89jZl4SNBczL8
 gxbvIdeAF3FhMs20ECvnOYl4LbZO0dGyR6Ue1oUSa6/Q8J+j16/UjOHmMUTupc+67MYW
 OEWVMFTAEXqLBndKpTpOoCQUCAgYnjhJL2fZMadaGuiAwYJaW6V0+HyMK51lhrc45KfO
 1CBw==
X-Gm-Message-State: AOAM530KCkvnhihkxr/pmgVuxm32VrgmRRXLsohPVXu7MNVTL32mtGMt
 qSIdo+ApZAS/Tzip4+F6Y7w=
X-Received: by 2002:a05:6808:1494:: with SMTP id
 e20mr20586202oiw.122.1628453099933; 
 Sun, 08 Aug 2021 13:04:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p2sm2880300oip.35.2021.08.08.13.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 13:04:59 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw: arm: aspeed: Enable eth0 interface for aspeed-ast2600-evb
Date: Sun,  8 Aug 2021 13:04:57 -0700
Message-Id: <20210808200457.889955-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwWMQUd52Fvz

Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
the silicon revision for AST2600 to revision A1. On revision A1, the first
Ethernet interface is operational. Enable it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51..ecf0c9cfac 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "w25q512jv";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
+                     ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.25.1

