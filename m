Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3786941lfq;
        Tue, 12 Jan 2021 10:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRhYaTh4aJ1a8YCby40xKb2oU3uyaWQq9x1vefpDRLPL1CrpK7GAukMHJreQKzMQ1iSTSy
X-Received: by 2002:a25:d994:: with SMTP id q142mr1168107ybg.372.1610476601146;
        Tue, 12 Jan 2021 10:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610476601; cv=none;
        d=google.com; s=arc-20160816;
        b=hAvVt2/UGkBlDF6XUZ2o82v68HHXduwy00JfnzF8/+altXpKYWo7JPeVUqucJfFJ/e
         C64V1ds61WL+IVy82Kl6fKp4TlPk5hVMhMcSYd4FprCHb501MV1lj7P90MUHKThrRGnt
         gjhtKv4EAI5dWhgLL2ROs3cpsvuDixyNJBIx2xQsaPOdD3E0LKOqdyL8bqHpFEZBc+GX
         D/yBDBDaD2guHypXtmaL7GJBR/frdeHLAyMojuKoo2RfuG/82dVWRnmMx8L2+n/l0g1+
         19iBZ+zJJ3cawrBuYIj6bFzylFz8G9Z3D167m7RLa3k/LpU9sCw8Hs5wcH4J5NMV5PdU
         H+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZanZiJ3tTZSMBujs+F1bLNbZeY/v2F63RmtFKqnRXj4=;
        b=p7OLlOI2+S0RMoKRs6tWfobnVJ/VZNEdG4JkDq94FOKNOGgFpHCt4XLQJIlOJTFR72
         bezld2Nq9ZI+cjbWfhND92BMaIow6iW/dStC3u3gMJj78NssVY/IvOurGdcuT4NyI0Fj
         MjIm5FA7OTGlI1vt31s0QGDi7/ycPurqlheEVxjgjxLRDymwAhJ3gNIfTQYqUE6DIgnu
         EBg6+JFUxERuwA0a/Uzpa8w9Lt1z/iCArLfR1LB5OKBxoNq1SAP7t7RXsV8FPhgDR0Dc
         4yglva7HJ/C+GtmolauJ9dDnBfm2+46WLsIyXlR0edHFAXl4RzCuRym+W3kw3NqqUeKw
         BfBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUoqNviw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e131si3051488ybh.114.2021.01.12.10.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUoqNviw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzOX2-0001f1-F0
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWH-0000y5-78; Tue, 12 Jan 2021 13:35:53 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWE-0007F9-Ew; Tue, 12 Jan 2021 13:35:52 -0500
Received: by mail-ej1-x633.google.com with SMTP id w1so4885077ejf.11;
 Tue, 12 Jan 2021 10:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZanZiJ3tTZSMBujs+F1bLNbZeY/v2F63RmtFKqnRXj4=;
 b=dUoqNviw/pjbxVL7TjynR6A/+y579dM8g8u+tMtPz5fQKSBztKWEBI65tCRom+hNZg
 oijQ3NMQuMtbqnWixlyHuKiXVl7ctkHdWR3mkl4limigjVmNPQ1dP+o+vCm4AINfqTFM
 OwoYnNBXYUKlO+HrMvdwAjHpZz1Elkn8zMkJ6WAWlEGb7xdQFaNSgC7Yj8fbGVxxnnl1
 TEc9ZK4FVs8xRxYBHwAfRR1q3CFBWXKrDDJzdfKJ/2lQjsewJ9pha7GJi43E94CnBcyx
 ZChaVjTEoUy0Ujb/AcUHZlQS/vcw78KtaeViYaaO4Nyi1xYxK+L4wjGlks+Gns47KNo+
 nbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZanZiJ3tTZSMBujs+F1bLNbZeY/v2F63RmtFKqnRXj4=;
 b=bme45xCW6FJFlbaYULaw22IOeNMRAkfNXMdYJs30kpnp/KykUCt/5laXMypZTUdKk+
 o3VrPTHAo2ZJMxQbVllkO6yUYRVhIWoEzbeqemMK/zbjJXm7rP7RtuGnDIcgF7Y16T0t
 4/SzBxgih68HR46yTJ8HPqwop5abH7Ua7fnMbaNN0Te3ncoBhCk17SackLZr6SRuaVwe
 SIn0PxnJ+zqyMryYcOYPuMsfraKYfvfOJAcb3oM4Hd2wepxvSA0IrMnkSgcV11C/T6Xy
 voHOrBPPgi8WY1yBxvqWIJWPdj6CEuj9EUHbzsY3B4NVZ/RilPQeGOeGA0jb6vqI4W4a
 KQig==
X-Gm-Message-State: AOAM533uGt67gffzF9DBrLuOy9YJVWTvbvAnq6PVZszM09O0oHrerWT7
 54hXzQw6fBwtRWWmZfyh0B4=
X-Received: by 2002:a17:906:653:: with SMTP id t19mr138235ejb.44.1610476548916; 
 Tue, 12 Jan 2021 10:35:48 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id qn4sm1510593ejb.50.2021.01.12.10.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:35:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 02/11] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Tue, 12 Jan 2021 19:35:20 +0100
Message-Id: <20210112183529.2011863-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
X-TUID: Mhhoie4E2r1h

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a213..40f72c36b61 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -428,8 +428,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.26.2

