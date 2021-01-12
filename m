Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3619882lfq;
        Tue, 12 Jan 2021 06:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzssw6j8/LKUH0a/FfQ78HIrFwAFukueI41I4vqoYN79qgX+6mE9XOALSrHqYgf7tu2H6OV
X-Received: by 2002:a25:d9c3:: with SMTP id q186mr7378302ybg.262.1610463554540;
        Tue, 12 Jan 2021 06:59:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610463554; cv=none;
        d=google.com; s=arc-20160816;
        b=Gl0tW2DOj4zIbVH2ySQT75G58+9OkIc1Ey62sAfKZaGI/phdCpagzY0+D63yRVP6gB
         970i/8W6W7i8MN79UHXDp2DxGHF8SKvEdXutLdW847kkONoFBWJNVXLUV8ohy4sNgAOK
         8jqr/sz+VWmRskrTl1A5Xv4Mdsqai1SF9wQQJmNLcxsz/xiNV7BdLGTku0O7yNiF/GFi
         wRcVmDc07LN14hbnnqghHUZs9P3OH1R4OSmdY7q0mSxjWrkO3KUrIST3zI8XnzfRTpkT
         kM25bBiPd7XrdS4E5t99Rp/9e/Rp4yArPrZ7347aeVuVzEyeFWsDWQ2dGP4Xmig0qFuO
         oLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OreTe0I+MY0/iL4Hv+5CUEoSzihVcjTr7+kKPCAh6xY=;
        b=ra/q5KidQHQqogURuPo0XDIUrnu3+Iba0IywRBWp7Patu+4rHxJHlwJ6ycornYkEun
         qSfeEn31rOxMnt3ZqsPAB7CVc1cwWjDZfqThvmSKLuLufyPEtLubKhS//Sq3ti2rNRK4
         l2zfpB87gFNOzFsx4cb+GL5wXFdKqI0w/UF7g8cv3/z7maTM65J9akgUEGDVk3h5wRfy
         xz7XEZHpnEX8WfTkOrmieDSjMeDk/ASl1QUxAofcoMo50dh69NxUFh3sUZVNCaLCOwNS
         RsNjLTiscGFAIorVTOSZkGT6ZTvJI907LbK7iwPtuWThaoFFDAlYOvgRzU2JlGaNE3HP
         jXZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M7PHrdJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g91si2985618ybi.385.2021.01.12.06.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:59:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M7PHrdJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzL8b-0002uQ-Qy
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5J-0007va-Ch; Tue, 12 Jan 2021 09:55:49 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5H-0004lk-Nh; Tue, 12 Jan 2021 09:55:49 -0500
Received: by mail-pl1-x62e.google.com with SMTP id v3so1502678plz.13;
 Tue, 12 Jan 2021 06:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OreTe0I+MY0/iL4Hv+5CUEoSzihVcjTr7+kKPCAh6xY=;
 b=M7PHrdJLxAwSCjCSdNgybgvJ7+OQkrW0HECrC0XDj0OCoR8Mjgc6sojeC2X+5jk9og
 ekFLG5X704D2fSEeUrurqmq/e7gf7bTDa8L4JLZaIV5Knbc7670yGjbOBLKkHjLLABwN
 PzwrGfWEdW25a+2sbZeURvkFF3/YwKJsJu+CR1OMIV6IUSdk1o98nKzJ1EKEDPpRtWLE
 ISJdSgkFwapQjQMRwg4HmfoVBo5+rh4PyVAvY3NPq5vqmsJJuLLZauu+xTvJMX1JHJLc
 zyYwJdYCBwk1pL4658vXCaWVOcGuk5hgkxgSj6O/n8SjCqeBVUuqXUTy6z64bXq4lyvG
 9mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OreTe0I+MY0/iL4Hv+5CUEoSzihVcjTr7+kKPCAh6xY=;
 b=rbvyWAxhsUEsWmANfKwA43AYdoTxLU/LcqyBHYZ/ImIb/ljtgtuaVw1nCVQRL7rGhb
 K8Xbi2I1Jhy1MqnBPTqey2pV3bO/h/TXDdXWT4TBrAAmtHlE7oKFbNokoeTuUysPS/fZ
 +UIM0ob9ozlBVQwbFLpU9c5is937lLrZInUi6ijZf9x0M8g3rniXEL5q3404jmoJ9kjx
 WB5kYXknIfHpAOYtYbtqPYb1sFrvYhK+Sn5uUtMtiPTZecTU0u9vaUORQZzYWd6BcR8R
 RkNFCJZTqWf/+jrC0bcP/Rr3zwdQT90fD57avE61sPdhQlnRI4jIQu+KhrBQjWqytJeZ
 Bt0w==
X-Gm-Message-State: AOAM5333UwZF8iqfihl35xFJj8SS1zQBLSjP6KvL1nu0l0UdotGIukyB
 zcjtbXKD+6e6RbXzUs9sK3U=
X-Received: by 2002:a17:90b:1987:: with SMTP id
 mv7mr5109881pjb.66.1610463346029; 
 Tue, 12 Jan 2021 06:55:46 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Tue, 12 Jan 2021 22:55:22 +0800
Message-Id: <20210112145526.31095-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
X-TUID: GeFHyuyRYcFJ

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
imx_spi_soft_reset() that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v5:
- rename imx_spi_hard_reset() to imx_spi_soft_reset()

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..4d488b159a 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
-    imx_spi_update_irq(s);
-
     s->burst_length = 0;
 }
 
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    imx_spi_reset(DEVICE(s));
+
+    imx_spi_update_irq(s);
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
@@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
+
             return;
         }
 
-- 
2.25.1

