Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2085428njb;
        Mon, 7 Oct 2024 10:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/rO9CbopEr7o452xiqAFcQphac1rMxtL3GAv6kaDk82p53eXsSJJ0fI+vJx4KHORsz4mRHJ2H3cmrBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE0flaRsvCXZSX+sCDBNnooQABrtcftJhWWBQS76KtY6Yh5FerdDliHh9kGmrSLCu+MN1SO
X-Received: by 2002:a05:6214:5683:b0:6cb:99db:bdd6 with SMTP id 6a1803df08f44-6cb9a4655dcmr227445936d6.39.1728321499732;
        Mon, 07 Oct 2024 10:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728321499; cv=none;
        d=google.com; s=arc-20240605;
        b=iD9n/GssLt31223BFkb7UN+YRwxE+fikCq+v/XH24YiMapp8TynQ3oTBfQ9LvOwKzV
         N3FXwUnWaUoNPJfS4VnMRJcNp2RgWhkQRoqes7rB7ezCqBo9j55IrIxKIydwfJx283Hr
         f2//p7J9e5u/b1CAr7danpwQIqC2nFXnTcFpyhgULmSu11WLwHoGhKFU0ZsGKhZWQXj2
         Z/pofXfvwgOY/Bz/T+SrBJ6VgCaEIeXPyh/J5yO9vEHvuPJb7GADHs98BvGGDxBgzCtA
         l54M5W+unDDPPgEAJ7jQhs5jO9uEfo5DxsUfZW/BKYyzmZiAcvTk/olHOUSHJqBPtgzr
         lG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=GHz4rSRh9deAPG3dNxam4z9b4qhpmexnTmnPdSRsi6w=;
        fh=z76dtoHDg3sQ3sYobudDi+szcgloQ/gZV4jPurK/Yv4=;
        b=K0Ljhm1DHBvkTBHq2m8W30zL+WkD5Y/XqD9mf/YgJhkqcf8XDGKhVX9eNX2darcZyu
         dvyD0pH/9joI2zSg0XpMzJD7QnYHSEfiRl+gkOjfZrDYNWU4fYtFTkBun3Ky5Kgk6zLP
         oiu5tt5fxZUAD7jKHs+C5eonp8RK0YcXpxfZVYmrlRPheD/5j32zoZ6bZCvqbVUVfgKg
         QPIOqwVjdxkgiSp1EE/kQ1mkQ6UrRuwvXbFGZQzTMIOT8N4naccU912O2nlxZ8Pg/SdR
         xkgdzCTH1FNsXnp+ns1w9VGdPqEXpPz0vz13FDGnt079uG96GpCQCCRPftXJQlrVVDrc
         PaCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PGI3gXec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba4771a9asi67106466d6.413.2024.10.07.10.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 10:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PGI3gXec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxrMX-000370-CL; Mon, 07 Oct 2024 13:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qhcEZwYKCCkYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1sxrMV-000366-Q4
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 13:17:35 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qhcEZwYKCCkYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1sxrMT-00052A-RT
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 13:17:35 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e24b43799e9so4457915276.2
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728321451; x=1728926251; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GHz4rSRh9deAPG3dNxam4z9b4qhpmexnTmnPdSRsi6w=;
 b=PGI3gXec4TcfUzM3dYStTQRFVnghUvvJJ3Ugjls6vY2EY1ccAuJGu98K+SkU74lYKA
 T30xAavLHOx2LgQIY1mPfGXZtgoximYUUovkxJEXId/mDFuGNlZtxkX3X4jsHkJau7YE
 qA8k9XqsqOnuQG0z85lRZb2NfRmKKx777V6e45AHeX8pG6jhH5zy9TtIKqtaDtyjteFL
 /e9bxht7NQSWgujFmG9l6wyEDpTziDYHrrOnEIXvq0U4c9chKs0NO3sY4lpZRdUumDiJ
 WdJcD7enYgaiFD+s6h9a4aZU9TPT3OAMhl2rgTsItUTxe30u2fAicfY0KeTnstT9p6Aq
 YLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728321451; x=1728926251;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GHz4rSRh9deAPG3dNxam4z9b4qhpmexnTmnPdSRsi6w=;
 b=LxhPUJMwfW/3EQhxlkL1lCVZCQebWO07/v4VbwroowAMRnWTwajAhBWopHe5MJi3ff
 WBQa96Hkm9kFjFbuMCF63MY+ERqWYxbeU04iqIQ1GiHB1c57BSQMBOnsS3Tg5TOKMrRn
 dnxMV8+0Nwx85yZqeWvonFLyBQxWbdo6c/NEf5C40Bv4M7A6ZDiD7JWI9GGMudKinuRh
 7JGbFr2Dt4BD1I1711okznFYleAlnYhyC2KSzgc9Z7vVov2L6bFUErkQKbIaPJH3l7ou
 1NdNLyr4eItdrw/3Sw7ReWU3Hm9OA5tvm1EmxUBLmOOSBL886NzDw8sVfeIpRGNrdYWb
 LItw==
