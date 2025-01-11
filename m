Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp896400njn;
        Sat, 11 Jan 2025 10:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUq2UMf7WaXLYsSqQE9M3ABXRi5iEFz9DbTeNA9VwfC/5cMm5g5r6/0hodVTsVQ1OL+h+ekzFPXFFtaag==@linaro.org
X-Google-Smtp-Source: AGHT+IE2ExwiIBxRs+hWYzjeHVD6YvPG8xAFpfoVd51iMVOaKaaUlXvL4/EYJkv1BXBIQcu2WrZk
X-Received: by 2002:a05:620a:462c:b0:7b6:d4df:2890 with SMTP id af79cd13be357-7bcd97292a8mr2450207585a.4.1736620689426;
        Sat, 11 Jan 2025 10:38:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736620689; cv=none;
        d=google.com; s=arc-20240605;
        b=hiClOO3PP+iUf7UnFsA/+f1IGDuN5P3CQVmJJOY7wy0pj2THOB0PsY3RKqEfnwfQht
         ZKROY0DIaVn8BwfofT2tTDKVFe4Znu2Sz3sn2oI0hvlJx8uX/pzAbKHUmlYFO9GYcxfs
         UmTlDR9MKAHAUZ9oUsmSr3t+p6WBT4oIaWN2t0rlV0IroVB254RsrTjX46wyj+adpPB0
         cKjHHTVxNiCMP+WOMCw3SssTIUjDkVE2wnPipV6B+Hzpx5wJ5yAVbP9g/EuXspsDWrtu
         P/3uqiiTJqP0eCLfyd3gq8HQFHbBHuaCFIM6X/WRPv84ntqDoV53qLTDsBbtBVUFrZ1W
         0chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vwaUYglCz5HiwshtDxMwHXFy/Vt9VTZk7BnhuaVWzvw=;
        fh=zus4CKnK7ycf6ruA3lCioYRohvmjzy/OdlTHzpDmaFg=;
        b=O/Fo6T56gMCdxV9Czn72g4LV1Ld3cWX4sOflW+UOByFB/laEtyGL+Xyi7xcTXx+dE1
         XkgoaSF9Bo7EUhG23T8TnLZFnZngWNTifUDIeAj6TapjVYHCnHCZnw8WxXHlb36+1m97
         lH4LLZf+AIfrUySEIpLfRz4wAV08prkMVOnTMSetxTLRaqj940Cd9Rd5Kv3U2p+7fuXT
         Mw9gy8dqAcNuqozH5B7DbZvkeefYDlyjasVfcwTKnRXUSDsDnR4/I5VeHqcKkUmC5RT5
         Bu4fABbdPmmZVr4Cnmi1VvPDLAEiUXyBApGE5x4gFDS0esUmHVsEwoPWeFI1mbTseOax
         +sXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuPuejRk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a111si767845085a.91.2025.01.11.10.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 10:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuPuejRk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tWgMY-00077d-T6; Sat, 11 Jan 2025 13:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMV-00073c-Ns; Sat, 11 Jan 2025 13:37:31 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMU-0003vD-5e; Sat, 11 Jan 2025 13:37:31 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so568967166b.0; 
 Sat, 11 Jan 2025 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620648; x=1737225448; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwaUYglCz5HiwshtDxMwHXFy/Vt9VTZk7BnhuaVWzvw=;
 b=SuPuejRkb7fDDFdM/moA3irk6BRSLKbjABuONAm/wiAIPh0n5x5a1kSJVVFCHYtGKi
 ML2hk8CT2UCPEj8p6RuTxP/h29ut4u27DF1iBCUuDBlhtD4aHtvNI26Yn4iQlAhyTQuO
 TiYWkPzeE7gqbLpOg6D93MAc4UArH2g/uAXgM90lH7lG2hRIqgxToJjZfgH5YbFPgPUO
 VeyOJxyAPNUrJM8AcQiABQ4O438Mz4TTbpqc208KebXsFxYieiKaGOKPZt/1NFWvXAmC
 t/3ZOi/UIXi/Zz0ClhNuEuLdphdNYTyFWUNfJlVwfuCXUnZme7Yxq7VA10FiXZq0XYeD
 2WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620648; x=1737225448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwaUYglCz5HiwshtDxMwHXFy/Vt9VTZk7BnhuaVWzvw=;
 b=MW3UCqPgmkl2ial6U/M4Yx13FgBNzNgLs6+iX8ZmQuJNN3WU8mM3oywNq+/Wkygb8M
 jUqGygX35nTVMo9Vc2FlNToeZZS+LMAxZWYG+eZyHrAhmsCrGSWHMYTmIi1esjPGZoQV
 0z9A8MzmN4h6vSXgsdZ5U/zrL2oyq8xvth+TOtZsZZ8t2r3dxLEggYMph/MxP7XsrLJq
 lL6kMdQL40pl0RqTVMBg29VCmR5NNKHjMpFDw+VcFI9hAJLHsZScDDQoijZ34XXZ0Ph5
 BXvD9ZNdX/TpSmQ54dpzsXi3m+l+K1iDNuXd1MWFPjbQtGYzh+lB3tKazReoIdk7xkbI
 z/gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhSR9zuRDxZigCsKH8rim1UrvKXJTmc3xOy52JgZA6C6IXHEBvK4ruI5uKtsuzARN0hKtc80fS2w==@nongnu.org,
 AJvYcCXvUFjSPNQBxHoKJi76LZEowhFjCEsBN/80QuA894e+jLoOIw/z1XeA3KCvrhczrF+giZCSD4CtDArvqw==@nongnu.org
