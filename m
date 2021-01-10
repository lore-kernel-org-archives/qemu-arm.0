Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1824903lfq;
        Sun, 10 Jan 2021 00:15:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLSP84AfIAPPWZy8pTYMickRlCJWFtyRqosHf4nfTqDsldYj/GM76IZje6kljtBQFauEYc
X-Received: by 2002:a25:190b:: with SMTP id 11mr16242348ybz.236.1610266539252;
        Sun, 10 Jan 2021 00:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610266539; cv=none;
        d=google.com; s=arc-20160816;
        b=zCtr3vhWBzAj2y2F4dQ2rxOpY/Ho1VL10Yd0lEBKZVGlWCVudX2M4uoHQaFXWYPmt1
         /X8LnYeS4xNlv5IpMu3a3hAD3ozww04Rm8CUpBqmzsEPkeSFFTkYyLlO/1jX0MhkKAqg
         E51hC4QDTEEOdwanw/uWtjSUcyWu+ti/WCqUzHH6hIbEo9VP5/BEjOs1S7AzYyxN/Lp9
         zKx9ja3DlxeBNqXqLMrDEBrBCchrB6b2uHA1p5hpa083jOMz0wj8S5Ur8zHSbwYZ9jTg
         tmSjF5yd9jbuvK0igN2VtkJzVDWJD3c/yXcefJFuSBQfJ17/dvaYOQyWNmYuknv8CIRM
         wwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kp/asB4SUZhcGXZTIA1Vo7cfXDfSmw5jhTVajVVX1DA=;
        b=p1ZsdjMBQKfxGswCE7o1HEN/1lXrzmm8k48UYICYITdBnWIA92cGOcUEA1+TlzHAvL
         VWLDJtBocgzAcXux9Btn5H4iU+aICm02Kh7E8+AAih5GRDs5VdLErR+wUQz7f96yaeza
         CyngVhj1vzqJ/tUa7SuRkypinFG3+HecOi61CKxVLPP2XvLN9jWAt1XGiXC4H5vDqXDK
         MZ9oDBmxoAIOzfE08PWSSC2Yi8St6eK6NKnquswm8uuCOLDzjwc3JGEwxv2oBSVytfLS
         CJf7MWyEjhs6JZKkKTzcRx+IZxS4e2KUA5tx2c7fyDxMYLjF44hVYR7VpKfX7kSdDojO
         oniA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvmYw0RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si15418094ybm.446.2021.01.10.00.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 00:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvmYw0RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyVsw-0002vx-8m
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 03:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsg-0002u4-Mi; Sun, 10 Jan 2021 03:15:22 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsf-00061p-3W; Sun, 10 Jan 2021 03:15:22 -0500
Received: by mail-pl1-x62f.google.com with SMTP id t6so7910753plq.1;
 Sun, 10 Jan 2021 00:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kp/asB4SUZhcGXZTIA1Vo7cfXDfSmw5jhTVajVVX1DA=;
 b=jvmYw0REdF/GMDleM2qGccaFP/ZnBm298S7sgpWreYpYFzhs/yDOakjPbNkB7jh08Y
 xr+cYcdPAOO4DX8LMw4HhsxiM1j8kWUwb7W39rofOYr4hDNYw2yxM9fs3IFpw675Hkye
 f3HXpEugxF/1xGR7PHYY7zkGQzIuIGlp4SK04U8VY3/ZAaxMjmfG0kabqkpD2ztcXOuz
 0BZ9OAyyLtrL63icGtFknQ5QYLZPp119gB8IdqhskZMN5IZKYQ0dqjvbhjYNnUkE7PJ5
 0hQ+TIK1KDEHasImC4ebVFXPLzlNhAY5sYSvMPABTfdwPBN49/VWYzmmrbptIInt9DsH
 ExvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kp/asB4SUZhcGXZTIA1Vo7cfXDfSmw5jhTVajVVX1DA=;
 b=iQaruKslhVfD2Nx/u/5VPUctfGsd63+okFUKZqdob1EEJL1wM9BOWPdNGebbKKErze
 75STUN+rkWsTKmWzvDG34yAgaAJAhTK0dsLtLBJDLIA6QTCepRCNFANaJMrFZ/Or/n9n
 m+UwonxywOEXJIHIp69N5Ub2FiJFrFKmm/ipMymnzQpb2Rx+3DnQShhpzBdnHhAKTGT6
 AGCsD3n/8KEd35PyEZlKX1pnv26UyFgp8aGQfQ+Woy3GG4g3jawM/ggprEzT2AWjDi34
 HQnH3IeHawPPA40Whg3EIETG7c5i25iL9afnpRaGcncatTz8jtlI4kTxtpg9WQFc0rMZ
 s9rA==
X-Gm-Message-State: AOAM533LTVGlyIBBG6lCrl6h2MXwlkKrAutOAq1E3R+LTBMdIQNZp9jE
 Oav4lc/MI9ZIohrHYH7XNQs=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id
 cm12mr12144373pjb.87.1610266519516; 
 Sun, 10 Jan 2021 00:15:19 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Sun, 10 Jan 2021 16:14:25 +0800
Message-Id: <20210110081429.10126-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
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
X-TUID: CpYIaeXnQCjr

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
imx_spi_hard_reset() that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..2c4c5ec1b8 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
-    imx_spi_update_irq(s);
-
     s->burst_length = 0;
 }
 
+static void imx_spi_hard_reset(IMXSPIState *s)
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
+            /* device is disabled, so this is a hard reset */
+            imx_spi_hard_reset(s);
+
             return;
         }
 
-- 
2.25.1

