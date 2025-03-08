Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp253025njc;
        Sat, 8 Mar 2025 11:05:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbC7M5INm0HpK4JNfPDxM/PSsKcaiamaTbQ8QVSpL4Pg2umGwVFOpt9zc9K2QJdMGpnAtMxc4G9jiwEw==@linaro.org
X-Google-Smtp-Source: AGHT+IGepk2y45oG/9g4QFsNuC4cGeTAIMZprYxvUYkkiU1/X1tVn0tfApF8Gp/nbZ6PdBMFHILi
X-Received: by 2002:a05:620a:63c4:b0:7c3:d2f7:ca60 with SMTP id af79cd13be357-7c4e166ae0cmr1141311485a.2.1741460740951;
        Sat, 08 Mar 2025 11:05:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460740; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqKjKdFunWiLsOT7wbjgpwYe9LGiG7dl1VIW0zpymwd+i/9V42nwxSZ69qb16dkYac
         T6zdDK/CoV+LCVJZvvTg9YhaitxL1lhNKzBQpEjraIdC4lTMd9TYurRQg+mKxyQMx0dA
         GkrGOUQg5LpNeXvFuaQRcmQluOb0DHUQdVGip+BlW1cvfZbuzjy0MXbwGAj//FfF+JmG
         0TFhYwJXwvzc2ETEJvAdXVMg+7EWCPUlQeDMrSFXDA8ebD3uNXKo5UyTbfZ9eihBEnjb
         vU0q7VMY2ypwcmODuVDFVt48nILMYC4j7CseRCzpfOTQVde88ktKVIh1WvcNWPMZSo6o
         10oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NQvf9YM7B8m3c5YxTAHSd6W3rVOYDlZhVENkZCcVArU=;
        fh=UzhknU4H+mEhTrO8l07t2ColHUycoGFnu7DWQxXCzzw=;
        b=ffEqWjDfbxIFPkTKzmgOjeq9B/Y4xwz75gBfB1JvzS3NHLFFMEQcybLpUjgOTiaVPP
         VrXgCBckC3dpLx9gCTZtkHEreEhMXD4Ud3Xc5J4IvpENJEXNG9S1X/K+qHxqKwtzmJie
         ZF6E36vb82H3yR1FXPfCuhgSpHykN1VZ0Es2/x+eXfc2cYdTSosG2xXrurwEUV1hT3oM
         qTX9YW3I/Xz/2775cKy+0Z4tmttSeMU/eeJdkoolMnYKF/FFBs2qEzfZKhGrNL2+UIkK
         HIYrPJSKTX0QDdqvD857iQEJ8wGxKttR2c9Ncb4qlGdjuQa7gzrl2/n3qR1uT4GhVZRt
         F2Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ns7w44Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e535bdf0si625480385a.197.2025.03.08.11.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:05:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ns7w44Lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzSk-0008EN-BD; Sat, 08 Mar 2025 14:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzST-0007or-N7
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:37 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSP-0003gL-Bg
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso570665e9.2
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460612; x=1742065412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQvf9YM7B8m3c5YxTAHSd6W3rVOYDlZhVENkZCcVArU=;
 b=ns7w44LpXorsU85iHgW4I+sy4YZiFIbUGrxrYIO3zGZgUrCYErwMS7DastTk2/5Ia9
 BbivITkqji2ZU/7O60c7+OI8ldosEawK5UUerppY7An0PAI653nyH6em5k2pt3jkREVK
 i5CXzRjhj0q4QadMYibk5r4szDDcMHW98T7KSScB0ikDOpTCNSqXfUkCnPoZc+zYWoba
 6oYhZyIvKr0CbSox5LwVV/RyFZiEQsaMo3wYbMiRXjCB45GVBBHJXpjLRm9RsNDItCbz
 4KQ+JxzxBnfOTGWWRueAoEhoaeecuXoQWcmYhzPQuwhmUeuN0sbIHKYlRbMPMEsqGi5t
 V33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460612; x=1742065412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQvf9YM7B8m3c5YxTAHSd6W3rVOYDlZhVENkZCcVArU=;
 b=LYRXTmqPY5BKPO96hsx+QSpfZZGn2/N3yyMe8aCySaVaFryn5FuKaEsueT0iW3QIVl
 uATwSr2KOX2LjhD4f9ryVmxOWvMKZy1fndVJ+8NP+qlbbsnW/NZmXYIExlVLzCpm4rIf
 QvAT9d9u1Jr26ooL5rop79/Ikqu2pus9UDMG3F5abM9AD7c2aC8hpWHOFEvU/aFWP9Gr
 jZsBsf7rLZuZkUhdvJ8avsGBjq7OYTNTOHsDox2zO9r9HDHQMlDTCGsi1ezQglJ0I0lv
 C62L81UTqKPz8ZvBOLhiaZbU0p/XZU+rEtXalfyqwdqz2OoUC2R/JBnCSBQOX/cfc1bp
 T4Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk00+//URhiqiaaCM0F8uizoOIRmAdlCLitml4ZHJz3RegSN0wlxljtkzpfWMKdnZoist78gqU6g==@nongnu.org
