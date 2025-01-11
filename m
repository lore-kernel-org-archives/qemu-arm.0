Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp896379njn;
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXn46m8JexpLrLJLsc9Id9pxZpBw4hUaVk4xV9VRAoHJ8c2ZS5XkHGxijVN6cpsmABzYeoItWvpZTVubw==@linaro.org
X-Google-Smtp-Source: AGHT+IGv0IWgJiuN6ThIDom8nfVDj4xFMPS0VTpMg0wm3qaPLk1CNph2F3o8L64tznqx7W16tHm1
X-Received: by 2002:ad4:5748:0:b0:6df:99f7:a616 with SMTP id 6a1803df08f44-6df9b1cdc5emr216926856d6.2.1736620685332;
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736620685; cv=none;
        d=google.com; s=arc-20240605;
        b=DQfiaCEdZxX0ekldqZah5ksk3uQi3C+InBROTcVTcpVhraj9Xkn84rInkfuWgwcxOj
         knP2/QjfcnwOoRV6xUjk/6YLGHRtZurpXztJLVszK2CWLbKeDGaRw4cecGxi1587vNuX
         2EJCDyL7HBOXqTYXGm1eNIpUF28Pojdbaky+TJzFjpYjfJ7R8yaqcJvTleos1y7/yQ/M
         bWEQCOtgWj/HkDU1O+vn0HrH1u18VBUesm8iZ52AKM7g0oDAAZWL5V8UDYkyZ+JxkdEZ
         NFvSJFqtltN6sQIo7n1DNHUR5fzw9IDPl61rXs60Kqdq6Nwoj3jGMKM/YSgYyIMIYjPa
         RBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R/tERnEf151hNEi6zGx5nXkVFhrCrMCbXniKbPQ0RRM=;
        fh=s75NFAnuhFzX363GaCwXXnwrdJAMLJzatRjiC2nTgjI=;
        b=lnWDf7umMLIobXtBRlgi1gwOWopQSpZ+NiF311tEgVCOJWSr4+z+UE1xujteZx4PhT
         ptV1KPOMYuEfvXLC4EnLqPi7ewfk1mkALaEN4O1o8mFzrOMVAFusTvQ4ZgpWj1LvRdiV
         ja6wLh5Q6gtboky9I6MhXKS6dJW3KiMrpWRaHhEdSBNasRYMK7F8U4TX2VcTbmeTg4K3
         BQwTjY1xqR9KlFnh+yoG6o2TmO/LB1MFnj8RWUD2dy/T6mgmCjMAgv6EpiQxvaFrlUKU
         5FooAFDkDmbsHGgtti55eKLAHVQMyzHWFd65kwclkgvRMhloo/fVSzKhzovwwrpXXXAr
         Vjzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=caFhd6xh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae0106c1si51059606d6.440.2025.01.11.10.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 10:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=caFhd6xh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tWgMe-0007Fv-Gn; Sat, 11 Jan 2025 13:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMd-0007F1-27; Sat, 11 Jan 2025 13:37:39 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMb-0003ww-F8; Sat, 11 Jan 2025 13:37:38 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so4408456a12.1; 
 Sat, 11 Jan 2025 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620654; x=1737225454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/tERnEf151hNEi6zGx5nXkVFhrCrMCbXniKbPQ0RRM=;
 b=caFhd6xhxHxZ5ZgUeJFNiPr6KZFddnMyY+W6zq4hSL5OeAXomGP8SeHl8EV49B9oCF
 S8uB9nIVpcRCeGkxNd4CEbf1UIJG3thIy/dyzdlAKQrMDjLe7iJ02QrZ8dB3VOZZG04h
 XrmjZwVi8cUvFDHDM2xGqvCwoTwP81oPlnBnDAPImOGLNcgGhaiw8tEcWXItNa+s8G0t
 B1mFottdebaPntALGfm65ZIXQp1qdxYJmzj7l2AmhynJZRl0ZPndX2x8fbOoZ6NTQirY
 AEQ03YzCX/yyUZxxc6SnqN9pNv3u3KhNITaNzPTVtZM12WEZcbvQsawyGhiCepi04DpX
 D1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620654; x=1737225454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/tERnEf151hNEi6zGx5nXkVFhrCrMCbXniKbPQ0RRM=;
 b=hrQ2xjhY0kZNfNhJkwpmFo4jYjx3s8kRKOE12Cr9/v/RdFlQZRznZLcKYJm+Qj0sYh
 0FeljK6h0MjK+YlyQnQeCaTQvdq5DL3xZWKXbmBMA1L49ZmQqt3bNMgzD7f2nYKtgF0t
 pOoW83d+h9G353V9bmsP8aQQEOTBAnpaDnUmKblo4gRui/oyTetFgHYp+t/cFHv4fLbj
 sxP2Zl5IMyQfkXGozEohmNM7hhbftJ1am/HhFpszX27Q0gOff+vregxUy5lhVFbdAoZ5
 a+L86dx4INs79Z5fkFa1gWQzMG5MMt/dwCCCbeBlzlZ4h/I9n1zMHhJSE2JatOcTH1rj
 IxJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUVP5HAZtxo2qW4oMjMd5QGIuCZBGhpBL0Eu/qMDabMPzUCbKVFIGw1P2XBu05F8U0/a5i/bcNcA==@nongnu.org,
 AJvYcCXP+igcL7uWYGnCClhWePJZgFF9lqM6Uee0+vdhvrv/cKA+UdEwY12dE8S95yLrcSB3Lg8IGYgnDMd1Cw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/bvPYcfU2Q9dGpdFLH5xCwW4srE8ZLx/jyCZxBHiES6eMIAYY
 Y1NGUFGIMbSRS8VU2L6mME9D/bcO3cLTEqj6j4DpykfnHXTeAdBhmmId7g==
