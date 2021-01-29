Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1122735lfo;
        Fri, 29 Jan 2021 05:24:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnwlqGQZr3vuPpzgwYbYwZFfw47NCHtkUNXczlvtfow8Qn5zt2KNDOxiAV6Q7QEUh0ABQA
X-Received: by 2002:a25:6191:: with SMTP id v139mr5949019ybb.396.1611926678264;
        Fri, 29 Jan 2021 05:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926678; cv=none;
        d=google.com; s=arc-20160816;
        b=t1kxw0q2oA1ahRRo2WzIyf+bYFSAZJBkVYlWCw+KhECTSr/pPHdvO7DMRkfL0Hz+6O
         DFSm7A0xyNHVuXJNzKXXvF1G27xmZjBhC5ZIRbP8GEcCWOIuy+XhcVJpELWbSNGkuwPG
         mZveJYtRq8fk0xZcIGuaLq5RolSCXcF0gyevVEf2nfwZ4oAp5XvBeb9G71b55cbVj22E
         HiUpHQFMJQc/1zofR5RgwO4RY3H2rkuRx1AD+9gYzVXGmm9BxtrkRiMLtCU9ozVcAJ7V
         V1ioxUb8EWf10YYnWUucvk8PyzQq5cxbmXwZ68dx1E4dUgB3fZDy22hiJyCmZWbFvgnj
         QzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3jrYO5yz/J2x1yetvpXGtvLlgKXHVau4sRG7K210isU=;
        b=AnMa+4jpu0d9SqTEjQNjuMtaBK8jjcSTvjIXeO5pAKWaGoF45EiKL2Cl4IMnubDqN6
         H+LiWsLp7RcCh1OdT1WkxDvQ2poqkKf7lW9Q8RddSjOZwETH/jyEwrBDJ2DYlizcb8Rv
         +Iq5m4Dn4U3uxMpbAlTaXFwUSZ2Qf/7VTEK0jflT/JLXGMWWl7186JADSbespb5c+Wkk
         aV6F+f9aG4fY7sfPCOrp5qqVg/7670HBoS3AETgELuGUNWYorz4/I/t5cEcZU6MMSRGX
         3RETgimtelkMEaf76SAUnUKuoO2+oD/hpT9+ersy0FnwWMWwQFkUkS7vK5lMf5T6QkD9
         1AIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Jsdz9+/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si8621776ybm.218.2021.01.29.05.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Jsdz9+/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TlN-00042N-Lr
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tky-0003je-LC; Fri, 29 Jan 2021 08:24:15 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tku-0007xw-Ew; Fri, 29 Jan 2021 08:24:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id my11so6461217pjb.1;
 Fri, 29 Jan 2021 05:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jrYO5yz/J2x1yetvpXGtvLlgKXHVau4sRG7K210isU=;
 b=Jsdz9+/f/5wZFbrhXlxddOR3acr3mlGNT9rupY8Zl7SRBzvlgJMLKLEdvV8NY340ip
 bZHy0JFACntK7/mqWYLmyna29/oXiMNgr44k5kmmqX0LY9tEMiGNahoaA39TP/LZioWj
 nWRre2JvyEATHPrOMNEyBFqUf5nBENN4SRik/g9B6iMyKngy1zJNsOfhGdmm/gZeSltI
 Hx24nBjx3LxSmX3xLLgmvPXCOxBk4Vv5Dcktqf0KctWjP1OwQHq8MeYPWQXYGK6P3VGU
 7MP3Ga1yypb38NC9FOByRoBmrdNXq5+OctlWta6+Lb3HdXZ+o2F5JdypevovXGrflknV
 L9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jrYO5yz/J2x1yetvpXGtvLlgKXHVau4sRG7K210isU=;
 b=gdUSVpxcPLVRT7NYVdgIqVli/LpjhnKLGipDOLS2kWBiV/2WV0Cwq9Jrd4ZbR6vqiZ
 C7lRZXYimcf6O9Xl4L0elCvuXKxGyja0PXDvwzCnoskaAHZc6/2KqL9lj+glSaLDD21E
 93viJp6YV+AFfO9MZEkCCroHyRREmQhYfmdeOduWtrnk4AWvGZ3UKIcxwNddLXQK4OtE
 QQWhHv1wOCgqzEx2X/f2ItMu68qypfgbXSY8x+xWvjUuj0mx+uV99ME4f3R1TssFFhbD
 zCZwXeRkvq3gQHPMTqtVcHtnTVsyj3cgazoKnsy5g1sZNk2eBh+dSndAdr5EC7wy3AiL
 fDkA==
X-Gm-Message-State: AOAM533TeTf894JP/5Cq9cXQC05SzbUixFazbgHn56CQKrJz29M2ypmr
 il0PMgrwJKFCbRawCI68AXc=
X-Received: by 2002:a17:902:9044:b029:df:fa69:1ed1 with SMTP id
 w4-20020a1709029044b02900dffa691ed1mr4204665plz.11.1611926645606; 
 Fri, 29 Jan 2021 05:24:05 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 03/10] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Fri, 29 Jan 2021 21:23:16 +0800
Message-Id: <20210129132323.30946-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyCaLMWh1Ccc

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-3-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] remove pointless variable initialization

 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4d488b159a..8fb3c9b6d1 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -434,8 +434,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.25.1

