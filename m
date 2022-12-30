Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839988ejb;
        Fri, 30 Dec 2022 03:37:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuBLqKpinCEcHteM0nKHw4Y2FHFVcUuAXcUvO6H94JIUW3vUaJlFepsThgBgeHJSadKFF9S
X-Received: by 2002:ac8:460d:0:b0:3a7:eb3d:9e75 with SMTP id p13-20020ac8460d000000b003a7eb3d9e75mr43230034qtn.16.1672400276030;
        Fri, 30 Dec 2022 03:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400276; cv=none;
        d=google.com; s=arc-20160816;
        b=Qa0nYvHV2vfgTj+GU8OeCooitso9o9S2eerAU6TZn9C92OnPK08cZcHn0Ek/VYKpRE
         TfQYrmBbcCkc7cZw+BUHBUqWTzFmHbzyp/s80cO1Um5V0IqVFTBGrFT9OT3nU/iKmpgm
         eOLUj9wPyDl9jZdU3PMKEQMqMobjqSgydEsaNpwKAYLD8l1XFFO+mpn8w2vmKyNrQqba
         iHeJZnE171iQv1Jw7/PED8KxnDzVMjlF1wcW4H0utC+ZWLnAcm+Nr4i+OYOzQeNw8jmR
         7T/KW84kt17T2NJTP1TkP27zHvHSzKKVzc68fTe/TPwAnAP3CrpA+5LQpLmgW/W8UwKK
         hTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zQ43llp9uSrlxzbpXpwc6nZpfYE/bji1ywv0OnD5+3M=;
        b=g2mRAsMk85dRWZEAgY/7aIgbvhAVCyU/MYPkF3UgmCKzRvy5SO6SGpcdkRNYy3pCB7
         s+4ZYv9yPF68RmsQWbeJ4lZjaF3KdKry0Hh+fEbMm5w1zFjFPQTePXMOBOcP9AW2fI4M
         eBkgIlY3a/bkiLzfPMq2pQ1jv53SauWV5RPtN4uS5iS7CsqYbPaCRF3sZHbfmS0tdUnQ
         P/fqvljBWCLpTuFNi3I/yGbLFuITVrzY0jDy3LkMojOFJqsfJv6Q4DY++dHUTXLtVjzB
         /X5jAA+wH+jyVzhYPd6490RIVusiR5k11owHhxe9k1JbC0m9DRU/diXfhxXD/+notjgp
         aHZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6Skdgm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020ac87489000000b003a7e99d036asi9992518qtq.249.2022.12.30.03.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6Skdgm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDgB-0006kB-VB; Fri, 30 Dec 2022 06:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDg8-0006eN-8p
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:36:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDg5-0003pj-3u
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:36:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id m3so6119532wmq.0
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQ43llp9uSrlxzbpXpwc6nZpfYE/bji1ywv0OnD5+3M=;
 b=c6Skdgm3uxX2mGoECvPToeMuF9vXZVMaidfHJgp6Z6GCe1rom9GgaPDnHhhaB1v17w
 JC0WP+cBSvunTbgRM9EYa0vkEs4Nc85Mohogrb01/MNQibCH/EmwlAhtHhI4j/LRUAFr
 OcoUpdHljcC4DD860tj8p3VvrkwDVcSQL9T26sVrVH9YeZz2TICZiH0vOWKor81EKUPd
 73hN96CHmNUmhoPufesYMncTMDyzqaDHBlHhg9l+3px2dXP+irpzga9zMiXcKUmSXLVO
 cxQHIeOOOovzxo8gu9g14Y6jyoD0dWJj94SLpvMDq8+knh5schbZT+KCl34ENCPaLYfS
 ovxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQ43llp9uSrlxzbpXpwc6nZpfYE/bji1ywv0OnD5+3M=;
 b=Ml8M+VB06hnR4J4IcvWPBSwuM4Qw5cfXwsGQzSfX2MNGOZBHrAzF+jKzU1dyyIw4Iz
 0/Nb5Pcu5SMjP8GojT1CcSAvSKkSZdHprV1rrst5X1C/esIkHpbRL0w/8L3gfMUdvP4z
 zZylS5tMEpEJIRbSDeiNRzJ2favhQ7zmylBb/nhEttEI9J7xi2LpZAJ5OSllw399oFUQ
 02LORTTaCrCxIfz69S1VsaS2jabrzwZY7tnbD6Ucv41wC/fV0OI3NnmO9IutBbwlbeOt
 I0uzXvPUUwqX03Rg72f9zbLtyHQ8gLejpVI6p9zdcTGry6/pBuU6EBaQPl0xap+zMR4Q
 WN4Q==
X-Gm-Message-State: AFqh2koLoOjkcI9jv1AJJ7VxXFH5ZhduD76OdXBQDbVGPMjHIN95IRH+
 e/xFGUMsL3FG0Y2j+rJg/HC6GA==
X-Received: by 2002:a05:600c:3584:b0:3d9:719a:8f7d with SMTP id
 p4-20020a05600c358400b003d9719a8f7dmr15338125wmq.35.1672400156394; 
 Fri, 30 Dec 2022 03:35:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a05600c4e1600b003c6d21a19a0sm28195721wmq.29.2022.12.30.03.35.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 09/11] hw/arm/aspeed_ast10x0: Map HACE peripheral
Date: Fri, 30 Dec 2022 12:35:02 +0100
Message-Id: <20221230113504.37032-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0TYVarIBMOS0

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Before on Zephyr:

  uart:~$ hash test
  sha256_test
  tv[0]:hash_final error
  sha384_test
  tv[0]:hash_final error
  sha512_test
  tv[0]:hash_final error
  [00:00:06.278,000] <err> hace_global: HACE poll timeout
  [00:00:09.324,000] <err> hace_global: HACE poll timeout
  [00:00:12.261,000] <err> hace_global: HACE poll timeout

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

  uart:~$ hash test
  sha256_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  sha384_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  tv[5]:PASS
  sha512_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  tv[5]:PASS

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

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e74e2660ce..7a7443a95b 100644
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
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->sram),
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

