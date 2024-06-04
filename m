Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2717451ejs;
        Mon, 3 Jun 2024 22:45:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzQ0M3BXQTdzYDn2+K12UmbnyCufTIa95ntVEa1T5s58Rmkzvuhn138Vs8oCHufN1KWEN55l/asrPwMulVzc9ak6+Wfm7F
X-Google-Smtp-Source: AGHT+IH2fmLps8Te21yheOyhI2bTcyHYSqO97RTm8ean/IAI6kNNCfIo+OXKz7BBC/dc/tXjVfMg
X-Received: by 2002:a05:620a:935d:b0:795:fa3:53b8 with SMTP id af79cd13be357-7950fa3554cmr348852685a.61.1717479934164;
        Mon, 03 Jun 2024 22:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717479934; cv=none;
        d=google.com; s=arc-20160816;
        b=khrWEsTIVo7O/Wgz+20OIJ09mLRJ/NSkCthrEYIbXwa8+rFfDFoUvhd46dXaVQX2l/
         opcInbGPnYauJMN9lVIEZw0sJ5WbwBMt6vE9+S8LclXDcKU5eedjqXFsWK3QlhUxdufw
         o74u9c2BvRtnTMdxNoTNXhOtimezws7CLGiVR042l1Xjzlf419GPhprXWuZ2EfawiR5Q
         qLnfsooR3fO4XF2fiB5ytezjFDrzAhbu3DoY8nwHTnpsXW2GWsPCVGd32rwdRnFMn7tM
         yAcmFzpRQ2QRAWpa9Hdds95lx22+g6Vck7GX2y9RnWwui7XmaEOyxDoS/98KVXRojR5g
         6nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=i0TrRRu0nMc5dXY79iZVMtpLEa0tLCTQqVjW3b5Kvx8=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=NNYLninho9u/VoYtyAZH5Wt11xnlWGkoZYgVnGnxrQtX+4uuyr1WRI6wg+Mlo+a2Yb
         +15cytSofIlSkmkMIvI5AqcmM4LqPrh+fs55IBSJOH9A+8vaspPciKT1PqqFD1Q72SXo
         50MSkTSEvdT5h6JfXAEoJbO0ciFml5xoCpnUS+Bl7EXQ4sCuVxa+42BW4BJ95QMnD+gz
         OJxNtjC+6pD2SaA6x17M/LTi7G3E7hnUubuezGuIDZjPHGzv6sSelcPDxY5L6mqOLzG6
         EWwbXwBANUnuCmJpKDBLFvDH13SDT4TA86pAcUMGlWASW/w4CweL1UgVDmHPpvrn2eOq
         jPdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff23dbc99si104514431cf.210.2024.06.03.22.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMys-0005dQ-6X; Tue, 04 Jun 2024 01:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyq-0005cl-3G; Tue, 04 Jun 2024 01:45:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyo-0008TH-Hz; Tue, 04 Jun 2024 01:45:07 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:42 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:42 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 06/17] aspeed/smc: correct device description
Date: Tue, 4 Jun 2024 13:44:27 +0800
Message-ID: <20240604054438.3424349-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qnOwU8vUFJS1

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7075bc9d61..fe1cd96b80 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1449,7 +1449,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 FMC Controller";
+    dc->desc               = "Aspeed 2500 FMC Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1487,7 +1487,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI1 Controller";
+    dc->desc               = "Aspeed 2500 SPI1 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1522,7 +1522,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI2 Controller";
+    dc->desc               = "Aspeed 2500 SPI2 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
-- 
2.25.1

