Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3335457lfq;
        Tue, 19 Jan 2021 05:45:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkmK3evw631QGI+dT5Cn9j69u8Dlh7bnZ50kGjcHE+CGstPijPIU2EtjdJX+9Oz8NPeauf
X-Received: by 2002:a25:abe3:: with SMTP id v90mr6494947ybi.438.1611063915414;
        Tue, 19 Jan 2021 05:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611063915; cv=none;
        d=google.com; s=arc-20160816;
        b=rgGvbY8VAapXtNJyh1FqEYB/BkkIJwvw9eSNQyEaBQVr60566qWprWcImYO6uaOpyi
         8eHpQlahaA25kdQLC5qmg/Az0l/rOzbDg2hGpKupKfIMDEBRmkeAnd7Effen9Uc/umLj
         OSXbm5jjvbEnqkJNoxgeHpQ57T5X5G5dlZLVJp5Zs9ON41EVa5BCRaeL3S+Sth+WZ46j
         NiIuTUfjhwlGipofjnzgCZD23HPU8JPdeTe8qPpKo6fNB7HYSc6ZFlUNQ9/fQf6XM2Wd
         BUgMQVvTQQ2Hf/l8DnMhzGryq+MzGSmEBOeZEGvJ+B4VyF0bQS/lDThcJ3tYI+HkT7kS
         8fGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZGjLBdXEirecxcEY2UAZYu8cwlhOHSgOGxMxIwxYN+o=;
        b=PQBjIN4Ow9KrS2JC7w++VjvSb3I+jctL5Ij9WRV/tTjnqYMKHrC4zQdqiAr+bUnQmt
         sgVvY0Aww6WBx/7SISFYPssHX3m7SsVABI6s99SClI4E2mLTuoqrY4EXk7pMWItoahTT
         vVkWzqfdKAo66INYyETFjYlbqXhoiOYz/nAOin8Zv8xNdXT9h8TYR7EcwXs7LQXC/D/v
         wArXn12CFa17hp6LVwIjiAyRTubY+DkN76BoJaXIA3fiMhDQEXPtCHUxojcZg9yfENuq
         wan+V2alHZ/ZtUfq5Q1aGwB6Y/eQUpo5rOnOBOZwAVWtvn+sDt4055q8jtZqakrqtVS1
         kLQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I+nBbn2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si21593315ybp.477.2021.01.19.05.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:45:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I+nBbn2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rJq-0007aW-Pc
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFN-0002sm-GG; Tue, 19 Jan 2021 08:40:37 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFJ-0003UA-Su; Tue, 19 Jan 2021 08:40:37 -0500
Received: by mail-io1-xd2c.google.com with SMTP id u17so39614773iow.1;
 Tue, 19 Jan 2021 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGjLBdXEirecxcEY2UAZYu8cwlhOHSgOGxMxIwxYN+o=;
 b=I+nBbn2pBdNV20+c7iLT5QKyk9DcstTflI66BrJW0TQzTPjFNOgz3T2xj/SxRjgtiS
 ERGtvNBXByMSK9hm4QvnerPTJhHabFLb9c0Y02iMJn2UUbJug1n3XbBkfHg6uvtrIo56
 GyISSr6WuHzuLmHPnN7RhePEhP2gAx5iBfydKslI/5uWFyPC2xSz29TaJghNJk/vDKxH
 MUTKTkKKZAmR0JOMeiGPwAsjHbf7i+VPoXpVWW/dgg3KqpotlCP8u/01g0SyfOB113la
 bihCwfZDrAU2uTgNFDDKQmRUc4rRYwd7pCiJVj/05QC9cHOxddG/NaSXm+7NaPIX7sZ7
 g9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGjLBdXEirecxcEY2UAZYu8cwlhOHSgOGxMxIwxYN+o=;
 b=WOu3dHyGMk4EfVw9Bn9TRYa8PDwc5kkOrORF37u/J1I0y5Tx96QqsKTmZdu56XV8/n
 O2xaK6Prqnsjsq6O4lqjRfDakdVJdAdTtHUb80xmdXJq6MXFpgrM2piIg+JGZo6JyEWB
 4XLdTQs87Y1iD9Xe17OwPxbA8SmHbOu8rTFmDUGfeV8ngV5H4FR5V1J6YcmyMjiikmhm
 UbCADj3uixaOZLLzR6ULDMbNO9m+rKW8CxcCV/FTkmTzY7DQGSo/LGzTE36zSenLwJyr
 TFndJzejo2f+J8utz2waGEivAdqtax9Ki9YoiGPEb7TUNR78KgSDp3iCmvrK/lUdNNsS
 05bA==
X-Gm-Message-State: AOAM530V394VC2S3j63gfGOSrm5lJ26E1sMvW74NznG0g9Xfsmjoxrrg
 FALAYE0iu6Wo1ID4GIiIDUY=
X-Received: by 2002:a02:b78e:: with SMTP id f14mr3376535jam.97.1611063629205; 
 Tue, 19 Jan 2021 05:40:29 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 05/10] hw/ssi: imx_spi: Rework imx_spi_read() to handle
 block disabled
Date: Tue, 19 Jan 2021 21:39:01 +0800
Message-Id: <1611063546-20278-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z/Lh+gqsTuGo

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, it stay it is 'internal reset logic'
(internal clocks are gated off). Reading any register returns
its reset value. Only update this value if the device is enabled.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-5-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_read() to handle block disabled

 hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index c952a3d..277b936 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -274,42 +274,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
-    switch (index) {
-    case ECSPI_RXDATA:
-        if (!imx_spi_is_enabled(s)) {
-            value = 0;
-        } else if (fifo32_is_empty(&s->rx_fifo)) {
-            /* value is undefined */
-            value = 0xdeadbeef;
-        } else {
-            /* read from the RX FIFO */
-            value = fifo32_pop(&s->rx_fifo);
-        }
-
-        break;
-    case ECSPI_TXDATA:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from TX FIFO\n",
-                      TYPE_IMX_SPI, __func__);
-
-        /* Reading from TXDATA gives 0 */
-
-        break;
-    case ECSPI_MSGDATA:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to read from MSG FIFO\n",
-                      TYPE_IMX_SPI, __func__);
+    value = s->regs[index];
+
+    if (imx_spi_is_enabled(s)) {
+        switch (index) {
+        case ECSPI_RXDATA:
+            if (fifo32_is_empty(&s->rx_fifo)) {
+                /* value is undefined */
+                value = 0xdeadbeef;
+            } else {
+                /* read from the RX FIFO */
+                value = fifo32_pop(&s->rx_fifo);
+            }
+            break;
+        case ECSPI_TXDATA:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: Trying to read from TX FIFO\n",
+                          TYPE_IMX_SPI, __func__);
 
-        /* Reading from MSGDATA gives 0 */
+            /* Reading from TXDATA gives 0 */
+            break;
+        case ECSPI_MSGDATA:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "[%s]%s: Trying to read from MSG FIFO\n",
+                          TYPE_IMX_SPI, __func__);
+            /* Reading from MSGDATA gives 0 */
+            break;
+        default:
+            break;
+        }
 
-        break;
-    default:
-        value = s->regs[index];
-        break;
+        imx_spi_update_irq(s);
     }
-
     DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx_spi_reg_name(index), value);
 
-    imx_spi_update_irq(s);
-
     return (uint64_t)value;
 }
 
-- 
2.7.4