X-Gm-Message-State: AOJu0YzudeadOlop5GI51vDIm4kvRDFAAa9HnRzy7iGZ1s1WP/1jg5xb
 PSFZwcWwbMBxcS3vKIx8r3/JJPdhSxuH6shhMrytOU+fD2S8uH401nlWbu1aiLY=
X-Gm-Gg: ASbGncvwwFOql3goYrYbvIQCdcBYZFsaSpV8XMopLbdfNd5Qr+xQx1LQBFyo+ZfMwVs
 oAzeyWJvryLW6zepyRFFPDKSH7xFFRpgHSNgZko/BuutiIF/istNvP+/4QF74uxGoLyeHENeuaa
 KAUBLtfSf8hsfc1ucbw9CRISqHQ9G9La8rKbkC3r6yPdFiwqdAcD5024hR8/xCZyU9bhGIFHHw1
 TZE57VkIvEAlUZ5/eUWEN++QKg91cCGJl9B56ZFEUM/dsypMb2lTAhcIYJ5UOxHkyA1oKO0xc5l
 QuDjVYdwx9nLoUZbn24ze7tUBbTY0JRVeMqi7NNFQKR9v8wlHWS0muOAlhaWKCR1SFVndpT3iLo
 ZhpxiLMirKXOMMWu5qds=
X-Received: by 2002:a05:600c:1d24:b0:439:916a:b3db with SMTP id
 5b1f17b1804b1-43c5a6301b5mr61265805e9.6.1741460611733; 
 Sat, 08 Mar 2025 11:03:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cef25f075sm8657555e9.28.2025.03.08.11.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/12] hw/ppc/e500: Replace generic SDHCI by Freescale eSDHC
Date: Sat,  8 Mar 2025 20:02:30 +0100
Message-ID: <20250308190230.7508-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: NX1LxrsEGTuX

As Zoltan reported, some U-Boot versions seem to expect
correctly initialized registers before expecting interrupts.

Now than we have a proper Freescale eSDHC implementation,
use it.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index fe8b9f79621..e69551ccdb3 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1027,20 +1027,12 @@ void ppce500_init(MachineState *machine)
 
     /* eSDHC */
     if (pmc->has_esdhc) {
-        dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
-        qdev_prop_set_string(dev, "name", "esdhc");
-        qdev_prop_set_uint64(dev, "size", MPC85XX_ESDHC_REGS_SIZE);
-        s = SYS_BUS_DEVICE(dev);
-        sysbus_realize_and_unref(s, &error_fatal);
-        memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
-                                    sysbus_mmio_get_region(s, 0));
-
         /*
          * Compatible with:
          * - SD Host Controller Specification Version 2.0 Part A2
          * (See MPC8569E Reference Manual)
          */
-        dev = qdev_new(TYPE_SYSBUS_SDHCI);
+        dev = qdev_new(TYPE_FSL_ESDHC);
         qdev_prop_set_uint8(dev, "sd-spec-version", 2);
         qdev_prop_set_uint8(dev, "endianness", DEVICE_BIG_ENDIAN);
         s = SYS_BUS_DEVICE(dev);
-- 
2.47.1

