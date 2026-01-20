Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B28D262A2
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viJ0X-0007AN-2z; Tue, 20 Jan 2026 16:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3d-9vaQwKCGgTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1viJ0V-0007A7-OC
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 16:11:23 -0500
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3d-9vaQwKCGgTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1viJ0U-0003l7-55
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 16:11:23 -0500
Received: by mail-dl1-x124a.google.com with SMTP id
 a92af1059eb24-123377038f9so557397c88.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 13:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768943480; x=1769548280; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o4RAqyXrLAo+0kHfcx+F4yi90mTR8p4gv7hKCzK+Od4=;
 b=Mrcl2c6mfRE+8IKr5/MNnHGufgvQiRhRLmlL/aJCGtm3UPEtrOvLJLDNxxKkpmJkuE
 m4+LkRSsJ513iJVfgGZoWNjv7yB/XWndOsIn6LuGMf+4DDQd76cYawS5H8kKLKGsQ7k1
 r+S584fjOoc08wOrP4lluvPFbDq/JC6ZgxadYUvyJET9RH98/NFxxHZeRfzAKZcAgPok
 9mE2wupUo0IMWpD+oy1o526/qC9fg9aXNigiVBJM0qedh+83aI+9T/b8ewO2PJN2lKUA
 JI/UJAVSO/p8b1/E5icvJ5aLYettJ4OgdkUVYTvBsuUQD9MKR82FdGqX/sPbunv/TOrn
 okGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768943480; x=1769548280;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o4RAqyXrLAo+0kHfcx+F4yi90mTR8p4gv7hKCzK+Od4=;
 b=E98IusoBHhJitpWocqz2UUjw4cuPx5BqFrK/MNKIShA9/7O3QTJ3HhVfOjcESncM3E
 qWPYBd5B9ICi7y/W5NkFsv5yg/2nOM7/izkL67tpzwQ3I5WdQ8g/S1YLwZLz42YpIfbW
 KS9sLfOJ2vciWIBhw/k/THH127M1vxmdqmnF6nadT/kwCe27NRQcqjWH07T/HBQUgwvm
 04J0wholJOfFdynvU2NrQ+32/dZONVaHHDk1qZCW+dYZKIssMFb8dioRcYF0FDlZ7hB1
 0zOWMhpDo0e1172DubqvXkr7zRcXPndgNpU/FPULpoEuFoZSCSfi4AyFfW6QLNurpgLF
 Cebg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIG0PpBgQU6SOfD/Iu8Yl3kGnTda2VViA6w0o8BQfELiISjYPSHf6F8stvVROFRHBp0UWKTRF/VQ==@nongnu.org
X-Gm-Message-State: AOJu0YwPocePtJwnEFJ6tAxym6dD0PZDdwk/FNddl2SGau/O0N8Jv+CX
 W44s/9XA+pKJSf8rroHN6iKsz7nrI9RRnPnnYLVm54DZ1eaEwY6zKu5FMOpOXBNkbYmrujBLqHN
 Nk3fJ+mWJ67HnGBNP+y5NTCMO9j+z+Q==
X-Received: from dlbur6-n2.prod.google.com
 ([2002:a05:7022:ea46:20b0:119:78ff:fe0f])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f90:b0:123:2d4f:ef1d with SMTP id
 a92af1059eb24-1246aad1621mr2228767c88.30.1768943479968; 
 Tue, 20 Jan 2026 13:11:19 -0800 (PST)
Date: Tue, 20 Jan 2026 21:11:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260120211116.1367476-1-nabihestefan@google.com>
Subject: [PATCH] hw/i2c/aspeed_i2c.c: Add a check for dma_read
From: Nabih Estefan <nabihestefan@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, steven_lee@aspeedtech.com, 
 leetroy@gmail.com, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, 
 joel@jms.id.au, qemu-arm@nongnu.org, Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::124a;
 envelope-from=3d-9vaQwKCGgTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com;
 helo=mail-dl1-x124a.google.com
X-Spam_score_int: -97
X-Spam_score: -9.8
X-Spam_bar: ---------
X-Spam_report: (-9.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

If aspeed_i2c_dma_read fails in aspeed_i2c_bus_send currently, we get
stuck in an infinite retry loop. Add a check for the return value of
aspeed_i2c_dma_read that will break us out of said loop.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/i2c/aspeed_i2c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 1b8ac561c3..3de72db652 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -272,7 +272,11 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
         }
         while (bus->regs[reg_dma_len]) {
             uint8_t data;
-            aspeed_i2c_dma_read(bus, &data);
+            ret = aspeed_i2c_dma_read(bus, &data);
+            /* Check that we were able to read the DMA */
+            if (ret) {
+                break;
+            }
             trace_aspeed_i2c_bus_send("DMA", bus->regs[reg_dma_len],
                                       bus->regs[reg_dma_len], data);
             ret = i2c_send(bus->bus, data);
-- 
2.52.0.457.g6b5491de43-goog


