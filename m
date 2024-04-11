Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp854405ejc;
        Thu, 11 Apr 2024 03:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlC2niyLCh/9KZRYS0U6KfSPt3XGHxE7xYHCDsK1u92s7r4dq+cLEwkPq6ttBomoEcrdVo5QE59TZuHH6qzdyIU9oT9xHJ
X-Google-Smtp-Source: AGHT+IEf4e4PJN9KU4QS0+ez12A088KQojTg+eIRRmZ+QpX0GKXWqBXdquKqTO3X/rI7oZviIFcb
X-Received: by 2002:ad4:5aaf:0:b0:699:1ff2:9a09 with SMTP id u15-20020ad45aaf000000b006991ff29a09mr6542952qvg.24.1712830693726;
        Thu, 11 Apr 2024 03:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830693; cv=none;
        d=google.com; s=arc-20160816;
        b=sHWOGrieidGInwqMReHREt2FQY35yJu081C4k0kGduibVgobeWVI7EQLpqGBVrtywD
         qMDz6vZhqlDnTCraA4f9gomvrP1XbnuM0GpUDejon5qJx31OWM9WOvFYDnRWkVB3j7bP
         3XVA596/Yko75TfQbPt0as2nLyKkWx+jO155zugIJ9WWZ9BPHMKhNJkF93ZZa8uQHn8R
         ya7JOcRby8Wy/5oe3NZ8iwsoak610qpZ+oV1DG9L5LWUGXK6bH4vPOSIxecDmdvkSp0/
         FW5laWbHH380EKX1unl9Ucvf975NMoSztLFI91suyy6cSaKjmnNLNnieb0uQfzvMYpch
         Vz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XpfjBls1Q1Prp7MdrT8xYPE9RcXt49p2EGfNxpQiHmA=;
        fh=6R82/UGa7ltO3OAcYr6T+sVHeXf1vqtPCIpGPywXKxA=;
        b=bT5nLwaj/ju8z7viP9P9e9wPT7bHOLKbnk9UFRLd2T29jDMugq4zL3JxeCb1hdI66D
         AY4bPQRcx4o7tbF6MBBji8q0mXCiXUzHEvuep32GvOIbqGldp/MiPnJV7JzNWvPECdeb
         tm1UVQybVD1Jgc8b4y+TUIfIsgs87ZUqCl9xeguHuqYfNlWVvo4KVcMxE+S4pSCLytJT
         UeicSOd6R0T5hSvxfg277DPI5XVB4W9FkIJuNe5aAvU4MonBHpstjchwXHg43nPs49ck
         mfQRDfrzmiTNs9FEEPRroSyn/rhMdIS4Lwk/oyRlWEsoD9TER+7AAyiFh0zF9Mv/zBl3
         GNQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBMP4xtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a056214194600b00696899b4a7csi1364222qvk.95.2024.04.11.03.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBMP4xtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurVH-00074F-L4; Thu, 11 Apr 2024 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurUV-0005Wv-9E
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:17:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurUS-0007cn-8F
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:17:11 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso5751568f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830625; x=1713435425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpfjBls1Q1Prp7MdrT8xYPE9RcXt49p2EGfNxpQiHmA=;
 b=SBMP4xtG9G3waBZ60GaxVAKGy0nKpYbbPDfPoyAF/cFANqvvgpAhX1aqMzUYhqtKEU
 moz9KaKHyFm0FzqC/eInvu3pG8zDKdGyDs1NsUw0UzT5cTcAmcRoAVC1cQHYW+RqOR65
 OVE9YtFblhh6CXzHdcjxCXMKAVfv6Dk4h0ucb65NFKxcg9W3irjppCOkeL1wp7nAptMD
 irXqp8DNH2ly1P/iTPBGH6LYyxENGeB/5hNCuL0/JNUBPiwtfy9RWDVuG50f7lsDRtp2
 xcxtFX1ipgrQdNfIDeNw3pyVlMYGDesTBP9MvW6ZIALVL/OoyMXlH1b7F+uCvdPlJa1V
 d14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830625; x=1713435425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpfjBls1Q1Prp7MdrT8xYPE9RcXt49p2EGfNxpQiHmA=;
 b=Q1u5zX/QgirN5Ikzs5Dtx3R5LoL0+2R78QhwoZHaxqOxoboPYxhUHGAzMSZXRXC6Pk
 LmZEFzbGroFcSNZvOppsHAB4uiArB0CNhjcAUCdCuY8nTOoWxgkqE7yvRsFhsBOHs9tG
 Mapom3Rjp7QbhBKEPgij2LeFLWqF2z6FSU6HNCkxibf+8jKBaA+hoBYZMpvzRzOhIMmn
 oj9jwhL8MqanISJscs2wKhQ/4fNkIiEhNbAQp8Fhqdv2K+iA4mGyucp2yBeVfbMfO9bs
 VwZskj+k53EpoLbPGAD0EDSwr/5VvP5tPAtcwtflZ2DTPzTzZuHZacp/JfXgFQrFKR1N
 ofZA==
X-Gm-Message-State: AOJu0YwGhWzc1wdM9Y/1s6EBiLpLc14Up6O3XT4kWjhtEtu0DTGbeOow
 Fqgkv7ocJDx1HBh466PPm3+ymhTiAhjBG86HfIu1vpsD+CKr6BBPXzaS8C5Ssw8=
X-Received: by 2002:a5d:4385:0:b0:33e:d448:e48c with SMTP id
 i5-20020a5d4385000000b0033ed448e48cmr3184277wrq.15.1712830625598; 
 Thu, 11 Apr 2024 03:17:05 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfe482000000b00343bd6716b3sm1406416wrm.99.2024.04.11.03.17.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:17:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/13] hw/dma/pl330: Use qemu_hexdump_line() to avoid
 sprintf()
Date: Thu, 11 Apr 2024 12:15:48 +0200
Message-ID: <20240411101550.99392-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: D1lyh7mQuoIG

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Use qemu_hexdump_line() to avoid sprintf() calls, silencing:

  [5/8] Compiling C object libcommon.fa.p/hw_dma_pl330.c.o
  hw/dma/pl330.c:333:13: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
            sprintf(tmpbuf + strlen(tmpbuf), " %02x", buf[b + i]);
            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/dma/pl330.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 70a502d245..0435378b7e 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -15,6 +15,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
@@ -317,21 +318,14 @@ typedef struct PL330InsnDesc {
 
 static void pl330_hexdump(uint8_t *buf, size_t size)
 {
-    unsigned int b, i, len;
-    char tmpbuf[80];
+    unsigned int b, len;
 
     for (b = 0; b < size; b += 16) {
         len = size - b;
         if (len > 16) {
             len = 16;
         }
-        tmpbuf[0] = '\0';
-        for (i = 0; i < len; i++) {
-            if ((i % 4) == 0) {
-                strcat(tmpbuf, " ");
-            }
-            sprintf(tmpbuf + strlen(tmpbuf), " %02x", buf[b + i]);
-        }
+        g_autofree char *tmpbuf = qemu_hexdump_line(buf, b, len, false);
         trace_pl330_hexdump(b, tmpbuf);
     }
 }
-- 
2.41.0

