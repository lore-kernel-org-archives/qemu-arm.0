Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1147283lfr;
        Sat, 17 Apr 2021 03:31:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2fKFlJehUlR4e0B+9cD7DDHXYCLN4Az4BMX5r32YSxGkiYdHFveX+LRGgbey4XD+3x8oM
X-Received: by 2002:a02:818b:: with SMTP id n11mr8138222jag.62.1618655480199;
        Sat, 17 Apr 2021 03:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618655480; cv=none;
        d=google.com; s=arc-20160816;
        b=iXkUB0GPLzlDKNkc0Mkw0l7goYzw9SbZMWOtsZYAsu+AlvYG3W0Ug4c1RGkOUPUj8f
         ykEJsFBHKiZRnhk1/Ko2wdN4EUxTYiHGlKgM406PzoFwmaPBr4xTVB+vUDzUaVQ2/5Dn
         THL2I60GPcmYDnQt8WSTWCOAlrXmVOZPCvB9FUuXpKXqGxSOv9z+CsehNfBiKVSTLGy0
         YYjAj6AHvU15857wWnSuenQDWa9Ca6tyCA6Vh6E/AwNFAoRqgYeCrHdgkMLC6vFWIZtl
         CRhs95ajgXtzEdixRABhq0QsnsQlQsMLrQY/j9bO50xLpeLWroFNGsezzoXvH+2CzsfR
         lJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kF/aV6qxhEEC7EHoDNvMenC0A38A0IZfHiqIOjgg71A=;
        b=bZSIhO7EEiK+v31NgwD7iLb3JkWx2oaS/Lznunt/LgGKc9pyT3194fjrocvQRpuxkF
         U9Z9Wh5wI4Ir2/4bzQHyfbrrwKnE52T5YLs8mn2zDzuaS3CgVv4t3zuyFILk1FRWXfaM
         U6+53M3QtUR7WJuYdvnPH5HrDsqANzNYdOLXmp9l9FXez3L+8CD2fytABfDFVbLHtnCN
         X8MWpco7YJoFBC/KFSz560K7EJop5+If5lIxJFA9ShoqZY4/mVcNX9NSCac5ZbPXUA5l
         DWJAAfBFbjWuo9GAfODTJ43yQrCF+xXeXajNqohR9Fmp2WreO2WEG8g0UapR/pUMe0gq
         SsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DobbvUqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si5481815ilj.50.2021.04.17.03.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 03:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DobbvUqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXiER-0001Ty-G2
	for alex.bennee@linaro.org; Sat, 17 Apr 2021 06:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDu-0001SM-3z; Sat, 17 Apr 2021 06:30:46 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDs-0000mn-1t; Sat, 17 Apr 2021 06:30:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id y204so14148626wmg.2;
 Sat, 17 Apr 2021 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kF/aV6qxhEEC7EHoDNvMenC0A38A0IZfHiqIOjgg71A=;
 b=DobbvUqA35+9kB1+MeSnWxw7nXURePdOwwkPQQA4JSO2GGux7pJHOVn5wp7nVsfIbk
 MZo7gt6QtAFh3OfuTD+n8G5vGx5/pe3yUULKtj5n++ZjZzxU1hB5BLxvwiLsRg52tm2/
 d/B/pDKY9dMq39w7yWxVNyx2Gz7f2w4ZR9rXLWbED/yopVd7m1/Zt+Ooto0EkH2yxYyE
 V1MN0b9J9Df3p76lizDy9ZI0mqjb9FRmSKKpMwsFI5xotEyB2nHASZN6yld2YQFNBU0s
 o1cZ/rv8bO7Uls/fnG7eMzXfQi4O8+njSKf/VtcoX0ykSWP7OyFNL3VH9KaBabtiyn26
 y0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kF/aV6qxhEEC7EHoDNvMenC0A38A0IZfHiqIOjgg71A=;
 b=N7Ca9UNehgm8BZOuPEK4CDK4j3SlA7wUi0nKCviENiOrGZr92sxn67ldCuPWquoOTv
 yRFoVrKcJBoQGTT/XkvqY7Hx4xPRVYuRvvYCNKv4LVI1/a/LNySsv69iV6IX10q1y8rr
 ObynyYvdPZ/j4clI3I5gvXL42WqgRjqVGoFkZeivX5UKzYDrTctz8MwsqC9ZMWv9pyqb
 CR/w4BHnLTrJKuEy7e4urtQ0uYSPsPfbm3bBFw18GUh4g5FNT3MH+HzD0dFWt/VazIS+
 Hv/oBJJjhWfuHv9qYZeYVbU6stB8U4sAVVtlw1ODdgcvHNa13doqXiw9Sc8f3C6v6THu
 8upw==
X-Gm-Message-State: AOAM5315x+JCFZ/O3xsB/l7KSqeOQ8LxB8uIHYbBvE8dVqK9Hf4Kh0eC
 0ytff5JCe+V7/7/b1IzShgLKTxMEy5k=
X-Received: by 2002:a1c:f305:: with SMTP id q5mr12212974wmq.96.1618655441662; 
 Sat, 17 Apr 2021 03:30:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm3794006wrt.57.2021.04.17.03.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] hw/aspeed/smc: Use the RAM memory region for DMAs
Date: Sat, 17 Apr 2021 12:30:19 +0200
Message-Id: <20210417103028.601124-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJsBJgUsw596

From: Cédric Le Goater <clg@kaod.org>

Instead of passing the memory address space region, simply use the RAM
memory region instead. This simplifies RAM accesses.

This patch breaks migration compatibility.

Fixes: c4e1f0b48322 ("aspeed/smc: Add support for DMAs")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210407171637.777743-2-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index daeef5b32a2..4033ffd314c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -328,7 +328,7 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
                             &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
-                             OBJECT(&bmc->ram_container), &error_abort);
+                             OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 16addee4dc8..6f72fb028e5 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -178,8 +178,7 @@
  *   0: 4 bytes
  *   0x7FFFFF: 32M bytes
  */
-#define DMA_DRAM_ADDR(s, val)   ((s)->sdram_base | \
-                                 ((val) & (s)->ctrl->dma_dram_mask))
+#define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
 #define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
                                 ((val) & (s)->ctrl->dma_flash_mask))
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
-- 
2.26.3