X-Gm-Gg: ASbGncsucr4iTRYc5GqtJtSdLUH/PcLsiZY8+MgcL7jdwav2jOe/pf+A7onKuq+nCpE
 c3KpwlgyqwQkCdLuqhOwDuX0wBIYNZT85Pf/HZyVxZLfu6LT2g5vHdazf59LxpgkKWigHN5j2ax
 ZIfoNkKWkDH3ywqQlYeiihhWbh1uKXhBgEj2W7hDxmmHUUiQfxlFprUuE40/WfTuCD7nANBMsMm
 DbtiE0KO5SVQJn1+Wuuhm0AXvVp0BON6l3UdbHqogkJ/wiXleSNx4o+GovmuEqQtYoCj+FCsSBc
 jJQVlVc5FZVYHWZqzGgr/yyWbvEW1iFXUW7xg3DXVHI=
X-Received: by 2002:a05:6402:4310:b0:5d6:48ef:c19f with SMTP id
 4fb4d7f45d1cf-5d972e708a1mr34427106a12.29.1736620654248; 
 Sat, 11 Jan 2025 10:37:34 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-101-099.78.54.pool.telefonica.de. [78.54.101.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af187sm299026666b.142.2025.01.11.10.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:37:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 11/13] hw/i2c/imx_i2c: Convert DPRINTF() to trace events
Date: Sat, 11 Jan 2025 19:37:09 +0100
Message-ID: <20250111183711.2338-12-shentey@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VfRZZx1zuiJM

Also print the QOM canonical path when tracing which allows for distinguishing
the many instances a typical i.MX SoC has.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i2c/imx_i2c.c    | 21 +++++----------------
 hw/i2c/trace-events |  5 +++++
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index c565fd5b8a..d62213b9e0 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -25,18 +25,7 @@
 #include "hw/i2c/i2c.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-
-#ifndef DEBUG_IMX_I2C
-#define DEBUG_IMX_I2C 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_I2C) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_I2C, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx_i2c_get_regname(unsigned offset)
 {
@@ -152,8 +141,8 @@ static uint64_t imx_i2c_read(void *opaque, hwaddr offset,
         break;
     }
 
-    DPRINTF("read %s [0x%" HWADDR_PRIx "] -> 0x%02x\n",
-            imx_i2c_get_regname(offset), offset, value);
+    trace_imx_i2c_read(DEVICE(s)->canonical_path, imx_i2c_get_regname(offset),
+                       offset, value);
 
     return (uint64_t)value;
 }
@@ -163,8 +152,8 @@ static void imx_i2c_write(void *opaque, hwaddr offset,
 {
     IMXI2CState *s = IMX_I2C(opaque);
 
-    DPRINTF("write %s [0x%" HWADDR_PRIx "] <- 0x%02x\n",
-            imx_i2c_get_regname(offset), offset, (int)value);
+    trace_imx_i2c_read(DEVICE(s)->canonical_path, imx_i2c_get_regname(offset),
+                       offset, value);
 
     value &= 0xff;
 
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index f708a7ace1..1ad0e95c0e 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -56,3 +56,8 @@ npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s
 
 pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
 pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
+
+# imx_i2c.c
+
+imx_i2c_read(const char *id, const char *reg, uint64_t ofs, uint64_t value) "%s:[%s (0x%" PRIx64 ")] -> 0x%02" PRIx64
+imx_i2c_write(const char *id, const char *reg, uint64_t ofs, uint64_t value) "%s:[%s (0x%" PRIx64 ")] <- 0x%02" PRIx64
-- 
2.48.0

