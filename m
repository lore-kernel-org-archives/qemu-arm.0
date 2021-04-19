Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1007860lfb;
        Mon, 19 Apr 2021 02:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+I8zCCv2+GTGAPhSyr5GI4cxoJChJBrBKMvWPBRH1RShEBL5WeP9uPL/dgyCTWj6fMm4h
X-Received: by 2002:a25:9c83:: with SMTP id y3mr16269214ybo.106.1618825795902;
        Mon, 19 Apr 2021 02:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618825795; cv=none;
        d=google.com; s=arc-20160816;
        b=1JYIB/QGB2QkuQRXjL+pfjlLSx1W0jSteIrH3pXNQNEIWvJ9ogiY0jAWKloEoE7Ejw
         BQFZNHSKJBk5eiCcOS/9pGZaNcwhdAR19xPWMV6y+HSg2JoJQIgEeXHxCU3OMALC0HtY
         zn07AYVcGBHa2PrnTHEH2e2TwJV/7NAF1EeNL5uTWAtHi614UxzHkMjR+Fy+YYvW/2jt
         RPlMN4rkQqltUjylP9/KOzUp7uhVktPdqgfFz72ABnQgw7J7rkEjsEYXHU/m4kdTfRll
         ZPBGMRIA/k+tzePJ+r6oZlKJTLtZeLmituV1ViHIFZKdOC8P0QoeU5B021l1BJ+p50TD
         4xug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wGahhPByYM3/GV4I+MipmLSfFtBrhhdK0pNeulGHnOg=;
        b=kF6NUnjiQ34Od0GT6vn/iDgnmNYxBWOnThZWRvdLcuniwULnBn5d5Z1G3K0DYVA5de
         NqtEaKoZXtKIxpukkroniN1eMQUHzJCHYSb4WWfhI+HFkJKjxeGp1x8Rdx8JIaCGTmQE
         QDg58FtT4aaa15JYwZBEdN3fx61K1TsP2kHD0hYJ49M15N8hvTi290GDpm016CWER8AX
         /CMHWCGUnQsTUGRJ1w3fZaxPn01cu7nHf3cvK6MF6ER7JUPRGI7Q8JcaHCfbUR9M6NEK
         5z6TNmP4hsaH1JwXYt0sRarJSlfKfBRRFr3RjIQV7QL7ZcN70rTAOLV781wGHu6+pxiq
         +FPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rLqVoY70;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si14497233ybq.214.2021.04.19.02.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 02:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rLqVoY70;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYQXT-0007pM-6A
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 05:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRl-0002Jq-3X; Mon, 19 Apr 2021 05:44:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRj-00039e-Gf; Mon, 19 Apr 2021 05:44:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id w186so13269766wmg.3;
 Mon, 19 Apr 2021 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGahhPByYM3/GV4I+MipmLSfFtBrhhdK0pNeulGHnOg=;
 b=rLqVoY70nGRtxd4t+4gNmXqpZ501xpYtqx0+gTRHJl+q/TDR0WKwomF7AX+z/GnYA3
 hYIIroyGfy1UEKVnpKE2dozXwLhPy/JGv6lODL5jR3R0IKk1me304GZUXefeZRN5ll3w
 JhCLWCg52Zq6fAw+a40LxUlS70mJH4wCU7DkUM3pSxtd1ddcrX0OCosPT90ToBHqg71P
 I0v1Kqv63i0qqZc+qUJfpn2HZ9qwpW3kMm/c0QpWzsO4Wen4vrnPlyq+CuYXHGpefi2v
 XIUkSK5DWAtjycgzK/L476Z10jjjxoGs5Cl4m1qiqGFpatAWa1sU61l1wnIBc68RHNWO
 levw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wGahhPByYM3/GV4I+MipmLSfFtBrhhdK0pNeulGHnOg=;
 b=iNHCqYnyNZmy0cz1FYFq+9A+/Z4wgzdT95bZKXKncVZi62jFHKuDDcIQpQ5q6F3BfU
 ZkO5EARnvEn9krpT6cZE+dsRIZg1VzdkYhaZGV14Bia86lDwcbz+yvE65SfHO0oATxea
 r83quTQVOx+Zda7unhqVYwwDGyCkc1Bnr1k5CQm7TH1GAe8AuWZcW+DJ2175ZhCyW0XD
 oKAD7Sl4cb9t55rTVN8sH7iZnZFIe7K6nhPW8Ko61BJuCLpBUACiYuVS501M6Abn3IIZ
 05lN2XlgtVNDTpdcA0UUns55OusDKKhzwGr84SDYtzjJCFba8JrdyWcspyvrKSFXI3xy
 jOHw==
X-Gm-Message-State: AOAM533WiDsgUAZjW7xrGDwAxeecrXayfWljhCt3JeDxJpawSBgXXIq3
 SqmVbyO3cigMUNqsa690gTLXxIfGIcUSJQ==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr20924525wmc.150.1618825436271; 
 Mon, 19 Apr 2021 02:43:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm8780039wri.41.2021.04.19.02.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] hw/arm/digic: Map flash using
 memory_region_add_subregion_aliased()
Date: Mon, 19 Apr 2021 11:43:27 +0200
Message-Id: <20210419094329.1402767-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kM+Yqw9bHHP0

Instead of using a device specific feature for mapping the
flash memory multiple times over a wider region, use the
generic memory_region_add_subregion_aliased() helper.

There is no change in the memory layout.

* before:

  $ qemu-system-arm -M canon-a1100 -S -monitor stdio
  QEMU 5.2.90 monitor - type 'help' for more information
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000003ffffff (prio 0, ram): ram
      00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
      00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
      00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
      00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
      00000000f8000000-00000000ffffffff (prio 0, i/o): pflash
        00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        ...
        00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
        00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff

* after:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000003ffffff (prio 0, ram): ram
      00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
      00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
      00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
      00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
      00000000f8000000-00000000ffffffff (prio 0, i/o): masked pflash [span of 4 MiB]
        00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash [#0/32] @pflash 0000000000000000-00000000003fffff
        00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash [#1/32] @pflash 0000000000000000-00000000003fffff
        00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash [#2/32] @pflash 0000000000000000-00000000003fffff
        ...
        00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash [#29/32] @pflash 0000000000000000-00000000003fffff
        00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash [#30/32] @pflash 0000000000000000-00000000003fffff
        00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash [#31/32] @pflash 0000000000000000-00000000003fffff

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/digic_boards.c | 8 +++++---
 hw/arm/Kconfig        | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index fc4a671b2e1..293402b1240 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -128,8 +128,7 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
                          FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
-    qdev_prop_set_uint8(dev, "mappings",
-                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
+    qdev_prop_set_uint8(dev, "mappings", 0);
     qdev_prop_set_uint8(dev, "big-endian", 0);
     qdev_prop_set_uint16(dev, "id0", 0x00ec);
     qdev_prop_set_uint16(dev, "id1", 0x007e);
@@ -140,7 +139,10 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
     qdev_prop_set_string(dev, "name", "pflash");
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    memory_region_add_subregion_aliased(get_system_memory(),
+                            addr, DIGIC4_ROM_MAX_SIZE,
+                            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0),
+                            FLASH_K8P3215UQB_SIZE);
 
     digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index aa8553b3cd3..1a7b9724d6c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -42,6 +42,7 @@ config DIGIC
     bool
     select PTIMER
     select PFLASH_CFI02
+    select ALIASED_REGION
 
 config EXYNOS4
     bool
-- 
2.26.3

