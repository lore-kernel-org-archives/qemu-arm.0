Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp425054ejb;
        Sun, 18 Feb 2024 17:24:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaFfsKTy2NHV49QtUHgcsdjlVj6PnArJcHb1wYhEplmhd00y6CsAqfSNauTs8K9a+D9Lao60zg78DC+5T5kEfzFhKIPvZp
X-Google-Smtp-Source: AGHT+IG0ewPTmzdPZEZ/qTtrpM2RV1h+K6a2U2v6nA/2l01YvY6/DUxpWlno7ORG43EjE8Mwi7mb
X-Received: by 2002:a67:c48a:0:b0:470:4012:777e with SMTP id d10-20020a67c48a000000b004704012777emr2686224vsk.21.1708305843715;
        Sun, 18 Feb 2024 17:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305843; cv=none;
        d=google.com; s=arc-20160816;
        b=CyxaWpy6c6tNIsY/8uZWYRLLMGzYm4sDth80JrJUOH+wDhYBf1TfE9gF9LkGUt8NK+
         OqXA5dAg2rVb3E/hsUPPR5pNAsTVmoxwJvfXu55oUrmmibKHMwN+1c7xWCmByk+jEDgB
         OatiiYI14jccN0y3JCMh08g8skKZywl6ft42c1U9t2ez43b4pLSU/EDs46p+nJ4/3cYn
         1YuoP8RLSO6OqRn0ky5hRu0Ycbbj1Q1Rus2RwvzMchpHVzcSPIwXPYLDQe5d+DAic5Kv
         VNjYypiHBq5pikR9jJ0tHls3s+ogxg3XWwrkJSMBrQKv2/vMhAriLXzeVUuH8ssLHd9w
         nbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=42D3Uw1l60aMs7wpzCFKqNyu3mCVVlHw1fxrq6kmTaY=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=CzCi3C2kvNWxbd9dCWxUmfm3enacVYM1zkvRDW2bg6Hhn6Yffv8aL3LPIvqsh17NUd
         AJNbUdncuquhgaNFjGdo591WO7ahZjxb1wR6XkhsukIxjha1IXbp4HHS+CTdeyQs1WVp
         DKbUbcBCVNxciLwomApBbTup88l90Z/S5Lns6n7hsymYXjSjTr8j8d5uMZ24sXgI8mhq
         hAKxNauX/tlL3i7zsJkEWYjHfwMhurD/WkdCv3Z2XldhX2GRh0PH0CMRsJKC5hG1m9cV
         ecoCLFoCj4hkXar4s1rd8VHwqQ/wKr6NkDEfL+bhFMkUgsixXzcldrXZDaXwHvSvT5CG
         Z6oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IowKN0b6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ac84714000000b0042c4d1e2a60si5059246qtp.286.2024.02.18.17.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IowKN0b6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rbsJH-0004KI-N4; Sun, 18 Feb 2024 20:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIQ-0003Me-Mn; Sun, 18 Feb 2024 20:18:15 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIO-0004Hd-0B; Sun, 18 Feb 2024 20:18:13 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-607bfa4c913so35256687b3.3; 
 Sun, 18 Feb 2024 17:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305488; x=1708910288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42D3Uw1l60aMs7wpzCFKqNyu3mCVVlHw1fxrq6kmTaY=;
 b=IowKN0b6F41TT/H4Yrfl1IDFhvisuyZxMSAXJXOxau8sVwruF3jV7G6oWjZIO2JQ2F
 4SkP1FLvss5TI5zvT5Rr87mD1cFDxH72QI3kU60HA+RrwRypiIYXHYBQqmaNAoSTwS+Y
 1l57KMkm9PevIoKshonF08E/5WPFB3cnV6hTxfk4dKry4DeeVV/baNGXNywiGWrYGcDd
 JunEh+KWC9rSPQNY1D+X1GXCsITDwTOcpB0bXkfA096J+mmoy05/Ah2X8wyuCD7gJX7f
 Dxz2O8jD1GHONZjT/qZaSKWEbOKaICSP6fhGIm0tt5WnM6DOgYcCJ7+baruraVeixeJ6
 2OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305488; x=1708910288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42D3Uw1l60aMs7wpzCFKqNyu3mCVVlHw1fxrq6kmTaY=;
 b=jdfcfZk4bxP4UOpUXP/BqaNPmf6ZRLvAvCjxWklffwOqtALsIADlUhJcc03h4rKRhR
 cbAVszzPQA/A9DNTGtQCJ0foQ1vrtWrm2SkeLl0IhXZDD15t82+N5jyR5dIISWFwHFu9
 7VWccDvo+oYAz4g4D1b7nbQCNKnsO9cfe6CYHAh3hWaafFogICYhxxzw9qqYk/dkB2ux
 C2zq1fE/xL/zp6GBG22PV3mYxy2qxag9uX3srDmQulaBGlao3P7TjQ9snocQonjzcN38
 Jrxh5BU/Gsrz4FO4mF9iaFlF2iCNKTAs6KuGGDFTtG5ttHufCbXvnLrhwolpnv4Zb2eE
 OiAA==
X-Gm-Message-State: AOJu0Yw9iQtKk8LEobW3mkpbWESUjmrQ8IIZDyH351Pqdh3YTT60KKX7
 qb2fs/nzd112sydGLbQm4USfAyEyO34Q+cN7MUze4lOdK7fS0fH+GXw390cRBUk=
X-Received: by 2002:a81:6d87:0:b0:608:3f2f:a2fe with SMTP id
 i129-20020a816d87000000b006083f2fa2femr528941ywc.46.1708305488044; 
 Sun, 18 Feb 2024 17:18:08 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:07 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 18/41] Add clock_isp stub
Date: Sun, 18 Feb 2024 19:17:16 -0600
Message-Id: <20240219011739.2316619-19-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y5QxyOZxFy1E

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 6 ++++++
 include/hw/arm/bcm2838_peripherals.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 48c5fd5978..35366386ca 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -17,6 +17,9 @@
 #define PCIE_MMIO_ARM_OFFSET    0x600000000
 #define PCIE_MMIO_SIZE          0x40000000
 
+#define CLOCK_ISP_OFFSET        0xc11000
+#define CLOCK_ISP_SIZE          0x100
+
 /* Lower peripheral base address on the VC (GPU) system bus */
 #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
 
@@ -228,6 +231,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
                                 mmio_mr);
 
+    create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
+                 CLOCK_ISP_SIZE);
+
     /* GPIO */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 49bb4fab08..adc02894c1 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -77,6 +77,7 @@ struct BCM2838PeripheralState {
     OrIRQState dma_9_10_irq_orgate;
 
     UnimplementedDeviceState asb;
+    UnimplementedDeviceState clkisp;
 };
 
 struct BCM2838PeripheralClass {
-- 
2.34.1

