Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2195722lfm;
        Sun, 28 Jun 2020 07:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVx2qmQVCP1kXvbfXHqQOq3reE+ZScHvlD41MW05dIdZaFHtx5LaJHaaY0xbdqVoF+OM2H
X-Received: by 2002:a25:c00b:: with SMTP id c11mr5516336ybf.430.1593354682398;
        Sun, 28 Jun 2020 07:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354682; cv=none;
        d=google.com; s=arc-20160816;
        b=QVO71GNhBNcc3HAmwj2ajF/5cdZg4lUmK3G3K/VpfJBtxhqC2N1VbQs3NqGhMoEDvG
         3ls2JEKtWdXapmoHlSlxGpjSwtnWbsWnuziw0D/V+C9/5panSxxviQmm1B31IP4jqGju
         UdEtQCMd5T7iTTUC0xlF0jkmgKICSZS4iHEm0aMEE/BdCsSKCs6EL6G3TH7cJRgHtEKz
         h6J0+zYNDILOY/z1tEnxIhMX84tg3VT+HJDp3uLdjqt5gRlVY1RpWuHWPa3BRugUMV5m
         xkvU87XTjWkwW3LcojqU6xqt2ZzYtuZEFr+1SyqFFZxkIxOTVnOX11eSnJa63idQh+XK
         NUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vmpo8pB4pBMBpoqr8J9eP1BB+PRV+N1N9F23e1inTwA=;
        b=eSYgOSmGx/b3z9s7IwG1hYKfCg2XWs0dSfE+4KhJXLC8JEx4r6nbgVeUXwbpkYCAU/
         +M+yVLBQZMHvkg4BSHjXKWw5n6Cep+ITnbFYOQ+6YAQlcefH6MWb8cKkhlMUWAYM55F7
         Aw+m5Gr8xo4O+kk/+wpGdxo/69q3b1Mr6m/X0HyQb2gZAByc4cgFfosenAo8kT/Y9cej
         pDmbi5sqKldHKeeQeE2IiZfRTpJeILblQ/SIQB3CWAI3dKcMxSiTNSTF/G1HzxLu+KWp
         t1IAaH2ewP0eYuZZK8cbcq91gZLIHF4EfSJhDghU5t4eQB3rtu12Hib765iCfCcGt8mA
         5CVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DWewYRK+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f123si33126546ybg.424.2020.06.28.07.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DWewYRK+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYL3-0008AL-OK
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEm-0006Yt-TC
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:52 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEl-0004mY-4h
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:52 -0400
Received: by mail-wr1-x443.google.com with SMTP id f18so5983671wrs.0
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vmpo8pB4pBMBpoqr8J9eP1BB+PRV+N1N9F23e1inTwA=;
 b=DWewYRK+RJ1GyPHDAcYN9AIsDv4Z9Xse4I6QjRetBl9d+NJp5Ya+qyhCU6WuIOJgnm
 u+v1Z+1dM4gSgc1u+IenpHj99w3kl+d/55pd+HT3f4MF7l3rBZQ4cAbNh7coUIxSijGb
 QMaX+0MgTwmftF6MArSrncbJR0pxZUeM283NjVhcTS1MKwNMbzPMuKiAq2vb0d/Mp6Vi
 xwuTETp/eMWAZgipsT/hbYlZEpLvOstb73ukG1LrxanWtNv73XEeaWdRqLWrivXgjunp
 ZhQvCLjdfUuFuaZdIBV8k61CWepUH4Hac+eEFXU6k10kO9Dw91RTXLtMEeV2QKlUIAaB
 3PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vmpo8pB4pBMBpoqr8J9eP1BB+PRV+N1N9F23e1inTwA=;
 b=lORBVtkA0oUNhOGUgCyEYD3Ota959yGYTLCnCIiXD28l72PMJDNRITx8t4EwHAkHHp
 OWiixdflC3Pca+3SH1dIvOD6hRzvRlOQIm0k1cL3CD12aMPSSOoD/vGlRiixKEyJWebH
 MhLLgt36L+a+vm221xgO6mCxRoFwIg6RVdo6k/JNupkktzSvr+eqHJ80+gUyZbGAfYEr
 btnSTKaedhttS8atIX/g490+p5zOyhwCS+oCubzOGQp87t6OOomJxP5xsPSEoXYaYPn/
 3p76jj9rrWC8sqS50amMEcRJCoKvNCDerlXTx0jbD9B2SPxgT4eG53B2zggTepvG9CdD
 0Cfw==
X-Gm-Message-State: AOAM531pJ3JRgIGm4Gmin8penGmDuD14LFq3dbCV2uF0MALDjCTSOiiI
 +jM9oCgriFzultZgJv3+7y04Vg==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr13387256wrg.205.1593354289855; 
 Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/17] hw/arm/pxa2xx_pic: Use LOG_GUEST_ERROR for bad guest
 register accesses
Date: Sun, 28 Jun 2020 15:24:27 +0100
Message-Id: <20200628142429.17111-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpA9whtXOlsL

Instead of using printf() for logging guest accesses to invalid
register offsets in the pxa2xx PIC device, use the usual
qemu_log_mask(LOG_GUEST_ERROR,...).

This was the only user of the REG_FMT macro in pxa.h, so we can
remove that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/pxa.h | 1 -
 hw/arm/pxa2xx_pic.c  | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index f6dfb5c0cf0..8843e5f9107 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -184,7 +184,6 @@ struct PXA2xxI2SState {
 };
 
 # define PA_FMT			"0x%08lx"
-# define REG_FMT		"0x" TARGET_FMT_plx
 
 PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
                          const char *revision);
diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 105c5e63f2f..ceee6aa48db 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
@@ -166,7 +167,9 @@ static uint64_t pxa2xx_pic_mem_read(void *opaque, hwaddr offset,
     case ICHP:	/* Highest Priority register */
         return pxa2xx_pic_highest(s);
     default:
-        printf("%s: Bad register offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pxa2xx_pic_mem_read: bad register offset 0x%" HWADDR_PRIx
+                      "\n", offset);
         return 0;
     }
 }
@@ -199,7 +202,9 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
         s->priority[32 + ((offset - IPR32) >> 2)] = value & 0x8000003f;
         break;
     default:
-        printf("%s: Bad register offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pxa2xx_pic_mem_write: bad register offset 0x%"
+                      HWADDR_PRIx "\n", offset);
         return;
     }
     pxa2xx_pic_update(opaque);
-- 
2.20.1

