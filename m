Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp391311njb;
        Wed, 10 Jul 2024 07:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUM0WeYj3yn54SYnyHlckZR0KzBjc8/H8hWCVXLUdX4TcVRB9rTw7Ggh2JE8Tfx+ydypDo0E/uTaz4zML1ggeX0ddBKkTT6
X-Google-Smtp-Source: AGHT+IHx62n2MIs784wyMIYt0JGjnURBJMsv03xN0TZYA1mTLZTSSWnauCjZ0aZQ9tD7DZ/EAzoh
X-Received: by 2002:a05:6214:1cc1:b0:6b5:e74a:8ae0 with SMTP id 6a1803df08f44-6b61bce16b9mr66679016d6.26.1720621052981;
        Wed, 10 Jul 2024 07:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720621052; cv=none;
        d=google.com; s=arc-20160816;
        b=bMz5TOcV8dKwEX9P+mHzKDJOBnMCSYVv0CIgJKbKMHJHDwNNd04c74OQIe6bTrhW0j
         cngul36/00FdUL+9FU4e/ofqgvSwPafvyh/LD/POQdwFruwQIPJC3MwLpxpDEirKxm+b
         k9UzKDH9WxeJ+qk1el2sMcXmCf5TfGUk46xKS7BwGKnvHYvn/jzkY4eAyTPPYTHdiZWa
         6cHFxn8YUsxjpFYWblu4acY94aCmyb01DK9ytItuApN01QePyMK5j+4MsCD2irxAegQA
         1V1ll4PRS6JRlylzGfGwiDspbz1PfVT8yQ3BZfjW26RqfSzxUV3Wz9xMOaUVtorzMGtS
         9JNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xkDhVRq7nOrp337t4BirLj66Emh0tyYky1+9xyZk6N0=;
        fh=KPtqzwBg80WTJpmerqWLfep0vL4zXNtraCuf2dEM5zI=;
        b=pizCK+bhs80/xMoxn5BUD9lizufVbHI9peeKgCtzIfaFldbxuYX3gT0VxbP9QmXtiJ
         MI94TrCUqvK0mWoYB4n3kGy09GfrqeDRgSLj13AGmgQX5SAf+GjJ1qQfRLUrCOfsZOV/
         OzTKQ4cE74YtSR1jBzgeBk98lkMRT1V/yz9iryrn46dRSgz/LBFh5FRnMVMsVde1EzZE
         +vPUAKJviq/03akPGl0rdjncNasV+0MAVATBGsTqFwvZBV8boO8jUHKVAdAF3U/WntOb
         bDC7ROTGiJWpZ23gGyYSZaKnzLZhexe+kyGI8kCEKc6mIVrXce78/6D6PcfDKxbxNXLx
         fmAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBEglw/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61baf7b49si47721856d6.558.2024.07.10.07.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mBEglw/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY75-0004X0-Af; Wed, 10 Jul 2024 10:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6T-00010V-1V
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:15:37 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6J-0004CF-91
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:15:27 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eeb1051360so28616401fa.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620914; x=1721225714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkDhVRq7nOrp337t4BirLj66Emh0tyYky1+9xyZk6N0=;
 b=mBEglw/vxaYJTQyGjFtmt4wRkJb33G63aDCZfvJbMRmvZHQ3OBWQ/FMzNV8zpgDsk0
 rEws8b5OGmEOPs5K+15fq89DqSYZHr9B4VKAEd60tbuFs/dwrIuqUfwv8zTEm9EjLiur
 H5kh2Ld+KHMip2fDmSCtVVkNPC9ckpWwqsZ/GXUNA4IiNQw9EwE/+mlJggFEVfTgP6to
 w1W2ClnMN9hxecqEJewF3zu5IiJyoTo1YBAzI+qvdOZDzSez9LJ+1gZYR93DKvCU6+ZK
 1OrE1KwpEwPML/j4gOnZGihLUfLP96if31tw1x4hRP177OEY8iago/1LjH1CzysQ1Flc
 bAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620914; x=1721225714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkDhVRq7nOrp337t4BirLj66Emh0tyYky1+9xyZk6N0=;
 b=q8AGDn8j8ZAMoo8hX4p7RNabVm2xLzV2vKMxvuGEMQSkBWnix1kL5w2W5MsaWTlLBz
 0Geflw8t4diAU2CeoVYHTameMGZeRFVlWDzqPaMs3lAgZ8OyqSATXHvmfhQmPmYZyu9P
 qBHD/+K6+5ewu9WezYl1Ct1KK4c/MqbyG41OAFR0Wtudi0WEAx2UqmM50dO9MV1fjZNh
 YKYZKGyR47X3gTsMfcikBRrz3oEpnC/StN8X1aEl7FHCLmHzqcVaZKbli7Ov61wulFoQ
 DrWAtWJ5nTXYn/wVgw0uOvA551ym9wcUh47xxERJDXMULAfTF5UVUXRcIbWHFiKveZkJ
 ZRUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXauLKQRcM1nLgCzAuP0lA9kmazbf1FpCL4qlUgS8wXYwU+aJ8jS7ifvcvhBRcG62i9IgO+KSMv1araIHFOJoEv6NuA
X-Gm-Message-State: AOJu0YxDprhzLR9k/LSI7iV0Sx42+s3aZOcESQgSCEJ3EychVtD2zxNx
 agNF4+O87R32/X/de2z9EFH6ZptYhq4tCs7HVSmVCJlBgkBgaNL6upqtndqoOMk=
