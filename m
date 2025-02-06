Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp669614dlb;
        Wed, 5 Feb 2025 17:35:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOcPjBMYy3mQhYZozoCB5Y2x893EFjE6lB/SLoU/qh6AJmt7MrV/HAKCf7AruOsN5CPwkkhh1dpY73wg==@linaro.org
X-Google-Smtp-Source: AGHT+IEjaRJig+zxzH3LYtSi1xmxlHmj7Tr0dCwqPXoVh4kagyWKapW9TAtZIYRboEwrro+1RLUQ
X-Received: by 2002:a05:622a:1a13:b0:467:528b:fb87 with SMTP id d75a77b69052e-470282e99admr64522201cf.48.1738805717434;
        Wed, 05 Feb 2025 17:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805717; cv=none;
        d=google.com; s=arc-20240605;
        b=RX7IB14LJ94JYqHcpRJYjmbkN8OJzWQN2B6CxAPf76nMUj90Azb8aAkUdFo3sYfiBJ
         Z0euhLok8ldJrrntGIyYLooyXTjZfJMZ2i8AJXdn2EXkNWYipxoYT43+jn4fjdU8hpQS
         roDw5A6CzYR8BVKSi5OpLhL3nZb/po5lAl9gD1ZzOGP+vYL995vSHzsYB3fYgUJlR2f1
         egECIZk+IB6srssEO2nLs34zSH645Nvh1XI55PMUBchVi0WLWTOuOCVnzVF5Kdf7LLDI
         PICZpuzI0XXJQy61gzkg9y+NM4ENUs4oX34LG3d4vvlUL39Xj+gTQg0dvtG7Ci0LFTa0
         FIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=NiNNDrxtbn3MfU51n0qcg9RV04+RKFFNZ2cs0/SK/DI=;
        fh=zEsyXHM5341ZmEZeRygnyMNFMy/uCeaSHp0n2rhaj2c=;
        b=D/TkybSJmfrIk4wQI8patAyHHeOWwl4BESog5+Nl7ROI6vjwo7vCprcu+8bg8c8oVH
         CwBkg3lbfKDPIuMXpfRLGx93Nq4GNUCkyyf1IC0v3eaGmS1FdBD7gYH+nfYLA0TU5ziy
         2FDd8m90a4OJ+4hldpH7gUpYUAK4Ly8ieHCER3Y5tt6wl228Obg1ZnCdU7+B21XjJIdi
         SRNaVGtUUFD479MQyeJKJjOgL6hvhs9YuU/nO1nw8hc6flh15m3tDkkc4fBvckItb7mF
         zIZYsiSov18LYQRBgvle1XMB9C2AKhABYoV3+wHzMmwqR5FMRwPkhHvWeiQpLFyUH8y+
         l/IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qloyxw0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bc4a41si1438491cf.548.2025.02.05.17.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qloyxw0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfqkg-0005U5-Cj; Wed, 05 Feb 2025 20:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37hCkZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1tfqkJ-0005Gu-78
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:32:00 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37hCkZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1tfqk5-0006ux-0A
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:31:51 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fa02125384so712584a91.2
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2025 17:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805487; x=1739410287; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NiNNDrxtbn3MfU51n0qcg9RV04+RKFFNZ2cs0/SK/DI=;
 b=qloyxw0/lBHf56vGdL/qx86NrRpVaGj58EKL/dBSFMu4TB95K5iXMw5uPxgfxp3x6d
 uTgKvKflEy5O/Luw8IBrs+Nm5lXWPo2IC1vY+8ir5/d/LUqoLSkrsJHHcE4i5UmGRe6X
 C7kbmECkjvsG7k1UhWbYi+yv9u8bmL41QvWH9URYGVZehSoliLCVRNDTLZzVHwb0bNvL
 zp6AADZ//QoNf86fR62eEKzi3mwcxo43IoNdFZ0coNkbK7vdXBdOMesaJHqzNY+TeQrU
 rJV668E73eu5rRLg5LdUor4zVBGKZ/hQy+B0rY55CJjaGYg2likUNROwwXngfuLTJjGf
 l7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805487; x=1739410287;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiNNDrxtbn3MfU51n0qcg9RV04+RKFFNZ2cs0/SK/DI=;
 b=vLZd85f6e3R6I0QiBIbe+tF+Ijv2gKMTvBE+ZYNuJ/uvg42DrCL7x58h97B3Kzli1M
 sU2q1+5JiQ8RlCPaopRZ9yOcP8U9AoUMjMOllo6L69wrqjIHn7+Z0818Y/uf3jgItXyA
 HpYcnWmkHLw+ib/7UcWFSZzSN2DLM0snPVOAu2i02367hHJtbxeM8HIEbcsiWkh6fD+t
 z5QLh/43Z2c/D4LHgqkiKJqT55vIOCHlI2K73qWWbMrzuqP+Y/iyy3YyEOuKzOz/BM8o
 o1xN5w/du0og0sA9Hk0BHCk0ziX7SKq51rWFEosJhCtl+NZONwxUCDF+51K3dnos6fTL
 6iow==
