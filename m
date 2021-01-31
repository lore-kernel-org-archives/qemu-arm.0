Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2827660lfo;
        Sun, 31 Jan 2021 10:49:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvkZHHmCysggNUfi5kK8MH4bUcSxqJoX6LeaNkouuN5OJNCKnWXF1AKr2v8vLAOYQPBwha
X-Received: by 2002:a25:adc7:: with SMTP id d7mr14999523ybe.349.1612118957748;
        Sun, 31 Jan 2021 10:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612118957; cv=none;
        d=google.com; s=arc-20160816;
        b=GvnuxcrxO95oP2I0bqjyt0lMKVmYXMD0XiCRV5F5jckGomHj5B0temm9z6W9kw8rT5
         mPwViUXuWtklcawLugPn7DUriKE5hAD3CQg2k3zsfV9jVjyit8OyY8wC5Wjuh0DnQa8T
         Ycz9fUJ6K5M5sbVC/yp6Olinw5gWM0lNpVAg/ryII35WaHR/xQOr/+pgZHi/urp00Cba
         dJ2zCivwHSVRQWW0TwAP6cSQVtCUOBW74wPXjKcPlIuYtA0H3OyoynVzencxj49UyKSj
         7z8SlqJX+3Rj/12KD7UYyn30um6IRmrkmu86x2EmWG6GzcA+q75HSVMzZWPJrfMe9nk+
         LkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
        b=sJ3a2AjtUCxsLpIXuAhFwVLDh99raMSXfoHr3w0wJWCv3DEXSgCpjEsp0avJBgEZNh
         qI94K2Sgsby6/zeG3BOFDIh4GgJjYz2CCH1NbvG+4o+Lm8lilPSd0zc5bCP1a8yaTvjP
         Oz/mKs5XDFqft7OGSFQmLcnB/MaErldhaCk8ysZI6zCpgrIZqeef+UnPw20j4fddL/4X
         /BjRZRWrnKe/7Md0xobcETKfIZwvyZK+6/N++penUuWQyVn7w8bIzo31qdsI4fzYNbKh
         d0gIOvrRMXDp5g+Pa8+AB/2mzHECXGFUH7CQBtRAw9kJc3IX67rpefrvrDZ8dnJO7zsO
         4EoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KktWREIc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si16836381ybk.29.2021.01.31.10.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 10:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KktWREIc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6Hmf-0004Uj-34
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 13:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Him-0001yT-6y; Sun, 31 Jan 2021 13:45:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hii-0007ay-CJ; Sun, 31 Jan 2021 13:45:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id c127so11307023wmf.5;
 Sun, 31 Jan 2021 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
 b=KktWREIcOO5ckerD0vQCUtP4hMxuWXaLfxmQON2F4aRCM4glautuQG9RCoLYyI2M6h
 V5StizOVibqs6xX8hjhe6EaeR18syvb1pzBY4HniKeGb8haWPCQx0/qunzKBe2uvvrFD
 JS00J8PUevkFld4jV7mYwH/iRNTKVHzEOWWmeWoR7bmRoXuVHGWOHP5gw5hRaEjtLVIZ
 CoTvhGT9JNhDgl8qttOjgAcdmAEnNQuzjakEop2W6CZ/OLm7OUttK7PfRgOhmQOi7omc
 /RRwEEarVBBOqddOibrEpxgGZpQfQqrdinkeRt+RGl42Pn6cSUy/dn1LOp6anFDowVe1
 3c3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
 b=XHJZb92cdGVpO+IxrgLPePbTU5aflUvqc4pKYx0xZsMHDx5w1CoyG6WeoFupOvNNIF
 GLEvryYUwHnFcIPulRw11dHyynndNd2+vdfyjiXlBXIwegQNDfk59yAlWuJM8GnWBjbt
 AdQ1mD58n6XLjFCP5dItW8n1GZoXvch6oIuC+ZyfRt5bvyTTpqg/LRXVKPRZ1MXr/gNo
 noPCb9M1zb5MDP+7hX0J3pLkN/2WyrHCWD2+6xL+oizJOxpjDRUN4hKoXd2WaXVwkYT4
 a0l6KT9YjQszGonffMm/dR9pNpPnBLFuGjgDtsgN04aDdqjNDJ9D8/qyBRvH1UJffe66
 55kQ==
X-Gm-Message-State: AOAM532ewHyJ4ZvtWYVPWhJi7U7Omz0XFMXF2qv19X7EpkIjNlNnQhxV
 kNsf/1+KjCQ5dSwXUKsvsXv1Rs3uYkM=
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr12176695wmh.64.1612118708340; 
 Sun, 31 Jan 2021 10:45:08 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r17sm9680432wro.46.2021.01.31.10.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] hw/arm/xlnx-versal: Versal SoC requires ZDMA
Date: Sun, 31 Jan 2021 19:44:46 +0100
Message-Id: <20210131184449.382425-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vk0C+v6uJO8l

The Versal SoC instantiates the TYPE_XLNX_ZDMA object in
versal_create_admas(). Introduce the XLNX_ZDMA configuration
and select it to fix:

  $ qemu-system-aarch64 -M xlnx-versal-virt ...
  qemu-system-aarch64: missing object type 'xlnx.zdma'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 hw/arm/Kconfig     | 2 ++
 hw/dma/Kconfig     | 3 +++
 hw/dma/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 223016bb4e8..09298881f2f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,7 @@ config XLNX_ZYNQMP_ARM
     select XILINX_AXI
     select XILINX_SPIPS
     select XLNX_ZYNQMP
+    select XLNX_ZDMA
 
 config XLNX_VERSAL
     bool
@@ -362,6 +363,7 @@ config XLNX_VERSAL
     select CADENCE
     select VIRTIO_MMIO
     select UNIMP
+    select XLNX_ZDMA
 
 config NPCM7XX
     bool
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index d67492d36c1..5d6be1a7a7a 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -18,6 +18,9 @@ config ZYNQ_DEVCFG
     bool
     select REGISTER
 
+config XLNX_ZDMA
+    bool
+
 config STP2000
     bool
 
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index b991d7698c7..47b4a7cb47b 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -9,7 +9,7 @@
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
 softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
-- 
2.26.2

