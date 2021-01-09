Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1280312lfq;
        Sat, 9 Jan 2021 04:39:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydz2/5mVCl8liIl6yY8HD80ST56LIHGlRDzlameMHXT9E5VGYO60zwtPBXTBD/w1l6dOE9
X-Received: by 2002:a25:ca14:: with SMTP id a20mr12344735ybg.303.1610195982913;
        Sat, 09 Jan 2021 04:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610195982; cv=none;
        d=google.com; s=arc-20160816;
        b=z5oYj1qkZ0XcZPlk8symB1/b6NZi/Q+oOLeO2Zd7J7Q3xjxRgYqtY3gFflk+gc6PYI
         4zeNCEVmSO3jwoJobswTL/1BTdLPvcE3wmMMQ1IDYv7eNNbQpJu7KqYaedgQoJrZF6F+
         dgGyH0y8M8difm4LbX7+Fql9cr7lY0yu287NdV3LXMncWinIpz9HuOGbkvt+9QP1tYS9
         /597Fq0/jldrVOsh6jdb419cy+Bh9Q1tICbzvwq5zwBtecNqebpIrnk48Kh4nne9Pwdx
         viGwEIGbqpE5eJIe8GZEiIE7c5q1mGFdqaWtH4bnYhgUiZ4AASlgaD8Sgpb+TnBeV3By
         1pYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yI7TE3+aIpF0BmDNmiLFBF7fafnCCaEi0n+wo9FW9iw=;
        b=yB/v70DEGn6ig6pR1aJmGnA20KlwZRf+bEape86Cgc/OgX+yEUC8A0+QKR9SeTvq4c
         wwLSjkMphp4bz0mtKfbfD/fLJwIc9Bo5wT8zuIGAkPzOa/CFi8r4lUvOH4oPiHmNqmLy
         mIVc9+8ZVlGMiQFMTDnF51Hu2pLht3drayqew1De6bSBSEfTjE0pxz8XzV6c4RVnX1Pi
         wwTy3SYRzrP/m1a7jRCfyxSFtjmFCjaShdY4pC+USrKsyn4kTJ1wDIpYHt35CITN9oHr
         g+2o3+7+o1uk9QTgnkQMw6pqMhWRftRXKK6Gr6aPAdD+oCtlAxDeq3U/yYZPDb8clcit
         JPmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hXJEsaTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si14847048ybt.256.2021.01.09.04.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 04:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hXJEsaTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyDWw-0004fp-9M
	for alex.bennee@linaro.org; Sat, 09 Jan 2021 07:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTm-00019Q-LW; Sat, 09 Jan 2021 07:36:27 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTl-0001ho-4P; Sat, 09 Jan 2021 07:36:26 -0500
Received: by mail-pl1-x62b.google.com with SMTP id g3so7131207plp.2;
 Sat, 09 Jan 2021 04:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yI7TE3+aIpF0BmDNmiLFBF7fafnCCaEi0n+wo9FW9iw=;
 b=hXJEsaTlnE/ROdYSwRPaU0zmcrW79wC8GC3sb2uRnfqOISzBcqyIBIiGM1ZlAqTjRX
 ydO2cdSZQAMIWR1uliCHWsaFfHKWPvIVgXzk5zpNsNr+c2hVb/dg54KmcSsWzLEzkRcF
 WZAbwERsyRlE6vnWE5m3OylISAiGXn+4E+Er194ZdrLTmnC5mFc/L8RdEbSCvhr+vqKp
 kHrhfLAKR3lTCpJ1+naKg9sHu+WUCaX5Jb8Jzf+0psKuK+Pfwe4VZ++4U39iYzILX+45
 +knQPoPqp+HKHS8CWY/4wLHRumXwQfA+NsgDWouhpuJqu+LbR+jnBtCiPGCww0yj1ER0
 DEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yI7TE3+aIpF0BmDNmiLFBF7fafnCCaEi0n+wo9FW9iw=;
 b=BZyOefW2GTbZlHtd1oqHg9VlIM6mjNC+jJIicYQo9QWKsvjYnKgs9MQ9fDqMV47LZR
 P6OsEw0nXWUebtZyvx4lovpKaIIu2IVdZre82KwJGPCRwoVaa7SuqJ/++hn6KpZkgSJD
 7njdBDUkFG/7EQ+oioTbfgCLi6DqPYO5zmIzoO32M2+LicPj0CiCuZvNJYj+cg2/WcfG
 4cUc+bjIsUfBIMxP3Pxph8Yq8VkeznsTXYgRFvLIvS4HeqOqGNDOYT2W0O1dzd0fFE8W
 w8KgVYjRK51mQ2yuT/VPyCIUtFHaX5CGT0zckHIA0ZH+8Itd53S50jDOZm/Cm89v30M0
 01VQ==
X-Gm-Message-State: AOAM530RYUM0IZldlzOpDqOR3PevERueDA3OsAIJV+LmWDf+XLxcxVUR
 d5SiMnubRcsuZiDBSJ5WTkY=
X-Received: by 2002:a17:902:bcc6:b029:db:e257:9050 with SMTP id
 o6-20020a170902bcc6b02900dbe2579050mr8354128pls.22.1610195783627; 
 Sat, 09 Jan 2021 04:36:23 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] hw/ssi: imx_spi: Log unimplemented burst length
Date: Sat,  9 Jan 2021 20:35:43 +0800
Message-Id: <20210109123545.12001-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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
X-TUID: IC68yL+keJvY

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most normal use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 880939f595..609d4b658e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,16 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.25.1