X-Gm-Message-State: AOJu0YytpSLtpyYilbE/02R6mrF43ROUnrLc0vUmmPQU2N5mJu4xhfmL
 UuH6848h5jqAVdxePS0Sb0QVkHUwPBbCV7f4dAAwToY3UocPMvDrXbuC3oCcL07yDA+eoT+u04v
 2MA==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:914])
 (user=titusr job=sendgmr) by 2002:a25:908d:0:b0:e1d:2043:da46 with
 SMTP id
 3f1490d57ef6-e28936d4d4fmr37111276.3.1728321450342; Mon, 07 Oct 2024 10:17:30
 -0700 (PDT)
Date: Mon,  7 Oct 2024 17:17:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241007171700.1594342-1-titusr@google.com>
Subject: [PATCH] hw/arm: add Quanta GSZ bmc machine
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 wuhaotsh@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3qhcEZwYKCCkYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
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
X-TUID: sUQLG55801e3

This patch adds the quanta-gsz-bmc target, a current Google machine of
the day. This machine will be used as a platform to enable features such
as the PECI bmc interface, and Intel eSPI virtual wire interface in
QEMU.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/npcm7xx_boards.c | 140 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e229efb447..e1ff5af756 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -48,6 +48,8 @@
 #define NPCM750_EVB_POWER_ON_STRAPS ( \
         NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_J2EN)
 #define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define QUANTA_GSZ_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
 #define QUANTA_GBS_POWER_ON_STRAPS ( \
         NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
 #define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
@@ -269,6 +271,109 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gsz_i2c_init(NPCM7xxState *soc)
+{
+    I2CSlave *i2c_mux;
+
+    /* i2c1 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548,
+                                      0x75);
+    /* pca6416@0x20 */
+
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1),
+                                      TYPE_PCA9548, 0x77);
+
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "raa229004", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "raa229004", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "isl69260", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "isl69260", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "isl69260", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "isl69260", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6), "adm1272", 0x1f);
+
+    /* i2c2 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2),
+                                      TYPE_PCA9548, 0x77);
+    /*         - channel 0: tps546d24 @25
+     *         - channel 1: delta,dps800 @69
+     */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "raa228000", 0x68);
+    /*          - channel 2: delta,dps800 @68 */
+    /* max31725 is compatible with tmp105. */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6), "tmp105", 0x5c);
+
+    /* i2c3 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c4 */
+    /* mobo_fru_1 */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4),
+                                      TYPE_PCA9548, 0x77);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "max34451", 0x59);
+    /* mobo_fru_2 */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 2), 0x55, 32768);
+
+    /* pca6416@0x20 */
+    /* pca6416@0x20 */
+
+    /* pdb_fru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 6), 0x55, 8192);
+
+    /* i2c5 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 5), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c6 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c7 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 7), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c8 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 8), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c9 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 9), TYPE_PCA9548,
+                                      0x77);
+
+    /* i2c10 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 10),
+                                      TYPE_PCA9548, 0x77);
+
+    /* i2c11 */
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 11),
+                                      TYPE_PCA9548, 0x77);
+
+    /* i2c12 */
+
+    /* i2c13 */
+    /* pca9555@22 */
+
+    /* i2c14 */
+    /* LEDs and PE Resets */
+    /* pca6416@0x20 */
+
+    /* bmc_fru_1 */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192);
+
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 14),
+                                      TYPE_PCA9548, 0x77);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "max34451", 0x59);
+
+    /* max31725 is compatible with tmp105 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x5c);
+
+    /* i2c15 */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 15), TYPE_PCA9546, 0x75);
+}
+
 static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 {
     /*
@@ -392,6 +497,25 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void quanta_gsz_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, QUANTA_GSZ_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    quanta_gsz_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void quanta_gbs_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -496,6 +620,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
 };
 
+static void gsz_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Quanta GSZ (Cortex-A9)";
+    mc->init = quanta_gsz_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
@@ -548,6 +684,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gsj"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gsj_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("quanta-gsz-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = gsz_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
-- 
2.47.0.rc0.187.ge670bccf7e-goog

