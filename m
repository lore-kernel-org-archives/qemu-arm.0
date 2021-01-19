Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3335424lfq;
        Tue, 19 Jan 2021 05:45:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlQ15SaTaqHwW1ljzdJb3+IrKaRXgPfPKxOgfupQTDPOBk4g5lr88w7oPSNTbry3DMQ1Kf
X-Received: by 2002:a5b:28f:: with SMTP id x15mr6085782ybl.303.1611063912776;
        Tue, 19 Jan 2021 05:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611063912; cv=none;
        d=google.com; s=arc-20160816;
        b=LEW989FE4BwdfNEhhkbXrCnWzrVpn5fKwTJmMx4OueyDVTkXSWH3VuCTBuzrLJb4UF
         KCT1BZbIIrZo00jA2pE4oEF1Ra4S2I8bmy3Znc5bZc2buJXgJaiN+x2fdN13EjMlUX+y
         1EHk3VYFbDAxe98claC4tCuwvERQNyqyX8XVdsekTnXfQjGgFQ9rQDTVAll6xwS7hqAR
         qQte97X3s/ZbUMm6WuPDiSMSzXj7JYXSwSYUMlBoSA8UeLQwHkM6KMdFCQq0jHJLacnH
         6ftjmmneCpI64Snik6rwqCztUF6zzeg/pcjqW/3w2nu7or3+gia1pSW2ztbk+gNgyLT/
         u4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8RGy8xtddkf/Hto4xoWIa8XeOj/4qpPYA/syTc95gqg=;
        b=yGSX6yZHB4IjLxM0HROc7rJX23LefB76zzxocPKK0VAXJ3fr9QpsZTwPUtfZdQdLZ2
         WBpKDeBzJMW8VNEqMzzvY8m6/0A6w5YwY622ykYYXuOyrD2EzPxmLfyshqY5Hy3Eg0co
         MUxua5stcP7fXb4YnDNVyEGCrxl3Yemylq0Kb3RAy9iorF0SlAaqASF/XZ0lulfB5M52
         t3wAesQbzuqQnndHxvOqTN4t9nd0YVNCXL0P1AVebb0KJ++4ZHxDz3BBfbjzjR9Xw6op
         9aSPTyxQWRILU25xBiez1H0kfmp6AQJsNWjkzncTGlYSYNX0VcBM5njPnPOgfc1rHVTi
         znAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K2GDJ+5t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u40si13308320ybd.35.2021.01.19.05.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K2GDJ+5t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rJo-0006gh-4h
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFO-0002xo-Sk; Tue, 19 Jan 2021 08:40:38 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFN-0003VG-7S; Tue, 19 Jan 2021 08:40:38 -0500
Received: by mail-io1-xd2f.google.com with SMTP id d13so36317291ioy.4;
 Tue, 19 Jan 2021 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RGy8xtddkf/Hto4xoWIa8XeOj/4qpPYA/syTc95gqg=;
 b=K2GDJ+5tCgk1p4oz1whw/ZDacMlkuUBqH8Z6zP6UmQhk0QRpiOb21oFGchagmNZYwv
 9l5YE/Qp9GuBATYWzCnuW9JaUvXo49DE+EDR6exklbxiwSddP67HNTsUExTOxtwkhwSb
 juX25InKpQxPqdSF5jalMcnzBFy08RbfOAib+XIUMIk5rsnMprp/9JylUCkPsQGHtzZS
 QRtRQypdwAE6ktTZ6LRxxEC19KoDj2FR6DLMWzcwDwySP6ZES/Mr3gb84CBeJEaPfXan
 5yJdTG28WM9mTxCDq4TjrfMDjxJWXoQgomDodvk8Kucsh0KpHNGjOYuf2nUBS6lTVe/T
 GP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RGy8xtddkf/Hto4xoWIa8XeOj/4qpPYA/syTc95gqg=;
 b=KCYX/0uSfwGtxn4K/pKfE4Ez28Dp9ekCY7qUXf4KvtYEsZH2pBesdHvUT2ZU9y7F5l
 S6mKGfvu+/eoAS2hdqEsHa0+Q8xfEw005vVbk2PkuQrPu0PcEnMFFLVF9qzvZ6Z9Jjo4
 gjvteGQi0nMTjrekdVdBBvtwK3mgPprOFYbyOOZ8SYBc/NU7GNM0oRSrNh37MAQVek+C
 3WEzoqcB8yvBk24p0X1bf5wuylj0iS68eEQlKWupS7ExKWarEWygCWmAFNQ11ZlzYTEk
 CdeXIadOCIKll8Bo0Harc3L28exME2nu8CWFLbNMpB+P5ad0PGiGHNe698ZAlwDuw9TL
 GPDA==
X-Gm-Message-State: AOAM532NXrOCQC+xfWQaNWKON05OpvS7ZdsldHHCiiGHTGjQjmCTKPma
 GftAlyhV/6Rw8OcPbgM08NA=
X-Received: by 2002:a05:6638:214a:: with SMTP id
 z10mr3500247jaj.41.1611063635884; 
 Tue, 19 Jan 2021 05:40:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 07/10] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
Date: Tue, 19 Jan 2021 21:39:03 +0800
Message-Id: <1611063546-20278-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3kcX4zfNJs2c

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

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
index 23f9f9d..5838bb0 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -257,9 +257,15 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_reset(DEVICE(s));
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.7.4

