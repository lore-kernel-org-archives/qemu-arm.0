Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801088ejb;
        Thu, 19 Oct 2023 14:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETjw/WOrZyNUjqWA1uAyIFWdqqj1DnLTB4BzayEtUthynGg07qjpJBtYDKy0K/VmqAUm+n
X-Received: by 2002:a37:ef15:0:b0:777:2d58:857 with SMTP id j21-20020a37ef15000000b007772d580857mr3616835qkk.28.1697750498574;
        Thu, 19 Oct 2023 14:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750498; cv=none;
        d=google.com; s=arc-20160816;
        b=wrxaQ1TFhWmywBx1mj1qHl4kuPwDbGR0GFlaJ1d1NsWFDqmVfK0BwRS3C5DQaBenLZ
         ejiwkO80/sqfYgya8UJEauyhNMbjB9gpSIviJ7F4VgaN8kxY5jfTB2fbyGbqxeyd9486
         Jh847tyGTNXvlnedIF4UxmGVwv5BYfmgHhaqFDUw/CWr3l6ipFJoSmlbTMuDdKuReIH2
         DKyD1G/mBW9sUN4QrfXxx5SiAhrrwDzXq5eHStX2FrxBCuG40CBZbG2U7O41O7YfFrDH
         BYjl2d2+1PAu3HSN9Iqm/20Me4a/TVFFpVZ36rVwc0RbmwXxxGs8hJiRdsgiQtEDRdJZ
         /TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3U1ctCoB2Patr0sOy1+nWAx2R2m9mUOpe8fog16ZiDc=;
        fh=gPUAZr3rG5AAum2cFS0vXpLjRIjvY8asn41zDrAXuoE=;
        b=hW5xg5/dfHsoVOU0y5RI+hID012mDOe5Va0jT+rFkHV9jE36HwC6mc6+jKuL+UpH/0
         JNejaJdyT7FGQ/b6NM0XX7dO7HDLZUFXGARMn0IGRb2IVufJhVTulHf8cRRxD13jcBKF
         qx42Jon167VU6iaDBZ86KGl5q4kAIexV+vv47guv9KOBcLm031EiOb8cL1QhbCw07hK8
         HyY5r+KoaUmSmNR7cj2JJqkydMiKitIFhxh1oI4wD1mOeX5HYw1Bhot4jr6FPE0t/Uan
         34v0qzVkl0U89lb1CIhUUJCG4ZQnmZpVpbP5HJ+PayTwpaaIjorJM10HGCkFVhv4F84x
         acMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hb23pGJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020a05620a118d00b0076d845d4e8esi227735qkk.476.2023.10.19.14.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hb23pGJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRz-00010E-00; Thu, 19 Oct 2023 17:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRx-0000x4-0A
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:01 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRt-0005gh-UL
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:00 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so1540871fa.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750456; x=1698355256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3U1ctCoB2Patr0sOy1+nWAx2R2m9mUOpe8fog16ZiDc=;
 b=hb23pGJmXToeKTmU3gP2MsVGPmWhHHR8/tzQZ4Js544D4usDcpUPREFe+Wb5Tl2XII
 dQ77WKvxkA/XfRWy4zeUPRwzemCDQ3z3UDVYGCJqCzYqj9vdZ1Jujiejc19kSgjU/BCt
 6fBvxRYXw/O1zQXrdcbkDqHyPMPa1ia1emFiGu9PU3hT1Jc8sJFIf8ndVuXuEFvyji+y
 zjWAIvkfCz5AzTM8tzlP/BCNsld76CE1/MeDhow6qf1/avFiBFpjY7TnLHBlidPT1jvv
 oBaSKklxokeWV74elpCczDuiAYSO3fzXgZx+dbavRGc5I1zzJ6NNpY49SLmQLuyr6yQG
 CT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750456; x=1698355256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3U1ctCoB2Patr0sOy1+nWAx2R2m9mUOpe8fog16ZiDc=;
 b=SNPASZcWwy6nVGNRG2FDcmgTuRE4HFxeP2a9YhTAtruKmpMtQ6WpLZf2Uo9aDqZLtc
 iS4P7Pt2MncXlxH89t9bnxaTINWkxwQUQRnJCRx4JqzU58NJ2YojS61eTXWZhEFWIf+7
 e3G9Y1muyTF3uK7wTNIoXp85GreG+2z5b5M1u1ANSXTIXXke5xPSNFDGCrQMHve0muAy
 M+3ZyPJuLZfO7tG6r7NJqJhJ8Np8YLcnffCqppDZHvqTn9WE1iD64IXnebajEQYn9L74
 nDR3tMIG7It7s0tGAwXqMI7pq6WumrR6bW2hanmq6Jpw1Huq85fj2aCof4L8HAOBeIB3
 OG1w==
X-Gm-Message-State: AOJu0YxFDbInGM2bC2hnjJMFxFCBrKVpJD9WPfyPbvZaHKioMvun64/i
 Ih8c7nezKsLEOQk1a0ihYzTGQg==
X-Received: by 2002:a05:651c:1986:b0:2c0:afd:e7ed with SMTP id
 bx6-20020a05651c198600b002c00afde7edmr136679ljb.10.1697750456122; 
 Thu, 19 Oct 2023 14:20:56 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 bh9-20020a05600c3d0900b003feae747ff2sm5380666wmb.35.2023.10.19.14.20.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 24/46] hw/ppc/pnv_xscom: Rename pnv_xscom_realize(Error **) ->
 pnv_xscom_init()
Date: Thu, 19 Oct 2023 23:17:49 +0200
Message-ID: <20231019211814.30576-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 16uZrRNQinIw

pnv_xscom_realize() is not used to *realize* QDev object, rename
it as pnv_xscom_init(). The Error** argument is unused: remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231019131647.19690-3-philmd@linaro.org>
---
 include/hw/ppc/pnv_xscom.h |  2 +-
 hw/ppc/pnv.c               | 18 +++---------------
 hw/ppc/pnv_xscom.c         |  2 +-
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 9bc6463547..41671001da 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -170,7 +170,7 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PEC_PCI_BASE   0x8010800 /* index goes upwards ... */
 #define PNV10_XSCOM_PEC_PCI_SIZE   0x200
 
-void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
+void pnv_xscom_init(PnvChip *chip, uint64_t size);
 int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
                  uint64_t xscom_base, uint64_t xscom_size,
                  const char *compat, int compat_size);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index eb54f93986..456631c9dc 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1249,11 +1249,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     assert(chip8->xics);
 
     /* XSCOM bridge is first */
-    pnv_xscom_realize(chip, PNV_XSCOM_SIZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    pnv_xscom_init(chip, PNV_XSCOM_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
@@ -1512,11 +1508,7 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
 
     /* XSCOM bridge is first */
-    pnv_xscom_realize(chip, PNV9_XSCOM_SIZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    pnv_xscom_init(chip, PNV9_XSCOM_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV9_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
@@ -1727,11 +1719,7 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
 
     /* XSCOM bridge is first */
-    pnv_xscom_realize(chip, PNV10_XSCOM_SIZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    pnv_xscom_init(chip, PNV10_XSCOM_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(chip), 0, PNV10_XSCOM_BASE(chip));
 
     pcc->parent_realize(dev, &local_err);
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index d820e05e40..af57b55863 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -221,7 +221,7 @@ const MemoryRegionOps pnv_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp)
+void pnv_xscom_init(PnvChip *chip, uint64_t size)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(chip);
     char *name;
-- 
2.41.0

