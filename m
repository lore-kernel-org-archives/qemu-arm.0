Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1126443lfo;
        Fri, 29 Jan 2021 05:29:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXcBw/rkUInbPlyH5ekvwFIS3NhCZocsAc4PzAn7oZtdd/xj9Nq0XU/f61py/RqvqzcPoc
X-Received: by 2002:a25:2708:: with SMTP id n8mr5996510ybn.30.1611926974248;
        Fri, 29 Jan 2021 05:29:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926974; cv=none;
        d=google.com; s=arc-20160816;
        b=x7AwHv2QCiObv42n+L73mzUcC4elF6i4N0+X0U1AwkhpLljPFtB393d+r4X4beFIyN
         wIWMJZEkpC8/5weceogYm3Y4WTufvRdy4m5SJEurccIyyVwy+dTcsbDXAmk58XgFeR42
         6OfE7n2ePd2iB06tReMG1ylRcquBNqzy+AUHVRm9I64jxBaU5dXoYarEcqtsRFJzIAR6
         Wc9xLEFHPzu0J1TTSYCfy+huywhwqwELJ3PFnn1cNpjY2d/XhNxZPqAS19wIEmCh/AjU
         HogEN5FUsuU/LMltLDY6YI31E1BkzGRBkOl7IeLA52M/udUkDvn4RXgCpsYkpdny0fHF
         CYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=arRlN344IEUt++/WHKWnko22ZyvawohyzOe7fEOUZng=;
        b=rBZUS38PlT+Cz9ZB9lqjM7LaXR5Lo/JOAMYcTeQVyHj91d/HdOYtZEqyQAPZhzndow
         nVUu+FFGZnKBC5i09YCEzwlvCMpLV0JJFoKSWBoezvE29XCtZPBA8X7Z0sEN1An4xK68
         mpy2op++zlqX3uxeiR/ajjNndZOSbc2NusjkSv2wghIKlSOXBWWuz99Xa9Gu7zeAs9Y3
         qc44L4PWO/4cU1Kf/2pt5yuc6DURMvZurG0V1koaPaTMDACYRUaEKiO3M99DJBF44mbQ
         p9F/1bkryaj0bENL6CsdmUk9+oXdgYQZMz2R08oLoVT39Sqs2ph7FL6RUW8wDjSH+ISR
         DJsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dXXRH7+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si8342708ybf.476.2021.01.29.05.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:29:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dXXRH7+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Tq9-0008VV-Jp
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlU-0004fw-0o; Fri, 29 Jan 2021 08:24:44 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlS-0008BS-Ar; Fri, 29 Jan 2021 08:24:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id m6so6233925pfk.1;
 Fri, 29 Jan 2021 05:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arRlN344IEUt++/WHKWnko22ZyvawohyzOe7fEOUZng=;
 b=dXXRH7+HALphmZwtowWgWVoD9g01u3ZkMMwybZiPR0dEB5gWsNBn7AbfpA4j4rrKhn
 JiCYNFZOVRZpiw+gOdUH+woomiEB/lrac5V3bPm1dQCQFtXuAAVnvgaesGJAKUsbh4V3
 ukI/2cRrBXJZmbRMJkRtK7jIOdhmPCm0VYKlCWy1NzLZFj09pN6o3nGvqiJ3QEgYU+nZ
 6ao3CRdiiCl5VmGFVbvGzBBBiLNu7727JYDc1uJP6Bi+XQIXzAwTWzHdvRpQccZMzeTC
 +YhJlbiVVKrX06Br7cMtGQMimjzY+ld+jt6Q/pOHw7KXkduLniVlvzGsZCMP27kC14Ur
 LDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=arRlN344IEUt++/WHKWnko22ZyvawohyzOe7fEOUZng=;
 b=a1XcS6MyJiZSyIwQnWNB7lLqlYYtTA6MicFY3ecQDZHJbdrG2+yG+miBYDdw1Or7sH
 SQlsJhtyOQ11U0/oXE5KkODHnJTkc3c7qTsxZvH3u/BXjXTf5r8/1mEaaGZ9YA4+qEqq
 ygIgqtr1j3ijFvfOt2DdLkZZGO/yxHfLo9qdv7FYJjHMqYc7pgGAW7qk01Cl/LsHal3t
 jlFp3B/mK67YvHeauqeW0oeaxLEUlbSpBYhpjIj2zkU3bgrcRalqmfMTN4fqNBe8ETXO
 t5cbjG3OBgOU4Jb3HjQ5D0MqT/SlXTzb40/DSWOtNx0psESh/BaQaelbRQycmtL9Ijf8
 FZCQ==
X-Gm-Message-State: AOAM533jHyog9E59QokXA/ZOzj/Y5PkYj9y1i4Oj70nzwoTM67QTInb5
 PhbIwdy2tbBPROGlDi9lzwqJ7yHEnRTJ3Q==
X-Received: by 2002:a63:c441:: with SMTP id m1mr4659328pgg.353.1611926680772; 
 Fri, 29 Jan 2021 05:24:40 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 07/10] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
Date: Fri, 29 Jan 2021 21:23:20 +0800
Message-Id: <20210129132323.30946-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLbAJxQ9wy2M

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_soft_reset() is called to reset the controller, but chip
select lines should have been disabled, otherwise the state machine
of any devices (e.g.: SPI flashes) connected to the SPI master is
stuck to its last state and responds incorrectly to any follow-up
commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

(no changes since v3)

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4cfbb73e35..2fb65498c3 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -254,9 +254,15 @@ static void imx_spi_common_reset(IMXSPIState *s)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_common_reset(s);
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static void imx_spi_reset(DeviceState *dev)
-- 
2.25.1

