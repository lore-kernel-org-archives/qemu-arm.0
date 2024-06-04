Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718483ejs;
        Mon, 3 Jun 2024 22:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWas7wbY7htm+GocxdQa9OOLMF4UJ/0pF3deN97Du3Bvx4eo11Vw6yvx+eQNSkgnCtR7B/iWOwtTOGDoL1X4cUV0jisXrZK
X-Google-Smtp-Source: AGHT+IHmtFyRELBFoV1rqdNSQIHjjdCuR0j1WFFAGm4gDSE7forJibv/Lhrenma0cK4gJyOyrx34
X-Received: by 2002:a37:e30c:0:b0:792:bf10:3ebf with SMTP id af79cd13be357-794f5ccd457mr1223884385a.56.1717480118649;
        Mon, 03 Jun 2024 22:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480118; cv=none;
        d=google.com; s=arc-20160816;
        b=DbROmgO/Fj1g41ITAtTWAaumIkKDEpoRqxrGdiuZgY6DFMVshCOALIZ3HhmnIDwzQ/
         dwHWiRDiKmflXzi6hbwvei9o+SCEbm3rp3wPvpoS6uK0l48h1PNkZaiZkD1gDwBixzQV
         HNvGT6M+1wAbPOUNVTKi0SqdXiE3u+XZVo8vfR1GmmSW970T6LHSJzLVA6GMKXqL2Rbw
         pKpRa15CT07MQlB9wlekVs619PpnrmHmX/GbfHlvhABn5QUiZZA6vb1LrZP/z8nq1+5Q
         +gnLEnqySVnlLYAOHEe9+EXyxxZRx1g6s13z2uwqatnaFHhK++QqU1Ca5sTW8OqCDSKC
         hWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GLaoS6G7xnU7i1HvPSvVknxshNXKyPWJm2fxVS7+cPc=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=rLrgRtGa2MJI6XjRIQC2D7dKx4/+12yYW8OElB+8bAUdl8q/SbMsaxMOvG9MWaY2+y
         XRTa7fAzJuJ6+I33FPugOXYR2DaL1C5b+uCKlcwNXTA06+9oeDjfVU9ZQBp2PRDlseeq
         v6PjhIBIv3QVMl311mhYgpPNOB7Ugdx3s7lgq15wnBd+MxOiJv90sguHO4zd5kXiPM0s
         kiq/I2IAYdd3QaHZ78o7WTcGlIieHnJatei5EwgTeejoStljtMqJ5mCgqxpdr0pKAWN2
         n2dpW9um9QdBx0Ad3Z6RpFXQvVg8vyOGhrB3m5u3L/oNTEzzj7JwIBvZwAYxh9T3Is52
         VKBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f318a01asi122024685a.471.2024.06.03.22.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEMyj-0005aK-K3; Tue, 04 Jun 2024 01:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyh-0005ZU-U1; Tue, 04 Jun 2024 01:44:59 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyg-0008TH-Df; Tue, 04 Jun 2024 01:44:59 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:40 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Jun
 2024 13:44:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:40 +0800
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
Subject: [PATCH v5 03/17] aspeed/sdmc: remove redundant macros
Date: Tue, 4 Jun 2024 13:44:24 +0800
Message-ID: <20240604054438.3424349-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C6h/9BHnBicn

These macros are no longer used for ASPEED SOCs, so removes them.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 64cd1a81dc..74279bbe8e 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -76,10 +76,6 @@
 #define     ASPEED_SDMC_VGA_32MB            0x2
 #define     ASPEED_SDMC_VGA_64MB            0x3
 #define ASPEED_SDMC_DRAM_SIZE(x)        (x & 0x3)
-#define     ASPEED_SDMC_DRAM_64MB           0x0
-#define     ASPEED_SDMC_DRAM_128MB          0x1
-#define     ASPEED_SDMC_DRAM_256MB          0x2
-#define     ASPEED_SDMC_DRAM_512MB          0x3
 
 #define ASPEED_SDMC_READONLY_MASK                       \
     (ASPEED_SDMC_RESERVED | ASPEED_SDMC_VGA_COMPAT |    \
@@ -100,17 +96,6 @@
 #define ASPEED_SDMC_CACHE_ENABLE        (1 << 10) /* differs from AST2400 */
 #define ASPEED_SDMC_DRAM_TYPE           (1 << 4)  /* differs from AST2400 */
 
-/* DRAM size definitions differs */
-#define     ASPEED_SDMC_AST2500_128MB       0x0
-#define     ASPEED_SDMC_AST2500_256MB       0x1
-#define     ASPEED_SDMC_AST2500_512MB       0x2
-#define     ASPEED_SDMC_AST2500_1024MB      0x3
-
-#define     ASPEED_SDMC_AST2600_256MB       0x0
-#define     ASPEED_SDMC_AST2600_512MB       0x1
-#define     ASPEED_SDMC_AST2600_1024MB      0x2
-#define     ASPEED_SDMC_AST2600_2048MB      0x3
-
 #define ASPEED_SDMC_AST2500_READONLY_MASK                               \
     (ASPEED_SDMC_HW_VERSION(0xf) | ASPEED_SDMC_CACHE_INITIAL_DONE |     \
      ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            \
-- 
2.25.1

