Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp30579ejc;
        Wed, 24 Jan 2024 21:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESOFzj4LJmQNsnxwlO6xBONdVz9jPAum5Ea6H4/7MlLRAMu52ylpijYmjDSyL/zWB0tMBV
X-Received: by 2002:a05:6214:e82:b0:685:56e3:cb8f with SMTP id hf2-20020a0562140e8200b0068556e3cb8fmr583234qvb.88.1706162298901;
        Wed, 24 Jan 2024 21:58:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706162298; cv=none;
        d=google.com; s=arc-20160816;
        b=EZCFnLaJr78NaK5zHKcU4shvR4XNEJVAVTF3Vmxn+0zQP81UHbIBesDAfWDvnp7brU
         qD+vcB7x8GZyVv7Cy/GYteD1JzUR+BVTz1qa/ALdbemsPlQ/4lGiLQi5n8KhM6/2umYi
         87fsqhnIiM4dcmN+ydj9wcbUiiYxYu9MyFdCPKlDzL1fVkEYkf9ZbcZWmvNiNxvEh/gT
         Shh4WvPPzzke1okHIAmwa9OTZACG36l99gz1bqWyLTKLSCVs3zrepGhcMnjOqrRiw5sf
         B3X2ML+xDPds6BKhAYHX7rpmXKE+CBxej4ansQ8K0NMU/n3DOsSpSf3Nlya/dAQ1alV3
         /S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LJEHUrHwrIT1rKWRwjxDbaX0Pfnq9aLQleOdaQTs5wo=;
        fh=FNlwegs1oJP6A4COwutP1+wiMlDn5TeDvVO/NojbsqU=;
        b=y8djHgkKz/odmgk3ffu48gC2suflnsSKNLSSsAyIxUpOV5hYrHrlAq5EBrVcIz31/T
         1AiFlY9Q+jSB6EeTl57bhYRwqGGwxhvOvP51aAisJoYme7/w9ZZZYdjHRx+zHNqLg0lj
         3KgDxJPNMw0/FctuC/LyKJu61KvWlg4n/vPKwQJwQthKWx75QDFuzOOWjfiYFLFPQApN
         dy5UolKfhIXkEv3mddwf+gEvA+kVqZR3qfGAVL+a+2EnvejurMPYRi/tyHDk39YztV6w
         xmDJ5ZK5FxLTUiveO17B32woij+0MlshybMx5RUrs/Nh/XlGOHPbGsNSl/Uk/MjR/svS
         6IFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QzZS1YwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17-20020a0ce291000000b006819867ed39si7598337qvl.388.2024.01.24.21.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 21:58:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QzZS1YwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSsia-0003Im-0G; Thu, 25 Jan 2024 00:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsiY-0003IG-4G
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsiW-00017a-Hg
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so74405565e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 21:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706162159; x=1706766959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJEHUrHwrIT1rKWRwjxDbaX0Pfnq9aLQleOdaQTs5wo=;
 b=QzZS1YwBmtBz3ojbAGMurPXeDuyjSwwAegyNdVCF3farpbgdKjFSKsy/eRgwkcsUB3
 Ak5G0fgXwhvjFIvODWpQeAg4yqATEwimOFucOBAf1RxzsbluoeCtQgEvF0O8jsjAXbaN
 BIay5ZUcfFbz/BRtwa1vLGNgs68OT/P0xRSIeVHDK5sYYPojanN3yQcajVqf5uT37bWp
 swvK1WkE2aSZ6SFgP7IBLRHUyXRFYcFRpL3R5CyxqP85XQ5jWA5WiJs28SCBhwd/QFJM
 zV3w2n+m398sszlDEcKq+b4lI2xgxlfpDDzOR/VR4lmcafle5/eoVZz5WVOPwQRbUb9h
 eOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706162159; x=1706766959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJEHUrHwrIT1rKWRwjxDbaX0Pfnq9aLQleOdaQTs5wo=;
 b=moXUucQWzgVz+sZ54iDbcS1xb+LWfb65QSrFE/YSGP8zVXkdTgg+dONCT3abj+n45L
 B1eRw1NIY0FYdtx2NfuJfij5BfYpoOQNrFX75qdm3VQEKEidOPWSkLrIqYRdZG1ZxTyZ
 zxCGkR08FSHfnP+KqzbCXBmLCqZbk7NVcZf+xZ9lMlAAVaWpcAdJonE9VLo9IYqtqJfL
 cjEOwWSe5YtRgZutm4KQPxRpQ2/iZ/mtzrvlMDez6tKvpsaEtTrfqjpoVr7V5jgEdnIX
 tPxJb2ePN//cs9Xu27aUVV6Jb6vRrwNGzj8otHQYsU16fttbvOtMNALNc+gyuvlCD4eV
 i2aQ==
X-Gm-Message-State: AOJu0Yw/14L2PR12VgJrVpDGp6qA+oDMrBXz+hCyrw1pecsQ5uvYK0jC
 rfYUzID86lLQa6WxeM8owqhHOGZnFYTtaTtdweDQb+06LhVJJCqtwXicTCmZ0DE=
X-Received: by 2002:a05:600c:a41:b0:40e:89fe:255b with SMTP id
 c1-20020a05600c0a4100b0040e89fe255bmr109927wmq.160.1706162159016; 
 Wed, 24 Jan 2024 21:55:59 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 fk15-20020a05600c0ccf00b0040e9f7dadc6sm1246791wmb.25.2024.01.24.21.55.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Jan 2024 21:55:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 2/5] hw/arm/aspeed: Set default CPU count using
 aspeed_soc_num_cpus()
Date: Thu, 25 Jan 2024 06:55:41 +0100
Message-ID: <20240125055544.79405-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125055544.79405-1-philmd@linaro.org>
References: <20240125055544.79405-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PkM1t/Wh/8oF

Since commit b7f1a0cb76 ("arm/aspeed: Compute the number
of CPUs from the SoC definition") Aspeed machines use the
aspeed_soc_num_cpus() helper to set the number of CPUs.

Use it for the ast1030-evb (commit 356b230ed1 "aspeed/soc:
Add AST1030 support") and supermicrox11-bmc (commit 40a38df55e
"hw/arm/aspeed: Add board model for Supermicro X11 BMC") machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4bc292ff84..5b01a4dd28 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1212,6 +1212,8 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size = 256 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
 }
 
 static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
@@ -1586,11 +1588,12 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     mc->init = aspeed_minibmc_machine_init;
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
     amc->fmc_model = "sst25vf032b";
     amc->spi_model = "sst25vf032b";
     amc->num_cs = 2;
     amc->macs_mask = 0;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
 }
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
-- 
2.41.0