X-Gm-Message-State: AOJu0YwTjqc164HoWh0eTHrZJ4q5e0FE48ouo+PH7FmaBKxdvUB7yYr2
 eM9ODGXi754tEdsxLKzbqOpgRBPHF5kTstDXWq9JNea/x3h7Ht27YIFb/Q==
X-Gm-Gg: ASbGncvrlGvbB+kHO9za4b3PFmpaQ6k2l6yMIzFpxdozA8i+k/iQHZJZ0UYA9g79LWs
 YwvREkHTkbs6jI7P2qlHsXs0irmS6fFEeN1fu8toOYrj5tOEUVM0j3qF6lEx90RBBifn0a6F8tT
 9bJeakdmihRkxNDYks5s3siNkISxdOvfzLhJI2yxEJ8iZplHADl+H4UyXfKZr1yJQaSTeRWhVS2
 JuSCrcYUk196hNnO/CVO/3SWyyA+DsaaJxQ4VsBwlEIqr1R15pk8G9VlrT9KxnV9WPaHl/hYdqd
 7WTi9yAnGCzgg2RFRDOms9MsooToKY7ggnzBIEdeluE=
X-Received: by 2002:a17:907:6090:b0:aa6:7354:e926 with SMTP id
 a640c23a62f3a-ab2ab748ed0mr1428185366b.36.1736620647533; 
 Sat, 11 Jan 2025 10:37:27 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-101-099.78.54.pool.telefonica.de. [78.54.101.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af187sm299026666b.142.2025.01.11.10.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:37:27 -0800 (PST)
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
Subject: [PATCH v2 06/13] hw/sd/sd: Remove legacy sd_set_cb() in favor of GPIOs
Date: Sat, 11 Jan 2025 19:37:04 +0100
Message-ID: <20250111183711.2338-7-shentey@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
X-TUID: FAWUaguogCDb

Commit ce5dd27534b0 "hw/sd: Remove omap2_mmc device" removed the last user of
sd_set_cb(). Rework this functionality into GPIOs.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/sd/sdcard_legacy.h |  1 -
 hw/sd/sd.c                    | 31 ++++++++++++++-----------------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/include/hw/sd/sdcard_legacy.h b/include/hw/sd/sdcard_legacy.h
index 0dc3889555..a121232560 100644
--- a/include/hw/sd/sdcard_legacy.h
+++ b/include/hw/sd/sdcard_legacy.h
@@ -36,7 +36,6 @@ SDState *sd_init(BlockBackend *blk, bool is_spi);
 int sd_do_command(SDState *card, SDRequest *request, uint8_t *response);
 void sd_write_byte(SDState *card, uint8_t value);
 uint8_t sd_read_byte(SDState *card);
-void sd_set_cb(SDState *card, qemu_irq readonly, qemu_irq insert);
 
 /* sd_enable should not be used -- it is only used on the nseries boards,
  * where it is part of a broken implementation of the MMC card slot switch
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0330d432fd..aa8d86e1af 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -820,6 +820,16 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
     return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
 }
 
+static bool sd_get_inserted(SDState *sd)
+{
+    return sd->blk && blk_is_inserted(sd->blk);
+}
+
+static bool sd_get_readonly(SDState *sd)
+{
+    return sd->wp_switch;
+}
+
 static void sd_reset(DeviceState *dev)
 {
     SDState *sd = SDMMC_COMMON(dev);
@@ -865,16 +875,9 @@ static void sd_reset(DeviceState *dev)
     sd->dat_lines = 0xf;
     sd->cmd_line = true;
     sd->multi_blk_cnt = 0;
-}
 
-static bool sd_get_inserted(SDState *sd)
-{
-    return sd->blk && blk_is_inserted(sd->blk);
-}
-
-static bool sd_get_readonly(SDState *sd)
-{
-    return sd->wp_switch;
+    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd));
+    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd));
 }
 
 static void sd_cardchange(void *opaque, bool load, Error **errp)
@@ -1034,14 +1037,6 @@ SDState *sd_init(BlockBackend *blk, bool is_spi)
     return sd;
 }
 
-void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
-{
-    sd->readonly_cb = readonly;
-    sd->inserted_cb = insert;
-    qemu_set_irq(readonly, sd->blk ? !blk_is_writable(sd->blk) : 0);
-    qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
-}
-
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
@@ -2727,6 +2722,8 @@ static void sd_instance_init(Object *obj)
     sd->last_cmd_name = "UNSET";
     sd->enable = true;
     sd->ocr_power_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sd_ocr_powerup, sd);
+    qdev_init_gpio_out_named(DEVICE(sd), &sd->inserted_cb, "cd", 1);
+    qdev_init_gpio_out_named(DEVICE(sd), &sd->readonly_cb, "wp", 1);
 }
 
 static void sd_instance_finalize(Object *obj)
-- 
2.48.0

