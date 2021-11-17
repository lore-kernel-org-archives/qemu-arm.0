Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp262574lfk;
        Tue, 16 Nov 2021 22:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCbC+9MxpQs3FpvQfM4NdSwIT1XwHT/7nmrC6LpCHRM/1uKIC0KHLCI7EQ6X32o99c0cLG
X-Received: by 2002:a05:6122:16a3:: with SMTP id 35mr82895147vkl.12.1637132380563;
        Tue, 16 Nov 2021 22:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637132380; cv=none;
        d=google.com; s=arc-20160816;
        b=KvM3jnwmersVAQaeA7hBzbTt2dQpEAvlpCtB72ZzS9NIv8zC1NEnNmiVnY3NH8nnUA
         ou+wv8/vx+V8uRisP3v+Il8bsncrVkWTfJB9e2XBl869/1vRQFMOryt6yPJ1+O0VS/GF
         0nxXFKfmCEj4JU+xOZ3W8bs6Ep9hkMvPL5DW+OIA/g0o0QgZBHYoRMzSIVA45QLnU/Rt
         UDEjgCjRK8o/zx3l57mfx5m46FMmEQIRqGIHrXhfGPtRTRDiZ8sLXq4Kscfwn4mWB0Xb
         vY9AI2TjVpBuIK13K3TQWxE1qPS/PXRfP+8v5mInwvGOA6hW+FxnyuMz0wEj3IIDxRUM
         xc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bbabirie2Kfapu1I8GL4Ixr3K2Z2oG6ScmZwYuwJk9g=;
        b=zvM4r4ZAyxeQ+fAkTFXdd9U67AxpKtaNjGYQDd7ZCXspDWam+6/1ayjAdvnRgzIZ/D
         OWVpZoQAP//8Ax4xZoqYI2NodpWZZm4ripwzurIIznN/tmgRM048k4Iyzh6hl6TFSDZw
         z7sOcl9RTgBkza5/WLBq5JDtNOILF7iVDaZH0IRQoy27VFhw4iphO1KbdojzZbbp4qhf
         ArE2m26BZF0k5szLUxckip0JZNIDG16PXf4mPV45ezd62ymiAJX0i/rTCEXVDOtW44Xz
         W3K3Ck7RZHIb2NHa8tqx6a+LGJidZeHvp6a6m2fi8GW6ehV03eKeXrN3VXms2kwsTL4X
         5ZnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SHxVrNbT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb3si267969vkb.41.2021.11.16.22.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SHxVrNbT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEux-0005m4-Sk
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtc-0004xy-T6; Wed, 17 Nov 2021 01:58:16 -0500
Received: from [2607:f8b0:4864:20::52a] (port=36404
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtb-0005bV-2U; Wed, 17 Nov 2021 01:58:16 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g28so1429970pgg.3;
 Tue, 16 Nov 2021 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bbabirie2Kfapu1I8GL4Ixr3K2Z2oG6ScmZwYuwJk9g=;
 b=SHxVrNbTiQZfye0IKJxupED70648O6vwMI2Td7nl0s39lyJOLyzQM0kooL0nPCbrhz
 r7I7B9SR1GeThdwwVAW8nid8kBWa1m8kGTKCSIoXGTxruAhyGV25hZ62xzCvG7IZDLE4
 gxgeyZHKJXMwdKW8Zas0N7o6PtI5G7HJS1b1NUlNNRmmrU6t8EFpgk2t8nzkOW6xSEWf
 71GTTP/VTP1CAe53zXcbrBfPKeWG1RsSdNVIUtRSBSzMMOQ2zrIXghzqVevtgIMIsF7U
 zOJbbm7ogBfuz5aYpAgWJMGTNooSgqr2qMeAZZOAYxfs3wa2mChK0sXHoJGq2SNPnyeT
 A39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bbabirie2Kfapu1I8GL4Ixr3K2Z2oG6ScmZwYuwJk9g=;
 b=fa9X/mAogiV76ot4jgv7+GffmNtHUf48k7dLxcd1M927Iv93Ti4qbmkUoM/etv628T
 JFsh+sdk5zAm3IwqD7gTdaB+/VTwgCfSidODKEA878IIPi+Zh8Ed5s2NKU5thv4pusGZ
 pOvdXAx17n80UyOFTLuPZT9tdTYA0wCF25nhJKVu70LF/lIHFEIvckkVWT+QAXh8BS7J
 PQOXvW2/Xdyg+Z06cjQa+UyDXMir4Ricw0CTtcMTPabD5DEl2ZvNsjF6fH43DvRKnkD3
 GOIDpOIrM4yFK+U35XhcA2OHy9JrXdx8U3GAV2f9cMYCTRr6gpM4mo6EoUxUOlFcna5w
 FmWw==
X-Gm-Message-State: AOAM530Ul0BwU+pVb5UAI7OMnjByr4h3e32PNuQvVDfpcejx3uR2nv/d
 mZjqIGneKad/+VPW9E6GsN4=
X-Received: by 2002:a63:5813:: with SMTP id m19mr3609564pgb.441.1637132293328; 
 Tue, 16 Nov 2021 22:58:13 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/4] docs: aspeed: ADC is now modelled
Date: Wed, 17 Nov 2021 14:57:52 +0800
Message-Id: <20211117065752.330632-5-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a4+WghWbMozC

Move it to the supported list.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: New patch
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6aafd611e9a5..d8b102fa0ad0 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -56,13 +56,13 @@ Supported devices
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
+ * ADC
 
 
 Missing devices
 ---------------
 
  * Coprocessor support
- * ADC (out of tree implementation)
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
-- 
2.33.0

