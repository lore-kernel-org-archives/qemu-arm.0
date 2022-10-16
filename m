Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1707315ejn;
        Sun, 16 Oct 2022 05:29:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pDUoVpSYySxLbzvkBAckPrEvhdHthsIT1q5NxQJQF/RBEQ/mfGZOfEQo5ESuC+xgUxG+W
X-Received: by 2002:a05:622a:290:b0:39b:d1cc:6c90 with SMTP id z16-20020a05622a029000b0039bd1cc6c90mr4953126qtw.512.1665923344275;
        Sun, 16 Oct 2022 05:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665923344; cv=none;
        d=google.com; s=arc-20160816;
        b=mKzljdRfI1knT34uZJfwp+MPaFyr0RLiGlT9D5P3JtXIxcFIffmRkB+Iddf2rBZLna
         YCpHbh8e2O96lZMFCAe5wueFudOPNKngknRnRrgE1yivbwXo+z125w+1LvoWbO4NWRyo
         +ySJuNpFQBA7fG3OhjMwZfd7c2gYD9zTl4z0pt2lRuzOENClJ/gj/BbWOzv6cJwwDJS7
         jB2j/HOVeQBtyBdYMEEt4NrzfAiUg6WEwuc1f0bF2xr+pLpo3kkoXuH2I8nz5HwGWaPt
         5szag7g++55MAF3bVU04i5CUVx7V7jqrUXIa1jEykfxhxR0fO17MDJEtz85tsl4H8ufW
         PQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7YchITTcnUYZ4WJgcEjOn1WReqvfHLeSxHYKWWHpblk=;
        b=iKjau6FgLRMuj7ARy+yZ6YQIR4NQxLTw6mghsHcY36eVT5F6KwolY8lXMByNSVPVr7
         6xh5FoTBQhv9PCDAfEIrQuzVMnjRQB0BqKwEjjipKBkqYteQ6/x4RtrYvuvkS8imRdOY
         ak+WU3Z4m6B0ZAcw+UAT33a1QpKIv7EZ45os7U4LXxCa9K2+hgNug40ytsTG7/rI4Q5Y
         BgE1ShKLRuVnDODu/C7KhtNj0N/CHilxK/S0d4AZTnztXJF78m0A36VFrDIRHENsN7c0
         vE6vHx66xQCijuCKdWjpc19dXPpuF9h+82EQOtvIS6gVF9RQrt5Q1khjNm5FalncMHaL
         Oo9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IP0zpxt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu6-20020a056214260600b004afa9a702f3si748794qvb.177.2022.10.16.05.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 05:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IP0zpxt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ok2lL-0002Uq-Oa
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 08:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2kp-0002N3-BM; Sun, 16 Oct 2022 08:28:31 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2km-0000Ov-Uf; Sun, 16 Oct 2022 08:28:31 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ot12so19484645ejb.1;
 Sun, 16 Oct 2022 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YchITTcnUYZ4WJgcEjOn1WReqvfHLeSxHYKWWHpblk=;
 b=IP0zpxt9G8jSSrBk2LYX9rA1kWXXYZ9bf9SND67EEULKT4tUQ+yBYkX9Myp3BnC/Hw
 3ripGqQzgN2oG1MvvPnI13vNgn4zijnmMyz6n77MmH8JB2azD2h1b0AZ3UEteVt9WnIX
 geFv806QnCjEUqMENIcjLYiHhOStPw8VEH+ag0y2KRi7Jwqzd2pbuWqHh7/HqO5audBj
 S7YGIiqm6XesPfbUzf9hjuhOwQW4JHTFjSsGj+vzMWqCW6yfXoCi+D4E66jPgX+Sbwca
 fj+Lf3q3Lz0piTG2miiV7UPZHILb+/kJxS43PzTNbUTtHbalJqvQ20WIJZSsqFinRNAu
 en0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YchITTcnUYZ4WJgcEjOn1WReqvfHLeSxHYKWWHpblk=;
 b=1pXxFEGE4RK22gx+B96ZkZQAvglUqva8O5QGF4n+T5J+e6O2bBiF7jYj3bl01yhhsn
 EY3NcScEDCRHoCZw2JK3K0nLgilZoScnxIYZxitVkLfo4GOUaRAbtrEywtyh4Hyo8gaL
 QxketiKCoIE/YGKx5JsjGnARvJFQwzbbL3It1A6scJMLtUNQxGMoRo48qcSdGH3gpl5+
 Ov7f7lHSqMTa/2ZsKuYKcK5aVNyekY/WZqmMIWpr52L9kBYtyK+M118R2aiaOOQzTQ9F
 eE25asvfmJlEMsjnTbn77doBiFb+ukMKkEz6lB92bHgTod2Tbb8ASv9REgdf1qGjMSxu
 bSuA==
X-Gm-Message-State: ACrzQf3avqI3BuqtKVL5YUJ96WMKpNFKGlVGwzieaWPE/Kq0Do81mHoW
 HArlAPtL5g7naJNtUK8YKzEIaX234zU=
X-Received: by 2002:a17:907:8a23:b0:78d:a24e:a9aa with SMTP id
 sc35-20020a1709078a2300b0078da24ea9aamr5152391ejc.404.1665923305365; 
 Sun, 16 Oct 2022 05:28:25 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 1/9] hw/block/pflash_cfi0{1,
 2}: Error out if device length isn't a power of two
Date: Sun, 16 Oct 2022 14:27:29 +0200
Message-Id: <20221016122737.93755-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zz6gHDfbxKXm

According to the JEDEC standard the device length is communicated to an
OS as an exponent (power of two).

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 hw/block/pflash_cfi02.c | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..9c235bf66e 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,6 +708,10 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
+    if (!is_power_of_2(device_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -865,7 +869,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl);
+    pflash_cfi01_fill_cfi_table(pfl, errp);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..ff2fe154c1 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -880,6 +880,11 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!is_power_of_2(pfl->chip_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
+
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
                                   pfl->chip_len, errp);
-- 
2.38.0

