Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3788096lfq;
        Tue, 12 Jan 2021 10:37:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDk1NvGS7AfgCKN+anCzMBdT13ELr2LGgBevuC5xcHmkeKwVR8gzb2L0HoSz+IOsemfjgQ
X-Received: by 2002:a25:e646:: with SMTP id d67mr1023291ybh.405.1610476677251;
        Tue, 12 Jan 2021 10:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610476677; cv=none;
        d=google.com; s=arc-20160816;
        b=tXbaAfzuBOXjc3zghfbAbOBJhTI60SWMnRCwUaz4OSbFA2clpFMpRejEO8b1cjliew
         xOFwBZzteIpQcjlf/2J3DcjN3Ekf7sxMixp0m6asQnQ12QhokOt/6saIc7jd3WhP8PW3
         h8UB3G7VIVW8r+OIi6aXkjdABEy8uhNNIdhTi87pXPjb7w8fM8R6Ylz1REh7Hf7ktOkn
         f4jMgg9aPj1Bz+dycc5g/3i2xrEc20vUNlAGFvG6OyC0I0hoG2XbDwrAPk6/ca5WipNn
         D9ffJnj5UAFxagZoHJ/Db4RMUyvacynz+QidOhAlP888/BQ01E51kKCxZPFCYhF/gxCm
         1ghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=URPw2976JZr7XRKyhMiAKOdcNTBQU8VnrnQ2GFeuE/U=;
        b=V6J5CbobUlmT8TYyPpEbskuZxBMH5AX8LyzwxKAA8FArolhu/G7EQXwFeDyCbqWuJf
         KTpbnhJVa6KIks88nBEu9TlKry7M9rrOBzBa5KAeUQTY/u6vyNnvWEcrZ72I7lOO4koe
         iab5d085ebdIdngF9dsKPQCrtNidyRdSt23HnWNCEv8QyeH0O11xEW5i2fru+dkrXPG6
         E4rb0TQLgap9DlqpAmHzpwrxZXK3lZUp1ik1Z4TzoGWz2ETCwn+e86Gkh427pzyoC/Tm
         njkb/vUjO9uDgwNvxqHGtDHqv0XPKgEoV9EAg5FsWrL7HzgovQ5ok9gvgMAMU/S2vJJq
         inSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l20l7gwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m186si2136890yba.412.2021.01.12.10.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l20l7gwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzOYG-00045G-KV
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWz-0001ws-J6; Tue, 12 Jan 2021 13:36:37 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWy-0007Xb-4C; Tue, 12 Jan 2021 13:36:37 -0500
Received: by mail-ej1-x629.google.com with SMTP id 6so4938540ejz.5;
 Tue, 12 Jan 2021 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URPw2976JZr7XRKyhMiAKOdcNTBQU8VnrnQ2GFeuE/U=;
 b=l20l7gwWIKPn32PIaaF39Dntbr9gVgUYcerX5b/rTYZA7TyEvIP8nd7HeayFeQK3ut
 uSpCBts9Krux9jifdRQf1QkakzQnlPS+kaCnIXyJD1M8islpFIJquKX+FaJzEbU13TrO
 WXb6rNpWZikweRuVb0O9R7GP2Sh5XUn98RmcBMHk8tpygi5E63ytZelumOVZsrCLx4F7
 qR471FnxLEEhKy1b8mFjbll+c7yfIay1OmnLuxN8mQ9g5bJbOY7Yee06O1/3qonWxTIU
 YF053G4+farbNVdkrGKWKpatA1keGPDKMgZAC6GfkocEVaXfIKjdAAhgOtC6K4G2Tww1
 2rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=URPw2976JZr7XRKyhMiAKOdcNTBQU8VnrnQ2GFeuE/U=;
 b=iCEO1Rj+K3xI5lCDj0NkyP0Mi6Y4uCHG82E+TuZsj+AzPg1xNuuspoymzmJ8qaCVIC
 QX4LO0RfZO/gkzlXHyNYev8u/ZrhCWgtt4zqph2KOg4oQGjTkmgOGGCHoc1GCFrua8Ux
 oGDRQH0Zz6waF9bS2n+DAhhBxqcirnq0L5WtZzXxGjttCVYtcGheRZyqyojrioWmAkTt
 KIgNK3bslykUwx/37JNcG7+MROgKp3BC6rTBL6S/Rm24n1wotola7Kv+pdSiWcRstBt8
 k9rN/BYv5PbCnUTp/8KIFH3VfiUcgHvyEayI3tacMnmAbB7w6CCiTtajNEOtwTeTZzW9
 pehw==
X-Gm-Message-State: AOAM5325PQEbyc0oN7P1fUtpiXEJrkqMhJj8RXaU+16FNoYfGHQ/cDTr
 FYh49Di+u+mlmXiLnZnnnqSvZLjoss8=
X-Received: by 2002:a17:906:d8a1:: with SMTP id
 qc1mr125349ejb.294.1610476594097; 
 Tue, 12 Jan 2021 10:36:34 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id k2sm1516490ejp.6.2021.01.12.10.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 09/11] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Tue, 12 Jan 2021 19:35:27 +0100
Message-Id: <20210112183529.2011863-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IYdyGx6pz44N

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210112145526.31095-5-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2f9e800dd3a..638959daa08 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -129,7 +129,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+        burst = ROUND_UP(burst, 8);
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.26.2