X-Gm-Message-State: AOJu0YzeZUOXdxwFYtwzHumRegwkOZ9Z1sqXzdraylFSsMA0nLEIBmgl
 pOT8xGfGE87+o/H+PZ6wNktZaylJrtJw2wzmFT4Lxv2DPtmVTx9pqxtXOYMO6HzB+ztC6z0yjAt
 XumPYZGycxA==
X-Received: from pfaq11.prod.google.com ([2002:a05:6a00:a88b:b0:729:9f1:663e])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3908:b0:729:c7b:9385 with SMTP id
 d2e1a72fcca58-73035103911mr6650154b3a.6.1738805486684; 
 Wed, 05 Feb 2025 17:31:26 -0800 (PST)
Date: Wed,  5 Feb 2025 17:30:58 -0800
In-Reply-To: <20250206013105.3228344-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206013105.3228344-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-11-wuhaotsh@google.com>
Subject: [PATCH v3 10/17] hw/misc: Rename npcm7xx_clk to npcm_clk
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=37hCkZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: EwNBrUeK6miL

NPCM7XX and NPCM8XX have a different set of CLK registers. This
commit changes the name of the clk files to be used by both
NPCM7XX and NPCM8XX CLK modules.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/meson.build                           | 2 +-
 hw/misc/{npcm7xx_clk.c => npcm_clk.c}         | 2 +-
 include/hw/arm/npcm7xx.h                      | 2 +-
 include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/misc/{npcm7xx_clk.c => npcm_clk.c} (99%)
 rename include/hw/misc/{npcm7xx_clk.h => npcm_clk.h} (98%)

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 554eb8df5b..edd36a334d 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -69,7 +69,7 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx_rngc.c',
 ))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
-  'npcm7xx_clk.c',
+  'npcm_clk.c',
   'npcm_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm_clk.c
similarity index 99%
rename from hw/misc/npcm7xx_clk.c
rename to hw/misc/npcm_clk.c
index 46f907b61c..2bcb731099 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 2e708471ec..e80fd91f20 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,7 +23,7 @@
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
-#include "hw/misc/npcm7xx_clk.h"
+#include "hw/misc/npcm_clk.h"
 #include "hw/misc/npcm_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm_clk.h
similarity index 98%
rename from include/hw/misc/npcm7xx_clk.h
rename to include/hw/misc/npcm_clk.h
index 5ed4a4672b..0aef81e10c 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -13,8 +13,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  * for more details.
  */
-#ifndef NPCM7XX_CLK_H
-#define NPCM7XX_CLK_H
+#ifndef NPCM_CLK_H
+#define NPCM_CLK_H
 
 #include "exec/memory.h"
 #include "hw/clock.h"
@@ -177,4 +177,4 @@ struct NPCM7xxCLKState {
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
 OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
-#endif /* NPCM7XX_CLK_H */
+#endif /* NPCM_CLK_H */
-- 
2.48.1.362.g079036d154-goog

