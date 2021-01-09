Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1281075lfq;
        Sat, 9 Jan 2021 04:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGhiysC/VDwWaKpjvFBrPH5mbbvreYVkmLT6lA2RNaioNtGZ9bNLcoPAaznJBC5SvZWwWG
X-Received: by 2002:a25:ea48:: with SMTP id o8mr12332930ybe.404.1610196071475;
        Sat, 09 Jan 2021 04:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610196071; cv=none;
        d=google.com; s=arc-20160816;
        b=J+v2UZVzERdCna2mSUg7gcCgshhgWHZZdvLv1o1ZsIL9acRnfmarLyb02ONqcW1ASH
         qa2yUr7mU7xg0ms1M1uzt5q4zcvErcicl+tMQ4o5TyG/Db0+MdWd6TLEfOcSYmeb0LGj
         CQWfIYW0ThaIb43tEBS2HRGg2hpvjmFGVPSol1G5MwgP8fxaiARnGHjipBHfSFRnurBz
         ppsh+hbBhJzJlVi2Gv2Isy+y8jPrIWg3EZihDKWepo/SaW0yKPRls8jisc4c1n54zpLH
         4D0iK5pqv0UU7ksR3ItmXg5040c4bsHBLZOE2NkMzh3AAgNffR9badj+JWuvgnFwOr9l
         GlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XsYyOi2OZpNJC/4Ru50m0sZSQZAyiL3Ec/GdFu9piXs=;
        b=cjDeEjI4FuvdsLYk4UlnrdtDqL/qgrI7G4f7RRncSLe/bLwDaMmIs+bzsI7CA+1L11
         j/Tbr03dtstMUAGvDcJJoNssLOLZnvTMPz67uHypHwVoOM0BOkKRx2YOrf6CK3PVZv8Z
         5gdgkdEprWdo9YjbwUyA2CeBBRxZjq9iB+cLtacrtvho8aT8S5PHmVWdZTl3u6o3l/VY
         DE6Nv3FAOnNzMWBqixMd+Wc2P6G0wKOLfPHH9d+RkM955IdD26h2AMYAAI9xEQESF9L1
         RB0p1wD/4JHpqPjghxNHK7Scq8UZiMB8DLtzm50jR8OF0pDEACIBmjbXtGnhRwRUvm37
         psig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MEmtSnpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w197si14017371ybe.186.2021.01.09.04.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 04:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MEmtSnpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyDYM-00068g-U0
	for alex.bennee@linaro.org; Sat, 09 Jan 2021 07:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTi-00015X-6J; Sat, 09 Jan 2021 07:36:22 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTg-0001gV-GG; Sat, 09 Jan 2021 07:36:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j1so7122157pld.3;
 Sat, 09 Jan 2021 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsYyOi2OZpNJC/4Ru50m0sZSQZAyiL3Ec/GdFu9piXs=;
 b=MEmtSnpE7C/H1ANy6VQ2NYk8qxzplQE+2ouV8oKkLGia0lakMUNuy1aUDkyseCH/q/
 Gg37F1EvwNNxnRc6sZ7L30LZFOyfSwjZypgSoEGI/ziN7HgWehz6RRCKA2BcTuegYcJI
 vPg50M50oIxnXtAr9F7GWLS8X1pRVAb2FMHFa0hCkgO/m539h5XLarf6ro5WDK8fmCv3
 9c0Wshe7LymPoDg+9kmP28cyfVesLkzOAYCkSfiIi68xz/+hA9zLJ93sxb5YNjUUXpUw
 mLJ1C/5MZHS5pJ9um3ZcjHuxEBcxe2L96l4VUruGKpUrkcD2ybtcrxm4QG7Sy9h8oVi6
 pzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsYyOi2OZpNJC/4Ru50m0sZSQZAyiL3Ec/GdFu9piXs=;
 b=Lx3AyAbDRDsQJ3PTskUm8oOHMeqtmaiLIfMzWJFrshjQ79b/YPo0Fg+aWWAcIPpGNb
 eoEqv9FOiZivkr0IlPJoKMigPbKzmmbLsMX4c1cslIGVP4z6nznSoAUfrlUPVjiUv5g6
 vlwh7k5AHjNxy7DKhbGB7aytKvL+3nucBFmQGo2vfz6/kW6JkIGrfrLvfxNpx1++Etwy
 dcTZSIREHWyH6cOWbijt7YIiqHrh6yLu3/zpk1DdJQdV/uyNe6iEuH8RbZnXFmbraWyV
 cdYAVAI47/g/wCzqwCRkSmR0sVGposObM2PBSX+cfPIjHkgo3Fx3gOXZ5o0wlQXZZN24
 0x5Q==
X-Gm-Message-State: AOAM532onYI/4s1+TwCZwJMa7kVgGk0lYBmJfblXk3ni4eMd2q1AR3nc
 Z0Hzoz29WcXt+KWpY/u5zUo=
X-Received: by 2002:a17:90b:3596:: with SMTP id
 mm22mr8603229pjb.235.1610195778931; 
 Sat, 09 Jan 2021 04:36:18 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Sat,  9 Jan 2021 20:35:42 +0800
Message-Id: <20210109123545.12001-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9SC/8Q5QLK2Y

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), along with the
disabling of chip selects, to a new function imx_spi_soft_reset()
that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 8d429e703f..880939f595 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,9 +241,20 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
+    s->burst_length = 0;
+}
+
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    int i;
+
+    imx_spi_reset(DEVICE(s));
+
     imx_spi_update_irq(s);
 
-    s->burst_length = 0;
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
@@ -351,12 +362,8 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
-
-            for (int i = 0; i < ECSPI_NUM_CS; i++) {
-                qemu_set_irq(s->cs_lines[i], 1);
-            }
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
 
             return;
         }
-- 
2.25.1