X-Received: by 2002:a05:651c:2129:b0:2ee:87ef:825a with SMTP id
 38308e7fff4ca-2eeb3198757mr41817341fa.53.1720620914561; 
 Wed, 10 Jul 2024 07:15:14 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42662315363sm163329185e9.26.2024.07.10.07.15.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:15:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v48 10/12] hw/sd/sdcard: Implement eMMC 'boot-mode'
Date: Wed, 10 Jul 2024 16:14:06 +0200
Message-ID: <20240710141408.69275-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: QaPpBMIn7zpS

Spec v4.3 chapter 7.2.2 "Boot operation":

  If the CMD line is held LOW for 74 clock cycles and more
  after power-up before the first command is issued, the
  slave recognizes that boot mode is being initiated and
  starts preparing boot data internally.

Track uptime since last reset, add the sd_uptime_ns() helper.

When the first command is received, check at least 74 clocks
are elapsed (during the identification phase, at a 10kHz rate)
then enable BOOT_MODE in the Ext_CSD register.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c         | 38 ++++++++++++++++++++++++++++++++++++++
 hw/sd/trace-events |  1 +
 2 files changed, 39 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 57a9eb91d0..c2ea942389 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -163,6 +163,8 @@ struct SDState {
      */
     bool expecting_acmd;
     uint32_t blk_written;
+    int64_t reset_time_ns;
+    uint32_t cmd_count;
 
     uint64_t data_start;
     uint32_t data_offset;
@@ -352,6 +354,11 @@ static uint8_t sd_crc7(const void *message, size_t width)
     return shift_reg;
 }
 
+static int64_t sd_uptime_ns(SDState *sd)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - sd->reset_time_ns;
+}
+
 /* Operation Conditions register */
 
 #define OCR_POWER_DELAY_NS      500000 /* 0.5ms */
@@ -479,6 +486,10 @@ static void emmc_set_cid(SDState *sd)
 #define CMULT_SHIFT     9        /* 512 times HWBLOCK_SIZE */
 #define WPGROUP_SIZE    (1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
 
+#define OD_FREQ_MIN_HZ   10000
+#define OD_FREQ_MAX_HZ  400000
+#define BOOT_MODE_DELAY_CYCLES_MIN 74
+
 static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
@@ -797,6 +808,8 @@ static void sd_reset(DeviceState *dev)
 
     sect = sd_addr_to_wpnum(size) + 1;
 
+    sd->reset_time_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    sd->cmd_count = 0;
     sd->state = sd_idle_state;
 
     /* card registers */
@@ -905,6 +918,18 @@ static const VMStateDescription emmc_extcsd_vmstate = {
     },
 };
 
+static const VMStateDescription sdmmc_uptime_cmdcnt_vmstate = {
+    .name = "sd-card/uptime-command_count-state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_needed_for_emmc,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT64(reset_time_ns, SDState),
+        VMSTATE_UINT32(cmd_count, SDState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int sd_vmstate_pre_load(void *opaque)
 {
     SDState *sd = opaque;
@@ -953,6 +978,7 @@ static const VMStateDescription sd_vmstate = {
     .subsections = (const VMStateDescription * const []) {
         &sd_ocr_vmstate,
         &emmc_extcsd_vmstate,
+        &sdmmc_uptime_cmdcnt_vmstate,
         NULL
     },
 };
@@ -1925,6 +1951,16 @@ static sd_rsp_type_t sd_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
         sd->state = sd_ready_state;
     }
 
+    if (sd_is_emmc(sd) && sd->cmd_count == 1) {
+        int64_t clk_cycles = sd_uptime_ns(sd) / OD_FREQ_MIN_HZ;
+
+        trace_sdcard_ext_csd_bootmode(sd_uptime_ns(sd), clk_cycles,
+                                      clk_cycles > BOOT_MODE_DELAY_CYCLES_MIN);
+        if (clk_cycles > BOOT_MODE_DELAY_CYCLES_MIN) {
+            sd->ext_csd[EXT_CSD_PART_CONFIG] |= (1 << 3);
+        }
+    }
+
     return sd_r3;
 }
 
@@ -2107,6 +2143,8 @@ int sd_do_command(SDState *sd, SDRequest *req,
         return 0;
     }
 
+    ++sd->cmd_count;
+
     if (sd->state == sd_inactive_state) {
         rtype = sd_illegal;
         goto send_response;
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 5dfe6be7b7..7d0de368aa 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -57,6 +57,7 @@ sdcard_write_block(uint64_t addr, uint32_t len) "addr 0x%" PRIx64 " size 0x%x"
 sdcard_write_data(const char *proto, const char *cmd_desc, uint8_t cmd, uint32_t offset, uint8_t value) "%s %20s/ CMD%02d ofs %"PRIu32" value 0x%02x"
 sdcard_read_data(const char *proto, const char *cmd_desc, uint8_t cmd, uint32_t offset, uint64_t size, uint32_t blklen) "%s %20s/ CMD%02d ofs %"PRIu32" size %"PRIu64" blklen %" PRIu32
 sdcard_set_voltage(uint16_t millivolts) "%u mV"
+sdcard_ext_csd_bootmode(int64_t uptime_ns, int64_t clk_cycles, unsigned enabled) "%"PRId64" ns, %"PRId64" cycles, boot mode: %u"
 
 # pxa2xx_mmci.c
 pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
-- 
2.41.0

