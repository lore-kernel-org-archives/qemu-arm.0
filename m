Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4327051ejb;
        Thu, 29 Dec 2022 07:25:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCkv0meQviiIwMcqA6nEaBr1ZwasHtqh53xNAfeKp4zL8DFur8wcKzNeArBtzPkcGR5uOY
X-Received: by 2002:ac8:5259:0:b0:3a8:112d:f277 with SMTP id y25-20020ac85259000000b003a8112df277mr37629000qtn.23.1672327512911;
        Thu, 29 Dec 2022 07:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672327512; cv=none;
        d=google.com; s=arc-20160816;
        b=l7XtdQMboCzrV6zhxbZCyIG9uJZ+u79tfu6QVhROBgUY6OTcAIIN5OoNaAnaRUCyUb
         bzuhgDuRmg4pQf5O1Trgkh6ikQ3DLM5shX0Hw/zrcMpYgCYghgjdbPdbyY5NY5PZCdvv
         xhsfYGIe1QZEdFuRsTBipB2IrHQGku5/L2R124CBh/cmx1XX7sBBoPxhpb5DAAiF4+9S
         mAF2QFgslgGJs18F7Q8cDAtSsRlNUZ0k4JRFvvnKw92MQqtKtLaapDzsTahRTbIQCgMC
         Cx6IzNp42kISXIPCUAHNMDeSGwjBLEIj90Nh5ZJujfAl4hRu4JMkXcBaZYF1Iqrkv9bi
         1gsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aCgnhtUtjHBW/yqoLfaL4OuLziOvgUY438yt3+i+waA=;
        b=HxqqSIVoUKNZq6RVkGTYEQgfRFq3K+NuQfhQsuyS8eR/S+SwNKKQyoZezrJ7rdX+9+
         qH2rURGNgSEaf5YhiSzKWgTtqiig9I/WbkqwtuKzPPGyG3AYVgvhAouYGiGAryTXULsa
         Jqf6v4ZbXfyKaWf9+5jsTnEKVMDIPPUwD6pWi1UZZVqnQr6uSHCxHf8EEVbPxP1Th+Lj
         469XDm6gRRkbLXcaP0mosgIcUD8BOZ5tKS3l5J/9vihTnL7nwDiYhZeRYCyNSqRaoxh0
         Ihh/E53ZSe6LSZsJI3ACG6ygI/G/u0KM77jRTgIlXQU3LPrar4qzJWH40TbTcfm9KLH7
         LbVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="miLPU/S5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28-20020ac84b5c000000b003a7fee27ce0si8316296qts.601.2022.12.29.07.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 07:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="miLPU/S5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pAulK-0001Ja-2K; Thu, 29 Dec 2022 10:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulJ-0001JL-0q
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:24:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulG-0007wh-W5
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:24:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so11642620wml.0
 for <qemu-arm@nongnu.org>; Thu, 29 Dec 2022 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCgnhtUtjHBW/yqoLfaL4OuLziOvgUY438yt3+i+waA=;
 b=miLPU/S5nvsYHRvE36PrDlhDT0rNGGSLx5NoaMCHU63dwzSX3HAAeO8pMg3ExVACBx
 kfNLnqyoNkcuDOOmcTMaLc46VIPpgYPurqdRQaKbBJ7dimXUFn04i0CwPZt948d9EX0f
 IJ7pT7CkBwQbKlImxqWI95t8veR+2NTOHtG8y2rA7jP4KNsJiAQuNAWrip+/ADjwG2ru
 a5UqNesTOyobcx3SyN+SwlVRa/4SHgBZJEuvv6HG+zedzRIPbnQop77AmCcw0+elYS6W
 DbjGK6a74KJNfgE8y+weJc04paNY11UX80LCbPwjGZhelY0S+GiD37Una+vkHEQPhRzu
 MnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCgnhtUtjHBW/yqoLfaL4OuLziOvgUY438yt3+i+waA=;
 b=HqlRnQGw2J94i+s+I41uUHe2qCOPvP3QL3Kgyd5rYMlT+ZSv5blspcIeSrxRjVC9ZV
 c6e72WZR8NNALqdhGZcHotlC83glxCoF1fhQ3RgUNasyRq6idgw5f/UY0KoD7SvYzk7Y
 bie7kPlY6tEwijfWRIEHhBuJy5Qo4ahNPb7XEYhvkYEWg+a/2jTE0uIv5g+eofZZVt4s
 Rm+j8vKkV8EEsQeNpn97ESsEDPtCI119oTEwcy3iDqKsyDdb2DATwRkTVrBzazUiZV0n
 m+dE97byEwkJS0/2nI5G5PtIjrjTWKuxb1GawotWnSWMgYErQEp8iE5YNB5i+SOHAl+4
 27tA==
X-Gm-Message-State: AFqh2krfaH6ahQIP/SZPOeeeJ8mcHWHQ2VDhE/ZTHYsmMC7SVEC6bFGI
 AL/MusPklpdc3dY3isbGMB4UZELgecjLmQOJ
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id
 t17-20020a05600c41d100b003d23d7b6118mr20309828wmh.24.1672327441621; 
 Thu, 29 Dec 2022 07:24:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a1cc914000000b003a3170a7af9sm24426873wmb.4.2022.12.29.07.24.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:24:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 6/9] hw/arm/aspeed_ast10x0: Map HACE peripheral
Date: Thu, 29 Dec 2022 16:23:22 +0100
Message-Id: <20221229152325.32041-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tF2tno2RhFlp

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Before on Zephyr:

  uart:~$ crypto aes256_cbc_vault
  aes256_cbc vault key 1
  [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
  [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
  [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
  [00:00:09.743,000] <err> hace_global: HACE poll timeout
  [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
  [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
  uart:~$

After:

  uart:~$ crypto aes256_cbc_vault
  aes256_cbc vault key 1
  Was waiting for:
  6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
  ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
  30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
  f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10

   But got:
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

  [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
  [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
  [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
  [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
  [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
  [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
  [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
  [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
  [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
  [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
  [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
  uart:~$

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Should we rename HACE 'dram' as 'secram' / 'secure-ram'?
---
 hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 21a2e62345..02636705b6 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
     [ASPEED_DEV_UDC]       = 0x7E6A2000,
+    [ASPEED_DEV_HACE]      = 0x7E6D0000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
     [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
     [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
@@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
@@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
 
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->secsram),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-- 
2.38.1

